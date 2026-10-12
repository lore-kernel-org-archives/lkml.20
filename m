Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9F37AA65
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786051; cv=none; b=XZ4g87+YqlmnkckxhG0ey76pAbiBvvuIv1ssntb+QrEzsJh0ZsPlpO94dg2mjHUL/rW0Dip4heoGMCmDBmc+u6iTV4C+mO/Wu87GF1oQLvW00NS/BnUgnYL3qusKD2E4mHSyJBtmkJkF8Q4J/pKdnJkxmiSEikiBPryXb93U7UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786051; c=relaxed/simple;
	bh=8oXkWJxXLk6r2mXf+O8P0D81zPxTgLXqzVRb/j1nEE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXOHJcrNeXK4nTKP5YghksILj4CT6t/g56JagKZwEbc6HFAn6vZvyuHYNt5THtrf9QC/6AR3it0X6vYu2W4oD/DXG9uey6/tGNGraE9yJKnwZRvmbVsDkqR+4h6fBba7puIojIXo9iqEMKAsL8+OwJUouyQTrfVvOgDWl2DiPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIqlz2a0; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIqlz2a0"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88aea027391so662378b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786050; x=1792390850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbHsI6frsHIB41psCPxLJ9ys+iCKk7bXzIuJcw6lvTw=;
        b=lIqlz2a0ewTWkLFUyeAGwJ/iHw5z4RyRLv6AvnatjX4QVlsvGgCSK/0FWzyxbjd9kK
         i+ZxYNcNePGwEYN7aJ7RH4eYV1MY9IleRp+vz5yXF5/urPmAnUFmS/kxOY81Ixxnrwjh
         wgzlS50cBk1d8BHJMbskRTxrIQzzmZnXe+qGhFdnREcKGvZksN+dOMGSZlYFo6gkS16M
         k1kQ+be4TJZ2cnktY403AJat8/NbaeFWNZifCZm4sCt18ZvqCbCjiSx01E6kMr/AbKX1
         pjw08YKsBjO2XdDl1SpwKgDyt8TytvdMs41OP6T9kDb4Qs14mKOG1gjBjC++HTkq/2U2
         kGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786050; x=1792390850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbHsI6frsHIB41psCPxLJ9ys+iCKk7bXzIuJcw6lvTw=;
        b=RGO0TNwpXrnIcdEvDqBfi/t05ISE9JMbnQkhkzME+44G3nMLwWcey8mdqn4nmnNEwi
         XX93xsUpxGBRt0YXB6tm8kjDVlto8y3Y/rmXqs0yYZrrTnPoOHkJsBFLf/GTCNmkr2mV
         EkEikVNDzErRtO8ky2rKvcd1Z5LT9vEsFCyWT13irSRnpKpW3l+jnQcwRxAx+KM1QI1T
         G9pKIgwWUPIzVOk/DG5gdBJNgK8F2HI8ZLjM6CCMIR3eiSzwGi67lWtsixWPJTpDOdbg
         QN92EO6Z+XMSrqWuCjvfE7OoZtZ1Hfi+867B3RMgA/8azXGrTEKN79UPS+FjFeJyGBwa
         NeHw==
X-Forwarded-Encrypted: i=1; AKwUvBxgIZw0uUYJObbbmNx3m30OJvxXt3DjIw6wfpfj7Wqt8Gi+Q4GuZreGup3m0fmvxksJFCZpaLn7tOZXp54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpmoh43/3EBNAdIgxD2MbsKavlrWTFEcIY9xSNfI4cNOKITeaz
	QL+dbF7qEgen7HYOcv7lg6B5MIvDCS2BM+n4D9Uze3GJU3P536jJIsCa
X-Gm-Gg: AYBFou15MICd1cEdAMPn4TYP+Wj6i6/Jjv4RxHqybEUHhInThuQXl7701T6agg5fR9E
	g9PbiKl/I27DO7KE0e4WTRs8Sfq3fGCL4WK69M3UP7sVzcmzmX2INgjJr4sdAM6mGMsOjQaAXtp
	6YSGwriyIMZVn2pS5ysBCLbYsVakd9LkQ+AyC11N8Wx7IPOfkNzMQTEGF9uMuPIEYFe0B/8oahy
	qQWW/AonebnUCupRzYO4z8QcaXgveCWOWjqlIuQdD7510h99U8Xl5ctz5gia7M/oiMcLbh8ddR/
	wsyhXh0K3kJ4xBj5qNaK9zEAO+yxdbVVqBQIgScV+0cKv8CMhtScYCeTGgIpEuJKM8NtKn8sSU9
	QHG9ZoaTkEBi30H1uNhWZgJ0l3ZkZkL7FzBAZ/+Y1Mfa02X1C5Xhid/kMaYCPOdbxqL8hJH5KvP
	i3qV3Q4mukPGX9+Biw8ciDERODWQzYH7aOonFMc4fUKckX6GIlTKjXc4T+3QKcTexxAYpZodG0J
	FBbio46x7LNEHABBeyC/Q==
X-Received: by 2002:a05:6a21:3297:b0:3de:463c:7fcd with SMTP id adf61e73a8af0-3e16baa6e51mr6873235637.4.1791786049787;
        Sun, 11 Oct 2026 23:20:49 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d93c2c75sm3990091a12.0.2026.10.11.23.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:20:49 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 1/2] ntfs: do not read ahead encrypted files
Date: Mon, 12 Oct 2026 14:20:39 +0800
Message-ID: <20261012062040.3826828-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_read_folio() refuses EFS-encrypted files with -EOPNOTSUPP because
decryption is not implemented.  ntfs_readahead() has no NInoEncrypted()
test and passes them to iomap_readahead(), which maps the runlist and
fills the folios with the raw on-disk ciphertext.  The folios are
marked uptodate, so the read that follows never reaches ->read_folio
and returns ciphertext instead of -EOPNOTSUPP.

ntfs_read_locked_inode() sets NInoEncrypted() and NInoNonResident() for
a non-resident encrypted $DATA attribute and rejects the
encrypted-and-compressed combination, so none of the three existing
conditions fires.  read(), mmap(), splice() and fadvise() all populate
the page cache through readahead.

Skipping readahead leaves the folio unpopulated, so the read falls back
to ntfs_read_folio() and gets the intended error.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
---
 fs/ntfs/aops.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 517d9a1563e7d..ad781674fef1a 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -240,10 +240,11 @@ static void ntfs_readahead(struct readahead_control *rac)
 	};
 
 	/*
-	 * Resident files are not cached in the page cache,
-	 * and readahead is not implemented for compressed files.
+	 * Resident files are not cached in the page cache, readahead is not
+	 * implemented for compressed files, and ntfs_read_folio() refuses
+	 * encrypted files because decryption is not implemented.
 	 */
-	if (!NInoNonResident(ni) || NInoCompressed(ni) ||
+	if (!NInoNonResident(ni) || NInoEncrypted(ni) || NInoCompressed(ni) ||
 	    NInoWofCompressed(ni))
 		return;
 	iomap_readahead(&ntfs_read_iomap_ops, &ctx, NULL);
-- 
2.43.0

