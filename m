Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120435DA78
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985503; cv=none; b=mhWhC2Dc6hHThJt5vm3/H1irgX32UgMfExW2aLSf3jMUMlSOzJa/VGpw8kusOfXNsUee9QwqdAR5HnNqA9MksJGTtP69Q8mjaYHj1cledRs/k3w0aIiYJ12ZdAOtQSXiYXX/eF1S7FPFmrm4PM7nQvzDMR7ocPGoEFdgfg3Q2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985503; c=relaxed/simple;
	bh=jP2B8Oq/SxivmT2+4bp6q/xxtMABghG2HFb3rq1F3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3yzgYFohGaO50I3pDfnZqrxfboDtTvm6lf6wicaAt1TDB8Sn3mOg6NvAimbE62gB0Tm2rUZhz4FjAvGUBy7Ud+cbcxy8EaKWOjoog2NtDVxE3//wQ64nE3X8GBw6Ufqwh1GFFUKjPAdIiCXX8ESnfZoZ8CurLvRzsxL1ZzduGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUKpH4u4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUKpH4u4"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39686abd426so1786032a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985501; x=1788590301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=CUKpH4u4wbfgVsXjqNgQpCom2St/IR3sBjGtAh94rjYSiLD6/Sw1bMDatarQD1we0V
         qMXeU2RnUrPP5yp14bbSI2ohM2rRQXfFrceyoPj83FJZDORM3p1Ob7vcir+PIx7HsEgP
         GU/UKwHfR10/YHxVOH/yRGl2SJpKgJtgebIaMMVmS9hO7a44fUXoGB8xqBqcwR8j45O0
         ZUuEEKZJR1YrFf/wjfJA1hptBqwsa7bRaJI7QKNmU5XTdXcbK5Lyc6xnftGZLK7vX9/z
         bj8bh9bYzcjUmTRkNexFyWFcgFVN8/ayK1bR+FLYYSNRgJ2n80uL5k9QvkLMQrxzskv6
         xahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985501; x=1788590301;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=fiPPGiSlNjQ4qw/mpHRFWt3YpPzwMtJEpdXGNPuGFBspxQa3ChnLrDFn13DV0I440s
         LSfyRp96+GRvXCNmgLT7/qJUof99ulRGL+F2K4EN7Luyzc26+CjT5szJvStT2rfdVskS
         AlSiFT0li8Kyt+mY95Prwc5NtEHcbN7uVk71McULlegEOTDO9Ny8DSbCLyw44DuaT1he
         /a2KIPUj1PHQt5BtC/b/cNq679oYcu7NvJTmoUodGqIMPhn3t9wLDMj+ny6MesmpUEf5
         X3NTMQbux3oXJD4eYzwYqLKGIRMI4SuilgJOq6nSLy02+04aNl38EZQgj0nDsNPSm0ma
         l4WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxif616tBUKn2idPIrX7SHfsFi9T0Dj9cw/1vZSJvP4R4rVaGYQ3OkPkp+I3Gn64vizOMsQOaKd2HZLYXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kvObKuV6PFTTggYsS0tq4IusvQsfv7/uXsi7N8F5F3XjI2fpBi
	s4QPh0Hg0iG1IA1L5aF7Bd/W6S/6MTvxKgw4lnC3hCJzPOcI+lpyMm8=
X-Gm-Gg: AYBFou0RzTXBotFoWfMVAZXSfkZPD8S3Q+on8BrbxBuav3DcVzDNnM/qwtkOM6YucoC
	tGxp/ry4t15/kbyOT1tJTBT1KkcV80bUlRClA8WaAKLxdp+9CJuL601QjByZ6N4m6OcfgAYaj0G
	D4gzcnrNpQKZ/8q6GeiB1w5HrA4OTyuCC6r3NTfcA7qybikZw9M0ZLNjeUAaKFq1IWV1jMlUFEF
	mlv1ZhMltfgknhgaBZyrfoN7IVgyPgGhHIJeyfmkaUtKM8/I/4bvm7WE3j5euMfJMXBEK+PQvys
	jOEOIrOthUrfggsGCrlija6bH8mhYnaB2xEZ37eEqxsanT2BiErovgBchhC4lfawr9b/dJapm9E
	Bm7Z1veGUr3uANOHAegaIb+E+KaqexsV2ej0j7VmPPyGVTXRYe+CbiZNxl/3ks1pSQiHGy3Q8FH
	Ngn4wQxu1Gc301aZkeefRWQgNhp+BorIAVYdWs8iewq/SVjZo9jCoyNFVzW9z5fIsYjKkNl44/a
	KZy4Ce4AWn7WQHpKT2qweVuups9xdGzgd4dJNvfNM2iNnl8EA==
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr22749011a91.13.1787985501343;
        Fri, 28 Aug 2026 23:38:21 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:20 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Sat, 29 Aug 2026 03:32:15 -0300
Message-ID: <b02861a81badc32b414147f36e0c429969aae225.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787973729.git.nico.antinori.7@gmail.com>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59d60df34dfa..dff105e5f01b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

