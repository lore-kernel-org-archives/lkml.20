Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D863438CFE1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616899; cv=none; b=WS74khfcLoYwDdGXUiy6gb5K5iIoX+kd6Wz4nFYDRhB7WRqtV6jcOa4WEsaah8oy4Kq1vsoB+RvQqXnFcqigxpqjDjrLsPlR0DXdv09BwoVLJMMXH3OK4fKFYNDcN4eKwkgJxSbmNLz97/TErBgxsM367/hpWE4ic6A9f8fIMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616899; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGAsBePiR++KBFTfp9O1zcqqovA6EHuoEYU5l212vSwUp2w1vqh/2pVFURhpREcg4AcKBXwIKGo4agsDGjyJZ9UsxFyWUb29nQgWYAPZtIho5Hv5LGF+teiXU7X9me2TCdGbnjR7VGNmh0HVP+D/uYmjeySd4CNrZIBmuTB0bDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZpV17zU; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZpV17zU"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-785073ad5ccso1450683137.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616883; x=1789221683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=MZpV17zU6O8ZzOYCM6mSh6Pc5bMWELB+jnQuQi5HQCi6EKwnfgmZ0AEBpaSpAQDW8S
         16IVmCmWPcQCQ7FUoAc2mjdXI6Vun4CESOtgp7TZ/BbzPL1ysQvKYMFBk+jIWWhuCbdj
         gBI6DgINw00GjdIA9p44lmwqHYK57/id3xwbTs5uCy8v4cZNIxLxiIv0AMx2XLjAnH3C
         Ea+l+j6WgNoLX1w28TuRU6e+lpGdTNOmLFjggreQG9OFR3L71bhcUPSJ4VvBiNxuPuvq
         ddKBGzFKZUmonKqMeFOYYTi1Tw6vtCRVa1cj6NAo3DraG3ex8OCKO8Q8YmVB4pM+sOEV
         hYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616883; x=1789221683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=Bky/RzF+hgvONdZR1DopDL7AU9pTdH2lZ1z2BvIXzqd4OiyagV+vOShcplZvwVMyQj
         CMg0Cd0DMlKt7xvqFYvwn2LAeegcUpxm9Kqql7KuT17sFJrYGmjv8VlqUVFgNfl5zfVU
         /m6EGqjPxKS4WPh8iMEiK41o5prrjHdhkPQq262HsKzrg/TSTPPMiU50n4Pbl9GU8zFm
         oqe4F4srq319WhHKG8GvQKmeAobCiyZM1T9ScESLuTbVc3RoWc8Yu/xIhsHYbRiirmC9
         +9Mnx2Dt8kcV4WvJFRgqs0di+HJGZhOhsZyN3zSeyn8dNz/SgP/48ifIRQlbauuojH9x
         GXeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTxv+1fdXqKtQG/OFzhoZQyLMBZ5X+Spi57lQFJcO6R1JB5OHY78FrXymK61wcQutDIePJlkOzjP79mRg=@vger.kernel.org
X-Gm-Message-State: AFuF++kLcnpKTZmQFAFsqJ+/zdfSJ6fBFDy1qQySi4JSc6GumqkMIly3
	YwUgXoXPl07LxGN3Okx5YWk/ONYBBbXQnnt9KIQ3ItWN8MUE8VYG9Ay5
X-Gm-Gg: AYBFou0RZkxRg8pbaEg13ItQ6xzmIA0wE0SNr5AI8j+AEnq2dO/knYfxj53uUA/47oI
	ZiGnyYoH8B3wpjjHDf/xqHGGK7b1WJzhPmwtI8UshrfF2he06UOHet1rJiYHiyqQ8DRk0zG4yZE
	Qtj2UYT+uukzlazsnan9teUeqwNbm3YnKQCAKVdqcjB9XB0BU+RlpFort4X6ApAlSzSzFk04WK0
	A6cLkUjmePZuePYvTsIXdr4qb5oeouTrzQzLt9RNaMrOdIgGtFbqcS+1SqubApiJcitIgRl5hnT
	AxmSvTOmTekswxKpbLXfEELmZTwi99Y7HSadQDwUEYDgyKwwnNnhlD6YDPUjMfuhlquxEsmbHmu
	wWWRHIt3YRfe7FqY7EgOA4H0If/RX5NkgbcDnYJVh8Wgl0vc4gzvKdepEmJ/2sqMQ3dVTEjRcpr
	M8vlLf6ghDyXmoihkeJ8+563NFtVYN+zkf3OOBWbIhT7bhIlVNvDJlNlX30Cd9SXgS41iDovtU/
	QOszaHMgk+MaU90rjSW1shLUnAv/GRu
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr5213627137.7.1788616882765;
        Sat, 05 Sep 2026 07:01:22 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:20 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 11:01:11 -0300
Message-ID: <20260905140113.21638-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

