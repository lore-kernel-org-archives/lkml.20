Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8103E42586E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383851; cv=none; b=E+sB1vZBrO269OVNaOiGXs43JvvkMxpN2bH3GuwNU5f5dGqyAqRGT6HEIc6U3nVPaOnf7eD3O3fAPJZGicbNOd8jkls3QjhX9iOEZjP1I5l7ALOyVX+s+6wCEYhBpxSwn6Ss+1+o40hl2oZuFCaIhpxDalzGmmVPwYyvNMWIcA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383851; c=relaxed/simple;
	bh=whC7gmL15K1cWGuFXFgyqJ4Ch9Jx/fU22cEMTN48nyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ck5rWfj12MnXEG9xdQU89Wxue9Ct+liJg2yQm7A0yOhG3cxuGlScaz/PX4Ayn6PeEr/lJ1LCJbXr59X+XsXMKIkPsD035kmnAXw+KM+VpcxdxJVObbhpcoTmCpzQY62z4sSkUIgwmSROdAbNXkfx1ZcTbfBeWwr7ZDG7rQ2z4aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSVoDILe; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSVoDILe"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso1758092a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791383842; x=1791988642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LAcWUItTSrXRQ4sGStgckVn+Q0TtyeUBlb321VM6ps=;
        b=DSVoDILeE3RN1NH/0jLu48e4mF2Onq1/9Cn0O8c0ZEZbm1+azgVkKj4R7FXKMJSjZ7
         UcLSFy8tXddEe9C43St9Hd2Js4ZaEaUBVDepD1oRLdGbNVgdQB/WDB2ua+j+pQ7XDUHn
         F91U89uxKy03K/Ac+ks8TeNQ+2Ee8ZmKZHhmmIGBiN7zW3teEku1ihN2DZpHmZ1ZS+MA
         d0vCguoZIR9WTfZ0wrCnN1M49y0bCKo94u34E0vuvZoo/I5wYBwxpj++Pj48WfjiXhQf
         HJmllEBlJ1cUla2MKK6CQbk+0wxZhha1fc6g3dCerBWT2R8HbiAFIv1kiyTgasFA+FgZ
         jcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383842; x=1791988642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LAcWUItTSrXRQ4sGStgckVn+Q0TtyeUBlb321VM6ps=;
        b=mul0KLGwTH0o/10I2qVQkMermq7rSiy3u3NJLTtoqlsoz5HGBJixExjcjzYYmc4wg8
         O+1MagNRa3EKn0PJ2E+Q8jA+wwrM8CFgiXykfTy2sBddtLVhCMT9hnWsXaFixdKzA4A6
         ZaHDCtyJYgTFLcLXcDTUpcEBa4L8I5fY8azYuPHRpM/x+tIhu3wVRaAcnfVoJwDib0pc
         VBrJ0kAi8sAhPCUgX7ezJI+3OR3qxqk6w6pCT1p9JbCY2EjhDkqerrdQc91dLzKWPXi6
         2XjIPmIwMRNIInHnLbrCZFUXTiLNXfgXO1orDUPTtTBU4+D7UL0sH2mvxXJiqkOcWRov
         C8Sw==
X-Forwarded-Encrypted: i=1; AKwUvByI+SojMFsX0KTR7+93Ij8EyvWTvw6jY2DE6/dVG/zMC91CZtq/3Cx+AnKAPCGXBxs6RpkF6/3Ox97T6HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9oMFEzuv+T+sKj22IXNjdUNaL4TuSlofA+Dbxw+mVu2Mg0gqs
	3uo9qGkXco8QrerNHFVwTjE/HDPSDEis+G1/olPN8k8lLZ0ZfLdq0KOS3mCGvfuA
X-Gm-Gg: AYBFou025cVnePV78+uTpU5/IWJFogW/1RpwsOPFUNR82NBdg6wwPE3FUugYHFVpQSn
	9Z0tUxKnQiZ118Tf8Ml4PGWwf+Ts5aQcU+Ku/HvsnYvKkzgcnInqeOqKTBXiFw4VsMwTZeCoTlG
	ottQIJPEppPv4CWGKmdk5JMoufBsTN8irH2UGgiZ7reyfZ2HT2h6CI0Xhr/5RoB+ZJ15NNI2OBU
	oNUcDZT1Bw4enxm/ZPq4n6sUMygnz5ezygP+xJjHXPG3vIS1Gsk3lGjeK0CUrfgBB2Jn5/YwxRd
	Z5R+N8lsdXL+XH1GNKbuhZg7/01b+BLSXY2KZHEYWdO6fASW00Z6Gz0yI1nMO0XXQenPPVCnbWd
	2qm9l8SR6n0DwnaipUSeCTqo+ddm27BlhqaAm3h1z3CdZXuBmIIveVJX4a0L1h+NE4fK74lRuEq
	2BUTg1PP4kXg4pcakFls6C2HGwZVPPhv3Tsd+YKBoI6fT4q1aaeoZLoyJtkf3KEwK29N5slSsUp
	L3TfBgllqrIMa8=
X-Received: by 2002:a17:90b:4cd0:b0:3a4:7938:844d with SMTP id 98e67ed59e1d1-3a8a1ceb3b5mr2118343a91.64.1791383841385;
        Wed, 07 Oct 2026 07:37:21 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a4b1abbfsm1712246a91.4.2026.10.07.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:37:20 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org
Cc: mturquette@baylibre.com,
	taniya.das@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	nitin.rawat@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
Date: Wed,  7 Oct 2026 23:37:16 +0900
Message-ID: <20261007143716.2161-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
configuration is lost over system suspend, and with MCQ enabled every
resume from s2idle ends in an SMMU fault and a host reset.

The UFS PHY ICE core clock already has the bit set; set it for the UFS
PHY AXI clock as well.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 Gen 5 with MCQ enabled in its DT:
the MCQ registers keep their values over s2idle, 7 of 7 resumes
without a UFS error. Kaanapali was noted as the missing one in the
Eliza thread [1].

[1] https://lore.kernel.org/all/a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com/

 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index c9473fb79ccc..6834f43b72ca 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3484,6 +3484,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
-- 
2.43.0

