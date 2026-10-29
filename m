Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281702;
	b=fdAGfJs0ZOZRXyEse+TisKbWkX/hBf/AXJfK9Q0RZkGhayI6HLIVZbEn3Wv6BzbiPiHY
	 rr7C0RYzna1ZE5T4sPPcZpEjU7W3GNAdmLpsAowauyRF2ggqV5UmMfY4L/2vfL1xYzSdD
	 6FOWGusgE31u6H2eAn5YNg6fVCFsIP8W21JBveK+wO2z02x4oPHJUM4kDe/DJJYmihb9a
	 Lqp/vPd/Z9w8cH95/Gy7/eawcejWO9/gfKoFB1I/KU1u4/hYvFdSrXR30gl4mGTkEZuBD
	 38T0Hc+hig/Lcrh+eYzittlsEX5CIeeWVRYqcIDkpUov5xL22N1limg6R56Vh+/fqDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZ/vad9IsSdNkgTxCuZTyRICFik/6Xp9Vhh6TPx5p/4=;
	b=2KKrw+l10SPlXKptwJztor7hLfGoayVP+mYxuA5XArXxBbcbZYi0pei0JDdp8rc8+DQU
	 Vwj6zmKerQ+I6MnfXW3NMALRgA7c81XB7keRP8u8YLSviC5aqLPGb2a/PjjYWP1ZJv172
	 ByOcHfZIbbfd7f0+CqcwBzosG/XVDsaCVZxkBBwuliLLTLH1Js4cSdq889w41AZtNuqDG
	 DPDFR0v1QnpnFkADlJSR5gYGUxu8x6aQp8Fn525z+FQtzACPls0ItT+PoIvzzRbrGKTty
	 Q/c1YwqrMWO9vzEQR8bSk9sP5M2RB5sSJ7fOhoX4JbtcqinLDm/k/jH+WpdFc3WvPKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jh8mqqX3;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC4A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jh8mqqX3
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1098814b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281702; x=1793886502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ/vad9IsSdNkgTxCuZTyRICFik/6Xp9Vhh6TPx5p/4=;
        b=Jh8mqqX34qiCPK91ZPzdXZBX/dOudyqlszhjv9Ry1Ugq014jQSAw57u9vloIVIPiry
         ARjxxhl2HwQVmklhGwghpg7MZQ2mJ3WohFxiTN+9JvpzQEtMlIhVgbPKWqteXHKozIPn
         UUV8LKJ0jnOvRP+QdmGhmhGk8rbPQOZKW/irRA8qkeNCTnzHX1JDVPFhsdW1mWDLJRU6
         VgfY/EMXFEKOcFBq8PRAPEn5u1paTyRhLiVGYFisqb0HqJGcurczRl6x/nEjao6eG1Bq
         t6/hqEbjAWSWhXCKFy0eAxcCGH5O2cZpSgHtzOi28vgks5m9ZoLgn+w5HunkMLEakTMb
         e6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281702; x=1793886502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZ/vad9IsSdNkgTxCuZTyRICFik/6Xp9Vhh6TPx5p/4=;
        b=Qg1qm2L9SYTThtnXEFEl3f3IRVUJz7ZQ4Y4cumRflYKzJJ2IQgPeNzDNj+MqZJ1NJo
         rnj3lXwFOjxIiSVdkk3pTOFnu+4MwKvIf4quoX9B2gZj2+OOQnPOYo+LjWnw9fiZv/Il
         hLuCG7x1HIRiN2+0Eme5bCTVfdPvCR5OCFAIv4mrije8mRY4aIbpuPRmMIXkP+oqswr8
         gbpvsiea1s2ldX8G947O0TZOYkV9nv5EaKrZeBxRckc7J231sJwIdADYcR/FAgFdeflc
         A9O7wpAfQtuxfjEGjgVNnDyTTGylP5UDeE7Z0yco0FgH1eJZJT+qpH2mv3euaxl7htQJ
         lGQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNwzFTC2zf2oiZlK/wV0vD6SyGWW1Fg3igzCgayRW/rYGmxXMhO50WY4d3/K9OagoBgA9Ae3TDy22QOvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV/BjGtmznp1exQdKlzGP18tkZx2Kyr/DKh365mr5AuvXtxfxd
	YxLW796IPqK2rHVhmeRn8SAXnQfe+JIuZpZJK6XKpi+6EMSIM4yC5YjR
X-Gm-Gg: AYBFou0tuXaNNhdHJEbRO1tkQbrF7DESryYCt7McFnUmwClmeyelyFNMkxSRlPFNcBu
	w+1c15gAdmnos7kdPqUWYawN1owDN2HR8Mnh0Pf5B+S6cRJp+S3Ztqh19pFCZhptyYBAP4dyOGd
	nvWdfGVPxDGxzqsd+Djn+mFkpApJWN1Cm+SNMPLjZxipIDUflGP/HPOJWtS8AA73AzIdtHKcOBw
	7wJd8AoG3I4/KBWg96BTER5F0fS57rxOUFqyeCMv21JeBwAXRdeK/03EPUtljA27zgh1GuRBxMO
	J4TCzFC70j85oBQq+EDaDn6s1P5mq3isauNoKqpmVaLzAa+QT4V8m6TL1MdrRBJO9ZF/l2ABJkG
	dLw4l6WOCTD0UKAYGNFvGkdNWCFnwUufKFaCyyIJyn9XkjUz2k7WmQw/1Clal1mVZyjYZoPE/oM
	HrOvPNXoD8TllWrLDOulzUAISTok9vsQuFtYnVWGjpQxWwRs9NM+jYQ+lZjxNCpBbp12x2khPyv
	uuCOyVb01pGEfOyqzuhrz1ySCiOC3Qqf/6BJK0G4qHOlhkvj39N0v2hC7V4tcdqpt8483qhSdmy
	HeQj1d9Qjgm0XrZpg7zQ1dLKObAVA2gSHSJnIJhe5fZkFrj9GoK4JMNeI02ZPoSd/2TcYABGdqB
	lHiOdrv+y
X-Received: by 2002:a05:6a00:4b54:b0:8a0:3172:bd86 with SMTP id d2e1a72fcca58-8a6e6536e02mr4691471b3a.14.1793281701838;
        Thu, 29 Oct 2026 06:48:21 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:ab4c:c3be:c4b6:67cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5baf4sm2455023b3a.1.2026.10.29.06.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:21 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/8] wifi: rt2x00: start the link tuner when an interface is added
Date: Thu, 29 Oct 2026 21:47:42 +0800
Message-ID: <20261029134752.1299130-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029134752.1299130-1-hjf3108@gmail.com>
References: <20261029134752.1299130-1-hjf3108@gmail.com>
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

rt2x00lib_start() enables the radio before mac80211 adds the first
interface, so rt2x00link_start_tuner(), called from
rt2x00lib_enable_radio(), finds no station or AP interface and returns.

Start the link tuner again when an interface is added.

Fixes: d96324703ffa ("rt2x00: merge agc and vco works with link tuner")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
index 3bc0c1c906c91..d9e323ccc6d62 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
@@ -264,6 +264,12 @@ int rt2x00mac_add_interface(struct ieee80211_hw *hw,
 	 */
 	rt2x00dev->packet_filter = 0;
 
+	/*
+	 * Start the link tuner again if the radio is enabled before the
+	 * first interface is added.
+	 */
+	rt2x00link_start_tuner(rt2x00dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rt2x00mac_add_interface);
-- 
2.53.0

