Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A563BB9FA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787421; cv=none; b=cQSOTbAWkYZZMBqRniCybat8VYm+JUU+ScPS+HFcy+VKrDVF/I2GilJJj0EHbqP1scKdW/b3oqFWqZGTA31ykhMT15LmKUtJy4hyAo9MQYhwZzja0tRvZza0Vz02hGPBSnFBNUVlQg7BbicfG14HbUUeS0i8k3NDCxaF1JUSP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787421; c=relaxed/simple;
	bh=cWOtJ9ivnPMZ4LKGhvfJGXiokJaDFTvK70vYJtRzi9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xi8ZOj8B0BwIGr+p5WjkdBJpO5uCRU0p9sbBu8vlkSgMxlOVr0odBpDm2LK17DZCTlkWq75nbv7D0x/lNZMDzCFbYZx46jlpcL2gSHwA4GvBPV4Utu9bve9LcE0aLcQokdb8u2MS10mpRFUISqsUPppvBSnMhnC3EnEe0XEphRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuN6RKof; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuN6RKof"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso11832035e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787418; x=1792392218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqWEUpOcbkCEI5wu3LVItbSlVvKJOnpu9ESLF/pgJIg=;
        b=BuN6RKoftK5Li5mFdiREe/3ES/0WnCT+wADFLbHwa02V/kAkTrNASmM5iLt5nfDkmz
         NFh1fiSBlj6hQfnxAePZaIyCxMJBv0ffg931ZUNmEMmkMBq73R8tY2SYqOiSQ3kgespw
         73lGZkGDb54LX8DFja251oUBQjqY+NrmlJZxwFvNOi8iKbC4mfWjo/kDYYLoMagbPOSC
         HgMrIQI7k6DHXprHC50FqFlU1F8EAQ/rGerBKxKVOoiOcaMU8iNez1EC2vEl+hLrqQX/
         RFozBXvSEyoNy+A+Sf24cNH9JNkw9GovOk7mUa9Byxs/Nm0dOHyY4O4ZYnNHIyczywia
         NVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787418; x=1792392218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqWEUpOcbkCEI5wu3LVItbSlVvKJOnpu9ESLF/pgJIg=;
        b=mQFAsEhwwp9QFNVEHZgyKjfYCrDvwq8m2D+cmHMOE3KO+/5AFa8ig1GiimcMORr9eY
         dBF+rJ5plcApTC/im6NkLfb91loqy8eJq5jJsrYuTyYt5QM7yJUlb79GNoBo6fxXiOWc
         o+/sCD/c4z79KVMIRLPx0sFO9rLStMLnYEfoad3K4OG+eYorPF8WDWY6yAdi5bEjqVXs
         C26HDN/fFqSwXMQmsV6WWv/z+wDFTzThqFl7Dz/QDDUpPI9Dtp92ptxmr4LtxXD8f81/
         NtX6xXg4Fo1E8RpZKVEwoamxdm+LUK5bwz69nPiSJAnpAj8Rzqk5aMEIB40vFr3DCoyz
         f7xw==
X-Forwarded-Encrypted: i=1; AKwUvBxy/AT3MIAPamB3nBMMUMi3Nxg2i2G4rGV8BPOxozdEIlrgV+94fUpFSrs6aBHmbMW02s+O/yZHl85ONag=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBnWXPE56rqRtdgoBKXSlPjNsPAMh0TrxH5zYLvot4xjnLLYi6
	UbhvG8aWoEIVYJN4YY6mweme83EDdm0GRk77ke2oubbXJmUPl0oo5xVR
X-Gm-Gg: AYBFou1rLNjw0H4g0Spf4iL+MLbY1oLKuge2ghQmQZvZTS9/rBvF2oLSy8AYiER+gnw
	zool0RuJoqu1ZNRpWLg3+U3JpCdVSFMnSadH5i9nSS5N0oRBmaWVwv/28qZYAVF4a7eqmrSytFo
	D0pC2p/h6PXQCAcvHIZf6Hc9SZmyV/OeNJ7dwonNV10Jum6GrbM+boohY9SMbGqdR+Unu9Bxym7
	tQUOgK7GFDgtZJ0im91SGKy44RvkyroR3x40LQp7mFzwIW4zUWrisMNJBcytj27jtvxI8tJrw0W
	ytlqs2f2NtF0tuNiWnchmCwGhv8d3o9REPmUDtxMTvLMQRtfOV7fsu9l8Cb09EoEmX+0uxwzoPu
	YALJeKBxBza1SPdPA91vors8AizK9rqUZc+zDlsOyIzYRXtdPMYw6yXxyNc3tc8HB8ihlrnTRQ1
	J57lI5yY+24A+lyThbbbda3dw+nBwLjOIeE5+l1bwOt1glr+H0bRXvvCOVpKbW2oELgjWF1Q3qS
	KYXJvin2kabVoA31KFiRvk=
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr153991385e9.9.1791787418332;
        Sun, 11 Oct 2026 23:43:38 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:38e4:cb76:562:f06e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm499586165e9.9.2026.10.11.23.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:43:37 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
Date: Mon, 12 Oct 2026 09:43:34 +0300
Message-ID: <20261012064334.3193085-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If drm_edid_connector_update() fails, hdmi_get_modes() returns
without freeing the EDID allocated by drm_edid_read_ddc(). It's
an unlikely error path but nevertheless possible and should be
cleaned up fully.

Free the EDID before returning, while keeping the existing return
value of 0.

Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d4fce39c2b61..386557a7f5e8 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
 
 	ret = drm_edid_connector_update(connector, drm_edid);
-	if (ret)
+	if (ret) {
+		drm_edid_free(drm_edid);
 		return 0;
+	}
 
 	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

