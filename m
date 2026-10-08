Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84663D6465
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443690; cv=none; b=JVG0HyFhSi8aR+7FYJaKCgCIEx7Im4ZTKM8p1ITGX1uWxl6W4BR1u2ZuctqC2vvtMboPOk+Ky+WlsjKu7mRrV+Sd3S1JvgNOEcNB+FcigE9jI2JyBhVzzzUk8vYW6tJYoebVJRCgTKFc3hfp+xKKqHtY39cmoTPgP+PV30UsMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443690; c=relaxed/simple;
	bh=ZWn1goxuLFlJhIXJvr21INebf9rK8SREbM++QGUD0ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2pqSWNFd9OWxNTavsc4IzYFtuN9wSRScmU33iduDGKnmF9bRAoVzYOtob/BbC9MQHcMaC3BJIrEY/XmAD/4U4+A8adAEjqN/AARUThBpjFf0fhK1UI7mWcMqUag3mk/h/Z73bqY/qtPTnC0MfK6AEqOMtyq0U1vilzgXo+MuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjUToq5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIczw8yp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjUToq5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIczw8yp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BwFX1158702
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 07:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5YAmdM5mpYFZzFAUloPIwCU1Y2dUjbjPhmaVIbMoRk=; b=FjUToq5HuSwahYp2
	R73ZKPL5QfroZgIfBp5sxA8EfeMelo6YOezeEW92HiokQAHVIh7Toxr09P2h2zie
	loMTf1NxkSrgDq5itoxlIlCYvtJQQ8fcc9q6AFbjz5pYgMVgZ5mrSF/1mj0bTrgA
	D7PFjNoWGnW98oZgnUEkyo1YgXzU3CT7QYWWLH9aukNs0P2DU0aVjknOyOHwxQgA
	jrA44wM4kWKdavFnsCdrIlUQviJnULU8+XWoEbr9FLbyrokMhC5lqu7LBNauMyl2
	S/Zy2vBwkwpCS2YH1riaQLf8b3rZCWokJ5UwQYC5t1pzeDImI5CocGIdi+PijmhV
	IIRkZw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51nbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so5188287eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443686; x=1792048486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5YAmdM5mpYFZzFAUloPIwCU1Y2dUjbjPhmaVIbMoRk=;
        b=aIczw8ypnhV5BX8EbT51/Bl2WqKY3Pybg4yEcGJPc2SDypDP/lJHMMUkKRgFkYv2Nx
         5I2/Ggya4+hoGM/lB46J3AR33AoFAT1+jKTe02ljm/ujoA27TJZEdJM4LgHlviGJy465
         SqGGINEHMZUFRICI9CimyBt8WMIV5PzxcTdBLV7l2a8HmuHkQNBVhQqAF8dEP1jgTPr5
         4vipQOObTO/ROrNPEjSENjQJRRNSKTHmUY8/+iASVlorxr/nq16PYXJ05iD6/Q2ZEFFX
         1gMhOz8CW9bfzubB7JKVcAsqDBdwl0l/Wm5AJfm2RcyFWoQWcC0f/4f/ZYIT0bZjgnnk
         Zzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443686; x=1792048486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5YAmdM5mpYFZzFAUloPIwCU1Y2dUjbjPhmaVIbMoRk=;
        b=ovkG4z5o6dh1leBO7xSB8zUEorRP0DcwuzwOueYDT6oAtE/V90p2dQ169oZ8iXwpja
         iA6W9l/YRSaH5TRvZEP553Ic4e/AIKRONVEU/cFqHaSW/j/78Ch73PIj+yztVhCF59Vp
         x8rDQKhhSg/FK2D6mCeADpJy07Uc0dEpTHvE2/ilT2MvKctSaritsAMdHnD6zUKlxKlc
         PFLKQ6dLW5Wijf2hzn/SPgCvERf0Va/dUeJ/kPwImwA08FTIryIMVwLOYi/y90esuVTF
         j4sZXl+1SQ/mvlxW8lfH9rrj4R6S3oBtLMIGMGGA7TJj5x39/woh4J+ZhXHKJwMQ91/Q
         c2LA==
X-Forwarded-Encrypted: i=1; AKwUvBxnrDRdquyIdWlXz2A1mGyYIHSQgE213MwPO8DNJyOSIqlMoB41gbHknITYoCaqnGnjxdzCMRyD98mqDIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKSC1RHqVtyHlMh7V8ybeVgpIUZkF2+cbm9fMdjU/gK0dIG8ZW
	oPR1hz3tL+YRtan4KMGTMrdrbeK4EZjQ3e1xmQEZ/63Tiyy8yareTQGNqN+irklq9vI2oZ9BJ36
	19UWnDdRSfd1UyaDC8EzZO4qBjh176Dm/O3tpOdnc/QJvs03TTrMOSEj3u26ejP/q4Do=
X-Gm-Gg: AYBFou0PCi2LpwyFR7aDOQFpr51xaLf0qNSmf0DkXNxz5x1a9iHfXBjKQv03kXlwRxH
	HSKxqfyMQwqVdj1S+x+QgIt0bBXUR9AYDMLgEaSpmF4H1ier+T+H0j0o19HS6hZfqDDXaBrKcCs
	UgL67Ybr3b9TBKrJQ+18mGVsKArAbC41EbMDBBtjKvRTxAJnE+FVzTqnbz8nJKnjtMT5wrpGX9y
	TXmgWEWmnEU4iT2LW+OAAUMmU2bS99u0lc/3fz/3ELRkKUeEzpss+S3KjX2VQa3Dj4Xlg28TBZQ
	13xN9CcAfLCUYg9bGSBDS5ep+emSFt3EwbiGji0YLrtu1iTINYx1sx2/IuHFnKAvcDqt+PQiCqh
	7xfVin9ng8hTPI9znAL2pdqrEsv3rGZ7G+bztlm5OXqnKuo2BQFReeOQTFScL3vsuXcseW27h0D
	nX2JiEV4/jdA==
X-Received: by 2002:a05:693c:6394:10b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3515de5da83mr5478292eec.16.1791443685369;
        Thu, 08 Oct 2026 00:14:45 -0700 (PDT)
X-Received: by 2002:a05:693c:6394:10b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3515de5da83mr5478245eec.16.1791443684606;
        Thu, 08 Oct 2026 00:14:44 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:44 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:39 -0700
Subject: [PATCH v19 09/12] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-9-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: cALzo-9yX-LuSS1c-KYZaHFpOXioNJH4
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac742e6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX9gjEkzzDIHOv
 C7RYYHxHdkGI72vfT/9hOIoMa87FGaTXCGCsL8nBiNvEB3WiTHCtMtyDp/DA0kug7GZcR84zwm0
 qL3z1dTkKUNz1KRX3eKYdBJ/54nzWPg=
X-Proofpoint-GUID: cALzo-9yX-LuSS1c-KYZaHFpOXioNJH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX5AbmP8O+q+EH
 OlR65olbRWOHyHD4iHnR/8okIs7T7NFHLpMiVDviPDSjIVDlqBIbfnfeqpiofndz1U6rytW/asr
 P75F4eRvZi+oetVBhFMGb+DPwMJ/ijRJq19DTr4wZU/dQmmmPhqc2JuExPkYBntZAaEDRUGbVH3
 qcfQAJuZUhuGSHaq1wQ3pPzZhQc3Atjj4enPsgjY45nM/oAM4lzvsyto9ZIJTfxTDlzxvT/lSp/
 7HcKLyc5Ubd41+/WKX4cR1iEFdmEN+zpTEDcDaryA2y1y26i4qrU6KNTjMfGooNlbUXOjPY9aPB
 5ihomv34uwXDM18dxDuZHihLHKyUDD5EdgZpZuC4iG8d1HE5fhPPCBXp3tXXeVeEiyEGi1xWz41
 9tIs+8/J67P/6DZCY/mQ6ux5xrDTkqhHf0AcQIOIf4bIz+KeUo9jAqr/T/tCV7mP+X1WyHotEB/
 Q3T1kJzuXV2SjVWB94g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID 1080 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 46e443e05195..851b3cd712f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,6 +142,7 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -148,8 +151,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..770a9e5d5ba5 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5cd9641fea94..4e9447e11f04 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5863,11 +5863,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

