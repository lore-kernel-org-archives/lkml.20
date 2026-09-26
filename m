Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FB63803CC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440295; cv=none; b=KIp2Nwv5DhwsdlmJg/3OV6ppM6I84zyp082mjAYOFbcn8Q8OeYqR70WQgC5fqWaR5uovW0Xw2DW9VCrX4dN+OQ+h9/4qBzRLoJ/FADIcj+3xnySSc1OGpfnHT7E5JEpkxu0Fp2LheuWMf169kjkjpdWJ/FBTDN5GDaGPeM0Vqsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440295; c=relaxed/simple;
	bh=js86bFRXeGRz01VfgdSLlpFJ18e21n6Navx1JM9ocZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6HtfQcDQwBPaZolAY9Xmcw3NnMOCO30XMXIGGVsbOathuea3Rjz+Xl4669g+62p+uUjoqDN8k/Lb6y+8WH9bRweE2QJLQcPfazypMS91izb6j3G+OrGZdsz5C6hhvTQTqF1M6MatdY0GnzM+8U9Nw9QX3rY1Z3XU/mSzAxHOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHnLYchj; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHnLYchj"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bd580489dso169345585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440291; x=1791045091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilWbdrK2o5HYjWejTvlhwKOghbkTj1jD2D3PzsAcjlU=;
        b=KHnLYchjsdCq0u3j3F/YyECNXPI3SMQ9f0NB/yWecDxwejtMxMwj23lqFoOqv9Q/0n
         dZWIoKi+WPUzxcvInDfgCY14j0BHWdEclDOdIsAeJgB94tRHwpbTVIIodu+8VMFmxwXm
         pPjZpTNK3zbjzjAJk6Dr6sbZZsSS5IFtITm+ieGPH76dN/V4pToN2dTbgMOCAyW7StbF
         iWQl8Y+AH/DfZcGyC3QgQtSKmnVdQJh09rlJp+geyoxG0nMKOun8LuFKhC8+HIpi4Kcf
         S955DpIboEWXURrC0aaRW8Vw9aWv/fUQtkMW/Krmz5mhVRIXXujwxNFc0isWrDpiCYL5
         D6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440291; x=1791045091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilWbdrK2o5HYjWejTvlhwKOghbkTj1jD2D3PzsAcjlU=;
        b=oIXLOoVr7RGoyKI+1cS/ZaSFsFP6KMTK2l34aUfkNcB+4Z55EuK7lgSfzDx3Zljlph
         uV3kNsJhkFb8bJ48Y02li6QUDoHHuH9xsvtzX/2Vn5CQO3yq782fxdknCdPLxdY1NdvH
         h4qlSlCDJjqvZtmzKXHVk7vHhSsIfeus/XoZn8eecEfFlXYqFdJwghq+BKt8/C0fJ+Qz
         tvDQ65I+udnJc4nk8SSjjvros4+khDP1N29oI2T+AUsLwGSl2uu3C8VMO0DIFFI9Ue1Q
         WsvgWbEDp1eJfzT70XOFxEEL0dP/ZXsjvPg1gYibFNAaUH8CDWyP7UO6PQaWe/qerJnf
         XSGA==
X-Forwarded-Encrypted: i=1; AKwUvBxzWGgJM0eqq7JTcUW40GVqopKuQ7fXljULM5koSK9uuOF3Sb/QGJXcIEHXzu2YHqXG26EKFNF4DyMJMAg=@vger.kernel.org
X-Gm-Message-State: AFuF++lleTCc3qm211gCzN0aYmr9uqp5a6yVaVWkzrKNXH6bm56KGhB4
	86Pi801Y4EpMPK2kIFu8OeZgink6O9m0qUwTTYyR/QXmRB1A4H4SEsMS
X-Gm-Gg: AYBFou2izNaa7iBaCOpC1jxG8FfVht2cqdcTw0iS8VK2S7Z1Qflm/LmuJuzToh3BKHC
	tXsL80qeI4hGBj9uZjQxUQ279Lst9XiIrSZNpFAOfwHRNB1ua5VEXBTzhvD/0dHCeh+cUFaZf/v
	FBtVRxYhYgHAXyH9pZep2Qss0m/B1hVEgUZjSnUxuAwl0NhAaa6k/Lu+a4q+FDJsnvpO/l3ezdy
	nBrp9L/L03MOoHauZysh+5BTOkEWQCaAQdcJTSTOfejuSuJOYNlDkm0d/nDjTwKKiFkf0cCm8dp
	lC5dyDl7IlTwPY2K9HQb3UySmk4RYmNlAMkOMMEj6vniJEcDQD/LVRMU0efULUQlJECRE5M2ouQ
	DzAuONOvTDi2D4l1wdaKPoKUe6ZVFQUNuYnjYO3E9Rw9erp5RYPLw+vC0+MhDxSYqkhY2mcRghb
	W89qcdvXvmvWv7VCXUjD1D7DuXyB52lHzzO035OC5S1qQ5H50/40IAeUDvLRAu88SF2EqcNp/Lb
	Yn1+GwyQ80PvpJsHko1BPnKPMqEFB76jHX5szxyatbs0Uk477UyyOMI2N1XW6NwB0F/
X-Received: by 2002:a05:620a:4111:b0:939:13a7:70f0 with SMTP id af79cd13be357-93c43b7f202mr1155214985a.5.1790440290642;
        Sat, 26 Sep 2026 09:31:30 -0700 (PDT)
Received: from localhost.localdomain ([2600:4040:29f7:9600:f571:6178:b590:34a4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c4fe09037sm341332385a.27.2026.09.26.09.31.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 09:31:29 -0700 (PDT)
From: Dillon Amburgey <dillona@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Dillon Amburgey <dillona@gmail.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	christian.koenig@amd.com,
	krisman@collabora.co.uk,
	noralf@tronnes.org
Subject: [PATCH v3 1/5] drm/qxl: unpin the framebuffer when plane preparation fails
Date: Sat, 26 Sep 2026 12:31:19 -0400
Message-ID: <20260926163123.39217-2-dillona@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260926163123.39217-1-dillona@gmail.com>
References: <20260926163123.39217-1-dillona@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qxl_plane_prepare_fb() pins the framebuffer before preparing its GEM
fences. If GEM preparation fails, the atomic helper cleans up only the
previously prepared planes, leaving this framebuffer pinned.

Unpin this plane's framebuffer before returning the preparation error.

Fixes: 6071c4c2a319 ("drm/qxl: add drm_gem_plane_helper_prepare_fb")
Assisted-by: LLM sparse
Signed-off-by: Dillon Amburgey <dillona@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 0719fc6a52d5..1f869734e14d 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -887,7 +887,10 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	return drm_gem_plane_helper_prepare_fb(plane, new_state);
+	ret = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (ret)
+		qxl_bo_unpin(user_bo);
+	return ret;
 }
 
 static void qxl_plane_cleanup_fb(struct drm_plane *plane,
