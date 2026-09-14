Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E22C47ECCF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395677; cv=none; b=HCWP9GNN61MgeawbW/v1OLajEzAD2Mw3qiWMH9zpeyCVMn0rRF8MULixUFWclVhdy6yZ8WGv82IwmjifX4lTDBYQ1BDpbETg2UnYpapwFkxET3XTbed63fFlKDVVVHCsEVfMfqLff1Wgc+K4I1Q/JHosuHK+08qE5hN2XBLLDWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395677; c=relaxed/simple;
	bh=3534xZWAmWoeNSroRMnp1vkH3F0sWV3lUxcINo30ufE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RFwNoW1zHkFrIHLKjUNma4DVxOjJiAxWSfCM5TGB33e1oSQ7U16udnhA2NWkzL+PbY+awtaHIZWpYZdaL/XWwdbCIoZeedrI2bIdMVDuPa/2hdmTZBax614OYSmnTaSBStXL4sT+GxWRE6n/rdk176o4tC9Cepz+Dgisq9srL3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaOmouQ5; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaOmouQ5"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso2689240a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395675; x=1790000475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbbbFtydZ6bg5SO9oGIYuQ91SLS9B9Wc4jISmGe2uxQ=;
        b=TaOmouQ5kvU8bAqXLvJF33iPMFf68uT3mEBOwT0qRMZHAbAnqipDcpJrSbNTHPzNCR
         CYW8yUcwue6+65tGwG4UvXT87Gd5lnqpr1BvtxWEDwJu9t1c//4ap+4qOk0wEW3cBRSd
         vdVL2WB/H7BhRo7YmQm22rk6h+J7q9newWU1Rmt3faQyu5Q+ReS7+UnupLsoohGbDiiZ
         xEdzfdwuBn2mgXWUBZ6Jt6lUpArt5cjHuqy8ydt/+/4gV1sHYq8tAJ4Ks0TWVHeYkt9h
         zAa3hDpJoXzM1F5EhJoylZQqca6BeQxOTXj++hN/w7pJe+C3vgYcfHEyQ74S7PS2iODt
         zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395675; x=1790000475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbbbFtydZ6bg5SO9oGIYuQ91SLS9B9Wc4jISmGe2uxQ=;
        b=mMnJBx5Jw7DKAtU5zwR+S3mPnpQqYp7nNeS0FMU40xXq1z2doIdqJchJa6/eDkYjqa
         GeXuXTGPLYObvitGXSdDC58Ba9Ch83PiVAR5BPeLRDPbXhnYFDgqMcjH8oWV3zoG2ONS
         QXc9W5k0+ZX0vcHccxsI91lgl670mSghelolRLQKLgA8sh2lIKUae+V6s2woxpiSLyyV
         x9YAFMSL31Y/49YjgzRQGHQUN0cGKtuVu2gJXuntfkS1vn/NawuqxUnEcfXiLWh7m4kb
         L+UL3Qg5Bhb7+wnEsP7A6P/fZ+vfDMz9UGcCdebmW2to+wvIf45Sh/MNy+sdcjwxD4xQ
         elyw==
X-Forwarded-Encrypted: i=1; AKwUvBw0ZdlMMoICcEjXzrN6VA/Zjp9ZR2b9ILxGNyBzOjLmvQbtOu8ANlfFqCHfe5C7tyWviqpoA1HWG3WQcV4=@vger.kernel.org
X-Gm-Message-State: AFuF++kyeNHPmb7c/yYAAYrWhhi2FGBNmo/gcxNZf5uxwgv3FmyrVQXw
	QeUXNj6SJVWcHZPsx9uYzR37ryZv4qYG5U5t2n3c7y/FtjM+tccbijYF
X-Gm-Gg: AYBFou1WjzYMdrCLVqV7e9q3Sponogncl/Cl9M+LKbeR5W4/TEzS6oZOqNHCdyNi93Q
	Ht7YWG1A+LM84zYNjPppZ7KBRyuo6MRQ+vd4tW3BgD79Mu4ZLBzYogKiJQijAk8fKirzQKAPuhu
	yWRJOKzgGH9/51hTAa19ufl5lBSqAxp5qfzj9zdpdFvfy7iaO3lkj5lOP03D6NOz7hewMIQ4Kxe
	QWTw/FQiRflCsPvYugYGk/4olqcky09CxR/6WU6Skr2fUsD4s7xGZ/kWMNJSugsWsSm0o2/7EjF
	qYKECeARzKU3TUqjeLnlrQcl8me90xJtnTNiETulTc0sT17rTEpi0AaiBQ7dyE8B2RF54Uvuhnr
	rp9zj25ktopnCbjwMyhs2C39eQaEwWOUU3R/vsfgiM8kPhvmNr5+6SDmtiyzDeENKCCVVgFGype
	ty4S2bSP2dWGdRDECXKPJ7HnZXF/lEGgdF+Q45HS7wONkdQAArKgBGIA==
X-Received: by 2002:a17:90a:10d6:b0:39d:ec1f:b40a with SMTP id 98e67ed59e1d1-39dec1fe435mr4017399a91.11.1789395675068;
        Mon, 14 Sep 2026 07:21:15 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm22113164a91.0.2026.09.14.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:21:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Colin Leroy <colin@colino.net>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] macintosh: therm_adt746x: fix memory leak on kthread failure
Date: Mon, 14 Sep 2026 22:21:06 +0800
Message-ID: <20260914142106.1747229-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe_thermostat() allocates the thermostat state before creating the
monitoring kthread. If kthread_run() fails with -ENOMEM, the function
returns immediately without freeing the allocated state.

Since probe fails, remove_thermostat() will not be called, so the
allocation is leaked.

Free the thermostat state before returning from the kthread creation
failure path.

This issue was found by manual code inspection.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/macintosh/therm_adt746x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
index 1ac29a5cd324..60f292a5aa3b 100644
--- a/drivers/macintosh/therm_adt746x.c
+++ b/drivers/macintosh/therm_adt746x.c
@@ -557,6 +557,7 @@ static int probe_thermostat(struct i2c_client *client)
 	if (th->thread == ERR_PTR(-ENOMEM)) {
 		printk(KERN_INFO "adt746x: Kthread creation failed\n");
 		th->thread = NULL;
+		kfree(th);
 		return -ENOMEM;
 	}
 
-- 
2.43.0

