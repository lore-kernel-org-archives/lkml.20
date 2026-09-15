Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC82F7F01
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433676; cv=none; b=PYZxeFWAQW4r0C20oWS661iauSLQK58kGh5K+kwp0GJkrHTttDxOSqcOZLOQAhVvCZP+NE9giLB7GnylygPsGp9p4UFR1147EYwToPlS6gOasV/XdMXEDVUO8946NYhpa9ToOgHI+ArO80M/fB8EfBuEp1gGesCH9PnhIAlVfoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433676; c=relaxed/simple;
	bh=Rk79OCSjpLqM7xKXC5McH+MZ9ceE37B3OKV/MVARc0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdJ5Q8aiuLc/ZQ9PHsVcEMcWUtMKCM8iph2rOxKsHCbC6zyfOMQzEcf4R4MNszKYugRn2uR2Ioa+hVo7sSxCaShqHM+jyMIkv6MiBVy11e+Q0xNkUx6ZHLZxmf+yCQjw3JRSdsGT8+XUhszKi8O7UVvTY4qqanOEEsYv+oJeDJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/iuBmuj; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/iuBmuj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25331b31e8so52634466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789433673; x=1790038473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWZ4Y4zJql57aJqzMLFBZaa2Td+FuNKRPfVlv/bP7Sk=;
        b=g/iuBmujf7tDaxte4IEgEuQ5sfdnuLMvWcjOoxwy5dgd+RZ7RBWtW85lVclmPxYWbI
         s/gVr2DYFbdDpzSrNpKOA5+IlvwmU5mzCh2cUHtceYYA4QQd8FKOge03+CaaV6QEw31t
         oCN1GYFOGnLMFeti8oddI1kmsXzVbuj+9OUzjV/cdo+KdAcSK7l7QP8gSl4vl0YtXlgf
         Ppe/V8Pbsbng+LPwqkMBFI/EtIN0x89qqVK4vQZZo5K+vNwiXEGVbo2THwfBuZWbFb1n
         6Kj3CdEG6Hpb8zR8lAkCY6CagelHt/dM99MeTw0qQmUBrAaU5eN+0WAUgYZoGodMC7qg
         NmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789433673; x=1790038473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWZ4Y4zJql57aJqzMLFBZaa2Td+FuNKRPfVlv/bP7Sk=;
        b=Y/lxy3mH88mNR+3str/wOoU3CrvBA2kA20ig5LjYdziLDp9rio8lmwKDl+fXRk+Lsl
         CbLW/iAnrsrgJSJr+clX6oKVLAlpWL0kbwY7mQHGLdhSTYokXUgzC5HLHpqLvDjUOQJs
         0F9xO1snMQx1nypYfZ3ppzwj1/G08ZzEHnGGlzIJ5J50vpQcZQrKE5iDFxAThL92JAcD
         aRc+XL1a4H6x+X50nr4shKfQL9Ae+qmJ0KHB1wSJtEhCKNQ/luSQ5urBPhfSj8zzcn90
         AeXpg4lmqrb97rTqJ6H4Firr/a2ShKwzWkNvEkjUPP0fw6uu8j/IaQnWZOQE904CPFvN
         kYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2LBc0r6BHAg+QPmTazMUg3b2kwIxCoS2W3Mzn6I1QPR60hFJTQCxsVPKq30aoYi3iq6gXJN47OxdSefk=@vger.kernel.org
X-Gm-Message-State: AFuF++mBJQ4qtqSfQKbErhN51rPnO9lg88rA0+ACHEybWt4vANzeiMDL
	zOzFZ7AbWpBr9/GD1CONkEmIpkYu7caVsSPzrrmAvbKUDGU0B/dCkt8m
X-Gm-Gg: AYBFou05aPKOS8NjYHFoDufNMlLPfXclP/Kvvt7NnfPH3+jOmhIDTF41izlccn7j8EH
	+38lk3YJPvF5S2bidKbvX4kSfequX+1uNCjdJreEk1uFxtaT5s+yRkOKBozEza6kHaNKV8tmCyD
	RTBuR+pwEOVkiLejp7SIIf8grBwI2gfuuYq0T3f8MbaO4Zpp/lp3Pc5jSndrAIdTxocj6Q6SYHG
	8uNaMAZx4UhrMtFBbXO+rxl9bU4SIXBfsYloYF2+pckF03z8VSiB4YEZ0y3X5o91g4ZeoL1xpM1
	2SBsX8hUtSwV+T4Zt+ULTT7+MNAZIq+1q7iiL+XgSaA2zWQiJpBBT3HMOTRGmX73b/dkiiiQ8b1
	nza4voIri5K/jcuaYuZx6HHBrRmz8sj8/TPg8qt1YsImhKcAtJ6a/0ZRHP7LcjBLVV8MKvOSoCR
	01BoopORYA4zBn9hCJlndpLeHJtPYXonGyN8+MHJe3p2e3Y/T6zlO2d7C1O7gJZBDX/NbiNNpXj
	m+DCShhDVNKd61qIEQ=
X-Received: by 2002:a17:907:9491:b0:c20:c5f4:e19f with SMTP id a640c23a62f3a-c29b881e271mr346326166b.4.1789433672479;
        Mon, 14 Sep 2026 17:54:32 -0700 (PDT)
Received: from Nuel20.localdomain ([105.113.65.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead67sm501097966b.51.2026.09.14.17.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:54:32 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	alex.hung@amd.com,
	bhawanpreet.lakha@amd.com,
	Wayne.Lin@amd.com,
	ivan.lipski@amd.com,
	matthew.schwartz@linux.dev,
	Jerry.Zuo@amd.com,
	chiahsuan.chung@amd.com,
	emmaonana18@gmail.com,
	chen-yu.chen@amd.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] drm/amd/display: fix kernel-doc warnings for amdgpu_display_manager
Date: Tue, 15 Sep 2026 01:54:21 +0100
Message-ID: <20260915005421.20570-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scripts/kernel-doc reports missing and excess member descriptions
for struct amdgpu_display_manager:

  struct member 'power_module' not described
  struct member 'hdmi_frl_status_polling_wq' not described
  struct member 'hdmi_frl_status_polling_delay_ms' not described
  struct member 'boot_time_crc_info' not described
  Excess struct member 'dm_boot_time_crc_info' description

Add @power_module to the main struct doc, document
hdmi_frl_status_polling_wq/work/delay_ms with separate inline
comments, and rename @dm_boot_time_crc_info to @boot_time_crc_info
to match the actual member name.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 3524931451c8..61756c089fcc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -330,6 +330,7 @@ struct hpd_rx_irq_offload_work {
  * @backlight_link: Link on which to control backlight
  * @backlight_caps: Capabilities of the backlight device
  * @freesync_module: Module handling freesync calculations
+ * @power_module: Module handling power calculations
  * @hdcp_workqueue: AMDGPU content protection queue
  * @fw_dmcu: Reference to DMCU firmware
  * @dmcu_fw_version: Version of the DMCU firmware
@@ -716,16 +717,26 @@ struct amdgpu_display_manager {
 		char reply_data[0x40];  // Cannot include dmub_cmd here
 	} fused_io[8];
 	/**
-	 * @hdmi_frl_status_polling_work:
+	 * @hdmi_frl_status_polling_wq:
 	 *
 	 * workqueue for 200ms frl status polling
 	 */
 	struct workqueue_struct *hdmi_frl_status_polling_wq;
+	/**
+	 * @hdmi_frl_status_polling_work:
+	 *
+	 * Delayed work for 200ms HDMI FRL status polling.
+	 */
 	struct delayed_work hdmi_frl_status_polling_work;
+	/**
+	 * @hdmi_frl_status_polling_delay_ms:
+	 *
+	 * Delay, in milliseconds, between HDMI FRL status polls.
+	 */
 	unsigned int hdmi_frl_status_polling_delay_ms;
 
 	/**
-	 * @dm_boot_time_crc_info:
+	 * @boot_time_crc_info:
 	 *
 	 * Buffer info for the boot time crc.
 	 */
-- 
2.43.0

