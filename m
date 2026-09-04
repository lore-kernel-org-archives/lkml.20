Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FD477E38
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520317; cv=none; b=Ctcj8SCYxOo1QKK2X1YtHD4/NoEyHN4EjUlHj83ghE4zOfwA4/C3qVUvdXYiKy1RgzgpFItefpRf6h7VC1NWddzJlB4M34cp4RyLF+jbeVd1SITevj7OkwtyWD9vbnbdZDScBKiJYFAXXko0iXC5ibfpk0v1lOGRFC2RDBRaS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520317; c=relaxed/simple;
	bh=lqh0A3Jb0dkPXewGZE2Ccph0KyGwB/eJ+ObjVtkWNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q6SSYvgJ7FIcy39ULqATUO4EyGan5EaWXzyqQjVtOATkMNYTKTV6zOPKbVkkpsfOQOjb8MQ76JhxK8SL+iZXuilhNTBwInXjjFXmThdxuwRcA11uEctbsXnypJ6T9zNl503coxxmIywBjdUvoqM53hiGSxFOsxULCBddvG72d7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdxPefCU; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdxPefCU"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b12d146e6fso409272eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520315; x=1789125115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=;
        b=RdxPefCUyjeeTOCIYmcLD52O0lOLteAckJOy8e3G1W1Wxx8s4/CjAMFJHYuU99vkrF
         ulcdHhQOOspiXk9jGMqJc47X6pRPX7flAzDjV2O77ppxdPqAJrlcENBVJHk6r0G5ZNGC
         yLAyEkZoTe8/JWHmrBid/qJpeonWLeP123oCFzfbUlpMetS2nxxJJ0wDEkCNvvAKoCTZ
         524ZIkNrqLdMEJdB1jtGmejPRsCl3zwWYgingJyF4il75OWhIgCy6D4gJydCKndKL8WI
         JVK+V6P1yUBVZ+GLEXNy+hNlXMRyGwTf7KpUhrn8MRu90zZ8o+zXaHmnOGhpIBpkeZUM
         IEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520315; x=1789125115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=;
        b=fb6v3ooBRQrFC3Rrmq6zWYb2JpsQQIVf3OF2XcuXTuPbBB+mkIjWBfIr01I+G1D/Vs
         eUI7vwTo2YHAYeXT7QIt9rbf8b8E2gOP66wS/Sq4htNJ6b/XFstDY2hE18RsqlDE64rA
         DK546iSUHwjmoUeHSmcDe2k2qWd4ZjAOHZVIUJUoEipK6KboJV6DWreLEd7678eQmRkl
         QAy3dUhWUtkUshL5gJ91ZpWbpgrbx87PihHQqA5QTT4G1trdno0uRkLmInRmTIlzZcmr
         XCX9iAlGP0kjdEwgqf2C5N2QmbSOU+uGZzWp2dI2dJoRmXLBzMklBAqcYaLxj1E3pvMn
         SedQ==
X-Gm-Message-State: AFuF++lswWj6yVyqRmQqHPCcKQYFd7k/m4meVqDi8tw9lltlgm44NZeQ
	DeHklAPbg3qpaJ+56oxYHdsDoLsHiIp/xX44HUzp+UWTG8voPc58cTVQ
X-Gm-Gg: AYBFou3xZYeO0c3yE+F+GK1RkpG/Mn6Byu5YDRa1AhXBIRfL14PSaQSkZS/nZ1HwoHq
	osvRUvT4tm4vAJKQzL/ZzwrO9ceRIfcEKrgUMg9eHk6dZOaGQLH+/KWDJ+ofS8FeU8dk2vBpaK+
	XtxjhMLUQM+ZevB7qZhRWQOLThFjmdvtrG8xs6TWynhIkeOvu+7T2QddSV9PRJZJSvFVd3FnYMG
	NiQ5969MsZvP8bgr9e92wV8qMnsCSyL6RQyyPUMTqLJkREMeWdagamabcI9WSwVTxTXNHx4wJxp
	Fkvv2MTIisPiuCbOY54i99j9toJ750ZCPUiwThv0ECsAHJruwjhNSfxJAVnyZXtqpCdoYDkXvPf
	ChJCGACyP0dA608lwAIbMAKB2bYSAPAtrMFkee6jJiJaX+GAEbQH1xbLWkBauNSSXtevNTgKK6q
	DxUDii+kVVtgksWzRMCwen9u0FNM3Vo+6PrLGPbydJ9a4NsrsVlSk/CnTupiwShNURdipmXNOh7
	DsOSwDH3jPkMPQ=
X-Received: by 2002:a05:6820:188b:b0:6b7:46e9:96f9 with SMTP id 006d021491bc7-6b746e9a2e5mr1706058eaf.41.1788520315117;
        Fri, 04 Sep 2026 04:11:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm9779797c88.4.2026.09.04.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:11:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: fix typo "vaild" in comment
Date: Fri,  4 Sep 2026 16:41:46 +0530
Message-ID: <20260904111147.23677-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "vaild" to "valid", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index e92a4d872c41..c420e61b7610 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -32,7 +32,7 @@
 #define G2D_HW_MAJOR_VER		4
 #define G2D_HW_MINOR_VER		1
 
-/* vaild register range set from user: 0x0104 ~ 0x0880 */
+/* valid register range set from user: 0x0104 ~ 0x0880 */
 #define G2D_VALID_START			0x0104
 #define G2D_VALID_END			0x0880
 
-- 
2.48.1

