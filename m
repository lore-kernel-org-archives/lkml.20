Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF04AD4BA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211077; cv=none; b=DislMUsY5LW2uefRzXvW+D8fGY6g0EEJwRaNoktb6zG+tWZ9mqEY6PSPCN3CZYnkUXiGYXzENLoOIo+TyRSBXvj9gyqai+Xg4szchUiAQrwkXU9ZzjiNi/ZUGVb8ydfauqN3RfpsdSq3lTP7t1MQrljbxorz7GvugQPteFQmHiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211077; c=relaxed/simple;
	bh=k2yy0i9Ozd8HQrAbA6lEnQoTA3W+0hKWx+owGdjYlHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVurPVH+biRmC/eQMPKrgD+HR5XrOcvVTTvjrVVNYZ1ACKouPJl9MlIOkVqc3OBVYFebMvZ3ZLOleUMMFkiUh4qVdR7P8gqo6091CLSFjffHj1v28zcvnxWpvWGBp8p2vz0sC+QvBR5to0GBDidf0orDWPXH10OCnVBlyNjlcyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLGUumCb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLGUumCb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so11932035e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211066; x=1791815866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20HLnZEOH1hZ+Cvo4bV11ruE2Rlk30tMBQPFR9Y6Sos=;
        b=kLGUumCbh/U+8E5t00cCFOccM3jG8qvr+umHEA5BTAKqZCIK5/Uw3WXC1NAqn/96zy
         5kwLGjZpXtow55JMXQpCOp8dK5lBACIohdoWZz8t69313pLjEcthQCVXwwiSWKGiGD5n
         6InzrucJPpTLACmmJSF/5jBkt5wWkyu8WfZXdalEfKG8BGfWbKR9uMsxiSv0aFqVRkg8
         paeZerN+TBdJqCaN3m1LYwwI8QxcTAKj4JjUKQdDG4x13RybASTMv5lWa/mLG14CTpBG
         UxGJ8W0mtcjjtOzKQlwSy/APzjmgtslYIG9A0Y3Chy6CsQjXBaC8txoDqzHP+d1/oHGr
         hCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211066; x=1791815866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=20HLnZEOH1hZ+Cvo4bV11ruE2Rlk30tMBQPFR9Y6Sos=;
        b=YD8gZaDUvRkl86XuKrsTlNW3tsTehMS2htbFBh8TFJNl+xjj4ptJEdgKFH99HsKRLU
         R6sBL/VIf2TQmVB0VxDfAtTT4acykU99ehOf45/+Vra3uMVKVlWL2Cn6g6CjWsbZlDup
         lR8SeGmkoJB2BiT/E4mCyrzkLM5aBCl3x6quxn43EZEVr28vbnhudH4s1+dImmhBDFpz
         NWSMfvx000sNHAbUVsNEHZRLC6z8ecGCp+IKToEvfNarNlOZs+in9SiGYyGtefpP4egq
         0EO+VPagFWCtZ+STPt6fSSvT1yj5aQiP5CoM4pifvPPyR/i+IQohlHqI0BR6alNi7dFZ
         TvgA==
X-Forwarded-Encrypted: i=1; AKwUvBzCE9VuauWtcfMNPbEbDttmRqg5PfxMDl9hGfT5JPhip9TPSiqK/mWjsfjGUpD5aCWcW16tSBTXKK7vKOM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfgL9rbWQYnp3Fg+WryyBw8h4YqhaBNJM1qVikQnUn0vqXpSum
	iX/RF8DpjZR3Q2FkEwxtAU0xo4YuVlWt5XGBgJrDR9YjFGPz57BY3KsL
X-Gm-Gg: AYBFou1TtsgYOPqPJDzN/9q74vlCEvPdH0N5rV63ee/eu3YYGnkhgosxLjN09bQaAcg
	3UUSR8boTdbp1+5InpLIhPdlhbXwZbRrVwHoQwwHY1HQ0iRnAgPLvjGVnpjhMlfpB5+Im5W4Vo6
	5XeQ6Z9UMnW43Ys76hVfC5MfCO2PZBsLvJrI6ejH+TMlyuDhpFEk8+de2TyFsYBF0rC6iCpbg8a
	LUa5iyK7cX7nqJvXyktxrjyGYY7mLCRa3c+jJhM9AK06O8u+B+HHJpGPvvM6k2xlFd0GhXkF1ho
	kaPM5Tux03ycXpnUm0xzoamRmzFeNpkYtwLZ47YAyqpt/y2pVq7f+5KwzqGfEoWxs/m75EcbH8P
	Jg4YOr+iJ203j8rPTqyenUyTKG9SnCulOjym6F1Cy4rI0Eg+wyTcopMi0uX+7bbUXCT6p43NARX
	rMIaEFn9F+I+cn0xtCGib4ziOoqCZXhnOSKAOUnD+RtoAUZX8vcH3aRliG9zrsQ6hRktaM7E/FD
	XZ9285IZeJvU3k5qYRl8In7yWR7ZPtAKoJ2EigCJ0VaQ6cS
X-Received: by 2002:a05:600c:6091:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a1702fc916mr70113485e9.3.1791211066464;
        Mon, 05 Oct 2026 07:37:46 -0700 (PDT)
Received: from andreayoga.localdomain ([80.188.242.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm348555785e9.3.2026.10.05.07.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:37:45 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iommufd/selftest: Check dmabuf MMIO mappings filled from another domain
Date: Mon,  5 Oct 2026 16:37:36 +0200
Message-ID: <20261005143737.2915-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005143737.2915-1-parri.andrea@gmail.com>
References: <20261005143737.2915-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests that a dmabuf keeps IOMMU_MMIO in a domain that is filled
from an already mapped area: a second domain added to the IOAS after
the dmabuf has been mapped, and the domain of another IOAS the dmabuf
is copied into.

The mock page table has no memory type bits, so a mapping made with
IOMMU_MMIO cannot be told apart from one made with IOMMU_CACHE. Wrap the
mock's generic_pt map_range and unmap_range ops to record, per domain,
the pages mapped with IOMMU_MMIO, and add IOMMU_TEST_OP_MD_CHECK_MMIO to
check that a range is recorded.

dmabuf_mmio_new_domain maps a mock dmabuf, checks the existing domain,
allocates a second HWPT on the same IOAS and checks it too.
dmabuf_mmio_copy maps a mock dmabuf, copies it with IOMMU_IOAS_COPY into
a second IOAS that has its own mock domain, and checks that domain.
Without the previous patch the checks on the second domain fail in the
three mock domain variants; with it all checks pass.

Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/iommu/iommufd/iommufd_test.h          |  5 ++
 drivers/iommu/iommufd/selftest.c              | 90 +++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 51 +++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h | 13 +++
 4 files changed, 159 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index 52b78cbcc920d..3c8111dfb928a 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -31,6 +31,7 @@ enum {
 	IOMMU_TEST_OP_PASID_CHECK_HWPT,
 	IOMMU_TEST_OP_DMABUF_GET,
 	IOMMU_TEST_OP_DMABUF_REVOKE,
+	IOMMU_TEST_OP_MD_CHECK_MMIO,
 };
 
 enum {
@@ -109,6 +110,10 @@ struct iommu_test_cmd {
 			__aligned_u64 length;
 			__aligned_u64 uptr;
 		} check_map;
+		struct {
+			__aligned_u64 iova;
+			__aligned_u64 length;
+		} check_mmio;
 		struct {
 			__aligned_u64 length;
 			__aligned_u64 uptr;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 25387969ab753..e700fd9250540 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -120,6 +120,10 @@ struct mock_iommu_domain {
 		struct pt_iommu_amdv1 amdv1;
 	};
 	unsigned long flags;
+	/* map_range/unmap_range wrappers record IOMMU_MMIO pages */
+	const struct pt_iommu_ops *pt_ops;
+	struct pt_iommu_ops rec_ops;
+	struct xarray mmio_pages;
 };
 PT_IOMMU_CHECK_DOMAIN(struct mock_iommu_domain, iommu, domain);
 PT_IOMMU_CHECK_DOMAIN(struct mock_iommu_domain, amdv1.iommu, domain);
@@ -392,6 +396,7 @@ static void mock_domain_free(struct iommu_domain *domain)
 	struct mock_iommu_domain *mock = to_mock_domain(domain);
 
 	pt_iommu_deinit(&mock->iommu);
+	xa_destroy(&mock->mmio_pages);
 	kfree(mock);
 }
 
@@ -423,6 +428,51 @@ static const struct iommu_dirty_ops amdv1_mock_dirty_ops = {
 	.set_dirty_tracking = mock_domain_set_dirty_tracking,
 };
 
+static int mock_map_range(struct pt_iommu *iommu_table, dma_addr_t iova,
+			  phys_addr_t paddr, dma_addr_t len, unsigned int prot,
+			  gfp_t gfp, size_t *mapped)
+{
+	struct mock_iommu_domain *mock =
+		container_of(iommu_table, struct mock_iommu_domain, iommu);
+	unsigned long index;
+	int rc;
+
+	rc = mock->pt_ops->map_range(iommu_table, iova, paddr, len, prot, gfp,
+				     mapped);
+	if (rc || !(prot & IOMMU_MMIO))
+		return rc;
+
+	for (index = iova / MOCK_PAGE_SIZE;
+	     index <= (iova + len - 1) / MOCK_PAGE_SIZE; index++) {
+		rc = xa_err(xa_store(&mock->mmio_pages, index, xa_mk_value(1),
+				     gfp));
+		if (rc)
+			return rc;
+	}
+	return 0;
+}
+
+static size_t mock_unmap_range(struct pt_iommu *iommu_table, dma_addr_t iova,
+			       dma_addr_t len,
+			       struct iommu_iotlb_gather *iotlb_gather)
+{
+	struct mock_iommu_domain *mock =
+		container_of(iommu_table, struct mock_iommu_domain, iommu);
+	unsigned long index;
+	size_t unmapped;
+	void *entry;
+
+	unmapped = mock->pt_ops->unmap_range(iommu_table, iova, len,
+					     iotlb_gather);
+	if (!unmapped)
+		return 0;
+
+	xa_for_each_range(&mock->mmio_pages, index, entry, iova / MOCK_PAGE_SIZE,
+			  (iova + unmapped - 1) / MOCK_PAGE_SIZE)
+		xa_erase(&mock->mmio_pages, index);
+	return unmapped;
+}
+
 static struct mock_iommu_domain *
 mock_domain_alloc_pgtable(struct device *dev,
 			  const struct iommu_hwpt_selftest *user_cfg, u32 flags)
@@ -434,6 +484,7 @@ mock_domain_alloc_pgtable(struct device *dev,
 	if (!mock)
 		return ERR_PTR(-ENOMEM);
 	mock->domain.type = IOMMU_DOMAIN_UNMANAGED;
+	xa_init(&mock->mmio_pages);
 
 	mock->amdv1.iommu.nid = NUMA_NO_NODE;
 
@@ -454,6 +505,12 @@ mock_domain_alloc_pgtable(struct device *dev,
 		if (rc)
 			goto err_free;
 
+		mock->pt_ops = mock->iommu.ops;
+		mock->rec_ops = *mock->pt_ops;
+		mock->rec_ops.map_range = mock_map_range;
+		mock->rec_ops.unmap_range = mock_unmap_range;
+		mock->iommu.ops = &mock->rec_ops;
+
 		/*
 		 * In huge mode userspace should only provide huge pages, we
 		 * have to include PAGE_SIZE for the domain to be accepted by
@@ -1180,6 +1237,35 @@ static int iommufd_test_add_reserved(struct iommufd_ucmd *ucmd,
 	return rc;
 }
 
+/* Check that every page in [iova, iova + length) was mapped with IOMMU_MMIO */
+static int iommufd_test_md_check_mmio(struct iommufd_ucmd *ucmd,
+				      unsigned int mockpt_id,
+				      unsigned long iova, size_t length)
+{
+	struct iommufd_hw_pagetable *hwpt;
+	struct mock_iommu_domain *mock;
+	unsigned long index;
+	int rc = 0;
+
+	if (!length || iova % MOCK_PAGE_SIZE || length % MOCK_PAGE_SIZE)
+		return -EINVAL;
+
+	hwpt = get_md_pagetable(ucmd, mockpt_id, &mock);
+	if (IS_ERR(hwpt))
+		return PTR_ERR(hwpt);
+
+	for (index = iova / MOCK_PAGE_SIZE;
+	     index <= (iova + length - 1) / MOCK_PAGE_SIZE; index++) {
+		if (!xa_load(&mock->mmio_pages, index)) {
+			rc = -EINVAL;
+			break;
+		}
+	}
+
+	iommufd_put_object(ucmd->ictx, &hwpt->obj);
+	return rc;
+}
+
 /* Check that every pfn under each iova matches the pfn under a user VA */
 static int iommufd_test_md_check_pa(struct iommufd_ucmd *ucmd,
 				    unsigned int mockpt_id, unsigned long iova,
@@ -2105,6 +2191,10 @@ int iommufd_test(struct iommufd_ucmd *ucmd)
 	case IOMMU_TEST_OP_MOCK_DOMAIN_REPLACE:
 		return iommufd_test_mock_domain_replace(
 			ucmd, cmd->id, cmd->mock_domain_replace.pt_id, cmd);
+	case IOMMU_TEST_OP_MD_CHECK_MMIO:
+		return iommufd_test_md_check_mmio(ucmd, cmd->id,
+						  cmd->check_mmio.iova,
+						  cmd->check_mmio.length);
 	case IOMMU_TEST_OP_MD_CHECK_MAP:
 		return iommufd_test_md_check_pa(
 			ucmd, cmd->id, cmd->check_map.iova,
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 44193d171ba98..8f68c9aee15d5 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -1599,6 +1599,57 @@ TEST_F(iommufd_ioas, dmabuf_simple)
 	close(dfd);
 }
 
+TEST_F(iommufd_ioas, dmabuf_mmio_new_domain)
+{
+	size_t buf_size = PAGE_SIZE * 4;
+	__u32 hwpt_id;
+	__u64 iova;
+	int dfd;
+
+	if (!variant->mock_domains)
+		SKIP(return, "needs a mock domain");
+
+	test_cmd_get_dmabuf(buf_size, &dfd);
+	test_ioctl_ioas_map_file(dfd, 0, buf_size, &iova);
+	test_cmd_md_check_mmio(self->hwpt_id, iova, buf_size);
+
+	/* A domain added later is filled from the already mapped area */
+	test_cmd_hwpt_alloc(self->device_id, self->ioas_id, 0, &hwpt_id);
+	test_cmd_md_check_mmio(hwpt_id, iova, buf_size);
+
+	test_ioctl_destroy(hwpt_id);
+	close(dfd);
+}
+
+TEST_F(iommufd_ioas, dmabuf_mmio_copy)
+{
+	size_t buf_size = PAGE_SIZE * 4;
+	struct iommu_ioas_copy copy_cmd = {
+		.size = sizeof(copy_cmd),
+		.flags = IOMMU_IOAS_MAP_WRITEABLE | IOMMU_IOAS_MAP_READABLE,
+		.src_ioas_id = self->ioas_id,
+		.length = buf_size,
+	};
+	__u32 stdev_id;
+	__u32 hwpt_id;
+	int dfd;
+
+	if (!variant->mock_domains)
+		SKIP(return, "needs a mock domain");
+
+	test_cmd_get_dmabuf(buf_size, &dfd);
+	test_ioctl_ioas_map_file(dfd, 0, buf_size, &copy_cmd.src_iova);
+
+	/* The copy is filled from the domain of the source IOAS */
+	test_ioctl_ioas_alloc(&copy_cmd.dst_ioas_id);
+	test_cmd_mock_domain(copy_cmd.dst_ioas_id, &stdev_id, &hwpt_id, NULL);
+	ASSERT_EQ(0, ioctl(self->fd, IOMMU_IOAS_COPY, &copy_cmd));
+	test_cmd_md_check_mmio(hwpt_id, copy_cmd.dst_iova, buf_size);
+
+	test_ioctl_destroy(stdev_id);
+	close(dfd);
+}
+
 TEST_F(iommufd_ioas, dmabuf_revoke)
 {
 	size_t buf_size = PAGE_SIZE*4;
diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index b4928cbd4d9c8..4567a69de8df6 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -560,6 +560,19 @@ static int _test_cmd_destroy_access_pages(int fd, unsigned int access_id,
 	EXPECT_ERRNO(_errno, _test_cmd_destroy_access_pages(              \
 				     self->fd, access_id, access_pages_id))
 
+#define test_cmd_md_check_mmio(_hwpt_id, _iova, _length)                     \
+	({                                                                   \
+		struct iommu_test_cmd check_cmd = {                          \
+			.size = sizeof(check_cmd),                           \
+			.op = IOMMU_TEST_OP_MD_CHECK_MMIO,                   \
+			.id = _hwpt_id,                                      \
+			.check_mmio = { .iova = _iova, .length = _length },  \
+		};                                                           \
+		ASSERT_EQ(0, ioctl(self->fd,                                 \
+				   _IOMMU_TEST_CMD(IOMMU_TEST_OP_MD_CHECK_MMIO), \
+				   &check_cmd));                             \
+	})
+
 static int _test_cmd_get_dmabuf(int fd, size_t len, int *out_fd)
 {
 	struct iommu_test_cmd cmd = {
-- 
2.53.0

