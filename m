Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F414C9E0A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602393; cv=none; b=uKzsiol1RVmTCNkbm1Q3DJO42Tt8D2qq8wcMu/9oxOnuwhtUvAxI40L2rcFcjzbZ7a0ix1QJPWuq7vrIAhF0kWrybvjK7Lkz2urjpR6HYMByQbgoxX0z6jAa51kCWWoUYmTa8KJNY+eBXEU1WQP9QJ6AkzDqMFqWMMbP2FEdnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602393; c=relaxed/simple;
	bh=IlrTb51Yp7Rjs5yQkZp4t/TrynsY1IZo7uIZ92+N310=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6ETtEyfuuWmeHqlLTY/0h13oKS+75oo5MWk7cNt4EPNsJrTgvxrox7YhdhDFofkNmWBNiiySKU8ElG9vuia9/bAL1Dj+EQINEGoATpfCBFsyzU1wuPlUzPMqDozztBM040nhObFg6UgzVyweZO5ot1LgJaq3ngSh51cLdEV5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlWcxP56; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlWcxP56"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so1856550f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602383; x=1791207183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vb+nXysx6Pid1tQCSKOtIWL9IN5+XlO/q6rrI+ZzfOE=;
        b=HlWcxP569zau9ROT+qN+SxznnaiYSV9KrVWazV0861xi53VRCILlOmXz5swGHJFDYI
         sr812SmszIoHGeRW93B6BeXrBPpqzJaczA/Num1FJ4xLXKGLFnqPI1Iex3Kld6ebToDb
         CuKRyO3ER+8mTNfkwi5baXDAyaTpSXduiIg0QOcfBPFW75QynblkyNOotCAFRCAcgwFT
         Gfui6bzkuxEattU7HPfagJf/E5ehELiGqP5AXNeaIVRUzy88LptUC3FLt87MaSAvyEHK
         UPL9I4kTU3OiYlKnDLUdwa380sqFPSzL8dd0c5KNuQtRj0fSvIMKhEpKaQi3OSNv0wGZ
         y9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602383; x=1791207183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vb+nXysx6Pid1tQCSKOtIWL9IN5+XlO/q6rrI+ZzfOE=;
        b=HqX4yvZamjkgtvVjkZqfktzwoACDcDtpxBCzKLRbFQuJoA3Yk2wDQ7RMT7lQ/yPsBR
         qBLZns12p8t05YAkyA34o6eegXU3jANJiva+vJgxYVOTFleN4ZNqDVk8BSABz5jxyMD8
         TfXSb+eSiSSx2YiWwmicHxBO66co4w53cFlgaZ2cb68OHbtND1JQx7tiGrI6XWoVHQWK
         NrFYBH63cz/Eghv4SUInV8ga6141pfzpS/xwZ93VszAGoxa0ZI3ADnl7VBA9EcAbZRz+
         PIFUqDoqID3eT7g/1ITggz6A3+s5BMs7320cKT22ZzN0jyAHbICb+sHTRa+N8DY/nxGO
         KybQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLx/To2sTdHFhkum8XWk241AUp0l/Xa3QJBTW1wniivq4E8ot2zfilJaqwp0VbwFyOyRqYPMHmSypvqP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd3Pg8klkZ5GT5TYPF0r3+6V1Vlon7zqtnZ/eMJvbatm9Wc6iK
	jjK3+RAbf2ra8pt3Bed2uPtYrv5HMYLINxklKD+9uHd0/iWKHpQbDG+/d9G8BZr8
X-Gm-Gg: AYBFou06c+McqBrQANuTeQtL0cmBGAnMKNTPLDgedhvtKAf0RsECzVRdmoKg6znFiiA
	tLgxZ/W0Ufy37sc1ir3LjLT0ro6Cc/qTucJ9t6zIyNym9hOgDPMn0NLAzfFpN5wJQ48kSX3uDYH
	Ck0S15Sz7WA/7Gs8AIXFdf9iZPy7Fg+CjnPFgosPV969Y5kaIRkDgxeweQU6c+Jlwvr5vaYJUCl
	ax3BQ37zFVfzfTBKR6CgNzJrVeXAOz3tzSqqUw1hli36CJtk0iKxGBq9CDhFS/LQuh4woiX8Mpk
	6BInn79DDGJ5F+7MjuNXBvaycn+EVqNO4ZxOVdHsQRB6mDLcLRrKet8nKcAWVBcMyZhZdZYjt7g
	at/6WD+y9UPri+AeEBkUsgOAA8XppVUf8j4t5w438HD3Gy6oVFkEgjKVOWh5ym8OzVg3KnLm/xD
	5Gfpkgx7k1qdDVrZdnNltyZ3JObecdqc1TqKxHxneze7WrqrClW3fpOFV8npV34U2yg8gPIrWc5
	Wmk4URKh2As7NucR3eIxkTWRRf9Cjwq0UMuCTBH+9MTVPe18pQRbJ6Ec0+PWZFTY7hBI/2/ITLG
X-Received: by 2002:a05:6000:2893:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-488719756c5mr21965332f8f.49.1790602382736;
        Mon, 28 Sep 2026 06:33:02 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:33:02 -0700 (PDT)
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
Subject: [PATCH v7 12/13] io_uring/rsrc: add regbuf import flags
Date: Mon, 28 Sep 2026 14:32:28 +0100
Message-ID: <692972b0ea345774fda580a53e2b1bbe5f771aa3.1790602223.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790602223.git.asml.silence@gmail.com>
References: <cover.1790602223.git.asml.silence@gmail.com>
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
index 65d6cf7201ce..6f6860d6ca03 100644
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

