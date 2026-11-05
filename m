Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909545;
	b=gHd1/Ba15QwDO2p/Vxyr6Xzsmohqpeamx086UhijAg5iThRhh0KlOSuODVUHGiXcN9sS
	 0a/pAsIpyofGvsUCXU+gO0hn7LhNmgzBFgOya7PyozBpBmM2H3hPTn2Vy5gw96puRE+l8
	 w0YdkiESpgR3LzaAMIa3ZsuomgPSsNG1VMPQAdFpcmXN+LQgo/sSrvKfyALnv+cQj3h7Z
	 Z0AlfhcGTOTRzglb4dxzomkZqB1Gf6MnkolXy5G0IfNqzmoBa3HLFyOG2fQVTW4Lfsx3F
	 GCX8HuUN9e5G2xFic0aa8x4+c1m3KeG1jJVNS3PMIg18pLHtXRzusSMln1ikKXeQiSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
	b=VLePjVQItGg3+js6qNpuHaNMEwe8nMBaYqdXoS+TqX5vgUBuH1Yoql5T0rc2SUklUfHQ
	 P6+6wmLi10b1BQtbF0G6I2s8R3QC+2fwKBhEAoKdGL7T/RWaUh21BHZa2yZnGmpwKlxdj
	 88jvwrukq9jtWXjEvj4K5YcSH64IawRuK3G4ekCcNCDHrKlxzbj6fSpQ0p3uX4WVyqjQ+
	 snPr2C7YCE7Rgal4Tkl2EtEj8Uim7mq9XfFUwveZZVcv2+ISOUrl+f3GA6muo1iS2w50N
	 TUXuQG1+ThabbtmU3wD58YFiKUPHBEn4SUocVHkgnvZ17yLEoDupPLrej7Js+jd/eSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJW1RlPT;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD6606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AD6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJW1RlPT
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso272387f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909544; x=1794514344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=WJW1RlPT4nBYc85BjmKGFu2S3pNJc9h7p7KxVzEu5ni8QwEhD6AZYZE1PHvNpvssVy
         C5+q+IbtF7LYPXEPEBRaZkzdujhWyQ0fUe4f5Xz/c5Vqe9MDfRDZsDQt8IHtK49XKXLI
         ae8sWtCDBYWI/5gseIUrC/+ZUjLbhQdgHuNQefnHAPOH+81+q7amXVCwCXPYDNrtW2sc
         n9nLehpHgJ9SuJU8R6QuJDwXGiC8NpgU21mQc3O/SLnA6J1YXqXkQEA2Og9BpDp3KDq+
         xEbiyGKqj+IBXKZBJU/daPFdn9kSiL/PN4Gn9LkJCkB4ihpud59kUVf35uGxaQaScdSC
         pbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909544; x=1794514344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=0MNdXSNnjBeG+QI1LWHtL+ItCnEKgwwob1V35rUJxBP8aAyavObjkjN/m6bz91sqQj
         Iqq+cj4zcS7DPKoF6sBcoTFb6k8+rOk4Y460m8lHYdN1a0WsFzML63YFnBE/hBf9vAvV
         xf9PYu9gfiaJJEMRuxwNsEXcQeQcd2q3shzldkrL7pDWeaGnB31FmzbNz2tnbluBTJlj
         08M5wuPcKyFyXWJVKyKb9KMSYneylx8YgahYCmUVtKz1Y+JeZJ+roz9lCCAPxJh4nqjj
         WlUVLz2EvZdOLtEJTq+proVi45ijVu9Ek6K1Bxmu7KlWnmIR81uTR0xQNgcZ4AC1SV+T
         340A==
X-Forwarded-Encrypted: i=1; AKwUvBzqsKROitrpIkUFX1Y/GNToa2ju4DB5AXURWTTnWpJ2a1su+mLRaWI4aIO4+ifEfJLZpvWbCsoamRRkGCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ypMctZShKNSaGCUewmfH1OTEG0nevPgyXdVlj2uuT/Si9pq6l
	tvBG8uNNSh64O23JP8kjjUoefrSL3iMlGgWv1aGDXhYAbC8Psd+n32CH
X-Gm-Gg: AYBFou2CPtlu50YOecaAW5Oa2rMphnITf+1ybfGFbusYaSluWcowr2b82aHXKDKR9/s
	BhADSLsb1hhigKfw0IoXXhKmtH3uaOQp78f0D5pwxT25OBoiNPFN9zkG/aRCOGSSrA9REsBkaco
	i3l4x42tt0wsCLq0/LMEw0N1pimX6PiRE0hWYIiYBhkbj80jtCicnfRnSaN/nGXa1dDxI3M9gm0
	gUpzYswir/76MFe5NP+CagS8rgn0yg/Qc6IR03RPGb0FbtbvaF9EGQz5It0uDz/31vmwKsjVfMv
	ulDTUgH/nPOFWP295Dd7V1VL1ZXuoy/ITOIMMt15u6FaZ+MQfdAZy81E3mCpQyHFKBKWndXGS28
	RGyZKEAhv4yjsAqceeF50QIgu5hx+Cgp0c+BeoQxIc6p9vp/85Ppc1o8v4uzVgJOzvZLgao30am
	kTockj2HC4rSLGWc6NOkNT9Jd1Fm+wES6XHvkIqbWWcvnj/pXpYq2FbilgcFcR5T1R9nUCTarO0
	pTIPilg4cx94eAoNYcAWI0n4Kw4o1kp0jMLClb4A3cDnA0OP9TTfO6TYXxUoJCJF2kSs4Hz6rkY
	Ms0bFp7qixR+vF1/qCVOHje50Bp6tXgr6xR6wwPq9uz6XzteFxqQT58=
X-Received: by 2002:a05:6000:2dc9:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-492778d2076mr1325704f8f.45.1793909543495;
        Thu, 05 Nov 2026 12:12:23 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm11108369f8f.17.2026.11.05.12.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:12:22 -0800 (PST)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Date: Thu,  5 Nov 2026 22:11:53 +0200
Message-ID: <20261105201154.37294-2-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I'm looking at the fbtft TODO (convert drivers to DRM) and want to check
whether fb_ili9341 can be dropped. Findings against v7.4-rc1:

1. fb_ili9341's init sequence is the MI0283QT-9A one. Comparing register
   writes with drivers/gpu/drm/tiny/mi0283qt.c, the values are identical,
   including the default gamma tables. Differences I found:
   - mi0283qt writes EN3GAM (0xF2) = 0x08; the fbtft write is commented out.
   - mi0283qt always sets MADCTL BGR; fbtft makes it configurable (bgr=).
   - fbtft rotate=270 also sets ML; mi0283qt does not.
   - Rotation maps as DRM rotation = fbtft rotate - 90 (mod 360).
   - fbtft also offers runtime gamma adjustment.

2. fb_ili9341 registers the compatible "ilitek,ili9341", which is also the
   fallback in the dt-schema binding, so it can match nodes that the DRM
   drivers claim via their specific compatibles.

3. In-tree users: no defconfig enables FB_TFT. canaan_kd233 (62363a8e2f56, Feb 2021)
   has a status = "disabled" panel node compatible with "canaan,kd233-tft",
   "ilitek,ili9341". It predates the first DRM driver accepting ilitek,ili9341
   (5a04227326b0, Jul 2021), and none of the DRM drivers match canaan,kd233-tft.
   fbtft requests "dc" and "reset" GPIOs, which fits that node. I haven't tried
   binding it. I suppose that, if the board is used, then it is built against the
   fbtft driver.

4. fb_ili9341 has had only style/mechanical changes in recent years.

Questions:
 a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
    modules to panel-mipi-dbi? The KD233 node would then have no driver.
 b) Or should KD233 panel support go into a DRM driver first? I don't have
    its init sequence or physical size, or the board...
 c) Is removal of all of fbtft already planned?
 d) Several other fbtft drivers have drm counterparts. Should I inspect those
 to see if removal is needed?

I have not tested on hardware.

Thanks,
Daniel M
