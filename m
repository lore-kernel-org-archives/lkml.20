Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E7D3246ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169496; cv=none; b=cTwG8Xl5YID9yG0D/JQwbTKEkQi7uA4dWAD1bjIMj4wjWcxzmoicGBe62VBzXc+mgFMviV/M4jySNuW+awfqdRpVujRTFN92fBvNRE7J/Jk5FCiXI4QqGAcExgWR2KsP3HZCuaBaYYKiD0ElkALz161XfD7IbcpZTa9sYhAHLh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169496; c=relaxed/simple;
	bh=HAa0TEXydOHgMfafBsDr+x6HKG9INzGOAMdWGMZFkrY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ElMCNGRjhdpN8QddNYANl5HVxf4GodbGk3e9CCaU5n3rpQ4EqgJnZfazIdhDDCOwxrX5RiO4MqspkLmIGeK8TZz+RL0RpJ90ZB4+EnV2kbTmVdF0Qk5hzaFttvuLxrO1h5yZnUZLOqvd/M0CRQrt9xkL/Y1brpO7GQlkRS2ZAys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5wSUjjx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5wSUjjx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so7548465e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789169493; x=1789774293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2M0oCDpR78/TpqPTtQy9t/cWrQ5LXXH52OEtpZSn+ww=;
        b=U5wSUjjxxX3Z36A8LqVLWJU/sQl2BzzhfV7a1G50RJfnGFLwYCKQOuSeAOzE3jKP/D
         GfkwfYqw71vdr0u6ETcmkw/6rIFgXAvVMBRTGLHh/wYMsRrcBkPbXuxq7xHx3SXA71+0
         zH+vSDxZk8g9ao9t6D/wBwEyLhcqfn1tiiC4dyJ+ZpZlxNh8PRuoHL4NiVQuB/wq9CEY
         L7MA/lq+IPNQcytgGHVVz9oCX9K37fUSPR9Vf9F7u8r9IaUBSoT8b4DIPpdsPTkNEPV2
         bWx0t1IncPl/P1/LC2Ew+vbG+dlJaj/vOJzNW6ErmN4NlJ/LjSyLwAr14TnjhjzpvwIu
         KtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169493; x=1789774293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2M0oCDpR78/TpqPTtQy9t/cWrQ5LXXH52OEtpZSn+ww=;
        b=YAgN8/V08DUNJ0l25BwjpcE+yQMVcVv5zkZGS4eKGagsz66cKIcDjmm+xcbYphSHBL
         BhD+ND5OlTgEPbUEX7WG57gErdd2LOegkWa+uOlwmDB5z+ZvFX/FSHI/4aEl7H2aAE9T
         8D5r38SxC16dmgC7eWxuXkbwyhbwn9iwUvVEsk6oOrydWH8CI1ee0T1NoMViOB1Ns/Tb
         lUQ+efn+Dtvu1thyi8FtDrWlCFGQjjVcpuXArhMdm84kKQTXeN1iNaIWWxzJWBkRUljE
         QOV+KLKD2aa8bIJ6viu5x6icHRjxcfi2IMTXGCaLHNa/3rIVmmQoIHbS7VNnNXeo2sUf
         frQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZiUrHV1Md9o9HK2xfykfEchAXO7Hq/+HRAK7UjNJ2T/Yvpwv4OXNHD4UF8zvVkxJU0QXbsO7Raq+bHtI=@vger.kernel.org
X-Gm-Message-State: AFuF++mmA74ZQDo9ZtyRep6QyBfZNQs3zzEHUuWNNQdbQfmtjoE1N12j
	CA/Yu/FO+qqTCTO1o9zz9bppeAZpkLjd07F2aGnW0Vuxi4sP6LHnymwF
X-Gm-Gg: AYBFou04nX4tSFVQbPa7KL4WtQT1c062GMvG9A04GR+UR0OjBZQ4Mfym7oDR5YxuBXB
	+BnU2wD7NjOfWTksIJX5G4Kqa7ZR36eVqskQvmlOULHRW+EOlNQsdXpl8DNx9YRWxfDgbuFahJV
	AKF4zWR5KN0a1vZLeawsQhmtQYAh0R6ClLK5BEG2RGJ+LKj6GzvhsysXqJ44OEQuov58IAooLnn
	VkAsqTEO9GxvbW7aTST+9KzuCjVpvbso+anKa+bksR31OP372gwE7gjcfOv8p3b7LEBiAY162zN
	yPDFVCGXDtgdb0HoJS+jhs4lRned1c2ZdfQtUor5dJfmjM3Fg7YqYk908H4t022EqxUtLvi4/H9
	4Z8GI5xfaf9hd+tS6KbgDFgvIPpipMEL3Dl4xh1FdqJUlfxQgudWDfGlF/44RGI6onMcDlCSbt4
	29j95RoVJlybpUykRfRDXnpuzwJ5OLVnTUiV8F/z1UlZo1dobAt4nP5DkZPnDgKnpfElI842R1K
	9BCHe2lngowD3fFQpyjCaw9nl04Z7Z5j14Kn/xxxN35qwgk/DZqWiRTBJcZYqjkTzFNpC1lXgKE
	Whcji7KlB6GoSS3nmZJaUf9QQ//Rtx/lhM4I
X-Received: by 2002:a05:600c:3584:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-49d26d7f8a2mr181278145e9.7.1789169492807;
        Fri, 11 Sep 2026 16:31:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm9650804f8f.13.2026.09.11.16.31.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:31:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: uapi: Fix C3 ISP type references in kernel-doc
Date: Sat, 12 Sep 2026 01:30:11 +0200
Message-Id: <20260911233011.30951-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C3 ISP UAPI comments use singular names for the AWB, AE, and AF tap
point enums, and misspell the parameter block header struct. The
corresponding definitions already used the correct names when these
comments were introduced.

Refer to c3_isp_params_awb_tap_points, c3_isp_params_ae_tap_points,
c3_isp_params_af_tap_points, and c3_isp_params_block_header.

Fixes: 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index 92db5dcdda181cb31665e230cc56b443fa37a0be..fc70b3124ccacff635a7d9c0135d4e3821ba1a33 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -247,7 +247,7 @@ enum c3_isp_params_awb_tap_points {
  * from :c:type:`c3_isp_params_block_type`
  *
  * @header: the C3 ISP parameters block header
- * @tap_point: the tap point from enum c3_isp_params_awb_tap_point
+ * @tap_point: the tap point from enum c3_isp_params_awb_tap_points
  * @satur_vald: AWB statistic over saturation control
  *		value: 0: disable, 1: enable
  * @horiz_zones_num: active number of hotizontal zones [0..32]
@@ -305,7 +305,7 @@ enum c3_isp_params_ae_tap_points {
  * @header: the C3 ISP parameters block header
  * @horiz_zones_num: active number of horizontal zones [0..17]
  * @vert_zones_num: active number of vertical zones [0..15]
- * @tap_point: the tap point from enum c3_isp_params_ae_tap_point
+ * @tap_point: the tap point from enum c3_isp_params_ae_tap_points
  * @zone_weight: array of weights for AE statistics zones [0..15]
  * @horiz_coord: the horizontal coordinate of points on the diagonal [0..2888]
  * @vert_coord: the vertical coordinate of points on the diagonal [0..2240]
@@ -342,7 +342,7 @@ enum c3_isp_params_af_tap_points {
  * from :c:type:`c3_isp_params_block_type`
  *
  * @header: the C3 ISP parameters block header
- * @tap_point: the tap point from enum c3_isp_params_af_tap_point
+ * @tap_point: the tap point from enum c3_isp_params_af_tap_points
  * @horiz_zones_num: active number of hotizontal zones [0..17]
  * @vert_zones_num: active number of vertical zones [0..15]
  * @reserved: applications must zero this array
@@ -487,7 +487,7 @@ struct c3_isp_params_blc {
  *	| | | b_gain = ...;                                               | | |
  *	| | | gb_gain = ...;                                              | | |
  *	| | +------------------ struct c3_isp_params_awb_config ----------+ | |
- *	| | | +---------- struct c3_isp_param_block_header header ------+ | | |
+ *	| | | +---------- struct c3_isp_params_block_header header -----+ | | |
  *	| | | | type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;                  | | | |
  *	| | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
  *	| | | | size = sizeof(struct c3_isp_params_awb_config)          | | | |
-- 
2.39.5 (Apple Git-154)

