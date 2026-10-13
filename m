Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD150560AC2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924951; cv=none; b=TfCmDzmu+KpJrNW10t7jM3hOlbLnT6ib7F7AJHmsQG75XFXxnW8Y9Cik785BVdHd8TpQl5s1WiWgqpkBI2f8Y+h7/+JRD9ozypjZsdPblcPF2MtdSNqqlqZWyl2CKihTebZI1/cHUHrosOHvlzn41rf5IXf3tYklNkJHVdYYCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924951; c=relaxed/simple;
	bh=r60ha7f86tSXOy7awDRSeceZcMhT0AOlgJWaxT3jtGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oS834WowJGPDBo09zdUPVaRt3zWJyETd5Qr/P5IaEGUuzo784ByH/QrWtiWwWWLTe2vx3X5djBY8AawTpL18NnTmOkuujVnrS85s224UDPECnF3Ixp0BDRHXB/+C/shIw7M/wquqEvS3rHRVAZkXu5TQu9UjpCyVsSkPN139DlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxZZIuOx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxZZIuOx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso3265444f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924945; x=1792529745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=LxZZIuOxbxtAdJEFuNKtznhoBBpEf3ufoFq8v4kzTbqgOqUFJe9dhejArkyc+vYakg
         gA82Qb4w+2eaopT9BqTesVEw0igg1/U5EQYOgXmKQZ+GFAM9mPkf740crYic2xoOr666
         bEK6oWvBuK1Ob4o/Jy0TZYoXTSAGDutRsS8HyREoYGGVR4WRppv1WzteJN8abdPeTftd
         UeG0JyYR9+pa4mf5P7/nuFz9by7Zjf/RX2Th4uYYGMDXdZz6oXHcq/hHPDdSqMVMCRWb
         zDKQ5xki635PLGpoMCHY4SxYCAxVVAJxQwD6gQGdv92GWjFj/PaVwMeRBm/VNv/LfSR9
         IO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924945; x=1792529745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=0GgUdFpP7DShuo+ubpp3NqPJfwH1uZgzOBBCmNWi3s0CAT+brfVcmNBtGvgadseMtE
         WJjoL5pkM/ragWhCB4akFo+WHS54ZCkNIQoM56x3MCzBB7mpXDZpqpO8yg9lTuREll2v
         6eEuWB+H9nW76xZ443YndWAo4SXl3aX8uLYVQ4vg634aQ2wcLx3TAylUBJsB80vCnmVl
         5E3mqB1QuCnPdlLDq8Kv+WpzaktTzYuRU+LYON7iVnaYmc8+v9oOocXZkKzSCUs+Q+XM
         xh7OzP4t9E/G1FPhi0JiebrjVnPYVa2gmZhkYKxFUNp7H2VU2bJFq/tVqLprOkqyxy+A
         rmoA==
X-Forwarded-Encrypted: i=1; AKwUvBzjVRCcdyLU9GEezhxx7Xq0lSlX7YiV7C7xlQW/H714BBYFs2l/WJrlmRKb8cpZCuWEapLe5K6Ed7GM3Jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHiXd3+lW3Jg1rGnAm1IAdjGRSXYIvMGl6t3DOAIU4NP9y5Kbr
	QMiiCWOZ5FGhd7Rb9a7Fc8sVnkHJYgLQzLSEG2YEiahhkcwSjxtz/med
X-Gm-Gg: AYBFou2CtvMoRl5FwdTCJJjab/gWPuoNP3vZnmeZgSmvA7EU94AZ51UJkpQtSJ7f84i
	1IIINyU3n/Glinl+FmS4hm8boV6Z0b+jlr8g119ikZ2mqakRBebx3tp5fxBgcSlHVppRCzyox2Z
	Vq3mM2dKlUlSpkkC5WPo9IHjN5Kaut5YpaK7vuF7m3PQJ48LnT+uTaUEJ2/1lPZJaxBg/gTwtuB
	WCUh5oGTgjnBIeGeDF6X8auD/kpF8QYifeo5qq5jEX/kjSDABL06Y2lagd5bsB+O5Co3IpPW96E
	gj8z6o00zQFW5aV8pIiPvZky0wR+uX+ofJnHJXQYjnRgixSXXgbGf6h2rTuA/FoGeZS8mjPIvqR
	hGGFTywd02nv7KmVmanMVlhpxtXHKJs7TeoZadFxTSa/SL5TTITTKvGhwxLgC/kU3ijNzLuqlFC
	BoXknl7C0/esGJ2M/sRRbosEH90eeNfbYi5sLYb7jXiuPuIFPTC9aQYC2Uwm3l6gDaME4p9ct3T
	7+Gjef1CXXorVK/07rg1kC2MrG/kl8gCxe/q1A9zfW4mtUat11GCF8CcP3ZGnH/vS9XplfU8vRl
	dnrf0UAyQag=
X-Received: by 2002:a05:6000:27c6:b0:487:27f9:82b with SMTP id ffacd0b85a97d-48dbaae34e3mr16754768f8f.32.1791924944821;
        Tue, 13 Oct 2026 13:55:44 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:42 -0700 (PDT)
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
Subject: [PATCH v10 12/13] io_uring/rsrc: add regbuf import flags
Date: Tue, 13 Oct 2026 21:54:56 +0100
Message-ID: <4b7c13d9860640499460862c8cd4a13602ca174b.1791924581.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791924581.git.asml.silence@gmail.com>
References: <cover.1791924581.git.asml.silence@gmail.com>
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
index 532866a1e9b9..f42d201738cd 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1317,9 +1317,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1733,9 +1733,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
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

