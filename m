Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4D3D8907
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700521; cv=none; b=Nm7VUZoFGd1jX26+VbDLiy17LW5atXHdzewJGcX/MNLoUay9/s1d1qaw/LtUjXORGSnwQxsZseDaR+NuarfqiorpdMMC4uS2QSKv+iraPWMTQbDkEAhJa4zKsIQjVr1RCOSiCUdCn6+V3sfBI1fvjDSe5ptMB+fYSRliHOA4YFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700521; c=relaxed/simple;
	bh=ozasnFIBA+8rSKDPSKbh/3Fbquovn2x4fV8LNqAL7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkbOdJiM8usrlZKakh0BlylT7hJWXEjQgrIUqzvm7phUlC6IxnG/tQrERFpECbeH3QqvhiZu0CmV1PxL3/aq4GAYmMxHxZaggyo51dbk5eEy+IEjAH/QpBkIC7iH0+D5HPofNmUEWF+Qi+ew/gSQQ+pdXbdAXxvUWxRX2i7l2kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+PQoGRV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+PQoGRV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso1461295ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700515; x=1790305315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=I+PQoGRV1Br3ZLg8K13kEe7VKD07jxw1ByTISEUsh82Mrqyx7hJx21kFQpl91BRPPv
         0OZIoI9Tn1Do1DSM2uKGzgcHrTBF2UWIKZs6n8GsDK+gpeaaOj7anQ4jNX7ks4T7vDNN
         Re7fv0YP1yZczHs2WEKjSX8+5R1UFWu2NMnS+P/thhwE98/yFivCglW5Cm9vCoclK/z/
         etedSCC4/Qjwovlf17SwFRf8kLqkk4BNG+rX1f3UaGWjd9AiVzw79YKgqzwZhOcVJGpG
         HO9k6oXUq7xlXrESlY7tBkxI7HN4Aml0By9zGdjt0WPser8kqPhOix54oueJ0NcKCDzr
         tyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700515; x=1790305315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=jZG/DhbFo6+mYKuy9PrRQv0jbmqmwYlUlCKkcIKi11sd2phNP7XeAM8WiISAJjAiHt
         wTTTr2MHG+gDh/zce0PNxrLVQ8UyKD8bp/kUM3Dme2xVakJUEl9Uihc3GJBNdfEggvkS
         Vr0Kwp0e691b9v0FaTMvWQh1c+hSnexKwcePF1NG7TpYr6FQqJpx66yz5N/fb5xMRIr5
         +FB4Q1mB9Sz0LQGt3WLggF8S85pfacHJ4FksU2qsgnKlDkra+eGd4CIIdeD8XpHfkrAS
         naKhc4xkj3nznzVWP4x4UK1qMjHBbEA/NG2pLGNYdTspqAPnXHXfnkrui/XbtjiHmtPd
         yK7A==
X-Forwarded-Encrypted: i=1; AKwUvBxbQr4ONwO88X8XJ3zxN37uUo6xMSMunyltLtz3KqRRqR+7EC3Qpn6UXD7NbsmYAkV5o+5d2ACU4sGawWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++miimWYx4GHbL4BgwmFRRrmMOY7jDQBNBauOxZq2mibraI/KJ9A
	qR5TkaBR06TKFnnNN2ljNsg1tNW6lQzKrHXMdp7G/k8D0026SU3TU2Jl
X-Gm-Gg: AYBFou3n3kkAjHGZDmHvjChyUKn8Q8AHBSHsbjLEE0apqXWYGp7R3aWV/oW4W8o1pLq
	7Wqhd8byby3U222z0m7yP0EuyqN8KU0bKNZeHmiZFzvuYLJ2coqkPNzqGeWgNAjyrFtYsjb1hPL
	2JYrWzDW0HyP3tJRBW37L30yc5S4cpQFOm2pmEJbOOhzH2frWWSNzAzVOyUqeBF7nhIELOe6YG/
	742yEgaxQd23rnDJzJy5IekHn+GxePem2SSOZxFImwF56VR+QE7WGsfwJ9gjmd3DE0tC8T5hOID
	JKjSDJ5aTr1d/YFEicttzFbS52IbFe7FA2j1NA40yx4GZ6avsvZr0V/V3bBpCRR6e06RLs7xppI
	m1w/2wPwJ0GE+bH027y4fJDc3irCYh+Esd/WnqBSI/K26T2G39wEXHR7/LI+RVhj7yaR6FRpEUh
	CK0YpOqUpaeDhROvbUvnqgotLUASZHVdqxq6BjUs2Mi7ZePze8G2AiVrjIFgyuuFfqJ83Ch7LJB
	zHc73YgrU1gyr4oocvYsvULRsKQ1TvkyRDpf9rsc3rR7ELfqiaHy8sHFWoQlj0=
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id 98e67ed59e1d1-39e54fb121dmr2271373a91.22.1789700514999;
        Thu, 17 Sep 2026 20:01:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:54 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 6/7] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Fri, 18 Sep 2026 11:01:24 +0800
Message-ID: <20260918030125.315978-7-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603c..295d246eb4b40 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0

