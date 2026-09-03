Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB8368941
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422383; cv=none; b=kN636O5nADjIAgYkEfcph943dLfH1d/38biYTSNMaENmaXiNKR+p2w1506afMx7gOs++AaeuuZFMoLW0Qqb9ZRbKBNpmbeEhW1OlximuAouo3FVgkpkkqVm+h1HpYU5q4M11ENErXUDxtX14cUi2z2frdM3g2zfPSkuaWALmuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422383; c=relaxed/simple;
	bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evwpASF3BEHN29siqQFRENS2XNz8L5cPf9ToB3DllQcA0JUNLFGeTgw0+imlgE8JjXzCLOXGd7gZwZpyi2MFXe/ILU/eFlcrNYKj/RTry6NdHZasHpdlHC81l7SJ0gip8XAYNcQY4oEqiJAvtqdi+cDIQnyLyarNBJiv82t6mZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsBuX0gr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsBuX0gr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48584dc164fso1154f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422380; x=1789027180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=HsBuX0grnkXPgoq0sC5ucMO8GR3gzi864esVYlyAfAch+ejmOqANLUveI9sM+t7sv0
         JU5gbgggI3X5wpTxHrApZNS7VsQ/ISwLBgcXAdb9nt+qMM16UbEnc6xNQh2dYvNnlN2G
         SzETfkI39nyYtH8gS+d90ZDgDLN6IhvLW7T7eQV7I7uT9KenDqU0aDb9PnnykXxmrjBU
         lkkONnUxkl/Sjr6tAJ55eto0kZHprHUcD2dUATYd2O0Og5+y7BndjXxFdQXgez8QMTrs
         PDfKQrDsZDZJKEKVgq84J+j4cnH7hm1Y32r9aKDOnOLKk842jHEjomPhivpVkKggWaXx
         biDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422380; x=1789027180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=CnMK1mbqDlhxABlSy9v1xTD16yPGV/8uHSbFhPkjXz0krRVYihFpW8GihKWMe0HX8A
         Fxgb3Gy6zRHIHALDmCJsZG1oK2pAnjLSzy/UFnnquiLyHOwIedfSq9aUvVEbTRYrhc4T
         f2e/iV3RWVsYatv+WPZBzRKLkEBR0U3nGQjHvHwCRQ55ZFWaa332lqb94Pg2grCt73hY
         5hpZLJb0J4idrSliF1SVoi+ei9THuUxmGH96rk4QZpXVH3rFBhsIPN56EjvGWNlXQwdm
         t+iUlKewdjJfm4Z//KvSD/BwV/iAqppcEiTs77X4IsQD8Ml2KLdmigyOFG1Vds2Myd7z
         lOtg==
X-Forwarded-Encrypted: i=1; AKwUvByl92U6OenH9IQ7lkdN1ik8zf3UKXP1UIPCFNVzrnac6D0/hdUBvLYzC+ZhbMeTV/AG8qSnrC5R0jz/OFU=@vger.kernel.org
X-Gm-Message-State: AFuF++lHd3O92rq9m4mcGuO3QoYMGk5bVMxSkkvkbmXwWyxnMduEin1i
	ex4JqtE+cYg77nNmCtxwCcisokVYJIuq6u9snLaxZ3WAaj7yzVflTPUV
X-Gm-Gg: AYBFou3GhXGYhThy4C3uKsVKOKK0E0h2XU8peWglZR/w8ZCrQznJhegTfdFM70mpp85
	a0lPs2/YSa8hR5rrSoyq0XE/VYYCaqynLpIwI2Ld4wnI7u+2iykQjgA35MQRuI8wtRy0JWSSJAK
	TdCunk54xRoC35zBgg1Smida4NMiR/ecsDr9/rkam9Od6mP9IaoZN0zUmrCPgNyz+osUteLkrOi
	Y3uQa/evJPAnbHt0Di1eSHcUbCE1xUQaMNUPOdVdGzbFWEqWYFGLEYXMKxw3zyBES/8cfB8G5WV
	BNTM8t6TuWgO+NA0ChmRB0/v5K2hcbu966u4DR3zp7+91qwTccEXPb7aHnqL2oxFbkqrrzidHEK
	Ly7r59bLh5SV2Yo8/Xa8DTNocuoEqs4Rjojlk3pxrQz1Fw0U1IgWwusi6ntgTiJq226niPPluBX
	waXF9EF2KeBFgnsA+grcIPfYqUy7Ldbd+n2nhF9Eex+r+dVhFDpoM6vorkaPzEWj281g==
X-Received: by 2002:adf:e196:0:b0:484:3311:3703 with SMTP id ffacd0b85a97d-48488f222d6mr21633674f8f.26.1788422379658;
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:35 +0200
Message-ID: <20260903075936.2089280-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074509.F36471F000E9@smtp.kernel.org>
References: <20260903073143.2068494-3-mehmet.fide@gmail.com> <20260903074509.F36471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Does pinctrl_gpio_get_config() actually return a packed answer?
>
> Looking at drivers/pinctrl/core.c, pinctrl_gpio_get_config() intentionally
> strips the parameter and returns only the unpacked argument:

It does not, you are right, and the documentation I wrote is wrong: the
packed parameter goes in and the bare argument comes out, exactly what
pinctrl_gpio_get_config() does, and what gpio-mmio relies on in patch 3.
The code is fine, the kernel-doc in driver.h and gpiolib.c and the
driver.rst paragraph are not. v5 fixes the three texts; no code change.

Mehmet
