Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7DE4DE718
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412806; cv=none; b=lM93F8ZR1VcGa4nho66HNwsU3F6H4Me4a7GClKTLyC5TrUfpXlpALBsVGInSeYJfLlvQoaUYR7A2SlqunoNrx9hfkN2Ip+lnIyr4oF7BnIoGa7oUDUqnP4Wt6k9ESZJZFiMqLiLDvo7IMRgm0cAAS1u21yir+qKRb8P07/DFlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412806; c=relaxed/simple;
	bh=2J4QDg/aPsDzAlpppkrAn+r7m+C0v3TwtrRFcMn0Hq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlZjL3/OQUdy2vxvIj+z44UXUGcumiyhakq7vwLDq/3V7QyIfiseSdLBRO4E9PxR4USyDrr75uPiJ/42rcvM1fIeIJDbv6tTJD/2O4B4CPLAzjR6AY3PXwrefPBxNHgOxwXv8bOvRVZKOdweG57Cui+FVKyLE4g3czSAoxc3RY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klLcXACd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klLcXACd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so6309525e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412794; x=1793017594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtKFCm4Kb4fRyfZVN6sFqWcdE1J66fmbQkE6r6uUAyc=;
        b=klLcXACdA2X+s7HCk4dX/NKhaCCFnczanr/W2bKJSEjkf3+aVXYcl5Qsk1fD9xGBH2
         LwvVNje72D993rHpXuM08ZiqwrZmr9uy3ChTkPWDwzMWAmPl64DCAqTtXvwLYH8SylET
         F4bFDLrGVAr27oiUN3XAa6h/gqSGmw4Z9j2ws9/zYQUR2VKOPre3kn54ZD3BmWCcX2Im
         IpXEWXQYiCcNIh34dyE0XwHHIZ8frX0kYd/0YoB2ndR0qEv5NRo/OC0kKCqkHbrpKzM0
         Sf/EXIVxurWWMEQIkMArr6o7bd8I9SEzcbLB7Tx//32T6whFxw41ih/81ZCC9P6ZbpYP
         v8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412794; x=1793017594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtKFCm4Kb4fRyfZVN6sFqWcdE1J66fmbQkE6r6uUAyc=;
        b=q13NS8ykuCif9PUPbMpv2Ggl1Zekx3nrmANrx3LcZXBZvXht2jGB5DCW8UZPB8+JwA
         EegPNlMV6e4UZt0uJT/Q3V3iAgRyssU5ashdOMQ4TcLAhQxgcuJktNgEwKsJ2B/94RXc
         HuLn6gZuZBoXG4OdRgEK5GONr+F7Wp5qoy5nXzx865k1Lq1OtcwKley3wyToFqo4KS4+
         ZPEH41fNfTVelnSLc3biEVA3mXxB06BG1rVVIC2MeRG/Z9+L9qZN9pPWJKtsFtlnHHIG
         LL4PG6hk8CdkOKW4Z6DqmMPO8FXbdpZRU1HoCZ28VVyk3PRM256F7bVktlwrEQ/cRkNF
         U1SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPgjKrG0bipQR4a/2XRdh7pis55uNcJ5I+5f+2fDRXWVDciS3zbv1cXTwIllr5f3VNy9vh76YQz6qW3k0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrZqWIKj4gLZj/U4D0ikDmDe7bRZgUT6YZHQYREEgp82W3dzHb
	8jNoIZ898PMohFt9pdHR6FmpNYWIrv3RQRgZVev9Erw7CDsAH89HFYP2twI5vXln9Tg=
X-Gm-Gg: AYBFou32qDbkkDO8/rKA9BsY+go6ipwXM8ubV9YXnZGNXP5D91grs0B59045+sqgCtw
	UtheO0GfJo8JMwxoxWMR78H2e8Dr9NF8cNa4Qma2WbS3Rj3DF5HZUq3RK3EOyVktJs8RUO0sKS/
	QJpk1Oz9Tt7k6N/ENNECMIEwSIlXFK/KsehoH+cAMSsiL4QCII0Vu6EJL7LhlBsQ+Nhote/7ozp
	VY8GP3HQc6RKM+lewDiMGyg9DBvomKo/JoWPFwdfaxMh/IsrUZDDZ43Som7ibrYSECPjTrSEUZS
	ZPVwb5zd+17FbIoye535j95bvsDIt1grsTJ5rKE0QZnI9hrOn6jVKBXCwRoVB08xbCUeDR3VNfv
	C1hSmUQ9vv0OmMovfEFeGlIHrtCe+yYcmbCRBN5pJeMi6CRqsvCuNU6x61qDgCQpOnjI/k65Ozy
	dHXS8L9k8lyUveXrp/Ej6ZWJC3LuFpUAHqME7DSi+8vZL/i39Uk54wHbrYeccQAX0SPBoudIWSx
	qfV+jgPU6xjAjg=
X-Received: by 2002:a7b:c3c1:0:b0:4a1:8849:17ae with SMTP id 5b1f17b1804b1-4a1c663b460mr182215415e9.1.1792412793709;
        Mon, 19 Oct 2026 05:26:33 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:e497:1486:f91f:acf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7889sm23101961f8f.24.2026.10.19.05.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:26:33 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] NFS: restore directory index when resuming readdir
Date: Mon, 19 Oct 2026 15:26:30 +0300
Message-ID: <20261019122630.200561-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfs_readdir() restores the cached folio index and cookie when
resuming directory iteration, but leaves current_index at zero.
In 32-bit index mode, nfs_readdir_search_for_cookie() then
reports a folio-relative offset instead of the absolute entry
position.

Restore current_index from the saved logical folio index before
searching the cache.

This solution relies on the current behavior of 
nfs_readdir_seek_next_array(), where folio_index advances by 
one and current_index advances by nfs_readdir_array_maxentries()
for each full, nonterminal folio.

Fixes: f648022faa68e ("NFS: Convert readdir page cache to use a cookie based index")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
I tried a couple other ways of recovering current_index like 
tracking it with a new variable in nfs_open_dir_context and 
deriving it from ctx->pos but the first option ended up expanding
the change-set drastically and the 2nd option had an issue of 
freshness after directory changes.

I was able to reproduce both the failure and confirm the fix is valid
locally.

 fs/nfs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 49394123bd09..a1ad04b2f307 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1253,6 +1253,8 @@ static int nfs_readdir(struct file *file, struct dir_context *ctx)
 	spin_lock(&file->f_lock);
 	desc->dir_cookie = dir_ctx->dir_cookie;
 	desc->folio_index = dir_ctx->page_index;
+	desc->current_index = (loff_t)desc->folio_index *
+			      nfs_readdir_array_maxentries();
 	desc->last_cookie = dir_ctx->last_cookie;
 	desc->attr_gencount = dir_ctx->attr_gencount;
 	desc->eof = dir_ctx->eof;

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

