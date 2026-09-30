Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6F448B94
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751571; cv=none; b=S9MDVnUUuTpvTIrXojfsMkdhEWF8Rb+DwZ4hEXygc+CckaUixwyTO7CDUxj7scYrHXL+wsqtUA5M7uKRJHPN96mLlEG3iwvS++aoxhw9bFhnXG9hG12fwrIJDFAtE12vP3S3s8YpfGNHrM9499W/P80ikOHfdzElE/2MtHWFV1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751571; c=relaxed/simple;
	bh=t+ru+dXoc7YmwrVkOFBKYfit9x/psLRjtu6nAJCBRpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEK9coSENzecPIbsJijJUxh3kdp3OIaAvvWZKlEMC6KvtP+pkxLxMR845+1tMiBzcAL8eX2XECwUtw6bkXpBzLfZ3/TiD6h3yXbq8PCk9emJ6usMo70cxoRdZsFfeqpKn38k9Rvj4vK6sNxCaPrZ9AQjV8EB4Wo4ANaPRIeJpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD+w8GAk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD+w8GAk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so2941051a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751558; x=1791356358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnkiJ0/c9WOQ2H9znsdbaGBhfqk/SIJ50HBt6f4ERZ4=;
        b=aD+w8GAkL7/4DCFF3FQVGFCzDp94E4zZGRgdyjp0eqCLM7kS8/Rr/cjFqCCof5A39F
         3eokI+/8H1lRGnPU1jUy00NTJrHpO7mRkbQSHk3TpYSCQNrrgygqNKmDNeo1J6nxWcPD
         nEyjF5lAE+meikMJ5OifH1rrZ44Vvj8upk9JRpVeKylrybYrfXx15NUcYjHj8RQN+J7O
         WC2O1QHIW5DQWwl2SpJ/Fs9EnuLYBz4T254D64+45GWowfifWuUIQaif6k0Llj17IHiC
         wrlIQV9A4OoWzp75vCIReIUBU8vEHwQ1JYIAXPKiusXRzWWg7jkphv+tuKz/1TRRpbgj
         moHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751558; x=1791356358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnkiJ0/c9WOQ2H9znsdbaGBhfqk/SIJ50HBt6f4ERZ4=;
        b=ubW6fuWytt1wEqE7S5OMHeeoIurEFXFkWIYp3BLn2z8WsbXJ+bbJ0oZQ/PzYtf5spb
         jfAj30t2t4reyO/cvenjA4KXP6jOlbT4lE1PCJ1e1uIPXCK67DAWfp+xxR3jVvYhi0Wm
         dCP6TV6vaZUpZzYHPKD7L5RGH7kWSa7qKYllqHveizBSZpk5Jsq9WuJDikPbdxOiEXFs
         B3Xm5JM+MoqZ8uI+cNi5CIYSXQZtNuERuCJ6N9AtdrThyK++u8MKbjMeypt2PvIJOkSB
         Vq9Sd/fthsrIiK0MPeI3C/euZ9tITrkUb77FidsGPNsdR8vGoVO8Cph738oGc2cjF03n
         mN7g==
X-Forwarded-Encrypted: i=1; AKwUvBx4fZeRUM0JDS5vD/l3PLYhmajLAy8t5SeFbD4W0qX8KNckaiMNJP0Wq8QNLuE9rv4AckiV13pQINf+64Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2jj5slUEr5RQknpCO0Msu4qpRbGe8NujwZuDEByvxrj7t9ahV
	qNoEcElWsgvUTjA2fs3alV9tRplLOK4BzuxMGCgZicWp7PprcZ6OYgll
X-Gm-Gg: AYBFou1izXsquhuARU4o1kgQmNBnxyM7j1sOJf91ywrGS+ijmZlpHYBW/6ly3QVfXYi
	HngsqNMDS4c62Z8tGoQZIfNuxCgzkbkPlrj0upoaWuR0fCrPp3JZwNmyQLMrXSLv5JDIQnWIMuq
	e58vILKnMWWdWhrS4SXsnRoYBm7GKrZgkLNBZbPg/LfZW767EQ4as5Qkh9hJB6S3cqqgSQjKXj5
	pp2kaGH5Gj62GjpyNKmIgsBGQ6Gbu2lPbcl+Z58aNC4h/UUjDln7vieaUV2s1v1foQXgqK9tOUR
	fI4oV/H0JhZwcxs7/SXzvamjWdMslp6+Bv1HCag3Y7t03VPRuAiLgMu8/BST6p2tMfKGkoSZ/qv
	Ka0bPzEBY+ZZLi3ZLwJUi/zp4DGY2Ny3psbA77cwh8KzOsLNiscFs69Hz62PebkqnnfCx+FJp4j
	P54dM2vOkn35G1H1ORQh+oOe2ggfZ5cYYi+q8pWoL5v40Uxg5DnP6YInaOPYOpd2WyrwlI4NwRf
	028H7qtHlTA+Qc+JYILgyfknHbl+e031xkXIcxfwSoChGO83JmrT1P2Dyq7DCI4FHHVt2fsBjyZ
	0OF4B6LFbA==
X-Received: by 2002:a17:90b:5446:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3a4d197e168mr401773a91.13.1790751557599;
        Tue, 29 Sep 2026 23:59:17 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae9ffaesm2010442a91.16.2026.09.29.23.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:17 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 1/5] drm/gud: Fix probe failure on non-DMA devices by moving descriptor check
Date: Wed, 30 Sep 2026 06:59:10 +0000
Message-ID: <20260930065914.393939-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930065914.393939-1-benquike@gmail.com>
References: <20260930065914.393939-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gud_probe(), evaluating drm->mode_config.min_width before
drmm_mode_config_init() and before assigning fields from the display
descriptor causes the check to evaluate against 0, returning -EINVAL
and unconditionally failing driver probe on non-DMA USB display devices.

Move the display descriptor min/max width and height validation to after
drmm_mode_config_init() and field assignments.

Tested in QEMU against Linux 7.3.0-rc3 with a non-DMA USB GUD display
device: on the unfixed kernel gud_probe() evaluates zero-initialized
drm->mode_config fields before drmm_mode_config_init() and returns -EINVAL
(failing device initialization); whereas with this fix applied, gud_probe()
validates descriptor min/max bounds after initialization, allowing the
driver to probe cleanly.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 3a1b9e2a2eaa..f7826e3d849f 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -506,6 +506,12 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id
 	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
 	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
 	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
+
+	if (!drm->mode_config.min_width || !drm->mode_config.min_height ||
+	    drm->mode_config.max_width < drm->mode_config.min_width ||
+	    drm->mode_config.max_height < drm->mode_config.min_height)
+		return -EINVAL;
+
 	drm->mode_config.funcs = &gud_mode_config_funcs;
 	drm->mode_config.helper_private = &gud_mode_config_helpers;
 
