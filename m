Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193855;
	b=XUdjkjngp6eiAy4hvyEIVvE5WnwB3v+oxR1HrOG/NcjtmVzzW8UshHRDNglFz1RwyFDD
	 /V9qtAn3bzLhO1Dwea68smeCBwL85jGW9bwXh4d5cyb7tLS6BYM6Xj024zJ2BuIzN4WJ7
	 bf2Oe5MEt5PIG0Ch6+zqZQBFUVDwrKYFWdQ3Dy6vcq6nR7XEwXyb/+rytHaxQaFrc+3YJ
	 CJLWP/Wy8gJfMnnkkpMZFsInZkQjM3S8Kp9YP9atucwk03joy/r9JJlNqS8zVzptH4aba
	 OmTkZSI1izn+WwC7szKJzO5Z6DC8Hfz98sxn7TuB2VTOEYxg5q3uhUmiKnTrp6wuetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
	b=hTfsc4QbEYDBBM0Wb+fd6Gr+RAGFuHAw8U4ewHEnOqUsfWs54VZ2bcjijF3NexJsDgds
	 Fn2JV4eQ32K8zCM1FmycEKqaotB/HJgQWBgRz9N/7dI5C5BcCJpAIyGh9vaDfJQvNvLDj
	 fWn9K8b8lVkhRWy/eLhXA128iTnuq+p0VQBa7fiZO1xp6xFCZy6L1BGBEiDt9/hqfHgJH
	 cLvYhdjmClpfAKWXji04mAN53Yg5hi6Z78aMzyBiGaZdZ6CL2SAzpbIui0lvJVtJ9dUSf
	 LGHTxZC12270qktj/bncxdEkiwKVDiTJKmIz5HBPFjx4+owWGfd/yOHPIdY9nvLKTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW73soAF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kO95/ZO3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E99606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E99606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW73soAF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kO95/ZO3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe0L4691746
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqqwgC5/0Kh
	ExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=; b=IW73soAFUpAnN/CSPcKsM70fmxf
	lGA4SMy0oQDD4qy7Of1DN01miTzw3Ljr5Lq2HW+QxA2IevRCSQ7T9CC9w84wX2DW
	Jt20DxrtbrpdAs23FjS+MPgQyviPlDEiDCLLBP7oE0Qhhb+4SkbCUzpVw/aleB0+
	qLslwunjknDCSE0zGETNdtpIZF00K8JB6/DwiUFoHxMfwO95a2ztERHWSTUzyNWR
	K69yfyVi7SSX03VeHzxQrZsrMHgs2ef0xZ7iqV2Ih+kap0wQlY5OKtaQkkYBOf54
	JYv/JAzOMSD+yZglSymMvItzoEj2GbyRaz+w+eU0uMGqWV0S0tAD+9Qwltw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2ma7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so200705485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193853; x=1793798653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=kO95/ZO3Zz7h17nx2F3f9rKsFE/MQSpIYnIg7vNuKVwe2oZLKpKy997NNE5PNm9RyM
         bi17QBMfdbDpM6gPHA/CD7lrBtdM7J+A8yK/jNyzBRRAs113cdG6p6U+pPte+trB2zvd
         Q/pdxjbD8NZoGDZn1ll+WCq6TENjzCMhC6e/lrZpTBatUs+K5PNtiUcqKGgE4ta3jK0q
         xB0vvxrNjoBfGmir50aPG7AjWUI+kY4xutUmc9LxWPQ9egdjYIhzbFvXojqXBIDdjVVh
         xijVDi47AUUVxqWJRq9tZDsh5bPq3Iub64LJJimAVzpUKmepwHuUbeatWDJU6KgnD4FM
         CbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193853; x=1793798653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=k4PQxGpEYvH1upiM3YjdqyCKFFMXideDiYUekJqsfHJlaKXgXP9Rnuatpea5ItZBa3
         ssL/waRY/yQRlMg/kLDhMOUoTdyByFSUQhio8uJxoKj5R8ZLdyfVmlXI/HEwZG4wir2D
         lJ/b+ODzN2r6D7iYsnbPM8e1bxy0WeyG7iHMygp9T12jo88PaLUHzOIyWppLFVO6NKfv
         KLHkqjeUIoBUU5hu1NhKjfnbUByaD3O8FJ//JHYhRA+lDqwLr5uxVy0TH3SHqWAOcLCO
         iiQp2ISepwk/+rb6mSbGO+KPhzyjLQnEvvevYPRbEomii2Ce/KdEDZ9cUu/IFqX31W+1
         xdGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkvxD1BTQ9TtMfLaiCtOA+bbyQIZgkqGDZbSidjt+Gm/KnpLBKAy9pdPl0x1aiinMvD0vxKOpPdnQ+Se0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcaUFnei4+NZoxLohs3NREHC7zuQlj12j5p8grZ6l0HmGKvFof
	gKvyHk/FKxuzIU69lvqbaauFkJwqN8xR8u/2z/XzW6E8d4tVgSifv/4uLJszpMp7C14jVbaw1J/
	AO7+3tCDpzMdmecDb+WEnB7l+Bp9nk/ckJsnzlF2U9UPhS+ZZTfqNx90N7YSnX/c7Wko=
X-Gm-Gg: AYBFou1T6mpmK87TjHAXhfHCgVF4IO4YsJNi+lb847oLIZ0fPkDNcGy9Ysu/PjUIE6l
	o0TcI9TX6n/h/LGtfTzkgHI27ZnyvNz3Po6wLbauukmODNuKHgi+xP6bQNsdxqIq0VqPMoD7m9W
	JnDMyhUVsj6C3AuvKoW8J5yHW/eBKxTrU5I9uzvWPe2Cu1fqN9JnuhFjELWMuS3vdpN3MulmlJz
	psPLDEiIjRFXIHE4rCq6Vanonj9fsw+w96xyIjs2Mv3LWtZ38Mqmx4cDRQZ44g+od0gKwpoD4LW
	Q458Qb1U+GAYWieX2dSJvlebEIvQiPfEeVZv2duWN8Tp/hUJIiBngbo5t/0goSNfufnJNo/pU0Y
	uzeQDjg5hatuYgEB6frhvMWHJay/qm/vpFEKh3dKshEtllvrq9gGWecembSOUAzQJJBKF/c6oPA
	==
X-Received: by 2002:a05:620a:1a1b:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-94408d3d2ebmr305278385a.34.1793193853289;
        Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1b:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-94408d3d2ebmr305272785a.34.1793193852723;
        Wed, 28 Oct 2026 06:24:12 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Wed, 28 Oct 2026 15:24:00 +0200
Message-Id: <20261028132403.3505037-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Oin2PIGfw4pp1DB2hVgmk0TIGEBd2-7H
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1f77d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rPRfP_fVeLzQRQyiyREA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX2oPhKqhesorI
 dtFb5g4Hb6Jj4cGzodMyfUwfMmNgZ7e3UHbIQym9p9UKyMXdATNrqbIpOuJGpBiTZdOBihWK68g
 e5YOTvtll97D6lHI5yBGieI0RtVhwN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX1cHOT0EQ48y1
 wTG/rmzYbaL4eQtiDDyGRi20J6qzGa6kqy44dqeGC44eJq4eTzmLM1vgdGtzBr5FmBlBFeqkVIm
 jsD/V4yqnWVMS+EJLxodyOwSiut0BgbEa0EpfhkDTEZGjflggg4aLPNUENELFFjgptgMaMq0g0G
 ejRI8dvbtl1RDoyeKryPweKk9KDPBeX6+TP9qzc9FFKOis+1E0gqeueFHJ+Rx9GH8YoEp/STs77
 1IyI7RwfrNeA1yHMcywVec7iBdTgf6QbP98IhD8KXo3DtsYrLFOFMVo023EqbYv8QNw08jx4lm3
 eB+FgFjKIFPY7yGrTkiEHOW5PslLwde3A5cDQWDXLMIj7QouaFT5SCbiECKo3034gB/xhH2+J2U
 GPtu6Ue77t29RV2KeRcA+ZHmRZfStlQi5Tr1t5zYi9bIi5aZyMG9ILBvogZ77Tq3ma6b5lVf9Im
 c1MJX0IWU0iovDH/DBA==
X-Proofpoint-GUID: Oin2PIGfw4pp1DB2hVgmk0TIGEBd2-7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

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

