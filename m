Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345249;
	b=qQtYaZpWeEfMiA1susydzxFaZc3oLq2PgoAS/k9lTlndBVQ7X47ePZRoDKdnMKH0doYG
	 Uk2TjfY9sJAgtt7z1EHF++vNQXOxzV5mhcFryI13Nr2YRL/IFR8bslM4ckUO6ZI/rKWCC
	 Jf9LjTIk7sJT0dKyRejnZw8WWptngBhU0jrYtcba20H5aTWZdF7bhkolEhtXLig1VwygJ
	 21ha7o50sZWfKT7NERF1Qkdia9DNdI9nvFwHGj9pJL5XNpc3Zy+0pf+2SxJ4Ohut6Utgt
	 p5xZwA0j1B3AEfhcWIcUgShcAUMWMnRy3Uy1/TUWGR8EUC6RqYptuIhSLxVX5tiHNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345249;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6O9nBSIoP2u3yOwnerkPj+AewG07nffiGXPyUnk1aN8=;
	b=fZ7OsaLNdh6NExUfIWCmC2qh5SOxnMylNGHUNsvGH9She5aN/uWh0AIfL1YzhVD/HMSH
	 4oMNdwGz/293fFDkqihlLuAA9CluQT9cEdN4UwNdEFATgFQMZaz9Lk2JnqEkjihDb2kHG
	 axDlBC8U9HMm0fTjZ1LjcEWtO5b4Ro4l3JGMjOHoN7Zv0WN4W+ET6i3zBuUz/mRrkgCcN
	 Lc/4FNFTt4pxTEsHZzUynRSrCj3S1K7VCrBGW0yLEuEd3z9TY/bMqb/0ZSh6yOq9QNKVm
	 +vRX5ZTPNFQdTOCGnoWPQE0DT7ycj3E9HwxpxbH3T4ln+OpXny9bmfKBfODI0T+EELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67090606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67090606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so219643b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345248; x=1793950048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6O9nBSIoP2u3yOwnerkPj+AewG07nffiGXPyUnk1aN8=;
        b=FYtShPXvGJ6vgvrq9wz9NxtmptEffQ93O1yqmb3Wlnz3DpNa7JCDHL6afrOX76j3NX
         XKGHYpehvoK1IgSikxmV67cFCUWKRTVvyBkzIslt70Zj5v+Nwerp3L2Lwm5gcgdH52aS
         Che97xqheo1rNDRu65jVkXvkPoQT5dokrPCD5V/7VkAfyn58CAdgGOwS2baChaPdBrFh
         rA4L9NxbXwI3W2HeK8sFin+cj+Y/taYNIxXGr7aLnB6rHEW7QFR5HUlKJ10ztuPp3sBW
         6tGLxFqoUKhWsJmNLc0erhElS11XMcAd5qsqqwCVgYWpyaFvyypassw5MCT8nFjmsr6s
         Sjqw==
X-Forwarded-Encrypted: i=1; AKwUvBxvt10jk9rn4WYcbjj9RAUyyYeA+KlU9nmkb+mHnMh9RyMVl9X4UJ8e3/79NvvM1cqJWPqcyXVwpi/3M1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIItW6aRATZW4nKGMn1Qn0re3Vv9s3Ks/J0Gk0GM21HCKoju3Gt
	Cy5QngGSCOl1lcrfP3EUOEHaX+DcCOIXDMm8Jjx0QC3D1uGP6GdjPV2Wy0C59OfqBuuP
X-Gm-Gg: AYBFou0mcYN6dC1/+HSGnQdZsIfEGj7MnkwtNrjpYPD2E3FgO3bVxvnoJpftPL64JNi
	FJaCQKTAsXQB4nPjTuzXHqULlN1Pn3Lftve87hpWjon2WG9QlsSYaC7mUhAgkalxpQ6ySEK9X7R
	IeLb/mTsaPfzN2SkNP83Oaa9LQqlo6g1zk8gEPloWbw8ZXjBME3J5SnpLk/1r7otfkXCjgorAhP
	7no4VvRzZ2hAt2g+Se6NKr3nT8YcefcqVmNcM8w2kXrzWTY3ERZWeRHgrxrYRMleFyxESUYEdoQ
	/THn9Ir0BslU4uxki3FShpX1O671sbtuWP9bbcwhs+0SGB3laSr9i3TZzmb0DOT2Lrgw9MkadPf
	FnstNEIh6alrguYsuHCNsgjOwCZskkZqyQL8b0fR3dPbOXi/a1BZ/cS/IwkGqtdfFRLzAQ1CJC/
	kJ0wODn954Qm1VZGO1o+sjwRx7EndI6tHgHSGZ6q6a967L23jb/0COmkIoRCOT8/ZjZmwSbCOAD
	bnTb/69acCDQURvMB8uwgu59LVNbypoIJoyYpwfeesftiuT4tGd1P/lLB+NdgdSE8Nf/B1p846d
	kYB6PrVeYIA0A7bbnXOvbauQQuIXYsKnwU3Py4IVMPUDvg==
X-Received: by 2002:a05:6a00:1389:b0:881:8b53:f66 with SMTP id d2e1a72fcca58-8a9bc34c20fmr1396753b3a.24.1793345247635;
        Fri, 30 Oct 2026 00:27:27 -0700 (PDT)
Received: from localhost.localdomain ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef952aa5sm411665b3a.34.2026.10.30.00.27.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:27:27 -0700 (PDT)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Richard Cheng <icheng@nvidia.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cxl/edac: Mask DPA flags in the event record cache key
Date: Fri, 30 Oct 2026 16:27:21 +0900
Message-ID: <20261030072721.31970-1-ai@linux.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The low bits of the DPA in a General Media or DRAM event record are
flags: bit 0 is VOLATILE and bit 1 is NOT_REPAIRABLE. The trace events
report the DPA with CXL_DPA_MASK applied, but cxl_store_rec_gen_media()
and cxl_store_rec_dram() use the raw value as the xarray key.

User space reads the DPA from the trace event and writes it to the
mem_repair dpa attribute. If the record had any flag set, xa_load()
misses it and the repair fails with -EINVAL. The raw key also lets a
repair go through for a record the device marked NOT_REPAIRABLE, if the
DPA is written with bit 1 set.

Key the records by the masked DPA and skip records marked
NOT_REPAIRABLE.

Co-developed with Claude Code.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Signed-off-by: Jongwon Lee <ai@linux.com>
---

Notes:
    Tested on QEMU master (b574eaf) with a CXL type 3 device, region
    committed, KASAN and PROVE_LOCKING on. DRAM events injected with
    cxl-inject-dram-event at 0x1001, 0x2000 and 0x3002, then a repair
    requested through mem_repair0..4. Same result for all five:
    
      DPA written   before    after
      0x1000        -EINVAL   ok
      0x1001        ok        -EINVAL
      0x2000        ok        ok
      0x3000        -EINVAL   -EINVAL
      0x3002        ok        -EINVAL
      0x5000        -EINVAL   -EINVAL
    
    No KASAN, lockdep or WARN output. Only DRAM events were injected; the
    General Media path has the same change but was not exercised. Not
    tested on real CXL hardware.

 drivers/cxl/core/edac.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 34b81e8dfb..b3dfc33ca6 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -918,6 +918,21 @@ struct cxl_mem_repair_attrbs {
 	enum cxl_mem_repair_type repair_type;
 };
 
+/*
+ * The low bits of the event record DPA are flags (VOLATILE, NOT_REPAIRABLE).
+ * Records are looked up by the DPA user space writes back, which comes from
+ * the trace event and has the flags masked off, so key them the same way.
+ */
+static unsigned long cxl_rec_key(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_MASK;
+}
+
+static bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_NOT_REPAIRABLE;
+}
+
 static struct cxl_event_gen_media *
 cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
 		       struct cxl_mem_repair_attrbs *attrbs)
@@ -929,7 +944,7 @@ cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
 		return NULL;
 
 	rec = xa_load(&array_rec->rec_gen_media, attrbs->dpa);
-	if (!rec)
+	if (!rec || cxl_rec_not_repairable(&rec->media_hdr))
 		return NULL;
 
 	if (attrbs->repair_type == CXL_PPR)
@@ -950,7 +965,7 @@ cxl_find_rec_dram(struct cxl_memdev *cxlmd,
 		return NULL;
 
 	rec = xa_load(&array_rec->rec_dram, attrbs->dpa);
-	if (!rec)
+	if (!rec || cxl_rec_not_repairable(&rec->media_hdr))
 		return NULL;
 
 	validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
@@ -1105,8 +1120,7 @@ int cxl_store_rec_gen_media(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_gen_media,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_key(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
@@ -1135,8 +1149,7 @@ int cxl_store_rec_dram(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_dram,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_key(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
-- 
2.55.0

