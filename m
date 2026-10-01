Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E498511E8C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862573; cv=none; b=N9a0+Nt9F2cn99WbDhTr8B09V7EbP+n2i2rWK7GdrLaIjK2cSO08HFvYzZSoWaS8edtELdDhiQFZ8AOIoAFv9PKXqdlgO7d59DB3mg4zXnBvKiCb3tvYjDqfiLSP+WfQmM27sh0bMFlBQmvexj+5ZKcQyzupPpQf1yMi1Tlwitg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862573; c=relaxed/simple;
	bh=jzLbBGVCMQNw9atKruX89CioZowzDy3zfpgXzSDgV9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RIFo4a/QZj+1/J+VBOjsOE3h1vCJKh0c6lz5g2fj3E7pxypBYijCshX4SNEs7PVXFMIMnwI4nC5E54uKUvTBTofq3OsfrHXLn+7AQoqrwT3oRQ03WgC35AfJsR+cIJTEnr4+8+ws9E4UUhgKHISuFWA9l/zFMKMkvYJ4F9PBYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYeydzLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPr3UEbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYeydzLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPr3UEbs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Djfm22570719
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 13:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W4VCobRhLa/HlEd2PVZkof
	cVwcQj7/GsereQGC6YFic=; b=AYeydzLnXC+oTLkIGPGoLxpK6JpkGAiVuml8fT
	RfL0iOuEfEMrcquZUDvtfSAi3el33YtjiQN/ay7vvQX6YmxIJAcACmQYIgq6XoM9
	EfbAQ3EfykWW7yfxiAvbpPUS/5aMPgvJQ/VHOzG3qTgcyIzGa/l+pYkcFhQ+mJDz
	xjPKsKBbpV/9PoHHwE/y1pOVSxB2iqfVFM82Kumw25NdnO33bSeRGz07EE9DnLiM
	ziHpG2A31UQNKFHZWqT4WVLhzGg9aOR5D+MbOMMPWCFUSRbqtMQ6T5ipzo5azPKL
	Ln1y/vjjIuMpY42szfceaAcnXrwKwXBx3WNFPMGG+Bx6s4Sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pn27s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:49:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so66253895ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862567; x=1791467367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4VCobRhLa/HlEd2PVZkofcVwcQj7/GsereQGC6YFic=;
        b=YPr3UEbsofbjOceo3tuO1P+BwG0NbFsAIeDBoaIGhltR552ofpse8D4AN3m34oMdvn
         OiTvXzkVVdueCpa+Ux3m1GuQCgMZmhhx7RmSxKxN2332Ld1Xy55L4GlfYTsUWEZU7JdM
         X9gpp6Tby0GmMNW5HEuUcXKMkrNd8+aOqmo/rL0MOzEyX7gterzeRHlhJ7AmVgiv+pKK
         Q8aRJQ9gaI5Xb4TIR3PBt7v2pg0r2Ej2kCZxuvlWeEAXMmX7h1ghehVO3n/YvwkgLbpd
         +rUD8BRLJ5Zt+9LZDuOQiuDGYxek7qhZMrKjMI+Vsd77TzTz2AXfyoUPJJ6DLXHGB5de
         cnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862567; x=1791467367;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W4VCobRhLa/HlEd2PVZkofcVwcQj7/GsereQGC6YFic=;
        b=g5CTTXA38DH+7qCvRz1seAES9sCbGmz/oMeKnIhl+xr/pss8KsHJC4LAHDdZLsRNWa
         IcyDzWh/EpUUzhOEfdXejp9yFYrf3M/DDwvzwUpcpz6jq892Y+UPQRbHMqt79Ie86X2L
         aOQhfYLZukorl6BppnN9ruXQ0L3kZP1WWspLs3agYgZOmEUe0BlSwTm1X3DMkfJ4BEMs
         9hh5oX+lOMH7ABHg0WCVXz2aBUpBjzIGgSEbiczKEOMYRDE3R7s4Y7zA1Q20PHc43zjm
         9vLkZKN+gRVU2fTNDPm2VErqDnwIc2pxzuqGFhzIqZU6Jnb5+Ji4A7luawSbNoYrH7T0
         9HAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7M4yuUeSHXAeDWmlb4ygaEom7lS6YCj2gcHR2GUkz/asdvlzxDbJQUTqRo3RVSOLAxviz/2nojkf6r28=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsO1rdG/3fqI2647FZa7ubuwXmlHs7ZdpHSvT2AV2EQbp/FSyI
	aDgoqShvI5iulbrV+hrjfszqkPBcOGRJoebSWs+oxqRrQTtbcxn7f+Pi3Is7WvEDEjDJ9DMuKr4
	Z2CXLpgGvShjh+pdw5hWzVTy1OJboLXYIU9QgwbVO3RSGlpadaXPt8vZfhjKWUIGI+w8=
X-Gm-Gg: AYBFou3Qy6572d9Q7eCsdpBD31K8kV5Ni72OtKcoC8JpEMRvw6MfcXn/dXq80v8wmi5
	o5/9M8Fi2m4OIe4V8ai4pAey24QUMMzIzLTYtUyYpImsFybqrbNGvmCDS5ZaJImjajkxzr0A5v0
	KcnqCkJ77viV7uIAdZbUCDHyp9z/YATMMT7IdVW70xEu4dQXu31v9xUz3ut47M4KuBJGNkek5FS
	e/38+D8y6uRaPvR4F81w6fAh4GBijZNqDsnMxn/kackQDRCbuloi+GtRYCLzfPc1XlCpf0+/kXu
	l6YQNwEITyRFRDK/r4g4NcWC3H2Isma1KIcrJDR7GhiMLUKj+1b2VUOj9/idiIg5GcbUx6dln6X
	tMDmYwIUfEPVSog==
X-Received: by 2002:a17:902:ecd2:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2e2e49fb7f9mr36367265ad.16.1790862566903;
        Thu, 01 Oct 2026 06:49:26 -0700 (PDT)
X-Received: by 2002:a17:902:ecd2:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2e2e49fb7f9mr36367065ad.16.1790862566431;
        Thu, 01 Oct 2026 06:49:26 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b6f9d3sm10714805ad.75.2026.10.01.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:49:25 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 19:19:19 +0530
Subject: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN5kvmoC/4XNwQ6CMAyA4VchOzvC6sDNk+9hPCyjQKMw3HTBE
 N7dwcmDxkuTv0m/ziygJwzsmM3MY6RAbkix32XMdmZokVOdmkEBVaFB8tDR1RvejuQ4TqMZavQ
 cyqaRBrRVUrF0OnpsaNrY8yV1R+Hh/Gv7EsW6/QNGwQU/CA1aaoVGypMLIb8/zc26vs/TYKsb4
 dPSPyxI1qqUqlBWmuqLtSzLG7UxEecLAQAA
X-Change-ID: 20260924-shikra-gpio-expander-25ff4a29c848
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862562; l=1966;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jzLbBGVCMQNw9atKruX89CioZowzDy3zfpgXzSDgV9k=;
 b=lGhVbOZ5syqCHUY/f27Ro3DsfRdLuGuSmvFXyHiNb4TpI9OUBVu9aAE+4AKQxAaYMehV4PvGo
 fUSr8MoncQgCIQzh8S2jOTWn6ATxj2qsl4+aClAumW7WsOvUa7rK1ed
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: Kpg75kav8OSTSkiiixc1hjy-jb7ovYnX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX2WAdw7mgdvjq
 7xv0XhzvdemqgHu7Alz5DcFtohtLFYCD5yNQE9ZZthDK5/hOP8JsYECRxffXeEyFQI420/IA1h9
 WcS8GxRMhD22crnVnDdzZhpMSK2VULA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXwHDxrTHNeFTe
 7Qv92P0b0nqnEz6gIdFG+shOcWWRVBWUo7SwhkgOF9Ypublrm/GSKLvxZheSGz6JLVeQ58haaH9
 lhewapG0mYumU0Wm0+hKKnwsfFL1XFBGdnUbkZ13WbdvJhV7+YhPZXw+ke8HKWUcSPCtXMo5Xaz
 kSwSgv0IThANndCIHLwDj7shw265/GvKdbF5GleWgLuu2SVtdJJ/qamw4MAoDDOdfLcbRD9W/ZQ
 6VDlM+H5CbdVSYD84q+htHObq0TgumBhQCHpW6zA//zwkrwg4AKIWRHxNvmxMqtSaEov/DDmk62
 VNiX/bipvQlIGiVkgXT8EP9ybqETDBaVy5TaBSc4g/6GswurMu2Gd7yhJsrGc7TaObps286Vfon
 A6/0cDZvxoyEUlh/ZwFi7oRxSfbGx/bcSUa/op2VteENUsXBhf0tnb6PuuywesGsutzxk/2EYDG
 ysEzzriXOXqq3+MgM0g==
X-Proofpoint-GUID: Kpg75kav8OSTSkiiixc1hjy-jb7ovYnX
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe64e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ELGJhN323uyAj9mGEkYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010055

Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
TCA9538 and TCA9539 expanders used by EVK boards.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Sorted the child nodes by their unit address (sashiko, Konrad)
- Change node name to gpio from pca953x (sashiko)
- Link to v2: https://lore.kernel.org/r/20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com

Changes in v2:
- Moved GPIO expander nodes to i2c3 (sashiko)
- Link to v1: https://lore.kernel.org/r/20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 7fbd6d1de19a..1c49cb52ce12 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -11,6 +11,38 @@ &gpu_zap_shader {
 	firmware-name = "qcom/shikra/a704_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca9539";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "ti,tca9539";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260924-shikra-gpio-expander-25ff4a29c848

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

