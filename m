Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519801;
	b=mikgfSj+NTfMcKVqWqg7TVKeheaSCK2IYSBRKnb7E5/TK9PnS86Mt2r1D9AjHS28G0Ep
	 EvIr0OqtKR/YfelmvPW1lAzY4Fefyr5/DCzdN5pFeShtzD2I1oN8V0ZHg4ShD1Ti774O6
	 oumkkSxsCH7Dd3rN1ArmqRh5E9MmT7IP+1D7njQ58rafJEQsik7o/67GiCwWMvDkY78A2
	 zZ/16wwF2CIH6uICVnScVrZ4s/tI5twAta7oVwCxdyEjCWOj9rbUjLUt2OmPZBIqovF4L
	 0P8J89mI24gFEOrFrxtqfhACLjG3BlB/thVbkD1csU9Y5P5HXMDMvdzmiTyAKj81kHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M6fq7p14U+tYgRDdS9W71/l4cxPwKXbIldK0rYG2pfM=;
	b=qyMcku3V/RWN5kmf4sFfypoznLGBm9tzRZG3IYwzmoHrlhKId8adp+n8sTsrRKEiZPeG
	 E+iVZVHlF+QDxsk4PZKMcSQi7+NmiLX8Q9o2i4QRsxZDMJ7UUIHxe7qNh2T5K0gS5bXy0
	 3xK8137DiN7kLkuGBDSJqD7xhBqyupyeB1438cKoU+oXdiCzovSA7uQGs2CIsqOLAeFjI
	 HkCxLR7WMHlAQbHhVtVmVbaYevcbKUaIA0t5RkudT9S3ZP6sHLiqKJpVLzrtJZ4wX71WR
	 ionSU2rKxrU7goFA62v/gduUHVwa2es+8OS99WmJ4xMqyil572U7AZXv9H18uhPbufQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxuYJtLK;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518EB606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518EB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxuYJtLK
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso146779eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519800; x=1795124600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6fq7p14U+tYgRDdS9W71/l4cxPwKXbIldK0rYG2pfM=;
        b=uxuYJtLKiIvBhnUhcOsUjVd3MOnY1dZrCy1HGJx3d0Oveq/FxKWJynpf06IJmxZgpw
         D0g1kCrTXC6X/do/ZUIcWTaORp/o4eIMTmxe00Rwz6HUhcnrF3nj2pL5u1K7n7UI2joO
         4qeiaIUqbf+/f9uI8XYzpLLx6+eB52EkaaesR4mYMDLmSErs9stlFVJvQEFTLlkddUQ1
         Q1mfPXYphNl7zfHC+kgzRj+vY1CYbncs1fuJMa0A60rwLV7HlIHA/IMJDog/OzlE8W9h
         jcN8iectHCTS07peoAKimjnw7anwcC3JiJxj02oKqUVv5hhpcuoCqMG7UUCgGEiyOKLv
         yyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519800; x=1795124600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6fq7p14U+tYgRDdS9W71/l4cxPwKXbIldK0rYG2pfM=;
        b=xnzgWzv7dPquCpgkjPD0E5bKccmSG3o55hwu9zIvFs4WCcr7A1LYjOXcERofdqHcx3
         PrT/vpak6wwE5/0O/R+urY/N8AKSBGCHjti145AESAnlV5yriH4fGb37JQrcf4cRi2B3
         uQhChtYpODWGNWxoRQXh5hlsNmmrfsezQ9zR6p0bwfhBeDo9NojvvG0Ok730DXFEV0tb
         ulXITgN3Uj3xmZj7e5NviUTn0wyp2lbb/EbpzPjo6seGKRyCJ1tVpWO5mYYAlueg/gyL
         ezlfYORcn1s5eTmbSnJBplvOewIxhDF5eG/8L8v5gPcXnndLxNaS0y+R9RsEyNPyZqSU
         Un6g==
X-Forwarded-Encrypted: i=1; AL+hErG8R35uMM0NUdNvecgUODsxxFMKFmWkW6hHDTv/5ggbOYNHG9SW+xTbTUF2yGumBAOss9+lmfUrga0zApg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5/EjtT2bsIzRmq0pfySZpKi/zB3cRG8KS61VwKFqUCFvUnb2s
	5WFKA0uC051mopygStxFpilyIg3LcVTxpZPWRw2PwEjsacmgYYEprZ+o
X-Gm-Gg: AYBFou1KoweeH1U0uO35vGgzMPVZAYNy4l50LYKVOvyd1n+d08SdMQDRBZobC+k8meh
	sLbJgK52p32rK7euPdazRsFWj5JRw/NnnvnxGvxIMf1nRUFXbA+BmtBAf2a6ZF1b4MEqrhuRfqs
	fVrEqcKdPPaFg5FrIkoNAjl9LeIdG10GQMqHp3qwe64FZKZoyJiGbajI2opFMKLH7XxFNNHAuqs
	OEDbZ6N8SdAiGQeisKMLjJN0HhgS+K1jlW5vUsLBj8zbhxNznM52I1bOM4fEHCJ2zt1MZpXMfCQ
	agOxuaTNvDh4wgmy4TIzho5BIgIvQ630Et107jhtuSB9S5ErqAPkGy630Anl/wfGL4eEn2x27ql
	TQZTaB/r5AHAY22X2Ejemm4c8Ss5HNwAIzuiyqXLI/Qjsd42nuFdUuN+NpblZXNX+T0IyLt8/tO
	X/7I3TKIBitguLeziqExaPAfrrah11uYe2X++0NyUrBJVbsVlyuBGjCQxpyQZWtFNTLKIA3WE+7
	QnZD5ly7hJC5pGRz3zM8YK5Q+z0IySetWLh5bm3YEeRZnkM6XtYw1YZb/1BeVpZ8vPoSBFqJCBw
	wzcO68pkpktsssuAamrHFu8qPAwjykmL0uKcvotHLuLyJ3/Lp+UBB2aVRWZJPUok+kUCyko0Oz/
	hI9OJqkIA1Ax0IPzy911tHs3/H6HwbArk3XGYBQ==
X-Received: by 2002:a05:7301:f2b:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-37968d8b5c6mr434742eec.40.1794519800357;
        Thu, 12 Nov 2026 13:43:20 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm1194466eec.27.2026.11.12.13.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:43:19 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 2/4] f2fs: require write permission for F2FS_IOC_RELEASE_COMPRESS_BLOCKS
Date: Thu, 12 Nov 2026 21:43:01 +0000
Message-ID: <20261112214303.16198-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112214303.16198-1-dennylin0707@gmail.com>
References: <20261112214303.16198-1-dennylin0707@gmail.com>
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

F2FS_IOC_RELEASE_COMPRESS_BLOCKS does not check who the caller is, so
any user who can open a compressed file, even read-only, can release
its compressed blocks. After that, writes to the file fail with -EPERM
until the blocks are reserved again or the file is truncated to zero.

Require write permission on the inode. inode_permission() does not
depend on how the file was opened, so a caller with write permission
can still release the blocks through a read-only file descriptor, as
f2fs_io and Android do.

Fixes: ef8d563f184e ("f2fs: introduce F2FS_IOC_RELEASE_COMPRESS_BLOCKS")
Suggested-by: Chao Yu <chao@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cfd24a5fa271..93f892b11915 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4238,6 +4238,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (inode_permission(file_mnt_idmap(filp), inode, MAY_WRITE))
+		return -EACCES;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
-- 
2.43.0

