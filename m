Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D92581231
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156946; cv=none; b=n4zAjaoGZWVQhsnYGLM2U28gpVqe5YaTkB8V9hY792mA5gnmp27jnXrLIFGfjWomI0vZd8t15YK6SVfWKQpYI2LSyfaIRbiEc5bEjx+hXFtX7AVCD4HLMm55OYZW7/7q8xWX6/dapYEZDfJY7My2ZDP2LYkj8ddwwd7YgIsve1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156946; c=relaxed/simple;
	bh=uD52bJPhpeiC0HnAD8b4KYeZkjmZJSEsgs+e8UmUieM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fD56edgzimnkt7LuF+hx0P8D/hLVanvbZCchcH2qi4rlbWqYnLA4UjYJ/MM8FMJaubsyfC/FSLH50q9WIU14GrWg9SNt/pdCZoKkYaI9X0wSzsd/fdsFRMJca6FUUUp5Ys38TMrlrJyg3ydaI4rMrCgYucxuOa8CdA/t7Zs6koU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjaxwj+A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjaxwj+A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso14885015e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156932; x=1789761732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpWwiGaL36YcweuGSaJBrN203pu/dlOicI/VWEKjlnY=;
        b=Xjaxwj+AYcxsK4l130WwbJdNbjF04MQJNv37xnlH2b6CWwNQYdAKDoJxqcF4FcVmnh
         VcYjxKWmRSwxGazXWbWV0KcMvHBoJZUf2e3D+V5UOdQMYbb33+vNz/sS3Ads2oOtGTvG
         gfSd1sSQUWuORplqICELArq+UdNTUi3WguStbsvAQvsqnJm0g1N5lLMox0IVjSfbmE0l
         x3y5xIX83zLaGQzbprb4wULFrCsjyGSKTM1bx5C0xeZytkuE1CWBpTpIlBizLj64I0aL
         PjORKIPEE26Hx+AQkCB6lLlFMkwg086PVpqT7UjsWoIoOutYVjNPcBAlAvAeOzZscaUx
         jQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156932; x=1789761732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpWwiGaL36YcweuGSaJBrN203pu/dlOicI/VWEKjlnY=;
        b=fKr1y52AkT+Ayqr5o7dcsqUl0vTVx8ecgikgLhKrp9xnCDMUHuCl7AMv1mZapG2JVT
         +2DivJgGjzd7z6ZplySMY3iqKHoi87RMU8JdZBQ0jJKQ2by2k/f5NvhsteRZVVgZbe6M
         Z6TgSYIBvCWzpQmoQBEMuKsxJhj4fEQ9qoxmn4S4LJsMSPEKYC1VpBDzgT1W8Vlws81j
         kpiIO+krtmChV+AMHyZ+Tz78bJdJN0TV+ZDTeBUMaS43sx6Z7nmoU2m/+XX/HKh5DozR
         F5Zdmu70zGZ8hGmvdHvFkeTPbJHUz7Lp28iCAt6FA3TrynX5oJcnksQsQmg0I2DlsvWc
         bk3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxF0IKylwGRcxiLvkIsITDQKTVkF3F28ttpBtapq2+tdNkMcJUmmmY7DEQFzqQHyqzf48kBcgtXUN1cy/4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXZAosl97nGgR10OcfFef2RJvF90ft25hntw4uvTFzAIE9jqL7
	V3VPUTmgz1FSJLDMHUh+rOyabcabbo/HRbAnAUpUoZ8INXCHVB/+73pA
X-Gm-Gg: AYBFou0rcgo3fhtaJf9iF5WC86O+05WeL3AHOFgGlDHipdRL+LCLpPcU88j1LgBZ8Iy
	BI93RW3IaBimYUY/MEo1B+VN2sSN8m/+fGBJe8nx/3amIovSrNijvtzkkXF45ZgRnWlgSXDySV7
	GxoCcI8e2Q3xjlG22/dRpJ4o5+9KRUk3TbhAWMZdxu7YuC1T3Kz78uTLQWOz004K5oWpkE2VrPL
	H5CWqft2QpfdY0YeJf9PeEoHfH3LmYZQV6bGCeqA0a70VoeICJRdXp87RDRAmGrPAL+AZBwDwmV
	XQkT3ESf5ZTuaRewAKr0GNGyXEkx9lZbg3MvMLdv6McIJi8VK3hK1Mxc3hBPayoKLptBBLl11m2
	rYkJsr3yrwnMPAntK6IbFoQyrgUkqtK+os+ZJGPnisQKd/rbR5Dfe+7x42AGwUoSzGX9Q0y3Cfk
	mQc0VytLEStxiqRTrIQg1KVc2ZHof9CPYzILquHVodgUrIvB3TC/tZWdmkaxJBBRLbNAc/eU9Gl
	MdmGyAjed/JacE3CyQ+RxtKvw5F26kI1H5Sh4X0Tb9RsqtvX9XtB4h7fqYIzP+prekVH/c0WNdp
	opn3u7UfOGw9QH10Kr1Cv2FX/tb1ZwGxFj95
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49e6198f947mr76504605e9.12.1789156932186;
        Fri, 11 Sep 2026 13:02:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02c92sm28156515e9.2.2026.09.11.13.02.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 13:02:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/audio: Fix names that do not exist in kernel-doc comments
Date: Fri, 11 Sep 2026 22:00:53 +0200
Message-Id: <20260911200053.78731-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The audio component overview still refers to the former
i915_audio_component_ops and i915_audio_component_audio_ops struct
names. The generic audio component split renamed these types to
drm_audio_component_ops and drm_audio_component_audio_ops.

Update both references to match the current types.

Fixes: ae891abe7c2c ("drm/i915: Split audio component to a generic type")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index eae76e9611055ea684dd98c34889be2413a89f80..c703da26914c1d957dff61a0220b70d3275255ce 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -63,9 +63,9 @@
  * covered here.)
  *
  * The struct &i915_audio_component is used to interact between the graphics
- * and audio drivers. The struct &i915_audio_component_ops @ops in it is
+ * and audio drivers. The struct &drm_audio_component_ops @ops in it is
  * defined in graphics driver and called in audio driver. The
- * struct &i915_audio_component_audio_ops @audio_ops is called from i915 driver.
+ * struct &drm_audio_component_audio_ops @audio_ops is called from i915 driver.
  */
 
 struct intel_audio_funcs {
