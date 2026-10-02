Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4346A61E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931421; cv=none; b=EMLJzYdeNcN2pnBUlLwmgZHInjjBlZS0F11IZVUYPRv93u+OTnmQsc3IuA1vzmgtrSy3ACPTGyPFpMDUaTwX/5SOKC7nb5+pQzmdWjItcyNambrmek5kal5F76BvfkZqCOQ9jrJMLuTenEhiNQV8MYdiK9zNcj7qOWpyEBaLxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931421; c=relaxed/simple;
	bh=AKpAwGrAWkWPODtfuK12U4uxiMLieKQlbgES8jMWlzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otFD852aMfeezS3zvZ4+EUgmHeQ4MBM6WveKy8ltAWYPPxQHOh4JW+3m/qzQyTe1H/SYe01HTGibfKMUOualRxsq20diFlew9TyJd8FlfwPbE2AHUmwbCg3LgHz7BVDa6KpaWzjYi2KDYu9LxsdP5hEVdXZTAZCjCR/qbyh2mz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpSTW15w; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpSTW15w"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-883a16b758dso1187618b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790931420; x=1791536220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpvwnxAk9svVbGHuD977nmsMKCoPbElte6mylNvKXkA=;
        b=cpSTW15wkqe1gxhkUDXYsc/8sDgK5EL2/zSlxKAx+691YPeYF6/YhH+9ZggmKWPKaV
         92WUYKm1IWIQeFk+j2d8p42/HRgJJ1Imv/qi0X1gnyZ6EEgSDjLI/LxG6GFNlucTmzJk
         z80myiv7fLn6nhsDJ4pDSxu2P0bHOOwNGUHZHqbf9PMPU6fOevM3LGeMfnB60/64x1EU
         MIdVGQ7qlZGuLQtvuGnqWeQz3iav7ChrguC0YG2euIqnuBaoX6vQMOMoVz6Ebnl0PDhh
         ELTQeVidueHUoJkNbuJjxvoEoCrcO05D744vNGCG22DR7Py47YeoFBLEj3959UQ0FZLk
         N91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931420; x=1791536220;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpvwnxAk9svVbGHuD977nmsMKCoPbElte6mylNvKXkA=;
        b=P8vO92IY7QS1lJIZEglWji5Bnc57KEPwpULtZv+wIL75Te04J9zzwa4Gv0n0Ay/3Wt
         sT5mC3OFpyb5Us60ykiltnNsb//qkt7HPuAT8YL6jVA2QePo9lf7b8VkyI8VCsF5UV/1
         mRPDnPW3AJmm6j+t2mt9SzCuxAvraAtI8wVXjXVhy5Y4XRrRD6li6rLdSo7OIEqRBKPx
         ccmLRzJdLtmjMsTCFTprvKNMqBEFyLUpcx7SfC3csXiGNIoesvyvuKdpJAfEvoYZ72pO
         r43I96Gx0egW2bZfaGJELYm52c8As0GHDIsMNdqcb7ggiIbaWvFWABfSqj3C5Xbg0HTR
         7pEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvNNLr98uVFGUCTZRXtOyD2L9NWsDYYyjAMo+8x9CCbWfUM74ELq4/9CFSnFti6aZLL82s736/XvLIvyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWXcXwwyja3AH88A3LMymc8k6m+Rugtkosywb6aghj6Jm5XV5F
	efPTZPsuMXXE4q6JL5UJ0GWjdGKjjhh0rxlXNSKUONMrpzrX3GdVYVjm
X-Gm-Gg: AYBFou1siTMbdKhCmLB3+C38ElG1j2TTW99IQqPWjmz6K4MpM0HoWG3GpB1jNqhTGe1
	hS3oa5zUo6YdXedqNQAeOnhgwLkVBLJbkgNtJNjij93Cssuo7Qq04qT0D56EpbY+gO9+hmFGsyw
	gpmrRd6K04sB4PovnHSRqsnF9akOOFSuZA8WrFjPFOt3ByEdJAHn6BatJQ2/wH6Kvr90UehlA2/
	uGsR05BYbGxeEB6L5ZkErAmPnikJq6SN1paTQyXOA351KKR+zwoVYuJ0rDCHL2roEpSVBhVP9ZD
	AVgqAXrBkfowz5jJU3wXWK18P+ZqpeLadRpvTtxFbbDsF6VY4fGyoav5wpgWvC0uIxCuN8108Qq
	7yuev6/517dDqKUSfrLc/45CVuluNImwRK3hftTlpubCH2yU0dIED2ZFThQIH2KYWhR0TktizYq
	O46Ltb9pdX0qPIjTBsFUtrDbPkfM5vv1xYCBECuzw1x4raw/POaOVhn4f+9VLufaP1KfE+awJmh
	k7a3G0EfojD84ykH3P3+WDnvLiSJs7xVc8JT6muOybAde04xnhysfQ939USm3vR6XkH+awna4oP
	8H8NCGtEWh65aCuO4WT3kyaKmSwPxXnVv24n7fLJlaDSe5ovhKakEYs=
X-Received: by 2002:a17:90a:c88d:b0:3a4:ee64:f492 with SMTP id 98e67ed59e1d1-3a6cec30c01mr1156984a91.33.1790931419389;
        Fri, 02 Oct 2026 01:56:59 -0700 (PDT)
Received: from B11403806-N.ieinet.org (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4747100sm7956667a91.11.2026.10.02.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:56:58 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: devarsht@ti.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	vigneshr@ti.com,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v2 00/14] Add DRM driver for Solomon SSD16xx e-paper display controllers
Date: Fri,  2 Oct 2026 16:56:39 +0800
Message-ID: <20261002085639.109873-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927182329.4193961-1-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Setup: Raspberry Pi 5, rpi-7.2.y with your patches 01-12/14 cherry-picked
and the panel entry added locally, SPI0 CE0 at 5 and 20 MHz, DC/RST/BUSY
on GPIO5/6/26, CONFIG_DRM_SSD16XX=y, drm.debug=0x02, no compositor.

Bring-up is clean: it probes, the connector comes up at 800x480, and
reset/BUSY and runtime PM all work.  The three issues I reported on
31 July [1] are all gone - the mirroring is fixed by 11/14 [2], rotation
180 draws, and refresh_mode takes effect.

All four DT rotation values work, and so do the plane properties -
refresh_mode, color_mode, clear_on_init/close/disable and
refresh_mode_init.  SPI is fine at both 5 and 20 MHz.

Tested-by: LiangCheng Wang <zaq14760@gmail.com>

[1] https://lore.kernel.org/all/20260731035705.3198816-1-zaq14760@gmail.com/
[2] https://lore.kernel.org/all/20260927182329.4193961-12-devarsht@ti.com/

Regards,
LiangCheng
