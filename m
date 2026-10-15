Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083E51CF5F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069134; cv=none; b=nK6q6JD6DIvaDy4yIRzDCNBjuohkKeyx9TSVPJ/e6Ui214ECfDXx2+2Gsa2MLrKdDQ8EE/eNiZALpKp61muxJdCwKVWthNXgi3vccl3qigJoQLXt/JgL/cFg7bsQ5o6Sf/TG/R6NkrbQLT+Q5AImSqeUb+kezjzJ1fTz3B3qOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069134; c=relaxed/simple;
	bh=B5rjEQXDz77PYSnOLzLQNyCWZ4XWw0tCjLYWjtT0x8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgJOengsBS4ZSrYv0d8T1b+/RsG8coetnzJ52uENmCxdhp+uZ9zwV7KJSupku714W7O1lePrF9vZ37LH4lDuCq3Rn5e84RDMlCGZwpSq3SUC1T1i9tNESCU6mu6hcGe+UNGswXEkaA/j9icIAbflAnLCxIM5mfQFMYgYqQiNrWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAeLzacW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeMtPhhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAeLzacW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeMtPhhK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kE752999154
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=; b=nAeLzacWsclf+9uJ
	wJVuDr72fkssoG4HjAYVGgBC4CpOVOyVSNVs5KvJ5KlfYN1xTknSHqK+r3nAr7tl
	TvS3P9ekuoFTxGkeIO8XKUGvBI6rnC1Yf5PAelUkKl0FybCZCdEOHBlZq2Js6C7m
	tuzMeO6QaivnsX8r4+mKDcOBGmUFia8HU8QJRLTzDN6LK7zIfOQ7E2LofOXr1K65
	1s47mxbMITGh3HuggcLln9yIoByUQWU0GbiH2uijH59PhDLK0us0YsmtQWMUgiOV
	JpJrJp3+w4j6U5EMIyH3hlT3cr2QYyImGO/juHdNcrHkhrTnpwaM8D0DoAP5kJvd
	n/Yj2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm10qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e6188d1e51so58222705ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069132; x=1792673932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=;
        b=PeMtPhhKAjqVtVT5UxVZL4PvcNryt5qauc6P3R/vmloY4ChpXa9LHyozWtRa+wi3z6
         7OTwwrtfUcUWrlteVKwdyrAiozL+KN94JxjSeOsM+QdRljDDy+PZ9zmxTqbZDzHmQyBk
         s+faUnzMjA6/URCqPIDDGqIIOZkXSoDvDZg90GIVikDLx/EUvN7r+5nWBf7mDPEohF2Q
         EX36xwRpgufoseO0vpNOoW1t3XUgFi0mMohxL/7mmalS0UEQ20HXGPri4mpJZZAs6gSt
         xLD99cYiEhUHes7e+vPVOerrT+TFTkbnrubhufEx8sGdOsqrbY4WTdXQyQb6dYuRgNaa
         nAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069132; x=1792673932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=;
        b=texr5AWYy7Dqi2modTcNIi8SEksiaa/Ph05o8saNRv+NIxMmBcJ1Ya8Goz/x1CVrwF
         rXKWXHViknGfz5AeFmD47RIMtxTvYdvV6PyT3M+Qaybf055Kiy6FZOnqzOCFi6jCBWbn
         jm4rmGgLlxL1PffuSIch+BiJ8zGN9sJsnXtfG5aGLWzqTpbiPqIyrrmjYC+NvVyfk50c
         sIKBj2f1/mkvFCN8nbxRSwcP0EwuAmpkYV94kV3jir0vlTws1LvuHsHADbKFT3lhi2Av
         N015R/ghOf+b+mK7Wdr+UEXs54N2CoaVWI/3+xwB83g2BN49bUVpMXPbFYqdQdRfbIPk
         eCwQ==
X-Forwarded-Encrypted: i=1; AKwUvByiPHTy6U/6onkCeW7oCTxxlEmHvLYMOx64ToATi9hnPI8lAZp+DOrR6pDSe2ZKvvjrVPvIuLnRx4P9aJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ7k/lA+kaWFGFx/LE0+6fxoUeP1Wh88IpDtbGeRNi7/SoF0PF
	NoLseoqQp5PFn5qGIZfoBCSZU9SAMF2iRTleU8LIHqcbBYsY/iKVpWgTHn19TNJSVWv8zYQ9RzN
	kvJKAgXGsD9UIMGaxcR/Qedu0RRj191VeCPrsA98JMSLH/NrMPRx3+IBgyOj4QhfOASk=
X-Gm-Gg: AYBFou0HYENSeG0L1tPKA98hkqfvDQJH2QB1ZYk1emS/caMLQ5Ov3b0mX8xzj1eeb0q
	/RqN3eP/7M3Z3PDBxFipl1ivQbftG99p+pY9iQUNU6u4fZsvc4ARIVENaoiFeOGxjeg5U/mNALa
	yLmu79oiyx2K+GWM0OLiDTLhjmO1LQk+kpMqXVxFLn0c06k60L3enSwboK1bBbmb3ItUyZGcki3
	8Vj+kmqMBKacACyUhyb5bqsZEOlFxjsEMV09cezv+yG1v/warS1n+8CSZTl2b0TAI/H14F1HeFv
	0mk7uKszzXKiPwnX0QCwrqWG5jzdmjuOj0GUT4d+NccwHXWi7W4RIWLOAj6nTs4FQxWtJp8g/YC
	6BdOhFTGBO2a3ppDW2TYvnMdfnPeR4Z7+tA==
X-Received: by 2002:a17:903:2449:b0:2e6:913:57ed with SMTP id d9443c01a7336-2e8429a83cdmr169905215ad.14.1792069131924;
        Thu, 15 Oct 2026 05:58:51 -0700 (PDT)
X-Received: by 2002:a17:903:2449:b0:2e6:913:57ed with SMTP id d9443c01a7336-2e8429a83cdmr169904715ad.14.1792069131268;
        Thu, 15 Oct 2026 05:58:51 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:50 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:22 +0530
Subject: [PATCH v3 2/8] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-2-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=2852;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=B5rjEQXDz77PYSnOLzLQNyCWZ4XWw0tCjLYWjtT0x8s=;
 b=U2QFjtpzZGOlYt9TZaHvmdhUmvcBoKPpx74C8L3IBU4co+eXkRokP7yEBGDCksyBHnGMVIh4g
 xchAoYT0tttD0LTVyo/JTwAd36IwQnCvFnD+TOWtDEZIQFG232sHKKr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: vEKOp6uzdtJaU_OzaijZisWeFZoMkOyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX+SSEhOGGR6rk
 tNqbexhH1x7ptFPhMXMzbfKTThzEwrkO7IvNPMiwsvPCfx7pFKenaHFmzg+jcoot/ME/EgnQcu8
 O9x0IQXWHD91IV9KsxLwC+fQZybQpIlxYxEEABmDUrw2AcTNuJOv00iGjjBwjiOpStHbMXWp5qp
 am3yyaC27habbhqaq62TazORslngWlmn5v1FE/+s/JvgXrpz91E/IUihlVlaEtWZaxcgnhkAkbW
 acDYINzQlNIneRhA9mWLVoSQwN3bD3uBmeW+Dk7Iy9UDEIT2MjuG6eVpsRqwmiWUVJdWM5azIoi
 WF2ZcgV/yOw0F4OAQ+uycxZw+bkcVCf3StidOWRjIWWVJmkEY06j6/Sh7RTvM6Yf+YuZkMlluOW
 cdMnHWsH9/sm7NWmymp/TJ6aQ/PGvgHPRqjqGpQuzTo1c662JrhahMLPJXpKEBQS6xfyxgrLmKP
 D6tv+qIaTpMr8j80QfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX4ov42jV94Esm
 8oq8eTQ46la3VSFwiYis4T2bDKjl5QUnR8udYoc8zM+B4rm1i5a+EaRhAU51q54q3m/gPoXpu8m
 PLluGbGPDy9+6oi0GzdGfGR8fXOEk8Q=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0ce0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=590DCAjQX6RtSPayVpcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vEKOp6uzdtJaU_OzaijZisWeFZoMkOyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051

GENI protocol drivers need a common way to scale the SE source clock
through the OPP framework. However, the device that owns the OPP table
differs depending on how the SE resources are managed. For Linux clock
managed platforms, the OPP table is associated with the SE device,
whereas on firmware-managed platforms it is associated with the
performance power-domain device. This requires protocol drivers to be
aware of the underlying resource management model when requesting
frequency changes.

Introduce geni_se_set_rate(), a common helper that abstracts this
difference and applies the requested frequency through the appropriate
device. The helper automatically selects the performance-domain device
when power domains are attached and falls back to the SE device
otherwise.

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 95eeb9438a29..97905bd6d363 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1153,6 +1153,28 @@ int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
 }
 EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
 
+/**
+ * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
+ * @se: Pointer to the struct geni_se instance.
+ * @freq: The source clock frequency to set.
+ *
+ * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
+ * perf domain device when the SE has power domains attached (firmware
+ * managed path), or se->dev otherwise (Linux clock managed path).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_rate(struct geni_se *se, unsigned long freq)
+{
+	struct device *perf_dev = se->dev;
+
+	if (se->pd_list)
+		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	return dev_pm_opp_set_rate(perf_dev, freq);
+}
+EXPORT_SYMBOL_GPL(geni_se_set_rate);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index b3372a3147a0..8c3c5b68151b 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -597,5 +597,7 @@ int geni_se_domain_attach(struct geni_se *se);
 int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
 
 int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
+
+int geni_se_set_rate(struct geni_se *se, unsigned long freq);
 #endif
 #endif

-- 
2.34.1

