Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586611;
	b=DTtMzj3d6Vc/sBpRZkjPDwVwvd99ROgTTfgG8zlMz1zFHfG4Uz5l+haB8Q32hxv2ZgGy
	 KZsc3eCgRsNL+D6XZtYzcLYJA6FR1GX/BkW/hzsvGFxIJH7S3ncsSrDskCYpqwANkRUVx
	 TULkA/oNDjsJ/HL+T77nf8cmazFQcGunWS9BsDsYUxPoo+ESVWTasoSJrPNyHs2U9pbeP
	 liIVo6px4PgFCkiPbEawdHR6Uqb7tZP1HiYxtSQgUsA0KNM8dsdIr47WBGFSzLLs7drE4
	 u+yo4H7k2WN3AlG9AR55zCeY0K7t7FOWJ0c2uey1nX9yS3pE7aXdRrg6QAk0ulCL10A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586611;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=H30vDZBdOJDenpq5EIpvqS/4MkBubKh2+TBdAXZszqI=;
	b=q0YL47GLD4gjQ7NEXOcg+FUBMqfUQbT6fG85B5FqBw3FcaFM5pA/t9qGgjNxt48yO+T+
	 5kVu0o/oN5Ad0yViQynKSWOTNXO/ac4j1QS8gy5QR7AJYMDcAhgeMnxQKgHeVi7ng92z6
	 ul2FjuQwZ1TptEkANHE90f7zx8urmA0K4AmM0pmIutiDFHeqpWoNxKBhOeT/6PvHKmbBR
	 0atPiM3647Q4xgxZ9/qlirSh5l6csCATKp3vg/hSM9HbNeT3DOoKKaQ4e9SZCYI+iOzjp
	 5ZrJnoRz82nSVctKXmZ8YITGEmrDzmNgyWFHYHI1ZRaNeFwatNk2SDXELBl+YvaMiUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=afeB76iU;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uFCc6bR0;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C4606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917C4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=afeB76iU;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uFCc6bR0
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 46A8AEC000C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:16:49 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 11:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794586607;
	 x=1794673007; bh=H30vDZBdOJDenpq5EIpvqS/4MkBubKh2+TBdAXZszqI=; b=
	afeB76iUzdE5nJdHDpFjJHP7ez7gXDP40TdlN25xmulIKCuqIqRb0oIGRA6MRhmU
	z2xqinH7F/SNNs9+2Vs36XmFwuzDhm0UH2+pRhepwQqKId57nuFCfQXq+bBtW4UN
	VYzLaJSLH+JmsGjQjxoAYFKVPsOlSfAQIcaLdFC2AufiH1xlBejGmlw6bi1XW/Yk
	bG82uLkfqSK3Z+y67YWGnw67+DGBMDHrBGMlyO5LDdUCnsnbaE8CD5w7Hss4hgw+
	W8H4JyhdDtUC3cDf4NmhEjA9vWgwfwBMhIOyL0QJHf36qheNBLVrxfylw621/exE
	RpFLKzjC+PmjhXEMRB6C5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794586607; x=
	1794673007; bh=H30vDZBdOJDenpq5EIpvqS/4MkBubKh2+TBdAXZszqI=; b=u
	FCc6bR0qdoiI64jwEIOhXfMJOYkO13t9i0rjCIRbmFY9MYFr5YGZ1yXSmiFkjpAr
	Og8UJ+9Ou1ERYcSdQDenl/7Fu7F+KrzKLDzsbahxAdNsbnF17+NnTtaKnx+L8TSB
	wG6y8AMxgm9E9FhHTkM1U/Gkufj4IKHnVr35lgRoqiQrBb07mQyDi/tztBLorGDQ
	TE1kpmojnkfUe5miaWNpJURPPNYRoWMNmVPQi4xO4aNXAhnsbEQiGr53gum9iOTK
	fF87PU9IxeYYsdSeZJxqrSpSsxdxpnrD4EJcCgQbfAN++izQ8SnD63C5yg1TxqLy
	ILKm7BRbpYPMcySGU2DDw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794586607; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:cC/cbm0ObqinyudD1aaAOAhHDFgrYT/qaAQiNsis8eBXi9G
	lVpVB3SGw4ttxP0N7eWAyGDfk8GwFUipxthmxMc5byCcgL2XYXXEHF+NkKeVJACa
	/o2EGy9uVUJ1m/2uzA7omw+U5FC/4vWaEwRgv+P1vv9uYMHll/PQXfc5xtBO+mdz
	S9nyiCVLDhisf0Zmv6575q0Tl0Q/WUMePRXjJXmBqhgsTxB2SYzBHqWO2sI4S01y
	V00No78K/9AQxiav3QU7MEJhyaJLG48mGI/S9ub2yXiTeLWCr9IukOuLYB5as0qh
	icvv8dyXnf7wOBjXBKiZ/ttxJQdWe3zbOEWDkuw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pOuX7BGdERjLJ23f5qoTD3RgdrfKmtQdr+vs5OXJ2Vw=:Uw4fpfbi+OexC/1YaP2Nl7p+xzhBQwuX0+ZwZWN3Xj0=;
X-ME-Sender: <xms:7Tf3ap2rrfsUYGUzwmczU5LOiXo-m8sOiCk5pZs6sIk7PJvrTg8V3Q>
    <xme:7Tf3aq7za2eLZdt1tup9lNrJJ_OJwFdvvvdaCuIpq3w3EFuf5pN0NY8bi6ynjCKg7
    szrJyaDr492gsk1n8NIdO3vArlpXwadR9CuTk7LtL92AW4rCZ0p96g>
X-ME-Proxy-Cause: dmFkZTFmQ3mOPR95qqIsM6rQ2XtjwUbXXV34TXoXn4KTjXy/4V9g8khdg4tDAwKQIYvpte
    ygWKkpY8L50GipDZa1o5qyYMPQE69b9lUfAUu7EXzsdGNmZNcJtdTrdatTXGGshC1ShMW1
    LgCMhdx9Nk1n8QEcSWbw6oKxMJUBz9itammYbSNULFoRK560w+ZIErNUrXEh7vmM7hQF9B
    HWunAr0DU+emkhAmOtcOua9g2tZVoDCgfj58C3e64/DQ2PcFEhKkBdM15ZMc3b148SA79N
    MozL/m4yQkmbFZmCGtY7jBXfj5zPCftgk+LfcHXGEwFatZbTLjCi+cUBIrzm51+uqpcuiE
    fHbtchis7gPNurtLUTG7Iz6llj4q8GkCSdw9oE53AMW8mhwyJuSEPV3WA/Z/zVKpzTpPUg
    rFra64KFahIL24sabSsae8l7+feZBHylRPdPwWjh2ZWz4wUCcEZ9PA3yff3m+qBHEfeiHR
    +NsGH5+i5jHtJTveVwQxHCga3IRNOPILYO8JNXnH3KD+vs4+Nk8WYp+gaYc6iMX/PpYPqp
    SEiUb/Lxk6TLsyl2iz4IXsF1rLX7mUWMnZ5i3vN1LG71tqgtR88Lv9AGQSHlOR4UKYxRP2
    gDly8TkyBiPAcxmrs1Fag4JvHJvwsbBwxJjkBZlf7Nl7Qveh2r7iBkQzK4lw
X-ME-Proxy: <xmx:7jf3ai9KVI8WlSuRwZIm9yVi64HilOmDDhZ0zBYcKQN1O8-hozfEew>
    <xmx:7jf3auIddDUXZhPvcg9CfKrf5BC_BRLFx1Nfe4cVqBTf_Gx_UsjZDw>
    <xmx:7jf3arjYjCWUg1wSugNADrfVqX8n6BOi3MUnzxrjBKHnnlMILHsn3A>
    <xmx:7jf3au58evwA-twLVoEAr74c1aoYhOeT59DLYq_NKh4uisdqAFUENg>
    <xmx:7zf3amFe4HXdcIn11CHjuChe5RgMg-fsft2AeNYYBP_L8Y-IhM1TQIHj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3E95732A009C; Fri, 13 Nov 2026 11:16:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AOb5ClfA_nYF
Date: Fri, 13 Nov 2026 17:16:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Huth" <thuth@redhat.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <c96b327e-959a-4363-bb39-f9e313c92b9b@app.fastmail.com>
In-Reply-To: <cdd71b25-9149-476b-b31f-c29b3b2896b7@redhat.com>
References: <avcnFxad0xS5KrZs@sirena.org.uk>
 <cdd71b25-9149-476b-b31f-c29b3b2896b7@redhat.com>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 13, 2026, at 16:45, Thomas Huth wrote:
__signed__ char __s8'
>> /usr/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
1
>> 
>> Caused by commit
>> 
>>     625b37748a148 (treewide: Stop defining __ASSEMBLY__ for assembler files)
>> 
>> I have used the tree from next-20261112 instead.

>
> the fix is:
>
>   https://lore.kernel.org/lkml/20261030174323.370687-1-thuth@redhat.com/
>
> ... Arnd, could you pick it up into your tree, please?

Sorry about that, I had already applied it locally but forgot to push
out the updated branch. Pushed now.

There was another report for the 0day build bot about the same error
on powerpc, but not enough information for me to reproduce, so it's
possible that we need another fix like this.

     Arnd
