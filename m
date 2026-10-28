Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164731;
	b=2wQVHBAlK17wFVDwNEUzryfGAxz5rkS/0AS6rbC1q0X8zu1A3WBQeLZm1sp0M8GM4BIR
	 ZC/kmNOLdAvhAqMXWSeZG+fv/W6tnlrHnNAdos59ra4WPrEfaj2zY74nXx9gZp4AhTIjR
	 AlWUvRrADM9P8Sr4/CHhEURYGNx+XLCfV5DM34Xcspa4csL2wQZ67yqZZ9BneAuNfZJd/
	 Nx7rqpe3j9vDLgLYITxeq+Iq+rZsPeKctRN9fMWabI/Ehux6gWGsYSAnn/sdQBakN28WC
	 4EIlmf4zblOvf4BER+38uDt9hwLWPWRCfeCMHr1Ge46oy+k2fn0rd+H9wo60yQaeGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kxy/cpuRLXwPgzqyyNI31i8ZGa3rFt0MAU8X+pyKMqo=;
	b=nHxYSEu4+uhXrhz3wQmiiOTmgZfTTDD1Q6FFCNEWplEhcu1hEaq7BNeUycKejOFDoQgh
	 CzO6LqlHWpjW3jXr5G1vay46i8a6Uy7iOnj7yvlIfViQI33n4zRRSFfO4yQHD44hwX/i1
	 6z9eOlt78IZQiWUkNLa4aJVE7h4F7nSFe1I1HUqRbhAHjTtmyQLOb5CN0N3Ew5ExPTH3o
	 8zrh6CKjuZnLqhHHieiE32xSxYFOxUuKDwMinvADRs247K5Qo7H0efSimP8EDN3rculQ+
	 K/iWZ/0npecP+n6p7+knCnKIOGwTfaIhRzgpzeZfKJMuDYxl0Sy8xepwsl2H7yrYehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJf2EMB0;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A915606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A915606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJf2EMB0
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so274589eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793164730; x=1793769530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kxy/cpuRLXwPgzqyyNI31i8ZGa3rFt0MAU8X+pyKMqo=;
        b=yJf2EMB05cImY6eUhFRCOc5AGV1CkozLwUQ5pe0P3IkTdgvxw8448PUxmJm0m4XAI3
         mPGB/N6EtGuzc6y3anp+QVCCiOiawuIV5HUMLp2Y4GUTOznRdtS84gYU3cXkBH6/IptY
         jau/GP1slvIM9ROVVAf6Co5Sam744BQlTW1hmA5+PCnignrsouAlMOU1hgUHedrShfYb
         coQJXQSPlc6VGw0H8xqOFwJROAZdhtGKP+pe6kWAfXwNHz5tqlywmBVAcGt12IDyRFEy
         /wk8BCLVKHzlfkUBjBxMuh2g4tfc50eGSD6nDdoFUPZ7q5MYVAjj3FlBzSH2EcdxahrU
         qy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164730; x=1793769530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxy/cpuRLXwPgzqyyNI31i8ZGa3rFt0MAU8X+pyKMqo=;
        b=S8Jya/4/kkBIhn2QElqFI6TfLecIvT3pG84i3X1/8y0G5TxiQ9A1dEfy3oMVNAE+uf
         ttlDVEH2GEDnqNGeXRVNRMcc2STyT9fcsm7KilFB3OGCrXXi3/ggbVaMvfsXDZGhmtEL
         xh6xQohCsNUdcKj/TK7uQeDG9iNMIJmeC59/45ZqrJcb767e0B2rdceF+yix8eY6Z2QK
         UluzuuM56Doxn1aSlFw6gAolJiEFwy/Z1GSPBg/YuvZBwr4f8PnOF3yzQJEKJAq0OuwQ
         XCkgrKI/xl79nqZaLzNJcD+jSQrV/SGSVuivc60o0z8Af6MAn8kEFEE221I/N02Sghgm
         ekPA==
X-Forwarded-Encrypted: i=1; AKwUvBz/HZzJTzCFJNyYQHjYHb0yfHcFoyzrC8K3Z4CrqM7bgQfjlQ9gW87VxA1/Zqy/yGuKJznWlYviVIPRwMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwuMaJAMThP4mzpLrSsK3B1hw3CINzMqOTQ8XLhmYHVRKvPmCe
	u/BhvOgg2d4G0r7SMoP3DXHI/2j1BKVEX5DzzIbU6EhdMzYi2M0r3V+L
X-Gm-Gg: AYBFou1k2/VHhLf16XwZzlP/SomzDWJuOGu+ivU3TzIJZOTkEhNqflvHmyz4kzqc0n+
	/qUzei8XwVp91MSDQpeUwchB5EF1yFv9xWz8BcZffUqDAjfDCukgYqrZLku67ncEHWjQIwgdmtn
	L8pRabknHzkUx5ed5LPPSA6jC2rzcDJJL/+u/IIMovQkLfJHm8DqUbpjP/KjG4sJb+/7q72eXt9
	WOvFU6bBiVeMxjU2SCBVBxEV2YsPMS0TZ5y/iBXQm//w907HkwQ7Mj73xg0DdWkw86FxoYgsd1b
	Aaff4IxrhXFyGseJX9WmQdKS1+l6utRpFS+f6jaKTX6T8LmAbLPwaE6ifI/F5E9kodqDTV7Zu1U
	LLmn/xXZ5BZtsTqRWV0/+4S2jiKYXs2r8tGiG6tHoowvO6IgtJw7oR2egJygdLdSpDPirjz1FqD
	E4EJUo6DnpQxVecpGufedqdzR0znuXzs/B1yNsHPDHaykjVzUNt02pj9BEZnmZAoBHL8N7hbKpc
	CqR5HxwG/shJsp+irR2RsVDcHuJTUWTxPfJBFLxmrc7E0VhHgpL6SM6/PscIA4oxIA0ysC+hRZW
	G1hc3qORYj13psqn7vhAUe9pb48+y4qarnvbdnjGqOaezpDyargsOHhX
X-Received: by 2002:a05:693c:401a:b0:36a:1b95:fc75 with SMTP id 5a478bee46e88-36a2040717fmr2696113eec.35.1793164730087;
        Tue, 27 Oct 2026 22:18:50 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm5255949eec.2.2026.10.27.22.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:18:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hughd@google.com
Cc: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	tim.c.chen@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] shmem: clamp negative used-block samples in statfs
Date: Wed, 28 Oct 2026 05:18:26 +0000
Message-ID: <20261028051826.23058-1-dennylin0707@gmail.com>
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

percpu_counter_sum() holds the counter lock while scanning the per-CPU
values, but local updates can still proceed. Concurrent allocation and
freeing on different CPUs can therefore produce a negative sample even
though the number of used tmpfs blocks cannot be negative.

shmem_statfs() subtracts this sample from max_blocks, reporting more free
blocks than the filesystem's total. With a one-page file being written
and truncated on separate CPUs, GNU df reports negative used space, for
example 67108864 total bytes, -28672 used and 67137536 available.

Use percpu_counter_sum_positive() to clamp a negative sample to zero.
This keeps the existing best-effort accounting in statfs and does not
change allocation or limit enforcement.

Fixes: 7e496299d4d2 ("tmpfs: make tmpfs scalable with percpu_counter for used blocks")
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Describe the accounting as best-effort, as suggested by Tim Chen.
- Add Tim Chen's Reviewed-by.
- No code changes.

 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index d97fc32e7c94..092bb45a076c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4005,7 +4005,7 @@ static int shmem_statfs(struct dentry *dentry, struct kstatfs *buf)
 		buf->f_blocks = sbinfo->max_blocks;
 		buf->f_bavail =
 		buf->f_bfree  = sbinfo->max_blocks -
-				percpu_counter_sum(&sbinfo->used_blocks);
+				percpu_counter_sum_positive(&sbinfo->used_blocks);
 	}
 	if (sbinfo->max_inodes) {
 		buf->f_files = sbinfo->max_inodes;
-- 
2.43.0

