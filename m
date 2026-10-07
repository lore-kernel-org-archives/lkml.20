Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5BC35CBD7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337413; cv=none; b=JKPz2s8kG37EeUYC1mJFrdcOFxWinHRIZP25mIs+7u/a8tF/QtAmnovVJLYx8aASgE60eWW/HNWBQm7pCzxPSjoKb6CK0KKfpYlsXYiJ0ufksGNMCXeATr2zWqeGjpNcZcV+TAwtTEhUmV89rKBbQTxbozJcj4wafW9N5hTbU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337413; c=relaxed/simple;
	bh=zkmmP/s3oaEnM5CZp4fq/TPO4woTgg6h/01Z24jsq/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAIHsbKTGGFtXuICo5Z6BveBQqQUOU1bgXUHzi6Bu77PSqUc4Xs8s+nIMlw3o5ueAG2237ern/MHWgqtUg6/7vyPzJjtwPg/Y6WpnCvM7WMFO8B8EhxWltrEyw+TYNL04KsK11Ls47yuLYbXT8lA3MbmpKJa+wBRgyYrzbi1aU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abXwiJQ8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abXwiJQ8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e73611928so8953275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337409; x=1791942209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vy1zLQ9YKYGfqugQgTKt/AfV3rhwVDXY3KU8gp6bN10=;
        b=abXwiJQ8QRXhZmqQedvWqx4LMCQRjoeEr5thudK7djv1UgoAebtlDpZNd9EZ7qHf7x
         TiUOxrGd2O9iECweDvjvDPZU1KHn95NP8zx2o7ls50MHAc+kOK4c4Y4sQyGLZlwfBer6
         /JiyKJ9UNQ9NUa0/8LVothDyeQDWXVeo6aF/Nupno3D52JrDEnQK9ypSJYFtpgM5yI+f
         jJH9pGS6p4tky/3wNZUKVJD7CSfrBOIlC55BSioN8Im/LrRGP0QT/DAuIMRr3SlAhGG4
         G1DiSwPIBdvVmr1ISV3o7KVG6q3o8m5wXLdvQkKZy/RssIAOh+/GvLcaxPJW1uLIf5w4
         DYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337409; x=1791942209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vy1zLQ9YKYGfqugQgTKt/AfV3rhwVDXY3KU8gp6bN10=;
        b=u13ZP+0Vyj7fw2rVA2kcO3qVXXf7kB10hZ1kgHt5z9QuUhQbScW27ZrhFaTSM/6/1u
         hIHiMEQM9FMzHvwTtak/IXnOtXpE002d2mHqIr3PfTROn3YfS/pJem4frSsd6Niu06ug
         tbt6UVryUvh5r8Da9VaaqpU4c+oOVSxryWOpB1i5iFQSE1A/GTq98HrfVElFfaEpiFhX
         62BrXUkjXfEU3GjnkAW0zcEher/1LHNo2g271C5iMltfnbOdF0kuA/RGGK0VYMZTtxEK
         FD5LBFKB/deLTG+R/aVQQmEgZDx5MCA2dpzlM32G3Gz5E5P36qKeXPIZkWDkRgJXMeVV
         RPbA==
X-Forwarded-Encrypted: i=1; AKwUvBysfRT3HzpBwhMU5JVOruarQlC8qwrWar2vtkamG7uP/55R8b1p3HH+xepN61g5LaH5Wo/cSkDs2p9DnPk=@vger.kernel.org
X-Gm-Message-State: AFuF++kcguy1ai7Ygupg1y0cRHqojCbfNjHhDNy34JgXCdU/e3hISgHF
	iHo9heFQlEQWW7OgW5kJbB3T/bp5T6s0uqyFC2idjAKkxPrIaJoQzw9g
X-Gm-Gg: AYBFou127Pys6wmuiHFv2G+g0PiWIAkSYMADuGTrBXywG66W8iq1B9RZWk40UAT2Ukq
	nQ+Jjw3JI+XGUXpLw2a+TExCnAYIcXUwUT1drAG7fEDwULcZqvMk42iUhxDKE/8hISEuWKGTscl
	OPC0hurpTltZydU7F+DZ7QD2vN3Xpjs+t6J1iQu8MNNTVgoJIYXlKDYnSxmBov3VoJlNP1vcc79
	jZMHeia1/ileGwySxAUT7tG7dxPzPPJrqeD/X38zzyqtaLfXklKJauu7Y8UA1ed4RFzvTa96Itf
	mOhojsO4WT6WM1b6Xmo1YB2fomFQaoJqNPrQh5GF3w7fyDSCTZlXMp0NL3hWIdmj67pwD66G3sG
	S0Zt26Us7573mAbGzLx4z6PLoBeezno1wWng3ZttkNW7rU5jV4XDdRN37RKqGiamboVPJPBe8Fg
	D4q+xfgu+QZn3w2EU1DZoZYxg2kq+MXVDAM/3K1KXwzs530U045IVYqIWDDEa3e/8MiIY3/ZIzc
	7TXm2j26GsPXvJYwL/YyHzIXrV8e2Bb0ZCMfV8UegYzfxYIHhp2PMQVcJn/Bu3flh6mskJYUjCH
	1YZcNoQh2GQ=
X-Received: by 2002:a05:600c:810c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a180422b6fmr8853055e9.8.1791337409336;
        Tue, 06 Oct 2026 18:43:29 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm26423895e9.14.2026.10.06.18.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:43:28 -0700 (PDT)
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
Subject: [PATCH v9 12/13] io_uring/rsrc: add regbuf import flags
Date: Wed,  7 Oct 2026 02:42:55 +0100
Message-ID: <97d5632343330131e3de5874e482ce5dfa341f99.1791336930.git.asml.silence@gmail.com>
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

We'll have special registered buffer types that can't be used with all
opcodes and need special handling. Add separate flags to control
registered buffer import, which will be used to specify what kind of
buffers the caller can handle.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c |  8 ++++----
 io_uring/rsrc.h | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 6930a6897b41..6e4fe70b316f 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1315,9 +1315,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1731,9 +1731,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
 	return 0;
 }
 
-int io_import_reg_vec(int ddir, struct iov_iter *iter,
+int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
-			unsigned nr_iovs, unsigned issue_flags)
+			unsigned nr_iovs, unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 	struct io_mapped_ubuf *imu;
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 73d7b1ebf0b6..351995b61e68 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -62,12 +62,28 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags);
-int io_import_reg_vec(int ddir, struct iov_iter *iter,
+			unsigned issue_flags, unsigned import_flags);
+int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
-			unsigned nr_iovs, unsigned issue_flags);
+			unsigned nr_iovs, unsigned issue_flags,
+			unsigned import_flags);
+
+static inline int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+				    u64 buf_addr, size_t len, int ddir,
+				    unsigned issue_flags)
+{
+	return __io_import_reg_buf(req, iter, buf_addr, len, ddir, issue_flags, 0);
+}
+
+static inline int io_import_reg_vec(int ddir, struct iov_iter *iter,
+				    struct io_kiocb *req, struct iou_vec *vec,
+				    unsigned nr_iovs, unsigned issue_flags)
+{
+	return __io_import_reg_vec(ddir, iter, req, vec, nr_iovs, issue_flags, 0);
+}
+
 int io_prep_reg_iovec(struct io_kiocb *req, struct iou_vec *iv,
 			const struct iovec __user *uvec, size_t uvec_segs);
 
-- 
2.54.0

