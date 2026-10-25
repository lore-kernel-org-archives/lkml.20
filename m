Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901062;
	b=ncSdL9W3lPXEhqIbmDgXMg1MLO5MKFy2klaaLEXQPpgMh8j8WhOyz2qIxeEifJPB/jUu
	 SdlPQRICVkQIXW6L2JfB7QoLqoaScaHaKkUcqbBZgNV7qibbezl+kptbBm6RyGEYaR75U
	 vfJEP4W3CL+ujTUGPugY2H53duDM7vJly94WW24YcV+YNZ46wUzTGl3tEh2CZa6J0M1Y9
	 w+W2tO9lqaxs+/DI5lT5+iNvgkqNpBkpfqE+ouLlpyGE1HcCYjG4fRypsHimkz+HEgdJr
	 7KGl5ev5hDSSc3uJeNyMO4M0MV3vfiAHPcv7j9s4JHkroIiN0WUEsTwOCVTnM13Bjfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vQs/9/+ieViMtOkwrXjmCA1Fgb4ppa6TVTluwiw88qI=;
	b=JPzbgDU0KX7bYw0gktJaDsTuIfIep4vcSrD4EOmc6fWSSXoxgjg/FASem6zzqXk2WUdK
	 fkq1T+ZGX9PhQoP/yMdVVrqHq4GtKH7GlH4lYL7C0HLjb+e2bXpYW47B8febqtniF3FrC
	 HjlTsLXeWMzpYbIjQwIcxSVVPnmktFsxbdTuHKdeheXmV16utOfcKXRMCDKKT3TAVBvqg
	 0Uojpj5o7aQENzilqKK7nLHvq5FHGqCd7uaN+A9Fa6CtYZaPAVGR8o3pjYI8GYjnijxez
	 GFYHkEt5GIbUVCoI4dPAuXUoU25poKxx3rxASsZcg6bp7MC6F+eJEJUwLbm+T1Oqukw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuEuwjrk;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1630C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuEuwjrk
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-156cbe59622so1286171c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901061; x=1793505861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQs/9/+ieViMtOkwrXjmCA1Fgb4ppa6TVTluwiw88qI=;
        b=ZuEuwjrkFboCQLGl7BO2g51vb3rO2T1Zq3HL+L1LrQF3k84K+22gz01pRvMt+zTJxV
         QLj00NAcQInG23OG0LnXkT+0JNGBlWdTvDOZYFtmAE10mrF0MRPo/VnWzTYBOkkc7zC9
         5UEPAePmilbPJZUKVmor0JbEDyEC8DNOm+7ejcDgJEJ5bg5KOisbWji+jXiT6KBk71XN
         c4xV0sVi9yvbLXChvhUBKDEam0m5AMjGV+0whDwCqrLhWT3CHDV0GDraYk4eHa2W5JEW
         8GczFoOp7CcbUxJ6PPG3JTreoi0qckGqavfgY/uvkl1kj3h0/wF7wKeNj/h3TmWcFTMC
         rk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901061; x=1793505861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQs/9/+ieViMtOkwrXjmCA1Fgb4ppa6TVTluwiw88qI=;
        b=NkNCtvbVEp7cfFoAjva5yG3O8IRBbvG4XwCHCVt8QTemw9PH+LeJzHzxBqcFvsbryF
         vUWQ4dbVVOulkw8Db10ijBC6JyZfOVmJkKgSlB8EKEq26S6PK8I/JsBWq8zriRIsBqiR
         BTPhaw7w3lqnP4SMCBwiozQ3N7er8rpWJIJpvWSpsshbCiUMEQogjbWt0Obx4LTUbuhF
         BmkaWmAI1o9lWdYQHtym7tZnuqA1RTDqZ0QAimCCBJ05jyOQCu63DQoKkJDzTwZXUrIZ
         Kk1EhFgRobVe2a2cVDrgqhnyjdPKC+XDABeaJIwU7KeQ2XyJ46UbkTWYI2nySqoEUgrT
         FMTg==
X-Forwarded-Encrypted: i=1; AKwUvBxl58sWpobvkMarDM4g2dZRDuYcFX+hSOMtOccSmfUtk2cC403STp2D1BOE/TwWJKly5XxpkQROibcCO1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnZT+skRUDnj4RAg+M7xxqNFiHJGku57fPM0uyWpOuf7+pNusK
	C6TJhiRCggSLTlhfzLvpQAXn7JW2816Cc88nbwLJlwfGO/gGLgKG7PE=
X-Gm-Gg: AYBFou1HnEbi/cfsf2sXRug4/jRUssVUudxQ8K47MM0XkpL3JBM4OH8YZ3OTxp717dk
	S8L1w2Cg9+CWz2cnOWWbNAXZKNQl6/bZZDljSMvwEMbIziz9/wJknvj+IapSFiXA/BlSinlAl/q
	LaG384K7hCd51f/ImhidBfBgj2k3dVqz2kCns2KwXEcv82J97V6ug30EFDqj0rwAOTBDnVyL6qC
	vg5jfp3kDTqKfLhHXAQRQhX2NJy8gBLokzB4kXoqSqkVbyz41+RLD8qww8HJoKjtWUEo+ZOqT6b
	OFQwI/VQQgq3Keb1KSgQ6MKLSCoANkcE2inULIRidDAbA6Rx0yzh4Xd5A09WVg3AYVliYpcwkvd
	TSrLuQkYe5uNgwxVjA0yyxgsuvNAoPIbpQYQ6ofyfhHR83Hx4REqmMT0Ah6pjJCt3hvx75mSO8n
	iOcTVYcWYaYq6kxBhn+lKdYP1+Daj5MnlUGCQgw58KPO3rJMhJcdwYvzkx/MslJa9TtOeZxUG2b
	TXdvoApFSJw/eJXtp/cjOh+Q0UwLUfyNf446fMoZGc8hzitTaAHKEsPRcWTaW5VoHdJQJ5eCl1R
	mVHDt9JtExycawyYe6xMY4YE4mBgK++ra7gu2BTmZIwb9pJBJE60ZzK+7+nrVS8sUGHYOuR3Xb+
	bTN1x05osVmw=
X-Received: by 2002:a05:7022:7e0a:b0:15b:afce:62c2 with SMTP id a92af1059eb24-19936e39a84mr5336469c88.41.1792901061085;
        Sat, 24 Oct 2026 21:04:21 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:04:20 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 13/13] drm/amd/display: Skip panel power savings on eDP links without a panel
Date: Sat, 24 Oct 2026 23:59:49 -0400
Message-ID: <20261025040046.1602-14-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Eikmeyer <dev@deq.rocks>

When GMUX routes the internal panel to the integrated GPU, the eDP link
of the AMD GPU has no sink. It still exposed panel_power_savings, and
tuned writes it on every switch between AC and battery. Each write sends
a hotplug event and the following connector probe runtime resumes the
GPU that GMUX had powered off. Only create the attribute when the link
has a panel.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 703d0617d..c8fbd2167 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -761,6 +761,9 @@ amdgpu_dm_should_create_sysfs(struct amdgpu_dm_connector *amdgpu_dm_connector)
 	if (amdgpu_dm_connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
 
+	if (!amdgpu_dm_connector->dc_link->edp_sink_present)
+		return false;
+
 	if (link->panel_type != PANEL_TYPE_LCD && !link->panel_config.cacp.cacp_supported)
 		return false;
 
-- 
2.55.0

