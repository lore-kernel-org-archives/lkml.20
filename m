Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456707;
	b=vQJVYSC9F/BVaVDgsI3Z6q8U7ozzMRAFdhHorzPz9bs72ea9tRDnPDV/XOvoplrhc78h
	 1d2pMZo1o+k8pcnmsaiXBOW/ezCnEZ4FRVQsTfSteitGL26o12XNdYoMS9KkXJdeNKzH2
	 HGyOXSGXw0WpM3UZsXR3s7cmwJU7oC04JGR3g7ZrgZL9m2N4ADf1vMLoJLKudlSiB2/zq
	 9XOyXVhrCDdYZ4KDK76L5EzfS/U6WPyiY1UIGiKEM8PqjisJCSK2IjMOW9yjog4+gMoVc
	 WTGDiSJHOyyDol8y3d7tB3gqBPzAbxP/P38bWqXTTZTPWRubWsCnjbn4cwOkNNyPoEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
	b=P8qMkrB/bOZyUey9NL3LzDKfDkQk01ZDkVAGgiPU2FE3d0lMSob50gQ2uQemeyiGhiMf
	 XpJmdGH8mNl2gejndgi9YidPYOaT6t7j6D19KG/fi3MLHg+2AvFwIvp5JIa8eqaC7cj3h
	 9Qde57nMcTI4jl8t1a5+GyB+cCtIAm0B7lWN3jrGfHbfpI6R60fBDpDpWft1MfBLQ1P4b
	 kmtUrIoX6RuvOH61288Xj6Hxigar++lwJgEv15sCATPGMYGshGv/RRFnJo7WnmlLekKQ7
	 B3BIg1vlVzl5br0I9EWOSb+Uyetdhc52MtsSVSta6KuiWy639QkDj/a802FgiKGrUbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ef3ys/2o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSGXUHya;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C8606A329
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB1C8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef3ys/2o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSGXUHya
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03bp3174207
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o1w2HYl6UPI
	FbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=; b=ef3ys/2o87hOkBkLcAx4GZDDy+6
	vobol+me2DLX3VTP0cYgZoHY2yjMSodMRqsBhCXNDuyY7QSVW4ojLwRg/DbuOTgU
	yO4MdFagWA20OFrBa2FE85hWWhUwt6vFqe5xAMjvIX/cVCFM688KFrmHRu/mocz6
	TDb0b3tqBGgRF3wRbzcQGkNvT9kp5D1NoFTR0rR7hzR2f7iBadyKKCDiCqtNzyi1
	txGXsSdYKwHje1YNTmKPp+3WcP0oJMGAq0j8vLpyjLrNesHsamkxXloSUdo+rI0V
	zjNJcNz4DJpbHuTWkxyDPD7+IUTOQe1iBYokiAXVFOmwgUtB4Lf1QxPBjaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fskmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3707630eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456706; x=1794061506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=VSGXUHya6DqIc0j7VHJRIuDJ+UJrLj8uTPWHZAxZoRkDSuUXuJcFQekEUOlKT4awSC
         zP/HIM9HDSlCULzVNmiDY7X8h4fO0oKrPahwd9w2vrDeslItOS0IfjXed1v8hNmgYYpF
         Mwwwme2VPVEOaUvE3gyMlauWaQH0q69X8Rkg91Sv0cZNnYa9qduQBCpbeHjgRo8CMRbD
         6WWCN6RIUsPrs+48+z7BTLTADvy7Jw6LIJwsCEOwwmRmEtZy6qyR2fcoCBagj4wsx0m7
         KhBfe+Xti/5BJBOeEgrNgbhW6xIdpujxZOW/88MCHkqtX6xkj1WUTMIA8QjFQB6B5nG9
         AVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456706; x=1794061506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=idQaxf9tlfhCgYJkaz6q46al1NOa/XMSfi9Mkq4DUwhXqrip5k8T0XTQuOKUGeJlKN
         mGKwmARArEiuodStj0ztgeYsYJgts3no5CGYm8eFz6js7cdxsRltaBLpqjRxwsE3sLe8
         /8CkAYqllIS/sJY5FWXdGBPVno+dR25e9sX+u8oi8TNX4+qrniDpU7lASn8aDH08hRam
         IzpSORejlpzB7IdPB2O5tQcSJ3wfN+auc2HM6GiF1L+al8gK3TSvm6rq1hn0Idjf3qtd
         17WcKJp+ESLxrTzP9Ncpt6pwPAdo0wSwn6nvmIvM3DI6y+IA2T+5dIDLk/3jQvZ9yj8h
         EVJw==
X-Forwarded-Encrypted: i=1; AKwUvBy5cNmYr18L0MdsQ8OrbAYOAdOVqtEtbfcee5+MWxrSashE4ztZQNQtB0gmvVW8UUNODbknUYr7CVvkr54=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn16iKc16FDRLqkf+gG865Py27A3+tKgVrK361RNbmlO9vrx5E
	fE0efO6tVjyox4HHToPSwepUIPm+KsRHByoRVCvIl6LJNeSTdHtukRyAUmKWJVgRqystFs8J6+4
	/qYIH/+kM3O/2e02io4gPJuHilVGoMdo/uhvUHmqSB8w2tvZappRiq/J+AMW7pHWQalM=
X-Gm-Gg: AYBFou3ux+d7/iUJK9fT8klASb4ANe5GQKMFGagYP+vUNXA5seIESNFZHgNWjX0F4cV
	OydiB3NMWCHCL4IJ1eF7tbwVf4buPykgwX/3QnetJ3dzHtfgFlces4Vfywqq+ljOC1FjqiY5doC
	3/w6D4N+P9UyPuLrke+PYhsw4t9tRs6jLAqrCuovReloo3wLO7S1mSyfLDDpLcPkQPXSwtBpKI8
	UOKyOd+jh97dPiDc3zQ076jRMf1cC/xx2ShQ844JHqp+2grZ4QwWo6cbxRN8tu0jPD3ArLzTCbT
	WDbi+pfQX6eJGfdDK5Le0zSvT/RJCg2VLNp+Y8mpzAcaoHYeqKpkvZbRnIQ9P0MtueiqjBZQFsM
	OoQwFr9OFSQ26CO0AV5F5YvAPClrE+DGdpexQ+LVcae4duCfzHKppISwuTL+YKe6HLR5FZ0Z+tm
	jHkyaBQWHa5uI8RtMGU5yWpfByt3ZeeT1G
X-Received: by 2002:a05:7301:1927:b0:35f:5591:e40c with SMTP id 5a478bee46e88-36a4240cafbmr7991004eec.22.1793456705092;
        Sat, 31 Oct 2026 07:25:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1927:b0:35f:5591:e40c with SMTP id 5a478bee46e88-36a4240cafbmr7990958eec.22.1793456704233;
        Sat, 31 Oct 2026 07:25:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:03 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 2/7] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Sat, 31 Oct 2026 22:24:28 +0800
Message-ID: <20261031142433.1212809-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX6jxIQ4xgQXnF
 1abQymSnXKhqMtajB7PZtlE+PxsCT7kFx3SN0Ovu54XSVlxpJOkiekOWmnZpxtFq3QfnTZsa498
 loGmiHELcKYhsx1HRMy02v0z+0gFiVA=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5fa42 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: uhuWSw4SojklRi2SO929oM2F55ONeONY
X-Proofpoint-ORIG-GUID: uhuWSw4SojklRi2SO929oM2F55ONeONY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX+VjN09QIzz3+
 M9gp9IikgjI3/m6ghLyKoyCWIyA0D3soeVKFwsvXhLCx2luAe36xb3o3cV3XiJ4xkbqyDv4zDS7
 DTfOfDyRDmPa2HSCn3iaJrkx7i/wMVtTko8iHR/Rqw1P3jt/96dSqNFFHvpOawM5Mg1y53hSejO
 B47hSQNp463yLAMUx8/dmHMo9W5AtXIWPryOoKi6VdvFWwgzRURPlZMu2bV2U2oP98Nhs5lPD62
 ZiMG8KmYLEwkWyVAHpQCyUUt8fe647JqylT+81JMPyqsYUdBnN+T9mJsVRVsMdB77eR7WllBVcB
 5sKzvjAq6V+592InpHnPipvHlO423gvvCsMuapeNwclbbqXBHcTbWKlaCsb2APyUcrMddo79ld4
 HZtn4qN/AiFxDjNw7tKxQe3Txk9m+RPpY5FriEdTd3wwcwcakM9azMC0D3WUi4H1xCq7zvgpe+E
 a/L6zu9uGMACJMnrrVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..98dab85de64d 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

