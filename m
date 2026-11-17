Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910314;
	b=bJJB6j82FZQ+UoHYFV7yUBNd1GNQcV9mNV7D2ypJekqcO3gvfC27vH72gaigLTIZ+oR9
	 7Q66z6votiBXqonWhyp3k+C5kA+NIzj8UO7jcuJzncoVrfJ5RafOWBpu9vA6XQw3XSThW
	 0WpwmoWwBBkech9ds+YCbvO6bXZPhV6miQ1/S6g2cZAOkyLtjnROUWLaseC7nINJb60DR
	 hcGhOm2SC9/2ImfID8gPktvzWBeDhTBUyBsTp+27zDKMF4fVWMW+ZMJIiwlcNG8KCuzXU
	 Rk2Y5N2fC1b0HDGPo+SMr+WQwtxwTxFj3wUb2EZPt/yaLwX7Op9KK4k5CxmFR8hFuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DwAPZke92rxdRB5l4mQb6Ggt4O4kBeEuyKiTLtaStHo=;
	b=VYr14hv0TdqpFIrKgnFG2aY8kP5SnwbY+yTKelPIFUNjUMbF9dIFmDLk1qcm2fTh+Zuv
	 rQTAnKU1BgjC2515D0bY9hMGSV2EGzU6h2lnJvS3wyoMwU/AfhO90Zu1iVaF5Q6Ooau6o
	 2IwvesCSL2DTMSpmpzVVXXCGxcQ+/REMlGSmuMSrz7XfAFl+diEhbo6v+OnaX8TjT9iC/
	 ynXPm3MmvfPFjteQO1eNrXUpxwMzKNgwCnFdKMRXExw4EiXv1b2Z0d5sfzqoIoCnFqw5X
	 XpqMc93vZe7cP14S+/rV9JM4suZom27nzmNTUa69Mf2BD7RSxktHB1Qy6h3L/xyAqzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjCHGjx8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q9Y8g9/p";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B645A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B645A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjCHGjx8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q9Y8g9/p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHA51JC2790829
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DwAPZke92rxdRB5l4mQb6G
	gt4O4kBeEuyKiTLtaStHo=; b=mjCHGjx8KJso/mMxdzfKzmJb9l2c3ymZhtLAIw
	gf+hcbzg/yYfAUgFrY8hQlKhkRVlHjt++iV2wqXWesDoAyelWYRMUEtUUqIrhZ9A
	4m0C839vn5PVJHy5WcCmD171MbZnNuAgVmGi/XES6K1xyIjmJuCBs+9t8yooLlgJ
	yJlms+6rS4+K09cx3NWXQbjX2fNH1nrHKhqnXJeO8OBb2lghPie7NO1F2SQ53XA8
	PCK2Gi5Y+guGX/1DhRR8k7e7WAW6KeAy5JpfKOCdhHhW41ziQZCB3j5lKYnVe+IQ
	VAQtdlRSx2DFG5tDbuX7qTlHtuw5A/9ln1xw8JechX2ybPwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv100xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:11:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so13284581cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910312; x=1795515112; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DwAPZke92rxdRB5l4mQb6Ggt4O4kBeEuyKiTLtaStHo=;
        b=Q9Y8g9/pV18WGTlJHAsh9UIhZXjV1a0OA+G9hu+xYxgW937G6jJpvxPsXospnIGzwz
         RcEh5dWjO/giUDjDDwLBvi1WXlBnKVA+wToln1vGUgxs/XkNOI8T0dhN1jf1VTq9GZiL
         VcrR2H2I2eFaSxL3ufLHplsktL3P7/PrboLdgvBa8IUvFL2mhouRZlhuSF0liGPadhqD
         GUOXNhQ0gwkVMzA1YXpcQiTup5RbgFT8/N0OoLvvC4ODwVevOXx9RVayZvE7PWj/N/Es
         Oy6sifm8K4a0V7TMYVVa7Ii6FCrusz94Guj4AyswS+UEQlI58zjzOTB6rtkhubneA1+/
         OxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910312; x=1795515112;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DwAPZke92rxdRB5l4mQb6Ggt4O4kBeEuyKiTLtaStHo=;
        b=y7hilEFZoEe+alh0UzKWc3MkQP3tzqoLbIi22OB7sJlfc6bYEZLxbBHxSzbqw9CG7/
         7fV1dKIR7wRPbIkKiLstpAg4O3HT3x0h31xbaqaqj/VPQdr7FCZ03cFRtgRXErhsvVS7
         1hOVwqdOuvyX0CCVJV7yU8qTekPkP4mk+b6dlfVljr7Q6IC2oposyt+W3yEyVSjOismm
         GJwe1XGiP9tS+ZVDzwh7DxulV9lET3f6dQRcsWiSAr4+huGNH/7hoiH9aVwMC7HbKFvS
         RD1e6TEwDOzK2wb2vDaSOjcOYk5Kw1g8D8UhXiER7T6rRTjEMCCYq5TujJdwdnQ8+L8k
         +b4A==
X-Forwarded-Encrypted: i=1; AL+hErGIJYbG/HD9XR/TTKij53xBwjU2Z+VnFH46z6UCjJRif8n+PupopQrblfn4U2G2y4R37mdTMtoxIO7XubA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99gXtiQCR0qjsBlHDPO+Xc3A+VcGbmUsXNYap/SAFQq2ROMWDt
	gz64ws46Qz/7mebq0xmy4R7CvoJWD92Xw2O3nvVMbFU876vXIaCUp2IV92lb/c6dtb1cNuUOdxx
	woUk45rDIepiGdnHn2Y5XsZ1PsMXPzBhkZfJ4fo1XDD1Sv5zhv4+RV7KjpsyrlqZrrpw=
X-Gm-Gg: AZFdTZfpELSdyfwGnQ6mJAZ5paqSPDKdo1T9HSjRTCstw/By3hvRiR7cAW5mQ6xjEuT
	EO3qteCzryQsbmHAG0Mb0LzKiZ6IcKGWxmX7k+et5M1keEhxbB0pxSAiZciiX4D2QHr64nFt60v
	w9mEk958hOeTURiWI1nS6V1+hp5EBAiSnonEHcwGLKpZiSUQo7Fs5E3g4xnhsbhAdEAQllRIaaQ
	U/2gbRG4TP0F92KQqwverL1Q7ITYNGi/oUMFXtpeOc0JIXaaAuMrs9vIHgiyBz/8OTS0Nb+VCsl
	xdKfOFORe2yRJnB1xIWKNrOBMUMdAnqWJBaESUh+1FNm4FxCuZTefI8Mx2lGgrar+0dRAIzE+/U
	RoPFkyeZlP5P4zox5XvxkUdv/R/awMLX5+eBLxCx92smR9hA4wRlU2MzvmEyn0S/eXT5+NAKuLs
	H7Jw==
X-Received: by 2002:a05:6214:c65:b0:91f:27f:9dae with SMTP id 6a1803df08f44-91f241dd471mr281994166d6.3.1794910311773;
        Tue, 17 Nov 2026 02:11:51 -0800 (PST)
X-Received: by 2002:a05:6214:c65:b0:91f:27f:9dae with SMTP id 6a1803df08f44-91f241dd471mr281993946d6.3.1794910311274;
        Tue, 17 Nov 2026 02:11:51 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784e9073sm60433415e9.6.2026.11.17.02.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:11:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:11:44 +0100
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Disable TBT/USB4
 negotiation for now
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-topic-pga_nousb4_glymur-v1-1-0ede74e620d0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF8o/GoC/x3M0QqEIBBA0V+JeU5o3KjYX1lC0iYbKBWtpYj+P
 enxPNx7QaLIlOBbXBDpz4m9y8CyADMPzpLgMRtkJRtEbMXmAxsR7KCc35OulV3OdY+CzKSxaz6
 6li3kOkSa+HjPv/6+H6210yVpAAAA
X-Change-ID: 20261117-topic-pga_nousb4_glymur-ecfb1863b427
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794910309; l=2049;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=7abIt526yjopLqD34Kc/Js5bzzHURYriVZdSZPxanVA=;
 b=qG24jzDdxIK4jIeorenienkVcs9mnKMn3GIHVfgUDdFs4ccBo1cZjSt+mpJWkH0Ytbjo3YdBx
 CYHeM9BAXWrAJE90fqfyn0CnFBaynKEap3dJ/Uh7eekz+kckUxB/WDm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: LMd8d-YCPk61VvibxEcAsPtgdjfEd55P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOSBTYWx0ZWRfX8fHYoBaXjsmX
 BfSTmDG4yCTI+WhwR8aHMtkKKJDx2djiSbdYEyzHgiQcPm8Cejj1SQk+iXpkdS5jjlZ1Y1syuWl
 jR2NM8+/zd0UbLj1JEQG+SrzmuvBl+w=
X-Proofpoint-ORIG-GUID: LMd8d-YCPk61VvibxEcAsPtgdjfEd55P
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc2868 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8BIiFlID_qMi0gqYw_8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOSBTYWx0ZWRfX58BTYj+y2YJC
 Dy5mM/64g6DaE8Z2hbEKtaYsf0mBLx3fe/Jpmh1nT1qejlZfpE8M4mszg7L90+jN8bmHnv3ZBax
 mcHDla+GDjrzM6Sycg3KSquKRqaNHSe/ZQzP8vz8s609cxNtzlTuDMI9AlrSLh9yX5juOm0bkNv
 Xgdm+LfA0sBtNQKjQJN0/cYYuICCDXib5EzWNQleo6HYehtMXRhNZH2MHt1o2uA/iQ/tR1wsbPB
 EX6dGRXJAcGk53z1fVN9oqVdPg4hCq1gAIH8J9CydHzEdpfUcnfljL5Yi39yIXSUYsHbAkq036l
 X1Mgg0xpE/06jToC/Pbuh72ZGqHHhOUudEaufm4TxLgM+rBZzBk4kcd3rW5i2ab8OsiZPKbZyir
 AliEyOhGcbFPGIs8AQ2g/HjrwoZSHVMTUH61fpuj7iR49wlOsSjyRBNrvKZD4fg4cqVU5FxIDq0
 s37DH/s38zhAP1d6TmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170039

Some platforms (like Glymur) accept a versioned flavor of PAN_EN,
allowing to specify a parameter that denotes the OS type, which
influences Type-C capabilities. In particular, there's a setting for an
installer image (which implicitly doesn't ship all the required
drivers) which disables TBT/USB4 negotiation to let the connected
devices fall back to USB3/DP mode cleanly.

Utilize that. Older firmwares ignore the new arguments.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Tested on Glymur with SOCCP.FW.2.1-00267
---
 drivers/soc/qcom/pmic_glink_altmode.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0485f639da7729066c05069b80fc3..e648653697d5a9bfc7e293e9bf3903656148f026 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -32,6 +32,12 @@
 #define ALTMODE_PAN_EN		0x10
 #define ALTMODE_PAN_ACK		0x11
 
+/* These fields are ignored on older FWs */
+#define PAN_EN_OS_TYPE		GENMASK(6, 3)
+ #define PAN_EN_OS_DEFAULT	1
+ #define PAN_EN_OS_INSTALLER	2
+#define PAN_EN_VERSION		GENMASK(2, 0)
+
 struct usbc_write_req {
 	struct pmic_glink_hdr   hdr;
 	__le32 cmd;
@@ -548,7 +554,10 @@ static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
 	int ret;
 
-	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN, 0);
+	/* Set OS to installer for now to restrict USB4/TBT negotiation */
+	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN,
+					 FIELD_PREP(PAN_EN_VERSION, 1) |
+					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_INSTALLER));
 	if (ret)
 		dev_err(altmode->dev, "failed to request altmode notifications: %d\n", ret);
 }

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261117-topic-pga_nousb4_glymur-ecfb1863b427

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

