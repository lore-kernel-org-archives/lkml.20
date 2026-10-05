Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027D30D3FD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229768; cv=none; b=dlM6rnote2gyPDeR+gw4g+70KkCwPFFRXum94QFr84LyPPJI0tkon2RfQnVUTAwOtZG9PKJL6gWbWMT5CVkbnqbwZREoMlljx3+MW+XL4K/kDG3glYBgihRGsDDUJz9CPz2KAYquPSP0Sx9IRjKAS1k5u/l8r/ojEwIuNWDYgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229768; c=relaxed/simple;
	bh=1aacAFrJpfNCprPgES36RkWlNl2rUmkGLybrOS647Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNB9mlUXfrN4v7T6GHb+tcrMTEhH3Mw7ZY6qFkd35Ejvl+AbD1O7ustO8iUEfWYvW+0h/7LU0pUZm2DfozxF2TntdAQeDjnvr7z1sgxgLscDbALoSuno9u9VJ3iEfeGAn/cXrmvnRlAlgI60V2IktFcTQmApb5HWrBE1QhZgoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsrgsYy8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsrgsYy8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso656166b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791229767; x=1791834567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24q49npE6pjQQ1gSDN86TRYKVZaBhieHztgMr+e5WT4=;
        b=ZsrgsYy8EQeF8haRs36TSqs+fpGw0+q6W7pYyInAyRPAg7oL4NVuxHFxlOTSoL/e8C
         BLBIiAfuizQaw2EPgu/gtTEvDDTjZr3lHzbuIziJE/u1RrP/9WalK6B2uJ2hAUvz+c0P
         PXXsH0b1jS1kweSLfGj+3odrTseSQxXRooGfyyxIy3bxLZvJlP4rLUat5x0YETYFpcSH
         jpkIaC3PfIafWsVd4/0vVV6j93Qe9rxZbrwO+1XupEvCiQVHLf4F5wA6P+tD7w2a6gte
         Jat6b1kLjQAYXGTbg5Wf5i1Tszmu4aabmv8kgYCh9Z1vfBvBSWYX2PCT0W8fJRPgDEX4
         pTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791229767; x=1791834567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24q49npE6pjQQ1gSDN86TRYKVZaBhieHztgMr+e5WT4=;
        b=L9RW6KHSOBfBiLKjknQtC2BeUKY598yFTIc53vHgj1qUfhNoWYmVd0ICv9rZqrGbD6
         a1W26LBRqqjHvcMLA/DxUcQjbypzkaQiCNC+AFvD1awq1DioPUwIHrMM4ohfnF34CUw9
         NZNggyiaHPLGUD29ZHh6Lwzq666UKnu5MkDFxh9iPmoOTlmOthh0olRNYdmL5iPi4qNt
         o137qPou8LXfxo6+Q5FPguUQv0sCzk61G8saw/eAKOK5wHGN6SY5eFCji/sylnNbr4aO
         Wg9euSCgE/r4WzF/9XTRANjIbOpo6R6vlzrbVlMtZaIurFheFADp2Mm7KnEUcMeasuw8
         MKKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqU0DcOlwzM6ECh1kcEJQn8u5SeDKRDrhfejEsSmcnfEUNpneXDeP89RGVH19UufKR0zEqtHtZVW56scI=@vger.kernel.org
X-Gm-Message-State: AFuF++lfLWSeoWkS8lvKi+e07yuqB8ABISmbX/UyM2Rsytfh6kxuSVX8
	IE67r8LvJyr2uLazAHJObrFqRp4R/ZNFONXBvXehs7s9+i4mAPegk+lV
X-Gm-Gg: AYBFou2vUTGJ7oX/uMmspGbuhrzXiqH6EesYM9ij6hwOyyV1fDWtpMXv+mMDzahZLzf
	hsGbWlabtUDSpaZfJfUR2CthBv4f9zE7xjV28T8JGcdeFhK1LQqt/JUlYwwwkfJXkQ0rIB7s/Fn
	NVC5EXlePC5GcF+ylDJT4/OYz4zXmj+E8OFELEgjZ23mUfptr7qfrMLL/x41SseG8PRIgOB/DEq
	D9kdT9Sw2PedRzqmTF+yoR0eQamHK9gdyTCe3jVKleXfKiBNRAjfD0qhKXq0MHuCv0jWsR88Pe7
	UOyChMi8exqHBcUt6z/+r1fHJLM3aBohBSFD3KvEi7pGOcGlKzr4RDIiw/5g0m21CzlNCa83GsB
	O9eHzHOomUR8MwZRYRs1a2xuaGPBCMxaUNOv+x7Pqi75/s5vdNZDh5sFXhbQKtoRkkfunYLk3SI
	KFYKox1LJ7skX9n9xPjKYJC43qu4Auri2AsdYN3kvkS1imyqkc0jrRiUqiVAj9BE7spY52M5UIB
	rPHkMxyktnQYh/YDY8Uy0vV55Xfei9YBocvx4ZBEavkbW+bM/kJFqFQkKR6okgWvF0CuerKKlGK
	YoUT+7z/ukM2MKtvq6WdLRjdjATxDVVo69MxCqyzIJEDuF0X
X-Received: by 2002:a05:6a00:4c87:b0:88b:71cb:8a02 with SMTP id d2e1a72fcca58-88c5d67130amr7579564b3a.0.1791229766638;
        Mon, 05 Oct 2026 12:49:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0bfc3805sm4008252b3a.21.2026.10.05.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:49:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table
Date: Mon,  5 Oct 2026 12:49:23 -0700
Message-ID: <20261005194923.161411-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device binds via the I2C ID table (e.g., fallback matching by
node name, sysfs new_device, or software node),
device_get_match_data() in is31fl32xx_probe() returns NULL because
the is31fl32xx_id table entries have no .driver_data.

Without a NULL check, is31fl32xx_parse_dt() will unconditionally
dereference cdef when checking cdef->output_frequency_setting_reg,
and is31fl32xx_parse_child_dt() will dereference cdef->channels,
leading to a NULL pointer dereference and kernel oops.

Add a NULL check for cdef alongside the existing child count check in
is31fl32xx_probe(), returning -EINVAL if no match data is available.

Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..7bb0295b0b49 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -577,7 +577,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 	cdef = device_get_match_data(dev);
 
 	count = device_get_child_node_count(dev);
-	if (!count)
+	if (!cdef || !count)
 		return -EINVAL;
 
 	priv = devm_kzalloc(dev, struct_size(priv, leds, count),
-- 
2.56.0

