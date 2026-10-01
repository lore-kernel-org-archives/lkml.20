Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F2B4E0B79
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847353; cv=none; b=AZmXlqk2J6JESDE+61/AhrbtH7ov2wvmMCkQSXE+2CnhRHc8VjPwkr1UPpAVbB+SqwAV2i4/s90e5GroYejjiCd+MzcwYz6jCaNtsZWT0zNB/Dlp9mBSn3W8OdfibvfzHboWnFRAekhrVQ7wGAdEu3EqLjvTo4wfFu8SKCOwQRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847353; c=relaxed/simple;
	bh=2x5l8hdDQlwJXCS/Eggz+xDDnpbTH4eIJ5E+6/vN3gM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qK35rCEDfbpQ4KAnDQyD43JRP1StFSRzp8XX4S3jcyNqTgHVVGrWE5Thb4UaZXUlaPW0h8prJc45joXdGoMTRVLrzDNKBw4tIgh2TXXtcqRzjRI1BAKMfGKzBrVygYgUgfih4dRShZ9F6VeWhxrjTct1++wcHfhQzJ1KSILVSw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXkhuXOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2J8kLRM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXkhuXOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2J8kLRM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xRwA1289124
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITC2AOyoiZTQDo8TbhKy42Jf/j6c3ShiqBjBF20yDLA=; b=TXkhuXOioTnrE2vU
	zSkIhqYru766pZoTlf7D8UFEfXWrRwf3nN3q770LpArGpmfyeG6LiXGkR9g1nRq1
	KEK1RYL7f2mpXnQbJSUt06kGLuktEf4BoBp5s2C0tkpljXgP6XlBytlAW917h7y6
	E0Ysfv3rCRgwrwEC0fyFHfzK797Pb5VeS2T/F5FAodgZS2AzWmCtoDgyrYt4Tg+o
	Tr7RKuyMsKxpFpQ7bGJO+A0w178O+/Uu4tij9Dal0Ya+yj6nHhRjHtOItPlqumxJ
	DaiXLFzgHNcoTJLgxrhseTo8Ysz704pjhMpzvY1KGCnOJSqU0xbNY3rt8LP/12nB
	XYqvMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjb4ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7535782a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847350; x=1791452150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITC2AOyoiZTQDo8TbhKy42Jf/j6c3ShiqBjBF20yDLA=;
        b=e2J8kLRMNthGsjhLW/KPUDXXryrKC5rHUXTBR+bCkLuZjrsHrvwpt/nHA9JLGXWZ2X
         ClzIw4A2Uip8lGauLHI+O5fYOllzB4F1P3bQO9pvr/IortmSnPl/ETh/u4rpAzUEpMzE
         Vypp7gx0h+sOEwpdN7hDQl2WMLp+M0DJERhNN/Pr7+uzHYvnzJdtEiTZs4Pt38MnWGit
         yfJEK1C5wyVFVVU6fx1mNjnHdFeYpgpnw2b8YteSZ3X1QEgspELC8KB+qjo75Tsov6pM
         edMwYYQ08a1PLbup2uk18yTj0TT1vlrvNKyvlpa4/29QkKpne11XnBZjrILwsY6UEp2L
         ckVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847350; x=1791452150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITC2AOyoiZTQDo8TbhKy42Jf/j6c3ShiqBjBF20yDLA=;
        b=sPus1nYQeTPUcTQfAUwzSVuIypNvvKAbT6JO5P6tqU/vhb/u2Hi2YNcfVraG2UxqpO
         TKuE8ElLL9PbtNmBE4Fivooc2490eFE5VCKEfEMm+1ErUdik9WsFI1an6m/UrFsEd06o
         sjC7/KpA2JNyQ0IwGh4CeVE/h4Hb3CvmjU2Q8celTtYMeFxGw+AwC8AIN3fBhWBdf5mn
         sovONPxpK9EhoJMgenknBLAkLfTPRwPtO/CMO3Lo2fYQEDReI6CaLfCCLT/haTTmRX1r
         WZFUUAqvanGluFLJlCiWu6jj//ojIr2a4lEQwj+nm5CMHbFBHsc5DF2eu3bP/OC76KZq
         goaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkurOSr04qVk33kzYiK0Fencib0w8HveBmqiyQ298doM37wWiL/b+x8t2ng8MCzJhNoOwTJOlFB7AsZ0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYICWgNUYbYuX9SC0ubWyonvpD0WfNSSvN75eP8zGA9QnMaPB5er
	KmH7l5d1BlNxpLMG4Ot/LzvM9GoMXleYWv5m4nie9HFQZOTpwRL0+4wa3/ssip4zeR6RnwuIST1
	O+B+6nVi6QvMr/CEXZa8fT6zfSNQeG2x0pQFbGwhBftpuJMavTG0FgWcASAAlTlECDNU=
X-Gm-Gg: AYBFou1C+Yjww2jIBDD3SQZk0L5mvbU4mhD45An9XvfXbfAcUvYf1BdKLQTXAyf8alt
	Qm54St8UGzcyYD7CwFbjbua9q+aX8PyvcfmRqxUg60Bp03qhki53QSXkCT+Bk75YpZXCHdzxi+K
	+J7r85EIDTPlOEso0cLpBI/9CE7YLeScZGJhyt/Wn/N4KqH75TeDHO5TZO1Q0YTaN5YRdVZzOtZ
	vvsEELAtcOz9J2BbmoaRAv12SLDhlmkfakycc7CmQl1IRTnxcTwlZcsBofxRlah8cyPL0hiWnUX
	dN9IHolO8QqmEAhL5OphFF07CePcR05GEeUJSHheerMjraWQ4Xcbh7MSfNVXkfw4P3tTdeWsfQK
	+0bOiSmbYPYSdVE4bRRhsDcufMsU=
X-Received: by 2002:a17:90b:37cb:b0:3a4:c18c:b893 with SMTP id 98e67ed59e1d1-3a4d1964c71mr3348486a91.61.1790847349912;
        Thu, 01 Oct 2026 02:35:49 -0700 (PDT)
X-Received: by 2002:a17:90b:37cb:b0:3a4:c18c:b893 with SMTP id 98e67ed59e1d1-3a4d1964c71mr3348457a91.61.1790847349382;
        Thu, 01 Oct 2026 02:35:49 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:49 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:28 +0530
Subject: [PATCH v5 11/11] phy: qualcomm: qmp-combo: Fix error propagation
 in qmp_combo_dp_power_on()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=1638;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=2x5l8hdDQlwJXCS/Eggz+xDDnpbTH4eIJ5E+6/vN3gM=;
 b=UwWoXymJqRAn9a1nbY9YGmP7UrYi5z8V4UMyZzEqZghFGJ6xzMCIQho/tRyr25PK+jXxtu/ZU
 PrNvsGqJsZbAamqXS9j2qzWuKPgmroIiUA1B6lk55/BglUgkWjT5VSe
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe2976 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=X8Wa9jmQWlBxTcu95m0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bt_pyQ3TXy6ZR5RrPhHjIz5Pl-bL3QwK
X-Proofpoint-ORIG-GUID: bt_pyQ3TXy6ZR5RrPhHjIz5Pl-bL3QwK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXzceiLO1uGTHb
 jhy/L6XBELNEqhx5WhO+aB8M25A5kiCBL7QMR/GueEm488ju2xVV4WOoA9PldpsBxeLUNLKfSgs
 YUFI10KLaejPa5UbDkWEjBwwGcGfZhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX60/TVvZkjxqC
 l/pWrckSrRh57q9jp20BaWlv8FN4XwzfcHcrr2HqUj+HbXV++WCOxxDjJyVj7mUYwS3/2QCQaH1
 lGxHHIY3KXzP285G4+Y/GxT0YjXKigz6V3ecSxEfrPfl9pmOM3oMoxh8KeYghDCYhiyKKUm9+fM
 NweOIOKOJ8o1mp9g3uvbIwPQrfeesHDXwqA8ElwfyF1iAwIMC2SYH90vN3yV7G7jNnSDdFamZjN
 hy3kgTSveWCZFjbOLFBF48qDDbSlLxPCT8tDyOfioRKXZ+AB6j+QRDSEAJBew4+RNm4lPvKnBX3
 vF5hjUy0yRLqGaHT2G/16ioC4CubpSVnCgl+DPBaaWIFDHIOLCVrIwJecaO6FGAVG7ExCgCeYat
 9r/Sst3XHE4cdHFIum1wkTDp1FTykOVShlZ8Pz6rWsaz8vUsQIJrcp1tE6qJVvY24dYdBP/ysla
 tXtY3wMKALTUDIVWtOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
value and always returning 0.

Capture the return value, skip setting dp_powered_on on failure, and
propagate the error to the caller.

Fixes: dd1153651b038 ("phy: qcom-qmp-combo: merge driver data")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5bbb2b5f8c74..13d5586b981c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4376,6 +4376,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *tx = qmp->dp_tx;
 	void __iomem *tx2 = qmp->dp_tx2;
+	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 
@@ -4388,13 +4389,17 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	cfg->configure_dp_tx(qmp);
 
 	/* Configure link rate, swing, etc. */
-	cfg->configure_dp_phy(qmp);
+	ret = cfg->configure_dp_phy(qmp);
+	if (ret) {
+		dev_err(qmp->dev, "DP PHY configuration failed: %d\n", ret);
+		goto out_unlock;
+	}
 
 	qmp->dp_powered_on = true;
 
+out_unlock:
 	mutex_unlock(&qmp->phy_mutex);
-
-	return 0;
+	return ret;
 }
 
 static int qmp_combo_dp_power_off(struct phy *phy)

-- 
2.34.1

