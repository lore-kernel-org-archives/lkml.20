Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E62D3225
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651255; cv=none; b=mf+QqMT/W/CCJN+ZAWigG0ZqBW71DFt0ZanW16v9kWtXXWHc8kNugJ/K2qbLi+1YZa1ZU4pHh3Uc1UwBcBh2dn2NNJIBfth/laUcsfqGUVTKbYcWcWHQ7KohVjmzcj1WAvCm4N4Rdk5qDAD9KKSlJCfbNCf6U42cy3ijoucJX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651255; c=relaxed/simple;
	bh=qDhp3Gl2RurgAJzoCMul2yhpCnoK8vpJ8F27uwCVvmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQ/aHmxv7pZQIf6/3Bue6QFkne+V6+gwT2AHFhtCYqBKzjMtKDD5sJKO/3pIcu+M8Olf75k4bRU25ttyfFkaIcMcXuv994fO4DpzJORV3DEsnPcdY9HHVTZ875MI4z/n9GXgdomOQg2B4ZqmU6VrCjb9lani9+zpVX4i0Mpt8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=IoHZbcLz; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="IoHZbcLz"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so126860eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651242; x=1791256042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=58wR0IFQe7qI6VxnTbwaOMxhMo4vjXI56LcpUV2YHs4=;
        b=IoHZbcLzqFQ5bb6G6wUbfceYNyg4qeMvAFs5nzZX2FxKeHd7fPaol3eGIIZBLRZtMI
         92a5ptLmMtqbeJDiIAOBRAokiMxU+wxhUNJY8CKYRtCxqJJd6rBSddL31wUqF8Gv5wA8
         isdF8/tb+tKg0Z4WP4AB5ja09yyCauhLqut1Ph04IoY3xRB1iakHeVCuda7htMULnolH
         /DYSmcMZfHzefAIPFSiv/9nWxyfXx0zJ1XX9sQBoXCZanP093EyMdd7VTC7u478Di34j
         YTU4cb7QMcm7B8c2nDTh2q8+I3mkzvR2AMsEyhsttTyi8DEcrSvT7RNmobQgAu2Dw/BS
         /WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651242; x=1791256042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58wR0IFQe7qI6VxnTbwaOMxhMo4vjXI56LcpUV2YHs4=;
        b=AlntdjCuBD5nsxG/bprNFLyJhhb6XLHpVDxQ+HA2tviXp9TuxKdFTpfINfgb4sYB98
         iLvLBmACtfAn7ZnJy4m+J8Yd+TwIu/o44YD8qdhCDTiyMbZaZeVIRVMsd/WDSEepiwM+
         1QGC+rjhsK/wHXnKzHSQsZ7fWysYq7F3agRfKLooWh+GMZWY/dIG3Zuha+CQZ9eCGTEf
         HFG1Zu88UhqxIDu7XZmRNDssznLBiwK6bBBBNDFQR80Rv/bbNrswFdytscYgDgNsNEYA
         zJmSEXT8vY5Ll8izHOpvfhE8a2+Ndd9ZyJdA8tLLxsOduSAXNwPwMTQMxFRB9AU+He0q
         Bafg==
X-Forwarded-Encrypted: i=1; AKwUvBxN9xeqDd6h9xmkzKQrKBoT94u3FpIqWjx4AeFgqQqMQd43sg/i6DhzkhIg1iGohPIikvXmd4K3aRQdW8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWYqrVuJal7T+QPKMVxa6GawViIakW8M5zkPbhYKEbJrL3Wvb5
	9t5bOqaWUsEszd8I/AcL9OdopqXB4XpcJunf8A+JgoC7Y7NMdqOmRCSGucKvueIVwFk=
X-Gm-Gg: AYBFou3V4k6qKUmnO4J8F36nC4Ix1Ag+ismmILDjoBpa+Tgpp6K60YKPxupLDwrMvml
	6DEE4t8O+vYZ6qduQ0mzl8SSnYhA+WeY3MJ4Sb/S4V3DvTFvculOALcc6s1/ulilw1wSgs8KEuQ
	1oT0RmXNSeL2NH9I3RfPETjvYcJa9AsUe9rvkg2VabvGkstgOdu4VAUw7BmFf9AaHXJvYhj9F8N
	nrzEasgPkmLtw/OTOIeYX4/WpW8CRpqn0wUDi8+Bn5ADUR2pO0dkewwK8CsBPNlDhAunShu41Ep
	GlPv+MCoUBSMipPi42tRMYuHolzucSSdjjNf3cx0SC59Ga87VBqrCy+J9ZT5FRY6EBM6Vj6ddT+
	1fYWefMWMgzOHG4YBH5QOGoLyF54/d6gjRrdzhpkjqUafRhaleQJlBnpYx5xLH7G6qUVG678QT4
	tKbPCJVZoat8hPpMXc02xXeojcdR1yYXwNd0cwe8T5sv6BV5wdCqUN+c7gTSXZYMn90xWS5RjUA
	QJqUlBJdeWQoc3N/1ASkCf1eDx9HZDYOA4vYzosB68pWzaBfmng+RkMkVhH4Trl3KYooeM=
X-Received: by 2002:a05:7300:d20c:b0:342:9a9:1f6f with SMTP id 5a478bee46e88-342711ab92fmr11542389eec.3.1790651241600;
        Mon, 28 Sep 2026 20:07:21 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a49febsm33748832eec.2.2026.09.28.20.07.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:07:21 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Dan Williams <djbw@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dan.j.williams@intel.com,
	ira.weiny@intel.com,
	jonathan.cameron@huawei.com,
	Li Ming <ming4.li@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 6.6.y] cxl/mem: Fix no cxl_nvd during pmem region auto-assembling
Date: Mon, 28 Sep 2026 23:07:16 -0400
Message-ID: <20260929030716.86736-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Ming <ming4.li@intel.com>

[ Upstream commit 84ec985944ef34a34a1605b93ce401aa8737af96 ]

When CXL subsystem is auto-assembling a pmem region during cxl
endpoint port probing, always hit below calltrace.

 BUG: kernel NULL pointer dereference, address: 0000000000000078
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 RIP: 0010:cxl_pmem_region_probe+0x22e/0x360 [cxl_pmem]
 Call Trace:
  <TASK>
  ? __die+0x24/0x70
  ? page_fault_oops+0x82/0x160
  ? do_user_addr_fault+0x65/0x6b0
  ? exc_page_fault+0x7d/0x170
  ? asm_exc_page_fault+0x26/0x30
  ? cxl_pmem_region_probe+0x22e/0x360 [cxl_pmem]
  ? cxl_pmem_region_probe+0x1ac/0x360 [cxl_pmem]
  cxl_bus_probe+0x1b/0x60 [cxl_core]
  really_probe+0x173/0x410
  ? __pfx___device_attach_driver+0x10/0x10
  __driver_probe_device+0x80/0x170
  driver_probe_device+0x1e/0x90
  __device_attach_driver+0x90/0x120
  bus_for_each_drv+0x84/0xe0
  __device_attach+0xbc/0x1f0
  bus_probe_device+0x90/0xa0
  device_add+0x51c/0x710
  devm_cxl_add_pmem_region+0x1b5/0x380 [cxl_core]
  cxl_bus_probe+0x1b/0x60 [cxl_core]

The cxl_nvd of the memdev needs to be available during the pmem region
probe. Currently the cxl_nvd is registered after the endpoint port probe.
The endpoint probe, in the case of autoassembly of regions, can cause a
pmem region probe requiring the not yet available cxl_nvd. Adjust the
sequence so this dependency is met.

This requires adding a port parameter to cxl_find_nvdimm_bridge() that
can be used to query the ancestor root port. The endpoint port is not
yet available, but will share a common ancestor with its parent, so
start the query from there instead.

[ Backport to 6.6.y: mapped find_cxl_root() and reference handling to the
  older struct cxl_port and put_device() APIs. The new early error return
  explicitly drops parent_port because 6.6.y lacks the scoped cleanup later
  added by upstream commit dd2617ebd2a6 ("cxl/port: Use __free() to drop
  put_device() for cxl_port"). ]

Fixes: f17b558d6663 ("cxl/pmem: Refactor nvdimm device registration, delete the workqueue")
Co-developed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Li Ming <ming4.li@intel.com>
Tested-by: Alison Schofield <alison.schofield@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Link: https://patch.msgid.link/20240612064423.2567625-1-ming4.li@intel.com
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and cxl maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-41085. It registers the nvdimm bridge before
endpoint probing can auto-assemble a pmem region.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
The target-specific adjustment is recorded in the bracketed note above.
The added error-path put_device() matches the cleanup that current mainline
performs automatically through its scoped cxl_port reference.

Could you please queue it for 6.6.y?

CVE: CVE-2024-41085
Upstream: 84ec985944ef34a34a1605b93ce401aa8737af96

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/cxl/core/pmem.c   | 21 ++++++++++++++-------
 drivers/cxl/core/region.c |  2 +-
 drivers/cxl/cxl.h         |  4 ++--
 drivers/cxl/mem.c         | 18 ++++++++++--------
 4 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
index 317b2fbbef668f..1f87ce9191a74d 100644
--- a/drivers/cxl/core/pmem.c
+++ b/drivers/cxl/core/pmem.c
@@ -62,16 +62,21 @@ static int match_nvdimm_bridge(struct device *dev, void *data)
 	return is_cxl_nvdimm_bridge(dev);
 }
 
-struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_memdev *cxlmd)
+/**
+ * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
+ * @port: any descendant port of an nvdimm-bridge associated
+ *        root-cxl-port
+ */
+struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
 {
-	struct cxl_port *port = find_cxl_root(cxlmd->endpoint);
+	struct cxl_port *root = find_cxl_root(port);
 	struct device *dev;
 
-	if (!port)
+	if (!root)
 		return NULL;
 
-	dev = device_find_child(&port->dev, NULL, match_nvdimm_bridge);
-	put_device(&port->dev);
+	dev = device_find_child(&root->dev, NULL, match_nvdimm_bridge);
+	put_device(&root->dev);
 
 	if (!dev)
 		return NULL;
@@ -244,18 +249,20 @@ static void cxlmd_release_nvdimm(void *_cxlmd)
 
 /**
  * devm_cxl_add_nvdimm() - add a bridge between a cxl_memdev and an nvdimm
+ * @parent_port: parent port for the (to be added) @cxlmd endpoint port
  * @cxlmd: cxl_memdev instance that will perform LIBNVDIMM operations
  *
  * Return: 0 on success negative error code on failure.
  */
-int devm_cxl_add_nvdimm(struct cxl_memdev *cxlmd)
+int devm_cxl_add_nvdimm(struct cxl_port *parent_port,
+			struct cxl_memdev *cxlmd)
 {
 	struct cxl_nvdimm_bridge *cxl_nvb;
 	struct cxl_nvdimm *cxl_nvd;
 	struct device *dev;
 	int rc;
 
-	cxl_nvb = cxl_find_nvdimm_bridge(cxlmd);
+	cxl_nvb = cxl_find_nvdimm_bridge(parent_port);
 	if (!cxl_nvb)
 		return -ENODEV;
 
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index af4f8bbe63c448..97e4a4755ab2f8 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2682,7 +2682,7 @@ static struct cxl_pmem_region *cxl_pmem_region_alloc(struct cxl_region *cxlr)
 		 * bridge for one device is the same for all.
 		 */
 		if (i == 0) {
-			cxl_nvb = cxl_find_nvdimm_bridge(cxlmd);
+			cxl_nvb = cxl_find_nvdimm_bridge(cxlmd->endpoint);
 			if (!cxl_nvb) {
 				kfree(cxlr_pmem);
 				cxlr_pmem = ERR_PTR(-ENODEV);
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index a7a1b71626de43..59e963e39d31b1 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -795,8 +795,8 @@ struct cxl_nvdimm_bridge *devm_cxl_add_nvdimm_bridge(struct device *host,
 struct cxl_nvdimm *to_cxl_nvdimm(struct device *dev);
 bool is_cxl_nvdimm(struct device *dev);
 bool is_cxl_nvdimm_bridge(struct device *dev);
-int devm_cxl_add_nvdimm(struct cxl_memdev *cxlmd);
-struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_memdev *cxlmd);
+int devm_cxl_add_nvdimm(struct cxl_port *parent_port, struct cxl_memdev *cxlmd);
+struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port);
 
 #ifdef CONFIG_CXL_REGION
 bool is_cxl_pmem_region(struct device *dev);
diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
index 317c7548e4e9b4..3400d2f2a5ff92 100644
--- a/drivers/cxl/mem.c
+++ b/drivers/cxl/mem.c
@@ -153,6 +153,16 @@ static int cxl_mem_probe(struct device *dev)
 		return -ENXIO;
 	}
 
+	if (resource_size(&cxlds->pmem_res) && IS_ENABLED(CONFIG_CXL_PMEM)) {
+		rc = devm_cxl_add_nvdimm(parent_port, cxlmd);
+		if (rc) {
+			if (rc == -ENODEV)
+				dev_info(dev, "PMEM disabled by platform\n");
+			put_device(&parent_port->dev);
+			return rc;
+		}
+	}
+
 	if (dport->rch)
 		endpoint_parent = parent_port->uport_dev;
 	else
@@ -173,14 +183,6 @@ static int cxl_mem_probe(struct device *dev)
 	if (rc)
 		return rc;
 
-	if (resource_size(&cxlds->pmem_res) && IS_ENABLED(CONFIG_CXL_PMEM)) {
-		rc = devm_cxl_add_nvdimm(cxlmd);
-		if (rc == -ENODEV)
-			dev_info(dev, "PMEM disabled by platform\n");
-		else
-			return rc;
-	}
-
 	/*
 	 * The kernel may be operating out of CXL memory on this device,
 	 * there is no spec defined way to determine whether this device
-- 
2.39.5
