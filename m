Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0B390600
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730131; cv=none; b=UiYCnzzI/58zLBPcNf+L86ip/wwoVxRs98VnDIy0wnNFb1UVdgfz1aWAVXog0dDTnrFc1fKwBLjMnsMFUj6nqmj9mS3SQWdO9pNsZTb/cuFh2MqX3vKQvJmMi841B1IbF7EoU+OG7sPg/I5qa0w1xFovb7j5sTBGPslpDzuNU50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730131; c=relaxed/simple;
	bh=gKTlSyqYGa9oJGFDgtRnbCQv3mFMbEsDBXP0tOGtHTg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Z/kqe9rzzG+aQloWSx6DMS+VZgasNz8gA+l7tqAsCHPPgzAIkdUYYVmOgzppXmei9dcfDP4G34GkX1msDX4AKD/Gb7Z/03KzKYqEOy9pfaMFxDO7DzrKeQRO608EQGNlg0AM6yXk6/KoNpi26VT+gmCxk8CgyRBQoQPaafjnZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ETHCpfef; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=x9mUYB2D; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ETHCpfef";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="x9mUYB2D"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1DD227A009F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:48:49 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 11 Oct 2026 10:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791730125;
	 x=1791816525; bh=Axm0z0t9Vgbtkl8tyQP29sbUaRobPDCmblkBy/kM7qE=; b=
	ETHCpfefoTXBhbd3yMvINgcH/G/9PfwGVXzfUDRqRii/8DEexcC+3Ky8Y0l6vkYg
	QggUezBz9Gtt5fFgf6Jx4ze+QPbYG4ssJvZtEdB/4fy5DpuAIAXGmITrM5yx77u1
	Zoq3IfgswEYzMIPszRqPASgrnH4sYBSyEynr0odpWivB1ohfdmF2j8XjTnSEyui+
	YfVoxx8vgO/YQrIw0CMztpKslY+rDTETcMhBkO4pmhLrRUtD6ORMmkHRlUldj7Fs
	ZV7SrZPc2AtVE9yU4TiatFKpeemOOlYyAmBeM3QbreziujVRrUJxcOeuPZ02pEUJ
	X3EuvfXuyot+Ea3J4scWIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791730125; x=
	1791816525; bh=Axm0z0t9Vgbtkl8tyQP29sbUaRobPDCmblkBy/kM7qE=; b=x
	9mUYB2DFiOZdGDaD3V2M2QFlx2odui9k/Yhpv9B8SNEwPSiNOXjogDOoYZlZCg9K
	iBibOJTHP8teRui6Pz/G1XUGqgZbxBAioG/4f2Zg7VY/REoBKn3+sk9hPaSJpdcY
	YDJ9jrZID+FMw4ZQlbG9CugFgNFln99e5UKB2AXVwxHI6a17L6e9DIqlG8iuJSAS
	85yU5zJ64qJXy4L6XSLXsyvJ1renbeZh9tZio3BBj9UoRYbRYvSA9P//ckApmV4+
	SZ9TwDiv0A2tAJ0Fj5QHP3QZI1t8+m10AMHBWTrXUUmqgxu6l/w/qkj3mt6PAF8i
	yg73seal00gUWzFL+JNTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791730125; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:kJFNpW3LKR0yttYHl75vBpR4Q3O8sxF2vl9oVw0JfvNfqQd
	f6Dmhdwl81WcaBacz9mOlrnhwzgkORmrKrJeNmBlLq77n6O3Ur5I4N2rv0Rae4Vg
	t/DUELh+HZDnAmbk2emoU/tFq6gMQvCvULykvlrfBg9BE+mWQ4QyuECxkmMOQ4NX
	txcuM3ICjGPy+Nk7zzYSkgnR5t9ogkmLZRJlXIC982M4EkQrOR3GliKh0+kfz1z+
	BpWbCx4wPqbaosNOXJiBh8nbPGuHCgl7PhdBbT8c7mzWPhBfufubDMWB15FVtUcB
	c7FpDJuQgUhokiekGrDVmIIAvusmuxV7SggL1gg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Zmt5RHXIZklQWTY/vXNbYxeV+ENmVvZ3kSVV+iZ1wD4=:gKTlSyqYGa9oJGFDgtRnbCQv3mFMbEsDBXP0tOGtHTg=;
X-ME-Sender: <xms:yqHLaoXQa7Ow-npIXdF-5wc25Uwr8OFSSyPJ6YXpc9WA7Yygo8maOg>
    <xme:yqHLanYaaq4PexKn8hQaLNqzkqds-Upn18RgIYy3541wuyNMpEM1emHLpfvxiIHEJ
    vQLCTg6T7hYAgP32K9nJCysnftwePWdy3umouUimDjUPwI8g-LhKWaV>
X-ME-Proxy-Cause: dmFkZTFlvCzuizRCxOGSyJ7dExCHkaPBMfn19wBrO5Fu+RJgyuZWAXJOoOkxfnVSdoV+7f
    3RO846yTCg7R9FEo2kMonMz3w171iaKzhUsBBonWUjLdBkDYODVwgLg2DJWROvM3st/eut
    LjgYPmY7fUO4KjV/lFiUDyy5y6ySWxganQ0/mv3+v/I+Hrs0EFgj/z/45ifI3Cq4Iew5oP
    /eEMgNfAIKSGAMwrQxiDSCT4DuupHQlm52sz8m5Tfu3IyTagtggaS2GyGBs9Sw+mkYUuBo
    BjyxCwh08+ZeVyzCZcHi80ecrKAR3r3ADQvpMif/0MfxnZyGM60ce3ZwhcEvuVr3EEBDuD
    7hf4CaXC1jT+MvxJTdLKEUTY4QmG4r0+fzCKLwcmsbNZs43vU3AYw+yzln3aD9tEQ2CeQi
    PrKRQmJ/oJQbK1XuBdhgyC4hn8YG2kvC7OfNx9RpsDtnQXAiKIJVH7VJkRuzg9cLEYDbWg
    qow8C3pogXiB9a5UTwXsIhdFCIoC0VRY8X6ySsSNwhXOmEubSTQhLcxSG0kQq6owZABOfC
    HOjzdtDOg4wfa/HLFpDv4899q8HYXcoYKvdQi697NMBpvitqrbQS/ZhMAvGOFc1qwX8zvU
    JLldm/v1ydrXBfIL4HOkhv8YqQ4P8BoGDaKIJzrp6P8CO/UtZDM0qrLhG/Rw
X-ME-Proxy: <xmx:y6HLagsA1ptQJ4tp75WK1KjmNQAQljQ28qfdEEldavhBvQs99Q3Pkg>
    <xmx:y6HLauJU-8CL8DLBaZ3d4ZV2xbmp4jHVGtNLN-vurl5Hc4MSfaq3MA>
    <xmx:y6HLap8EU314MwOaBvAmnDV978cv_sA2WiRxj5Ajw5wVGt9HDVd7tg>
    <xmx:y6HLanwxYWndpDEhM0SoL357i2AbJ7itIlH4_wCMA2sy8lmRGp80ew>
    <xmx:zaHLasfPBjj3YQyAWkpwc2wbkpnYm-vhJFvnKi5GrzsCh3emZKAgDbkC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2B6FF32A008E; Sun, 11 Oct 2026 10:48:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-dXEK1mihoo
Date: Sun, 11 Oct 2026 16:48:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Message-Id: <2bebabca-9df1-4ccd-afdc-3a1740c05061@app.fastmail.com>
In-Reply-To: <20261011010223.2379347-1-ghahramani.navid@gmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
 <20261011010223.2379347-1-ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when
 requested
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Oct 11, 2026, at 03:02, Navid Ghahremani wrote:
>
> Thank you again for the suggestion to test arm,outer-sync-disable. I 
> have now completed extensive hardware tests on the physical ZTE ZXHN 
> H3600 across multiple bring-up orders and load scenarios, and 
> unfortunately disabling outer-sync alone is not sufficient to prevent 
> the interconnect deadlock.
>
> Here is what I tested:
> 1. Added arm,outer-sync-disable to the l2cc node in the device tree 
> (zx279128s.dtsi).
> 2. Rebuilt the kernel with CONFIG_CACHE_L2X0_IO_LOCK disabled and 
> completely removed my custom read lock from both cache-l2x0 and mt76.
> 3. Netbooted the initramfs uImage over TFTP into RAM via U-Boot (zero 
> flash modification).
>
> The kernel booted cleanly and confirmed the configuration:
> [    0.000000] L2C: disabling outer sync
> [    0.000000] L2C-310 cache controller enabled, 16 ways, 256 kB
>
> Both MT7915 cards enumerated over PCIe and initialized firmware. Here 
> are the observed results across the different test scenarios:

Thanks for the detailed testing!

> Given that this is a silicon crossbar flaw that requires software 
> serialization, what would you recommend as the cleanest, most 
> acceptable way to structure this for upstream? Would you prefer keeping 
> the serialization lock as an SoC-specific quirk in cache-l2x0, or is 
> there an alternative architectural mechanism you would suggest?

The best idea I have so far is to delay solving this problem and
just upstream the patches that are not impacted by it for the moment.
Even if you never upstream patches 2 and 3, that would still
get you much closer to something that works out of the box.

My hope would be that there is some errata workaround that you
can simply turn on with a chicken bit in the firmware, but if the
vendor BSP has the same approach as you tried here, that seems
a lot less likely.

You can also try to avoid the issue in a way that trades it for
overall performance, e.g. using only one CPU and turning off
the L2 coherency management in the CCU, or leaving SMP enabled
but turning off the L2 cache. Not sure if either approach would
work at all, and the performance cost may make this impractical.
At least it would give you something that works reliably
while you can still use a patched kernel for better performance.

One possible idea would be to use the helpers from
lib/logic_iomem.c to register a special MMIO range that takes
care of PCI MMIO regardless of the PCI device driver. This seems
like a cleaner approach, but I cannot guarantee that any patches
for this would find consensus.

      Arnd
