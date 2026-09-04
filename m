Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA93B95F9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523860; cv=none; b=J2jEnKTgBJ5MrV1B3IO/L/uYStWfWh4bO9y47WBUUxoXGCiqu3IUQl3+tT5X07SCs1dL5UNGU+15WIVv6buvpDYS+hMAQ2kGpFQ5wysnnXxv9e9ev+ztRdkSdEyloJIJQOPdmwBQLOnl5Ea8cV/MaTokxFE7CFCodYmJ2wq58n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523860; c=relaxed/simple;
	bh=SytTqBZRVnhvi6OcGzBLq+bOOo2twon79DQt7+lrUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btMXO9M51szxqJHMLSWlyeeLDj4VkIYCNKfgS+6+5L6WaSuZOR2zUOcIIcuOxwIgqZq0OtohZHS8TKkrxiTKY0YGGh+yaajwpDNYp/iaS3VK1w2Fg85f1cbLtpBKy2wPc2jCxHnOtMS+lxJpBARXVxmM1kkNCgvcYibkf4pDGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUiF2svK; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUiF2svK"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso786031a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523857; x=1789128657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LM/ZtSLU/J3nueXy+XgpL+eelg2/bX7Qhca0kqwRafM=;
        b=HUiF2svKgY+VTO4ytLcg2g4oFb6U/8lefUO/od+QktoMVbJTIb51H4lcBo9+Efag4e
         PJYB2C9z8fH/qQfXoxzuwSKS8RNJCNtkGAaUwa0TPv3qJiHvbxGoRb3qoKIufw9OPc/p
         oetEM69Xlb/jxIMqeEo35bWRUIA9ZV6ULFhJqQpgTcN5ygwJLE8k6tjsqR+8C458iv+1
         wewx5us7lFhuEwx6yoN0WspEI9VPALOqv343nMwfk3QBxwT8BEkzN534niJgDJi1+xVQ
         gKA+vG1kk0mokVbWbLBuMyn+FTl8bn/5gIXJBEtVCOGogMgS0DD+9LUQ0mEZWDCtB5SS
         sJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523857; x=1789128657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LM/ZtSLU/J3nueXy+XgpL+eelg2/bX7Qhca0kqwRafM=;
        b=C1w7voLcEx5dUCr6LdG/uO/6ijp+Waobd652tUMxxAiHwkX4dO1ywObLf+gBa5zCGE
         KgjLoD/RQ2zmT1UgH+7nNJYw+IQag4b8pWl2vjVAOUjwlNBgk2iF8uN8bMsh6t1uguYS
         0a8RUdDXaUlBoRcp7NoFUEBqrvom+riAbhlD1An2F71O5v8XeFYJPYI3lMkeOMcN+auU
         SyJ50QERaZiYBDururcbCb1oMaEh5j2s2nxsY03X0jUqgAgKhKE9IJ71ugVvVH468HnO
         WJxfE90k0LtFJ1fwZvxbHgOFCyP8+lq3k8s/3WunNaffowrzydo6AIN0aqCh7OZNipd5
         tc5w==
X-Gm-Message-State: AFuF++mBcCTjs8Eps2A7ML496tcsvRwERHWmzEELKSzejsq52QszVUPN
	Eq9F1iF4CnzHqR4bCPYN8oUtHj2dK9lLcMNZSVxMpITSlk63lAIc7Cbe
X-Gm-Gg: AYBFou2bNc70g0hGlWR7/+g0sk7dFheWuZxtoDGVhWtUVE3R5sySjAae8hfXHde5d/y
	ISQC5b5CLw0f5mxhDhgHQDmfxcpg36lutLBTVzOzleJf65diN55qwLL9eFEDiAVfS5E2NDLvnAE
	JFH+EgjWz7Q0gixJPnjUF6aTFcloUwgBtFvs7p+9hAm1OiL4gCcu1reDCIguVyp2bbfDPUxBsEr
	sucWfmq2JoXg/ubSM2x0vebtYwIFrRc6hKV28aiD2Z24b3iMcyjqBpyQTim/bz+IuCpOGnElbji
	UvHFUPsHhXa9UFs2BnL+uujLrGevJtQWeYT5aQFGq3kG91ARZoj8aNoyJqZVqs0Iwbmm/cWaYCW
	Oe38lNXbLow6LF1rVEJEtMZAET0pzrvsXmK3ZaqyzMZq2EmfyI6zeMk8beAfwp0OWlfGCWqvssg
	DOSK1IMZZRjOlgzAS2dZAxo5E96a7q6nqVTEMynAFbaO6t2eLz0GhZFK9mK44FXIZsQn+GewcNS
	2U66vNdfU1p04A=
X-Received: by 2002:a05:6820:188a:b0:6b7:83d6:292d with SMTP id 006d021491bc7-6b783d62eb3mr1446014eaf.48.1788523857014;
        Fri, 04 Sep 2026 05:10:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6461237eec.13.2026.09.04.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:10:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] iommu: fix typos in comments
Date: Fri,  4 Sep 2026 17:40:43 +0530
Message-ID: <20260904121047.21701-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121047.21701-1-hemanth.selam@gmail.com>
References: <20260904121047.21701-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/iommu/amd/amd_iommu_types.h | 4 ++--
 drivers/iommu/intel/dmar.c          | 2 +-
 drivers/iommu/omap-iommu.c          | 2 +-
 drivers/iommu/sun50i-iommu.c        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 3dbe20023456..a1cd29f0d03f 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -121,8 +121,8 @@
 
 /* Note:
  * The current driver only support 16-bit PASID.
- * Currently, hardware only implement upto 16-bit PASID
- * even though the spec says it could have upto 20 bits.
+ * Currently, hardware only implement up to 16-bit PASID
+ * even though the spec says it could have up to 20 bits.
  */
 #define PASID_MASK		0x0000ffff
 
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index ba675b08cd20..e80a2eb3e64e 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1034,7 +1034,7 @@ static void unmap_iommu(struct intel_iommu *iommu)
  * @drhd: DMA remapping hardware definition structure
  *
  * Memory map the iommu's registers.  Start w/ a single page, and
- * possibly expand if that turns out to be insufficent.
+ * possibly expand if that turns out to be insufficient.
  */
 static int map_iommu(struct intel_iommu *iommu, struct dmar_drhd_unit *drhd)
 {
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 8231d7d6bb6a..7e43c6d64434 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1732,7 +1732,7 @@ static int __init omap_iommu_init(void)
 {
 	struct kmem_cache *p;
 	const slab_flags_t flags = SLAB_HWCACHE_ALIGN;
-	size_t align = 1 << 10; /* L2 pagetable alignement */
+	size_t align = 1 << 10; /* L2 pagetable alignment */
 	struct device_node *np;
 	int ret;
 
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba..8c9ed9e5f1cb 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -152,7 +152,7 @@ static void iommu_write(struct sun50i_iommu *iommu, u32 offset, u32 value)
  * 4096 4-bytes Directory Table Entries (DTE), each pointing to a Page
  * Table (PT).
  *
- * Each PT consits of 256 4-bytes Page Table Entries (PTE), each
+ * Each PT consists of 256 4-bytes Page Table Entries (PTE), each
  * pointing to a 4kB page of physical memory.
  *
  * The IOMMU supports a single DT, pointed by the IOMMU_TTB_REG
-- 
2.48.1

