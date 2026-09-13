Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095834D93C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311624; cv=none; b=uOnTareCHPjj0JIT1lytu2/l3O2fE8BxTP3zdrLo0+GB1b+W+8HdjtFLCC7pe2fqmxLg9XEWobU0H/w0kp5yjsFpESl6Jq0qnOncPA0eCi3ynSZF0e78LLFqIfvArYa3PTsUT8ImrtU7ebxWjUnrsKE8e831fVf6kjA21c5bAhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311624; c=relaxed/simple;
	bh=Ac9hJRO3+NqcDPgpt7ObfLuM8SaCLFN2CkiLPShmu74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmetSbFaTo8C+vFeKrPYIbfIMS5L83o3JteJbU8ezhJjSXX5hCNWEUjJpKoEOyXlbalWmyMU/5aF/3dY39iAEipvG4/hQgDGl8lP2+lkeS4m/ICoGKaTOwb+MHEXXUHfeESjEtyWORxMBrFoaml5/Yu7ujEAkewsA3CPrwfuhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJBOmB/K; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJBOmB/K"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1299772a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311623; x=1789916423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=;
        b=IJBOmB/Kn7/c019Mg0ADIEO9taMZF0g7ND3p7qANTwKtsYuY8WusCiQUmZaefASkI8
         BOxCf3NXFGjnTD32F7tiDlqHohWaGa8zTk/wKJ0xTYaKGs9BpOn/SlNUKfNJEiLfMn+3
         XNsGw+rYQcT9fj4oT+5nodhggni2xyuQywSzxLN0i9jptPNu5xuBf2qR6yPJ+HztZKCl
         04myXS3E3HakHot0gzbGCS0klOcXBFYOCfUNCITZClO/1MrfuARJ8h8yeyfrBtgMwCUr
         swO865Ki5mcgJVPAJR/c3lg2I9dc2AkKo0mu1BKZs3pJ0eKiplpbEVySf7EwWOYY1HFM
         tc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311623; x=1789916423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=;
        b=MjoFOD6f00i4cmF+uUIUTjx0LIM06XKHSz1hhBtT9Ke+jdcONd6sIWC86T83cUYe3l
         cViKCyCwaEmMbpduBak/OSfNbcBkPMlZAEgeckumoa8GwtASrmJKB0M0vpgwxXgx/eye
         kMr6J40QQpgXZ3M7wr0uCjDwymCMLKd0U6FQSPUJpwrujYvnSLd2ltD4GwkU4iJRckuS
         mbyTXW9w5ZxSFbst4Izy2kYSx9MBWKvEZWhxPi67Pf3avW1+s7csucRdmd6+D35ifQ93
         v9DWXAyhpfN56IHv18GlbF+LwiivJbaSrBa1m9EshDA3cLiJ9EJ7K3A4X3v9SV8KuK0X
         YUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqcaGPvU2qL2RJeG5+EdI4BOsLkhcsdTanqTAmC98cCpffmSE+pBan/zEuYlLGfAeYN6UZCJHlHNaK22Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k3nxfaJNijcJ/TCaGAtuppB2/YU+lQ+qa7C+llv1q/bcKhi2u6
	YYo0Ajwe4HIKnDkhgrd2TVuv+BhPMQAaGo0Xy8rk12QA4h9Bx1fTa/gr
X-Gm-Gg: AYBFou3m400BDIirFI3BvevqlWG9TMaZBNAHb99a1+Q1gW/0g0tu7Jwc2T2ZSy/l+Xh
	7oj4sizNuGceKnUwjOQmtdTUg9JeqO+2n2YuechrKkzcs3qSB0/NN+khFMTCOxz3GmXRtOXrBm8
	8+BbIn3kdT1dYCb1giSjldpTwQd/3vzoFmt3d5tJQcqOZ9EsZplXuDoutPeALLDY4aQ9F15hZ9T
	LO6xpw9NWFe39tdulMgXb5QExmND9zrIgzm9gROHh0g7xqCbEdcgH6H1F/CZ4emLQoii7Zwld0y
	/Uk1PIFzBkTV/cuC+ph3n3kLbetTMe9bk63bxvQNJ9j/XC+WpZTh4wtiVOMCDNtG9/Tk+5m4Byw
	wvAwtdKbeUnrhfvYGucv+AftlBzCz89qn3L86lWvp8TrQHrLSJqlVM8o0u0nfydeHvmy6TtoDlY
	j0sBRWydYCiB/obwzflEVlK8FmAGzqv3wpKgoy+jUnND3nqQpA9b+Xao5L1wlD5pOUkLbBOf6TN
	gGGj64Qn60=
X-Received: by 2002:a17:90b:580e:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39d9bbe47a7mr25597954a91.3.1789311622706;
        Sun, 13 Sep 2026 08:00:22 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 9/9] thermal/drivers/exynos: Select thermal emulation support
Date: Sun, 13 Sep 2026 20:28:37 +0530
Message-ID: <20260913145905.9404-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select THERMAL_EMULATION when EXYNOS_THERMAL is enabled, as the Exynos
TMU driver provides thermal emulation support.

This ensures the thermal emulation framework is enabled whenever the
Exynos TMU driver is built.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index e1e8035d24fb..7d5590f78185 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -4,6 +4,7 @@ config EXYNOS_THERMAL
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
 	default ARCH_EXYNOS
+	select THERMAL_EMULATION
 	help
 	  If you say yes here you get support for the TMU (Thermal Management
 	  Unit) driver for Samsung Exynos series of SoCs. This driver initialises
-- 
2.55.0

