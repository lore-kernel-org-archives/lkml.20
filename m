Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568236;
	b=HvpRu/UzKlo2WthtbdzG5dTHDNVzG8e+ZhYVeQT7ObwcB9PHBmGWfq3rbxO83fo0dH4o
	 yhXXj8qW3s6rCxhWqUlXzU1T4POqqkO10d4HKWgOKJ124cRy4fV7jqv1uIew8RrxLDoq+
	 BvFlQqJ84jk2QkfOlp4ZkiAORvE5N5PdkeYvl0UD0HEtmPKSXl1WrCxoDWFD6DpUzCP80
	 VUTJQ+L1Ndc+SrMXNgr/OAjmq72kaG9uFBPTuEziTymQkWJdRm5Q4xwtoZ4pNgxB9HEKw
	 M9+frXcSwoqrulIsAZEuJcLKUd8gcVLESY8hYQ/rs87EnOMki5Ta8ktSrnRVl6Lhkug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
	b=5C9y20DQHCuDOXGZGCcnBd6QqrnOHP4rcwVz4swzfzhwj6C6jC1WR5vFDkEwKGmfqg2u
	 tx92Qcea8IElOC2HIieXoBPLakTPHXnBHrFBahz2tKX875GRXZShtPTSPCCATJEVafRMp
	 vzGlSOraHYt/lqvg7CrsCQYea3v5L8e84zxTEV9UJQZSBNo0dFxAO2QNnoaBwVpbpoayI
	 h/Ienr2mHnZPhjHW8J8pykaUjS71XepxsNEoVVSdTVDRqKUOfab1gCfCqBkKcF1Q+BDQ2
	 xf4O7kjgT6ai4rw5E2VfjUDRmZEIFpN8+RbfNq/J0oS4tj77PosMSXsA5xpbnRPMA7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fm1tG/RL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+GEyxiG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DC606A338
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308DC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fm1tG/RL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+GEyxiG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7NcMI468510
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/AAvIITa6Qa
	3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=; b=Fm1tG/RLzuNknjAnqrm5Ekto+Gc
	Ne5yZAOmjL8v40L8NXC4aHHtgsuoPyAzEMvJycUYQRwVlA+F9wjVQma4RXMneTPF
	+CbFUIgYVadWCZIdQ0OxNJoZMH/asT2qCmL76STRndoRiLST8Pf+Tg3WxFNyP8ZV
	9rRotP91iDNEV5b3s45TlLy/QKyPsQy6XUCvW/Xy3zYHBXNr7fViDFMEYFMl/fhw
	yK+EkWfqPHrQRCjgrGd7ThdXRA0ThftYyhDqIZtd7ZvZB/coCVQVjpvgpKFuPdZL
	YeoDt+6/Snm9wZSCBbeoFkpwGJZbRtIQCZAh854pcCR4I7IVcjJ0aJQ7p/g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjkef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so806268eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568233; x=1793173033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
        b=a+GEyxiGomce1dU93ixgduwpFQvC7DrZB4u9vlmre8szNGFX6k0qLnQhV6ClCXxMsR
         FymOp//w/d0ZuD4Es+I23K0xIMtOykNJ6f5W1w39n+OCq+VKryAl/fQRuF3sEdQk2CO4
         GOj2gXaops05j50CwdkGYKcn9H1+ezUKiXVmSCq9ANkybQlYh87Jqg1AURX/xG8R9BEB
         Ayn8pTfPbcMBTGVN1U+gNhc/ZSJG/HsiRN+RapM4kw9T6Fd6OWOuzFD29EG5cc4cEwDs
         4ViIcvmBZF7+ouJM/NPTnDKBy9MjYXrfoKTKSvT58YoZAXVUK+C3mL34TSpmGsjnT66J
         LBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568233; x=1793173033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AAvIITa6Qa3UKIWzhXU02F/rqH5oiz723Lh9UpDLKg=;
        b=uN4R2nDbkUT700C2sxsp2YXCPRi+E4dYv7xpU341UcG0oeMD/s0q7uJ4OP4gkqSOxx
         Yx+HEhC0Vk2bIgYv7TZZfja1ZztnN2t7T8awReaaklcoWebdHotPUdbuT3IFqVBAkTaM
         fhcFVcfjTo5Pjvmv2REFR3DXcxqDh2B8+GlYmJH+/ep4xqHu1+cZBfAJbTMkDB4KMFxV
         R8Qn5wn8ux7J7oiDhJl7gqVANwtSaaokXAL75PrjteTYFwk8QgpR48Uw4NCrvjZwM6v6
         iS5m5H1WwWLc5kEIrZOGQar9zQn8gIRE7sGem+wUKe5DyaaeZUO3FZzC8ImvLkPrRvYk
         ViNg==
X-Forwarded-Encrypted: i=1; AKwUvBx0/Jip439lXw82UBmIg6eY40YHnT9BzKTW8yQ7ywDSSyYGVjPgOsSFsJ8BEl5MHgvVDxMAVhxyyUCmG1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA9+Z1dxLN5EVJMrRJulV3Cjp3fP8dXMb6fB6BtIcAZRPXa2U2
	5rPxxFsG/Tm+scD/WvmbQZ2Hlc43WUgsN54gD+f8dh6j0kufwGM/v+XD0iZNOzJs1c/p+IWYUMd
	T+SnJp2S2ZaoYl2TZ747e8A1YpGSK7lfIr/gmUau4Ep8fGHSGGsd67yJWmVTGLndNb14=
X-Gm-Gg: AYBFou19cTZ75qL+LehhW9Xvv1wZ61RPzL9NPCwiZlRyZVtAnwMW3p/rDMT43biWFIS
	ewsMkgKLugMQLngHZF+HWyw3NbC0+Qmo824Xg27JBTjlXhcPLFVUThAnKZEr+ZQR9k7MAV7grkF
	dizrRcypEPAr62+tetXn/255aJROv13W69Cx8L0jemXO5Er8GhBPBiH6y8WJLkKt6SBZtONTJOh
	98MRJWYyqPd/AjMgG5vcxiBoW6AbAeTxg6i3dF89MHbahIwd9OfVrm7+Mqf1vahvUNwHJbXgh4A
	YIMHsbJNfnVRWn0ovRai+2E13nzyf/A+bxz2TtTKNUTrrlAb4YhYVPoJKkgSLmchKyG5qbxbyUU
	H1AjU0tfZrudHXw6e73WWkliNtUoDOMw7NVIYv0sjueZTkYgMF8OsOmMDoBs=
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr1772877c88.19.1792568232687;
        Wed, 21 Oct 2026 00:37:12 -0700 (PDT)
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr1772845c88.19.1792568232081;
        Wed, 21 Oct 2026 00:37:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Date: Wed, 21 Oct 2026 15:36:29 +0800
Message-ID: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXwfzIXX1/xS2e
 RTfmZBOHAwrM3TJGBIAjRKFqak4aVT/1SnuZvBjBjRCZnR+fm7rH2j4yakP0YA80v6ypUYcZdcm
 0abcyKMwWf+jcaviG6n7uJHhHU75R2+SsENGZBPjHut+e/7ofcfikplFFbh2onP6sb9Kj5mePCk
 yFsXnUmDlhOShielgErge2Ud4lN03czsW8BSd8vMTBdoocd37RCcopNoSpr7niUCyvoySSPIqcb
 VahgPKIisrD8/Eaan5PUZgP5VPHa3QHERzRcsJ8Lxo/6wpTt8GCdQ/S5HJreiRfdsdmeFXujv3g
 2K9iX+ZrfMFGn4Nc0jmiWCU9GKrJ8JnP1Wsq6R7dwn89dYqYMMSKB8RWqjs2c4f+taaam41FcM4
 hCyBJv9M/FkMXC/6M4CAshuN6d42b8zF5eSbeGUnpHsU93mCTR6t139tmgd8oQSJoC2U3iIZPOB
 NmaNZdeIzw42lKy/+JQ==
X-Proofpoint-GUID: sZZLXYFvlh79zb5JmeDPZdjDPXoirX1c
X-Proofpoint-ORIG-GUID: sZZLXYFvlh79zb5JmeDPZdjDPXoirX1c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX/6+22ntK7Qo8
 HpFkGpbuOZbpDFpmrIw3sSlWnytHJY19SIaPM1rl86xigI+37dotsqSllBlOhYAOt1rm/lDo9+W
 MPjth/doTiuTzI2au1aW16Hkr+Oe8L8=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad86baa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cXETwVyMbT8LRi-F-08A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add support for the Qualcomm Nord SoC to the protection domain mapper.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..6dace16a3b8c 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -277,6 +277,12 @@ static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp1_root_pd = {
+	.domain = "msm/adsp1/root_pd",
+	.instance_id = 123,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -414,6 +420,13 @@ static const struct qcom_pdm_domain_data *msm8998_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *nord_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp1_root_pd,
+	&cdsp_root_pd,
+};
+
 static const struct qcom_pdm_domain_data *qcm2290_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -634,6 +647,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
+	{ .compatible = "qcom,nord", .data = nord_domains, },
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
-- 
2.43.0

