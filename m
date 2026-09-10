Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E83D953A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033819; cv=none; b=H1w4CVKVzZ3+6OZUv2G6tdnnzJR124PdoBwyvJ67RlxOq9NS5w2/1pM39Vf4RZfAOsSnNSyrTOsszjhnMguBglGrrt8adMi1WPPlnNV0OyHbmg94Ki/I/iD/IdWz+67qEl9Qn/rScnm7aIUGF8L0F1G8jRrdjJT2mpPNzC6lVNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033819; c=relaxed/simple;
	bh=looLOMq8N4RwEab4qMIJDt+5yXeBvuONGAlbF67KCj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FE/5xNj/RZyDihp23uKKh+K00Oo2SLaa1Pm5SnnsmZPZ7mzZhf01hKD8D7h8SBQagliYI2gRIJOyhqwXp1j/8u1fxiZih19lzsDvgN9KlxfOs4NwnBvmmit6Og2d72ezo2pLS/Pj500Cz4xTwczis6fS/e1r7rorWxId7ZnNtic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.66])
	by APP-05 (Coremail) with SMTP id zQCowAAHdT9PfaJqKHzSBw--.25577S2;
	Thu, 10 Sep 2026 17:50:08 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 1/2] drm/verisilicon: add primary modifier for format tables
Date: Thu, 10 Sep 2026 17:49:59 +0800
Message-ID: <20260910095000.3505878-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHdT9PfaJqKHzSBw--.25577S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1fCryDGr1UGrW8ZryfCrg_yoW5Cw17pF
	47Aryq9F4rAa1YqFy7AayDKay3C3Z3Xa4Igr13C3sruFn8Kry5uFW3KF9IkF98tryxA347
	trnakrWUAFWjkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQZ2fUUU
	UU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Currently the format tables are only used for the primary plane.

Add primary modifiers to names related to the tables.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c          | 12 ++++++------
 drivers/gpu/drm/verisilicon/vs_hwdb.h          |  4 ++--
 drivers/gpu/drm/verisilicon/vs_primary_plane.c |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 2a0f7c59afa3a..56aa450443068 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -10,7 +10,7 @@
 #include "vs_dc_top_regs.h"
 #include "vs_hwdb.h"
 
-static const u32 vs_formats_array_no_yuv444[] = {
+static const u32 vs_primary_formats_array_no_yuv444[] = {
 	DRM_FORMAT_XRGB4444,
 	DRM_FORMAT_XBGR4444,
 	DRM_FORMAT_RGBX4444,
@@ -44,7 +44,7 @@ static const u32 vs_formats_array_no_yuv444[] = {
 	/* TODO: non-RGB formats */
 };
 
-static const u32 vs_formats_array_with_yuv444[] = {
+static const u32 vs_primary_formats_array_with_yuv444[] = {
 	DRM_FORMAT_XRGB4444,
 	DRM_FORMAT_XBGR4444,
 	DRM_FORMAT_RGBX4444,
@@ -79,13 +79,13 @@ static const u32 vs_formats_array_with_yuv444[] = {
 };
 
 static const struct vs_formats vs_formats_no_yuv444 = {
-	.array = vs_formats_array_no_yuv444,
-	.num = ARRAY_SIZE(vs_formats_array_no_yuv444)
+	.primary_array = vs_primary_formats_array_no_yuv444,
+	.primary_num = ARRAY_SIZE(vs_primary_formats_array_no_yuv444)
 };
 
 static const struct vs_formats vs_formats_with_yuv444 = {
-	.array = vs_formats_array_with_yuv444,
-	.num = ARRAY_SIZE(vs_formats_array_with_yuv444)
+	.primary_array = vs_primary_formats_array_with_yuv444,
+	.primary_num = ARRAY_SIZE(vs_primary_formats_array_with_yuv444)
 };
 
 static struct vs_chip_identity vs_chip_identities[] = {
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h b/drivers/gpu/drm/verisilicon/vs_hwdb.h
index 2065ecb730437..616076d931a57 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
@@ -10,8 +10,8 @@
 #include <linux/types.h>
 
 struct vs_formats {
-	const u32 *array;
-	unsigned int num;
+	const u32 *primary_array;
+	unsigned int primary_num;
 };
 
 struct vs_chip_identity {
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 1f2be41ae496c..8e94491693019 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -168,8 +168,8 @@ struct drm_plane *vs_primary_plane_init(struct drm_device *drm_dev, struct vs_dc
 
 	plane = drmm_universal_plane_alloc(drm_dev, struct drm_plane, dev, 0,
 					   &vs_primary_plane_funcs,
-					   dc->identity.formats->array,
-					   dc->identity.formats->num,
+					   dc->identity.formats->primary_array,
+					   dc->identity.formats->primary_num,
 					   NULL,
 					   DRM_PLANE_TYPE_PRIMARY,
 					   NULL);
-- 
2.52.0

