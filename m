Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0C39936E;
	Fri, 16 Oct 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153093; cv=none; b=kONFoW2n2TbMQGl79F+/nw+eNZAtXlywYEOLcl8O0eOkOexIytvRmruuTAcxqFSu6s5P0xFkprQfbLup9p5SNNAej/kVyPL8uIuB4uz6FL3m2Tdd0VhTnieHYRRRH9XOb77yP0KMeJdmpCJ8gXmjYZkMqzkkrIZUGRFDm8xvyx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153093; c=relaxed/simple;
	bh=BDNrVAk0ZUFVYANdkkf2TE6Kk4RAYG9tKIJc9yYtupE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHN1tL6DQ5+Q4WbIlWGE4Qih3VFLI2prSMa85amCGlJO5NmkPBlZdVp7AN4PfPg+z/d9a4PN5aFjipa3tX1YrRR2SVuc91+czJuCbztTc/6r7vLbQepV9BEEP5HehhRjVIEbuY55y5Kb7sG3JDwuxcXVkpDA/ouEJeBkxqWVU9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipdPpMmq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipdPpMmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978C81F000C5;
	Fri, 16 Oct 2026 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792153091;
	bh=EOkRSB0cLtcOXUcKkKpcJCy4OT+PN/SKOBC79D/69Z4=;
	h=Date:From:To:Cc:Subject;
	b=ipdPpMmqBmTNTURKRKtCrsLKFum3ZTnt+6jLpRt3KCpbpZNVtrehbBp27gqAwQ7r5
	 i11XFnB5KAJxsafdvGVn6VvUElI7oSKjFqJm/pGpjJhyBfEOwzC1PXcjFoEn63Q2Pq
	 3+dtGZnaiT1W3Bac96JicI1tw0U8w9EpM1gtDty1wuZotfhsaKqGCHUMAb2gexQ2N9
	 Lm0Zt7JgTXOKUhVZmzigguU0415RIViGr9shw2AN4E3CrgTdwxN6U02VWwrWUfgB7u
	 NUpB78gRBlRfQJjBvQAfXKtzSi32mxv48s3oZQ9iXAiGfAiqHwxEigVzRAKQfqoiIk
	 2zoL75emLY8QA==
Date: Fri, 16 Oct 2026 13:18:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, John Garry <john.garry@linux.dev>,
	Keith Busch <kbusch@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: linux-next: manual merge of the block tree with the dma-mapping tree
Message-ID: <atIV_5MZCayGDCSz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="816x6eNnSSPxMSLy"
Content-Disposition: inline


--816x6eNnSSPxMSLy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  95d2fec40c483 ("dma-mapping: rename dma_opt_mapping_size()")

=66rom the dma-mapping tree and commit:

  2e8e30b3cf9f1 ("Revert "nvme-pci: clamp max_hw_sectors based on DMA optim=
ized limitation"")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/nvme/host/pci.c
index dbcfc7ddb78aa,ea552ac5501f6..0000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -30,6 -30,7 +30,7 @@@
 =20
  #include "trace.h"
  #include "nvme.h"
+ #include "pci-dmabuf.h"
 =20
  #define SQ_SIZE(q)	((q)->q_depth << (q)->sqes)
  #define CQ_SIZE(q)	((q)->q_depth * sizeof(struct nvme_completion))
@@@ -318,6 -319,7 +319,7 @@@ struct nvme_dev=20
  	bool hmb;
  	struct sg_table *hmb_sgt;
  	mempool_t *dmavec_mempool;
+ 	struct nvme_dma_buf_list dmabufs;
 =20
  	/* shadow doorbell buffer support: */
  	__le32 *dbbuf_dbs;
@@@ -865,6 -867,76 +867,76 @@@ static void nvme_free_descriptors(struc
  	}
  }
 =20
+ static blk_status_t nvme_rq_setup_dmabuf_map(struct request *req,
+ 		struct nvme_queue *nvmeq)
+ {
+ 	struct nvme_iod *iod =3D blk_mq_rq_to_pdu(req);
+ 	struct nvme_dmabuf_map *map =3D nvme_req_to_map(req);
+ 	unsigned bvec_done =3D req->bio->bi_iter.bi_offset;
+ 	unsigned map_idx =3D bvec_done / NVME_CTRL_PAGE_SIZE;
+ 	unsigned offset =3D bvec_done & (NVME_CTRL_PAGE_SIZE - 1);
+ 	int length =3D blk_rq_payload_bytes(req) - (NVME_CTRL_PAGE_SIZE - offset=
);
+ 	dma_addr_t *dma_list =3D map->dma_list;
+ 	u64 prp1_dma =3D dma_list[map_idx++] + offset;
+ 	u64 dma_addr, prp2_dma;
+ 	dma_addr_t prp_dma;
+ 	__le64 *prp_list;
+ 	unsigned i;
+=20
+ 	if (length <=3D 0) {
+ 		prp2_dma =3D 0;
+ 		goto done;
+ 	}
+=20
+ 	if (length <=3D NVME_CTRL_PAGE_SIZE) {
+ 		prp2_dma =3D dma_list[map_idx];
+ 		goto done;
+ 	}
+=20
+ 	if (DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE) <=3D
+ 	    NVME_SMALL_POOL_SIZE / sizeof(__le64))
+ 		iod->flags |=3D IOD_SMALL_DESCRIPTOR;
+=20
+ 	prp_list =3D dma_pool_alloc(nvme_dma_pool(nvmeq, iod), GFP_ATOMIC,
+ 			&prp_dma);
+ 	if (!prp_list)
+ 		return BLK_STS_RESOURCE;
+=20
+ 	iod->descriptors[iod->nr_descriptors++] =3D prp_list;
+ 	prp2_dma =3D prp_dma;
+ 	i =3D 0;
+ 	for (;;) {
+ 		if (i =3D=3D NVME_CTRL_PAGE_SIZE >> 3) {
+ 			__le64 *old_prp_list =3D prp_list;
+=20
+ 			prp_list =3D dma_pool_alloc(nvmeq->descriptor_pools.large,
+ 					GFP_ATOMIC, &prp_dma);
+ 			if (!prp_list)
+ 				goto free_prps;
+ 			iod->descriptors[iod->nr_descriptors++] =3D prp_list;
+ 			prp_list[0] =3D old_prp_list[i - 1];
+ 			old_prp_list[i - 1] =3D cpu_to_le64(prp_dma);
+ 			i =3D 1;
+ 		}
+=20
+ 		dma_addr =3D dma_list[map_idx++];
+ 		prp_list[i++] =3D cpu_to_le64(dma_addr);
+=20
+ 		length -=3D NVME_CTRL_PAGE_SIZE;
+ 		if (length <=3D 0)
+ 			break;
+ 	}
+ done:
+ 	iod->cmd.common.dptr.prp1 =3D cpu_to_le64(prp1_dma);
+ 	iod->cmd.common.dptr.prp2 =3D cpu_to_le64(prp2_dma);
+ 	return BLK_STS_OK;
+ free_prps:
+ 	iod->cmd.common.dptr.prp1 =3D cpu_to_le64(prp1_dma);
+ 	iod->cmd.common.dptr.prp2 =3D cpu_to_le64(prp2_dma);
+ 	nvme_free_descriptors(req);
+ 	return BLK_STS_RESOURCE;
+ }
+=20
  static void nvme_free_prps(struct request *req, unsigned int attrs)
  {
  	struct nvme_iod *iod =3D blk_mq_rq_to_pdu(req);
@@@ -943,6 -1015,9 +1015,9 @@@ static void nvme_unmap_data(struct requ
  	struct device *dma_dev =3D nvmeq->dev->dev;
  	unsigned int attrs =3D 0;
 =20
+ 	if (blk_mq_rq_is_dmabuf(req))
+ 		goto out_free_desc;
+=20
  	if (iod->flags & IOD_SINGLE_SEGMENT) {
  		static_assert(offsetof(union nvme_data_ptr, prp1) =3D=3D
  				offsetof(union nvme_data_ptr, sgl.addr));
@@@ -967,6 -1042,7 +1042,7 @@@
  			nvme_free_prps(req, attrs);
  	}
 =20
+ out_free_desc:
  	if (iod->nr_descriptors)
  		nvme_free_descriptors(req);
  }
@@@ -1148,11 -1224,17 +1224,17 @@@ bad_sgl
  }
 =20
  static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+ 		dma_addr_t addr, u32 len)
+ {
+ 	sge->addr =3D cpu_to_le64(addr);
+ 	sge->length =3D cpu_to_le32(len);
+ 	sge->type =3D NVME_SGL_FMT_DATA_DESC << 4;
+ }
+=20
+ static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
  		struct blk_dma_iter *iter)
  {
- 	sge->addr =3D cpu_to_le64(iter->addr);
- 	sge->length =3D cpu_to_le32(iter->len);
- 	sge->type =3D NVME_SGL_FMT_DATA_DESC << 4;
+ 	nvme_pci_sgl_set_data(sge, iter->addr, iter->len);
  }
 =20
  static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
@@@ -1163,6 -1245,142 +1245,142 @@@
  	sge->type =3D NVME_SGL_FMT_LAST_SEG_DESC << 4;
  }
 =20
+ static unsigned int nvme_pci_dmabuf_sgl_nents(struct request *req)
+ {
+ 	struct bio *bio =3D req->bio;
+ 	struct nvme_dmabuf_map *map =3D to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+ 	struct scatterlist *sg;
+ 	unsigned long tmp;
+ 	size_t offset =3D bio->bi_iter.bi_offset;
+ 	size_t remaining =3D blk_rq_payload_bytes(req);
+ 	unsigned int nents =3D 0;
+=20
+ 	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+ 		size_t sg_len =3D sg_dma_len(sg);
+=20
+ 		if (!remaining)
+ 			break;
+ 		if (offset >=3D sg_len) {
+ 			offset -=3D sg_len;
+ 			continue;
+ 		}
+=20
+ 		sg_len -=3D offset;
+ 		offset =3D 0;
+=20
+ 		do {
+ 			size_t chunk =3D min(remaining, sg_len);
+=20
+ 			nents++;
+ 			sg_len -=3D chunk;
+ 			remaining -=3D chunk;
+ 		} while (sg_len && remaining);
+ 	}
+=20
+ 	if (unlikely(remaining))
+ 		return 0;
+=20
+ 	return nents;
+ }
+=20
+ static blk_status_t nvme_rq_setup_dmabuf_sgl(struct request *req,
+ 		struct nvme_queue *nvmeq, unsigned int entries)
+ {
+ 	struct nvme_iod *iod =3D blk_mq_rq_to_pdu(req);
+ 	struct nvme_dmabuf_map *map =3D nvme_req_to_map(req);
+ 	size_t length =3D blk_rq_payload_bytes(req);
+ 	struct nvme_sgl_desc *sg_list =3D &iod->cmd.common.dptr.sgl;
+ 	size_t offset =3D req->bio->bi_iter.bi_offset;
+ 	bool pooled =3D entries > 1;
+ 	dma_addr_t sgl_dma =3D 0;
+ 	unsigned int mapped =3D 0;
+ 	unsigned long tmp;
+ 	struct scatterlist *sg;
+ 	size_t remaining =3D length;
+=20
+ 	if (!entries)
+ 		return BLK_STS_IOERR;
+=20
+ 	iod->cmd.common.flags =3D NVME_CMD_SGL_METABUF;
+ 	iod->total_len =3D length;
+=20
+ 	/* entries =3D=3D 1 fits in the inline descriptor; more needs a pool. */
+ 	if (pooled) {
+ 		if (entries <=3D NVME_SMALL_POOL_SIZE / sizeof(*sg_list))
+ 			iod->flags |=3D IOD_SMALL_DESCRIPTOR;
+=20
+ 		sg_list =3D dma_pool_alloc(nvme_dma_pool(nvmeq, iod), GFP_ATOMIC,
+ 					 &sgl_dma);
+ 		if (!sg_list)
+ 			return BLK_STS_RESOURCE;
+ 		iod->descriptors[iod->nr_descriptors++] =3D sg_list;
+ 	}
+=20
+ 	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+ 		size_t sg_len =3D sg_dma_len(sg);
+ 		dma_addr_t addr =3D sg_dma_address(sg);
+=20
+ 		if (!remaining)
+ 			break;
+ 		if (offset >=3D sg_len) {
+ 			offset -=3D sg_len;
+ 			continue;
+ 		}
+=20
+ 		addr +=3D offset;
+ 		sg_len -=3D offset;
+ 		offset =3D 0;
+=20
+ 		do {
+ 			u32 chunk =3D min_t(size_t, remaining, sg_len);
+=20
+ 			if (WARN_ON_ONCE(mapped =3D=3D entries))
+ 				goto err_free;
+ 			nvme_pci_sgl_set_data(&sg_list[mapped++], addr, chunk);
+=20
+ 			addr +=3D chunk;
+ 			sg_len -=3D chunk;
+ 			remaining -=3D chunk;
+ 		} while (sg_len && remaining);
+ 	}
+=20
+ 	if (unlikely(remaining))
+ 		goto err_free;
+=20
+ 	if (pooled)
+ 		nvme_pci_sgl_set_seg(&iod->cmd.common.dptr.sgl, sgl_dma,
+ 				     mapped);
+ 	return BLK_STS_OK;
+ err_free:
+ 	if (pooled) {
+ 		iod->nr_descriptors--;
+ 		dma_pool_free(nvme_dma_pool(nvmeq, iod), sg_list, sgl_dma);
+ 	}
+ 	return BLK_STS_IOERR;
+ }
+=20
+ static blk_status_t nvme_rq_setup_dmabuf(struct request *req,
+ 		struct nvme_queue *nvmeq, enum nvme_use_sgl use_sgl)
+ {
+ 	unsigned int entries;
+ 	size_t avg_seg;
+=20
+ 	if (use_sgl =3D=3D SGL_UNSUPPORTED)
+ 		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+=20
+ 	entries =3D nvme_pci_dmabuf_sgl_nents(req);
+=20
+ 	if (use_sgl =3D=3D SGL_FORCED)
+ 		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+=20
+ 	avg_seg =3D entries ?
+ 		DIV_ROUND_UP(blk_rq_payload_bytes(req), entries) : 0;
+ 	if (sgl_threshold && avg_seg >=3D sgl_threshold)
+ 		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+=20
+ 	return nvme_rq_setup_dmabuf_map(req, nvmeq);
+ }
+=20
  static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
  		struct blk_dma_iter *iter)
  {
@@@ -1177,7 -1395,7 +1395,7 @@@
  	iod->cmd.common.flags =3D NVME_CMD_SGL_METABUF;
 =20
  	if (entries =3D=3D 1 || blk_rq_dma_map_coalesce(&iod->dma_state)) {
- 		nvme_pci_sgl_set_data(&iod->cmd.common.dptr.sgl, iter);
+ 		nvme_pci_dma_iter_set_sgl(&iod->cmd.common.dptr.sgl, iter);
  		iod->total_len +=3D iter->len;
  		return BLK_STS_OK;
  	}
@@@ -1199,7 -1417,7 +1417,7 @@@
  			iter->status =3D BLK_STS_IOERR;
  			break;
  		}
- 		nvme_pci_sgl_set_data(&sg_list[mapped++], iter);
+ 		nvme_pci_dma_iter_set_sgl(&sg_list[mapped++], iter);
  		iod->total_len +=3D iter->len;
  	} while (blk_rq_dma_map_iter_next(req, nvmeq->dev->dev, iter));
 =20
@@@ -1257,6 -1475,9 +1475,9 @@@ static blk_status_t nvme_map_data(struc
  	struct blk_dma_iter iter;
  	blk_status_t ret;
 =20
+ 	if (blk_mq_rq_is_dmabuf(req))
+ 		return nvme_rq_setup_dmabuf(req, nvmeq, use_sgl);
+=20
  	/*
  	 * Try to skip the DMA iterator for single segment requests, as that
  	 * significantly improves performances for small I/O sizes.
@@@ -1359,13 -1580,13 +1580,13 @@@ static blk_status_t nvme_pci_setup_meta
  	iod->cmd.common.metadata =3D cpu_to_le64(sgl_dma);
  	if (entries =3D=3D 1) {
  		iod->meta_total_len =3D iter.len;
- 		nvme_pci_sgl_set_data(sg_list, &iter);
+ 		nvme_pci_dma_iter_set_sgl(sg_list, &iter);
  		return BLK_STS_OK;
  	}
 =20
  	sgl_dma +=3D sizeof(*sg_list);
  	do {
- 		nvme_pci_sgl_set_data(&sg_list[++i], &iter);
+ 		nvme_pci_dma_iter_set_sgl(&sg_list[++i], &iter);
  		iod->meta_total_len +=3D iter.len;
  	} while (blk_rq_integrity_dma_map_iter_next(req, dev->dev, &iter));
 =20
@@@ -3357,6 -3578,9 +3578,9 @@@ static void nvme_dev_disable(struct nvm
  			nvme_unquiesce_admin_queue(&dev->ctrl);
  	}
  	mutex_unlock(&dev->shutdown_lock);
+=20
+ 	if (shutdown)
+ 		nvme_pci_remove_dmabuf(&dev->dmabufs);
  }
 =20
  static int nvme_disable_prepare_reset(struct nvme_dev *dev, bool shutdown)
@@@ -3564,6 -3788,14 +3788,14 @@@ static unsigned long nvme_pci_get_virt_
  	return 0;
  }
 =20
+ static int nvme_pci_init_dma_buf_io_ctx(struct nvme_ctrl *ctrl,
+ 		struct dma_buf_io_ctx *ctx)
+ {
+ 	struct nvme_dev *dev =3D to_nvme_dev(ctrl);
+=20
+ 	return nvme_init_dma_buf_io_ctx(ctrl, &dev->dmabufs, ctx);
+ }
+=20
  static const struct nvme_ctrl_ops nvme_pci_ctrl_ops =3D {
  	.name			=3D "pcie",
  	.module			=3D THIS_MODULE,
@@@ -3579,6 -3811,7 +3811,7 @@@
  	.print_device_info	=3D nvme_pci_print_device_info,
  	.supports_pci_p2pdma	=3D nvme_pci_supports_pci_p2pdma,
  	.get_virt_boundary	=3D nvme_pci_get_virt_boundary,
+ 	.init_dma_buf_io_ctx	=3D nvme_pci_init_dma_buf_io_ctx,
  };
 =20
  static int nvme_dev_map(struct nvme_dev *dev)
@@@ -3701,6 -3934,7 +3934,7 @@@ static struct nvme_dev *nvme_pci_alloc_
  		return ERR_PTR(-ENOMEM);
  	INIT_WORK(&dev->ctrl.reset_work, nvme_reset_work);
  	mutex_init(&dev->shutdown_lock);
+ 	nvme_init_buf_list(&dev->dmabufs);
 =20
  	dev->nr_write_queues =3D write_queues;
  	dev->nr_poll_queues =3D poll_queues;
@@@ -3747,7 -3981,7 +3981,7 @@@
  	 */
  	dev->ctrl.max_hw_sectors =3D min_t(u32,
  			NVME_MAX_BYTES >> SECTOR_SHIFT,
- 			dma_max_opt_mapping_size(&pdev->dev) >> SECTOR_SHIFT);
+ 			dma_max_mapping_size(&pdev->dev) >> 9);
  	dev->ctrl.max_segments =3D NVME_MAX_SEGS;
  	dev->ctrl.max_integrity_segments =3D 1;
  	return dev;
@@@ -4346,5 -4580,6 +4580,6 @@@ MODULE_AUTHOR("Matthew Wilcox <willy@li
  MODULE_LICENSE("GPL");
  MODULE_VERSION("1.0");
  MODULE_DESCRIPTION("NVMe host PCIe transport driver");
+ MODULE_IMPORT_NS("DMA_BUF");
  module_init(nvme_init);
  module_exit(nvme_exit);

--816x6eNnSSPxMSLy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrSFf4ACgkQJNaLcl1U
h9CKyAf+Ixxcnlz5tHNzYCehD+XZEnOix7kb72ndm7G8HsF34nusVMTZFSsYmDXS
x7SelNmBtXJqhWQ8fPp8uVfZVEYVN3oeaVc0A8xyTGrWI5P0/Nb9F5ECS3RnYJmz
QcwgGAy2l/rQwouJZp8IUS4RcSIxa0Si0/B5mFjGOMrw0BonFwkt5ZYbkmgbTWMs
hwglHWKGrib7u66Co0l6K5Fi1Alg14jacTltOhuqhwyJtjeiVjgJT2zK4EoixUBO
8USagUw5tgYPt9DLLEeqRVIs7UEccphHtGZ0UpODrP4vr6YXnlR2xh3BGmrAKobj
5zPAqWWBpK8ESZ/sTLOvZhVVjs/vlQ==
=PQ5t
-----END PGP SIGNATURE-----

--816x6eNnSSPxMSLy--
