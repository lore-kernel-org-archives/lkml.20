Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4930FF1D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170697; cv=none; b=scL5gg3ZjRnMTp02IRVvzZWnA5vSyYbGNrhRrSrfxZYD8VqTaTAlLGkInNpGOR1qgShjFQHqGukM4C9n6QEXnLduGqHV2cW+kpLlZrvwkAGjPFV3uZW6/OlVRpFZXX2mgzh35651z9p4ybA8TqfRJUAc0sn3BTEQK6iCF5hX9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170697; c=relaxed/simple;
	bh=4ZkWGQwLzoJisDVb4/Hs1Em8NoZ8L8w+xBFg5ICKCII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ1q3RdpWGtRE4jKTpabFGATP1Pvb6dMSduX8CQ1wzUrvUKbskFeYh2xNMjh/lG36nGafYtYZXNknwXMBGG3o6mHVOnvrswsLRq7L9OcYEmLDH3BCn+n+5ildh8pZHioRWeqWFqXxSH4AnY0Xoc8DB39Yut2ZdWET0jjsgOtVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2UJn494; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MH/EEPJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2UJn494";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MH/EEPJb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNu74081787
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=; b=h2UJn494TlD5Gm8p
	pOsBD6fZ4mGQn8OaC8X/JVoCGchWuigR8frXbPj3IkEoicP/AROVlKKqKCTC/gt3
	bPsw3EUtHsGezYSt4WHvyPvjK/3sNcDKrq5CZ6G5BK5KyT6NNWw+usfu8RoixcYk
	zar9XVdUEGPGGJQXvMo1vozxlzKhHBFcLYVvnS9UB2lNW/N1kiNzABWCTuRBNroP
	0o9gCpdiWCGUezCFzik1p0ozfcgiZ79XSPE2YD8Pht9H7Wi2GTQrHhLRt7Qwzuef
	BwzNl9Z7amcTqeAoVwz7u8OQelIUQ3O5RalC36FoJYncmoooVvnqNKfnc0i/SPC3
	oWeF8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h23wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:04:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso358506785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170694; x=1788775494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=;
        b=MH/EEPJbLrUb7pKae5ocbKPBdxkkQ0Mq6GB7ddNwguJu+G9/biqQ4G/47OMzWbdJqA
         LaWYuiKynlUH+ScXqWVHZaZnpea5cczF19BXuYQ/x8ysT/T6qseuS0Beain/NIBEay9J
         tGH0X7jVCF2dW9T+9UMNNibspbRz3vIJGRfDryhEFLSJxdn2p7SoLQKPBKmeVdgdS2rL
         mu6V+Sk4jCHgEgQErpTZIy3LZ/bZ4BIMFYG2hsdSlDnU422mYef/PtON5dfSnPTg5RDx
         2D1pOKfwntk/UtSVPREflEthkHxR0ooMgDmkWLE5PGMOYJe9KOdWBI8y6W+/7w98SYEQ
         TLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170694; x=1788775494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=;
        b=tL8gh0t4IMW4C6gOarl6OnZxbOVrEXGv7XQMNrOU9Auu5xEoja+Vo72SocUjJ+RGVz
         xZVgrKDbeghTsVXiZHSPlkZ1b4akuunpt9V3aQTWd4hPLcwi3dU27WiPAPXfEtjOoizP
         T84dlOGOxuj9W/ckGfybC0T16ZTGvQuQPJWtWxvteT36fgzDksJBtkZONLmHZbAhypRe
         dmOG0HH6n3b8PeUloi6owlE+fGdgnnUPooLf26X4vrq9op7j+2zj3iYeuS3OnWHqVADE
         At3BZJmb3ijfVLu6mI8z3TqsoFGyOwRizehjPdtMDidC3tHhjh0GFezcxi37x79sEBCD
         wSHg==
X-Forwarded-Encrypted: i=1; AHgh+RpvYtL339Tv1vs6N8VRwDlJb6w5y2bfu2Phc7cE3AlR4Y+3evgxMGD+cOUae4EVbdRxNK1BaQjgxUTZSDc=@vger.kernel.org
X-Gm-Message-State: AFuF++kiQjZeqO58ScE36l3mRV6BunsLbXIe7F/EkeUvK0utaIJmx3UT
	nHo/iCIkTEee8H8/W/ubG4rs2n+JVNCJubzVYE8F1EfkgaLUE+NfcRCBerMEKb/URKewq8gBsab
	LWGuwMJApguxp7c+80gwB80jOO/q/1VKrsZPtJuPM02WTaL8c8b7GWCRMe4jgc7faxkY=
X-Gm-Gg: AR+sD12cvPOReMqgBKDRI3atR3GQ4exBO0ML9rE5CBWJt5SjWBJE72pgP+Kxx5mmFlN
	ddP1Ge9cQCn4dSvtfGQ/mAxlujkCQmGBB2v4/Zt+E0/Pd7yhKD3YrL0q/I8D1kf26eRff0Q/ddB
	fP8APEos5R8i32LbhrVeYy/N8dM/ZrwXUwvbA+PEaAvXhol4svXZooQWpiZW9cmOsshMfRpsrd/
	tH/1Jdg/AyQsyYkPexOHknAwk0td2gDC1+xGlKsBH9AJEN7rj4JYm0pYxwV7nFaEt+Iq4vUNIOk
	fRwPZeuVvBBfTZ+sBS8GSMYFcsJk9HO9LNXahIsS4mfWLePjh6VyHp8fM9J1ogn929EUE2kFa88
	3FID2Pg==
X-Received: by 2002:a05:620a:2591:b0:939:ca4:4d5f with SMTP id af79cd13be357-939137496c3mr2742560685a.5.1788170693727;
        Mon, 31 Aug 2026 03:04:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2591:b0:939:ca4:4d5f with SMTP id af79cd13be357-939137496c3mr2742548485a.5.1788170693132;
        Mon, 31 Aug 2026 03:04:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:04:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:43 +0300
Subject: [PATCH 3/9] arm64: dts: qcom: x1e78100-t14s: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-3-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ZkWGQwLzoJisDVb4/Hs1Em8NoZ8L8w+xBFg5ICKCII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVACYBcXkNwzazhD1n7+4lHx9FAty+gFC1xKQ
 z34gcdLvQuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAgAKCRAbX0TJAJUV
 VjhcEAC0q1vLrXGmcITGrwu7cztlRvyR7hF5ikABMMdJSXN6J4iiD5t9ghRr8EtCm+pmijw7RCe
 Vu++HQ+35PuZVPNxHLk0X2DNO24tuCivbQ+V8H15F0pU2uvUnaTcDt9KpgFjQurtjdNP5AnfNq2
 Z3TI3FyfoIFF6qn0QcPVcrZFhE+YAXlQXbYRCJ/567wv7HxoN85gEHn4VVfjmIroA0p1+WVDi9W
 tTQfPpIMW/2eqz5jwZPIWIKH8mgnDT8Q9JecRMlsnEIj8o5OGY0izUgEGGvelp7pPdRUZnSv9p4
 ST2n8+66KXVmZUo8buec9q4URsYHsDZ/ien5rEmxEe1/6LsWAtI/xoX4JvIkNZNs/q1R3hvv0Sw
 2tFJ0CAbTA4qlEihtIprFGY7uJlC4K21rugavCY5GMjeozjTpbGbMiZlcJYj5hSAwgXKNLXZzi5
 Z22uGf83oWjds1PwgQURNWLAB1JRJpZkjXTyCOBkf/uKqLMUqJ1lWU1dMe3ayxNxFupWs8ajfM0
 YgTvbTCxyQxseut1rUq47wBDgQMkSvh5/ezSVwZP9yVfnwMrpIZWLjABs4xOiSxCszl5o78pm0v
 2VufKJOn9ahOWMKtna3iLo1hIHNm4lx/O1wI334uHFnV94uVtxdTZPo22z/DARgX8Kgb0P3UfQO
 ZP5B5DwpejNtYzQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a9551c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=l8FgSqmFWaqY7FSYhIgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX8/XG/qHUQLcp
 u7P4EwWvSlHu2lZBmNnMBXSHvEH19v7Gv7HYz/ri3OXsLxPjdWJyxyliU2134XNLmTC3ixANjL6
 O7ZRgLpVcr25dmqLn/pf45rGqtaSIL/HSqR05KQDTfCaD3yLkYltEUhe0p1es5wXnNynDlsgJQm
 Kc+arQvjeq2u9lBBplXQFkrLgdz8clCfFbPhErULDYA1g5kbfdw0DE626BwLD3wTRl8tsUlEQ4U
 u7Bg8Zzvkcry3S/dcCM84CcnTBLg3ioJVmhQIcblhIH0hp6CzClfK2a6DC8IUuK1bq0FZTlZ+lW
 KvtDKuVB/i5/3a2yrfxCA7mUnjkkyKdJlbgrTdt10Lc9beFHDtZckGMaekZ/BkgqA40f/MeMbVm
 49x+Ft8Zp30tVCA6rDAORjSyc2A6LGnijtYbc4yM6cAL25RnlUNrd09WdfwtHhBmDYVM1bcXAzV
 Kww0+AYhMDq49odMgeg==
X-Proofpoint-ORIG-GUID: 4tupUCgCpTRttjpYodqR8WtZcyvRlZRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX/iq/Wr2JmG7i
 rzPCqqJIxpOwyZHNbNQs4NSF+dvmdHwucUvwMFqdWQOQyxKFkWyP8kOC0XwEYJNYZAXxdRiTDiL
 WaC18aU8nUmQNbTmCKM6e+pwe109qlM=
X-Proofpoint-GUID: 4tupUCgCpTRttjpYodqR8WtZcyvRlZRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a..8f7b01617461 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1385,6 +1385,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

