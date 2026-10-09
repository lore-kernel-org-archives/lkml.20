Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A566E2701B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514927; cv=none; b=TqkeIplHT6PyLFNq/c+qqucwMz6I/2jq49sayim11lNLJzlPByL+SF2cG79B31rk+0r2mmG7x5C1hTDiT8MlMLX8Ka4+wcwXJy+TgnYu6XdDZ6Pa4GHjgYDGHOcIxvEdkf6J30TJXPBMjpFkm2XPrKgu3gGL1Lk9ZO0dhAG0cq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514927; c=relaxed/simple;
	bh=pwTTpoYMU+flxyPo7EvjWHAvwBdDZcDZfOmnoQwuyk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FN0IpP9c88wmpIFEjE6aFgQd4/+rB+wyYrRVuBR6Uoq9l7zpu0pLLdWYoLbGfxwTsnHwqVCRr+WMg+oJqtLniK1aLdKufzcalIuNKsrMUbvFwRHaBFqT8fa4DFyJtZEeviB1PaumaB40bhffkfk+AMLZTHeKjE6+eTWyt/JeQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com; spf=none smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=qn20xZUd; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="qn20xZUd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3516c82e96cso4244763eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1791514926; x=1792119726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBWPAIqvIDVApxQAhC8lxyajSPGZTusmtwDLAKdJnvw=;
        b=qn20xZUd4DmT+c5BxeddguPntwRHPn/uyUplKOKzhZteyFDJebMGcTjBf/gyybeVU2
         tyj8fqrNW5L+i5SzSeCFi7uDLiD1w0x3hiidmokQUX/wxibwjyI8VOi47JqwSpnihzvB
         V2OASxVwxktn63uej6EjPHdjY9ZDBsl3c9TApnZUHQBS/vckIILAAN8eyzKTcAeTc6i7
         E3BPevS2gsOucLzg7qX83dbmGS0jTPk/cDZXAWUO8pnWwOaw2eXYsQksYMm4WBJwPjZ9
         EwQN85LRUqlVzCJJSZaK5mTfJzXObr/NKGr3BCZN70t8m6r1EEx8I9W5KEN5VQXgo3PP
         2xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514926; x=1792119726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBWPAIqvIDVApxQAhC8lxyajSPGZTusmtwDLAKdJnvw=;
        b=prCyuZ6XGDnKt4XomhQ4eCwNrR0cVNQr5wRIHSJLIknCBeZAeC3xKffWItwoKl795F
         1iLaZ11ePqLQys/bFEaqoz72A7rh4JcWtKEuMAF8k9LU7llLyGuHBJO2/6iHXqAWVmK4
         6iwWBq0cH3DnWpqv7yflLPKI7MAtfKQBCReJTSCjiSxEu/UtOiFIqzvHEnI8Bg3qqrKS
         xtCETsf4PfH3j+NSKVigD5B/y4n7MIp+C9agZM2SHOVBzsiWal2rCKPQDrA/kjw3gowJ
         EhBKSaFXkONQIWcSUCAY3zIJ84xTiFEdreBGldhH5+T6lyYXID5gD6VwFDXxIvmRn3xN
         oT4w==
X-Forwarded-Encrypted: i=1; AKwUvBzr/yF7SaRtz0fYzAz2Scknp/xZi3Eof7AFwzL3FcP9cBw6pvbDm4jgDNr8YJRRtVqkf0kHAfHnCEal4i4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSnwPlvGiXtNGZv+p+wz+IXT5i28C0kU6YmwAhxKGpb0gwA2BX
	k3cB1MfAUleDfqdOQ6F0w1f6YBUcUCKQr4AzeaGhDzFutHtdwPrY/Blf/rQmpyPxMJqZPrsI07s
	Z4vpRC26dwC2yojIxhQ2Y2SyJpm7D/rMbQoFtKiG67JCOQP+8V2BK+uh8Ayk=
X-Gm-Gg: AYBFou1Qv4HzDnQVWdrqWgFrOxSBB1f1XqS6WHVw9cZ+rK4o6rQX8sQG04mRKh4s83L
	BwJuk5+L0dqinEDppon9ZWMUopVo2Ex17oq9lpjEQU2HD4qRs7RgzgwV2PurUbGOktoYFaNWIpo
	WshMQ9GybdnMMmd6BXe9p0Pa8+9o8mTv7j1spKGP9GOCQLprUhKzf9SCXb1u/95IAUmhOuSkcxN
	4NLwCEv/ihg7TzRU2dbcNuxK40zB0i/H0oJ2SHD8elPssOf0r+NMpHyZcyFJO6CAbq06hsZrALg
	LhNGT7m3wZjRzVeS7odEAwmFCdRI+kGQHYb7QWYTEqK1aZvU8XM2fSldisE+OxLoovxyAvoNwS9
	wWNEi9/gfsi1dBqgxN+jrFO8pzOc3iO6AEQdOC4sGtdOC7nQ7mz3wi9wj0nbmtPdQ9dwCTbyAm3
	w2hUjkGYuPY+J+GMHsHlJzd+ixYMg3h5hhnttctcHAqFMT90/YiApK8+vmCICHLscVoZoSUQqRk
	Q3ygj4Sqmw4mR4yzgTh
X-Received: by 2002:a05:7301:7d06:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3537df51463mr951196eec.12.1791514925462;
        Thu, 08 Oct 2026 20:02:05 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.128])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm2427626eec.27.2026.10.08.20.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:02:04 -0700 (PDT)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v1 4/4] block: link request queue debugfs directories to tag sets
Date: Fri,  9 Oct 2026 11:01:11 +0800
Message-ID: <20261009030111.57784-5-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009030111.57784-1-lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag set debugfs directories use numeric IDs that do not identify their
attached disks. Starting from a disk's debugfs directory therefore gives
no direct way to find its tag set configuration and CPU mappings.

Add a tagset symlink in each blk-mq request queue's debugfs directory,
pointing to ../../tagset/<id>. Queues sharing a tag set link to the same
directory. Create the link only when both debugfs directories exist.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 block/blk-mq-debugfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 298387607049..78a91a1095bb 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -644,11 +644,19 @@ static void debugfs_create_files(struct request_queue *q, struct dentry *parent,
 
 void blk_mq_debugfs_register(struct request_queue *q)
 {
+	struct blk_mq_tag_set *set = q->tag_set;
 	struct blk_mq_hw_ctx *hctx;
 	unsigned long i;
+	char target[32];
 
 	debugfs_create_files(q, q->debugfs_dir, q, blk_mq_debugfs_queue_attrs);
 
+	if (!IS_ERR_OR_NULL(q->debugfs_dir) &&
+	    !IS_ERR_OR_NULL(set->debugfs_dir) && set->debugfs_id >= 0) {
+		snprintf(target, sizeof(target), "../../tagset/%d", set->debugfs_id);
+		debugfs_create_symlink("tagset", q->debugfs_dir, target);
+	}
+
 	queue_for_each_hw_ctx(q, hctx, i) {
 		if (!hctx->debugfs_dir)
 			blk_mq_debugfs_register_hctx(q, hctx);
-- 
2.43.0

