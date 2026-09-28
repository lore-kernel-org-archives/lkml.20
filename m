Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA3485CF7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585321; cv=none; b=PjBYTiHqXHylHzbTZU8DUjJujC3lJx1t5V0nvzPrchs2Nha+RktPsg/zS0hEq8+w16NINhMcHUHdynRNLsuhe/nf/35bu6YCqndbhzsK67W0btnKGSV7PWZjtuT5dAovXmfCceZjppFlExhhdeCQE20pi+hHOECf8Fg3EcsOFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585321; c=relaxed/simple;
	bh=Ml/wRWriMjuOvm8erGnx14aGJ0pVCe7lav+rrtrNSB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUlOkWpp/IEjHrGIyHAGe0HQndVCeg0tYaR9/jYIMGj9xn9pUho74kLM7PWRR7LXGP/yp7O5M3kE/VSPlwEYArC2+9N9Cklui8pV4L/m1+7icbo38TIdmqNgvPwNvbEhDiIIsHRj5ifwHTA99uBVYVtAbISxo2XTMSrity/IR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYVmwKTe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYVmwKTe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso29935315e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585318; x=1791190118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Jvy93H4vWasmTh8KcuN5CDwZOVOqi8h4a5W+CL6duU=;
        b=AYVmwKTeOz2um7LlFFac1/QF8nDaG0JweUSC6IEz61mIJ7Cn4HeUcZ6TU7g50UlWfm
         aKfmtM/bZwTv/G12O0iyJ0WYT7jHE5ehha/xl7Q3rx96eawvqxmV2baX1NnNF1b4oxzh
         l+ioHs6igrTQRnoKxXYNx/yTVL0CuFCURjNFTBqx10iI40teMzGaGN8w0Y0EwbEUm0Xm
         JjFE+Dg10NmAYde1IsYCj3gwWKdibV9ow8qDr/L4zDLfgCZe6ITQ0lvbFhmDK2a4bvRz
         gJRBFXNvQ7684Zk/kveOUQJpNgCtTwPomM+zao5oSHIQhT9Z4ad1oreyNwYQ9FqS7+tg
         RScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585318; x=1791190118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Jvy93H4vWasmTh8KcuN5CDwZOVOqi8h4a5W+CL6duU=;
        b=humZvzNq8eT9bo2p/HTrHGojRsYjxpxjiKk4QIzmY5RyaaHQ1XdhchgJywMfJ8A/z4
         IRxIOwS3wUjGmZYESFUSuMhJJOL/yWbRDRe3unkTeVZfO3qG2N3AP7/X9LlsVTB0OpFy
         yBss1xoHKJrZt4+QrMsc/9tDa+7WLm+6KQ3hzqnMI2rQ4PJ2JZIIaIf6CTUnwYNWOqM2
         QdgRcvgTNmiBt8HXVC2qGf7T4jkK185kj3b58YwBHKGuMxC4VYiSRvatAAkZ8JpdmlZV
         2QMKGReuZBnhVFlPYps99tOz0gKwshHFAyMgyFrX9HzHtlvfTaTJd0pgF2cg0SKnKdVH
         oLmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBXdtD+ZaxIXl6Rie37LGQWmJg9yg0ApwjVrlAgG/k5SKX+Iz7wxcgR+AtXtAAKayAOpnjKYxAPw8vEhM=@vger.kernel.org
X-Gm-Message-State: AFuF++kC5r6TkqhkDbtrIcaEWBg3uwgIFfIqN5FHMqlxJvj4HZofb+YT
	5TOoG2YxxTG1BQPy9JAnedH18Rtd8E4eOlV9b3Ex/YZmO4DgsinTauBz
X-Gm-Gg: AYBFou14o3I3+o5FLon2ZbfSrlx4Og43yfVAehiREB7MvFTqURD4m4/RFQ65lip9mWt
	Xgqp+B4v/NitypOvGPoeQ7+qQUd3Z4yH70ZiR43n9JbQqhMYWb5SKeEdiS8c41y+WQldiptdcvC
	lWu8UHFl5CnED+9uap21n2s6T7Qjg2/Mye8ETdLZiVWZ+NDi4o0YkoGwiGs1ifsX0z3m8GUIK5t
	EPl7V+ao40mr0z14wksGjSVMmUfsVxgoMQePmyeLo6PwjxlLtpn0A4dJ5bqYRue2V4ijaAMmF0G
	56HHNzZ797uldnAN642FOct8dZjdfrg/6nRTmksfST778gXOyzC3jS693iBouTnvbCwJ3n5ShHr
	iJzYEgai0hjA8Bp6NAcM0fdDZ6mHDoAGX4cUJjQ9mIiStQzSA5wIvDU7RyG1AWjqkqoCacNQXPO
	Rd3HUDwLIc1cvySR/WM3EBZJ7KLOhIETKst24m4RR+w9I+/AO+Ge0B1CP9cBlTAKfzrgDG8JNlQ
	TNEa1o6dVuVntfR1vn9DtWj0a41lguanAa39zQZMBjaUy8WpwAlAWmZXSNmWEDkYRhFm+cj+jIu
	NNyXLL7reU3gId0=
X-Received: by 2002:a05:600c:4745:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-49fe7b6ffbfmr216288885e9.14.1790585317664;
        Mon, 28 Sep 2026 01:48:37 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm182584705e9.5.2026.09.28.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:48:37 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 4/4] iomap: don't lose a failed direct I/O bio's error when zeroing the tail
Date: Mon, 28 Sep 2026 10:48:09 +0200
Message-ID: <0cbce1012f5333690be36a9adafb3e190fe2ca77.1790342457.git.parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790342457.git.parri.andrea@gmail.com>
References: <cover.1790342457.git.parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iomap_dio_bio_iter() falls through to the sub-block tail zeroing when
the data bio submission fails, so that the rest of the block is still
zeroed and stale data is not exposed.  The zeroing result was assigned
to ret, which overwrote the submission error with the successful
zeroing result (zero) and the failed write was reported as success.

iomap_dio_zero() can only return an error from a can't-happen
WARN_ON_ONCE() (nr_vecs exceeding BIO_MAX_VECS, which the existing
comment there says "shall never be reached" for any in-tree
filesystem), so it isn't a real runtime failure worth reporting to
userspace, let alone one worth losing the actual submission error for.
Make iomap_dio_zero() return void and drop the error handling at both
call sites instead of threading the result through a separate
variable.

Fixes: 10553a91652d ("iomap: fix iomap_dio_zero() for fs bs > system page size")
Cc: <stable@vger.kernel.org> # v6.12
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 fs/iomap/direct-io.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 8b4039d16ce89..7f1e85f95a469 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -296,7 +296,7 @@ u32 iomap_finish_ioend_direct(struct iomap_ioend *ioend)
 	return vec_count;
 }
 
-static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
+static void iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
 		loff_t pos, unsigned len)
 {
 	struct inode *inode = file_inode(dio->iocb->ki_filp);
@@ -305,14 +305,14 @@ static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
 	int nr_vecs = max(1, i_blocksize(inode) / folio_size(zero_folio));
 
 	if (!len)
-		return 0;
+		return;
 
 	/*
 	 * This limit shall never be reached as most filesystems have a
 	 * maximum blocksize of 64k.
 	 */
 	if (WARN_ON_ONCE(nr_vecs > BIO_MAX_VECS))
-		return -EINVAL;
+		return;
 
 	bio = iomap_dio_alloc_bio(iter, dio, nr_vecs,
 				  REQ_OP_WRITE | REQ_SYNC | REQ_IDLE);
@@ -328,8 +328,6 @@ static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
 		len -= io_len;
 	}
 	iomap_dio_submit_bio(iter, dio, bio, pos);
-
-	return 0;
 }
 
 static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
@@ -541,10 +539,7 @@ static int iomap_dio_bio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
 	if (need_zeroout) {
 		/* zero out from the start of the block to the write offset */
 		pad = pos & (fs_block_size - 1);
-
-		ret = iomap_dio_zero(iter, dio, pos - pad, pad);
-		if (ret)
-			goto out;
+		iomap_dio_zero(iter, dio, pos - pad, pad);
 	}
 
 	do {
@@ -582,8 +577,7 @@ static int iomap_dio_bio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
 		/* zero out from the end of the write to the end of the block */
 		pad = pos & (fs_block_size - 1);
 		if (pad)
-			ret = iomap_dio_zero(iter, dio, pos,
-					     fs_block_size - pad);
+			iomap_dio_zero(iter, dio, pos, fs_block_size - pad);
 	}
 out:
 	/* Undo iter limitation to current extent */
-- 
2.53.0

