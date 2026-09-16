Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676BC366060
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538678; cv=none; b=FLJMtwkxOT+t3/K4MiarmKo2kNcUM8rty0ho2rfIdYe6Vq2bab86KoEshWOzr2IXuXXLMtEJnQokNfOqMz75PTr6jjCCgMqyQPICmzlueGvmcFN15d4aD0YHQw979pTljso3V9VuJmWqhK8ASAe/gtuRNyrRCNezPheFAv/+q5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538678; c=relaxed/simple;
	bh=/wSopYesC3qMtlVXkRsTFtC77+NTlle5qs5EdeUCzCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFuKdFshIsIFpCG/mgt7B+m57CrThdRE6aN8rq/glo1UTjvh2tx2G2bsHt0jEq68vLKr+Zz2u0fDyxorQn0Z4jq31zFz456GQBhJf+NZiLnCGXcw7m55zYr1DdVXMFvhaP6pYoBdDaNlX3MOEq0YWEVlS5FwJPvaa4iYaVbmfsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3tiGrxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ep3elAUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3tiGrxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ep3elAUZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G2TmoD1605068
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfbGlQT9eaiKTQLPtuKNLi+lu4tUcZ5VPRgj41htzTA=; b=m3tiGrxKsHb38Blr
	xLt9JJnSf+SfZ6kF3b//NnfYaA2OP08d+oX1ULyXmYY503TXEZY3/Oi7v4W69x8i
	EtMqPITU/wiWw2I/wsn2tR7shpCpuUCfoQqY4U9Rfaq3kGJziadnkfxu7AFjIgoS
	dDBTx1qOVoUj59xqzK1UCJ+EmF3quRxCC5WVsAXE9IvokU7br+bucoXu6UVwY7D9
	/Ek0PKPnR7GvOnh6ELZ6mw85NfxV8KIvXK+JfwHVp0D8kufJK5b80XPz3Fm+fPkw
	ZNYatbb3/0qKW5Jhm9TEyAa95GfExkEpr/jaxSUENXRBRR0YQmY8uUf32rWy5xbe
	jsMVyw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjckrqd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:31 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bc3374cb0cso3091953eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538670; x=1790143470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfbGlQT9eaiKTQLPtuKNLi+lu4tUcZ5VPRgj41htzTA=;
        b=Ep3elAUZgBUrcMMc5RJAjGT3hTsIT30dZKwOk76JP3Jc6iITRGzf/F0l6dLftAvvAi
         q+kUlJhjubfZlMS0iOuNCjXh6NPs4B+FUTwTpsrnpJ0ydWsFI80V4FbiwoJJVdlWJ6CB
         ssWeQDyT+PfTdDo8pZUNI1RNhMaivKP98SuuPjEQd8rC0iVJxbAL/w/YxPG+WVyVrsHP
         h1CuFiMzV/KGPrN8ibVWCjzt6MMArymmBaGLoNy7v6mVJEprUs3W1G7mIPjh/nFWAt4M
         72vodjP4dzKANt+Wk5ZorzyMFV0ZVBiH8HyYdIpuYf9BDItu9Ljhes0N3OxsIJRZdjRV
         oC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538670; x=1790143470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfbGlQT9eaiKTQLPtuKNLi+lu4tUcZ5VPRgj41htzTA=;
        b=tSqt87TRtmP3JdRssDL9x3n9w49RQMG/mh1zwoCY624g5vivaS3HfRbte1rnvukgKl
         58wbl2x6T9ulcrOu+LrbWYckkMmKSKL0KzHnYeBUMzmr8jA979SPiNQMeflfv3L3kbyz
         k4LRjMROGvRGTM3/vIbVl8rhBPyDZpJg0W4WEmK7Wfi3U2vqckL+0HTyFdqjnhNC7/9M
         YT0ll3vg6aVHM4WRW/kjTE1tkLEIvRIemnBUfmg+99cb8RDFopWoOpZgIq8m6ABVMQix
         gz9e5hszuQ4oC09fAD1F0iZp2npwpICcS/t8pZxMKv4lWShCZIP02iVtZ4g8Wsa3m/k+
         WOBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9UYqXb8Qqtq/dt60diyS/GJx/GLB6bcPxC2bAMWoZmGB77713IG/6+FkBtwtD1a8Wm0KgdimeOjF8NOU=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ8JcH/a6FB++8I9ccppu3BwvgVxn3ibolILYH3KLiyf+Rdvll
	QMer0esrHMz9IZJhMm7k91HYIGj1z/HOkoqvi1sQUtiZ+dbqT5930YcLNcJvqCn7EKseiMxAQ6i
	yFODkWYIh8iA6xzBBLJ+q/4JEO/Txl+8gAmF0UeG7SVgzOTAZJj+PMucXc5rQ+4jWkd8Rgs2oL9
	1Lng==
X-Gm-Gg: AYBFou3vymAX4Tdo/uq9NTZtE41cPlH9jS6e5TAomOyR+DZ1SDjwpc2uH7Uh7OZJbMu
	AtLAT+25eRtPeiCEHWibIIHsvcjZgy4MMkz/jgERcmjTr7jv3bEOAyL0jDR9Phe2V1z7f4AGaly
	hzipnPNTwA5YS1lpc/KJPJ5EKgVvUox4PBEznW7Z7tsqt9fBcOfIIwfeOy78ZAt9/IAHZGeuK6b
	wxi7LqM2HWg07kp7/G/got42/HGQfv5SLqJT6YCQ0BPcx6VYLdfIzHAMQ96ZcuuSJQGgy6STjD6
	yFRAoaS3rUE9GH7F99Y6y74H3BK4Se50hzW8bRhIOvMIJ7KFjYi+Sh84E9eOMvwI83KgbNixTJr
	VEPEtmRv8VPecOd8ddu0reremOHWYq+aH/eNUJJptI6exzKs=
X-Received: by 2002:a05:6820:2007:b0:6b7:8396:f3c3 with SMTP id 006d021491bc7-6c7d36fca95mr1492355eaf.37.1789538670274;
        Tue, 15 Sep 2026 23:04:30 -0700 (PDT)
X-Received: by 2002:a05:6820:2007:b0:6b7:8396:f3c3 with SMTP id 006d021491bc7-6c7d36fca95mr1492324eaf.37.1789538669757;
        Tue, 15 Sep 2026 23:04:29 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm4740083eec.2.2026.09.15.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:29 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 23:04:24 -0700
Subject: [PATCH 4/4] phy: qcom-qmp-pcie: Split phy_ops into
 init/exit/reset/power_on
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-align_pcie_init_sequence_0916-v1-4-0b2195836f30@oss.qualcomm.com>
References: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
In-Reply-To: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789538665; l=9312;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=/wSopYesC3qMtlVXkRsTFtC77+NTlle5qs5EdeUCzCM=;
 b=rRhym0yddZi4OGKtctf1tWZ7gm/qQ5GFKplmWgjzH0qIek07/cqoS0jaO0sJbmupOR1gXubU3
 NgYdhKo63+MBSE0R6Q1MrMdOWUsRmdxPkJXMqrEon/TQNyymO9e2S/D
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX6irmzqob3/vt
 BdnAYf90Cd/LjYL6rQ1h5AuPstb2C64s8lx7vhhn3VuAefVKXcSN24IZhCJJruoI9Qv1jko3Gf3
 9wFEaZuIJJh+TdDpAl+na8pst1tXyAE=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa316f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6OVxYtpLaVGWezP7JUUA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: 7EOzvucbwedGjKGs9WbytEWBYVHIYjdu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX09zysnv1oh2g
 4RzOO8CEbzUTJKhBN5pxkSs+IgXn2yURxLB/375mhZ56cnT3l/40tQrTYCJ+92uk35BcMHB1p6A
 XedKIW3lWe0yFrsJuofjXIq8D/J/33R6MMWah66mLJb86sYhcbH2hEv2TyEzlyrCxkpqrR7nk+6
 f6X2GTVYGB4nJKckyUVAcPOxJJ3hKXf6SpA3ZS4iwlJ0Hv1KlH9rNQwqAMCtN6hLNgUEIbPXuXz
 2jttWRpwS2L6zrFeZq0KxPSCOBpg4yzPD2XeRs9kdgUP+B0Y1K1XU7gJsutoqXCYLkiXU7xvajI
 A9V9SKaUMPFRPTsX4XtYbGWB0/JuoZckXrqqTOshqBU/86uDiaSRD2FmapE2hnR5/U+qrhmg1VD
 JBczSZ1HKnJz1d8oZgFAOrOftVJgxlIwEN2+8vWhVG6O2NUmgcwWTPBgUNZ+BphQbJzTUC+fU3a
 dhc4r+9/3CYJ7ZmkIlQ==
X-Proofpoint-GUID: 7EOzvucbwedGjKGs9WbytEWBYVHIYjdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160076

The controller now calls phy_init() from
qcom_pcie_host_init()/qcom_pcie_enable_resources() and phy_reset()
from inside its own core reset assert/deassert, so the PHY's reset
toggles alongside the controller's core reset as HPG requires.
Making that actually happen here needs phy_ops::init and
phy_ops::reset implemented, and phy_ops::power_on adjusted to match.
Split the combined phy_ops::power_on/power_off into
phy_ops::init/exit/reset/power_on to do that.

phy_ops::init enables regulators and all clocks (pipe clock first)
and determines skip_init/skip_reset. phy_ops::reset toggles the
reset that skip_init picked. Register-table programming used to run
while the no-CSR reset was still asserted; now it runs afterwards,
in phy_ops::power_on.

Adds skip_reset to struct qmp_pcie so phy_ops::reset and
phy_ops::power_on share the value phy_ops::init determined instead
of re-reading PCS registers.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 184 ++++++++++++++-----------------
 1 file changed, 80 insertions(+), 104 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d30194c6ed17..2b6741a4120c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4058,6 +4058,7 @@ struct qmp_pcie {
 	const struct qmp_phy_cfg *cfg;
 	bool tcsr_4ln_config;
 	bool skip_init;
+	bool skip_reset;
 
 	void __iomem *serdes;
 	void __iomem *pcs;
@@ -5747,9 +5748,22 @@ static int qmp_pcie_init(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	bool skip_reset;
 	int ret;
 
+	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+	if (ret) {
+		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
+	if (ret)
+		goto err_disable_regulators;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+	if (ret)
+		goto err_disable_pipe_clks;
+
 	/*
 	 * We can skip PHY initialization if all of the following conditions
 	 * are met:
@@ -5763,59 +5777,21 @@ static int qmp_pcie_init(struct phy *phy)
 		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
 		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
 
-	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
+	qmp->skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
 							    cfg->phy_status);
 
 	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
 		dev_err(qmp->dev, "Init sequence not available\n");
-		return -ENODATA;
-	}
-
-	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
-		return ret;
-	}
-
-	/*
-	 * Toggle BCR reset for PHY that doesn't support no_csr reset or has not
-	 * been initialized.
-	 */
-	if (!qmp->skip_init) {
-		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
-		if (ret) {
-			dev_err(qmp->dev, "reset assert failed\n");
-			goto err_disable_regulators;
-		}
-	}
-
-	if (!skip_reset) {
-		ret = reset_control_assert(qmp->nocsr_reset);
-		if (ret) {
-			dev_err(qmp->dev, "no-csr reset assert failed\n");
-			goto err_assert_reset;
-		}
-
-		usleep_range(200, 300);
-	}
-
-	if (!qmp->skip_init) {
-		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
-		if (ret) {
-			dev_err(qmp->dev, "reset deassert failed\n");
-			goto err_assert_reset;
-		}
+		ret = -ENODATA;
+		goto err_disable_clks;
 	}
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
-	if (ret)
-		goto err_assert_reset;
-
 	return 0;
 
-err_assert_reset:
-	if (!qmp->skip_init)
-		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+err_disable_clks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+err_disable_pipe_clks:
+	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -5833,12 +5809,62 @@ static int qmp_pcie_exit(struct phy *phy)
 		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
 	return 0;
 }
 
+static int qmp_pcie_reset(struct phy *phy)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
+
+	if (qmp->skip_reset)
+		return 0;
+
+	if (qmp->skip_init) {
+		ret = reset_control_assert(qmp->nocsr_reset);
+		if (ret) {
+			dev_err(qmp->dev, "no-csr reset assert failed\n");
+			return ret;
+		}
+
+		usleep_range(200, 300);
+
+		ret = reset_control_deassert(qmp->nocsr_reset);
+		if (ret) {
+			dev_err(qmp->dev, "no-csr reset deassert failed\n");
+			return ret;
+		}
+
+		return 0;
+	}
+
+	/*
+	 * Toggle BCR reset for PHY that doesn't support no_csr reset or has not
+	 * been initialized.
+	 */
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset assert failed\n");
+		return ret;
+	}
+
+	usleep_range(200, 300);
+
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset deassert failed\n");
+		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int qmp_pcie_power_on(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
@@ -5847,17 +5873,14 @@ static int qmp_pcie_power_on(struct phy *phy)
 	void __iomem *pcs = qmp->pcs;
 	void __iomem *status;
 	unsigned int mask, val;
-	bool skip_reset;
 	int ret;
 
-	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
-							    cfg->phy_status);
 	/*
 	 * Write CSR register for PHY that doesn't support no_csr reset or has not
 	 * been initialized.
 	 */
 	if (qmp->skip_init)
-		goto skip_tbls_init;
+		goto skip_serdes_start;
 
 	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			cfg->pwrdn_ctrl);
@@ -5870,22 +5893,6 @@ static int qmp_pcie_power_on(struct phy *phy)
 	qmp_pcie_init_registers(qmp, &cfg->tbls);
 	qmp_pcie_init_registers(qmp, mode_tbls);
 
-skip_tbls_init:
-	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
-	if (ret)
-		return ret;
-
-	if (!skip_reset) {
-		ret = reset_control_deassert(qmp->nocsr_reset);
-		if (ret) {
-			dev_err(qmp->dev, "no-csr reset deassert failed\n");
-			goto err_disable_pipe_clk;
-		}
-	}
-
-	if (qmp->skip_init)
-		goto skip_serdes_start;
-
 	/* Pull PHY out of reset state */
 	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
@@ -5902,15 +5909,10 @@ static int qmp_pcie_power_on(struct phy *phy)
 				 PHY_INIT_COMPLETE_TIMEOUT);
 	if (ret) {
 		dev_err(qmp->dev, "phy initialization timed-out\n");
-		goto err_disable_pipe_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_disable_pipe_clk:
-	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
-
-	return ret;
 }
 
 static int qmp_pcie_power_off(struct phy *phy)
@@ -5918,8 +5920,6 @@ static int qmp_pcie_power_off(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
-
 	/*
 	 * While powering off the PHY, only qmp->nocsr_reset needs to be checked. In
 	 * this way, no matter whether the PHY settings were initially programmed by
@@ -5927,7 +5927,7 @@ static int qmp_pcie_power_off(struct phy *phy)
 	 * next time.
 	 */
 	if (qmp->nocsr_reset)
-		goto skip_phy_deinit;
+		return 0;
 
 	/* PHY reset */
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
@@ -5940,36 +5940,9 @@ static int qmp_pcie_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			cfg->pwrdn_ctrl);
 
-skip_phy_deinit:
 	return 0;
 }
 
-static int qmp_pcie_enable(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_pcie_init(phy);
-	if (ret)
-		return ret;
-
-	ret = qmp_pcie_power_on(phy);
-	if (ret)
-		qmp_pcie_exit(phy);
-
-	return ret;
-}
-
-static int qmp_pcie_disable(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_pcie_power_off(phy);
-	if (ret)
-		return ret;
-
-	return qmp_pcie_exit(phy);
-}
-
 static int qmp_pcie_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
@@ -5988,8 +5961,11 @@ static int qmp_pcie_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }
 
 static const struct phy_ops qmp_pcie_phy_ops = {
-	.power_on	= qmp_pcie_enable,
-	.power_off	= qmp_pcie_disable,
+	.init		= qmp_pcie_init,
+	.exit		= qmp_pcie_exit,
+	.power_on	= qmp_pcie_power_on,
+	.power_off	= qmp_pcie_power_off,
+	.reset		= qmp_pcie_reset,
 	.set_mode	= qmp_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };

-- 
2.34.1

