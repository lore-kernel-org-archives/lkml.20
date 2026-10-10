Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB6636B920
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610398; cv=none; b=KZYJZV9VpXY0SPisCuJcbbdYM83JzBF3+AgyUyyYOu6sEW9hcKx7DOOuHJ4APVkbQ33/2iR0rUTZGDQ1FqvDHQ9TLvUTWdNJKzZXoqOSs1crkX6tbcr0DuRVWTWT/0QzG6FG+f9QMpAyLd7rzgCvrhD7+heVHfx5/PldE8LRiD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610398; c=relaxed/simple;
	bh=hHxv6VrLwTe/ZHLjbmPHvv69qOayURh5ZnCZ+Bh8+D0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlBLobCNmf35PaI3iadPK8MPikjnMc6uqG+gWigCFGay3MvyfOsXKRHolTdfYSoIxd7CT8S0kHXsvqwuIU2bOduMpp2PKGzQ3wy8Zkl9pK+ccHevhHaQOtxWhdf2tIFYjYNbPE0wdtGZy+i0dgOthZDHMedOwIMl+ODNNA4CjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqigGP80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgSDD/c/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqigGP80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgSDD/c/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A4ml5I3022672
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VfDVxALSW97
	OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=; b=PqigGP80GFlk5AtXRekuObwnlYy
	/iDOjVFJ6E0GtdEeUMdMFZbS2FmAXQOTwd/YqSF2URAtsSK3Gm0VuNMLz7RqL/cJ
	0jwRF+dTT2vBX09ismn7dufIIdKfC/6XGpBOAVKc0p2fpx/Pl/WsHDT4iHfC8cFa
	pFGeaF1K9QIzm/XHmfAdPQzFjR9KeIwloWOqb0keqIBp+AmlqfGgUkDYObFeLz0a
	dVlGPvN3P32mPrlm/Z/zFcvuiC14bTbwU2EWy7gkJldUnJ47oDai+3OarTrEZfmh
	dAn1n72KtdRq1gT86o6dGoYmGRuTLnbPs6DshVhZhZSXh2NizpQzmYR2JRg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9r2rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868db1b2c64so230959b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 22:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610395; x=1792215195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=RgSDD/c/GfhH7sfBf43fJVsMao99OXtEbPmLmTAt2xM2eKngiIcExD6jNimskKIQvR
         XUVEWxQoCa7kMRet14sftaiX3Sui8rGOFUGbZK6IeAmto+RvXfR4zBAwGKPJxUwymxMa
         ND39kLb1xyn00YZ+lbAFHvIYL/UZYUcjy2NpjK58L9R/Ms6IxjBhfXRbq2Z/+7QNMapQ
         CZPnol5wmmK3fFTvFqSuU0uALhwaw9TgAyH/aU+lEaMBTmPeXaWwcht/lB0cwIKmWqTO
         JxsIu7g+BrBlz0AI9sA2paWxPd+CKuPnm8UaGqPLZP/08in8ynQwBe+HdBut94BJLMIW
         50Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610395; x=1792215195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=F8wS+D9TP1qKPqbIBspVC1Kn4Fj54UQ6BcLGhkTE7TBgKgRbbXYD/OhEZsNYxqlrHZ
         kF+KiSprOur+a+2q5EHWFuBdiKPLFGC2AtVTq/H3Cu//qnIGUlR7Ionr45QDDrYn1qv9
         uhUXojVmx+8cn+Nk5qEv3n8ZT+ju0gPpwFKsClEGtpr8uub/DwQO1V03jCtXS3lVbGPN
         uVNFwk99AvsrE5iqz/JiawR/+w2obdfvRlIk5Rtl9HO17MPckLZ40LKebmeC40hPvpWD
         94NrYWoGGl2GTSGnOF0IC3BRSe1QZZjfSeB2hu8d2GbP98sQJdmWpNoK75EWuiYzdwjC
         VDBw==
X-Forwarded-Encrypted: i=1; AKwUvBxRuuFvXLvIJiYRqpxN7TWyM5bznA2UydXBJGVA7rRmrmUN2JbNv8pe+zgBjjHt5CXtfAJLV0gjAzAnbhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCMxRjwPlHpXmwMrdqiPfMKVfAoqJ2U8GzYxnpQRSO8vchHYRf
	AVsJ1qtHdfG+otMDb6uEwHC0xL2cmG+BRqnIz0kykei8T4vLMMu5olW2cVWcwImQUnRM+KqfR34
	0T/a8vPsHikhuNYuK2PfbgOdxexoIcZBHpxHzgtxbMJrfO+B7CF0GX0QXpgqSZFzNB0M=
X-Gm-Gg: AYBFou3OQbCXMoc1BdXvr7/91UHzC33SEDHjCt0bfypI5NOsW9x1pQiRQF9FQQzciRR
	i5BN6D5zkp7hqTw7L3MIHJNn43yOK8ceJUAw1FICMkZ/azJmUk7CUcTiw+Aq8mL1lNKqbxA46Ik
	pu8w80DdP3CTcaY/5/1oeuHxQEXip4sj7dBigBy8pjNCOT+Bw0c1L5JdgDLXL9oFjNBi5wvqPyZ
	dQjVHXCEoKc2e5ENaa3GGu1NJr4VJ3laYpMGaWl/d0EdCSMzbsHBR6SGTXdZ8PJT1sxiNZ1bXGC
	w7XMbvSX2D/UzINHXGbIFMCmxdXNBcY+A7nqTt08f4G1kkbjGZCIrtxmEMn7hMRSAQmtEsW2cpV
	5CsVpF5FXMOa3pCDy4jc23/Bj8L5Ca5s=
X-Received: by 2002:a05:6a00:1c9f:b0:892:fae5:f979 with SMTP id d2e1a72fcca58-897c77dbab7mr2917988b3a.55.1791610395362;
        Fri, 09 Oct 2026 22:33:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9f:b0:892:fae5:f979 with SMTP id d2e1a72fcca58-897c77dbab7mr2917950b3a.55.1791610394556;
        Fri, 09 Oct 2026 22:33:14 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:14 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Sat, 10 Oct 2026 11:02:41 +0530
Message-Id: <20261010053246.2991984-3-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6ac9ce1c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: aLutJ5_-pc0-aYOGs0lg2JkOg4NzhKM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX3ZxC5+VNE3El
 qaPEQTApJaSNiIOFE78FRdc8T3PdAvA8sC9MPpMJQkvDpMklUtzjkb77rrfU7UmQZSvz44DvnbW
 Ak6afYrBngrBTqwkgAKtXvVtUSrI9mj35CA9sDp+PqBTi7bMmHwjxbm8C7CIAnK9GK6xCUGYKII
 n9y9wisGUG/Y4hO1vvfGlb7OgTxye7eezMbAS967DHa4amwQk2PjBDZLX8jG0mkQJmlgfYcPrRh
 pepkWpmEFNCHDHepPnqWDWK+eQNkWnUwYJzz8ekjR5N4R2enN3fPF/6jb7C9QQgx0c3zOnSliP8
 G9snkaAWAgp9wslpssQ+ddYzDwSuqAincj4NgKRNiqY9jXMsdohAcwGdi/lH0UYU1tTRMkhfVEI
 BDX5Y90ZzJge26fOnY0f+frq9sKm/TABCfzl6pWuBXbglhyx0WTSz1h/SKegO56lu+jAKQ9WltH
 DqZOwwERIXBEDM17syQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfXyh+mzu3GuwO9
 movI1SBHIqWc6CTDLH/t9UHtnxuJ99vEuupvNRoO4w9n3p5McqFraFdyROQ2/aiBLGK97k5/W0l
 44IlxdABWHESoK55PhpPGjoCctBkRUw=
X-Proofpoint-ORIG-GUID: aLutJ5_-pc0-aYOGs0lg2JkOg4NzhKM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d4fda4dd81f6..508b1ee7cd0f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -346,14 +346,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	qcom->wakeup_irqs_armed = true;
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
+	bool wakeup;
 
 	if (qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime suspend, always enable wakeup.
+	 * For system suspend, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
@@ -380,7 +390,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
@@ -766,14 +776,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -786,10 +795,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -826,7 +834,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -835,7 +843,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

