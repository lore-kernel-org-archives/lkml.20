Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863999;
	b=F6eGaoA+0UnRvDmRMBJeXSLbtsgL8tMYbkA73pKmOQSreYxkYFE70yqEXWM4k68a+drP
	 yJE2bZAit9hNAQgpAw1OGGro2pCXpP2SLXhfhDmdGG3IAlHSrOSktEY6d/pVZwKkP9aOa
	 9C7GSogruLmZypmnRnN5Ng4FnPG9fc9k5lij/sbFNhY/tRRvyMNxaExZeH3IzXJr5RKV2
	 Vjk6w0nLj56IQV2Uj5VeUDCNyPB4oG6WEW76qvcnEG+Ap4WTn4NBsbqa/i4iJzXI4Z6h4
	 1zSMFzuZh1kMWS3os6EBht+qs22Z7g46OcQjs5cck8JDV2yAZRJI4EgwgqEvO8F9+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863999;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=1eDiVlZ70ezrJ/IxeEHH4R+DqWl/53xVPO8ez/D05kg=;
	b=1ACRThN6PVdGiTCZVBtAS20RK0VORpz9qnM7MS55I2GErQdv1fMqBRvhdU0vHt8z5MxC
	 P3ReXPlk/bIeSAz8YAlgt57XKhgW+74MRBVhSg1elA7swjVyP6uI69sviPSG4GRnxrJOV
	 MDv8+QbQiBdQIO6y4Wxv6/YmErNH8BydBjtVJLx5MRV/2rDe3AMQ+hr8WQeGbY6peEJz8
	 nbsVaG6Ln+UuabMcTy91Uy10H02c9effbgjWh0DkuPFyIW79EPyi6ohnyO+J3nUgvKFMw
	 Fw80DMuGL7jGtJL55zK3hBacuUaqsgh9yFJJ7aaZyh5z4E+mjsyenP0QX34DVgh40gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XbuxHFCx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tCXVP1SD;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900EB606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XbuxHFCx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tCXVP1SD
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 59690140007E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:19:52 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 16:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794863991;
	 x=1794950391; bh=1eDiVlZ70ezrJ/IxeEHH4R+DqWl/53xVPO8ez/D05kg=; b=
	XbuxHFCxEhvfga+tn7RC12tIOsc1RTpAzK1nbSD+BUktYc6savyTC/I1RpD5C0xy
	t8hzEV+AZ/N+cT5iDuxn+/oI4sjRs8U53tE09jS41slv5/wyvFgEryHfTK0KN9LE
	J2AyrwruUHkPq/jHkle6hlTA1BE72eGUyFhe67NbDPsrL8EyE9vHdrtE2ugTulCu
	zj2UvjyZZI3x4SOgK8Nr6L7oxppWPYoCoV5LHAHlLdTNoD3vWNQLGQPgTyODABNI
	NDt5erjh8+614DJBg1BmDXpmS4Fy9bPPxoL3N2JDCsf2EaFWRLdN+4DUYnVSofUE
	uD0SE2wt3TIbqliu8lM10w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794863991; x=
	1794950391; bh=1eDiVlZ70ezrJ/IxeEHH4R+DqWl/53xVPO8ez/D05kg=; b=t
	CXVP1SDcoN1hF4caCzSpkClekG9KKleXv84d82AfOYORuSAYaa5jfMUOpbozJ1K6
	91O3/dZDAy46PtK5RWj973kOUFx1quv+RBjKL0cl5Hh7sHkm8V/T/WKqxVyr1hA+
	7CtgeCxTxHIuqkOfGhm0Dsq5wq8pdKcSk/s8DAILAsmIN2qqK+TW4E1EG0VYJOUq
	WF+28Cx/2ZM7MuM5KWc7BhefpvCI7TW210z+FiYe6TrO00fw2U8umZe13PItQ9AW
	oQr8D97AsPazCUB4++CEtIbeTDb/iO1uV7j2lrYwcxgK+I4MfC1kKwCUK+7YHEkA
	j+4qSD+KanXoSdJny1jQg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794863991; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:fagGEMcms78f3VMLFsf42tDf0jQjDOsw9XUiwRIKBLpWFwT
	Ju4jyDh41+xfc2LTe86FVmVlvj39QyI2UOCNxewKjUGDWpmCBaGdQ5swrOWOpfN4
	JAa9npc1WWyonwL0N2vV8BZq5FjefPjLHWmEhxDrEoD4ynYX7qc+ufov5qu7cWcj
	PzDHGXEUMkYiKTtFQS4gpFj/481GaDkGJodH/ffWbcu5V0yEffM9DqxNQQ6lKims
	TB/otJgKjWmOUeB1jhIm4Z+rDldcLbTmpF69NrKJ93WUQJOdMdMMcVLdeY6E/Smu
	WlaG52mei2QlX6+G8tZrVG+juDHl+GJxA5tW/gg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:I56aw7NAAEWxnBdMg8EfZdSKcG1mUQQTPDXxZLeA0AI=:fQjzsk9q/dKvw7rVCN4vxz17Sv4UPA/e7h6kPkKazLM=;
X-ME-Sender: <xms:dXP7aqgtZg06iDzxJmbacZdxRYXNkVIuOBxYxONuRvN3YBTXTEg-zw>
    <xme:dXP7al009SMb_KwIDs3n-687GYsUl7Ollw0OamU62NuewC4MmceeBEm7FAzoO1Dj3
    k7MQDmZNUBWPfqBVQIaZGaW-6GpanzQl6M2_O1J1Jus11Y2Ff4OH_hQ>
X-ME-Proxy-Cause: dmFkZTFTc/ITTJLW9TujsXMlV1iHeOcjWSJNO5pO5q472n23DHGTEOXdDO8swpLAZk5TLe
    EHCU4+HLIgK4s2YHkEf69ep28t4iZRjy/00TmdTDpKaNx4hg4HaK+1JCWXJ0SkOHFpwe1w
    HzrDl+7CXuZb9BIsY7P9PDIdi3gbVPF2MrMiFrJt7p4wx1zhU20yKpv7oCf4KiYff5V792
    //FfmLJlUB0k+YtuYPqlSC8H91Q1mB4iMsRAQoM3o3cGVNL9iW057dxq1cY4PBfUgoG1oi
    L2FNBXd+X+6FeOAKXgdHgysjMDoEG4PHnbZn2O7Izo5euC0cC6jf7Iel3XXFu2mGEL8snp
    pcweeX5oBGCJ7m/UQ3SdEwUlQfKLqf1xQdxtO43WR6Qf0dqQaI/DsKKx457ucEUu2cJVkp
    BgYk70lEqLIUybksUQGa6UCQUtdg95LtLXlS3rZfU77Vg94uJzZigFScZzUg3u5H5z8W3v
    aPMDOJ2l/eCcIC00V70glos5mrVU4ROi9pMPIJnD/RxUJm/zEBpHw9PZIPXSOaBM7Z209m
    9QEEF6aEUmahWKRbTgvUIR8QYzMsFm9D9WCm4Wp8y9VkZdDJLc1O394HUC/hX4jkpme/0D
    hVRRjakrjucsdOJD61hTvBj+dY+6DVtIBwKRheeN1tHIWaKzxRhz+vrmDwGg
X-ME-Proxy: <xmx:dnP7asFTWsncbnnoi1ApNeALTqp4k2uUAPOYALHE3M-vI9xvaumL6w>
    <xmx:dnP7aleQMoHyN6iCteIL5-5uE1hbsrd3peNGevfKM7luIZU34HopDQ>
    <xmx:dnP7auGoPGCxJITqTX-X97xr3xswURkh-557USD5jUbcNIDrxtxNsA>
    <xmx:dnP7amXOKKor6FIai6JxbLh30EWzEwO3YlLUp71RImUeJ4_EImnB1Q>
    <xmx:d3P7ajzy8j0Fho-Q_6XgjqWSb7RcuQlDav1NGVWp4Wr9wzl96FgEAN8e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4223632A0099; Mon, 16 Nov 2026 16:19:49 -0500 (EST)
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
X-ThreadId: A5BwhhEKV0Ys
Date: Mon, 16 Nov 2026 22:19:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>
Message-Id: <eb397d2e-a6c7-4838-8240-b3f8854e6109@app.fastmail.com>
In-Reply-To: <avsfuW1MUYp0jI_I@sirena.org.uk>
References: <avsfuW1MUYp0jI_I@sirena.org.uk>
Subject: Re: Missing signoff in the asm-generic tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2026, at 16:22, Mark Brown wrote:
> Commit
>
>   5dfaff16e8b90 ("selftests: vDSO: Fix header search list for 
> vgetrandom-chacha.S")
>
> is missing a Signed-off-by from its committer

Fixed now, thanks for letting me know.

     Arnd
