Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC064FD79D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975764; cv=none; b=LUOCbJr01h4QhJbq5/w9gMYJCwXHk9qpXXPdcv47lw6HVf74/Efmg5kvwuIQJbaev9EDrzTT0QqLS9P4SukpE3HW1i56Y1beuVS6ckQSqGx9M7Wkd8eNg9tlnBlSW9qH0FihE6glBGcCWtEefRzGlmfsZn0jb0l+v2zGgO5jQd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975764; c=relaxed/simple;
	bh=iy9U6gJyxks5ymTnPsPTZg2hiScYxD3ewbuzhpHoVzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WC+AFYVr1g+ryTHe507fzFsgaU2ZXog/JFhZMWocVi0vFiejwoS9LF0DWFPVAmeaiZx/REpWRYD3brK3cIh8N+p5aJjRCXe3l379u0v/yDHgVVDCPJAti7YMqnwO8wxa9WGcCquz1w6HTkBhSAJwh+nfDCF9N/foIqPdn3vQe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mbk6OF0g; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mbk6OF0g"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so10597505e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975754; x=1792580554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSeH33Tp73HrlxrRD40ZRw/kp0xshqtHbX/nV8WDcGA=;
        b=Mbk6OF0gK7+DKGMPYpyHbb0WOqDBuwPId7kiJSuyuugw2TVNLlQgDdp9ISEGBYBg21
         4n+JvfBFwz5XQDe13kYeyamYFLGuYIjL8AT/c1aCRCG/cZaAgYH6K0QNnEzYKha8kEA1
         IfpzpRDFGFrBImE2ubyAMf2UspBXbfR/HUO3IkpSx+LXn0GMuOttMxH+30oPVBtFZ0CT
         WrgnLG5ThL28AR6WmZWJlgtVuZdffNwdKAYH5cVPdP/EkrVhLHUbAy/D30YPNHGdV+N3
         9NwFIkVK1B7hnyXP915ToZjLxrFNdZSust3p8lQ/SyeDACvZXefTnsmAsRa0SO/LOYjC
         BImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975754; x=1792580554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSeH33Tp73HrlxrRD40ZRw/kp0xshqtHbX/nV8WDcGA=;
        b=NNChIzlfZy4Fg122vAGmEyA/vVcoztbzgr0ZCqg7JmGNA1Q4SPvy/Txtq0prM7/hRH
         imsm1eZ87g7z3oF/C2/9SJfyMPxvBwNn5m1WodDuwcK9ri9huiaMMfBjvL153fh9dgz7
         cnEILk5aNV2XVR3QhcFwKVjpFLNTwcsmA5aEzHPmYZ1LcaOM8C7lc7Pp/OkIAV6DSVne
         JuXAUfrkDMSGDIfVNEuOeMN1Oj+uI6ad71oqLX3Qi8gwYUsm5173qyJf/oKfhlVTmUba
         zfP3ucxFXofBd9cq4jLiMIc6pMQICkbpqb+CMTARL+oyxxfcS76BDzfo0xmS4t5vn/qo
         dfQw==
X-Forwarded-Encrypted: i=1; AKwUvBypde5ANJ+0wgr7oVNLLdlJWGs9ek5gnpz5ihRbhlCK/ZN0kbeZXV0Xsv3OdB54+dC/oD5FUhk4+dUBeno=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBIowwzXkPRLnd9wjqg7NNeBH9vsVbZVS1e6M5smyx+Rk+oAit
	PCasNIZTaK8J7TOh8Ro5DQQwJu7LH9LHydUv12QhhWJg0lNPM1bat3xf
X-Gm-Gg: AYBFou3pLHLfOtFRz8KUM9u80DN3bjH7JEh1g2t2ceF6PK0gkAb9EV0bCGlLIMUA0JW
	ffNfdpBpE6ubQg2VRFtG/FpAKbaTbpP6brSZkohwQzg9b02xJkgZatzGLEMUUrU5QfmxF9HqI0g
	gknL6yxlcGJpukF+R9bE03zWDDT86OzTRhyPs5sQNeJpi5sGU41BgRCHmpEB/xjyeZYKbtw3Q24
	5EN5Zr6j89PotNmYDTu2OI15rlpuOMB3vI5jI09G4J7TIAjDH3evdW/B4jwNgj/HlL715TSManz
	7Mhb3EKt5s3L74j4Bufd2tAD4pIiOCm48yYLiZAxSbELDXlLAwmaXC4CNWyLb/Gmvs2rj99sK89
	gh3MuY8AzQKeX++c3+4xvzWWMxaz3nyFvb4i2HIxriwIBLfUCfeODcubvY7IKgGmlVoJ3Ltnj6l
	eHpiUB2Ivcz7dYoTkxt/dEaK9RMgsxTiaAGpDkDLUjk0Zo/kD4gYd2R/IfBMKlxOcjRw8gn7Wk8
	zt0IiWN14YeAFCMcx7+dWvl7IZudaHrxIzljzKNGaHpYm+qJbYJkKaDonlKi060INa5xoOHU7XB
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id 5b1f17b1804b1-4a18e4d68aamr259014055e9.24.1791975754208;
        Wed, 14 Oct 2026 04:02:34 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:32 -0700 (PDT)
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
Subject: [PATCH v11 08/13] nvme-pci: add SGL support for the dmabuf path
Date: Wed, 14 Oct 2026 12:02:06 +0100
Message-ID: <86fb4caeddaa58fafad106548f82950782ea04fd.1791975048.git.asml.silence@gmail.com>
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

From: Anuj Gupta <anuj20.g@samsung.com>

Add SGL support in addition to PRP for dmabuf-backed requests,
building the descriptor list from the mapping's sg_table.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 150 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 146 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a0506c93fa16..79b3c1092e4d 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1223,12 +1223,18 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
+static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+		dma_addr_t addr, u32 len)
+{
+	sge->addr = cpu_to_le64(addr);
+	sge->length = cpu_to_le32(len);
+	sge->type = NVME_SGL_FMT_DATA_DESC << 4;
+}
+
 static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
-	sge->addr = cpu_to_le64(iter->addr);
-	sge->length = cpu_to_le32(iter->len);
-	sge->type = NVME_SGL_FMT_DATA_DESC << 4;
+	nvme_pci_sgl_set_data(sge, iter->addr, iter->len);
 }
 
 static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
@@ -1239,6 +1245,142 @@ static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
 	sge->type = NVME_SGL_FMT_LAST_SEG_DESC << 4;
 }
 
+static unsigned int nvme_pci_dmabuf_sgl_nents(struct request *req)
+{
+	struct bio *bio = req->bio;
+	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+	struct scatterlist *sg;
+	unsigned long tmp;
+	size_t offset = bio->bi_iter.bi_offset;
+	size_t remaining = blk_rq_payload_bytes(req);
+	unsigned int nents = 0;
+
+	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+		size_t sg_len = sg_dma_len(sg);
+
+		if (!remaining)
+			break;
+		if (offset >= sg_len) {
+			offset -= sg_len;
+			continue;
+		}
+
+		sg_len -= offset;
+		offset = 0;
+
+		do {
+			size_t chunk = min(remaining, sg_len);
+
+			nents++;
+			sg_len -= chunk;
+			remaining -= chunk;
+		} while (sg_len && remaining);
+	}
+
+	if (unlikely(remaining))
+		return 0;
+
+	return nents;
+}
+
+static blk_status_t nvme_rq_setup_dmabuf_sgl(struct request *req,
+		struct nvme_queue *nvmeq, unsigned int entries)
+{
+	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
+	struct nvme_dmabuf_map *map = nvme_req_to_map(req);
+	size_t length = blk_rq_payload_bytes(req);
+	struct nvme_sgl_desc *sg_list = &iod->cmd.common.dptr.sgl;
+	size_t offset = req->bio->bi_iter.bi_offset;
+	bool pooled = entries > 1;
+	dma_addr_t sgl_dma = 0;
+	unsigned int mapped = 0;
+	unsigned long tmp;
+	struct scatterlist *sg;
+	size_t remaining = length;
+
+	if (!entries)
+		return BLK_STS_IOERR;
+
+	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
+	iod->total_len = length;
+
+	/* entries == 1 fits in the inline descriptor; more needs a pool. */
+	if (pooled) {
+		if (entries <= NVME_SMALL_POOL_SIZE / sizeof(*sg_list))
+			iod->flags |= IOD_SMALL_DESCRIPTOR;
+
+		sg_list = dma_pool_alloc(nvme_dma_pool(nvmeq, iod), GFP_ATOMIC,
+					 &sgl_dma);
+		if (!sg_list)
+			return BLK_STS_RESOURCE;
+		iod->descriptors[iod->nr_descriptors++] = sg_list;
+	}
+
+	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+		size_t sg_len = sg_dma_len(sg);
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (!remaining)
+			break;
+		if (offset >= sg_len) {
+			offset -= sg_len;
+			continue;
+		}
+
+		addr += offset;
+		sg_len -= offset;
+		offset = 0;
+
+		do {
+			u32 chunk = min_t(size_t, remaining, sg_len);
+
+			if (WARN_ON_ONCE(mapped == entries))
+				goto err_free;
+			nvme_pci_sgl_set_data(&sg_list[mapped++], addr, chunk);
+
+			addr += chunk;
+			sg_len -= chunk;
+			remaining -= chunk;
+		} while (sg_len && remaining);
+	}
+
+	if (unlikely(remaining))
+		goto err_free;
+
+	if (pooled)
+		nvme_pci_sgl_set_seg(&iod->cmd.common.dptr.sgl, sgl_dma,
+				     mapped);
+	return BLK_STS_OK;
+err_free:
+	if (pooled) {
+		iod->nr_descriptors--;
+		dma_pool_free(nvme_dma_pool(nvmeq, iod), sg_list, sgl_dma);
+	}
+	return BLK_STS_IOERR;
+}
+
+static blk_status_t nvme_rq_setup_dmabuf(struct request *req,
+		struct nvme_queue *nvmeq, enum nvme_use_sgl use_sgl)
+{
+	unsigned int entries;
+	size_t avg_seg;
+
+	if (use_sgl == SGL_UNSUPPORTED)
+		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+
+	entries = nvme_pci_dmabuf_sgl_nents(req);
+
+	if (use_sgl == SGL_FORCED)
+		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+
+	avg_seg = entries ?
+		DIV_ROUND_UP(blk_rq_payload_bytes(req), entries) : 0;
+	if (sgl_threshold && avg_seg >= sgl_threshold)
+		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+
+	return nvme_rq_setup_dmabuf_map(req, nvmeq);
+}
+
 static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 		struct blk_dma_iter *iter)
 {
@@ -1334,7 +1476,7 @@ static blk_status_t nvme_map_data(struct request *req)
 	blk_status_t ret;
 
 	if (blk_mq_rq_is_dmabuf(req))
-		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+		return nvme_rq_setup_dmabuf(req, nvmeq, use_sgl);
 
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
-- 
2.54.0

