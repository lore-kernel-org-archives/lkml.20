Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE497361947
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336747; cv=none; b=J9jBKk8G3xfrv6X5LRbybm7zerfZVS/s6Zpy0xpwC7jpJ0lIAY43uuh7QfUWl6pRXi8vLSVciWssTNvdrQku7zw1iRmNIkJXczs5qAvltaelcgXcCUokrbvnk8wNSDDyxF3+skmsnQrpZKyggPWGOeXtGA6SLSZFa3gvt9CY2Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336747; c=relaxed/simple;
	bh=0H9glifjPgkqEWKGP++eJinbmT3aKWdELAA3KyhevoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLbRuHOitkU6e17aGoaMaZ1/9aL7pH/r1sTLJbSCixMTjoLYgyTf/BZj8bv8IyVx18IO6oI+3EaHIOtypC1b2d7HnIZ4/AA2b1Xuj86KPQ3a3j6QPd2WRJWXmSOR+7rXhqUrlkdMtlYah9AwAiHh1poMNF2i2Qpc+wPzS3MR1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW/X8ve0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW/X8ve0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso7243445e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336743; x=1791941543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5C1LuMfh69/HYkoIqRVoBc/1L3Q3lKb3vhsLsuZLCo=;
        b=KW/X8ve0fze+15KEPtbucm34iS/4upWzSs5hRUCxlDlHvv+gFlPiYDY+CKKAB7KGvK
         vxG0uzfgevL4Atjn7wQvazX2TFG/azH9dnyRn2j1iCyzBbEcsEvJq2ocCGAG/7cpds3o
         fmQz79ZBvtBet7+BUXIhHRlIpNkJV/et61yqN9sTgTC/96bTJzOzu0IEp/4p8tlD2izt
         7geX3xNwhJuhahC8hCWPNmkQxGwct99dz7c1d+Hb1Nimvl7nTSkANgEGVi1+FXFSmGP4
         ZRItUh10luk69uehyvKyhurcuoPCeVkZYKHrXxB7AN4hSdiv0k62lEfHLXhiLZKPZ1ib
         y3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336743; x=1791941543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5C1LuMfh69/HYkoIqRVoBc/1L3Q3lKb3vhsLsuZLCo=;
        b=dgY5RW/OxzHkatbl46xdI9ZgebAhls4PX3P/Oewm2ZHx4Svzj1V1lqw+Hrevg88lwU
         /GA4NRySRHoABu2bjxtEb0Wd6e4a93eWGwo3/Rm6XJ3PoVWDPbHBeF3VNAtzlONNFA6R
         68yJcY+C89L25s5mIv0+DwLmanDgCnkW2iy9BH8N8jOVlKoz+Biw2UgCV4JSaJugHanf
         AOKBOTxlm6wC7lKZT8iHH3cWUVZYvIr6/DjeN7pagz3tNqLnbfAwwM2fAkVbRD2fhL1j
         kcSrXNp5XC7JoIWMp8Jk4S3FKs5vsHALsUT0pLkzg8oryteZgM++FSz5jLjYHzyYLC+m
         RJMw==
X-Forwarded-Encrypted: i=1; AKwUvBwbTijUAHAIDGOuJgqXOfP3AHiuJeDC+C6Kxwn687xysSvvZ535uZ/g3TY0FmPpdS2GJwzaE/VtHwTAZGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k7kDXPbcn5LzMbRpsFH6Zai7bBkvWAMk67qo39trxTF/FnlZtT
	uJbj3VVkVerMNVvhoTMPwkaHrwjSBb9Tn9T9hULLcmEt1E7ULopg1REU
X-Gm-Gg: AYBFou1bvTjGZPM/ImhFV3igIJPE9KI/Va63EmOgDGAJ4hl7C2kXH7kIUGt0eNdffcI
	WEjgE2rg+0LSmGdjWh427uafRtKpbExTd4vt/Eet+dFcDJ+Ky9c7tfD/if63q83AU3eoKHfgHlz
	G2qMpTX+GUbyobuYLqkWZxrlBkOVQ0RzXtDA7Cbf+YgamE+mD6Hfg9YtdtzSYWejofoTWn0qtTK
	oYgMjGflk5kyXTYlep3Ttjob9woMu7OBWFAQjvZXmJO8lqMcwIVaOUBFW94JAgNmazyPLD50gcf
	j6ZY6JSdqBnow4iT1fHMoIhBgmqYmS6UTazqa/A104DJDshH/JrbeozrWTxtpnL+s8yUVZKzBbd
	th/cCbkTwzje/kuO0WgdXwPZZW6eIVIQXvenoad4yw/+XctjEhBDKzffVDNs0N3XInXK44d7MI9
	cwiXWVtA68a76A6J0Eswdixo04rbWOR6P/5wC8LWMf7FrzHvhXPFDl1fYagKiomL7qdqdAJOY8Y
	UJHJ1yUt9zhEBvYoEoujnFRFWvlHmzkPqYUtKXRVkRztPi9VtgNvl1GKAzhWZHymURqmUq/fjay
	Sw==
X-Received: by 2002:a05:600c:4688:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18042a422mr7202215e9.22.1791336743008;
        Tue, 06 Oct 2026 18:32:23 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:22 -0700 (PDT)
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
Subject: [PATCH v8 07/13] nvme-pci: add SGL support for the dmabuf path
Date: Wed,  7 Oct 2026 02:31:50 +0100
Message-ID: <b748f9a99355276efe74399c41de4934e9eaa5cb.1791336002.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336002.git.asml.silence@gmail.com>
References: <cover.1791336002.git.asml.silence@gmail.com>
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
 drivers/nvme/host/pci.c | 153 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 149 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a0506c93fa16..651f7654d73b 100644
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
@@ -1239,6 +1245,145 @@ static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
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
+	struct bio *bio = req->bio;
+	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+	size_t length = blk_rq_payload_bytes(req);
+	struct nvme_sgl_desc *sg_list = &iod->cmd.common.dptr.sgl;
+	bool pooled = entries > 1;
+	dma_addr_t sgl_dma = 0;
+	unsigned int mapped = 0;
+	unsigned long tmp;
+	struct scatterlist *sg;
+	size_t offset = bio->bi_iter.bi_offset;
+	size_t remaining = length;
+
+	if (!entries)
+		return BLK_STS_IOERR;
+
+	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
+	iod->total_len = length;
+
+	nvme_dmabuf_map_sync_for_device(nvmeq->dev, req);
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
@@ -1334,7 +1479,7 @@ static blk_status_t nvme_map_data(struct request *req)
 	blk_status_t ret;
 
 	if (blk_mq_rq_is_dmabuf(req))
-		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+		return nvme_rq_setup_dmabuf(req, nvmeq, use_sgl);
 
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
-- 
2.54.0

