Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382304;
	b=N8curNpOm/cYRlpoLj1ryj9XeRT12hNiytmEBIoSQKzRnc0kr0crIYD+7awv8MYEDdB9
	 cogaZbhgxY3XDHtNI/q45Bz+zTl5bCYrm/FjbyAp6vem/IQVk9zUJyR8G7hyNS7COuWR3
	 zLa760+S1G2Ujk8JemHF3f0F6KE4xBEm4/VY5wltg6wdPpKd+sK/qzkr2U11iYb0mzZjW
	 RDaRBaA9NE8YDzkLgp4Lq8Igyl8YyikzzKftTRlCQEXX3gsbcXXBurGoLlwx50azF/mX+
	 WaukpWq02UJtrHGMm92JZmi28lE4Id64tGFA4iG2xa6EK1Z2l2+BDuoCzmBft0Md8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
	b=QSC6oVEKsh+49CT6nUKsim0w2Kq2lY9a40TyeFlIOynFaxLu1ACHhkUkHmE3n0tif4eN
	 nNe0SQJSO2xsmf2iSwED9Nt3hN3WVFgho8WEueK+7AaOXVGVic9oxexS8RzrvfR0Wui7q
	 XxvIwXjIoffR/qFXY/n1guX89n2i58AxAxGpIZOLX/NyKdl71cFmqXrJTQcLfo904TQud
	 R6gxyeXIxZ1VXJ57ZLVETcbP1pzpzcZYWLgwoQF45rgNtIaUBUE667Tp0l8SGGLv/OoPh
	 P8jwe8HGkhI7lXjX0FBZRNJJcPX+tV+aVc+/M6UnupMgaogj4l+4ZqrDwnnUc/gp/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UXz+UpGL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q92skLzh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041960A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6041960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UXz+UpGL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q92skLzh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KcKZ2017788
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CDVD0QzvfAY
	RnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=; b=UXz+UpGL67sbdG7Ow4iFGiPbOMP
	aBs0ujVFytXPNFjeW4Mg8ctqvQPDKrWOGENYGy3WZc71+/OfnhwNkpr90IQa8pAy
	znQq86+GlScawpISqhUnQLguxX2uGuswaRG52maayetTJ6T6y6ng7N36kW5FZIP8
	9J2RN72NRVCI0IPDBRFzbPcS7ngbTbliV8Zr5GbEdGBXU6Vte7wQTPm1bQtYkoLP
	roqTzChdZ1QdLIeDirUUZ9uG/k0NMIfExzfGu25Rab1qkfIYGaL8gI2eFxCh9mm4
	d7DDKgoIEh6ChM12fakqWomXemCNAbpGefKq6EM7NFkT4cQ/Qyd+FRHckKA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cagyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4723851c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382302; x=1794987102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
        b=Q92skLzhsbfQIp8UKc9kScf3zPUuutQU3aTNMvGKh/TOy5lGecPMBsfOXNQQIQeS1B
         jKpr6vJchV8BHJQxgVq+icFVRGtI3XyR+EuBS+J4kWzsL/zSU3l9rpYXcffqK2gXNcBj
         KH2WFkFcJD+xAxsoSssLr1CZJblCD3C1iQ+K2dUzd/UU21cOfSaO0Uo+RsqwyTsOcKbC
         MFeytZnkrTSo6kMl7DzOCTfrlQjPZ+cVDNgBf0eHaqaoTyd8lxmRMCrjCV7733fCmHJo
         xVGEeecTasN1ML5prDljHb2FIN0jayHS3QNx5T34afoUTUpLe2QwTJhYvI5idsTe1Hem
         GHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382302; x=1794987102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDVD0QzvfAYRnfrAOJQxMdsebcP3KKppr1IXtEF3kVI=;
        b=Zykp3Gqeer3jNkUT9LSSVJ59qWTJsXTZK9Kc/ZVfJQKCQzIpoqLP7cslu+IKkS4Zrh
         0Cqb7eH4dkDfzI7uhgrv/nRzZBZaxqYIBwEZYKH75FZn8svWSxsoiHCGd9HqhCmcTqIa
         7OJ0Kq2ARlYwhX61VvTxuGBL60mTxP1jGDiUtvYny8Bi9nZC3L5NKx7vrXYbOp8NpUsa
         Zz6r1WeMkMopo0F2wX9fGwlZVfjKPzlMnijnhcWjpQGIQvpzLTMou38K5LZpNH3tTEIL
         QNHv/P3ntiOjG11z/a8DLLEZjD/KzIfOipjNthHX9NBVTrZfWu9KAdFF4cLq7ifWn5tV
         P4Yg==
X-Forwarded-Encrypted: i=1; AL+hErEQuo0c698ddHS/V4hHp6VNeobCVZXcF1RIJHEsD4t0LdzHYi2lVwNOnrEyxAyOEjNtaNw1n3Ta9fgygHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UG8EFuBHqCEeVBQu0ufwJ8JdBucHniLwQW5cpFmx+y4rwzKnU
	JzJL33LzFrBJP/+h6tF8maWNf8JDbLfJirXxBGSiVc/qqs67zyXQLTdG3IBTdC/7K7xXZ3XxG9W
	zfVywOB5hf8QpbdxjGP1nCVI5GymLoTuqK9sMGjbkvQZH1tIxIrATYQMD/YhBFxH1mQE=
X-Gm-Gg: AYBFou3qm/h/h8a2YA3XPqhHI96HI3xNvf1f6zbVty7TQvmWk+L+tq4/PC9TlmhJfod
	AyH5SXd94Hvwkxc3sCJ0RFnFBMeppoLtUDF5GfUw/bIlEWGTIVYXEWDJWCLRRWwrncvkiAyDR2Q
	dOc99BJ4NltqsUm/KwPh6HXfx7K4/jn0Lym2EekVtYSE6/7Ryhy/V2AB+lH1cWIGzXCT2HYoIMZ
	cnl47+aAzlEgGMxiNRmz+sWkXCZtWtY48voXfNiIVsF6IQ5fCdxKPVBhVWQ/U5YwX5t8z3erMAd
	u8it3OlhfowdnLeVLzQ6EmnK/S14KcF8s4b54B6sBaGS5bms5VaEj8422poI+FiBFvJYltI6uPR
	yxXMTHd2M5zAD7y8FpHi4VNnitlqhZGyrC4yQwsKOgC0Ybtns/5lN/LB0fUYE2xexSrrvGksHQ0
	P4DE4q7UpURU8u7ix3xVltHoByKh3unOQq
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr2052015c88.27.1794382301901;
        Tue, 10 Nov 2026 23:31:41 -0800 (PST)
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr2051968c88.27.1794382301078;
        Tue, 10 Nov 2026 23:31:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:40 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/5] soc: qcom: pd-mapper: Add support for Nord
Date: Wed, 11 Nov 2026 15:31:17 +0800
Message-ID: <20261111073121.3707030-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX9sFoE7ZcZgK4
 FBqqn7ur0P9EStQV+wfp1iYZ8tiTzzAICwEt+rVdOm+BoxT8Oy7af7IwpMWL3ZbvzsJ3bX1gPEv
 DHQI4GW8gixh5Xxg8JFa6yIDe2pf2JEpCkqKLZhjdbQM3A6LArRIIDa/OawFigGkWkcdY3lUpbC
 wCTuC/2ZMJaPuwykJWnVzJQduBUxDEgIonmvQaVfEkjaEc2RzwqEXkEqE379JyXE+LunRSuXqV/
 BpEnbGgWkypmX2NOORFvZwmpSzcddc6WuHnRQYA8NzBkBy/pjtofk/MzjmaU41S0Z3JDKQm8gFB
 82Zk2GVSfHMRYUcVUJwiv9qrghBQKgdtg1X14B2+yXnknI4y/yquHycujs5i3pflaPyiXs/dovs
 qUsPR0/OH7ublpSbBmp1ZP92zP3tejpX8ONsw4pwsg9jEfHv/YbBbK49n/yNHwX0pzho65r+zG4
 OYWWurbaX0fYCbtSYVg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af419df cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HqhytwvpZ4pInVvSuXIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: aNRixYBgTf-07adc1npL01yn24CHk8WE
X-Proofpoint-ORIG-GUID: aNRixYBgTf-07adc1npL01yn24CHk8WE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX7FXb03/6g1vo
 0Ik2QiNudxiznTdcdCBQ+szNz8OKZNWllXQ0XQBLfGQe8lLyidIKJ/r4sP7WUYwXxOeRkzRiwjY
 Mfopi6VFo9suWLKl9Ut/kyUr2q3JpWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add support for the Qualcomm Nord SoC to the protection domain mapper.

Besides the audio and root domains on ADSP, Nord has two more ADSPs,
each with its own root domain: msm/adsp1/root_pd (instance ID 123) and
msm/adsp2/root_pd (instance ID 124). Nord also has four CDSPs, but they
all share the same instance ID and root domain, so a single
msm/cdsp/root_pd entry covers them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..0e2b7f4607da 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -277,6 +277,18 @@ static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp1_root_pd = {
+	.domain = "msm/adsp1/root_pd",
+	.instance_id = 123,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp2_root_pd = {
+	.domain = "msm/adsp2/root_pd",
+	.instance_id = 124,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -414,6 +426,15 @@ static const struct qcom_pdm_domain_data *msm8998_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *nord_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp1_root_pd,
+	&adsp2_root_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -641,6 +662,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,nord", .data = nord_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
-- 
2.43.0

