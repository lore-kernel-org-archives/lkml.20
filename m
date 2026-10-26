Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975171;
	b=wCK1pOhJepBqx4OLVI/DBO/0V/rPrftFyQEPv44cFTqoOUTX7hkdPRaLtlI+LhVJgruh
	 EfX5g5hIXqpNaWdhhyFYSVY7aK4k3jJ/r0IZEGD9c4JQHKKvjG/oaa6xo/aXxNo0tfaVI
	 PYfLZESDr0s4kEj1y9UcU5WlVQb/tlqGdNZzKkdbllMmjE2Ad/NP5J7BGfM4amP5EYG3W
	 I5saznHTZ7lE2eT2wzWJ4PHQ03u9p/r8crVDidRO5OHfheuEHlwaMOzijUZT58UBkDMCs
	 04dyvkZqgDTd4YyBXprGII+sjiSNi7JAomSFp/LKcoFRf6xfupXM3aOt0sVOvhTgc8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
	b=kEI079e6ltWpSKAqGOlafb+BHGiFyrOn/JPSsVqoCEQ5mnlrJHirOQymjt3JmZ0ySe9m
	 cLpFgNcZ48kzyG6paJM2er3u5/etOmsEM8culPVkYb8jzrpk+2t8CG9O3RPGVJDBFM+hL
	 VVXvycsxRe9jisYZYdTne0hEHNAGl5PhNgapRPiXnAmCCQEdGI+Xa6g9OG5L9Vzznwvxm
	 w0cYvSIEk7bqkXFWB7wDMF8Ov3QaiD10PrU6oN+aPh9MLx6LswHkKVlP2qC7MfhGhPYH+
	 ViE8XICzf3C7ISeCTVJXejU7XqaCJu6Xocgp8twxq62rK6lqAVlj/UFMera3e8zAhhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B149606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B149606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso92762a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975170; x=1793579970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=aev6FLvqhWFM+boOuyY03GGCoU/Ug5rjw0gLbtxXmNUylCWl3wfkL0WbSaldF+nyfU
         dfvFllTQm0hL30ZePD2Ddt7E+oAVnPt7EGStphncddpuBymNNzzifiJ/WLUb8DrTIRgG
         ZXVC/L8JOm4bcf1k4qgbqW4CYmDzr+xkq++Ken+oidKtaNs5J/htPXy/l06AQ1RNQ7Hr
         xPrXeywuSwCRiP7EIwWcIIf7GN7gxO/pwvyd6dEOpAn14aIv5TlzkyZOg6AZSo4E5TwF
         3J4DdskYcOlJo7zmRe60MwRo6qiNpgTbJkU1gkhiWxDHzAd4pEqSUHY0mFMbK9fzjCrE
         hEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975170; x=1793579970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=Ck+AqScWEy4NBC3N+uym5skXdf8sG08+NtXmiUcKK8+3VvQ9Chfpf90axCNiF08tSA
         Ihvhj6IdIKE9i55uncMqEh3q7O+G5fRxUp/o3mSzc3zyDrFxGTy+AGQL5SL6r/q4fdLL
         KFBzvYEXSvuLB/jEzcRJhN7KgAn5C/zWII27ke1IoMBQGPGqki6iqMyM5m/JKQ9GlA9l
         5jdsO2cJgHvVO/EdcOn9wN7xuvwERJceV74cGeNdlj4nt/JFI/SuDA+BRA8OE1zwB2AO
         QmkXFdjAZhiTwMUdGL5mOdhz4hb0q77N6qynNUk09yaDU5X6apr3qRdyXXGjeRCI0cN7
         8mVg==
X-Forwarded-Encrypted: i=1; AKwUvBxy17RVahoivgneWUshkk17V7N1N7mTo+CWmxLP/9xJbXsi7LETYPg4j99JsG92aDM8XaTDXHYNreX02cE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGmIEfcrUXS8oXBNTBgxu8Wh9BMUVCAHWHtZPh9wpC360QwemW
	5eB/LGSwBrmymDBnwR6U2HbD6cnLeIo4RfP+RorhX3ocIqX8zXg0JMMB
X-Gm-Gg: AYBFou0DB6g1+YKk/7/bIqBMd2toJhR+xQIobMk2gxODb3HM71I7C1QvaRGje/woybi
	OY0UYLaOBuJ3t0WH/79PyhlgK/vtCEZsW5YJlzU7V9s2JDN27AkPoJFFzWGBBbrTc0WIXw7rZvl
	iqjR8Pmdf1ImeXPpTE4IEHLsEoWu4ylSf4Y4SVwyThYDJcs+DHOJh4jDU/0qnARNThP0mPWwjv4
	o2qFiG225h7iBaLuOTqX2jM/cAebMK9SVWc/2lcsPrO/bKeoaRCrtM1dv8iTWAX0SWZyspfguzl
	XyM1vDrrVb7gR5CAP7LHhfqwgvcr57EgnEwaJwhRHei8G4PyQHwb5fAvEX6VA+mKjT1X0+tlTIa
	MkGhZzj4N5qA3GMtKNtf6xGW/I22Se0liCCt5JHEaFYElKgPbtbz1tbP7QKwtutPWz461Jws2PP
	P8G6jM6i2FXb2eDL1CoPGWWixpbN9OzpYlWr9ZnIi5UUYfIjAUM7hKEPctfjXUV94aK1sIXIa0Q
	dvho3S6dSOhE/eumCuUIbmFQLxyP+T/fyHrZ7Ohbbk2yRLFyDRK40nuWilxETFbjLof+Q==
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4014353a91.34.1792975170550;
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm6135134a91.7.2026.10.25.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:39:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Message-ID: <87895a38-c819-4193-96ac-69be7f548e8c@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:08PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
> telemetry for input voltage, output voltage and temperature, plus the
> matching status registers. The FS1525 also reports output current and
> has an over-temperature warning limit. The FS1412 has neither:
> READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
> "KDT" from MFR_ID, which the driver checks before binding, and are
> told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).
> 
> VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
> (exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
> voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
> command is a 120% over-voltage limit on the FS1412. The PMBus core
> converts them now that it supports relative VOUT encoding.
> 
> On the FS1412, OT_WARN_LIMIT answers although it is not in the command
> table, but the part reports OT_WARNING at room temperature, so the
> driver hides the register from the core and only the OT_FAULT_LIMIT
> based attributes are provided.
> 
> When the output is set with an external divider, the FS1412 reports
> READ_VOUT at the feedback pin, so in2_input and its limits all scale
> with the divider in user space. The FS1525 reports READ_VOUT as the
> output voltage and compares it against its warning and under-voltage
> limits as they are, relative to VOUT_COMMAND. Its over-voltage fault
> is an analog comparison at the feedback pin, which would read below
> in2_input on such boards, so the driver hides VOUT_OV_FAULT_LIMIT on
> the FS1525.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
