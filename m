Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20AA4A8429
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998006; cv=none; b=WwdFHPfe41UWeyn5ZvKC8vLB8WNRyXwz8D/C4bzc7iC7GEiBrICOU/Li1iyCdwZ2hXH2VdwFZu6ubg3NQPvUUEHbg3yrQY7UP8ir/4+BKlTANkeU7eeWTDjLcrtaZCGN/xfXNuz3u2mS2Pqeo1CWr9ygILtj6Cn3xnrG9KwbOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998006; c=relaxed/simple;
	bh=kBi8BbQVDcPE/2Q3Wr6NlZISspLakO5UHtrHPWtVj5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFz5sh5syYlp9Jdynl9xo91+7HML4XW2jWg4f+SpdPT3OwFt16TIn7OAU6IODLY3YvZMT29GKmf7TTd8mrSvVR8N43ie1oqkiOTiR9fV7ovXoCVnRcFJU8osCWVCv1JfVHDTAUM+jnbKmfr5M+jtyM7A/k7yU7cOgozjxa6zT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQ9CBXZR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ9CBXZR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso25338675e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789998002; x=1790602802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FMRvm1BaZ6kTlzIVu1IAGTERBBcZPL0byDe3SvrYcY=;
        b=JQ9CBXZRm3oNHhMB9wylLRIlXa4CC36rQ6napKSfXH/L2NTDUxJRw9n2arEgVyOGCJ
         dBo1amanLtLrdVlrm5sFkX/mnbKGxe+wGrGWNCULR7CtnrT/YATYjy1uzLXdKKWS9JQ1
         k1oJCKHjvr3Llo+PIPy6XnmltxVqCw7pOAyVPvc8rz4/fcC3se2c1FTOsc1E4muCFOiR
         hEMVhDMP61600m2UZRrw6izfO2SBVGHwl+zoe5ShdEG1SacCAzwlZlUfuCoK9qenb7rk
         bkpGv1/jeYb17tOn4g/3KhbiuH7O0swwQAyBle2RnTOm154P7pESPQH/VSDUDjYnph9Y
         0O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998002; x=1790602802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FMRvm1BaZ6kTlzIVu1IAGTERBBcZPL0byDe3SvrYcY=;
        b=HHYP1pmf1nALD0HX1OsowDhdbK50oFEAm0Efz+o9wOJLP3IEgzCN6XV4LeJEKDO2l9
         eKCx0Z5oZ5iNMTKGoZkZtLSaS7Im/Jc6kw98SHSsEBbJHh+Dz5JKre006gswhBgtWCZ7
         s1pBPu4DZaZSIT58U+FhcX5DbwDPV18udF5tKf9VGTvniCZnQmA9UsIJrt/OW4Xef2mH
         WieRQU2u1hQctRS3B/e/R66CP28E2TgB1cwpP+AEVS6f9xSr1w6yJtSvk5fJ1GgmSmR7
         KvHKYJXABi0x7obMEU8/1VybHFKyYwwCvjfvQkbqVudaMLfJaQW8CwQUeL6QGBFnwvyW
         WeeA==
X-Forwarded-Encrypted: i=1; AKwUvBwHAzVWPwitENZ0CO7dEbCCV0mGSKFx+aY4ilJ/DWoSzE0JrG69lKxSQRSbNHcFgphcGIbhHKE5ZzHizbU=@vger.kernel.org
X-Gm-Message-State: AFuF++m0oMu5s6RQ61Mb6GDDXUi8orNF0ZFW4INgWxxBiIf7uhcLZ3So
	+tW9wIVavLggOKQCd4sA/hYzc1oGZJS0MIcuSCQuBWa112KlC9Y9hYmJ
X-Gm-Gg: AYBFou3VtcopsTje92BxCey7cYlY6BMCno09NxnhWAVHeQg1Y3S2bT7F5cuJHRFIyC2
	J6aMCMTNZVjpcAjWa9MRoVLl88TPN/daBYJpLjLqdlakAje3FI6UmQxCYjtoEzNhdTGJOD4iXPp
	LU43wKAaGhIchyMehW/+/x+WSangO1b9OFOFiG0eV8lcSymlz/8f6v4EyfHpAKjlz3rcP1jVHOV
	wFIO8pQc+GGR6ogwpoMzZjh/iwJXvO/Bj3MG2OuzAUk2Z10tTc3tCezEAsdoPiDLQfCKtDHKqsi
	TOabXwHR8w8bt0c58oxg5D3oUqjz6SMjGyTq9jZ+exlTC7uRBZGhSP9Uou/S7SUXJ2AlZAhgIp4
	Bq7zNUFdWdQv1S/PV/Fv3MYb8rxd1vULDaawIUrQmLKEUIJdV+V7s8HkC5kAjr5R5yvD7PCxSIN
	k9b+yxOwPfIeVN3fv1gknURLUxKsMQ3vxXZvWumShr9i0IUn9xHnLpbe4WQkVkK2N67pQrti1do
	XBWBWlM1W8rLdCgC6iZeSfuSWkczMQqn+JZ/BTYYGyIj4mM6uYTliBRzm2I7XlxbHvCeKFFchEO
	+6vWA26hvK0DrfIsISA1zO3iaCApsg==
X-Received: by 2002:a05:600c:3107:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fc5669346mr153997265e9.6.1789998002057;
        Mon, 21 Sep 2026 06:40:02 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm617171605e9.4.2026.09.21.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:40:01 -0700 (PDT)
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
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v6 12/13] io_uring/rsrc: add regbuf import flags
Date: Mon, 21 Sep 2026 14:38:56 +0100
Message-ID: <a7b154185897c7cd23de143f5bd834ef73cd7723.1789997898.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1789997898.git.asml.silence@gmail.com>
References: <cover.1789997898.git.asml.silence@gmail.com>
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
index 0b526b094dc9..79e3c686ecc1 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1298,9 +1298,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1709,9 +1709,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
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

