Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459104457A3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194908; cv=none; b=lcA2p9wGgCdd+Lkt1vCAwjQT9psTKpUDQ4bOGAcJuvvXdoGCLMU29IRRXjr/RyhO/88feZPBwxaMHLHon3WLpE7yPeGuPBAJJMllCNoLnNR/kHxN6b5xNFZnZAp0H4AoEu8cu+SVkDPmY/z02BwUpsJLr0aHk1QdDWjDSaiW7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194908; c=relaxed/simple;
	bh=+KBYF75J66rNJuehf1zpGVZaozegQBHZso6yi8zHo5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ch+9+AbrVDADskwxWKBC7wOlWsLvrwFQvZB+42ShAH9+kYMvn2yH6iXqTcR2OzPz+URzkSJmusAkU1NGZaf1kHqKXOUQltcnDwsthgXD539pOukCWzcjsRBTZTmOu4N21Iny+zs2PQ+o82AvSjXLaig46flhC58NjpWc/qbLLms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6tCCfI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i44wQogA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6tCCfI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i44wQogA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFGFf3083039
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qedLgstS3gt
	vnc8k0/THvcA4SPaoe9apJzndlL1Fd8Q=; b=R6tCCfI6INMnbSklELJE70qfOPY
	/4ANoeEhAN3uBss9uTpg+DlG+NJTzVxxDWNuI4YiFLNnp/I7w0mGyhea4X5BNIeO
	rJZNLpJ/308HpITn8wBST7eR1BrRSUlPp754rxeiSISho0JTl7osN7tdex8V1Eo9
	46tVMA3akcgNXfJJp7Cxxzpobnuz8Y2fdWp2rOXfNDJMeXRyamyNQLlyM9Ph2yy4
	0pWCHtLF2zXBWQwTvwy/x46vG9baoCeAOd2n/m+ei2D8hGLvls3JwRFvLuVRHYZB
	Yy0usMJqiyqQlWHnI2NYfeWxKdjX9EyGRYU+vghikxVANiTQWjcrJCLflAw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmfamxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so1455324c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194906; x=1792799706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qedLgstS3gtvnc8k0/THvcA4SPaoe9apJzndlL1Fd8Q=;
        b=i44wQogA4NVQx+sBMrJDKk92hNM6ecP0ULfePTKrlfPB3J+/S8wHFTy095/KTP0t6w
         HcjqCGeQJyPToEJ9P3abSOaWGvAZesT3+zrbt7RR+zyHtZWNGlbw1vLGrDVbaVwPk9qL
         8LU5+YfOG+uM1i9oO27Cr0TqOQvARwrheDadq3A3O/pIcxgSmWSsJjvvV1L7R4DlCX/P
         RjWrDZmmvyAaLs8HikeW0WPXyYcPBSQvfXA4gvggj3TU6gWV1kREYywzvrrmfJefqAjS
         OcWQylD17xpAl1xox/B8dG0/g/Vv6pGCFDOWRjZ9Tv0J2vFCaI8yoYR/kwpNqmmqky9J
         0+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194906; x=1792799706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qedLgstS3gtvnc8k0/THvcA4SPaoe9apJzndlL1Fd8Q=;
        b=dYF1LdDNkI0DOWruC9iLUMMEFr0yvA6Y7454ucX6sR5XzmfbY7+Z8BK5/l7557quUZ
         8GONCgxQK8+wUQ43kwNJGXS1J4S75ymLqV0hxIqJRUuApymNwftHcsjJAGcOBylne9Bq
         142MVSlW2o26hOwKGWx2CXou1H92rouYKkVwVykpXgKQ6m8PvYmeKKdFj62FCKVdzYS9
         t5XMlJvGiQxpw7iMo4w5pjgAPTSFeExRdBActVK58qe+IFpfCB6FW3KXu84w5ZXAcA2Q
         GZcs12Q4X5UvSuE469cMHKs+zT8F7bOk40L28Mv0s2mlL926vqM9lkZfM+e6ochnRPQi
         EgtA==
X-Forwarded-Encrypted: i=1; AKwUvBxsdt42W/kA4M0lbSRjRs73wRg828fpF8BDMACX8zm3AG41SQEFTCKeJUM28g2wlxDqTcwGoKIP4QfrOqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzIsvdBwp+smrVvrMISm6oIMWniMZeZg1VgGTohxHM5STWnA7G
	c1CNDXCp43gZcm4x0CAOC2KRQfeOQcHN9WpdovRMh52FuI7IG/+BiUcT75Pd6NZ48vCmZqqou3O
	ogUE9OiNCRIRtFE2lITdoSDq/Xs+L3VfeLZ9i0SgP+sEzpAE3IFvcMpJY9JTxU86QdGiLdiIyat
	w=
X-Gm-Gg: AYBFou0dIC4KvjG869zir9S7C4EZyinEb9fwdDsx2nxFFpBElwQIwSpUc++xrgnrbNM
	zX6Ai+lfmD20VoNlc8aL6VSMQnuARImd21VB8tNUG8Ak3sCz8GlKCWXa+ek5NNjAhf3rOkYvr0+
	vKMIAGcJWTj3Uz6YzOxR8YhvMvHpNZ2jNIP3WDkpcHrq1qDa5zg4EQcxVHLDNi1ga4K87iF7PGh
	aWAB5VHtrxdPXG3PM1XN/oGSkdzR5AQc2YMZeq8vQJnaTtLthWjdL9XSE84WhzhSEEW+3TaFgvN
	qSjaBWlK2H/G3d/eEQg3Ncj7wJgxDg797Sp4ABZ8dGDkXFbLvgNQR9Rdtvf6/rUZPAPgSktE2gB
	QI4kqYWjJ5zXuDnjdLCGSeCiKmOW8y4ao6R3+tN/QnVdrFwHgZpijHQ==
X-Received: by 2002:a05:701b:208e:b0:168:6ad8:e8b0 with SMTP id a92af1059eb24-185120a831bmr1673768c88.14.1792194905557;
        Fri, 16 Oct 2026 16:55:05 -0700 (PDT)
X-Received: by 2002:a05:701b:208e:b0:168:6ad8:e8b0 with SMTP id a92af1059eb24-185120a831bmr1673738c88.14.1792194904917;
        Fri, 16 Oct 2026 16:55:04 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:04 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] phy: qcom-mipi-csi2: fix -EEXIST probe failure on single power-domain SoCs
Date: Fri, 16 Oct 2026 16:54:56 -0700
Message-Id: <20261016235502.2274268-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t1BJeXY10IGag5WIOAYQeseIYCKHyM6o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX0/Xcjgn7i8a/
 cDmxsVlJFbloA61Dt2DwjhHZbDb09FQL9lDqtJMH5al+Js1AcAz6bcbHfTMxaYr+M8SWd14+ot2
 A29K8nc/QeBmoRjrCbUS860SBi2kMV0=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad2b95a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=uorg23y0nfgcnAkg4s0A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: t1BJeXY10IGag5WIOAYQeseIYCKHyM6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfXyuOnynppaRKy
 EN1aZeAipcqRhxCYk0PdZBIc5273Tn6BUHG+GWFV4kmik6E4adO626YVRs6nunsiP+VxqF932p8
 LeWUfuHXZfVN5MXd9J6R0XEq/B1QcMGSMhmVTGNLcyhny+mGOR91RBH6jSrnxZCxTARKrwxmKC1
 bkChQlawSDt//joGTtZ+5KH1zSKsPtaOIbb8FmRwhoJGv3yR56J0WDjZgTZL1XP7durnXsrMYQ8
 iROgzUcWo3hIFLrxhKhS77QdTyp6CP2RPMxEe+aKqisKZEZd3cvuQt12HzAtNrK84aE7TgBQuN1
 3musrQwQjDapWIEvhaQr2B60h4vZzoe1NpFuFxWKAEkE0Igsv8pbY7NCUZVkpLluQ4SFjGLWfZd
 2GHaRc5BXAe1zwXNUPWyKO6pejYHA38KP+uPtzj5N77n5TTPkGXtf0h6/G9woDA6SYw6/rnEVgr
 47BFv2xPTTLzqKph1kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160095

sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
on the CSI2 PHY node. For a device with a single power-domain phandle,
the generic platform-bus code (platform_probe() ->
dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
unconditionally calls devm_pm_domain_attach_list(), which fails with
-EEXIST because dev->pm_domain is already set, and the driver treats
that as fatal:

  qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
  power-domain list
  qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
  failed with error -17

x1e80100 is unaffected: it lists three power-domains, so the generic
code does not auto-attach any of them (auto-attach only applies to
single-power-domain devices); the driver's explicit attach is the
only one that runs.

For the single power-domain case, call dev_pm_domain_attach() instead
of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
is already set, so csi2phy->pd_list is left NULL rather than built up
by hand. The three call sites that walk pd_list for genpd
performance-state scaling now guard against a NULL pd_list, which is
harmless since scaling is unused (scaled = false) on every SoC that has
a single "top" domain.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..00285be9dd64 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	}
 
 	pstate = 0;
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		unsigned int perf;
 
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
@@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
 unset_rate:
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
 
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -233,6 +233,19 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 	const char **pd_names;
 	int i;
 
+	/*
+	 * A device with a single power-domain entry in the devicetree is
+	 * already attached by the generic platform-bus code before probe()
+	 * runs (genpd_dev_pm_attach()), so calling devm_pm_domain_attach_list()
+	 * here would fail with -EEXIST. dev_pm_domain_attach() returns early
+	 * in that case (dev->pm_domain already set) instead of leaving
+	 * csi2phy->pd_list unset; this is fine since pd_list is only used for
+	 * performance-state scaling, which is unused ("scaled = false") on
+	 * every SoC that has a single "top" power-domain.
+	 */
+	if (csi2phy->soc_cfg->num_genpds == 1)
+		return dev_pm_domain_attach(csi2phy->dev, 0);
+
 	pd_names = devm_kzalloc(csi2phy->dev,
 				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
 				GFP_KERNEL);
@@ -369,11 +382,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
-	if (ret < 0 || csi2phy->pd_list == NULL) {
-		if (ret == 0)
-			ret = -ENODEV;
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
-	}
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
-- 
2.34.1

