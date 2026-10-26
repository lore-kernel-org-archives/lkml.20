Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792988655;
	b=okWQDjVdEz4NmVLlgP0I8STppW+Tk4pQagk8PVCHNaNIOdwozjVViHFU0BnrTFNhxeak
	 LI9xwUBQY8knaOTM5be/9/w0eJvM/jsGuMU3KKE6vNMTQFXPjfF44sfvmiAxJHKIa5aNE
	 YubJ1gz3tcNahEs/tPESShdDy626ZrUw2qjKPltzPIryL/LJZnKytOj00noaSl7ROLe+U
	 /UI+f2SjeZmGKgGEhkORQuB5A7ZveNUeLYbrZ3N8Wz0Cn8UmK4z4aECglkdqpwBy9zJ8q
	 Oj1JPW++JrBCWNBzfnvnUEEdejWiPJZBx457mYFqfH/8mknXxcqgeV7pV4H6kJdIhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792988655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZX6u56YuYim6IhcFFofMeax3AEDqP6YE6VDAwScA8Z0=;
	b=DxG83wpMeWz9x84XGJDQXkPvaQTD/MwcBtbGs11L4RBOxgk2AI9GlItjcN8mOgqk52/k
	 trq7kGhg5mee9dv4FCIAR9GQC9q9O2jlCKJptRd//RDKu2GqzCoQOnQ48lugMZ4QOGFoP
	 8/l+3T9kZbR6A0s53YS+MjcHA2bOgqziSShxh0cQfA0ueVf5FCzqFn9RnzBgt6MXqWhKU
	 RTrCr4XZj1e/HGwLD05WX47dDEFpTvAoi3Qcqnt3FSWS+jt0FLqw8D+H8Zbk4mz0ioydi
	 d8zOtxXCqVq2FeZsYIiF28X3O6wdw17wHwxf6yE1SemMI1K9KTf1veve4wIGM2mpXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CA606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so3906658eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792988648; x=1793593448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX6u56YuYim6IhcFFofMeax3AEDqP6YE6VDAwScA8Z0=;
        b=lvFaXSqbChT39rbQo0PTEgU5hs+lNZMznWnv0OQFUshFwv68tSZ/p/zbo2Qq08KJnV
         p2WF0T/7GvvERZGd0Qix24B7Ii40ustbSy3JvkqYY6JMpoOCqfgZ5R/Ucl3JP+HT2t9Y
         hmxsHYypjynud1C8G89GCnANOijkbXQjTmpoCRU9h0irfQSI3NIkbLZIf4oJUiDvhRWT
         jXJyMVt9+kOcAD7oUI2ysLZM68uIgD+MhbdLLyf6AujEK1D6B8iA6coS17ZF8rp0jIOF
         QXFoGgYSSCZ0J1A4UW9Mnbh8QS37R7R/P84hHIv4/bWEn6bwRbk3U67NPcDFLWiPgSPS
         HQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792988648; x=1793593448;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZX6u56YuYim6IhcFFofMeax3AEDqP6YE6VDAwScA8Z0=;
        b=kreovkDAlx9EAIOLpkpMt+qLGbxhtecU3n/8Ga85iQKy+zJ4svkqdupW4TTVLlrgmd
         SezGy8Tc1+vhAqC5Sp8FI4KAGZJm/BWflzycdX72pWeVbZfazW+K2ZBDhuYfiOdj6mjM
         B8qbVmv+Q1p1sN6XnixThuendewzoCUWSwGCuzjWPIDwgN/L98A63rxsOhINvlbaWcfI
         BLy0G9n/Y64xpP8zZy/gOrS22SreXi+obbdjx+JR37atgwcOP8kSKG7tqjIZGhrMzjms
         eDY5AuhqUJSZxRJ6/K4H0xGylf74qULva7sTgAY3Dl7Tism5Lsn5ONa3Ors4nS9iUGW3
         9ElQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbMSgd3FhZ/h78ad0hN/hoDCUfTx7BWbnH1hqXQ9B7THQzmU1OqiYePPaZV3YZSnf7y3WUTPLok6Jf+Ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVwY0sGAIUEdQu2nkvl0870ppWLx40MRtwVX1gsKaQru1ThBd9
	gEs+I9zhYiNIxyd5zWAsSdCpYRr83sv0vzc3wvcV1JvxTu/p7W2X2T9S
X-Gm-Gg: AYBFou2fgp7AKMOUlNgxOmfAdBfT9hElTE/lk+CgWloqD06+GyY+JgK0abSuk8tM1dF
	04klgLhd96G1uJaTs1USV5J+5AjB5Nx1eFhSYURpU3bVeJyZSbDWH5JbEBOfJtXONpvviyR1OBW
	pESCHyurr9fKtBO4upsbo/EwRl4F//5qrUlJ1+YRTKSPyEWDLj6sDr9ofJH2i+FnlRkQ7zNt6cl
	GoYxHim9ZRZdriGoHo5tTv1qdQco1B/q72cBwh43L4d1RxgErlKhrpjO28bpa4LFNsTc2gmSqD5
	Wk2ITRw2GeprVmaJ6znwBH0JQKaxeWaQLD3tMPouzzsu8vYbrO7sHUZJzsGndwJUhrj5M+xslUH
	iVKHsm7P0rq5NUxO27wperVdry3Y8AxT5Mkw3gNU82YoSn/Kazdu485K/yhe91z1vx+Fc1ex5M8
	F27CLrni8KpjS43/FCIsGXjGa+DCOavDvwEXfKTcDFGJhl1470wr+oujZNAIe+gs+2GdVedfxJ0
	SMamToBqj8F9bvg0j+ifN9HrmyffHY4CTIKfRmQ1o9fNeWMNQ01qyLCYT4CCLVc/mGYK5laijBP
	OuQPb6B2U/af4qXuv+/0YGqB1v8b7pPjLBOPzE0=
X-Received: by 2002:a05:7300:dd49:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-369e842b438mr8302200eec.13.1792988648293;
        Sun, 25 Oct 2026 21:24:08 -0700 (PDT)
Received: from chitransh.. ([2401:4900:61c8:ffb6:140e:11f8:8ed7:1dff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm6547457eec.14.2026.10.25.21.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:24:07 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH] platform/x86: dell-uart-backlight: switch to devm_mutex_init()
Date: Mon, 26 Oct 2026 09:53:10 +0530
Message-ID: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so that the mutex is
automatically destroyed on driver removal via devres. The driver was
missing a mutex_destroy() call on the teardown path.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..2ed2f00d8c49 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -279,7 +279,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	if (!dell_bl)
 		return -ENOMEM;
 
-	mutex_init(&dell_bl->mutex);
+	ret = devm_mutex_init(dev, &dell_bl->mutex);
+	if (ret)
+		return ret;
 	init_waitqueue_head(&dell_bl->wait_queue);
 	dell_bl->dev = dev;
 
-- 
2.43.0

