Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFB248F57
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919880; cv=none; b=fuK8VVEBNUBg8hdVuoUhZLqpUO7kEB1wMwY+yQPCRhbnoSIZuLrAzG9CmzwvKkIBDJ8CRX+jc7zcUGUqZ2Yfdr0d8FIMnaKJz/HHBP4hhXTgDyMICfEvYcODsnLch5pUiPxDzbrt+fig4fuKQNCIM4Ceh9cNlvjFnpgvopns71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919880; c=relaxed/simple;
	bh=vZZBoI02iPiSHJmdqbuanzefxahE3w5bjLgFkDSk7P0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=drYWlFwYKold5uDmPE8KDW4HXmwEw1/WM6TdqgoZvS4n8lL3DlgKuNDN/S/veumjFYrJ5iRjY8UP5s6kFKam39DgCa8+H+rRTLrH5KuPzC9OJEBqG8aJ3aKpmxXm3wWasgdNW2Ea2Y9c8PEjxComblnmIWwfkDH0UMICqI1/gmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H9ZhZ2yY; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H9ZhZ2yY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=so
	NLpp8eGs4CZ9R16t/lHqu4wFlI7zdkA2NCGVlyDoQ=; b=H9ZhZ2yYquxaikibZW
	l7SB4ZC0KwuqTOy+W+OO8YRQE40utfEn+AngdAkrkjLzfEa/huivjknuT/w9R6Sp
	Qkc+3GPPw0dnNPq2vrikgINXFEVenLDyT72rUAm7vOuPPB57NBG79BXX8U5DcmEr
	xavhtMIgSco9+Xan/aooLxcGg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3HwsWwKBqAGE5PQ--.31004S2;
	Wed, 09 Sep 2026 10:10:30 +0800 (CST)
From: oushixiong1025@163.com
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Leandro Ribeiro <leandro.ribeiro@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/vkms: Skip pre_blend_color_transform when pipeline is all bypassed
Date: Wed,  9 Sep 2026 10:10:28 +0800
Message-Id: <20260909021028.105837-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3HwsWwKBqAGE5PQ--.31004S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUAF17WrWrGF47Gry5XFb_yoW8AF45pF
	srJryYgF4UXrW8X343JrZ3u3yagwnYqayI9r9xG3sIvFn0y3sagas8Gry7ArW5JrWxuFyI
	gFs8Ar9rtw10kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnzVbUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4Rb3B2qgwBalSQAA33

From: Shixiong Ou <oushixiong@kylinos.cn>

pre_blend_color_transform() traverses the colorop pipeline and unpacks
each pixel into s32 for every line, even when all colorops are bypassed
or the pipeline is empty.  Add a line-level check to skip the entire
function in that case, avoiding per-pixel overhead.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index f3fb203946e8..1806c249da6f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -190,13 +190,29 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 	}
 }
 
+static bool pipeline_all_bypassed(struct drm_colorop *colorop)
+{
+	while (colorop) {
+		struct drm_colorop_state *colorop_state = colorop->state;
+
+		if (!colorop_state || !colorop_state->bypass)
+			return false;
+		colorop = colorop->next;
+	}
+	return true;
+}
+
 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
 				      struct line_buffer *output_buffer)
 {
+	struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
 	struct pixel_argb_s32 pixel;
 
+	if (!colorop || pipeline_all_bypassed(colorop))
+		return;
+
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
-		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
+		colorop = plane_state->base.base.color_pipeline;
 
 		/*
 		 * Some operations, such as applying a BT709 encoding matrix,
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

