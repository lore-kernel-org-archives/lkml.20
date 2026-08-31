Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4784DBD8E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183566; cv=none; b=KcZp89Dre6KId0KTOxTpqNhigkO7apk8ltkmN3xRvOxIAy8XhUZDDe9Nst+A0DyeXZQzL3+HzFIbI65sogO4erYfhTI8iTLBlAQAIYxIIk8PPTINxlKHNrXB4Sy5gVJNgOjsYA3NbXInHZfW8kO94nhdb8WKE9ww0DUfU4k+9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183566; c=relaxed/simple;
	bh=n2HJ036Cnol797H+kzt7lH+MsJMuyFVD7H4q/mcI9OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DqE5tYOo0HwHpK8/2hqSK9sER7HShzTi3PCwUfw507l1zwGhxQu25/Toy0dvjXQIJaYxQFDaeQ0NgtneuZttTT28rKQz+xjjCty6WOHBDYSXhm/qtlQMCbC7y9Vwx2gvDvBlW5W0RyDCneZBPOe0sq9ExbAJdufqwuUP3qzz/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2iMQkbA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2iMQkbA"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso4675295a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183563; x=1788788363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sZucnVJNR3hl6h09dKjZV+Hmp15h2B10GaDWcNF5eeE=;
        b=R2iMQkbANTqVk/FCMCXejkahPAxFTt7pddovHaJrwtgX77fan7i4ytlnk9I2Gg98sW
         PdG7qsbf6EONUZXtkWxRDil3FR7KdiAGKO8Kd4PRTp1zWXzwo8V4gJ09uYvHg1asX+Zh
         kxT+eqCK0ipLfv664MEBZHXq4h3EnZdBiYYPuAeO6+ncgWiNwa15wCzwB1oBqlqpQnoM
         bFannlsww7BEA7WkTlnQ5FrhV8G10APQjH2KiuqdUegXGtjcWG8mQKzOp2OXY0QWvo5t
         HxKEo40LhO8jRMmomyAl/0cnyBHBMBK0sjhl6Hnnwg5zkacq50lbZd1rbkHZNxC32DIi
         UoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183563; x=1788788363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZucnVJNR3hl6h09dKjZV+Hmp15h2B10GaDWcNF5eeE=;
        b=jLJgT2lmRmUoc1ECuOg3tKD8oBi0gXpPtcZnolE2YzzBDqm2Wtrl1w4lhZqWnJ87qM
         XLYgBH8ONlZUPnpSsK8E+4Zm8jHv4m5QqMOJ9OZBq6BDHdMRxwOIHWKno0Lmb25IpbKs
         tETJQYHuSXQ6on14I/fSNobFSlU8iiAZlvLF0nFRz/L6RACaYTX0v2YnyNQdy4Up3Kcv
         ExIx1bQUj+ecDBckpW5XgQQpbE/MMqKRAdF4Rt4IJpiZxwxr66qoBPc0rp+nl3x0kzJz
         dJE0C6qFcpdMNJzbQchDcy7Z6awm/zy3N6K4RNaQxhmjKTwMIgyUM86U6vG4V+QK3afH
         y+Ow==
X-Forwarded-Encrypted: i=1; AHgh+RpePIYXk+Hmd22Rbj81CY7pHlvhSCBNp7DSJ/rVFpfFYID042UD28ZCbmQdloSxil/OpF92lw10NA0UbMU=@vger.kernel.org
X-Gm-Message-State: AFuF++mLMRc4UI1laad4dWI/gOPIxOkUojB4Ak9FeAlkjjrVvkZuw/X4
	2iTEeyAnKb8Ph9LYHUoCUjXEI3Fwjadz5hPWSNnyXnEdz82oFAsEvPLR
X-Gm-Gg: AYBFou3o3QvoIrhWWNdPjcxnm0lfbrMqyB5e6545iu3a+95cjliQ7v3+OFs8OSQ2qK+
	tCY4pcn5+fGBngn5yPHUozdY06Lw6oHK6UcajNIm3r5PX2WKbJLfnN5k0aVJ0tRBVfz2wDp5U+E
	YNAhbDv15VrKaopaqXQ68uzHiqyda4UGvTBVBZeA3HyndHQzfw7eJqDfSwSHqaoF8XNBG3zTySI
	BzA5dzwumLC9ZWoOU6iEa25UJ4sfgQSNZQujXEt0zfPb5PdQ5nswPV/CXUoFlN/exKHJwa18MQ3
	H1ddtQB2Rd6Aex90j8XRtLxy/YvSkbw2MolSwqE28kH0c7cDrkXWyswgqxivmUfhPgD/TT7bgtE
	E5Q6opvdA6+Qsgzmp3Ycio6tuI6PlRsLW4lxhK7H38xsr+0dXJQJ03TZL4KBnRDFOQZVGk26TjO
	xAIxd5pDVSYC6emjJ7fj1TehmOKsMdrTWTg+n9zmSGlrVZl9gjqO1OPfOmISeNCLZ/BgMIvHy85
	/3bOvGSi15I4hBvPxk22Pln
X-Received: by 2002:a17:90b:5102:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-396d0ea862fmr43416157a91.6.1788183562538;
        Mon, 31 Aug 2026 06:39:22 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398c3a10e6esm10538247a91.13.2026.08.31.06.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:39:21 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH] f2fs: wait for inode record work before clearing ino bitmaps
Date: Mon, 31 Aug 2026 21:39:16 +0800
Message-ID: <20260831133916.2110470-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

APPEND/UPDATE inode state recording was moved to the inode eviction
workqueue. These entries were later converted to bitmap values stored in
XArrays, but the workqueue drain was left behind in the list cleanup loop
where it is now a no-op.

During unmount, inode eviction work can therefore remain queued when
f2fs_release_ino_entry() destroys the bitmap XArrays. A delayed worker can
repopulate them before the workqueue is finally destroyed, leaking newly
allocated XArray nodes when the F2FS superblock is freed.

Wait for APPEND/UPDATE inode record work before destroying each bitmap
XArray, restoring the required ordering.

Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/checkpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 4b59f30ef45d..400eab730c14 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -902,6 +902,8 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
 	for (i = APPEND_INO; i < MAX_INO_ENTRY; i++) {
 		struct inode_management *im = &sbi->im[i];
 
+		f2fs_wait_for_inode_record(sbi, i);
+
 		spin_lock(&im->ino_lock);
 		xa_destroy(&im->ino_root);
 		spin_unlock(&im->ino_lock);
