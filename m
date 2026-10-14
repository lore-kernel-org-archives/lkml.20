Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BA4FECCF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975770; cv=none; b=ZZIXlkdzsui4JbSI9+9uHk4txDdv/EXnZ8A37e9rA5JRbleFbNSUaEVHd6sCgsafUeM1TDU5dFrQOPAEwP4jUq+Oj35r3xSTl4oUj7nuDGMdPtIEK+TNUHi8cdo/IYmnXB3m5ZJyS8c3A9DueO6X9znrNKIkBUdaMf3TaAV8UCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975770; c=relaxed/simple;
	bh=Yz9mg10bqVdj7cVQ9CUCuhVSPCWk27GUE+7ZZMs5kDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZ9elFeRWu+5topUNG+Bx2tLbqwkxNpsa6zXOXceEncoa/ZZeXZj/XAGDxzWJkwZPhl5BurV7V+cEC7GeCA78O9hsSFymMqkWplYE7lYkXqLJxCBbfFiWq/NYHfMm27eyoAHU5LHciud7OELUd847pg9gehEKWveNwnU2XbzeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P69uopP0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P69uopP0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5096255e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975759; x=1792580559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CL2BRiyUp3CaHGocQHkhsGpx+V6MY3r8MUNMnInA+U=;
        b=P69uopP0dGw4EOaBNSimaiFj01eeZtTBN1IzIjPctYGXGMK186M0vk1uak1vfbhoQC
         Z4f+zsvI9w8AQB+S/B67WktuHbeO4aifFH3/USoHAC1vXOCw3R8LPpeyZMpRONe+jiPB
         O4HTkJ+LZNMzsFHzYsEh+Yl0LWLLuseBNmsmShyR6tR4yuUQ/jFIpRGSIizgydVD58ZA
         4Rj1t0FIjWI7vqAXOufrWsQuWJOF0+50IM8pry+1R8j2WxScMO82jJuux0xQmRW5+Guf
         JgxxxEYU9mcdVtgbr3+oQrqjr8IBZB1JkgUMoI7oPP25Edx2aEfEfGvRoN4cSV2XO+t5
         PHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975759; x=1792580559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CL2BRiyUp3CaHGocQHkhsGpx+V6MY3r8MUNMnInA+U=;
        b=Nf+3dUDv5B78Abl6Oq0XzuECjPrFvgWmelJDHdps/hvgbivSW1rjSY9ToBA8WwelSn
         yyVXYQ04/6sRVIRGGAkGfaQepZTb6weB6e82REEbnQxYPWtoM64ekzW/3s34ReUeNzeH
         rq+zi3FI6Zz+bcVHUZsi//TFR6pd36y3ypCrRx1505K4iSPToGgyKYML6jgOr9Iq+wb0
         lIuKd3Ny+qB74LnzpxSBor3X214CjNcAZpmD5zm8urDPtB+CkIW+0VZ4LIhO5Iri1T4O
         id94hHzxjyvI4EiVfS1RKwuM8IVAFP3ej9HSWYHfJMevX2nqp92M5TG+bfsXB1s0qBfu
         MQew==
X-Forwarded-Encrypted: i=1; AKwUvBxMNXXlzC7ZeBocs53QRVjrB+vSb5/PBmLWOEU7nNopd5ABUpSgub4Bdcto56icgfzflsiijEGVvELBJT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIufTp4K73dVqSVxvlj6ydfhIP8k47IkG8Ccph8sh5zxy43+MCe
	CVseLOlgYD8IWyC3KjKWfcV5L88Ya1hbIlLGLyobyQdSr0NoAyzIZdA5
X-Gm-Gg: AYBFou0Wfc9g+dHq06xnGnxLXx13/M2+m1Ib52bs0OhGuOwOe5JY+XYIIoqATnYgY0u
	jbPjlrfgmXSjcgdiRvmZuNXkhcQdPOLXiFC6Z67+4XTYN+LB10QCHN7SejyIggMXYOWkG+fUKUr
	USBVL2nMc/CbZgukb5KSU99/RGOOz9cIlt7HWakFPHPEBSAZbI2JL4RfjjeNaQLytwWc19OZist
	nOBhn3xZmx+Md2ZdjKJUqpu/82N2pTyyCl7h0RNIg9P4KCAFsayigtMRnqub67LUsFmDzHdUpCc
	eweTvLHEEgZBi1dJaNVvk46SBoo/K05lSnBq6QmyEijtNqyRXdYWGDvMeAyR9Vo5XkVNS5OFwlL
	m3tlslnk/UH4CyFCwSP27VNvyHq7b5oAq3mZZo/QSHnQeFFnxfglPqlKM7lkAOz/pZieczMES9d
	2pPCS/drQ0/tk1jp8eL4ciWHltY5W9auEx0zhGGNttsNLsSky+6ha8ixgqUznyReQT2JnVqy4U7
	TxPsDXLdzG4+ep4DH/Q4Ty6pOwaqw/0YIppIgOivfeDO7RFlDfz35tmRZLNOvMYdZAb5Lj9YILf
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr321452385e9.6.1791975758979;
        Wed, 14 Oct 2026 04:02:38 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:38 -0700 (PDT)
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
Subject: [PATCH v11 11/13] io_uring/rsrc: add uncloneable regbuf flag
Date: Wed, 14 Oct 2026 12:02:09 +0100
Message-ID: <c73c459578981e64a352e46c0db39ad46621c63a.1791975048.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
References: <cover.1791975048.git.asml.silence@gmail.com>
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
index 54774729ee67..532866a1e9b9 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1458,6 +1458,11 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
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

