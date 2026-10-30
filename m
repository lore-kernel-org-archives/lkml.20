Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363644;
	b=Vp14ngydz7GRhvmD98EQQIVtb4dGhwD09fawGHSMI6/bcQPT5j6TlmYVzVRlMNTpP5al
	 DwLWcmyyJtGlgR79c2LG2BD2h1APuBM4951RHhYoh57KiS+Fa4qh6jjtYo1A676cLYD9p
	 J83EoQky3f27v5w/ehOwRpIwd1QZM70oZu2ON5CIFpRiUcrtPPoOIahNzj7utu2GGbtr8
	 bDoqkP+JNfagw/wLceqe2GiOMgrsz5hj/vAa86l81Z4rFCwdkoyr1pQaZfKxm2IIkpisX
	 7B1gZlT4vcBavneoqCgio7AmD0YF8hVcpa+GuIiJYT5nQrFzCe3GuVTaOeKhwtqHJjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a5MSYJ1rGcM1c1mD8vQqR9kzodi2jfXNa+CuopkJDgQ=;
	b=mUPXF1FVdN8asl4kXtywAgj85IMz4DhafApuNaJJhWG9TNybzek2q5HtDMy7SEQMCmXE
	 PU9yJWyaIscwySp4CyDGv58Giv4qEZ6s4fSSWXNimQOgLlg3FJMdaQa0sF5f4eJpULFkG
	 z0hpdp+Kp+0Q8ByMMbEnbCGqKO6L/YNp3EgcczcxBjBd05CJ2hvQCHK8bcDeE5XCY2BlL
	 xWVG879aih6+0RASoY6Z0Ycws+mNjTM8ED3fv9k2Ou3UnGJiwMUE9tJjdOIW2prSiBp45
	 YKP/j0uVGTg4tvz8XJU3lUhZ/zsmD3dwicuQW7rdK9090PYIgM7+tZfMnMCoiMYn7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG0Shqgz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzNsTBWm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD4E606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG0Shqgz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzNsTBWm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8Mk3719508
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a5MSYJ1rGcM1c1mD8vQqR9
	kzodi2jfXNa+CuopkJDgQ=; b=JG0Shqgzz87tgU/teD+t9DdrX/PY5OniKw1eTE
	oIroYBEmVWyQDHXYXvnLAsVLlE/jl4lyhIk1wDjjIALbbLdA4cTi0zKuvMk5pWM7
	DSnlPBmwnZCpSY2tHEs2sQ2r5Bp0HTJpTOcBjpD81hZ3sNNkvBIg/BQapHv1+Iua
	iSmUgRHyTLeCgJ8ewTZpB3/0wOI6p0SiDkGfanVWuurg47Yu1YoFyea+a2eDrPK+
	YlyyTrvGNWfBjcKXmwWAuux5u6hJyuHWpZP15B0bWA3Q7ZHDHyrjRsvoE5YIajJ1
	bgBP8vEaE+jxKnCtHGj/RPxIEcI4FAl4JrSuTTCCICrYMkiQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu0db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:34:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso651610a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363641; x=1793968441; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a5MSYJ1rGcM1c1mD8vQqR9kzodi2jfXNa+CuopkJDgQ=;
        b=ZzNsTBWmTLsIvSxwGLXt0HdQPhZR9q6W2EID2u2P+LkyVBeOrJYczDFuMyGuI6Q3Hy
         YFzV8t/AYmApU1TT/jwlKgwVyxXRlF1Tykzs+R2B8CaWGt+h/GBJM1woEzCM4qatCBP6
         mBMLA1Mv+pDuoz5xCmZ+cQNtwH5Z1xbXpD/5+PhmCRTPi7hGeLcjp1S9jypDsnsHkSd2
         Sb1zK2ypRPbitIduPa5BZofkG68RUcJj3r3NJEeCijSnoSthR3OAGNg9hDfXBQMI9Bv9
         ZkQtJcvGD0xOBO9mVNh7iGItK51d+wf8KawFojnzBKTiIbMTwpcnmMpoEubr6zXq4k4Y
         NLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363641; x=1793968441;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a5MSYJ1rGcM1c1mD8vQqR9kzodi2jfXNa+CuopkJDgQ=;
        b=dtxDpNlrNLEcSHaQMV1nnZGDPvZCBSrtBBPINbkSgbRDg7ppLd6Ps/bkowvkXgvScz
         AC536JlNFacVPMUShYwf4cSmVX7NtyXqQtF3t19KPBfz/+P1ILGpfBIXaYpVU6eihMoj
         tHoqSJpVK9gOfoU2/Mj12Tl5o26vTHR1AXEK33EBkrfGSiHYgpX5hBXLSxC3xfzkihkt
         2556WE5IYSbCxu+QZbFRDHHELoc+WVYd+GUsJC/SOZijjyYQODOXlXw6iEeWM3h2LpAi
         xzbSkVjpsbbmnC9YYsZqrIkJhZ93w1aE8TmD4BE2eMvOWEYu37hx/ZNzd2cwcy43/Csu
         f4aw==
X-Forwarded-Encrypted: i=1; AKwUvBwJg0WQwSvbEm5ZPIQuunpY8GwcmHapJ8LloP9KgXZ6yaiof27qhqERC0sg9MueEjh++2iGHHvjcMsmuG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGWpyBMqlEHzJDrINJU9sOILpJxCZsXQploA4Jy0f+vmAysAfP
	AKyZYJYiaUOj3TM2q36eUpV0Av8ry9XLKOMsKs1ey71IqSmVE+YQnXtPeaKqbYJk0IPO9efuY9z
	vbTP4pIDPc14z/dzzYqoACHwOnoG+myHC0DlIlbVs92SA9/Bt1cy2sOHAuOE9YeJDYtk=
X-Gm-Gg: AYBFou2q77i1ZqM7mp5fET2CxIkhB9+TrUjAC7uc3EDLjFhbXCFnSPTQOAUGVjdBq/Z
	KRGbK3IoSmWvHQa1eotJQNxTKGCSPD0z+QcHJUWW8BqRRuIQ6S77Zn0nwmXSWs5YH4FP+hdxfcD
	VtZ7F4qoK0sdiRotZPDx5fS6lJQ+eNIRf5SIQdp5WkyrALRcZW/O0uTZIUUL8o9t6mZu7e0ZS7J
	4bXfPa4ptjr0Z68rZX5n7bsYp5VnTMUDbJwGEQLwmbw5o/UGNPySNg6zEv5+orFiRlts9WqBcO1
	xcJLieNo1kV7TydotNr46Rx6OAiiqnkCssao+wOjavY4lIoZ6/kq7ZHkSPjxuA3xNlvQmoIVDOt
	RmDX8fA1YEelif1tIduNTffYYK5k6z7SbktSgpL5deQyVsWdTGrRKONGpeAPpDseTuMJbXU6pUY
	w7vX/OMknx
X-Received: by 2002:a17:90b:44:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae896f8546mr1840017a91.13.1793363640946;
        Fri, 30 Oct 2026 05:34:00 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae896f8546mr1839998a91.13.1793363640429;
        Fri, 30 Oct 2026 05:34:00 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e944ba9sm8548468a91.8.2026.10.30.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:34:00 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:03:56 +0530
Subject: [PATCH v2] soc: qcom: pd-mapper: Add support for the Qualcomm
 Shikra SoC
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
Message-Id: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALOO5GoC/03MQQrCMBCF4auUWTslTUlaXXkPkTKtUxs0TZxoE
 UrvbnAhbh588PhXSCyOExyKFYQXl1yYM/SugGGi+croLtmglbaV0i2myd2EunhBY9t+39dGGcu
 Q/1F4dO9v63TOHiV4fE7C9Cuo5r/QeYqRBZcKKyRjGs0Dacv1MaRUPl50H4L3ZR7Ytg9vIpHHq
 gAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: AzNDVI6jnsEzrNpEI0cgZZPMWB1fX5kO
X-Proofpoint-ORIG-GUID: AzNDVI6jnsEzrNpEI0cgZZPMWB1fX5kO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX3nySblMqQzNx
 Mil6KzZegcA+7lxPqqjO6eGdHbe1oHdFYyygUwsSUdsso7CQKuJzuwFlTCL5QRBkMd0SaC9E2HS
 mErZysApdw0W+Ud5RSaQRLVsEoniy3P1yZRdVwpBsZsydCpq1roVLdvc4GNdXCtJjuzlUzq3Lka
 xV+n0jFrkP8MQuSpgBQMs19cRNaP4ZwZ1sYowAIVdHa8KF49v8lOk3cF3I3yKKO7Q5efST1mwuz
 K0zo3eIpYegoTXCkU3yIqge/yNTWnonYuMqtdAAte+Z4E24Qh47V6A521Agl4EDWaP92MqQeq2M
 coge6Bw5GZEP6cl07kEu/i0yu2BtqrTA9MvwV7pijXQeSN/0CgXsDpQb6Evch4L1NifxxKvIF1f
 A09pQ78XSkFvNjDr+36XBOVoENTSWJjgs7YvMdhbKD7UXRxr6hnN4gxQNf/mExVdqgpm1tLYBZe
 9awTmKxZvKhP9OdejFA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae48eb9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7krsQZ0Oat1KQVfDmrEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX6IN/fb6GM3fb
 Cgmla3889I8eeyoFm08HOs+LQzJDg13J1j+TiDBebK6JDVXswFi6gJ2yWIOkWSz0XZy6EUUUCW6
 Z4IcjAN4JGgabgzYpqQsMiqDpd8R65Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300049

Add support for the Qualcomm Shikra SoC to the protection domain mapper.

All Shikra SoC variants (CQM, CQS, IQS) share the same protection
domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Add support for the Qualcomm Shikra SoC to the protection domain mapper.

All Shikra SoC variants (CQM, CQS, IQS) share the same protection
domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Changes in v2:
- Adding mpss_root_pd and cdsp_root_pd for all shikra domains. (Konrad)
- Updated cover letter and commit body for all three protection domains.
---
 drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..9e456ead9eb3 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -498,6 +498,13 @@ static const struct qcom_pdm_domain_data *sc8280xp_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *shikra_domains[] = {
+	&cdsp_root_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
 /* Unlike SDM660, SDM630/636 lack CDSP */
 static const struct qcom_pdm_domain_data *sdm630_domains[] = {
 	&adsp_audio_pd,
@@ -644,6 +651,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
 	{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
+	{ .compatible = "qcom,shikra", .data = shikra_domains, },
 	{ .compatible = "qcom,sdm630", .data = sdm630_domains, },
 	{ .compatible = "qcom,sdm636", .data = sdm630_domains, },
 	{ .compatible = "qcom,sda660", .data = sdm660_domains, },

---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261028-shikra_pd-568b9b35056e

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

