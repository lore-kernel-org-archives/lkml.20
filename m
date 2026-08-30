Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6739F190
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086483; cv=none; b=tvXqwrH0nQby37hbWfMqLJc++jEXJtgjKQUOuG94+54GJ6KVR2ee/VDT1kxMICwrv7ypnOYaz9UDlIyaDLzET8Jn7oyXu10IsXwAZS2bUf/GEwlZBzfjxCAtk/d8h/DtzKNBsaQWkEbd9RhemN4kY9f/0wsVClWus+EirVh2Cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086483; c=relaxed/simple;
	bh=fgitz9gFk0KCNTWFxgbMkH/LFKs4wfXCDg/PXbImPy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBuv+Insr3ND/ExTNC9Ks04kJtElo79vToJWN4whUfEwwYH/Jxy4Z8OuF2lYBrBMqdoTnyW1ByhlTyDmHKy3ielDKO7/M4LJISPsCpw4kSWek1PwG9eDrAZndLnOGjnvJYQep8mt4UyP/6RxA0Lwf8vnvC0cej7xL9DviOaAtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQpDD/jH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQpDD/jH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso25086115ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788086482; x=1788691282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=znTHXW0vFaDslWJG9EPjkjXJi2Xw+kqh5VdDYY4ZDpc=;
        b=OQpDD/jHsm0lqm4/Dq63IswmJFmUY5D+gPqaH55pC/LAufUy/y04QlIOEYqL6/C0cj
         9phT/ziwgqMcGY+vMM4xKXNn47mxKTvxPDko3/q5+rAW4Erc7/HmkfKA7UkC1kCrUu5w
         qPLX9LU1rach3Oa2dC63vuSimqWwxn0+VVHtamTojbnENcrjofREw/UN2PcIHhjkO71D
         T8+PV5j1Xsg6uN7snXTcDJRE27S4V7P1rJBrGVENr56Oi6nFg3AgbavbAg/U2jPyebvQ
         vB0SEpzMzUfMA3YvMSy54pwLTHwJfSEmnje4dWY/e8D4mFXmkdSDLef5iBFga4qW9j0X
         K07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086482; x=1788691282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znTHXW0vFaDslWJG9EPjkjXJi2Xw+kqh5VdDYY4ZDpc=;
        b=hzvh0OYHFADmfKKhR2IUC6T5h0sVdJWfBJrl0kneWZGnANwf6s7pCjhQ1rvaFptTD+
         oj8xzQOCk8Kf0z48H6BSOb8G28Kb25wSUEZsm2/ApyUCHcf7eIEhJT+zK8TyiBIAKpJj
         L2bKA7p6fSoCSTRTRU8KGczljHFq1C9twVA38crFmHdFRR9NF+Nu2Z9l167khVjoqE7S
         9dD9nOaxCsYW4GrrkBCdrNImwDOUZl4U3+aCLCtfzb1GwJXWDtyIMTupvkkS4IF+UZuE
         kPpFMGsyaYrq3Isib2tCEoJNp63xcP6EwAiJPbw67R3pg7Jq1fiWvBJazz/FZcZwIjcE
         q+vw==
X-Forwarded-Encrypted: i=1; AKwUvBydUQYHS48MXtDdaZNXEZdZz/ErCoNWQy7JFb6eJB0TeUZF6X6a8V97ofBHkjpiaP8rkuaIjFxMO5QNHTE=@vger.kernel.org
X-Gm-Message-State: AFuF++kVwaYIYOADFIkHuHqtnx3MCD19goi3IsUNyb8/NkKTYbooB1Yx
	oxpep3KuGkA62qPjXl8VMV66MLQW78sZZ7JPjzwWpaskyhjF+wj4aSp6
X-Gm-Gg: AYBFou2yCUJj1UVD+nQu24V23yu8MXvwD7RN3vNXi80Tc9D7ZmX+pSlhAUPgsl2t0zY
	puqWCAuDLJ0tMkYaeQ3njwehlZ9tCKVB2C8FKhuaJlDTBS75qYlJUeM5XzBsu73n599Cl5hT814
	FSpH8/qUJ72hjza2E7H2SgY7wZAZ7/NVQeMuMQYQqEuQHmX/azIdJxpwIMfsxHaBAuzO8p7pO1/
	LNmTUvVvZK0701OrTKzW5abwmVzkl7024+Qi5LRUOSOt6O00sAiXwDBJyxkftnaAvbv04x/RzRb
	X3DgdIu3QOmCLpoe3JhvDWzKJohDbIK5f67dGNA02iyaoKfbRU/wpQO07A9FErgURwNruvq/IDz
	KfyI2tPL1kKb4yiQD6Zyan8qOnDx7smvcl2eWPd3lJCI4JXAWTWrVby3/8YQzPVmQcA3gGYYCtx
	ZY+2ImcUDU6its6N2X2PfXLHS5w0/YVDYH/+6vTGV+RR7ysLqTaCSPPD9mMKCogtOb4i+OTj8tw
	ItPJH3CAH2Qtw==
X-Received: by 2002:a17:902:d58a:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2d91b244075mr11865595ad.17.1788086481630;
        Sun, 30 Aug 2026 03:41:21 -0700 (PDT)
Received: from White.tail445f11.ts.net ([45.127.45.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b26fd7edbsm9791771eec.5.2026.08.30.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:41:21 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] erofs: preserve LZMA decoders on resize failure
Date: Sun, 30 Aug 2026 16:11:09 +0530
Message-ID: <20260830104109.60639-1-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pool-resize path frees each stream's old decoder before allocating
its replacement. If an allocation fails after some streams have already
been replaced, the failed stream is put back on the list with state ==
NULL. z_erofs_lzma_max_dictsize is still advanced as if the whole
pool had been resized.

An existing LZMA mount can select the broken stream and pass
NULL to xz_dec_microlzma_reset(). A retry at the same size also
skip another resize attempt. Since the global maximum was advanced,
thus, the invalid state is left unrepaired.

Allocate each replacement before freeing the old decoder, temporarily
retaining one old decoder during allocation. Stop at the first failure
and advance z_erofs_lzma_max_dictsize only after all streams satisfy
the request.

Record each stream's dictionary capacity so retries can skip streams
already enlarged before a partial failure.

Fixes: 622ceaddb764 ("erofs: lzma compression support")
Cc: stable@vger.kernel.org
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 fs/erofs/decompressor_lzma.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/decompressor_lzma.c b/fs/erofs/decompressor_lzma.c
index 6b0cdb446c6a..9d15f94cbee1 100644
--- a/fs/erofs/decompressor_lzma.c
+++ b/fs/erofs/decompressor_lzma.c
@@ -5,6 +5,7 @@
 struct z_erofs_lzma {
 	struct z_erofs_lzma *next;
 	struct xz_dec_microlzma *state;
+	unsigned int dict_size;
 	u8 bounce[PAGE_SIZE];
 };
 
@@ -128,11 +129,19 @@ static int z_erofs_load_lzma_config(struct super_block *sb,
 	err = 0;
 	/* 2. walk each isolated stream and grow max dict_size if needed */
 	for (strm = head; strm; strm = strm->next) {
+		struct xz_dec_microlzma *state;
+
+		if (strm->dict_size >= dict_size)
+			continue;
+		state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
+		if (!state) {
+			err = -ENOMEM;
+			break;
+		}
 		if (strm->state)
 			xz_dec_microlzma_end(strm->state);
-		strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
-		if (!strm->state)
-			err = -ENOMEM;
+		strm->state = state;
+		strm->dict_size = dict_size;
 	}
 
 	/* 3. push back all to the global list and update max dict_size */
@@ -142,7 +151,8 @@ static int z_erofs_load_lzma_config(struct super_block *sb,
 	spin_unlock(&z_erofs_lzma_lock);
 	wake_up_all(&z_erofs_lzma_wq);
 
-	z_erofs_lzma_max_dictsize = dict_size;
+	if (!err)
+		z_erofs_lzma_max_dictsize = dict_size;
 	mutex_unlock(&lzma_resize_mutex);
 	return err;
 }

base-commit: a7d28aa0e9b2c983b915d091f9596f0e3b253355
-- 
2.43.0

