Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792927941;
	b=grQQ96MDBirwHIJ4aqUkAiUcrol4HXevggJ9rM1XtIA0+pBkNMcXYhmPLLqdcHYB0QZv
	 f0aiqkx5Mb4mEU8Is2jVYmtx7x0uCxsqH/4DhI8KPpnUO+VjO1tEQptUN0yKQb0Rflio0
	 sIJBmBvQ8NTthwO0SsFFvyLPUkxROYDZy8X9n7QeSn/PeePTQSspU0OBj9ESm/CZpsMAi
	 r/SZHJ08HGbzGXPl7y6sP77zre1w2XX/aIlNc6Ryxf6mtqKwpVWW6zr6ziJk3CKK3NF31
	 VohpOzVHBeHBMLYKple/cAKjKiakzwumu/78kD/aolJX5LRCnC0XMpqFNpEURJzlcdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792927941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KwZRNYaRjnJQ3q//ESU6BdTNHHFJgWcA5paXgJ8+8F4=;
	b=ekLmwb/ZxHoFG3l1lCx5hvBvGq8hz+WylNAEqT+aQKsNwo5AR2L1CYACL8Y9z/b+gd/Z
	 ybZvsrBkqqlcRgd18/YPugiIJfh0sd3BVT0Ut6J7bdYOxHf3Vk3Lyr8zUMkqLs9QNWqZt
	 0EAxzz8nrlxpTjXIR12McW1D4vNxktiSICLAS9WBmgF2I/OEqpGf7pXuX3RwsqbMTLiWu
	 6hiSTSl8+XG4kNMxDzy6vuHNmcJxVVROa0k/hlidfd92NxD321GVBpZjx64oSVyaauPyD
	 megl0rvVg/amUzvccStohKx4FQwOvha7KOi8/LV7bZ6bOin7jTPWS2C6FjL/WNKzI/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hhxuT2uE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4782D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hhxuT2uE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so1219295e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792927939; x=1793532739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwZRNYaRjnJQ3q//ESU6BdTNHHFJgWcA5paXgJ8+8F4=;
        b=hhxuT2uEeS5IQ0D8KAgBh8xDw3JWJFU3t1J25xFxVOF+tbwlyBCbLzZKX4uriae7N0
         szHLlXfCBfZa5G74prgSp+gXjzOUbvvKdAmfbIdDlq2yIrBQHtVlKVxY3bMY+uS4roQF
         qW+COnsP+uHpZt6UYeAbkHfgnNUPQVt92gw9tkeQdZVI8f+TX1d68zCpd+jZqzWlFjfr
         gHlWl5gqcdRagWWXa7P//eKTRkWS6ctCZqilW3ndX8fv6o4QQRL4iIeLCMhKfeAdVJSs
         z+2SFbe5tAwv+dZk7FiKeqt7y0AqhChyXmwivKr95zehu2HYHTiftCd1ARKxrrTghyF6
         u4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792927939; x=1793532739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwZRNYaRjnJQ3q//ESU6BdTNHHFJgWcA5paXgJ8+8F4=;
        b=ZZxJb53XQ9DbVOpMvE1jbrOVF2eQTETRnyHSXZLKb07Q07bKatYcTkvZ0xSK+vETTc
         f1ffGoAHW+3/CTt6Kuh8YbNZUeDqTDVge0JwNfs4EV/lFQbyaT2WSq02PvPSZeRC5GXs
         9D8M6yTbb9WyOeqTJmfzMVkl1eL7NUXuVU5PgsygD2oFF/+ogN0DkUpXnD6KrqxTUebP
         ZNCq7Ae1Arned0QkaYXfuwf8yBpo7RftmV3GEivy+gDt7OzZLPww6vyRcT2HxPpCeXNV
         x1doxfPVo4pzvqL9lpj4odPiZgyH/FnnRlTnNj7y/fZeKx7EQsMjUk7wsxtUVyZr5Ez7
         NCyA==
X-Forwarded-Encrypted: i=1; AKwUvBz0ZXZjAZ92/17AE4D2Ur+oNFhZxOeH7e1DeTnkSbB+vGI6iFAUorztr6pU+RyJyoP1hKCSdDNymfs5hPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3SGw08ZYVyWMrekLTFrIlVY+lc1M+cq6WVTosUYMxRI5xPH1V
	tbY673PW0Cx8xwULgM5dbsqtDMzYfrOFIT6p/HrfQWvItc6IJctcG8M2
X-Gm-Gg: AYBFou3+NnE3Ja7YeTlLFw0SwPT3ruEPkhnxoN463U0dNaKBxwIOISE549xBYb/N8Jf
	Bq1YDSFBm1Zeb5j4OHBqvsFyLglclFAJ4Gj7CsaM+6cQLk6TWru2p2cgpWqWL3CQCJXHdBQUJ/W
	l5hg9R9luKVh9Yg5Alg/rPspZ0lzHuEMj8w+kETO1LipdR/UEb/XJxF4ujn3T5+ARPG4mmf88SS
	L7kQs/I2bodPi0NEM11bUUSEHj+A1p3/LBYzhUl7PC3eCoBQuGT5DK7w6BjpoY+IaUmYscsEFE1
	XYUI8LpmACRFnoUBiMAyVDC9ApO/SPU6G/wTza3Dxg402oI9cVuabyrfPi7igO1kPa28PsJXv2o
	U8pdQVJHp5BXe2zx33gXqTrkHZVCGqZXW0gbMneMJTMm5lsd/Oj7ei2D4JDYQcIxqDNPL+M+8Cc
	QGD4C0NFGahn0vbKTxSZvqGEk+o2tidTDTQhy6HKg8UkgfG09ihf2UTa5th7eXiSOqnxpx7tIEL
	JYMi91HsyflykBfQQQoy9nwVL1sfwXeZLlGw8SqdEf61/+Un9nxYxkmTlV1v1JU
X-Received: by 2002:a05:600c:19c9:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a35ae90d8emr76649695e9.11.1792927939411;
        Sun, 25 Oct 2026 04:32:19 -0700 (PDT)
Received: from fedora ([2a02:587:85d4:400:553e:11c0:d5ab:5792])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm129609655e9.3.2026.10.25.04.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:32:18 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH] drm/i915/dp: Remove redundant link capabilities reset
Date: Sun, 25 Oct 2026 13:32:00 +0200
Message-ID: <20261025113200.25097-1-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
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

intel_dp_link_caps_update(reset=true) is already called prior to intel_dp_reset_link_params(), making the explicit call to intel_dp_link_caps_reset() redundant. Remove it as requested by the existing TODO comment to clean up the link parameter reset flow.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8c0d9381471..0e753824bc28 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3674,17 +3674,10 @@ void intel_dp_set_link_params(struct intel_dp *intel_dp,
 
 void intel_dp_reset_link_params(struct intel_dp *intel_dp)
 {
-	/*
-	 * TODO: Remove the following reset of link capabilities, as
-	 * this isn't needed after intel_dp_link_caps_update(reset=true)
-	 * was called.
-	 */
-	intel_dp_link_caps_reset(intel_dp->link.caps);
-	intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
-
-	intel_dp->link.mst_probed_lane_count = 0;
-	intel_dp->link.mst_probed_rate = 0;
-	intel_dp_link_training_reset(intel_dp->link.training);
+       intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
+       intel_dp->link.mst_probed_lane_count = 0;
+       intel_dp->link.mst_probed_rate = 0;
+       intel_dp_link_training_reset(intel_dp->link.training);
 }
 
 /* Enable backlight PWM and backlight PP control. */
-- 
2.56.0

