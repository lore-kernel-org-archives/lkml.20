Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630873F482C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551915; cv=none; b=D9ZoNlDgmTR7AVgnIKvEpjteTpv+T0r798PQRSjIaNrOmf4tsomDu0dW21H33bRcJkvy9XNttPvjT31nvyCm2VZtUV3J8zFQxqgGRmeB81Qthv6wgjgk0nU77Fhp6hH/HStnnKMu9BsyKfDWj+nzfVlUhkWUBlYdw2DFie7647o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551915; c=relaxed/simple;
	bh=CqWKEiOFSeRZMC+xXyG4UP7EGxGz2ADL49iwMl9/wWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apFxCKW4oSdJ68Vum66JsTXP2CytY0Kgwss7uXnk2O8GbSanjCS/mmwbgVMRLvEehIuvDeohBXpCECvTLxwMSD+cDLsmIMDQhyo/8GWhDitDsjyfZQ+ejhcRBqnvfm4ME4fxdk4m1Y9n+4MbV41KNxzXe9tAEuxiI+XoaHrKRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhd59BSm; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhd59BSm"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso686831b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551899; x=1790156699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmkBm0qbxpkVGajcugUF9Qtq+Mt2sXz79zpfIKtN2Ss=;
        b=mhd59BSmeja5+PA+wRTAKTTXhb2o438KlZIMBiqufxQP6K0Cst41jzvKF6sFEvkojm
         F+xs0pQICUx+kRzIltbzAyqDG+dTpMn094aNswawUkbc4z0nH/FLxJfBjaTtus9MhTzZ
         rr59YNVEhaMF/4rDvxWb/sHJIRaM8dXztuaw+E/4gPGuzFVFulZHadtOWYGr1Fg/oE3Q
         K4YKKuq7+ZNIAA7Q1kQAMcas39oi9ydClkkmrShDSD6afPjuEcZ5pBlgsXr3u3/48byJ
         nZlFOfKofo8xZ2xPDunsPrhECWBhD+schVdHeJWRLkUedNnRJadF4oI2jZ3dWnhq2cf+
         urQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551899; x=1790156699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmkBm0qbxpkVGajcugUF9Qtq+Mt2sXz79zpfIKtN2Ss=;
        b=BEfJnz6gTuKYlAWH8xt9XEEDhUInZo54og2ry5oneXg21MJXYewD845m/VVNkrLmaV
         LJuevqtAcKEZSVkdvf5zS0WTfmiXZ5WNO5NOTChaiUcQxWrc482L4951cJvqSVEdBVxu
         Y4I24MvPPtc+mvUA2p7cJGghlyGdQSWv+N0/bmQSsObps8jw7SilwW2mwlferg1KRd1d
         DuJ4+Hv8UiXnebcmofxHhj/prwdcM28spnIzq5j9hZbltSqchv8mP5GIGHvnRZIfV5oO
         IkKXH99KkLmGX58mjwElabE+9UQd8mr6uRWrlQI1KNuCpnMBBaRQtdhdICkhPQd45R3y
         6C9A==
X-Forwarded-Encrypted: i=1; AKwUvBxEEze6/alCItQJfuQ569WVtAPd+AwLoFMnCcHzBDFC6OkVSaVmGy61W0BNp4xBq9LZ4V72rOTG48Nsviw=@vger.kernel.org
X-Gm-Message-State: AFuF++ntFhmTYZf10wDCz9N3g3rHsY6MEgvKKvevNIbcNdzabM6BmncQ
	PgICnbjt48gWoeihXG7z4Ut3ref6NUVkN/u/xLX80Hy81hTXxqw0apyI
X-Gm-Gg: AYBFou3gy/4074BiaJ0fkUlLWlaPHGRSzAgRC0u3hIcCZQMhAsrgIANDEvM8gdevIvB
	Xb6MfNNWcmKeNbcjbeLj9g26Jp4p9QF7tXG/0fwr4yuR2bgr9Jy6XXpq6zxs2VNCZRweEYtaOhY
	66M1F/eNvM5ARrYbHo646YrAYU+kWnXM87eK+Mp9FtNWuhadUMydfQTpr+ajXu59Q9sO6Xx3gO1
	fQ7lWLBvuoFM4M+Zd38paYdKOUllptPwnaYHvNKy8TT7morEFIzBr7hnqVnornv6JAG04/ZBDmU
	W5Ke22M5BjWG1pHkBH1UlZVenRCNJzK4cyuXvpOBLui+DY8uFNL/8iHFOwGP9D8g65kHjjfi4jS
	zVXFBJydtzmI3GNStn+nD0CDtYTFipEpmKIR2QmhLwEXDKO2xtJRMREpPWyXM4Gh2MJx3WLU/Xq
	JVkL+ULEl3kMtn5I/U6Qo6inaO3CM++D94JKfOkccA0T7qSx7vlqUOZTMhlk3DmCAUJpmuHTZcC
	Jd0UAZGMfi6tFdOjRolb4ZcCivRScK7pXHqIurFu9+hxo9YITm6hdoXqzAjny4YWBZoHG8oYzI1
	Y7eWgL18wd0=
X-Received: by 2002:a05:6a00:f04:b0:84f:3f5e:f072 with SMTP id d2e1a72fcca58-8723b391635mr4037389b3a.10.1789551898837;
        Wed, 16 Sep 2026 02:44:58 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201735415sm942890b3a.42.2026.09.16.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:44:58 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Wed, 16 Sep 2026 17:44:52 +0800
Message-Id: <20260916094453.1062125-1-zaq14760@gmail.com>
In-Reply-To: <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com> <20260916082924.956116-1-zaq14760@gmail.com> <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thank you for the quick reply.

> Where exactly are these ssd16xx patches. I cannot find them in the DRM
> trees. I presume they are not upstream yet?

That is right, they are not upstream. Devarsh posted them on 1 May and
the series is still at v1 on the list:

  [PATCH 0/6] Add DRM driver for Solomon SSD16xx e-paper display controllers
  https://lore.kernel.org/all/20260430183311.2978142-1-devarsht@ti.com/

One thing that is easy to miss, and that I should have made clearer in my
last mail: that v1 series covers the SSD1683 only. The SSD1677, which is
the controller on the PIXPAPER 4.26m, is not part of it. Devarsh has
SSD1677 support in a staged branch that he kindly shared with me in July,
and that is what I tested on the panel:

  https://github.com/devarsht/linux-next/commits/ssd16xx_7_2/

Those SSD1677 patches have not been posted to the list yet, which is why
the panel support has not had anything to build on so far.

> If there's support for similar ICs, I'd strongly prefer to have the
> ssd1677 be part of that instead of a stand-alone driver.
>
> Once the stand-alone driver is in place, users will rely on it. Then it
> becomes hard to replace. We had (have?) cases where there are several
> drivers for the same hardware.

Understood, and thank you for explaining the reasoning - the point about
users coming to depend on a driver that is then hard to replace makes
sense, and I would rather not create that problem. I will drop the
standalone driver and add the PIXPAPER 4.26m to ssd16xx instead, once the
shared driver is in.

Devarsh, thank you again for sharing the branch, and for making room for
the panel in your work in the first place. I am glad to keep testing
SSD1677 on real hardware whenever that is useful to you.

Regards,
LiangCheng
