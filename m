Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D013D53C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919884; cv=none; b=Di9MT67ETiy/4fgMEgOT6f7jSz3OSVmZI24888It9Wd7YkRARvIgT/VDWWW1Zw34OK7zVrmyHN5pF62pO/ftz+gNKWpV9QjqScEsYmYdBivhd8KwZ0mscWkuqj/k/B+hj+XpgxRB9ofyQFyxjUHygL4VgusIrMI9dsVAh5Tbsvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919884; c=relaxed/simple;
	bh=a8cakg1yeDkjHbYo8Ktv25Z8VV1M1tAeE0U7JKEAwQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aqnqxj/Wl1urr0HDZlfvOT0iDugiKeFitirseQPT7F5P6sDlhqsN6KFj9bIK4PuyPxuPGsaoiPe7gHOY+jOgXgch8VHQjngFrWf8iJCWs+r3RlgWKV+G4YwVUOVT7coXbGZSFPSg1OKos1U3Kb2XhrvE+vO16WfLAREFsQJcYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GUtjE5gk; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GUtjE5gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Os
	29JjWfkxr7t/VcAOmRQsXtZJrkASAMJNjIK8EpuJI=; b=GUtjE5gkFGe+ASI6Or
	ZyeKaf5jYmAtIgYwteCz/mcJKcXKpu1qs625tp6Wz6ScS1TCjdb941ldz1HjyQvg
	0tZdlUrxM0J0KcjWjkAJqtMUf3KUlxlh10IEcLPUeUBV7vZB+oE1xGKqbxV4g0wa
	0iLqGiOZgBbEEDamZ4SFVX6Zk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXLCAHwKBqR+oJBg--.30561S2;
	Wed, 09 Sep 2026 10:10:15 +0800 (CST)
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
Subject: [PATCH] drm/vkms: Fix vertical read step for R1/R2/R4 formats
Date: Wed,  9 Sep 2026 10:10:14 +0800
Message-Id: <20260909021014.105512-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXLCAHwKBqR+oJBg--.30561S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy5Cw45KFy8uF1rWw1UAwb_yoW8Ww4rpF
	43Gryvqr4rtr4Fv3WIyay8Cry3uwsxWFW5trW7G34Ygr1F9ryUur95Kr9IkFWkKFn7CrnF
	qFs8Jr98Z3WUGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnzVbUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4Qj0BGqgwAijVwAA3v

From: Shixiong Ou <oushixiong@kylinos.cn>

get_block_step_bytes() returns pitches * block_w as the vertical step for
READ_TOP_TO_BOTTOM and READ_BOTTOM_TO_TOP, but consecutive rows are
pitches * block_h bytes apart (block_h is 1 for R1/R2/R4). Vertical reads
therefore sample every block_w-th row instead of every row, and walk past
the end of the framebuffer, when 90/270-rotating or reflecting R1/R2/R4
planes. Use the block height instead, matching packed_pixels_offset().

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index dfb8e13cba87..1e3a6af9cea5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -103,11 +103,11 @@ static int get_block_step_bytes(struct drm_framebuffer *fb, enum pixel_read_dire
 	case READ_RIGHT_TO_LEFT:
 		return -fb->format->char_per_block[plane_index];
 	case READ_TOP_TO_BOTTOM:
-		return (int)fb->pitches[plane_index] * drm_format_info_block_width(fb->format,
-										   plane_index);
-	case READ_BOTTOM_TO_TOP:
-		return -(int)fb->pitches[plane_index] * drm_format_info_block_width(fb->format,
+		return (int)fb->pitches[plane_index] * drm_format_info_block_height(fb->format,
 										    plane_index);
+	case READ_BOTTOM_TO_TOP:
+		return -(int)fb->pitches[plane_index] * drm_format_info_block_height(fb->format,
+										     plane_index);
 	}
 
 	return 0;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

