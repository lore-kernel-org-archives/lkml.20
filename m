Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923533;
	b=adWhsV7atmAr9o6g2nEqqfyhcFtodwK4TtkMqfg1ORVm2mWHuJk1ZaBO+A623wzGAttx
	 Sb8uB4lE95aMfqFJELgnrjQIaqP4TXpr7YvrnQkyOsnDFl6ij7FjpoWE+kxSx/MsPwXHx
	 bFfEtyQQh4dQsjlCtazCBfj4oP775Ct9o9oKraCcKI3G5pcZ9rsn9L8Eibsxksm1yOZpt
	 pexw7hF4BV/lcKgvvpw5r3SFtKf/LN/Nk+zSXxqM/ZFyYevayOaGbPy2XLyFx4f3xnbgF
	 j/lKYysknuMbxjB8wcEGUcOG8t0wMGJx2pBJimumuhNsIH0C5U3PLr/jRX/fSHxvdyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X9eeST+DTiB0/P5zHssKOgXfvR+02Yq9ClIKmFNmHPk=;
	b=Grv52xZupQhwAcFxgHENDZYez6kBl8k3+AI31xIOL8A6uzm8wQCU3idYVnJx6C5/y+lf
	 IKfxnHTgNZnkeQ/iFNFEVRuzFW3u95CfKNqRv+eHLqfCRQNIHG27Of9KEbtfxMoLzK6My
	 FTzi3TdQ9vEL1TfPjbQcy+XJKhrUTdRhC/HKv92z1w15YJJ9cAXsY6qIy0JPdRFvfdjOn
	 hgsH/UThIibuZ/dSsiRHU7bLnZLZ4ljQedIGDQ+aEViO4ZlRoKZo1lbhoG7SaLzdriHsP
	 BmySG6ijREih9eKg1X5+jT6Dx+8GK5PFQ5E/4AGbR4LweejTV2leo0/GTnKI4WHaT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzy9RLke;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54088606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54088606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzy9RLke
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2108576a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923533; x=1795528333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9eeST+DTiB0/P5zHssKOgXfvR+02Yq9ClIKmFNmHPk=;
        b=vzy9RLkeCJKIEWkEHVhJCVUsJ/6sFeknsgnHsqgvE3UqZvqgGs/OtiRJsZtM83ea/1
         H6sCrwzmyZw7Dpx7VOo2A5lV82HGhIS86JiFmNZpHcFFygEpLLgg/0UpWopedKgqs4dw
         1WanW1oYKDPVyvcZdFipmynShUkjTAwlR4RRE+iZvSN1XVc/cgTXDOrQtJWWvhdhv/8g
         dmqt5txFPziJxsTKekhwhjpZYFm1a/rxCz4c4qpSUkp484a631OqjF5bYaq28b1DLjVx
         hnj88rC8+Xgf+yMoUqnOmxZ8goi790B+C9jcuEpUb2xs88n6kCITZjWgb+NPGp3kGVd0
         szbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923533; x=1795528333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9eeST+DTiB0/P5zHssKOgXfvR+02Yq9ClIKmFNmHPk=;
        b=mSUndW/1zmiggPT3x4Xa2ijcVq6yug+0EssvTsXqjxm5XWVSV1XWJYNESiVF16NKmd
         6ehhEAPrgZ3WZ0Ey2xvKxYfNLtIrd0x2pWuYKrefgWH2g2D2LZ3ARstWTxOUILFUo6ZP
         g516ISXCjdNKl6cdqQZvUY0NFT6aAYU7pikhktt4LVOtumrki7A/73jgjW+t88yz0yg6
         vpstOp6jufZFUbCUVRKPkkklulgfepid+WXfVOfuFqMmCxNQASgHij1cJcap7YUAkixn
         jo/xrqW0ZJujzPASUpyvKOKXU0L+iZU9ELoQKiLVjQRVeqFU81MeSeqlRthgUIH9n60e
         KaRA==
X-Forwarded-Encrypted: i=1; AL+hErGw39HlZIr7yf0XaryVXpfIPJjY0eArqM6APBmMUxtMkTVSDrpXdgvrnNnUi8mriVPEfzNRtXK7B75mPik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rxHp7rqRneFPRhcMxmqP9dqX26YyY6vuOLekD3XhUNYIxGat4
	6MCD4kxeoWOAVZLIroJPUJ1Cr0Hdf0NDBzZSj1KQMoTMajbUoFu8zk6Z
X-Gm-Gg: AZFdTZc/Lhs8U/ihnDFlc1p+hvbjU+D3hbLS+ZxDggBNYWJntYjwE9Od7qHmFJywTXi
	Dt48QYK3SFk5ZvaLBkgpvpJJa37kNwaOu90inMTqn6GxuZzz39lygnNGDBW2LOWBXIPwtqmLlqC
	rNH4PmuV+yXsrkv9OnB6CgE+jgl/EC6OQ6BJbvKc3tbIdNMORZZ0HqvfshsCJWZtelCC9MGDt5z
	+yQSA1O+IUqp9XYTK9jAgAOViX0aRpG8JKUx8inezgP5DogNfRRr3r9D7ejTplVOCdc2B4nWcth
	9SqKwyeJx4g6WCn9tIyttJjgVIr8kXtZzMHhEiCCKJUj60jB+PHL2AMzTZ+ZpYXiWZeiETkET/G
	8t8WKfs16/pi1ZdOLTvDU2Dz7xvr12IJFlnvWPNIOG5HqSWkkWh5TpqCxIE6M5YHjrBZcoRBzwH
	9pphmFCRFUHHCFbGCEtz75dUe2dQRA3nTlqO6/7AY9usAYBkiC/Qu01ZXAd45qZd4Cf0JrKoUy4
	0933ranGq3n13A3bk/UGiqcULm9wUSDOC9W/VoBHTzoIxyS4G3KPR6RAFFkCLRgbf0n7E1rmq/7
	SF5fQqwb8rLwoByL6A6fc4FaHD+UDTbKBahwPCE9vR6J/lZcupHmSlhrFz44O2P+30/dq8M=
X-Received: by 2002:a17:903:3845:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2ee0da9892dmr141649045ad.18.1794923532596;
        Tue, 17 Nov 2026 05:52:12 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:52:12 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] inotify: copy full qstr length for event names
Date: Tue, 17 Nov 2026 22:51:36 +0900
Message-ID: <20261117135146.3174252-3-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
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

inotify_handle_inode_event() allocates the variable-length event via
kmalloc(), reserving name->len + 1 bytes for event->name, and stores
name->len in event->name_len. strscpy() stops at an embedded NUL in
name->name, leaving the trailing name bytes uninitialized.
copy_event_to_user() copies event->name_len bytes from that buffer to
userspace, leaking uninitialized kernel slab memory. The terminator
and alignment padding are zeroed separately in userspace.

Use memcpy() to copy the full qstr length and write the terminator
separately, as __d_alloc() and d_path() handle length-bearing names.

Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Use memcpy() as suggested by Amir Goldstein and terminate at name->len.
- Copy only the valid qstr bytes to avoid a one-byte read past name->name.

 fs/notify/inotify/inotify_fsnotify.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 6e3af6452dcc..ecbfc9b4e99c 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -120,8 +120,10 @@ int inotify_handle_inode_event(struct fsnotify_mark *inode_mark, u32 mask,
 	event->wd = wd;
 	event->sync_cookie = cookie;
 	event->name_len = len;
-	if (len)
-		strscpy(event->name, name->name, event->name_len + 1);
+	if (len) {
+		memcpy(event->name, name->name, len);
+		event->name[len] = '\0';
+	}
 
 	ret = fsnotify_add_event(group, fsn_event, inotify_merge);
 	if (ret) {
