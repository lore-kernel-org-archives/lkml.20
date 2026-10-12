Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F04D2EE0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829933; cv=none; b=Zx00fT7zrWInLPVA9/btAHhS9uPlqOtgiHpE/+iRcF8p4JPNIvkMjuefknSPWQlPnQbQBJg1cukqknl1jnfiHbYQ08LTLiOmwkVwSZn61/5a9qwN0u6c9g8Pd4alyPAGM5qQLcDRRpacW9QCmDyxK/t57irp1adLx8L/mvVlb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829933; c=relaxed/simple;
	bh=H3ajQd7wm1bFogX14K0eYfOdNs6MQ8yHjBdXJ/cawUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PocpXowU5GRj8mu0VWisoIJdpLGq1GsA/bpLR4/JuwNlxe6FDPnWafhx7QJh1cITWywzEt4jAyU9/kwr4LKiO9PWqaw2A8u3uyUnH0Ma7q0WEPTag/5HxD92um4sHNBZDmNJWiQq2SylN73BhkCXMMQ1XZoBbQEKt5pMvrsL0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brct9Bei; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tyuuXAp3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brct9Bei";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tyuuXAp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791829931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
	b=brct9BeiRk6mcr6sDihRVM3Io4e3L/9GyBUVR9t/N+JbPeUDbC/I7vYpzZNwSQ9GGzn/Tq
	2gLK4harbynkynwsIRy4ORQO40zxK3lT9BtkWPjAoKDooRKn7X7PBfD1OqkD6qupcsan5L
	rHuDQg0HpU0bmKy4QZet0B25gd+zosA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-KgzPS-q8M7uBYHmRK1eS-w-1; Mon, 12 Oct 2026 18:32:07 +0000
X-MC-Unique: KgzPS-q8M7uBYHmRK1eS-w-1
X-Mimecast-MFC-AGG-ID: KgzPS-q8M7uBYHmRK1eS-w_1791829927
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e24d542d40so2805525e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791829927; x=1792434727; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
        b=tyuuXAp3++BO+OR/9lmPG20dkIDHAKpkHjqUmTGQjQ/yJ1utAfrq44gpJ+DnX6KciA
         9+8HQDHGsfZ9AsWxcyLhqIdhiWwzDHVOZ0f53eLtxd0ocOOO6rCNj3U1PEWshpNzuWS+
         Ltn3hctxizrJFWqclESWkWpIIwk6B+qliut67IJb0FESyRGiUiVzgQDiZYpFgFM6YV81
         mg6WGFWoFVLpA3R4psbcgmvcQAckIaDZDjFSZseE05eemY14XkC2EoF4k/x3LUoU5iaj
         vYqNGfcINJnziCXcwsllXxcFUkfCCpVORsQ/HBwA5ncQkgqnvMun42d1h9IcaEA/uPJw
         +vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829927; x=1792434727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
        b=n3VhyCL9rY459tWLRITIQbHmQhTLsfPW0IWdoKOBUAklkkCpXQUFZ+bXGtDz3GAlXx
         O17Q7mu616hMc+863tcyHwqvEoV20TlIukMCoCJjEs70yWbhE3X+96UdFUvykSbaKxSD
         sztHBGkSB1YdESlJ3Y5/L+4sgWuFqEB7AbAGe3jOWjzTMYHeCph4T1DGzNWnweDqKW58
         5X8VuL5GCUVCejb98xYZ1rlUDNZSHd6ymTFnSptqFYhdCqqX8Gwbb+4dbWldwesxXWcw
         8RswZidbTmth3Uw5ebA2tWMS0YuIqifeH4MvKwFPnSAdeV85O1fW4pj5a5Um63Zfy9f1
         3rjQ==
X-Forwarded-Encrypted: i=1; AKwUvByp8IiRAHREpuh4PE43YDt60e9iZv5EaGBMUKsSdupNvxMZYrSGmGBKAYlho0XcLC3uV1KYdZpp65Hblz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYImQzlX6uMkWZIgLO180iYX0iOiZ9HQHvfMkfd5h4yK/Oa2tksM
	YrAE/QMds/FUtYZg3189Oc/JYYyUWGzFTeDM1L9VzH7cwAZ1StC6OvBEUJ32+5eQ2rVoldl5XCN
	Q+Xt0toxhMYcVFN8skuZx2mDjIttxVr2N/sZkSyrJhTksSm51Bst3tEyt28KzVj/sTg==
X-Gm-Gg: AYBFou2Ezo61ex0zqpIBw4VK6Eil/RfaAkjcCFxyGgyamNxkkOdp7mgt9yfjr0DQy2F
	NXV80Jl+1o2H381JZq58Fc/DoYMog/80cFFbHrB+XQYUIELnZ8G1r2PqYqwAJ8wt9HEu3NfHa+1
	bwt/rM1ZuOeX7GYNoiXXycnb1OOEobweNE76rB7VQCxOXQR4cqpvEKrD96y5eKYnp685p7djiky
	itDPG688KNC3NhuByXV4CAXSJXBTsSMl65VLGuZxgXWtLMDYfDdEYDanvd6VNki5YIdBdKt0RVZ
	D9ohy/5C3LRV6LRLP13GetEJtWgu2L/j253SV/WHL1pi/5FH7XYxyQ==
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548292e0c.21.1791829927034;
        Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548281e0c.21.1791829926536;
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e92f300f42sm5764908e0c.0.2026.10.12.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:32:04 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Message-ID: <20261012183204.c845fc69@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>

Hi,

On Sat, Oct 10, 2026 at 03:08:35AM +0800, Shengyu Qu wrote:
> Hi,
> 
> I don't think doing like this is correct.. We have a dedicated M.2 Ekey
> binding and should use that:
> 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> 
> Best regards,
> Shengyu

To my understanding, the pwrseq-pcie-m2 driver that uses this binding
currently only supports systems that use UART for Bluetooth, and is
needed for them because UART is a non-discoverable bus. Quoting the
cover letter of the series that introduced this binding:

"This series adds support for connectors that expose PCIe interface for
WiFi and UART interface for BT. Other interfaces are left for future
improvements." [1]

K3 CoM260 Dev Kit ships with its E-key slot populated with an RTL8852BE
module, which uses PCIe for WiFi and USB2 for BT. I verified that my
patch series does make the rfkill command be able to disconnect and
reconnect the WiFi and BT devices with this module. I also tested this
patch set with an Intel AX210.

In addition to PCIe and USB2, this board also has its M.2 E-key slot
connected to sdio, uart6, and i2s3, but none of those are currently
enabled in this dts and the RTL8852BE module does not use them.

Several other existing device trees seem to use rfkill-gpio nodes to
control W_DISABLE pins on M.2 E-key slots. Looking at rk3588 boards for
example: OrangePi 5 Plus, ArmSoM W3, and Rock 5B all do so in the
current tree.

Unlike those, the rfkill nodes in my patch aren't actually necessary for
usable WiFi and BT on this board. The shutdown-gpios here are
GPIO_ACTIVE_LOW and this merely allows using rfkill to block both radios
via the W_DISABLE pins, so I'm not opposed to dropping this patch if
anyone believes it should be dropped.

[1] https://lore.kernel.org/lkml/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/

> 
> 在 2026/9/29 07:18, Jennifer Berringer 写道:
> > K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
> > the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
> > WLAN and Bluetooth.
> > 
> > Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> > ---
> >   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > index 01e286cb05797..cd878340e5add 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > @@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >   		regulator-max-microvolt = <3300000>;
> >   		regulator-always-on;
> >   	};
> > +
> > +	rfkill-pcie-wlan {
> > +		compatible = "rfkill-gpio";
> > +		label = "rfkill-pcie-wlan";
> > +		radio-type = "wlan";
> > +		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	rfkill-usb-bt {
> > +		compatible = "rfkill-gpio";
> > +		label = "rfkill-usb-bt";
> > +		radio-type = "bluetooth";
> > +		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
> > +	};
> >   };
> >   &combophy {
> 

