Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD934F30CF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812661; cv=none; b=TqeHmDDyZr/8IT4zcVYTWkyCSBGcRnj4btkGauJMMU5NWYVbU24E3MDofwuqCmrwdBNyP4wkcuB+txv0tZHqd4cTRBqzH+K01VsjD0UoGTCGZ2HupedQAI9+yF7Ne32pPShu7c7hr+G8EWEPfEDiCKcI96rx4RRnbWpxfQ0ACRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812661; c=relaxed/simple;
	bh=jAZUog391waib5poEaz5VaRKy/HfMl4AFD+Z9YWtswA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNT0h3YEgrNM9IaUcdz0Ffu6N8Xxi3b7a+dQdNBLpE71HvW4QsbIArMjb2iJ82KLv9S8I3/qHC85N8bR+wosL1jrp9P4SBaHLOqSMdZkTsPW+bSkLbJga/CxGtUskseBGZ7Anl+dT90z2hPfWaQGzfp7uyUdczRFfGQ3H08a7M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yjo8of4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsPAhY0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yjo8of4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsPAhY0W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H8BoL4183691
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=; b=Yjo8of4eO3dgkOiY
	3Rn9v30BZ66pdFQUKXMgX8BAub6xKgb/nufZWLzUux7OPOQLCLCC/TC6/AGgKfOz
	4reUvEh/QQE9hU+83G6rTyOi31ty/YJUCdOLeOMRalgulqn809B7eCwy+E0Fe+wB
	/dXpmAtjUhu8yN1jzsIznLFwpUeD7s4/sCgAD3auxPNjr/7Y43/+Qv2Nzf/eNLHl
	7YzYHI/YJJlesEAnUutY54DoMf+rGAqpj+c4BFpKDlDdU1tQagWQZAbTl9E4EGMi
	YgLKX85rPgpXT+dixMPAwL4qyPCc6uj6rgM4jt2lYRbugqda+9tTKyXkQ+6UMbvC
	+JrMVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx28ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:24:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2727636a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812642; x=1789417442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=;
        b=dsPAhY0WdCwH7TYaqE1xKKlH3xPpSqTiheVEpaauVU/vHhWICALYLAYkfo5C3aBpSz
         uuD0Y0Y9XxcFiaHBmr7sCkkZqSkO+HC/YzlF8cfy1mNoxkV0ys6aIhR6TDPU4ZHNxziv
         9Ufu7fIYkHowAiJkhMHOQFUpPnfeIXfdQwWu0ckh3P4q07Se4csSZ7q13o2x51UUuhgH
         IYzMOK3YyNo4jdVIzZ7S49DDjPOHxpkjQr622hphmm6lY55zIe5qYgJxGNAszJM2RyHg
         1rHyj/L5ZJHhN3XuvdUk9h7So33RcPh8dIR9+GWLf4IWhQCem9V/ShuGWfldCClV0gG6
         iNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812642; x=1789417442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=;
        b=eBHwoLR1LE64CaBvWzu55oXl37h6QDvigWrEgXvnIwP3JVoD3+/fzpla8wIQ0GwbXz
         EKcvND+RGkvXol/ITZME8N/RedruyNqZCbU/xLjZ8fj7m4glE5Gv7FJRVEtpFzYM0LDk
         0J7aPCRZUUal0LEnG8Nt5fExV3AxxTfMIRwVaBcSohULTDkDaW5QxOXGmhVlFHSvKNkv
         PBF+a+bJRXUo2x4eUPPw3LrVNfbved+hJyXFRelyqndubU2nYJjtMKvDovg6FNIjb4lL
         eIoob2ty+vf7PlNTeHexEit2sZYScgjqPVjGZUEkHUhFFzapAcAkt4nbuSTqAKpdIiT7
         l3ug==
X-Forwarded-Encrypted: i=1; AKwUvBzS4Bc9e4ZrsGNLF3mXnvWc9ODacPFRX6n/59FGKgishVai/tj3njXQomxIRMNhmvaxDfnw6AOoGd8VPc0=@vger.kernel.org
X-Gm-Message-State: AFuF++lVgyYpDOholMilgSXBS5A/gms0PjkGe+VVdM5+9qJGLjL1S7mW
	z7RzxnMsE0ltIk1kFHA/D2htG5i5oUQ06JjGvOOWUiTpFPKSlS8xtYoQeAXxmW2UTSCdmkCadOI
	ycSMqvwvHx/mblNx9hmLSVoeWMv305NStAWJEvBEfJdNdWKfNSSgocZWoA9UK3SFgJwU=
X-Gm-Gg: AYBFou0MzH/kD329rjxAPOqwOjOi05BPGt3YD5V0Y4AIGGhgdRl/b5GwkB0gTjnUVdY
	ishATQmYB1onwqewO2bo0FxuIIRJA8x1G7pdC9Z00fUmvYIRvZH7UWhVMwj9qOvfs4cYdPdItPj
	3RBQ5AySmEIJ6q0TKyCF/xYINbxeEr3APo3zyYeHuNrWhUVqOWLKzW0UkSVMwPVdM19oXjCgcyk
	Mw+hwgKg+th8tbhaczwOKKw04umJ/yZlPaX4qdI1yjJ/qik/Nr09hX0FdeYonlu3Uq6JSBdnPSy
	s0woLAidlR4HsD55UQEmW9wNiIHG1SaGGSd5bezZzMZ0wH/zdo/p3ZQ4daiqtgyk2iNv5NdDZNq
	4rbN7rBqybg/lJoofIeN3wgBYXwXoCQ==
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr39912002637.19.1788812642084;
        Mon, 07 Sep 2026 13:24:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr39911964637.19.1788812641662;
        Mon, 07 Sep 2026 13:24:01 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:01 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:14 +0530
Subject: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=2136;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=jAZUog391waib5poEaz5VaRKy/HfMl4AFD+Z9YWtswA=;
 b=DHYLaLQ+gXL49XZqtb6eATiMimarC5O+tgQ+agl8xwwu1/xxfwpt8n4/qEUHFiyLy+f77rDwd
 TUNDQALem7ZCzzJx56lUODiCdje998TmLDFIHjtXVqoGFBNUxXf/UFH
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9f1d62 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HSu7GbSMNvoR_8cDCTbGscJ4LG44Ip3R
X-Proofpoint-ORIG-GUID: HSu7GbSMNvoR_8cDCTbGscJ4LG44Ip3R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX6bzJ7c3KOaVe
 xU1Yjbs6l4g3Uq7F8lsnFGx6HhhDlGCSydG2vPM4gVhKVztwJ9wml5gCvNSKHtZ8UGd4C20gN9R
 DPyyWhY9mt8hvCS3stm/cEr/r6cSPOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXxnSobRD6t08e
 3SK9jvbXNVbRpGdeU4V/lVbZ4MH6w5SBk8OHndyyE04EN1yR5PSPa1iu17nuUZYExYXwuBrPzRt
 /KqEa4Hz+xdl7BmSCD+1mB6LN/hZ2t+qEpT69+pNWqGMNU5okH8RxiUmESDXd9ekW2Lz5T/B4PQ
 fmwNJMKcHYcW5sAanGOl9nWIOBT03LAbGWzy2+Zm0kB82DjSLQHooNXebOaaz8V6bl2VRuFF5ev
 EZRrx2PzSvF9eC2ho9bMPLsJDN7rWP+GjkCNnZuOmfb4OdK2qMKosINa28XYnT7M5ZJCrPGApi5
 AJEgcVYTnZMgwtihej6VVRxugNL9Wrdrmog1wiMPoBYXqjHVD1Owf+lTJjWQx6CmeKtC7iMKzuq
 WyHHiaFrqqExF7jIwStea6Nt9Ui694fxCHIhVXU+fBMiQp+D+P7q+Ow+c2KShW5okfSdHwzXsf7
 1dDh45nU98RNPr554MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/phy/dp83867.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..dbeee7cad6f0cbfeb127bfd28f43ee2a16c78879 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -15,6 +15,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (count)
+		fsleep(200000);
+#endif
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
+	int ret;
+
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
 
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);

-- 
2.34.1

