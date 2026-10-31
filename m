Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436383;
	b=DhavEXEcBkQFGdJDRw6tmpoomArXRiMphXkC+8lX6fDPz48640FKJeEYc0cOQOnJRC3H
	 7VisNzGW/Y33ENuJYQR/DlMA1hI1zgcyLpVneFZwBQLoQH4XOz3TAYRbR33cnHO9SsSs4
	 vXBV1zC06keRag8rK3Dbh9MV0NaTwbJVuvTr5l0bYAl5YqHAQ5X4Hk+rGMyeAN8lZcE4L
	 4bNByfUjgQu2yo3ZOt2z7re4oaSA3y+aLCx+lUgfBgrw7WWr5CHuAMB532YFFUJJXS32Y
	 iEdn49DrkpMnIlCYwPDExwxscYrgxC9WpZZvwgqnK8DQuwfzUt+4ain26CJgHzjmeag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436383;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=msGgE+yF4ldZ/hVSYFnQ0w1ommr92ISaYkckmm0P1Lo=;
	b=1ayu0F9aduW0PahZsSMyOTSw+bjWGKPnnXSIm5ehsLMOfXeJEKi5/VLSHAUqch7tFGGe
	 8Q0RvUtkOUmjBnYWJdluUkYx1VFUJYw9jn05y41NRKpIFfHbmuN8D2u4WjQBzA+5pw09E
	 7srF0oWkMJFBjIp61joYB2SwNGrQrXuJ7rCBnANq5IsMiz9ktdtBlUPNEtiru2MA4dN+h
	 lHxO0Zhnn5jTyO19QFsOxk8un8QwAw8Ohh+9eWgnudZy5tjcDBLIwb/swfRlSbxoxmqnV
	 0hjQ9IJao0TQ40buEJIvGv7w2ivtlLSJkxiER8NcLE8NSEmBdQiaemuV5/JGQz2+J4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iOjBj1M5;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Tg5JJ1LZ;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4142606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4142606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iOjBj1M5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Tg5JJ1LZ
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 2E3741D00099
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:46:22 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 31 Oct 2026 04:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793436368;
	 x=1793522768; bh=msGgE+yF4ldZ/hVSYFnQ0w1ommr92ISaYkckmm0P1Lo=; b=
	iOjBj1M56eoItO6tNRWpq2cxUbDavNE8q8cgYQB8Z49EaYXHr6M9cTTdtCFyBzTZ
	tCNcwY7tUDBxv0sLxjO8rD7nR6YXRN3BRx9XUQkB5q5x9sXkCkxUdr1IJf5UMLcR
	7rq3QAUXwHp/BKsugxXKubFctv9lpDTB8xFPllNF8PipfPJQPNmjurAcQp2g4ejL
	X/TcQ6SVMEnA5O2FuVZ6d/hN/S9TRYCURWWe3qVE51pErSBA+jA1PdmjuwY9i/5T
	PaNBDB0Fpz4AJr2JUWMo0RvVSfwpHSRmFBuYzMLjvk/cExDu7uYNak8f+zExlU1M
	R1VKBw2xoc7hN5denXaovg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793436368; x=
	1793522768; bh=msGgE+yF4ldZ/hVSYFnQ0w1ommr92ISaYkckmm0P1Lo=; b=T
	g5JJ1LZTqOr8WLikhg8u5M4GuboYRlxoHDqnR4QG+zo2qnYZkh0VO7eUlN6ONrLm
	Jm2FM8LfTXCqbw57UHhKVgcVhUj5VJmGaA0dKC2gA398dH6qz1iZGkvBAZaTRHLn
	Iv12ng0ROVS8CTyrns1iX5G4SOPPR3tBq0VJT92Snba5erex6WUM8Mi1KVfnKGjN
	gtfVZq1Sr4ewuox7TGsvDN+6MCO/AMfRObXA5yJQs8JInOk4+/OUErW3FOKQQ2Da
	/0nzoS0Ln9M7FstcNb4BsZ2ihpYmaonQsRqxewaexopQFJFQp51LfD9ead7flsV1
	qYfw2yyTz+kogXCAtmjuA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793436368; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:SWsPZPh4MtCRsammBDFuCv9bstqHLTNzfbykHIA9BU6d8A9
	Vn9Xs643TSZt/ryYWoF2HZ0B1SZSKMyEhH+2r5DlJGBMDkEs+XJFDN5iJprMadLn
	YZRDKkI+1+PZuZivvtxjJCJBTcYWiTFUaO5vcF6jlO/ZoSX4Co7MlhTQzai+L2qQ
	rerbgO5EgnvDSv5WQuNVIY6HchzC36ZXV2zp0+JFg1sleifGdhSi/y9HDhG+PJ0m
	mOoi9bXkb/dOJhsFrNGsImZYWWBf72PP7S5OV+9yyt6Cn8NtGhW9wyERisT1iijl
	ajDXPPCgy/xN0j745GQQSO6/3sHTnVa3DDGBs3g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DBCrIjIkVPy9E7TbpmIDmzZrpDEjPavd4lx9kW7Prm8=:+rGYpdDfWx7RnLSKI4uxQpJm3+zNhvevO3bKngOM/Y4=;
X-ME-Sender: <xms:yqrlamhADgRXWsgMZcJ4Y-RLw8kZzAmKaFqslTYZ2vH76HGnCkrgfg>
    <xme:yqrlah2wXfPeSYUK0Cr8IpNXwIH8fmTEGFZ79feGD4APuyusVHzzMZRZ6sAb_Dr2J
    UEA_Qn2WeornjlHq1w3mWLC3BCp3unILXDzHG3b6nH5jUzJMl_GokX3>
X-ME-Proxy-Cause: dmFkZTE5t6BGJhdkGVNsXvVFxG1PcWpcpaMhViOBoS29Z4IFtbWTY5VslSFz/ieBRekhxo
    8wE4Rgao449UxofVC9dweH4g0Im1LFnNKfP2sUCQBPMznfpFmE5IYIhsHxHZrSWuhcxPjj
    pFGWB+EiTp7IgKsYCQnEKT27KjFC5JUGCrq90pwpSk7L98jXiXTk3iQml2J58lotNEd8gk
    E+reYaX61yAaBKmrs9EjDyeuxBtr3baeQ99ms++NR/C20r8cY9vFIGZsI8NFPEpOHnU7ID
    JbMacxnBrf5AClPeqJAsllU/qrRvXGtIzSIotIk6zgZLqaZesMWPn3562bGEWrPEN0QPav
    q2zlKF1LO8u/1VfYLjkzXVPNxpGg8ZdoHVwjOs0j1cqD1a5U0H8L4e7i39D9ev8uzaFcF6
    ZySz0D90KOc+Kgj8OZvr3mzmRhVLBtvITEsiXM8VdcdlfkJ2XFrTint9fbXg721C8r/mG+
    N7soSFDGhlUntFCl7zCPF3C4rgGRxk3nCAqVkxrF45o4KtrHrqaiv5X/5/k3H8QtRwt53L
    YbL1lpnolpfqE78xStkmXVblwFabvKaZzFcBpwNoHauXyNj/hEr+zd1y9QJnfX7yg9fNt/
    9/kSKCJCTcH9zgKaMcuX+y4oCQKBh10y9hX4O+RIJCv1XGdZ29EWldvw7mfA
X-ME-Proxy: <xmx:zarlasia4nTnHGA1Uoq7Fhc46-NVfVxCW-0TsLMswAsmRJ3r56iqmw>
    <xmx:zarlap6KPH5HrHfekntMhXpGMKYngs2nIF2zligOZDFZ1irTW9A_4A>
    <xmx:zarlahoKJUoYhxylNVHM6OU_amnGKVZrr3JPvAZ71CgWQmRGzKaboQ>
    <xmx:zarlavV4c8EyBAN3hieIRNj0o1hlqPkqd72qTJMHJ53A8RzxHKFmZg>
    <xmx:0Krlanumh2_K8AaRftPevYqxuaW1fUH9KS3HAjRN5X0ZU5e8ZXinJ0MA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 39A3632A0097; Sat, 31 Oct 2026 04:46:02 -0400 (EDT)
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
X-ThreadId: A4AbHx5UfGss
Date: Sat, 31 Oct 2026 09:45:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marek Vasut" <marex@nabladev.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Mateusz Nowicki" <mateusz.nowicki@posteo.net>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Thomas BOURGOIN" <thomas.bourgoin@st.com>
Cc: "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Lionel DEBIEVE" <lionel.debieve@foss.st.com>,
 "Amelie DELAUNAY" <amelie.delaunay@foss.st.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Fabrice GASNIER" <fabrice.gasnier@foss.st.com>,
 "Stefano Babic" <sbabic@nabladev.com>,
 "Etienne Carriere" <etienne.carriere@foss.st.com>
Message-Id: <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
In-Reply-To: <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 31, 2026, at 06:59, Marek Vasut wrote:
> On 9/28/26 10:45 AM, Alexandre TORGUE wrote:
>> On 9/7/26 11:14, Mateusz Nowicki wrote:

> At this point, with Linux 6.18 the kernel is trying to trigger the WDT 
> using SMC ID 0xb200005a , which on my machine works (older OP-TEE OS). 
> When I boot linux-next , it is using ID 0xbc000000 and my system reboots 
> after 32 seconds. (not even mainline Linux versions are consistent here 
> now, sigh)
>
> I actually found this behavior the other way around -- while forward 
> porting a system to the new OP-TEE OS 4.8.0 port, which I installed, 
> then booted Linux 6.18.y, machine started rebooting (SMC ID mismatch, 
> new OP-TEE expects 0xbc000000 and linux-stable sends 0xb200005a), so I 
> booted recovery, and ... recovery is also Linux 6.18.y, so I could not 
> recover the machine that way anymore.
>
> Currently, I added [1] to OP-TEE OS as a mitigation of this ABI break, 
> but I don't think everyone can still update their bootloader stack in 
> this way. And with this patch in place (and inconsistency between Linux 
> stable 6.18.y and upcoming 7.4.y) the ABI break will cause some serious 
> mess.
>
> How shall we deal with this ?

I think for the kernel it's pretty clear, we have to revert it
to avoid the regression on old firmware, at least for boards
that have ever shipped with that version. I count eight boards
for stm32mp2 in upstream Linux, do we know how many of them
are affected by the ABI break?

Newer boards can override this if they always supported the
new ABI.

For the firmware change, I can see multiple ways forward, depending
on what the original reason for the change was:

- (obviously) revert to accepting both values forever on boards
  that ever had the old ABI in the past.

- For boards that can have either firmware, use separate dtb
  files that match whatever the firmware is. This only makes
  sense if the firmware is fundamentally incompatible for
  reasons other than this constant. I think we did this for
  firmware with and without op-tee.

- Add a workaround in u-boot to patch the dtb at boot time to
  match whatever op-tee version is being used. This would be
  the cleanest but requires extra work.

     Arnd
