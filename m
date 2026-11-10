Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353780;
	b=znKnJ31KFy8HG0+cdXsf60X85SQUBE5xnjsog+mMi0kz7KL4UVUHFDeUHrnSu2mPGbjt
	 XsgCSzYRsIgzd2B4O5iF/xjhNT+b5Lm2E1/kQCj0ptSqWzRVo+CeqmjgBU8rV3t8Mzu4G
	 wUrST2cIFWXAZBeTmxriR/AMWyEgtMxn6j1WzFa8SvIQGqopISb8X8PMzF1tla9vr958b
	 +91EWjrZMZuB2GWlYc9Wk9WXuX2lmiiLpLpirnh17R2JO64k3182XZyxCcZyh5YazIuqp
	 TiaGQ7u0ZyVVFnL97dwY95IGBQf55lxbZOszxPatLhx+JjebKuUJm+rqiZEAICFhi9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DhyHXjqCuztb63PxZ1O7LhMFys3Q28OminyWGfw7Ef4=;
	b=m1jg6b9Cm5mtQNKOrcHn5DioPiuwHoXNLv+B21E3V+9XQ1OcilTApVivZWsmKuB18xfP
	 K6akLEPKb5LHmkJrOwCrPRrCcZ8xvwrgTua/y/W8MdofJTHpS+zXrwX/f/rezL92Un8J7
	 uYpmrpdY7r5f/ca2tXsaI5YoDylAwlKit5k3wYGWSDek0nWauEYOq91uaB0zozLQE8RwN
	 vIhy5wxM4S2lUawsldlFeL6whVDy4n+n0HxGY5vuLpSuxH2QRjQ9gu26wyGe+isF6d/LO
	 B1foM0fCc5G77kSY5lDZlWyNOw/k2hCS+mjUqbT/Q85VMtrHW+iiyX1Xs3In0VM+m6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bMBAb0vA;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AFB60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AFB60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bMBAb0vA
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8871ada1a26so26119687b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794353779; x=1794958579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhyHXjqCuztb63PxZ1O7LhMFys3Q28OminyWGfw7Ef4=;
        b=bMBAb0vAz941tkfnWeRA0uExGPe39wBJH6mluguoORT1xnehdUqqr6UWpfaiRH05Or
         DXFHTO3NFeF6S/t8/daPx/d75OTSMqHcAFP89QeqSSh8WLtpURCyh/kU3HyoIVpiioG+
         gk4fc7qV2HEjzCQ7TqjVNa4RS87dUZ8PGZvGDGr7bhWFuHwapQNLTpvct6xLp705UBA8
         QcmVWLNMU38K8PSGCfx4OSedpJhxxFHB+tZlCSgNkhiNEfoEZe3BK4MI8CkDFd3J8I/Z
         lylFWd0DTiEhWdLw+ahLNtzCQVKBJEGzNOnu1zHQenV35hlb60cEC4fvFx2XxlOtn9dI
         B4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353779; x=1794958579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhyHXjqCuztb63PxZ1O7LhMFys3Q28OminyWGfw7Ef4=;
        b=guWExx7zvl73p6FI7AbTriW++YANLALr0ag5nIzd7z+5dAYgb1/n77rEBXKzV9BPl7
         nltWBhKXeR1rPHF5LmB/bQWL8IoxLg3ned6OqL6s/dU6607pu2h91EF5JM20atrkhwLo
         UWxXzPx96s/fR8pmRdHEoroKBInojfdrdFw8mHdTZj5ZaEP1w2k8cdsmX2+UQZrtTuTo
         /ajsKThsCS+DViYmDGMY+60m88su+kDC0diDdPd13f4WD7tWiVivFNF0/yipEBU8h6Go
         OEI20tlTBlFvg3RF/p56+JuMQk3ioZSboCreyzUQB4Abkx3uU7sBJjBT+Cqaxq3lezkg
         fU5w==
X-Forwarded-Encrypted: i=1; AL+hErGHRfw//0cN357r6T1Kam6pkXhRGfc3s3Z2ipG1O3b1YJpUz/YJizQvXd6G/QQWDl2rOsDrYt7TgJbtk3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U7k0DPiUYBzGUDTRsA7l7MTrwQo+MWdcu/ArUs4cay35zsPSX
	CH6Vf2X1MiK56A4fPIHDAXJ//mAIXgI7XPZXUtB4zYHdWgN/YPMUG/PgILgHRcLem6Q=
X-Gm-Gg: AYBFou1XzgFaBiF82AguEkFnX+HYLR1OI4dH5M3+Md/tg9oYEKatbXtXn/jgNOeYKee
	W1vrynab6xg1dd19n1EvYEMH8F3dg8pTobwxVpx0rwUh3RY9ZjjL5Cw3BkvBOUdlzrtNhHZLMLF
	Rb4xRTxOz60l6h4z5euLIKeIydes+n6ByCAUdLRx9bUD7L72f57ZEBWcaOduq2LdKbI1UD0b91G
	S9kTsv5lWVggDu9OZO3+idd3hczvGXUvQdflSaor/HMQyT5asZGJQMmDcgIJhkO+h58Z4hEBmO4
	XSIkbWxqq4uo/tSyK6Sxi4bWaaREiNegsFn8HaIL0KaClpXAktH3BvUfmYlVorNIvguNNXefFVJ
	EyI51r/iTF+cRhEz4UaQw2CTFusdafJqBm6fE+zw0b09/m5gyWvHsWR33AlLD6769Jh0F9lUOal
	Ou2WmVjfE8DtuhHCdZoufJYT/dy5WOog/mJ8qXLrT2G/BydsQLpGxIc62FBaHloVKC/MT2wZMF2
	YUNWj7HrERoiNbXemiNzuwbKrkjR07lK3BfigqmntwJ64eFQM8z3deBA7l7bl6QZU7dWrwjd5Bm
	zuVAYk9rA+btl8Moj+rmXJkBW+ioEV/Lppox881xosjmaWV5qjPkDVYriJH8HorwNJFnZIcRTsr
	03BfSPv1yVqNImSoH1ku4nC25gD5frn8w0DdD4F2XTuzclWihK9D01dKppayVfoQHdJjW1Eg=
X-Received: by 2002:a05:690c:e14f:b0:8b3:3a68:f3af with SMTP id 00721157ae682-8b3a805e8c7mr3541447b3.23.1794353778972;
        Tue, 10 Nov 2026 15:36:18 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1541:987e:e160:f038])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933d1047sm31652577b3.19.2026.11.10.15.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:36:18 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 2/2] hfs: release preallocated blocks in hfs_file_truncate()
Date: Tue, 10 Nov 2026 15:36:09 -0800
Message-ID: <20261110233609.561557-3-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110233609.561557-1-slava@dubeyko.com>
References: <20261110233609.561557-1-slava@dubeyko.com>
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

hfs_get_block() extends a fork through hfs_extend_file(),
which allocates whole clumps. Also, hfs_inode_read_fork()
initializes alloc_blocks from the on-disk physical EOF,
while i_size and phys_size are set to the logical EOF.
As a result, alloc_blocks can be ahead of the number of
blocks really needed to hold i_size, even when phys_size
matches i_size.

hfs_file_truncate() returns early whenever i_size equals
phys_size, before it compares the required block count with
alloc_blocks. So, for example, a file whose size is aligned
on the block size keeps its clump preallocation after the
last close. Moreover, hfs_cat_delete() does not free the data
fork and relies on hfs_delete_inode() truncating the file to
zero size. If a file has zero logical size but allocated
blocks, the early return skips the truncation, and its blocks
remain marked as used in the volume bitmap after the file has
been deleted.

Compute the required block count first and return early only
when neither the size nor the allocation needs to be trimmed.
This keeps the intent of the original early return of not
dirtying an unchanged inode. The existing logic further down
already handles the case of blk_cnt being equal to alloc_blocks.

Fixes: f76d28d235cf ("[PATCH] hfs: don't dirty unchanged inode")
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfs/extent.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index 26357086517f..42231618f3f1 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -507,11 +507,20 @@ void hfs_file_truncate(struct inode *inode)
 		if (res)
 			inode->i_size = HFS_I(inode)->phys_size;
 		return;
-	} else if (inode->i_size == HFS_I(inode)->phys_size)
-		return;
+	}
+
 	size = inode->i_size + HFS_SB(sb)->alloc_blksz - 1;
 	blk_cnt = size / HFS_SB(sb)->alloc_blksz;
 	alloc_cnt = HFS_I(inode)->alloc_blocks;
+
+	/*
+	 * hfs_extend_file() allocates whole clumps, so alloc_blocks can
+	 * be ahead of phys_size even when phys_size matches i_size. Return
+	 * early only if neither the size nor the allocation needs trimming.
+	 */
+	if (inode->i_size == HFS_I(inode)->phys_size && blk_cnt == alloc_cnt)
+		return;
+
 	if (blk_cnt == alloc_cnt)
 		goto out;
 
-- 
2.43.0

