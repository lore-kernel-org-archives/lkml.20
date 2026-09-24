Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C6737EFE2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269222; cv=none; b=daFnfwCd06Me/rrHB5QmUxZ0W/l9pA0RR71R4yCHzGAOaQPYMqVLWb+20tR1zzHyxfpVXQ4JkzANyX+8Ez83ZtHzGD6YIPUJU80xL8eUk5MVXIrOSmUtPi3TCaSnDGd68Eh+XgtjdKL1t9QpHEEmRcpYD6+JT8xK5sUE4nAzPzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269222; c=relaxed/simple;
	bh=EiFAP1OZLQ6t/n6P3ebl7h7beg+6xP1eK2sTvfHoLFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bugo6K2/IfgJDjRAFWbsLBbA0LUUTIcubSJ5VyquRoRvVZIHRmWCYx2FuYVRUdH577TtKR/s8EgTT13JKWOAx9TSU3RBjIpl0NTKV1i/UlUaM/eDW4jOgDreBPBzMFuBc6Ne51GYZeNawVTgqa3aAs/RhA+HAm+bvFroYuCbxG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BUzNj49u; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BUzNj49u"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 847F2C211F2;
	Thu, 24 Sep 2026 17:01:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5C4060738;
	Thu, 24 Sep 2026 17:00:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBD3310328253;
	Thu, 24 Sep 2026 19:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790269210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JdA69aMb2gXgOJuAm3klAA2htUXJ2SFBE/05Yps+PkI=;
	b=BUzNj49uALFRrh+wUXwPBd+xXadOvLuhaJxQzws2Qz0SZBEkULNKoSlvHbnmsliUZ8TbY/
	4YxlbJ0P3VWY2xhsoJ4v+f65ffYWYHuihjrKol1GWrmuRBNeQKO6UQTSQHO55S6Ovs0t82
	c4iqFdRVxAc+SeYIqd6i2SPBmSKi+/cLl+R0BoZIqWQaXwK/ni1i1ywNQl+Ij3YkdAGDQ2
	74n30RzR+7JQm6a/vzjNhazWcsk+M4js/VZ6jj8QRicav8nvZYYxQh/Px3mu0LhVGW8DOm
	m+4gYaFu2hQ7Ai55GUvW5yp4r6xqRjYetuSrP5RLmWtFwvWEjoLQBi+x6HZgoQ==
Message-ID: <1bd67ddc-4910-4f7f-a2fc-21d9c58cf655@bootlin.com>
Date: Thu, 24 Sep 2026 19:00:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, alexander.sverdlin@siemens.com,
 jan.kiszka@siemens.com, ayush@beagleboard.org, robertcnelson@gmail.com,
 upstream@lists.phytec.de, francesco.dolcini@toradex.com,
 leonardo.costa@toradex.com, matthias.schiffer@ew.tq-group.com,
 stefano.r@variscite.com, eblanc@baylibre.com, msp@baylibre.com,
 miquel.raynal@bootlin.com, mwalle@kernel.org
References: <20260910134409.1713610-1-nm@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260910134409.1713610-1-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Nishanth,

On 9/10/26 3:44 PM, Nishanth Menon wrote:
> Now that all relevant drivers have are ready, convert the
> TISCI drivers to modules. This impacts all K3 platforms for
> boot, recommendation (based on empirical evidence) is to use
> deferred_probe_timeout=60 in kernel command line to allow for driver
> probes to complete successfully based on the initrd used.
> 
It's maybe a bit late, but I did test your patch (linux next-20260923)
on J7200. Indeed with default deferred_probe_timeout value I got some
deferred probe.

[   16.869217] platform 2830000.serial: deferred probe pending: (reason
unknown)
[   16.869241] platform 24c0000.timer: deferred probe pending: (reason
unknown)

Using deferred_probe_timeout=60 fixes sometimes deferred probe for
24c0000.timer, but never not for 2830000.serial.

[   68.582069] platform 2830000.serial: deferred probe pending: (reason
unknown)
[   68.582094] platform 24c0000.timer: deferred probe pending: (reason
unknown)
[   68.582128] ti_sci_pm_domains
44083000.system-controller:power-controller: sync_state() pending due to
24c0000.timer
[   68.582144] ti_sci_pm_domains
44083000.system-controller:power-controller: sync_state() pending due to
2830000.serial

But switching all TISCI drivers to 'y' fixed them. Looks like an
ordering issue.

I also did test suspend-to-ram, it works as expected. Fun fact, doing a
suspend-to-ram allows to probe these 2 missing devices during resume. I
guess it confirms a timing/ordering issue during the boot. At the end of
the resume, no device anymore in /sys/kernel/debug/devices_deferred.

[  124.053571] Restarting tasks: Starting
[  124.053861] Restarting tasks: Done
[  124.053907] random: crng reseeded on system resumption
[  124.053970] PM: suspend exit
[  124.058833] 2830000.serial: ttyS0 MMIO:0x0000000002830000 (irq = 700,
base_baud = 3000000) is a 8250

Best Regards,
Thomas
