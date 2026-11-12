Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496148;
	b=YWUxLOZmGUUthelUK5KAi8Hg8t+XFRcIbpriyx0koPwk05nYtjlQclhVm9jW97PQCnUV
	 Q5aw4OSpU5lknP+/KyH0E2px//SiaUNm3GJssJQLL5TsrFEisXQ0PKaaSCVe7pt7mXhn/
	 zrzoT7tfcGV9napR/RZAHbESa7c1YBYEBGc/KTlHdYO7/XQ02H2U6sQtqNsJ5DS5lYgoi
	 67750Zz37gBF83+B+voP6GTRbJCqm/9dn0QB6GJ6OebH+ZuDB0uuQ2pPeudNRWOCOhcB9
	 LQaN1nZWnBd4/GFSiBYgr76S106rtVimAZZGjDyejWIXIbgwT1AdbTGFCVSEDbPbn6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496148;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=sGr120yhIBdaSdARYe9jHupZpoylhh+YQmi4ICs4aNQ=;
	b=ZUlUJxihcWui8TmYyaxIQAPRvXraVsFk0WLMccoRCZ5EcBIAy9OX8ZpBuVqMHU0Hwbru
	 HrD/SDux8tHjsIreWSjBLyKRELWpdB2Bf+wQdfsoezyb/rkCpnB4Y0EYLGjgYRs2JXqnB
	 iXm/C5tcov2u8UICyWAuVsdDw4Sz3tpaVX+pFP9VU3jPiLaL9V2cBASbd+i47/L3ju7wp
	 4aL+HfgM2a6M+An13xLCnmdwelcXsFfA0tMpLg0Ip1IR0SqQf6OjrvFRrq0I2EnEOp+0B
	 QnaUmoi2CQNwdFNLGx5uVkSh9QA+LlW2BV2/hCOxFq99vixZR5WUYW/s2Rlur5KwrMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HV54rgju;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JdOJUseH;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63A606A8AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C63A606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HV54rgju;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JdOJUseH
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 4BCECEC0596
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:07 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 10:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794496141;
	 x=1794582541; bh=sGr120yhIBdaSdARYe9jHupZpoylhh+YQmi4ICs4aNQ=; b=
	HV54rgju8oopQ8mrCiZACFhXZUaGpUVUQftb8kZ80IVHjBGH6at1SQmdMkZU0pgn
	+yZ42wZ+Xaw9imltPwKrgmW3NRRbfyUGxS6fYyW8BtNTddNmCEehJypTF8Jkd52P
	jK/499UeBxEWUyqhuHEa0o7grlznny3JbJa0mnoaVqpR0gVInHb2bugzAbvV1H9V
	B3lmWHpO9idj5aVCreNDVUo+X/NQJvR7/4357aBx5ivMwMCHi2w+IeunQCIRlawQ
	rdXSVwFcJ1X1WV6c9/QbaFDrFm63i7jqDe2m5iw+F3GqxYB6CEo6yVYxpzvR1Qkz
	v/U+vixcFxqO8oPlhoF9RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794496141; x=
	1794582541; bh=sGr120yhIBdaSdARYe9jHupZpoylhh+YQmi4ICs4aNQ=; b=J
	dOJUseH2roRfTOnk6kxsl/Kcy1QawGq7gsdKrpB5r4tTcQRk7sxqLrauE7SUvtBC
	1hq+16OI7WTEa9mirPeuROi6mUrvSRHr+PYo/duFLIz00Y2bnX30neOep6BBkKKD
	KC9tCylFVJP0KeAsonFesDkEoUNmGSD7Og0vlB691YocVqWKuU5NHU9EEYLDeyua
	dgPX1HFU/zUu3AA2pjKnoVXV+XT602HXumbSxxAYE0i+ADcGkxKJxUbbYYHbsTKx
	Q+OIhwT6GZxBrpvXX8dcY0jqO1cRafkAtNJ2OghfJiXnzw7yhyWZVvUlQMEPRoeR
	HraVzbgSehwG665Uxxtqw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794496141; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:irPQuRtXmrYwXhWW6UyYkZd60bR6D3jkO+9waEu39wmbpkU
	XOwnwMuLJNj4D14gxBwwaD5DsSlcIA3Vs/AGfHC+ZKmXf0R3od+3A6w25zpqjkeN
	xdeCuQOQa683vwhuukAFwBX7SgN43o+MOsQsKq/XN1xW2tGEGIrBj7mZLi8UFrv6
	K14OQ/6RGgJozCUVZZ31O4Txd8PaayEgsxBHtSbGQcYW3+zgXh7hn2UTgOdA+zXF
	CfbqC13Yp/EwGyBEReDp5Z5sgEyIC6dQAzkgLoduqhyiNHE1JinuiMxJhMD6awzz
	vZ73/IpB4jZBtgRaDDJ4DR+CRnpDu3pMq+nJwBw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wxbtSMbEorYH0lZI3pdea9/rpvvHzsSRIfi3r/1IPFE=:GBzSCyfBPfq54wbrZD9CYEBaiyqPb2ywhRWDhbfcUoo=;
X-ME-Sender: <xms:idb1an9vAppKmkZIo5c3WS4RP5FQUSjk5B8C1MS_i4hIugqDCLen6Q>
    <xme:idb1auhm2IlCizSgHGDn4KduduQi9xANONo4t_EhrvRsWU8giXmawSSI8lZpvFPGf
    iZ2s4YVuYTVJt831WtSk4JiBdDH78Cqltq0gGaniyhJnuzBueaGHzg2>
X-ME-Proxy-Cause: dmFkZTE7YpGM5r+CZhs7LsKN1SVk++5MSLG27RSXn6MgJjGV3wg+pkV04g1c/VOwRMjCiI
    Bg+oxUOLNImdpVOXDw6KQOuqD9lwjXzsoiE7i5KRtKeDwglSDqNuEyG7H2wBLB1GrlBKa+
    8OUaTSrFJSb1rr8NIpUE0Myf85czDQ04ldSU4IfA6LSGll4/sa/OOdbcxbBmCujjcNGoO3
    8ZBWeq05m2ejO4Kt/tH3DgDXNdutu8JBlzJWfI9c3KOOYkM+7fwvm+saKsII+M9Fn8Ylhb
    3mRYSMa521FXMQicJ9KoFIfuzFT3GeY4e0h7je/rfhx2oJCLwbVI7+9GFqNesO1hEuthUE
    C6WDVh5IpQnNnxqZWAn9CtJmVjMQ7x8OVFMmeenEHaemxE/CY5MpoUby795fMvRsAZoLrC
    rn7oMc7JE8OtuPTBjquyKicRWueITPz4hFFJCFr3cInAMp2ozwHG87AHAz2Ikc/UVGUOzd
    wd2x2Qent+9TjVCOQHAgWobugpkg52KVLvDeYTajwO4RLNt4xhz4v22gDIHkei425lfg4l
    wVadgEwixDdYsqbyC81rolVPZuRbtacJUJ3ofhNmPW8Qgg6K14w9j1GKW9Jjrhrys7OU77
    e1Vo0ujUJealjTDj8vOj9b4z5zcILaM7UOm0iTmYghh9Q1mpE3Y6uizLqBdQ
X-ME-Proxy: <xmx:i9b1ajgmY3ALz2X6FE7Krrs80qHaE0sCg6y8-Yp3v9mZI2TDPLstmQ>
    <xmx:i9b1agcJ2O06osTU8eKOQS6e3OY-ajguoyN_EGNnwR2CZzZ9H8MjYQ>
    <xmx:i9b1ai2SbyIhE1_fX2_2RSliHLUSB7fuEp2wVWowftEUO10SXoKRNQ>
    <xmx:i9b1asp64wSKhIKMaHHD8yBJitxl6_5WqV9SOrsdt60r8ug8aVg5yA>
    <xmx:jdb1ajxcaAc11ne6H5QATMQosJXds2NP5hLNByN8M2Vy0YdVtOVxZdF2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8563C32A009C; Thu, 12 Nov 2026 10:08:57 -0500 (EST)
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
X-ThreadId: AXRzvbN5yUxV
Date: Thu, 12 Nov 2026 16:08:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <301115f6-3f1e-4e83-bc01-0ba49dec496a@app.fastmail.com>
In-Reply-To: <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-9-8d1275885d9c@igalia.com>
 <0cfb4dbf-f3e2-4ceb-ab89-0453ae59793d@app.fastmail.com>
 <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
Subject: Re: [PATCH v9 09/15] syscalls: Add an option for offsetting the common table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026, at 15:37, Andr=C3=A9 Almeida wrote:
> Em 12/11/2026 11:07, Arnd Bergmann escreveu:
>> On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> So one option does a string concat, the other option really does a sum=20
> operation. If I had used --offset 110, the result would be
>
> #define __NR_file_setattr (110 + 469)
> #define __NR_listns (110 + 470)
> #define __NR_rseq_slice_yield (110 + 471)

I think for consistency, that would have been fine here, possibly
using another macro.

      Arnd
