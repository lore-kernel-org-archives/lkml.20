Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5722345CCE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222914; cv=none; b=tjRVmJVi4tDRR+G/tXoXaAMYj5Hi54xH/GEgu9uHhQX4+EGJuO9/dk2/aKYuGwbrea8xIJq4ZOEWshPEx+Wt8Up+zHIebVIQ1zw4I6ZqnTnc0Hq7Opom19s7mg/8eixlqti+v/mHLASjNk+sZ2oC4c9EPMQgDlXKNqFs9t+0a8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222914; c=relaxed/simple;
	bh=KgZKD+EluK0sfJ94RDAUxxixgPsC7zCuBwgjrLJz1FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAfyS4WoRWtDNSpbEPDBZf5EHZMj9XNSV6V1s1q8A7UuNIQFUNHQJKq8eC4GgNK+M/zNPIm8nB/GFWHZommoBh3aClFnwlRoBruNalYUzXanJ200gOQKgjuhJQxxdMBO89Ts4tDnK4j+4Sr/G/tUKudwyvSno7ZnKW/PJ1Wncds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyVxz7G8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyVxz7G8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d942c7cc2fso17992495ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222911; x=1789827711; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZekEX9u4dkM+nKRZ96Vifo/IB+ikfrYJWegpPxurD8=;
        b=XyVxz7G8frBAkuLTDZhqKlA8o7034o+uk6nUvm9Z+i9h4XyNTaQ+kRyeLhrlQZdJiM
         G8JlIAdETtZnTeAydqpTJB5ljemwSviMgeoqEeDa9Cj6ddVmh9GvnaDOP67UY4qfbiSm
         2dZSnnyAVK4MJDJltFA1m5OoEvdQtCVHBkl4GdHgYhkRvlhxLV0xuB8o9/96jICdf4d6
         jr1V3/Kx/xf8d7BlrPo3+j4ax8k3FmoAzPHtboFvxFegpjcp3QJ2nSGwQ1lSp71kQJS3
         ECblMT1VKNWM0bFpyn1YIAVnlC010XFT8kU7YRcCuOc1IN9kVvhHc0qUKFi0EHcIyp04
         IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222911; x=1789827711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZekEX9u4dkM+nKRZ96Vifo/IB+ikfrYJWegpPxurD8=;
        b=dD1OoZjBh4J29OwRZ3tzoUn1sN2WdXOYbYq6QQjLNIwZHtXZ54eKbcodWfy1BBnGc0
         zI7dhNPDds1olfunuBeUAR2pbuBh6CP9nL+LdVclpI6UIcPSRTaWlH/K4doabtIHuZu7
         w7uU2MbaD+UZWW1jb+EH9lvbeGV5oaNeMz+/NZoz1XMBh4GEahGoJpoaw6wZ/ccwUY+t
         44Exl55L0B01RiKVkXjL5gmeBAwXi5roN1/0mzX37ywYRvDANqNCvDYsqABMlfEuj3wU
         tXJzCEQGuSZ/l+Ht+42JVOE8Af+id7NldMnesJZKX3F1pc0BJugPaUKLgilsu2Bf29qX
         HHhw==
X-Forwarded-Encrypted: i=1; AKwUvBy70hU4DoGEEdVsz9u/Tmz44Dbo/PE3JTJAt8o+INGGkWk4FE9kOzFu+kdNwfPMu3uJCX3h6Ddwx+5SZEU=@vger.kernel.org
X-Gm-Message-State: AFuF++kUt0J7BjhSgI3PrWFrwuPKmFv+rjr/3GYwlWf1QJCI8rzE+MNc
	mGYKq7BUgcDp3skcGbqc7D4cQ6Gu2L3ebZQPt7mupOC6zf82U8zEb3Eh
X-Gm-Gg: AYBFou0k5BM+Q2rpss04nnzpXPr/WyL3BvAYwS1TvejKAz6szICDKWIJUdL/6iSWRQ8
	3ftFrKCvXja3RZKsVyaqLfU0F8E+m5nVXQ8Ih5KmhT1bgj5HvLHdmEw5+EktCwvk5GDkx+zJ1RX
	g8sfYVsT+lNSyq5CFEMFXRSykk24x9dBF9YwGZ2mmu+hhCMhhUvDZqRoWEOz3qhT8OlYXXWw2PO
	Qi9H+jRAZspEgrmLIa7sGFqm/UuNJidBrzKa0x+Ot5WJ3LM3JMoTIxCZnpx46be7yLvqE07Am9Q
	hhPcxyOG7GbaCbJa/Moja/QOzaC9dhj2lutXXtBxZ76mGoVpK0QqqV39fefK1/C44nMCVIW0/zh
	emsHNLHjdHdTYcvCTxL3mn2OOoaRFB7m+As54A/RYPrgBBfI6X3zsW13yD33Vq+GVqioEK6t8Iw
	VZPUx3ThREOZPJ1zWQ7EgA9aRN2Y9PEt6TuqpicPDY78kNJlavn9+1bv3Vvr9Po/OROQM0MT3ry
	H7TFd4TtA+lKg==
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr89839555ad.19.1789222911290;
        Sat, 12 Sep 2026 07:21:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faed5sm17625205ad.10.2026.09.12.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:21:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:21:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Message-ID: <c8ba0294-79bc-4b81-98b2-94577c1869b2@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:39PM +0100, Nuno Sá wrote:
> The MAX20826 IC and similar provide a high-density, flexible and scalable
> dual-loop solution for high current cores for AI applications. These are
> dual loop solutions multiphase voltage regulators. Between Rails A and B,
> MAX20855B and MAX20908 supports up to 8 phases total configurable from
> 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> 
> The output voltage of each rail is controlled either through PMBus or
> through the high-speed processor voltage-control interface (Intel SVID,
> AMD SVI3, Nvidia PWMVID or AVSBus, depending on the device). Which one is
> in use is part of the configuration the device powers up with and is read
> back from it, hence adi,rail-a-high-speed and adi,rail-b-high-speed only
> tell whether the high-speed interface or PMBus controls the output voltage
> of the respective rail.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
