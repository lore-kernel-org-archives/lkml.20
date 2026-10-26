Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021862;
	b=GFcozia5OqvcQWJ07dzl4EwQRiU0398QZd4+ickhKKcgUzEhDDOph43FtVvmwcGkOBI0
	 /DdgQQMgIVWzbAlRTxyD7Zqe1YIbpKA8utijgMZsmo9XN1XL2luY0omJluHhCJQG30Gh4
	 HX+SppGTjoC9Rc5AdjEI3MJumnbDL+YC8Grd435j6womJQHVSC23ARUNH0JTFXMJY1vaG
	 q1ZZK6kPejJ5s2t97jBoy7DHMhmR/L6gY1aiNbRZO1mb9VKgZ9kO7zFAYJwG5Yr5TBwKe
	 R6SoJfCgqszonTErQjfnzChxeoLKgK4xKYao7LNPORgOpIXzNOXy6r1nkIs500RO1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
	b=gWjw1wiWZSFdvde2VqhTBDYZ4L+5TvCH/LXopW4IoW/NyPV8NF1qOsLpZNn6PlNyt9K0
	 dEKl0qIVIsa8q7ymY4OXyHWt9nfuLUfEWQ68VBSv9Pj3x9EiCvADvxNlKroZl5mXTpSHU
	 e0YJR5jiHs/3WhuHamZEdD0uL/ka2OQOP7WAWK+wKoEE2f1KUZ1rlIu2OkvvcQxUeYjQE
	 BatKHM6GfqjjDQM+emp+//CJ+ug7JVzDyi45ShaMBaaKNznMV5N2TWAlKIcKeOjIUdz+Q
	 tIa1b4BH7LsBDVg7mLPflaWrEyFeI/TA5Zwjy6O3jHQO6ews3quPQF4Dc01jtupEKIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Td0jXBRR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By5Qbp60;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4B60A6F75
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE4B60A6F75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Td0jXBRR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By5Qbp60
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYWt1547962
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqqwgC5/0Kh
	ExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=; b=Td0jXBRRjKe7S/xNOMQUUgsQaGl
	D8UgnqBwonpHZoea/NgZqIdrx8U3oZrHgpXaGklk/AIGcYbsCXC6c+px0R9FtVaU
	L0oeNdVdqLTZCGRxApMMfS9q02vYGOsLzQzZlQARkv1MwWsv0SxB7jGiDbOEf3M0
	RvMZfI318wRPWPWTcdEmMd/zA09lxPF5+MYM0MgfqHkQ3IHr7WKckrq0q0Jj5nlq
	fX9VKQzV54bkXYiraPTcXp0iORfBTvzYB1HaV7BBFTpvoy1dPLIummA1ANsyAnIv
	RI7WfakZ/ef1Hawn4q4/QeMHxrgEbR6aF/1zGooiCkDcPGThSsAs6zeFZjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstnq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so606958185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021860; x=1793626660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=By5Qbp60j1ELgcHC8UnlOOAAZgMi/xpiw8AukN+4OrDdntPftHEzOpxuUVWE+bl8Nh
         otgFbAngZvE11ElXcNomkuTPVhe0OrIhLd8pWZLzARB+IzqZyXmxYZ1QgOmZEYtTnTbg
         9P+JofF95BtaEpO4Jc4C8Tlw9JRFaY6Tsn/O56xRxco+Qb/ltVlTLtqgYfOvMj/DqqnL
         ekRMsZrZooQ/CHB8IcKFxFteXwdsM01VyJWaZIEOlIGpBp3Im42UpZb3FDpgQqE+MqOZ
         3wKjeF3rY0OyLh2KhWQCsfZiPAAP+tnVN3mlzhzBWbojvneVy5SoEZgZdIxS6w7YMnt6
         qpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021860; x=1793626660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=Px0TeWuyqbniaazoJllMR4s3mLMGoryP9TR5cNa7ysleGxMtszW8UoB9ccGiFxhLHL
         31j5QCHEAJolfd0r7ajYNeq1J/o1HC4qzQj7HpqF4aXGxxQwXKP0Zm7nY28rVa5g9kGd
         brqgEaeGSNzm9IMLBBDPMHPdJG2E1ROcg5FUqOLFH4g2KVqNhE9w/G4PNel0XPUqeuCl
         9DCbhEdvjk/J6vKpcssIuOYdKqfw6inbBNdQkmjN3PIKdKJpFROZJ4+alQI/i8I5r4Vo
         Y2BbuF+UgK10m77GSUhBzOz/DtYv05/7SLfTPgMo+mZ8rruVYji1W5+s1co/fqm5hkwL
         tN1A==
X-Forwarded-Encrypted: i=1; AKwUvByLvyc1k7btPT0T/DFk46SjQbRg2+TYWMK/O9WLdXMyMVdDOU9M++TR4Z6m5gf7OYsv1WkCj5iLNlr1enQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJFR0E7OkXWDa1RO8aciNzXr4omnUvmRL8XofqMofHRJzgM4+a
	lL6wPCHM4QK7uV4rLbF2qnRa2Y9sJeMinERryetzJ4ySlD+63MwDlE8rJo9QWG0YixqSBJe7F5P
	pM8nEwP9zOs4W61OiYp/CbE0vPyaZNL6HjiZaBJNcTv9yLMyRyx263t+RbOatsR7l4Sc=
X-Gm-Gg: AYBFou3vD+oD6SSaLLhfOLDzkyNeLdGLFOnEKJTZSSEtHlA6dPbjscoc/IeBsZYFpPd
	rY+CaPvkiDz80tvrPbOSBu1GWU2PlV+QI34vUYgiNZ4JUWiMPqji+e9CpxOe9QrLPKRKADOsYK0
	4ssdDU7KOfu8mkjp7KfMmT6wEKXNg7jwfrG7xhRu6qL2hxyNh2ypfy1Qx98TyeXrnqQnx3LR47f
	viuSaG4p3PQcZ3IChxPm6qQ7cnh9CvOw0c+etNc+oahM5nv8qSgJCcEo1+riqv7AsqdyiNu1Qbg
	qev5PfjslAq3+U5L+a3MGsCY0JCv/wD6gSmdUvA4qCpJsWmN5f8CS4xaFiHqnMS3rj8OSuT57Jv
	r0hd0+QZixap3oL1bBaQNBgxE
X-Received: by 2002:a05:620a:4725:b0:93f:31f0:6a77 with SMTP id af79cd13be357-940ef91b688mr907175685a.11.1793021859883;
        Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93f:31f0:6a77 with SMTP id af79cd13be357-940ef91b688mr907145585a.11.1793021856525;
        Mon, 26 Oct 2026 06:37:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Mon, 26 Oct 2026 15:37:23 +0200
Message-Id: <20261026133726.3249235-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX39Noffzf8zJZ
 Eu7bocpe/0gyPyL9wzpIWrLPv6Z2DfcsdFtXpLJYMTWisCrWvFnhyLd+OT1d+tZNkddU0S20FUx
 WQlZyyIITLPuBBRlfAywtgbgo4dOIyk=
X-Proofpoint-GUID: 2RI6jDCHuvh3cvrAOvnyBom6UG_eQjhT
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf57a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rPRfP_fVeLzQRQyiyREA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2RI6jDCHuvh3cvrAOvnyBom6UG_eQjhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX/ELkpDDPpvZ5
 D+K/ZxSGFRpzPl33T6YPFcx/Hy0kcojQYoctJ/XzMA+FDPtSfvnxsfgxGjg3DnU+Ak/oLVtKhi+
 +fHhKwv+rUhZQLg4VIriEIN6VeDFDW4Ey+SMRPs1ANL76l3jBy6dSJO5C6qpG3jlNNQjDML7iB/
 WtBAo0DPPTGVvNmM+YXTr60le3INOfb2jTcjpUhqi6yAMhO/wLhDZTlnccW0ApySteRMRkv9ZRR
 71I2ek1AskjRlydIAIZtihaYzcz1HJnwafko/bgHYIqGlfpmyy0ACvd1Q2ovfsZ4cTlW4o/QeBu
 ZgkBJbM9xRvWz4XfixvriLf7BHLDOAMOVzQjb5kA56D3eaNakFiGhp0kutXY219KHYJFcBFQouS
 cF4T+xKxqmWMHRHdLiokdy9eGCrwpND4LbLQZhXGQtrJ/JDs5bkKYV8i8yw7KtdX7RexM4K+Dzj
 Rr4bO3FHajRAKd856DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260054

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

