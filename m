Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288B327BEC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845616; cv=none; b=H+2guYNC6rm/PNq+yaMOYMs623IdQedFZcWy86NoxTaDZLokpHf6xY/WDDu2P+lBIaypaoCghbMcT6acgpIEjW5hsCwFCiYyNy0ZQiZp5Gevr0Va7h9rzsdRPuZIMgN8bKA9BFnIhnH6A4rCB5CbJks6ThtufiT8ywXdyKh0r9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845616; c=relaxed/simple;
	bh=3IlUWmAFUyinht1ZFKPl8A7tqu3pbZCuAoScX6QKDxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vz1MtTVLzwvcY89UymMVtiwb7N9D62uQP/sQTFYMnXsA2R02TJYX1XIL6iJKWcaTRA+zs7/570Y3OYyRgKQ+4EtsrE8+8s7lYbAYit1BjpDhsmogNO4dGUkQcH/nLhbST8sUenknFgXYU7+rBT6a7aKjGIqG2C7X4qxnZXIifB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1iRdjT+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1iRdjT+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso18449045e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845614; x=1790450414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXx5imIowjJ1CD3eCeojA2/2+jEGG1WCdqzKjHY6Bi8=;
        b=o1iRdjT+OrWFGHlWNInaOp/QUUOEMCSHCIGy0k2NjCKq1TDTx/q5ScwhikDb44rYVI
         Zr6P4ai4xFM7UYRNO1QwudfVyex5Xf6EfphoiMJKkTq8bHo91YXdp9F6RgDu6P5pOAjP
         Jxq48NT06vhDEi4k1bxqf5Lsv9EIenwXA5ePs8tT6BliMpYmxWUk/l6ZtKKjfDZeP5TM
         9xS7CHy4ypn84ECM8HcYgFIbetQa7Puk5JTKlRyDxZXit4rHdAIkqR2eh98wnO5OmYxa
         br6f9weQEVAEYBdEVr9GEotf7hjJMy9FOH8QemJZPh47a0rq8bos8FwGhuiYffW/fIL1
         8EqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845614; x=1790450414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXx5imIowjJ1CD3eCeojA2/2+jEGG1WCdqzKjHY6Bi8=;
        b=BK5UoD4a/UwJLBGtX8nrndvPDKnpO/BN3eOubMNeEsN8ZmmMceS51XzeqTXmAY4V+G
         CgXQs+97kaxHolfYHgduXJ0PI4GfvsdPCbA3BvNG6oHd9sSx2isXH2zuChcE8z8bEJcj
         24JA1GP5qSF7sSpToraTLReDrTsfP/CJvGbnC0Qk8aiQGNCWcwpdUuAGQW4qhNI4kz67
         k0b/pymm0C2cXfYSaVDz81HC7cQvvL382AuvrychnNHaeCDg6vQZqv54n5yoQQGgDjjl
         Swx/CgWp8vgzlG3GdWSMrUoxj7CP/a2IwcBfXSdFBsB0ZNFSmkcffSyQhKDm/IBVain+
         nTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQJ1+zCmruJKEMFfqqhAmE4lDLYMXfYPUwkexyzuyqRXWKmgJ9iWrV/fG2gv3jXY32nZX4krla39z+C8s=@vger.kernel.org
X-Gm-Message-State: AFuF++lwN+QjsDGXSA34eIxpjI3mdpcRzRax+AQGuao9avwnki7s+Et0
	XZWs26sRiORTZz4O15lNwQtOQEPrKeKDHzwwKmTn6S7Xpo7BJ0M/Ll9TsG6GDJc4KlxDIrSQ
X-Gm-Gg: AYBFou1ieZ9MsXcX5oNFLHWBy87iSe7DI3vM5Jn/ifksnh6pZvsZiNIYWSF5BgczXRG
	l67gjKHb5f5Tz1eR00HM4R15ie9gYOee9Db306W13rCfY84718Lc9vdFpfdzV4QhHzTwvXBcJB4
	CZL97E8oHah5mOAJxH8CkzmtDkvTD0z1HlEAREK0IGM+9c8Jn3uIrnUsQMR8GHwVYhA8QX2P4km
	+YZgYlvm0fiGprS+mfMmOAIQAV3auh8vmsLirdToY0HsHYzv0lOihRJG2qgp0FDj5Dq03A2ivwZ
	bHyflnG3rNMFG7PWy2z7C5YO1bkptfl09t+fSi9+kmQLXxOqvqAqIBGU+eGoqa4pBPIm2Tia1ik
	TuzPCDLFg/v8wnsPhne6RpkHDDDuYpPN9/RXB4XBzjSHxmmwCmijR7UCrf2OdiEs8oi0cIARmxy
	MIUseOSMkNrrDRSwa+z1QHIgOGZ+XMtrKilYIqhcVja0MK+F8Y1mEJUGS45NO3WFiSEdGgC1u5e
	47P5Tk1VpO2MfwhRAVq6vW2lwrMlUeFAcas5e1PxeUXma2jFUJ6
X-Received: by 2002:a05:600c:3b05:b0:49f:c196:47b9 with SMTP id 5b1f17b1804b1-49fc567318bmr82612695e9.4.1789845613497;
        Sat, 19 Sep 2026 12:20:13 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm68251225e9.1.2026.09.19.12.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:20:13 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: dhowells@redhat.com
Cc: David.Woodhouse@intel.com,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] romfs: reject short MTD reads in strnlen/strcmp helpers
Date: Sun, 20 Sep 2026 00:20:03 +0500
Message-ID: <20260919192003.271402-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

romfs_mtd_strnlen() and romfs_mtd_strcmp() assume each ROMFS_MTD_READ()
call fully satisfies the requested segment length. Neither checks the
returned length before using it.

If mtd_read() ever returns success with retlen 0 for a nonzero
request, romfs_mtd_strnlen() makes no progress on maxlen/pos/n and
loops forever. romfs_mtd_strcmp() decrements the size_t length by one
to drop the padding byte it asked for; with retlen 0 that underflows
to SIZE_MAX, and the following memcmp()/buf[len] run far outside the
16/17-byte stack buffers.

romfs_mtd_read() already treats "rlen != buflen" as -EIO for plain
reads; apply the same requirement here so a short read is rejected
instead of silently mishandled.

Fixes: da4458bda237 ("NOMMU: Make it possible for RomFS to use MTD devices directly")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 fs/romfs/storage.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/romfs/storage.c b/fs/romfs/storage.c
index b57b3ffcbc32..6313e218b8da 100644
--- a/fs/romfs/storage.c
+++ b/fs/romfs/storage.c
@@ -48,6 +48,8 @@ static ssize_t romfs_mtd_strnlen(struct super_block *sb,
 		ret = ROMFS_MTD_READ(sb, pos, segment, &len, buf);
 		if (ret < 0)
 			return ret;
+		if (len != segment)
+			return -EIO;
 		p = memchr(buf, 0, len);
 		if (p)
 			return n + (p - buf);
@@ -79,6 +81,8 @@ static int romfs_mtd_strcmp(struct super_block *sb, unsigned long pos,
 		ret = ROMFS_MTD_READ(sb, pos, segment, &len, buf);
 		if (ret < 0)
 			return ret;
+		if (len != segment)
+			return -EIO;
 		len--;
 		if (memcmp(buf, str, len) != 0)
 			return 0;
-- 
2.55.0

