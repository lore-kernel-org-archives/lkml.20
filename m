Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97224886E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520264; cv=none; b=p4faDoHN9FSaFSPR0wnILBK+kOcXDxjAdAq+VFMsKU2ByATTgDbexRtT6sKq34WlyUO+dTSN7eqYUJgATCgswhtglxveqzt7FNkQkBQJE4Z+fFJ30Vng04SySFbqs4iLSAzaKZM+nZ1U9XUIbXEoaWPbD6aSKoS695Za0hm1HMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520264; c=relaxed/simple;
	bh=TdYdfEs0Lg2GpmYAEn5v+0945jxjvUz5AquGmAK5csY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yx6qbPh5EHft/1NXe2bz8oiRFmPlHDgSvm2s4Hi6PdgjIUBb77IIFX6VIRKSoEhJzDopaN5K0u6OFozL6kD0f8kS8gdTCwfUYJrt9SSy2smq80tWPXHicx+M+XwxotbmWipKTwbMNKJrpTKu+A7r8BuREOuvFRlnSkAh/mGSa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHI+3817; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHI+3817"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f48c750afcso798253a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520261; x=1789125061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dq3xIFAwlAvi1lAvXdnWkfquBwSLlnUJa21+MBQhYcc=;
        b=eHI+3817cqzGTuG60th1NF3mzMx8aqJmdJn2NmIPGOpxTX3gJM3CIxkTLC6tFAddPV
         Zrp/x/bBXBk0fvZLQVegG5ana+4SsOimPpYOQzFDOA5ujQ5P06Jtot/wkY2dIzYB7/B1
         Nj0FMDg1hgsZfKVxVnZIuO2mmS4ffw95I08UNFdL4IgnNc9M9ZsMLMhgwgDoxs5Y47wU
         Wze5T0VDvITgMYAKZy7R5NG4O6RPf9fvpYXTKMkXza9dKe1swqjjjkmri74Wv5BWTVLb
         l1cHG6+Jfqh7nIy0cG8bybxToFDK6NHFcy9yFKH0o3mpDXuNr/osXNAAq7Ji/BTAacuC
         8Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520261; x=1789125061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dq3xIFAwlAvi1lAvXdnWkfquBwSLlnUJa21+MBQhYcc=;
        b=gI1tvFZUcH2kdQhqbABv7HLWzj0G2uweS92T1KiEkyJSSpLMRXnhz0sD8tWLsOxduN
         CNc30vtjUaWMog6iGLd90/VKVuNz4S+YOlPjCDGPtDzsHeHaIdYzqWzStAWzUIKQn/Xz
         xCsni1W4c4YayPfoFxvekIVb3j82yKwj7UFqN66Hv60qv4zSWib62PlyrKaa6H1tqSJ5
         PGwaxC0mpYjWJhHQ5qb2sDClQOFISCexjbYzFQw7XrFzKaWu0GC0mb1YdZGH4xnDdBMU
         Qi7zXSYpuv7PcYUpS4p7k+6qeC7BuEVdI4WSmJBJ8WqT3qpx3SvO9twmwpjKAbJqt964
         cgOA==
X-Gm-Message-State: AFuF++lig3FdG4FPXuxqdBlUrEMCQ2DSe27fynEUSMc/tNqVBtLf0ZJd
	Mh6uWv9lB/BoOEAd8o5SFCw9qmCMwqn05zsd1K64qaDMrJc8jDpgMoYSKLeUnhZvObQ=
X-Gm-Gg: AYBFou03YnCVuDjo+gF4y61J0CFrgtWEmZyLK4904lHqV/Pt2DCOpuyW64gt+v+9jOZ
	/KChaOK5Ym2f5+852sUDiDXwGHmNIiRiqn1sNJCVnuyYlNvVMg8eAx6F5cj2+77KJWQ+Elq9UcQ
	VtZB18K4C8fSoeSKa/j4UicpMBNtoHkqaa/HGpSFxK7mMqnANtFL0Aw34/mfZJ1cG72Dm2TmDFo
	1VmNtx/zy5N+ni7AVQ05JUejtuTTtgNgV5Tq2fyHPfcv6QUO4EIPZ95LGuT3fCRFwXlN5DY+dGR
	TRb1EMh9o8faH4UD3KtACBcGQsRNWQadduw98mtMaTboEupKMXRr4dlW7EAnEclVeB7EfnIOuPE
	WHDiyaWTyMnjwdEw8/wYX9rGU9nPGyESV1/7n9xg/mFyoa453L9EM5g0mMiNwD/NZVg7R1PUs92
	BQmP/Qdzq4pe+BlRrP+lHDdrWtTnyV0Amza3LQXyND+bqnriMTxvlsYXiVxgS6ZivGQS1SHUa5k
	gSfL/icYq26ks4=
X-Received: by 2002:a05:6820:809:b0:6b7:83c5:fde9 with SMTP id 006d021491bc7-6b783c6033amr1310183eaf.42.1788520261294;
        Fri, 04 Sep 2026 04:11:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm8761646c88.2.2026.09.04.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:11:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] coresight: fix typos in comments
Date: Fri,  4 Sep 2026 16:40:51 +0530
Message-ID: <20260904111054.22485-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 drivers/hwtracing/coresight/coresight-catu.c       | 6 +++---
 drivers/hwtracing/coresight/coresight-core.c       | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       | 2 +-
 include/linux/coresight.h                          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..59932f23b6ee 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -45,7 +45,7 @@ struct catu_etr_buf {
  *	------------------------------------
  *
  * Where bit[0] V indicates if the address is valid or not.
- * Each 4K table pages have upto 256 data page pointers, taking upto 2K
+ * Each 4K table pages have up to 256 data page pointers, taking up to 2K
  * size. There are two Link pointers, pointing to the previous and next
  * table pages respectively at the end of the 4K page. (i.e, entry 510
  * and 511).
@@ -202,7 +202,7 @@ catu_populate_table(struct tmc_sg_table *catu_table)
 		/*
 		 * The @offset is always 1M aligned here and we have an
 		 * empty table @table_ptr to fill. Each table can address
-		 * upto 1MB data buffer. The last table may have fewer
+		 * up to 1MB data buffer. The last table may have fewer
 		 * entries if the buffer size is not aligned.
 		 */
 		table_end = (offset + SZ_1M) < buf_size ?
@@ -263,7 +263,7 @@ catu_init_sg_table(struct device *catu_dev, int node,
 	struct tmc_sg_table *catu_table;
 
 	/*
-	 * Each table can address upto 1MB and we can have
+	 * Each table can address up to 1MB and we can have
 	 * CATU_PAGES_PER_SYSPAGE tables in a system page.
 	 */
 	nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..bcc655933d35 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -200,7 +200,7 @@ struct coresight_device *coresight_get_source(struct coresight_path *path)
  * @src:	The source device of the trace path
  * @conn:	The connection of one outport
  *
- * Return false if the connection doesn't have a source binded or source of the
+ * Return false if the connection doesn't have a source bound or source of the
  * path matches the source binds to connection.
  */
 static bool coresight_blocks_source(struct coresight_device *src,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..8182a8298306 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -338,7 +338,7 @@ static void etm4_hisi_config_core_commit(bool enable)
 	 * bit 12 and 13 of HISI_HIP08_CORE_COMMIT_REG are used together
 	 * to set core-commit, 2'b00 means cpu is at full speed, 2'b01,
 	 * 2'b10, 2'b11 mean reduce pipeline speed, and 2'b01 means level-1
-	 * speed(minimun value). So bit 12 and 13 should be cleared together.
+	 * speed(minimum value). So bit 12 and 13 should be cleared together.
 	 */
 	val = read_sysreg_s(HISI_HIP08_CORE_COMMIT_REG);
 	val &= ~HISI_HIP08_CORE_COMMIT_MASK;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..91fc18947eb1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -352,7 +352,7 @@ EXPORT_SYMBOL_GPL(tmc_alloc_sg_table);
 
 /*
  * tmc_sg_table_sync_data_range: Sync the data buffer written
- * by the device from @offset upto a @size bytes.
+ * by the device from @offset up to a @size bytes.
  */
 void tmc_sg_table_sync_data_range(struct tmc_sg_table *table,
 				  u64 offset, u64 size)
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c7cbca45f2de..fc1a27c5a436 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -706,7 +706,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * wrapped and should be treated as limit.
 	 *
 	 * When the TRBE is affected by TRBE_WORKAROUND_WRITE_OUT_OF_RANGE,
-	 * it may write upto 64bytes beyond the "LIMIT". The driver already
+	 * it may write up to 64bytes beyond the "LIMIT". The driver already
 	 * keeps a valid page next to the LIMIT and we could potentially
 	 * consume the trace data that may have been collected there. But we
 	 * cannot be really sure it is available, and the TRBPTR may not
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ddf18c970e34..2137bc18ff93 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -320,7 +320,7 @@ struct coresight_device {
  * @nr_idx:		Number of entries already allocated.
  * @pfx:		Prefix pattern for device name.
  * @fwnode_list:	Array of fwnode_handles associated with each allocated
- *			index, upto nr_idx entries.
+ *			index, up to nr_idx entries.
  */
 struct coresight_dev_list {
 	struct list_head	node;
-- 
2.48.1

