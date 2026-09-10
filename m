Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342B5AEC45
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069583; cv=none; b=pz5Eohed2MZsR1Hb/9bhd7fa1GLlN0QK1QUv36ma8fE3GvSA8WK6wz+sS2ZxXoN0fUqW5hQXPbktXCVQPDRyE8EzgSb7TE7z2AbkBK6e68Ova6t3zG1+Rmr7pO87/h5DLSvku+nDx0mcwOAROyFpXKeM88QdFPFr7ItGSU/mjKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069583; c=relaxed/simple;
	bh=nzNtocB+3tL6bfmY7+uDsAetxYXocuFeoxUiOCBkU4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FenRi+nsmEi1gWx9wQIHIx9Xq+zyLD5YKkZFg+kc+RE5zIX7PD4GDTzYIyikpThDTkdcL40eN/XRf4UuCkhV5H1r72MPBUBwu4x5XwXDv7uGqao7gfrv5tbb1c56MKQjNcsFxqwx3ZIDhbmvr+0Yw7ldYhdd1KEVooRPiYVzOig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNPKOWLl; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNPKOWLl"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52ff0b7c98aso2216691cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069579; x=1789674379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vg8Qli77O1R5GWc9/5RodbMpVM7POzgBfYCRgn9i5to=;
        b=bNPKOWLlNZzh758tfREv7nhACTc/vnFD97tGgOEK/Cq0xHKO1qkA+fuO+y/4ob0dov
         vKuGfjAooQpO0zmRBHt5pcSyU1FHj+/6cHoRUT2vrJJ/J6s/ncoOSwRQDz9ZmqhTuetd
         lrCZIfSJMoFdbPKidElMlMeBLorUs22wqpK0vcItYZH7PaB0+N8RTDl+2gNPR6uyYV3N
         VDr77vtdJiYjWw1rgilzOxkNs48GDelN8Syt/AxBCF/V4y7eduvvHC++mtBwAhPmeo+u
         Wx+hlfwCm39FGTcVSO2iKiy8pjCjuVQKJpf+GUbqtgWuflULIVj7q7PcBLDSg7xpSnfG
         aD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069579; x=1789674379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vg8Qli77O1R5GWc9/5RodbMpVM7POzgBfYCRgn9i5to=;
        b=b3h4BuumM6nPmp3ooUvInp0elvezKQS0lVSCAmbMCRqtGI74BjTqF0QQyLrHSL6Phe
         N0bfxNng35SdaoIfiQfngtQ64qm/BZSw1AiR0mA4RIapTIjSX0f3U8+LeZZ60iqvY1l2
         rcNt/twacpLWNzA++dhnUp9dGn2pzdGYmnHWKxo0acZZctjkBfqePxQ3sNZ0ETPTz1Is
         r6XXQG4d7ZoUriQs1KCoiinEXVaNoFDizHPuoZfctkM1UDOb6tSpiqg2yoZ0LaqrfdKX
         M2cAjFk3vDhFMuNFm3ICtTaROMPphSOU0ebVU76SpWh2le09s7mBSGRN3SOzJ7+8L8tc
         m5+g==
X-Forwarded-Encrypted: i=1; AKwUvByLZ0zFXG7gLU9YCKDb2afH9depy2DwC62OEE/Ak3CqzuYBvz1UcasSyTjDOe7uvVpN26soCNEIY0iAuL4=@vger.kernel.org
X-Gm-Message-State: AFuF++kBCkV+iDEj1re+lMkaKieub2x2isZgTizUgGas4quZDrnW+0Ii
	2ARZBBwyrHYt8BhnknWXNyqWcrWZgHxl/e7zIcB9JmMpXkS3172tD4YcUs6d3A==
X-Gm-Gg: AYBFou0orkJvqzl9vWvdlS+/QpsQZBuSGHoY9GiOkccoGZm0gdCG5msszvmPh1gb+nX
	HYrHLbSOcycL04Tkai7TPgFKgPZQ+O1A9AQxbue71MJuQELQHHCJ6JUN/NMXWdILeNSZP9Y5a1F
	jVm33+McafkbekHD79ljm6bwCNxcM+161Y4RLTfR331RWmuei0SMl03nhrMr1zgafpGdDqQa9pt
	zYWrXfcsoY+Gtk0AftoFZFKUCaeFItOhtcGDaO2Q82BtQIJiK44tRFNgFphXaymvF/dNnnCg1zP
	yw5eeAbSvJPur+k5MpN9pUTBTbvGC8hsqbCmlV7nVUQCp0Q1da5b+5iTL5DGBan9XHThBjaf/r+
	LNhSCQiACDoevjAHl7lxduGf1bddVrf6Smraif0QGPd6fic4ZGlcV7LsrX6E3CJWwhNQG3uKQ3W
	bNF4zDmrJGvp4oNpr7TbNzIH7VrDCCBrvOdv4VuPdyVpcrE+cJSkReScagzIy8reXCtbs6GTeuH
	+tIbIYp62BkGWRSVHdnsLenqChDJAKu8KRx68N7ZHp/im401X9WI/5kfkT80fsYy4OqY6bUx24S
	vyrZqF/Q8gviYQl+N+X1/odFZhfxesL2J+jj05xBkXlgYVQQ
X-Received: by 2002:a05:622a:1389:b0:530:b2e4:d5a2 with SMTP id d75a77b69052e-530c87a548amr14474691cf.61.1789069578795;
        Thu, 10 Sep 2026 12:46:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca50cd05sm1174131cf.29.2026.09.10.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:46:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsl_raid: switch __b32 to u32
Date: Thu, 10 Sep 2026 12:46:16 -0700
Message-ID: <20260910194616.34760-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register maps in fsl_raid.h annotate every field as __be32, but
they are accessed only through ioread32be()/iowrite32be(), which
already perform the byte swap and take plain u32 __iomem pointers.
The __be32 annotation therefore makes sparse reject each access:

  drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
      (different base types) ... got restricted __be32 [noderef] __iomem *

Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
descriptor/CDB structures written via cpu_to_be32() keep their
annotations.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@intel.com/
Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and cast at access")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: split patch up.
 drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..6fde5192ab77 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -110,59 +110,59 @@
 
 struct fsl_re_ctrl {
 	/* General Configuration Registers */
-	__be32 global_config;	/* Global Configuration Register */
+	u32 global_config;	/* Global Configuration Register */
 	u8     rsvd1[4];
-	__be32 galois_field_config; /* Galois Field Configuration Register */
+	u32 galois_field_config; /* Galois Field Configuration Register */
 	u8     rsvd2[4];
-	__be32 jq_wrr_config;   /* WRR Configuration register */
+	u32 jq_wrr_config;	/* WRR Configuration register */
 	u8     rsvd3[4];
-	__be32 crc_config;	/* CRC Configuration register */
+	u32 crc_config;		/* CRC Configuration register */
 	u8     rsvd4[228];
-	__be32 system_reset;	/* System Reset Register */
+	u32 system_reset;	/* System Reset Register */
 	u8     rsvd5[252];
-	__be32 global_status;	/* Global Status Register */
+	u32 global_status;	/* Global Status Register */
 	u8     rsvd6[832];
-	__be32 re_liodn_base;	/* LIODN Base Register */
+	u32 re_liodn_base;	/* LIODN Base Register */
 	u8     rsvd7[1712];
-	__be32 re_version_id;	/* Version ID register of RE */
-	__be32 re_version_id_2; /* Version ID 2 register of RE */
+	u32 re_version_id;	/* Version ID register of RE */
+	u32 re_version_id_2;	/* Version ID 2 register of RE */
 	u8     rsvd8[512];
-	__be32 host_config;	/* Host I/F Configuration Register */
+	u32 host_config;	/* Host I/F Configuration Register */
 };
 
 struct fsl_re_chan_cfg {
 	/* Registers for JR interface */
-	__be32 jr_config_0;	/* Job Queue Configuration 0 Register */
-	__be32 jr_config_1;	/* Job Queue Configuration 1 Register */
-	__be32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
+	u32 jr_config_0;	/* Job Queue Configuration 0 Register */
+	u32 jr_config_1;	/* Job Queue Configuration 1 Register */
+	u32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
 	u8     rsvd1[4];
-	__be32 jr_command;	/* Job Queue Command Register */
+	u32 jr_command;		/* Job Queue Command Register */
 	u8     rsvd2[4];
-	__be32 jr_status;	/* Job Queue Status Register */
+	u32 jr_status;		/* Job Queue Status Register */
 	u8     rsvd3[228];
 
 	/* Input Ring */
-	__be32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
-	__be32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
-	__be32 inbring_size;	/* Inbound Ring Size Register */
+	u32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
+	u32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
+	u32 inbring_size;	/* Inbound Ring Size Register */
 	u8     rsvd4[4];
-	__be32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
+	u32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
 	u8     rsvd5[4];
-	__be32 inbring_add_job;	/* Inbound Ring Add Job Register */
+	u32 inbring_add_job;	/* Inbound Ring Add Job Register */
 	u8     rsvd6[4];
-	__be32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
+	u32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
 	u8     rsvd7[220];
 
 	/* Output Ring */
-	__be32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
-	__be32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
-	__be32 oubring_size;	/* Outbound Ring Size Register */
+	u32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
+	u32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
+	u32 oubring_size;	/* Outbound Ring Size Register */
 	u8     rsvd8[4];
-	__be32 oubring_job_rmvd; /* Outbound Ring Job Removed Register */
+	u32 oubring_job_rmvd;	/* Outbound Ring Job Removed Register */
 	u8     rsvd9[4];
-	__be32 oubring_slot_full; /* Outbound Ring Slot Full Register */
+	u32 oubring_slot_full;	/* Outbound Ring Slot Full Register */
 	u8     rsvd10[4];
-	__be32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
+	u32 oubring_prdcr_indx;	/* Outbound Ring Producer Index */
 };
 
 /*
-- 
2.55.0

