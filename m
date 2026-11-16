Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855533;
	b=3ZkMPRnDtlA9nBPyYZ2f9npKT5fxoXgk7kWaz/cy1fssisUrglCgDJhontF9mKG1YBHX
	 KSBlz97ag3uQ7zxkRjojGF7ures0Yr+/ZHCCnc3b8w20VUhKjsWlwB32Lyltwc60RmQ7x
	 iIcSkXjEWD4OLO3LGaXpUpYYSIBxXxtrEf5pUBwmncFg0T5FEJ0vIADppz+Z1rgRMQbEe
	 ecMWsuWhCxkKJ6Kgzzbk0+nFojgM7rFVFEnxPr9+CQU1BbExcO/z8NDz+S8cNVfrPBtF7
	 xnVpAdiBdBjJYlyfoPOLAwRzgXgUNlh2sstKU2GfFfIykdQRjw6EqOM8Q4PpS3mOZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ad5dFKw+CLO5JX/Tnr2WBnwMJWSG8HNIuJVYxZG860s=;
	b=LA57GNtWjWRjlGJYy64oZwa+evkJ5c6sFpjwj/WyXgzEwVfWyT6cZC8Cemm58Iucgy0b
	 Eo3TOdtEZ1h++qgQDYxTOy9Pyesj/IWXw+mXVTjeQSSEC6AeeLcT7mkACmVjT5rgGLXzT
	 N4wnNAVEZhMPIf4EyibFBXcWLNwiux7ZkyYTa2NGODHEcfu/NaqeCjBqxRrHgyd5q2plM
	 EiUtyhT32iXeIwISRTscJPZcMx9iiz/j2aHHnyhU/xWdZl6O/7cWWTeyYt5RB6pkS+TNB
	 i+zcCK0J2wcxezDuLfyFLaZeJ11lcrWC9YhktukZ/NQvrvcl1jYbdQU6H/9EPphQLhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0g2YEcD;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C8606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1C8606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0g2YEcD
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso1291175eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855522; x=1795460322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad5dFKw+CLO5JX/Tnr2WBnwMJWSG8HNIuJVYxZG860s=;
        b=i0g2YEcDeidHN8wm9CcxCq5SoRkb3tmS/L72+eeURILaUQ/CB39bmWdQIIN3/I+WLX
         oCl4WBaNj/7nc5ujxBVziB8HdlERBejMx3BJagy/xvatfLb6jzIqAyzgUEN4rfC+qXz8
         MIXtNs9gcR8xw636Ke/vZ+piHf/xBHJKuRgFLc5sXt9dBhOKCqq7vpRKj4DdXiY7sHDo
         kealraA1vD2tMcMxuLIOFZRbvG38/H51s0DGy4M0QPSQnt27mNkmQkernnAqp6aTxqLM
         +o+9zXGqD+59W5R96qUgG4AMBsVUZoCgcUCrNow+uPFDozEQjCXMQpHkL0uiAOYzq8TE
         i/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855522; x=1795460322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad5dFKw+CLO5JX/Tnr2WBnwMJWSG8HNIuJVYxZG860s=;
        b=JH/QPXKPDBNwPmqb9PJ3NmX0vvBSJ7jgUyUOiY4kWWYbd7xkaXgn+9vb4YhYJeDDug
         9Mf2Hn7D/xr/8LJ2pZCFK7jSDM9sOY8yhAOf+cHRIPUEM36oSnRAl1hdTqphJMyAbIhx
         MdeNyT+Qu3ozfcktMmn4AJa2OJix4YANaLSLQrAJ7mfKN/BHv0zpHvqvqfGsq3vWDOdu
         6qz6V1pCHM8DUoRuDO43k/4QuuhxvRFc4zkVATLhxFMcoIQ+RR2p8LqBkUmPiaW0d4LG
         zeuE3bKtYfwpM0qe666gQrxxf7r5T8MXA27NsL4Vit3C/GTE56QxYjtbhONURAWO+9dh
         wTmg==
X-Forwarded-Encrypted: i=1; AL+hErFJdpaeFts733+pNBKL/mZqJRScznuDl+uowR0TYhC9Ps37XNxZX3IScyJtwWvSbOm9+L1qNn/9xtGEKK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N4YjidUc7GMQ7WPVhgPrts9/LVjN5cptyy1VAEp5A/uQt39ik
	4Oun+1ZRZfNbGFHbpeIY+7Kl0+WFnt7amC+/UKjRwVwggk7SynjOUCkd
X-Gm-Gg: AZFdTZeVrlzrmo7V17woJYOOsM33XDk1y6tQIhppFgiS6L/IjV/kCglMp3u+xpO4vdQ
	TzGNTfNk/4B3dImgRrw74kO23Wx7Hr3WtbfTWj5Y0MiGt7Km+tjExAvL5UfW8hNx1hY5Rj1MGAu
	C1KwErnSr6OIeFOX5A/60A3o9NhthM32Sh5rr4qv6JBE/3RbxeIL2AY/TrtNTwrgWrFnKleATVD
	HDlN9I34URxySM8OdcNOmPovpGScv02hQI9NeJ31nVkTw3qItHx0sjodJYfdPoygktAdXxGqPXt
	qKLZc0sQxchmhesLSq47feEQaeStqDawEshLwIlAbt8aH7i9jU20Kbe5RfRRcoTHuCA5TGi5ViW
	eY6Pi5p9u6iX591d3W7fcyEUcp5CFkvTMIixEVQva5yqLmDKEAdJaLssCdw6WmQT2KDiSlmwAaO
	bqtcLcFG3xW6EkJWyflJHUcw4ueOcme0BbMyX8htnB/WZbuDg0iNBxvH3df55ODaTMMu6A6SNN0
	4G9M2yTlTL1kK0TmtPBjkR27yVIJddP7POHd2e3Vh0Ssbhbxg1LlI6DvSvnZMUzFoAo+MtTRKRp
	FjE8SKpVfRlMIljG3Vt7yc8WHxjrP0rjNq6cdSj3T3Yet18n1s4Fg6uMqGhdn/oijW8619DkeK+
	4DvmtzSVpIQlLmeWrP55G035Y0fV8IZkZl98/2YhUqI9uwLeDpCGEqONbFMY=
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr11080301eec.28.1794855522299;
        Mon, 16 Nov 2026 10:58:42 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm35583453eec.26.2026.11.16.10.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:58:41 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	namjae.jeon@samsung.com,
	a.sangwan@samsung.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] ext4: check RLIMIT_FSIZE in insert range
Date: Mon, 16 Nov 2026 18:58:10 +0000
Message-ID: <20261116185810.82581-1-dennylin0707@gmail.com>
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
Content-Transfer-Encoding: 8bit

ext4_insert_range() grows the file by len bytes but only checks the new
size against s_maxbytes. FALLOC_FL_INSERT_RANGE can therefore make a
file larger than RLIMIT_FSIZE allows, while ftruncate() and the
fallocate() modes that extend a file fail with -EFBIG and SIGXFSZ. xfs,
f2fs and ntfs3 already refuse to insert a range past the limit.

Fix this by validating the new size with inode_newsize_ok(), as
ext4_do_fallocate() and ext4_zero_range() do.

Fixes: 331573febb6a ("ext4: Add support FALLOC_FL_INSERT_RANGE for fallocate")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ext4/extents.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index ad0d80e33f60..94b9e091ef5f 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -5803,6 +5803,9 @@ static int ext4_insert_range(struct file *file, loff_t offset, loff_t len)
 	/* Check whether the maximum file size would be exceeded */
 	if (len > inode->i_sb->s_maxbytes - inode->i_size)
 		return -EFBIG;
+	ret = inode_newsize_ok(inode, inode->i_size + len);
+	if (ret)
+		return ret;
 
 	/*
 	 * Persist the pending zeroed EOF block to ensure i_disksize
-- 
2.43.0

