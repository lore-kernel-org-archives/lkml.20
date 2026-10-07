Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C144C4F2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376803; cv=none; b=jxgwWWwPVSLbvnT+6eqFOFekXq04dXLcU8DHEdVJkCw29JgXMbFn+SoRSk2fk2t0bK7/gKn7Za7Yz2I7G4/UNIqg0SYs2aTD62C/53rbm2ik10Aaiom83ndreol2LOp+u5Z1Jat0tj4d4VIH1oWQ86nBuzsbmjklMSYO8oakEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376803; c=relaxed/simple;
	bh=f1QPQMmCEelKhv5EyxV/k3MVaSi11TvWPJBnLsxaEKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Imu5NTAWT+Z41w+88BokQ96hqRuZdwUvIKWLtM1XeSDlFaeDLcHXlIpSzaqewK/3Qp/S1+dei+oL5RptLTwWPX+4Vw2Jrliza/AzdNmPlvsfRXxOCfPROKr/SuW5dxIP4+WmvQaYqwziYpat0cwLJTP4sz/PSws9nVdakM8hICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiUCCY9G; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiUCCY9G"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c9879395so906478a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376794; x=1791981594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stbPCEVKk5/43mdbhizGdpTlS+biXo1nBfE8ir7ZWR8=;
        b=EiUCCY9Gp8O8xmWkPfUNRbNOaTl9mUK3y7cZSARDKU9wkmOsL7npc81T849XBC/qyR
         R7s4re/SufA3OWTDWLqYzGMRcem9NDyc5yuXmXPEuIvFZlJwx6VitEVyM4VJf16XTTFs
         g5lygdZhiyBX1H5G6mRPcuGrIaTxgZuEyaS7FRLo7bM2+gk3LIg/e3e0SLDXtU+qOBGY
         7qYi1nD9r8j8FLyruflv1Oa8C1DZaY80er6nA6LzswCOAUCjFILc59oLhKxBrOSrFr//
         RbZjGhnnjghIQtu3YuFHbuppbMHIZonrhhDu5xENXhMjtPtN7Tne+uFX8PA/VpA9SzLd
         GMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376794; x=1791981594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stbPCEVKk5/43mdbhizGdpTlS+biXo1nBfE8ir7ZWR8=;
        b=Smby0dHZf1xO+LH0IrYFEDNn4PbTzWM+7UDFoCiBuk3mNcAN9V1oIIjwdcLDNEhMc+
         bHMuGa02vlowYVCVaD7Xtj4/b4slYfq4mtc7mB7K9bk0+H2eAvAjSn/T5NxCYf62JLu/
         ytQvaL9Y4+a+MjL8R9bOigKryQrtmfWnEMreX9xNj5cre4HeEp9OvQZ9O08zBPLLXxYO
         973b0xUoNoQL8PAL2PHSedz9bdICNL1PvnKycDX/n/WH4PZHPVKsY9pHKbF0+wiEB2ha
         j549b2MSfchu9uAW4OV2vEeN5CvWtDZFWWbwldFkXwYTj8IxfYqCfGWU/1Z1OngJGZsm
         /nAw==
X-Forwarded-Encrypted: i=1; AKwUvByNibRqUua8s6CnpQ8M2QtyGBSisRLaRqki7wmM4SCpoxY7iyPGtSWvICuR1PsXda8/cKvjjRdLSzXYNus=@vger.kernel.org
X-Gm-Message-State: AFq9FYINbSPhybn37uHZ27YOqi3HZ5wYNKkT+SEfC5NDq/p2BvlX8BTR
	eP2rV5vZ9/B4cwG7Y6xE5aGCTlAWGQqV4AXlo5o65CSMdJzDB+lngXCO
X-Gm-Gg: AYBFou3OuYkgFOQ67LgrxByQn85dj0lxFVV6f11jnZudt7YFHkaQ15WOCTTAtjmTvOm
	Ztjw/ycMRppFxqKds9SYPJCyqhdmHgYDJVMtjcfXOIDAkyqBi7qWw2JcN8QZkNo/caGGuxx2RAL
	030Fy4iylkR9pievUl3qYlADQ8rQCbds+MN4csyKr426/GjQhTp8HJwpdR/mbXuUKDJ+V/9meY0
	Q7pvYtbl65SfAcu4coFzcapxMOA6N4ndYijuFkSjEGSxC5W091ajdfsnwpqyotHwvC2EJ/LGA7k
	gv2SJFmIfV2a6FpfKP9SLaVuhQCDtn90oninoZdY9m7PsBW354xx5eQwtNNxQLzOH5NNLU28ojx
	4R776JBimJoqKJrklKDRgZHNt0HEqrOiLIoW79o6kN0dk774dzyACZ7aX6XB9BlFtsGHn0D+UEh
	nswAn5DiwFDAHOb8leAqB6m+9OPHu+B200N5Z1kch4+blE/Y7uCk+UE0NUNw2k4kySv9saVStJY
	lit9h51HnWna9E=
X-Received: by 2002:a17:90a:da84:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3a8a1c84418mr1597807a91.63.1791376793729;
        Wed, 07 Oct 2026 05:39:53 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8c46a2f9bsm650899a91.2.2026.10.07.05.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:39:53 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	yongxing.mou@oss.qualcomm.com,
	yuanjie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: add the SSPP rec0/rec1 blocks to the snapshot
Date: Wed,  7 Oct 2026 21:39:45 +0900
Message-ID: <20261007123945.1694-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On DPU 13 the SSPP block is only 0x84 long and the fetch registers
(source address, size, format, multirect) live in the rec0/rec1
sub-blocks at 0x1000 and 0x3000. The snapshot dumps the SSPP block and
its scaler and CSC sub-blocks, but not rec0/rec1, so the plane fetch
state is missing from the devcoredump and from debugfs dri/N/kms.

Add the rec0/rec1 sub-blocks to the snapshot.

Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850).

Fixes: 688c7734002a ("drm/msm/dpu: Add Kaanapali SSPP sub-block support")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..dba8a07d34bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1006,6 +1006,20 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 						    base + cat->sspp[i].sblk->csc_blk.base,
 						    "%s_%s", cat->sspp[i].name,
 						    cat->sspp[i].sblk->csc_blk.name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->sspp_rec0_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state,
+						    cat->sspp[i].sblk->sspp_rec0_blk.len,
+						    base + cat->sspp[i].sblk->sspp_rec0_blk.base,
+						    "%s_%s", cat->sspp[i].name,
+						    cat->sspp[i].sblk->sspp_rec0_blk.name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->sspp_rec1_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state,
+						    cat->sspp[i].sblk->sspp_rec1_blk.len,
+						    base + cat->sspp[i].sblk->sspp_rec1_blk.base,
+						    "%s_%s", cat->sspp[i].name,
+						    cat->sspp[i].sblk->sspp_rec1_blk.name);
 	}
 
 	/* dump LM sub-blocks HW regs info */

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

