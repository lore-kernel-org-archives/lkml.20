Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9854F55B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055890; cv=none; b=gfVbpDXd+ZammhIWkkq3e7+gLlIZZLY67gA+dHTdkzpCL6+8L5ok0CBo91XPsmC3f/lerrrs7AQTN654I8Go4BiW4REdiKngVI9FcLsXQLepBpUymXzii9Q1vQldMaJWuCf/yj4blrpXG+z5sooa8GRIxggyw7bcxo2z9bddfI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055890; c=relaxed/simple;
	bh=cLnGrFj4fZ5QbMee1ofZJxYlwDb4ml+Hkm+YEE7tfAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROZVoLgWxEg0bcjN/KuoqXNQy5+LD1Rt5Y8FZ1IVd0NJfAzWcUOHUI0DMmr+XK3iipSoY/RCQy+EPCa/hG5vE5LAZnRN5rVfmU1pk/Zgo3HlGHK1+s5ad7BL/dOLE9g2PDr+SMuc9HklPwSzWXnpF43Cl7MUPkl+Fg7Dv7Os05Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=gdMwCfDT; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="gdMwCfDT"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so954273a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792055888; x=1792660688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG1zhfPiMXRFUFNZwJgHDsR7OhzfKqj2uZPWv/pDLsM=;
        b=gdMwCfDTRWaMX3ZCdeq3sQn3wNITUY2teqZufHQ4H96Obxe8R/tHPcikaCz2CHQvBu
         RDXgegv/DY83hqm9Q/AO6AKYz0/BiN4WFz6lCLa0m0BrIS9tzxTQ+JxOrRbFBypOBxkD
         EOMmmY6dtXmm4nBcCxdPw9io+1q6ESUv2xdt4ZKQuyV8LJqKvAYhtKWNX7f1rubWlVA+
         F05b4VgZerjrJn/e6/4aIAmNKhLUDkRC0Pmk5fMZg1Ji3Pk/XGUXuCQ+cLK0/hI8dQSJ
         gKI7sQCmQO98dzL3F/Y47eyrY3l504HfC7SxA9uOYlPKGHZO87zwTna2OO+SrWyh6qI0
         1bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055888; x=1792660688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG1zhfPiMXRFUFNZwJgHDsR7OhzfKqj2uZPWv/pDLsM=;
        b=VKB/SQB0+q1fcwGEEjV2VXPDqkZ7QDDowyjjN4kyh4shfhsgXuw2XoLV85mA8NXBW2
         jOPRIaAL2yM6cC7vHhEbPryxqZyU4ToYHLGc+sUXA+e7XYovP/W2+HRJf+ybP9K1JNYy
         2+P739A0XJkbWcdo3GgvkUVS36WpgA0n8hS3akRSa4fTuAbGfP8kueq1mFoNkPjeSxUd
         Eatcly48oOHwCes9v7B8x/JoiFFZsyfmDdvgOCO6DnyPZUW+1VVLAy2d7XpWPqwqxebb
         7DCtjsdgnHzZoywkApzw2vPKoyR6u7G2Bj14nyp0fAQsJ4CeTEhSmcEdi6Mk48+m5/by
         Fkyw==
X-Forwarded-Encrypted: i=1; AKwUvByNSEO3fmD0G1MeMZS5okgwjdEGFivUg0dDqfpMBEMKAzZq7ceto94dLIFrePk6lBNUC8eLaVIdBBzzMcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD/9oo0/q6SB+0/P8FEOkNMtteyr41zqT/CRRPY3VtOcfDXV/b
	24z1eE9d37ni9+nDo0cgCpRV8aZi2UNi+8RsWy8WJeZTbEC/Zayz9JLmp8LXZqhWPBY=
X-Gm-Gg: AYBFou0u5AtPC29NEOmTR+krlfLiYV0jKUaunLQEmAU9o3Rl0zpdVRJPDwuIww5UEhV
	AaJ9GgAOWD/QV3ylNY5h+tJAsPw8d4uqIpXaaF13Mg8c2v8mRbNEMd5RwnGRu/Dw7fEuJMneVlI
	OOxH3OMpJ4Ddww6QHCcls6EjSvl2RbM9b6A3Pi+PaMZ5sL4L+78sRnNbh6TAf0PBZ6A+jI3OueH
	WlaIvx3RUqBK14emiZdlCEKhXrwY4DtsH4IYqPNI5r63i/YWcLEgp5QrpUUUElJJgbbM4fPpnfG
	08SjlOQfh6LeqRtRTYtOhv50+aPDZ2c4XgONf6HjckUBjB8eTJTH43Ep0UllKqLmH3RDo9moHvS
	IUoDXYtXRyKLjf5NuzvPzntTFt+NzkSRaTBnrx7vx1pDrRubDfp7Y8h7fteoCSACvmJsd3L6lDx
	mrizkqCpjyeaFONaDfsfFYgqV3m/McvctfQaN5bZNWWCckyamTB78VAIMoMbqsbWHNH80uK+Knl
	dARWXVkB2hbY6jd
X-Received: by 2002:a17:90b:57c4:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3ab3a95388emr15934233a91.24.1792055888192;
        Thu, 15 Oct 2026 02:18:08 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e821csm3412408a91.8.2026.10.15.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:18:07 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 3/5] scsi: aic94xx: validate the EDB index in asd_get_tmf_resp_tasklet()
Date: Thu, 15 Oct 2026 18:17:45 +0900
Message-ID: <20261015091747.4184349-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr>
References: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asd_get_tmf_resp_tasklet() extracts the empty data buffer index from the
done list status block exactly as asd_get_response_tasklet() does:

	int  edb_id = ((resp_sb->flags & 0x70) >> 4)-1;

and indexes seq->edb_arr[] with it unchecked:

	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
	ascb->tag = *(__be16 *)(edb->vaddr+4);

The field is three bits, so the value runs from -1 to 6, and the first
ESCB has edb_index 0, which makes seq->edb_arr[-1] reachable arithmetic.
asd_invalidate_edb() at the end of the function uses the same value
again.

Apply the same check as the preceding patch and return res, which is
TMF_RESP_FUNC_FAILED at that point, the way the lookup failure above it
already does.

The caveats are the ones on that patch: the sequencer is firmware loaded
with request_firmware() and nothing in the tree describes what it may put
in this field, so this is not a claim of a reachable out-of-bounds
access, and a response dropped here leaves its ESCB uninvalidated and
unreposted.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_tmf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index 28ac92b041fe3..1ee6009d83051 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -282,6 +282,12 @@ static int asd_get_tmf_resp_tasklet(struct asd_ascb *ascb,
 		return res;
 	}
 
+	if (edb_id < 0 || edb_id >= ASD_EDBS_PER_SCB) {
+		ASD_DPRINTK("edb_id is %d! resp_sb->flags is 0x%x\n",
+			    edb_id, resp_sb->flags);
+		return res;
+	}
+
 	edb = asd_ha->seq.edb_arr[edb_id + escb->edb_index];
 	ascb->tag = *(__be16 *)(edb->vaddr+4);
 	fh = edb->vaddr + 16;
-- 
2.43.0

