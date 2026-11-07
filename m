Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794090558;
	b=PYz9gB7qwnoxcfK9/p9OfHQCnUyhzQ3BtDTt3Nwu+9G6ZIrItYNQwhD2NBFpGJgarKhr
	 Ur0VOin4rYLgfpN+WqS4uT/hT3/GGHXm1dZaWFZf3+CUn7Oq8Yzei5rZ/zTGNpN/v7vOC
	 MozQEqZf4NgC9WqHaVHUExacbzCl/EreyXXYKNbnrvZpRKR07wjAio21ZQlBkXGs5buSn
	 GHMCaWpYCgiAmRnt7d+NjAWO1tJ+T1GyXtSBug6/ss/strcfYHJi8fh2V+i5qFrwjdXdi
	 LtfWZVE4LLjD1g5ZV02l3KvXDxrhTTgV422PLt8US23rCq9iNYMZGwP3EG4YPaznzSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794090558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KvQWvyI2fchS5QUJvQUusL+zVyULOAN7zOj800KT/nw=;
	b=Pyo6lcJQXF6dhHfrdOTY6VFVUVBLpdtSF8zTvDf+6Nd579W/TObFqjEituh6RcxkP8tD
	 39GNPsFc+zcJRbE9DAk8jzkkNhRqLXmbMVcSWpMJKW2W28o34ImCVePLA1Q3sszXR18R7
	 bv5iJOCGgRChays2VDQhLRby1fFQcc9KOz7c3dtUxRXpfiTamBY1aXm7ibx/L2tA7B7hT
	 0y4Jfk5+9V/wsNF4sx0E+0m6tTAytLs88hxh70u2NYOEkGT3b1TX8/8cSJxtPXIz6bTQv
	 vZrnAlEoxfJUnVEyseSXZaiQJvDlbCIfmT9Iv0kxUHv4cMt1gZbJ59CU9/cSUi1vZaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IoaAsWP/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 22:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F68A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IoaAsWP/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so307615e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 14:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794090557; x=1794695357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvQWvyI2fchS5QUJvQUusL+zVyULOAN7zOj800KT/nw=;
        b=IoaAsWP/pTw2LzfYyx/H4mQV7TJzafmyY+pY6/Tj0QEvE72j8v/Uz/uIxN0lvS2ZPt
         P4FXkkVl7tO46EX8MWs6nVaDrdDvwvmaPv33M59IdeRXzH35+s9tMNaUfIKPQvZHwFYN
         cuEhU/ELOtijI9VXZAzMfVkciKgYKElz5VsPW3BgWiSNA8T0+kXlsOGm7pNiQbS/ssHQ
         Rz4scclE/Gou3Zfd80lt7U1oZbbKA68LxRYknP7MbGhiyNM/84Am6KyNvKo17P9BkpGE
         qvvkgY7//JKDBK8uDOWCbgI8hInRfsVa6hGUdcp57j+Fh4Dyi1DWMVIONFoIWwPYdT89
         2QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794090557; x=1794695357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvQWvyI2fchS5QUJvQUusL+zVyULOAN7zOj800KT/nw=;
        b=V8mnZ3rIdQlobf2Omr06+8txgrkTJ89BXa8WnMx2e5p13Wj0MUFu/1rdD0d57CXrg7
         haROeRlBl8ZWSIMs6So3UYTeftOsVHGdVpxP/K9RI5gwtSpaNPzKQqtE4xeT+qqCHrPV
         2eJ+dQcfXG5X1m/+oN1sVVVNP3rxqF+++K3p7kf3IK95+m8329tlARe18KSl/rjuxiyG
         I+8F39rPbmq5b0hT3tl8WgBRmI6PihPbbB4yTJQD/4x+svGfyYOGRhrrotpEtdzSeZfw
         CwIJOnshHOPk16u2WoLYZpCco81kxuZNXFv+NO8XpxoEbT2CbBLQH5TTu6/S9oA0vxt5
         idVg==
X-Forwarded-Encrypted: i=1; AKwUvBypYhHTlwQ42m4iRkam62crcsDqEoEME4GHrPETVL750v21xy8Q2EjwSmcGLek1oXjEL0pVapWGcF1uPQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z88diFUV5I3XcDuOxqpB9P3c3dKQTfPobIotEq5sMmmxfxmv+Rx
	+rIEEQH7KYRZ3DM3O9jFgtPFAudZhms8RJdo+xonpwiWSO001m3lOmY5
X-Gm-Gg: AYBFou1TX0/huwfqeBE/zk8l2jqnWLBsFSBIKrr8QKgQ7dx92AKDihc9U6o8cxXjuis
	DXZXB0KHDbNx9u63lS7sLfO6V6m76zLmJMC0qh+rWYpWKSLvM/fEa8n5oD++5MMMOgCndm24x1A
	gHC8u6UNwkMn0/eTrEp7KsTR68dn9hsKsSRZnU+2y59KhYkoyaHEZMq6xMye82sB7j1cEiNgVe/
	jRCSFhwsD55sv0rZe0+MJbYUESYLY40wv29FQ3NxohTVaIE0a+6KXSOs0rUoLe0xewjFTJ3kqNQ
	GehQwcKexxLEXMqkL/twqDSi4NtYp5w++Vp+HA9OfY6T3Fb0yEq9i8Ph/GUfdZ56LeljERDktYz
	RBQOUHUTJLBJkCtfaJ1gH5yH7/vnfjkn47hI49uOHoEHyepB5NX2HFsxZdf2WrMgbX4DlLDq4SJ
	syAfgGPxK3PYs7AFc/bDs+Az2jFDrkpZpDMeTG6vOA0mLQYxmufQithAqkOQ1eFv2oKTO/DYk4i
	gmWmJ92IByuxy5AUFS2u7eHo54VglNLcL9uO1isL8tqErru8uw4J6jg7eO/mEtl/XyQUtZEZNB/
	3ShGtiPR9JRgaXFWbr91X8PxLupJxnI1UQYxqkOs9IApnTNIEnY=
X-Received: by 2002:a05:600c:6095:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4b960e9a37amr1720575e9.13.1794090556743;
        Sat, 07 Nov 2026 14:29:16 -0800 (PST)
Received: from localhost.localdomain ([78.240.29.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm3538205e9.8.2026.11.07.14.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:29:16 -0800 (PST)
From: Luc Bertho <luc.bertho.kernel@gmail.com>
To: jdelvare@suse.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luc Bertho <luc.bertho.kernel@gmail.com>
Subject: [PATCH] i2c: i801: Add Dell Latitude E5510 to accelerometer allowlist
Date: Sat,  7 Nov 2026 23:29:11 +0100
Message-Id: <20261107222911.36830-1-luc.bertho.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Add the Dell Latitude E5510 to the i2c-i801 driver's allowlist for the
LIS3LV02D accelerometer. This model features the same accelerometer setup
as neighboring Latitude models, enabling proper sensor initialization and
functionality on kernels ranging from 5.15, 6.1 up to 6.12+.

Signed-off-by: Luc Bertho <luc.bertho.kernel@gmail.com>
---
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1248,6 +1248,7 @@
 	 */
 	{ "Latitude E5250",     0x29 },
 	{ "Latitude E5450",     0x29 },
+	{ "Latitude E5510",     0x1d },
 	{ "Latitude E5550",     0x29 },
 	{ "Latitude E6440",     0x29 },
 	{ "Latitude E6440 ATG", 0x29 },

