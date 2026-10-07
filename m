Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9889364EAA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337414; cv=none; b=PRj+U6xzugkh0IJk4f2E1Q+QtF5vnvJlJxWe3Bre1vOgafu3c4MGc+TvV6CtUHmV+dtn3ndIxhjFl55y5AqQ74DwkEHwNS4c6BOI7QeyDXcsEjog+ilstFmHwGVYAw1LJXF1w0WZzgqlDMoKW9r7gz9sXK3T5FxXX3lwncrSGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337414; c=relaxed/simple;
	bh=sZSKKXCePxitJxwkXP2zXOFTkw2i/N+YLyO84coSzgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOEsuWe5pJvSfvgcenD+JQ3d4HMribKnfRQiUj1+b5a9ius8M0P1WJhFexucj6Kn9r/l7IDEmWXm27e7uXQMJIQNw0c8T/CiH8U102pnVQV1SKCdkQ144nojWeD6fIaFypOc91Q68lPcvGaeKgFyrugfEYs6fovn9KBjunlIE90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0mCfzRz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0mCfzRz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so1046580f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337408; x=1791942208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKjZvbLAs20rdhF/f8LJ7mlj5bzqJB3zMFv/Fdm/dPM=;
        b=i0mCfzRzmqfW6J831riZkb5XykprHAqrwGBVDP+PlPdfkwZPl14Rr9hlnNkmM1MHmU
         W7Bypdwk2b3vsowqx1ZsUFdKVCo/1qCGjSojul9QV3CZqNp5uJJ0Xrmf2n+eEuWnuuXk
         PnYGkQqcNyqtukRc+qPbGbTOiVWVaK7N0OpVIzU6xJWsjLdk3nPbg102fHC1NdeOBs0Y
         GAxsHFfKwy8zEQ2/i4I468JP7vBjmUu0I5JTIYiJG29+kqOtTl3Q6dKsPmCU6HczbmW1
         jXVdKuxWZ02YHa8JFd5tCnbEcfMXcEwZvNY9XQXdx6ubuQn39DXDQowgdFR9+HfLACRY
         fXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337408; x=1791942208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKjZvbLAs20rdhF/f8LJ7mlj5bzqJB3zMFv/Fdm/dPM=;
        b=21O+iI8jj467CtkJPBd4UevqItAPVvEzDJ5BD5AjwlZU7vRs+xLdYJ/kTEYlSZ1aG1
         6bblwxfHyQT8ABxwG9B9eY7jXgiHMfGSDvvXSymH5Mf4wLaqRv6ATbr/BYyQwnJMghhA
         yVq6EjC5jc0Qq4Nm1ENcRXGG56jdq8cyGU9KIflJ2ZV2zTgBJeRZ/CJBPu45HvWpcWPw
         iRrcERS6XwGkNW873efGVih+ej+3+wNZjayjPf9y+BGRzaAoHdssuWACPUuEkvx5qFkr
         LEwQ5J7vjPhBOj3akB6dita2+4Z1TrF5GqqupkqQ+mCc4EBmgY+bde9eRqufQxrguZJt
         6U/A==
X-Forwarded-Encrypted: i=1; AKwUvBzMRbqkAm4rHK98NMouUCOCEgy37TpqQNjcrrMW0xXMqh9q7iSqokIjm9lfUB7s+wbuwjJGILHt8vBMLH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nkdJGAPvo2tnUTXEtZO5+iW4LhnX66Ahq0lWDC5m4QTDUGk/J0
	VyzK+KGhGX1yl9SrnYPDmI0a7DsKcM8NuAL6AONLj3AaDuueM+yelvQK
X-Gm-Gg: AYBFou21Um+UShREvEplVqVoPuJ7nNMzRCw3KFwRHdjp5o3vlxaCgEZplbyg/2d8mv9
	nVCks4SnkzdLCXPrwCoTxAe6WIc5BXt7PfwTQkhkN5WuVW0AXho42mF6/h+3icnVoYqM1PgxRRu
	tkIQClgrivZYn1E+oQxwsH6dVORaCo6OZbaZgGZ5VfMZVwdRF+wG2ThEqXKJXYMIqA3zlVLWmKa
	KAzpzfEU4vFCFeQhLnacSfnoybvLyaGPhTgIVVpj7kMItJ9MS9n7M8zVlIdTWeEVCBch19wodPF
	8ROAA8YyxEm8KWzxD6339B7RQ3ebk9pCdHPQ4hABUx7KwgnXYZsTZa1b1Z58p0wNkDbpx10pTon
	svypGcv0CiUvxtu5HltmuNHJyuSWGAL4cMa1vykX6dF48hbxgrp8V3qAVhTD106fiZz35w/xUV0
	mfx3wyOw/n9eS+Pv548YHxoMG4Ss8OKOcb03gIqnbg1jx7QUD6wrLDgtYmgzhWibPeXOcad4GS2
	KYsDP+xdhbM7POJgCISxHbs4IDIfdpurVPjV1oNlZfmMwp3KbpiO1rmvCzgaX3G8Jotn1QziOv3
X-Received: by 2002:a05:600c:1911:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a180455696mr7216955e9.33.1791337408104;
        Tue, 06 Oct 2026 18:43:28 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm26423895e9.14.2026.10.06.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:43:27 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v9 11/13] io_uring/rsrc: add uncloneable regbuf flag
Date: Wed,  7 Oct 2026 02:42:54 +0100
Message-ID: <e46bb4ba345595eb920f2e14077f7f3d3b044d0f.1791336930.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336930.git.asml.silence@gmail.com>
References: <cover.1791336930.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's hard to implement cloning if the internal structure needs to be
mutable and/or relies on other ring resources. In preparation to such
buffer types, add a flag indicating that the buffer can't be cloned. It
might be possible to add cloning in the future for them, but that would
likely need reallocating the structure and reacquiring resources in case
by case manner.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 5 +++++
 io_uring/rsrc.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 77e6929f665d..6930a6897b41 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1456,6 +1456,11 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
+			if (src_node->buf->flags & IO_REGBUF_F_UNCLONEABLE) {
+				io_rsrc_data_free(ctx, &data);
+				return -EOPNOTSUPP;
+			}
+
 			dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
 			if (!dst_node) {
 				io_rsrc_data_free(ctx, &data);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 9ef88383b363..73d7b1ebf0b6 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -26,7 +26,8 @@ struct io_rsrc_node {
 };
 
 enum {
-	IO_REGBUF_F_KBUF		= 1,
+	IO_REGBUF_F_KBUF		= 1 << 0,
+	IO_REGBUF_F_UNCLONEABLE		= 1 << 1,
 };
 
 struct io_mapped_ubuf {
-- 
2.54.0

