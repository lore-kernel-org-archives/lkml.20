Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8B2D3733
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919861; cv=none; b=kIcVNUhg9yKLssBc2Tc+qArshk7v1TpsFhdfgNeFgZ6nn6ICFOH7lPm7jUPlmTHtl7brFl3rySzTAPmmeOA5qpcfWflTTITkSeROmgWWP78rL3dOz8N4hI9QsGnHsrs/gUT48mPm7VjdSKvQfSksMuwQmSAIy52+2YqZuqU1qo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919861; c=relaxed/simple;
	bh=5WpW4rJE+HLmQU+7JYIpeg24goctztlY2VOFMb+1OaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VgpqrabhYtGTVIhuAXSi0bz4zNnYI9J5kjvytPYAcOahvvzBvh5o5AosPOZgVv0HuT3yuILqZH45TuLvQccNfndw6rG2cZT7XfRKm2/WGJdJVZYDpCqUGtWZBvE0/GbuqwqduLRTHzkYSiJkZ5xVZWKZkFmyVcxc+PrGF0ZA8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lHdsdrik; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lHdsdrik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ei
	SPbtL4WXdi7foDTth7zJdSvX8T7Vd7rf22G0sMXG8=; b=lHdsdrikcvJBPf1P0P
	hvLuWzgWe5ou0MIIt0FMLzfhidSF9qL/NWd3uoCr+u4KW63ghIlWWYQ/wNDWLF5r
	NCe5RMA4OGkqwUKjYR4ezi59DFA+jsefm1yIBhKk+QjH5SxfjwsE+yNw+LLxEcfL
	aodKT31oS0tdx3FZWHzIHmneI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wA3bs3_v6Bqb+QJBg--.61872S2;
	Wed, 09 Sep 2026 10:10:07 +0800 (CST)
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
Subject: [PATCH] drm/vkms: Fix gamma_lut size check
Date: Wed,  9 Sep 2026 10:10:06 +0800
Message-Id: <20260909021006.105304-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3bs3_v6Bqb+QJBg--.61872S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUJF48GFWDGF1kWF4DJwb_yoW8JFyrpF
	W7Gr9YvrWYq3WUKwnFyFs7Cay3JwnIqFWxWFyjka45urZ5Kr1UJas8ArWjv398Jw47Za4I
	qF98tFy3Xw1j9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v-UUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4R-xAWqgv-+iBQAA3j

From: Shixiong Ou <oushixiong@kylinos.cn>

The gamma_lut size check in vkms_atomic_check() uses
sizeof(struct drm_color_lut *) instead of sizeof(struct drm_color_lut).
On 64-bit both happen to be 8 bytes, so the check works by accident.
On 32-bit sizeof(pointer) is 4 bytes while sizeof(struct drm_color_lut)
is 8 bytes, which would incorrectly reject valid 256-entry LUTs.

Fixes: db1f254f2cfa ("drm/vkms: Add support to 1D gamma LUT")

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5a640b531d88..2db3971f72c3 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -112,7 +112,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_commit *s
 		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
 			continue;
 
-		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
+		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut)
 		    > VKMS_LUT_SIZE)
 			return -EINVAL;
 	}
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

