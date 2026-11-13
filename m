Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556442;
	b=bg/bBwBDcv7eqgbZO+w6a+WhVq2u7qL01QidRRFQt1BwhG8o31lx+9wBxermaj6lRnVI
	 AWHOxY5n9z2TPnfPGAB8186yQ4gyzupdDSI8n40K+D6WRH2H185oaeLzuS/OmmGgYN6+I
	 jFTjiyRfxevcaPuh+Uc4qMCITm8fyiyDTFfh4kjVnQmx8fNiOhArcf4XZePigsW8V4DIz
	 clo/kNg0HIIPYeKfGRhBJ3Ayavas7roABtUeG+T3YVbi+Pii8An5qbSK+oicVDR0+6iUW
	 e3zbZBtWENIfYJOiPzxlx0qaF2vmJiPlgausyh1NlTH881Sw2KXYD2T6jkXW4IBnSyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
	b=WMluKUzC4PdD//9mydN2Bc6Bi8PPZjdU8YzoKIq9ndKj9VKbzQ13zNDT3SAiP01jfvMF
	 KFqeNxRhRJg4G44cF2xPN+ja8INHmmEgsTk9e3jkmoQo85FXAqJyUoVyguuJYxwq6uFJ5
	 56YJmfJnZzwgf/XI7m20fT/t60dmsw10q2DHYhspjVzF6LKAvLsRu2SdbtiSSRwXfPGSM
	 urkNrtYCkYV5+9aKucRHoXPsxhlLCs/V9HG22bQghlrDAsGPv31k6IvFGjzfz5XXJMwTf
	 xjfJcxVE0TS/Kq0qBb1RHOLOWK8iKI1cSH5DTjbrrAJ81/xk7ubb4leQvM4BnpwF8MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzoDpsmP;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC60606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC60606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzoDpsmP
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ea7987517aso7702765ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556441; x=1795161241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=kzoDpsmPq1DmlR/di9eXoEZUXV8AsNPrIeR0URbRK+CiTbd7Ay+Dq6HuKvSAG9cBm6
         icJQNs9eC3K+BnFluURbFBnZajQZGL/7woNxSi5G0RLcEdFYTw02gZhlLnjOjKmNRNfL
         cpcrtI83L/4BxKS9up7ObKjuqVa41vJ19Lcvlb9lrr0iBaW95ZmHRmNJTTNvWwO28+St
         F3xGe1gMsdEivSJK9pc71sTrsN/fJgkZClTfVlBS7zDGO14mM+8fxmg5YytDKI0cezq/
         I6/xnnw8FO/ByBLTwO/tkkjLzSpRdxLmCL2HVNmLntu1f3iTFeRYWQfrbtg6nxjcPdhE
         JkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556441; x=1795161241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=qkET56tBZlB1fNQd/5+55ZxU0n9EH/qf01JjEqKdSxUQ5km7BaIWTIMTbc2Hgk8hUZ
         fYUMl8owyJ+H9o63alBx/3CuL3BB0tTGChOjtRdcuJolZGkOwl5ljpNVAWE6+doXn2V2
         fDiMnJgg5AU7f342HvRDCZjYdJ534pTiQAIPzizbDqFbwUBW6r86OdMfoyyd9nbcntKP
         KbV5Uon+LBlPSbB66JS332gEooMTa92EfsQMP3m3Hx5lbzLp/R6Cj2Lx7Wic/9ehuZQz
         sq4KV+uSw3XjQuBqKucvEo1+O3/rQsCt8A24/zxltHMAgwZf4l5u4Dvh+J9Db3t6/k94
         pb2w==
X-Forwarded-Encrypted: i=1; AL+hErF6VqdsFxdtLjD8wGiZZLnnWQA0LCxCqqs1b1uM3zZk8nwIGc0jwqdHD+afIJkDU4O9M8FPkKIXLvvfKzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iq1BVzds2s1mdZk8CFJpkr5JDjg34181wrwbZ7aKi2pNWjhPv
	Qx1dAeGUAZ6p5x9kznP8kIC8pYI9/705hkvLizKBqQ5xfHmUilFeR9hR
X-Gm-Gg: AYBFou2lk/+Dqvj6zGdsXKqYVEX7nIRrAxU1nTmoNKBFJDWnxlPvB37eW75lhK0ULlJ
	a5unF9dtYFjjJVCxL7BVFZaSz14loDkI1JFkIdJbIfurjuyzfFKvADuQWTl7OtdSzAtbzitB2t1
	ooKIJPVX7Jp0skLgMOCHb+hXm0soB75qb4vlWUZmcIA5jOVrAtOJaot4PTmHN3g2sJsVgs9BLzB
	PWwHqqHaPfkwwAY4tbIC0qSdr85s/EudRbGmacrQ5+qtlmcG5ZqhQ2uIrzhJDDUC48xypsK6nfg
	4e0JhSw1wGztJc1AQQZoagvdFQGvqKU1hLQxl5CoKIS6sFMLKvgjvvJbhESesZhpB0Z3MzwFR+C
	4GJI+dprixh5bW7AEEvdKeCMTptBySdkPwYqqzQdy93p/NPk3/saNmsYIvbCSetsdIBms+YchBz
	rmv6kGWEEOuevuWBcW6PpqQiidMDoOqTe6e0O1eVZCtFzgz/byE3Pmr82UrB8SG4lS8VFUD8ivQ
	qOn4MCro/JDrxTAAHzRoC/KlNfauUab4ujIYEtRJP/rAha9mrYcUKbzAtyB5uPfAXWXOcp5TnNi
	VFw5pK962oIBuUf118ruZTF7vte3WUrSVOY=
X-Received: by 2002:a17:90b:1b01:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3b1b087a23amr1392750a91.4.1794556441256;
        Thu, 12 Nov 2026 23:54:01 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:54:00 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v7 4/4] Documentation: nova: remove completed GSP log buffer task
Date: Fri, 13 Nov 2026 14:53:17 +0700
Message-ID: <20261113075317.934264-5-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113075317.934264-1-vladazaharova2018@gmail.com>
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are exposed in debugfs, and with gsp_keep_logs
they also survive a failed probe.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.56.0

