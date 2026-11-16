Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824514;
	b=XOb+eQXCddG8na0em9I9HNQLzw5GbGWou0O0AbieXGePFM3KpblAg74fi47jLW4WBMXT
	 bnDEmpcWZ39m/HCbyNK4nsfULEhnr/AQp22coIbZoWR5Equkkr6LSmKqNMjA5Z1Eu4Vm8
	 iHkOFIxug3KqU0LUNr7ddmdDOBw7x3FsfimcDv8F3h/llA3jG0g+ZAY61QpFXgbcV6Zq1
	 rgeIfG13JOe1bYCaEb8PE24/XQKlb8/xo1bQMpwlGtR/dCtcL+VjZiQCm+8BBdOdtqu7H
	 oFHDd6fp9DURkhRXnqWlwbuQlwZTs7Z+II4rGsOG5sFgcR5aU9HPrAkbXq9fBvc+kEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fs2TY9KUSe9qhQmUoFf2CzU4kU5d/ayf9q/EM0cvmYA=;
	b=2xSKWrVIZzNSMMZnWZmy21QKJ4hwBWsBZHhXvxDIzzYuBJHEf4mBgRDt9rrqZBURBZz7
	 Jj+LYOOp6F6WyfCDsMzQ6QhS9Uio0YWRxFoHSvSby1hee+6qGTLli1ZzHrkf/CmVt6zkO
	 vgjsjcgjR8g9fOCTIggOVNtEjnFdYtce6s5vPZ0IDgy4+pBuwUwwc2Cq+UdkuSXrELskm
	 PA/72R/5pctqPIC9WaZfbwLinnUENaBr8pAJ2KHXPU04krPdlq9OF0+IeVfW3mbOq13Bv
	 woKZNt2SRxdXw/UejAVwXFN+D84Q8nRYqMrMtwmWr0G28at3QV0ZuXqhv+ZHRLG/BNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G12BKPSA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D83606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G12BKPSA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19307545e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824512; x=1795429312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fs2TY9KUSe9qhQmUoFf2CzU4kU5d/ayf9q/EM0cvmYA=;
        b=G12BKPSAtE/jQt9P/CAWiwgAvbvawUunvssMMW/QGhaX/xm16bPDTzSCpS80xCYiko
         5B9sN+baxG5tIyg3NoPQEhEdYTvlK/Q7HOktO4sQXruWbgJWBuOn9N+ZN0W5EbwLJIIL
         me67DqtGeXV9bDOTCQX2Ea3uLD9CBaTN17calg5eTS70OCEkOMIjkvPYJzlsUsTHow36
         ErxYRgUm2tRKZSn0xiSruYsC7WCov3Aco2cvK8QHqksbm0EBJblbJtDAXcZXv4PLTqob
         ry7mKXeDSJdQVzhj6Uj+CbOGdGE5QlzV7DI6mJ46TjzmCY6ZlrPimDsVfZNycfEtxyV0
         beWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824512; x=1795429312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fs2TY9KUSe9qhQmUoFf2CzU4kU5d/ayf9q/EM0cvmYA=;
        b=2bk/SWPAoAdB1lqlvO4hjgwosxreifDtQ+WSbIqLnQEfu9/aJdgq4IO2CvUf+RE236
         8Rh7E8dRqhKZEiExXMPo/Zsbas5LFAcgqOCYMAEb89wf4YT2NcS823TMoyMYWfyqgv6l
         Fs8TiiDqC6fVeohgmVBUbO994+QFHGdn0uOi5T5KCJ5K0rKDHiyHppZFuoTU6uTcpwgY
         Fl/jo35WBre9lifQMTwld3bwF9cI8gGQM7JT0+SAbqyKGPnFtGz4sX9SCWJEL98D6vgy
         M6zAKtmotbn7E2UrAvBzvVBxKSC8x3FmJ8jaSUgxrV+8lzsBVY4P1qHQg/14kR6rk+Kf
         qiFw==
X-Forwarded-Encrypted: i=1; AL+hErH9S0W0DcqCOuYWqFRj7js0Yeawd12SIeZ5h31uI1oNf17Ae7zSRs3IZpu8jCSdKUEO8QbTpLFVJFX8/XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sGloGq0+WKr/ytrZrds8im0qu4qrXX/qNwxUAfE6lmkkjXpNe
	EzsypEzI3yIFYok4u7BS/vfMkUwP6M7rVpwNQMTbKku/EOb6Re6cyVBC
X-Gm-Gg: AYBFou3qdo/4Vt87QIrV2FwvliFpVioFxsGqQrS7Y6mFXRifBekOg9u5tNXiT8Ijt3o
	TnMjOkpF6In0iubtgolYsBcrXOtRwbilkzMlTpVSLuy0F1wUcc63h2rBcaGHqcKTteNOg8R/Wxl
	5sKox0ucberRwh+d7ZBDYXC+3rC+GThIzE515uwrpyawIUdNirRUOqGs24N230dL8hj1f9pIRL2
	rnqII/c5TK/6EyTNy/oapnK8tDy2q8hKHNzv57lTscTBfE7/ESdQz86xJxTDp0chKRRt3cULEwP
	L66sHZeOWIb1qWWppA8/fflKh+OtPkw3+9bSUmtf6OWORMmk98OUYrab9NJ5QKY8lS4GqI8sF9b
	Yk3nZ/jVa92H/mXT0CC0SVYjoEL7Fky1t4DxtAelLwOD39NCPa/JLDBsodzdhD1flsLfqtkHrLc
	FrJy46f2pdgGt3ucexBohl78Umtz0jj24NgzCMvM8kIZfcaSK+Q5CaecgHB5eAvnHosB9lwItXK
	S5ii+Fpjyh8xMyjdAgOjS9jezbD70gr9M/nEz0UySHBkyi7W2DSlyQWwwLUAxaF/BAlFaFr+R1j
	hb3QGB4nv/18H2PK9HX5IA==
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr155965845e9.4.1794824512214;
        Mon, 16 Nov 2026 02:21:52 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm98804795e9.2.2026.11.16.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:21:51 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Su Hui <suhui@nfschina.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.12] fs/stat.c: avoid harmless garbage value problem in vfs_statx_path()
Date: Mon, 16 Nov 2026 17:21:29 +0700
Message-ID: <20261116102130.80651-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Su Hui <suhui@nfschina.com>

commit 0fac3ed473dd2955053be6671cdd747807f5e488 upstream.

Clang static checker(scan-build) warning:
fs/stat.c:287:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  287 |                 stat->result_mask |= STATX_MNT_ID_UNIQUE;
      |                 ~~~~~~~~~~~~~~~~~ ^
fs/stat.c:290:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  290 |                 stat->result_mask |= STATX_MNT_ID;

When vfs_getattr() failed because of security_inode_getattr(), 'stat' is
uninitialized. In this case, there is a harmless garbage problem in
vfs_statx_path(). It's better to return error directly when
vfs_getattr() failed, avoiding garbage value and more clearly.

Signed-off-by: Su Hui <suhui@nfschina.com>
Link: https://lore.kernel.org/r/20250119025946.1168957-1-suhui@nfschina.com
Signed-off-by: Christian Brauner <brauner@kernel.org>
Fixes: 98d2b4308197 ("add unique mount ID")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 fs/stat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/stat.c b/fs/stat.c
index 80344764a329..5aa8f296e8ee 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -253,6 +253,8 @@ static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
 			  u32 request_mask)
 {
 	int error = vfs_getattr(path, stat, request_mask, flags);
+	if (error)
+		return error;
 
 	if (request_mask & STATX_MNT_ID_UNIQUE) {
 		stat->mnt_id = real_mount(path->mnt)->mnt_id_unique;
@@ -274,7 +276,7 @@ static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
 	if (S_ISBLK(stat->mode))
 		bdev_statx(path, stat, request_mask);
 
-	return error;
+	return 0;
 }
 
 static int vfs_statx_fd(int fd, int flags, struct kstat *stat,
-- 
2.55.0

