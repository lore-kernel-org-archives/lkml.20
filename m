Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251837F32F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203877; cv=none; b=Voua3Bpst7F1Jt3BjSuuO+R1oZOjoaXUJ3ewIiO93dhFIACcXGFq0YrhlGTapUOdTU42gZJ2zpp6BfPYtXRt7UUjHbhW4o9nWCB+KvW/cmtKUNtsRqFGNgJ9o9UB8GDpvozclg3j0F8SotfsW7ojofXnVtbeUzCAaFPHxvh4WL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203877; c=relaxed/simple;
	bh=EKX35ie9/USsn0Lh1pIBDFxv7amLEruPOvFxMnWeGnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDzDrJEQ7Uto7n0UsSpzDkPrXtXU/s9SMgtGhlIC/pHEKrQM0Qy6ZhHJKQ75wwYY1U0QkO8N2ursgaDq+tA895iWlYm5ExvTczsdxpGuzrKbitRTRReDqkj4899QdAOp7fYDERrF3vEDgzCpixfhKcUlL9PjAVpUBDkKIk20Ups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7P36F21; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7P36F21"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e73611928so2286855e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203874; x=1790808674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=q7P36F21o8SR9xcYCLCdLlzodnr/WLXRH3eQy77uiPD1la8KmWVLJpczwS36SDjxz3
         WjqMrm3e5Tq+zY7m8dB92immHr+Y52qat2rwiCO5ILWnABEd9eWCZoDfaIe4omahsXu4
         OEyRfurBc01MmD7qj7GxH4PDciCVoXOM+L4Ul1Ayod71ZYCiz6wLApQqHtMG3ZaJjRsy
         On+ey/i6RvKmYhd7sNIR3gHrKWi88u5i9NTXBmjtsx3q/2V8X7LeBOvXkvR+zFk3PZul
         maCDCs6yQjo8ZPVFJSFmwZ0D4DF5MM9/Tk0ICrQ4FRxa3Rmb6tI7fNeXlBgD+S7xnZVJ
         BEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203874; x=1790808674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=pys0nRH4Y73+2W1guJHq+C3RMYwEnT4Gaa2zBrwivIaA3chdW3hoWdtISv+MLMScJb
         QS0rIEOTwHY33ALhEMOk2QDqrIiKsZd5m1Rp3tJc9C2Ky21t9IKGqTYcW2Z8YYzpO/Fw
         6STDBf0gupBn/8W+IE7DPC6bRmJtZmox7TkNY+xW/vGWhpadbNzbA7eB5IPRz7im3f74
         dQ3SKJlJSAr5SQN42rR8swvgtTzcx/xKYng7+EHnGMbmQUBtUTWI6oxuIWzrQM22t/p9
         0zHbngrXzCEM+1+sRXg2VAiTCgrlIZgBaYkVIlGNEZLpTEc/WQVBDF7C4aou97fC9/g9
         R+AA==
X-Forwarded-Encrypted: i=1; AKwUvBxweOpRZB7d2kcdirC8U/xHO7BHqr02kFIKSyWgsS9gP4z+CGVgzZh+1l0alWjHjFvXE3CMDinlS1NKIKk=@vger.kernel.org
X-Gm-Message-State: AFuF++nFwXPwsZIgHTf6kqsSCO8LnXtPZ16CH1mllRNZpvx/9dP/EuZ9
	zmpOmcSbyz+FLEGt0PHMb9dtMPpv/f/2st2omw/0H9b6S1BIR5aaQsYk
X-Gm-Gg: AYBFou0fZagJieZdCf3kI2ILOSgl53kBhYi4dSG0s/JeIhWMviM676FXkquHPDgCgZO
	yflX7uMZtWg2kKWPbLxLf0P8g1L4ExCFUM8wQ8QdS5LHLDpXCnpAQ6WuoVnMnR/LemxO1p/fPpj
	JigxBtEAwd1HPpIHJQ72yza6uOe/f7z46eTKXbAOCK+8+zyM2uzHwfA9IkQe2eXHgJSUtArjL86
	HhYsFAw3m+D3hxPUBzs2EbzF6zv3a+gBOHootvrvjUsirwXygFA9YSea5w4nh96nXGfFp1IivCa
	un/PDYvA/zyqXmm01U4JkbnPosjPh6E1VcCCRHja07KWBRarkSB+pUQW5l4LINQi/wSZWe6Du0h
	AUe/cJQDborJSsoRn9FauLFWGMge4PC9gZhst8DoGCLvXWMqS5xdHOIBBUSTK1KgTGRBhGLY3nd
	xoiRs9Rf7bVCcmwpD8CR493FOklvxnXZxVkK1hoIzVwF+kn3HWXdJm2fKH4iLDG6DrnXGTEVjUS
	WcDVK4jt9ZOKJNVdUS2lKoDzUVnm/JmtQ==
X-Received: by 2002:a05:600d:8642:10b0:49f:c305:f4ce with SMTP id 5b1f17b1804b1-49fe6705708mr6898435e9.16.1790203873928;
        Wed, 23 Sep 2026 15:51:13 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm9822109f8f.2.2026.09.23.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:51:12 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 04/11] drm/panel: s6e3ha8: Introduce AMB577PX01 panel
Date: Thu, 24 Sep 2026 00:51:07 +0200
Message-ID: <20260923225107.191388-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

...
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
...
>  static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
> -	{ .compatible = "samsung,s6e3ha8" },
> +	{ .compatible = "samsung,s6e3ha8" }, /* deprecated */
> +	{ .compatible = "samsung,s6e3ha8-amb577px01" },

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
