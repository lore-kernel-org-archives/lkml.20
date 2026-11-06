Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=139.150.92.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943748;
	b=NNV6imdvQAzhRsiG26uvCXRZxbKnHaGZTLzOZaiC8KF/23o0VIbfcDiTHOJIDgKpIrdj
	 0KKrVOy493fX0OtJZMuS5wuZGQI4oCgZdh2R++3XMvs7+/py9bubsFRe/504usRPvj9LR
	 /y5uSlefKz2aQ2mQnqt23nfd6ARBjpfzHT7mNGBuj4BPnAZ4Mzh2k5vY8/3YlEkmaruWm
	 HL/Vl+dHyhfLUJ6THrN9tDeZxRLvK+ruM+0uf9wWucu+TtqAVJSlm73cKM2071HaTyyP0
	 khUDJchBJnS5SbUrv7AdbjkVPxlotqJeAIhluYGHYx75G36/xXPMnJ04+vihxmqW/2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943748;
	h=DMARC-Filter:Received:Received:Received:X-Authinfo:
	 X-Hiworks-Remote-IP:X-Hiworks-User:X-MailFrom-INFO:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WYUWoA0iFkf8R7y6PcCp1YoUjSs2DSIqbO0WIhc2r3o=;
	b=jl3aUk2jUEdulSP98twr7RyiUIXtXq8eW3wvp1ob2GUzcsdU0NvRKoi6QIEe8zB828SO
	 GzR/z4GvvvtSTxpJSfYpHwBNdzpCw0YmUM75WryI4MGkIvnlcdKcGHW0jentHT04PGrph
	 /rzP684fopFMAQehAlnSzQwAzklhyPLKRVz7d3B2Hqy5BrYfOXq/zHYh8tUFoWjbiksGO
	 Wfx7t45REETuMPtWJldOplR/KNEKicPEiKM0l+iD7ZK0sgvO7HgtQBAuiuEbisO/5axFy
	 hZxmLHPULCeHhJPcSct8kNrICyFG3W6mrkvFftDHgxx1lvEmnU727qugyITnmolt7GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nirvanahyj.com;
	spf=pass smtp.mailfrom=nirvanahyj.com;
	arc=none smtp.remote-ip=139.150.92.44
Received: from smtp92-44.hiworks.co.kr (smtp92-44.hiworks.co.kr [139.150.92.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE5606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABE5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nirvanahyj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nirvanahyj.com
Received: from hi-smtp-node1 (unknown [172.18.0.3])
	by smtp92-44.hiworks.co.kr (Postfix) with ESMTPS id 4jLSk927b7z3wtqZ
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:25 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.54])
	by hi-smtp-node1 (Postfix) with ESMTP id 4jLSk91l5xzQLZQV
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:25 +0900 (KST)
Received: from hi-total-node5 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node1 with ESMTP id 3hgxhs4s7ncuwbtp;
 	Fri, 06 Nov 2026 14:42:25 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <nirvanah@nirvanahyj.com|114.203.237.180|nirvanah@nirvanahyj.com|261106144225_0141351674>
X-Hiworks-Remote-IP: 114.203.237.180
X-Hiworks-User: (SASL_USER) nirvanah@nirvanahyj.com
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from localhost.localdomain (unknown [114.203.237.180])
	(Authenticated sender: nirvanah@nirvanahyj.com)
	by hi-total-node5 (Postfix) with ESMTPSA id 4jLSk76ghjzSqYcR;
	Fri,  6 Nov 2026 14:42:23 +0900 (KST)
From: Young-Jun Hong <nirvanah@nirvanahyj.com>
To: 
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/panfrost: let jobs opt in to all core groups
Date: Fri,  6 Nov 2026 14:41:51 +0900
Message-ID: <20261106054210.2893230-5-nirvanah@nirvanahyj.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
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

Mali-T628 MP6/MP8 (Exynos 5420/5422/5800) have two core groups, each with
its own L2 cache, and the caches are not coherent with each other.
panfrost powers only the first core group, so on Exynos 5422 four of the
six shader cores are used.

Power every core group and let a job ask for all of them with a new
requirement, PANFROST_JD_REQ_ALL_CORE_GROUPS. A job without it keeps
running on the first core group only, so existing userspace, which may
use global atomics or other cross-workgroup communication, is not
affected. Userspace sets the bit for jobs that need no memory coherence
between their work groups. Userspace finds out whether the kernel knows
the bit with a new parameter, DRM_PANFROST_PARAM_SUPPORTED_JD_REQS, which
returns the mask of job requirements the kernel accepts.

RFC: compile-tested on top of 7.4-rc1. The same logic, ported to the
6.12-based panfrost module of an ARTIK 10 (Exynos 5422), was tested on
the board with the matching Mesa change: jobs without the requirement
ran on the first core group only (a compute kernel without atomics was
as fast as one with them), jobs that set it used all six cores (1.43x
faster than the first group alone), and the OpenCL atomics tests passed.
Global atomics from work groups on both core groups lose 25-50 % of the
updates, which is why the default stays on the first group. Open
question: whether powering the second group should depend on a
userspace opt-in as well (power). The Mesa side is posted as a draft
merge request:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45971

The analysis, the code and this changelog were produced with Claude
Code (Anthropic), a coding assistant.

Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  7 ++++++-
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 23 +++++++++++------------
 drivers/gpu/drm/panfrost/panfrost_gpu.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c |  8 +++++---
 include/uapi/drm/panfrost_drm.h         | 10 ++++++++++
 5 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7c348a0bf1ee..1d979f394ef4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -27,7 +27,8 @@
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
 
-#define JOB_REQUIREMENTS (PANFROST_JD_REQ_FS | PANFROST_JD_REQ_CYCLE_COUNT)
+#define JOB_REQUIREMENTS (PANFROST_JD_REQ_FS | PANFROST_JD_REQ_CYCLE_COUNT | \
+			  PANFROST_JD_REQ_ALL_CORE_GROUPS)
 
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
@@ -114,6 +115,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 #endif
 		break;
 
+	case DRM_PANFROST_PARAM_SUPPORTED_JD_REQS:
+		param->value = JOB_REQUIREMENTS;
+		break;
+
 	case DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES:
 		param->value = BIT(PANFROST_JM_CTX_PRIORITY_LOW) |
 			       BIT(PANFROST_JM_CTX_PRIORITY_MEDIUM);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 420d224276a5..e880769dfd72 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -429,7 +429,8 @@ unsigned long long panfrost_timestamp_read(struct panfrost_device *pfdev)
 	return ((u64)hi << 32) | lo;
 }
 
-static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
+/* cores of the first core group: the cores a job uses by default */
+u64 panfrost_first_core_group_mask(struct panfrost_device *pfdev)
 {
 	u64 core_mask;
 
@@ -437,7 +438,6 @@ static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
 		return U64_MAX;
 
 	/*
-	 * Only support one core group now.
 	 * ~(l2_present - 1) unsets all bits in l2_present except
 	 * the bottom bit. (l2_present - 2) has all the bits in
 	 * the first core group set. AND them together to generate
@@ -445,39 +445,38 @@ static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
 	 */
 	core_mask = ~(pfdev->features.l2_present - 1) &
 		     (pfdev->features.l2_present - 2);
-	dev_info_once(pfdev->base.dev, "using only 1st core group (%lu cores from %lu)\n",
+	dev_info_once(pfdev->base.dev, "jobs use the 1st core group (%lu cores from %lu) unless they ask for all\n",
 		      hweight64(core_mask),
 		      hweight64(pfdev->features.shader_present));
 
 	return core_mask;
 }
 
-/* cores that panfrost_gpu_power_on() powers */
+/* cores that panfrost_gpu_power_on() powers: all of them */
 u64 panfrost_powered_core_mask(struct panfrost_device *pfdev)
 {
-	return pfdev->features.shader_present & panfrost_get_core_mask(pfdev);
+	return pfdev->features.shader_present;
 }
 
 void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
 	u32 val;
-	u64 core_mask;
 
 	panfrost_gpu_init_quirks(pfdev);
-	core_mask = panfrost_get_core_mask(pfdev);
+	/* prints which cores jobs use by default */
+	panfrost_first_core_group_mask(pfdev);
 
-	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
+	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
-		val, val == (pfdev->features.l2_present & core_mask),
+		val, val == pfdev->features.l2_present,
 		10, 20000);
 	if (ret)
 		dev_err(pfdev->base.dev, "error powering up gpu L2");
 
-	gpu_write(pfdev, SHADER_PWRON_LO,
-		  pfdev->features.shader_present & core_mask);
+	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
-		val, val == (pfdev->features.shader_present & core_mask),
+		val, val == pfdev->features.shader_present,
 		10, 20000);
 	if (ret)
 		dev_err(pfdev->base.dev, "error powering up gpu shader");
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 78a6270b7fcb..5c6364e4229a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -14,6 +14,7 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
 
 int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 u64 panfrost_powered_core_mask(struct panfrost_device *pfdev);
+u64 panfrost_first_core_group_mask(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 33da86587db7..65634202fd82 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -139,11 +139,13 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
 	u64 affinity;
 
 	/*
-	 * Use all cores for now.
-	 * Eventually we may need to support tiler only jobs and h/w with
-	 * multiple (2) coherent core groups
+	 * The L2 caches of the core groups are not coherent with each other:
+	 * only a job that asks for it runs on more than the first core group.
+	 * Eventually we may need to support tiler only jobs.
 	 */
 	affinity = panfrost_powered_core_mask(pfdev);
+	if (!(requirements & PANFROST_JD_REQ_ALL_CORE_GROUPS))
+		affinity &= panfrost_first_core_group_mask(pfdev);
 
 	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
 	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 7831c48c59c0..e61212494c4a 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -51,6 +51,15 @@ extern "C" {
 
 #define PANFROST_JD_REQ_FS (1 << 0)
 #define PANFROST_JD_REQ_CYCLE_COUNT (1 << 1)
+/*
+ * The job may run on the shader cores of every core group. On GPUs with
+ * more than one L2 cache (Mali-T628 MP6/MP8) the caches of the core groups
+ * are not coherent with each other, so a job runs on the first core group
+ * only, unless it sets this because its work groups do not need memory
+ * coherence between each other (no global atomics, no cross-workgroup
+ * communication). Ignored on GPUs with one core group.
+ */
+#define PANFROST_JD_REQ_ALL_CORE_GROUPS (1 << 2)
 /**
  * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
  * engine.
@@ -236,6 +245,7 @@ enum drm_panfrost_param {
 	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
 	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
 	DRM_PANFROST_PARAM_SELECTED_COHERENCY,
+	DRM_PANFROST_PARAM_SUPPORTED_JD_REQS,
 };
 
 enum drm_panfrost_gpu_coherency {
-- 
2.47.3

