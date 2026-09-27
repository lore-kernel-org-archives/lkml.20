Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231992E5B02
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549453; cv=none; b=me7/HOONcmxeO8xrCLKLoPfW8AyqcyHQ3q7l8u4ikZ3GMBdYXoKGG8lH+oFa81MteTf0/ThXTzDKOY/z1uKI5eHPe5fHIx05/WeX83er+ePF4Ze6b7qNWssDuker+y0o4GJ+TusKAMBNNlnn5qYNqoLKeT1gFN7TMRnovDhhpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549453; c=relaxed/simple;
	bh=lSk0fx4Ga16xkbkGlof5x6gi08NX5roZCq1xAG1hFBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOStNz03twFYHpjJmOGwm900JZcVzUfyOQoA5oTcnJWyLbdbl+1eSKigMC4VllRxKc9kPJzWdhEZkw/JNl4c4xDF6RTscqs6KYTYoDzrKrI0bdNO3etCXzHGriWldBdbPlYdQwf3GlNLrcLbNTKzTBtjd/ArN7LYjH719VRUGWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=SW4bKTD9; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="SW4bKTD9"
Received: (wp-smtpd smtp.wp.pl 24064 invoked from network); 28 Sep 2026 00:50:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1790549448; bh=JEunWAHORE7QJB/neAIW01XaMMmd387JTP0GNMR9sns=;
          h=Subject:To:Cc:From;
          b=SW4bKTD99CIEBzOAOnbCdCbxnLD5oiN19v3D6iKcSp24mV0bwXxSx7X/F0SWsjB82
           Wr1YVt/6ztmLR9WI5jKeIX0c6o81L+OMFCs5M9iZ5LrCbs+S+0f3O3IILshw+N3F7g
           c/BN3T3+gKZPrrDV5Humvar+bNqYE7UNykB1wzbNIhbHU0jfmDJir5gOTLEXhzCAaY
           KcLKwep19qDWLvSReDnVSCJKcs/SOFJu81gxtLouNHVCjF9CzwwUV4xU0jVBsatGny
           hv1cJE4+LVxVumBDpjGLfLv5+ToX6ZPl+vMkoLqRJZN4wIAi0hXaOeqZHMUbcf/owd
           Rd2EKszugdfOA==
Received: from [192.168.3.224] (83.5.247.9.ipv4.supernova.orange.pl [83.5.247.9])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andre.przywara@arm.com>; 28 Sep 2026 00:50:48 +0200
Message-ID: <c643fc84-4f6d-4d69-8f22-4ca12a0fc125@wp.pl>
Date: Mon, 28 Sep 2026 00:50:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250818163520.1004528-1-olek2@wp.pl>
 <20250909012422.43b755a4@minigeek.lan>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250909012422.43b755a4@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 2d5fbca267295a9889e4413d24c1aeb8
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [8ROs]                               

Hi Andre,
I see that my previous reply didn't reach lkml

On 09/09/2025 02:24, Andre Przywara wrote:
> On Mon, 18 Aug 2025 18:35:13 +0200
> Aleksander Jan Bajkowski <olek2@wp.pl> wrote:
>
>> This patch adds support for Ethernet LEDs.
> So I tried this on my OPi-PC2, but I cannot influence the LEDs. I have
> CONFIG_LED_TRIGGER_PHY and CONFIG_LEDS_TRIGGER_NETDEV built in, and I
> see mdio_mux-0.2:01:amber:lan and mdio_mux-0.2:01:green:lan in
> /sys/class/leds, but anything I write into trigger does not seem to
> change the output: it always stays on the network functionality, I
> guess because it's still configured to the PHY hardware wired function?
>
> What am I missing?
>
>

You should also set up the name of the device that controls the activity:

Example:
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:green:lan# echo "eth0" > 
device_name
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:green:lan# echo "1" > link_10
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:green:lan# echo "1" > 
link_1000
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:amber:lan# echo "eth0" > 
device_name
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:amber:lan# echo "1" > rx
root@OpenWrt:/sys/class/leds/mdio_mux-0.2:01:amber:lan# echo "1" > tx


In the second iteration, I added the default-spate = “keep” property. By 
default,
the LEDs will be activated as before.

Regards,
Aleksander
