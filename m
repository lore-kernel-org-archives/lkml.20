Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463090;
	b=VZ0sCTM2oMiurOBDq+hqpkJcb2FE8M8d2jBVmfckz3UtQST1EvQhBcgYucrNkGm1Mf/i
	 DY+gCMG7wlcEJCcyS37eH/pLWFUOIgH2LIe92vZZEsUWiCAmYuQdrkSAvppNVcwOIQyAB
	 TXRSut41Sxjip4+pRKVwKB1Jj35H30y90V7670qS+oUSh/oqtO4g3XzbQ70hmqV6hgLqL
	 L//zdc/L7NfbL0TfiZKeFp5+oDuqQAv4XukQVNVD3LXpxTI1XBMglrZu6XnMBx8hr6+sT
	 iv2oQqMGWh/TddP2WcTaaFZXXF5akFcHcEJ8Hlpt2WoLruQPaEVfB8RpDLXJkL6qBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463090;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=J6XXVdZ2sRu/Aglz0WkyROyyzIAaDf4Y/GZJgKKRZhw=;
	b=XUim5CCOUQKmozJIPUJZmeORlDPZu6Odt6LNA8CJQlELfRK43HaeyYhYMiaA+fKEN1Ee
	 FbhPpggNqQ29hk/BhV+Mm/j23M/Ao3FXwP5uSde4VBMoKvKPOINW1jDoZ8L9rU2R8vTXb
	 VZVb8APm24GhZbK7n7n2peO7cK5fy3x0nn7PMcDS5twlpNBwv+IqfIUxjNRopewgtUcGv
	 IOOqxk0jhRt033Am2fgqpFKHfWtTDiefhpuHVwTCducQstdgHU88ykb6ZGZhmevrJNz1h
	 SGd282yd6eLojMpn4ZxCwc50lp4bwHJeRhdheLbJq4k6o1su3k9mO0Dn76n8RhF+hFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E7B606A326
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso650931b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463089; x=1794067889;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6XXVdZ2sRu/Aglz0WkyROyyzIAaDf4Y/GZJgKKRZhw=;
        b=INQh4vL3YVknEMTcb2XCzKS1Ytuk86Dt4ZVj4I81V/uSCwfdQmJuFE8daXeV+GMsgg
         yYkgxd1C1aTcv03XO0BOz8jtnNkEOPtrMjx6mHATG6Ii1wGnIEbl57nzvLYnLnFL1iHe
         pl6bvGenF5Vvkn5GFRhiVQd5+FKcDnDZ3h90SlLGlkZ74Jpfnp4duh5wRGo2zE2dB0TY
         OcOxNbH1VOP71Y6pP8eDbfBoFqkKAiWG6XGQ6GnjXM4PiywgfP0zZ+En+IrTDbun/fVF
         1q9DNowLP8hcgh0XTxCbA3UdeTCs4VUEJ4TjfO6vC0iBDwY+2GsUheKhqT2AaA/k4EWi
         Y0Ew==
X-Forwarded-Encrypted: i=1; AKwUvBypZbkNYMJJpIs5VbEvtngozxvV5WbRUABSJbFEKBX5DMb/R12CihVCPl18s2RNWMhfm8JrFAMUmf0zvWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDgn52x3hCBjzRtaeGGyLQXZCsN1pFCYEELuBhHk2TqgGfVrKQ
	aWrbSWy9CkSkW4qvH08iF/gBQwRPbJsct08adoOaEUtNeNXTfm4KQaR5XkCUF+nw04t+
X-Gm-Gg: AYBFou36CHJey2uirwx9dlyJUC4/mxgT67r3hciPvCc6aJZXRNYxPbb2pzqefsTcWJM
	vaSWsEOzfFVKnL0pZXOZhfP5SJtaeK0IzS9MUDXwFrNq5Ozn2GTIlagDIuts+fa83hN/z4bDnAd
	8vJKYJlyNmiVw6vu/TLXVnvNtn0JA1bdk6/gWGRJLhyRGHO8LwSTJX/PftuUIQi6nr3Q9FF0GBb
	ncTNDqG/PfiiaIIRfkmHGu9tGlyU+/BhynqStkvVo8VhgnANoxUZ8gcAcCQrgp/G1I5K/E7hqws
	Gmcxrp6ehbe4o3BvlhX7lnwdGCEO9Z+b5G+qiEqlqkb+YAy2eAuSba9jyMaAz2T5qVSnUjL2A3R
	Q3iuvz6zmZAFR4hMcLqteFANdsubTJF6R0MvaDCk/wvv4bt0WWZNZqIIMpjLikmWFofgPXxMfRg
	4Mf/VEdRujy2ZyUKPsO1cqm5hMM6qi2oC/GEEx0Y2bjtTwizV1pzkkHZ/TovImHb28T1ttxa9j4
	6X/EtZUE/IJta8v5D/yxmjq/2uj6NyfstHR+gE9fYNrNtz+V6Gl+DH+Gwg01tZ/7I6V0ghQIdXd
	gBMFfw2twNrd8OrDsbeVfvqm5AdI5dvkEjt1Y8L8tkjyZKWxvJU3uMlgwAmiWV8jvuW3VkAfKkx
	CZpCTdR1ie/h6SI/Vyhsvoer9fLOdpRA/3mi+Pyo=
X-Received: by 2002:a05:6a00:9a7:b0:878:6ee:672b with SMTP id d2e1a72fcca58-8a9bf04f139mr3954262b3a.35.1793463089071;
        Sat, 31 Oct 2026 09:11:29 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm812368b3a.18.2026.10.31.09.11.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2026 09:11:28 -0700 (PDT)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] cxl/edac: Mask DPA flags in the event record cache key
Date: Sun, 01 Nov 2026 01:11:21 +0900
Message-ID: <20261031161121.15948-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

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

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Signed-off-by: Jongwon Lee <ai@linux.com>
---

Notes:
    Changes in v2:
    - Moved the Claude Code note below the --- (Dave Jiang)
    
    This patch was developed with Claude Code.
    
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

