Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769349;
	b=C1MIr0lZsx+GcPzrhm3lb97W+AZ+fEZGqkmsLat5C8ay2gxdxfturp6+sGwpaZCoL79U
	 E8GuIXOjezo+rAX13fBG5wODhQWIyemA6gFcFsrFykQnqxZJo8G/CDZiHrVODubFDeTqQ
	 JH9MjhTvtDw1DraBoC3uJivJ0Z/sSUu/vrakJ/9RT+evzyDPXIKdDTc1uN/T1Snnfwbij
	 e9bP30PWFWIdDY4lWltR/anHf9wabv7jYieTBfvwxp7DGeiUBBVopSQdN3ohQK5c1mf1L
	 4GtJe80FxICsB0gEDCSF9aduJi5hckdctCPjBFUWrsJ9eOoQe8P3tZG2gem6qZfTheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
	b=ze7Q2vLygZiO/EmUpUkFzeqK+ic9+0W2sIzeDpHGcPpRXtAD8qS7K+5NQOAPR30K0AEG
	 HQ88gdH//1Adq8QCuC+8rSb/MgrqYUgtLOG3zf4fq+bMmjxLS4JeYFiQRRJWwmC9kCIfq
	 BFII76sjqV/uZQ9F1DNMEQi5hv+QRsG43HYPniYOZNWE2Hf/iH233E2oeNtXNAPpl50yk
	 a6IlGGqTXlBGnQisuFMq/gY6qLPehx4V0355eWKdEkvQ3GrR/oR76D2fjGa9E4JVXjoNA
	 5Tz9QaJv+1AXvWX04QeNf43R13dUfV8kV696POGIGA3TBl5QVh4klvIW839X1WKt6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BogmpsSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb5xSiq4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763660A2606
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0763660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BogmpsSO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb5xSiq4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6D1d2462574
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krTDg+KuG8O
	L20d9UWcUcT8ep5S6DmptVb18MyRohEs=; b=BogmpsSOwV9HaGEeYZRhGS/FtdA
	fmDw6HlGxdvIIQQ0QwfE+2URnTt9Oh6N99/z4SHvYCJHI1mlP3gQKYhf18e87tR1
	VGcb1icoFPq8t+hqaPu2E5YdbfdHyX7AqTXbbL/D82I3ZdAVC2+AyWIvzHAiqX4O
	Do6hxSTWLEmIbjizp9g7yrmykwF3W7gWDCvFhzLO4EyLMXSl33kVE/WRoqwu9X+z
	i2gq9gal+trhnpdZwBD5O+NmESJIGLnbPSW4yZ4v4KyN5+x/18NXD8ZKmMXtG7hJ
	5IUnQEV3elcNT5C6s2+1Dp7x+4ZmFs8ClBJ4NC5X58mQ9pWOBKbh5VGyJAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvbrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so186208585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769347; x=1793374147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
        b=Vb5xSiq4Hyp95BUskdkXkhHCToUbxh98S63reEYJr1K/DIFtkpiFpebyCu2PyrJTMO
         GswN59/G6D5HRGXbyjstAnwm4u1MeMQ3AMHzJGkVjivxORO7fGByJlbLaY/oGXbt+Fft
         M/p2/bTyENdm/Kyr9zmnRUwxiwK7zdXBYKgqNehpTOC4MAjFf6DE1ssZXeLNahYQXNxj
         50uqBYCPzag6lDOKbaPrEZIvdBV6GSIAcX0VJNPL4qtet5CaYBzFU0cZPRKalBvIGElD
         CPQ5hS+Pee2i8eXU6fvduOLDnwHsjxownVJBF2y92jhRDAde4iZHsOhU8Fe+BqLo/6UE
         C48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769347; x=1793374147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
        b=pE55j+H7UCvPnrcCjP8yQu0m8jejem0y+OK3rNtc87QMa/x0WV6x/VmnbPYG5eIplb
         Icsq3IuA/d1+V2ga83xRSbl5eh4Gw8VwT8bgvrmsTi6s/ig2nvrT9hFv0X/XYUhvtK6e
         hwJMU/mcpAN4AG8FDjo3pIkD9LYR9J/foMj0dPUUtWSDqW0fSkSwU13FW4CP/aGvBi27
         yXRY4DnRY+0VtAytHrO5AxtUbYSHjjBjLnBJy7mItDKvPPdHtIlVyY8KqefsMb5Yeqn0
         AvX3gmYmu5ATRw2P5h11/jLsi2lDOaPXVetPVFv+hMxdUdIrTM+yvwdGmkHSdGXmXvhA
         t6uA==
X-Forwarded-Encrypted: i=1; AKwUvBxDf5vWYGWFOqcXZOeX9dWLwchavnoOJwIfm3GproGHoVmJV4K1HJNDvVPQFsqPDZEdxsLDvlAajPF+37M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw98KudlbFzZup6bSXvhdYLYSBR9aCN7bb8CBUJydVJ/GQsHnd
	pp3l3n3mu4IED2g147QplVge4LRXOL0O9133rU+lty9qSE8qGsKUEvG2Hp/9gZbRwAna9ZakIMU
	BxguRbz28M3qo07SvnU7uRzmwBESWcDbJHnZu0M+6XOEva5okOSBQ1rTDoD7YEa+Zb3jmtIO4D7
	BJTg==
X-Gm-Gg: AYBFou3i5kPYWWCtO1908L7reS1fYF8FSpffgEAqzFjgPFKTOdWXvOXL1fpD9NOq7LH
	txSi4RAc33y3nduguGEwUC57bjDBI48AlhUxh3+GJ++1ErWwCD8gkSZb0ePXAXrAPsFYX49PqKY
	QpAOcu7oHnK6+6XlQ8b3FfCw7+vIM+IHz41Tie2qgPCD4g4BiPwHc859/zVKBtkv+omKlh5EfDs
	7NIaAkTCKYTtY7n34BoRQkPQ9GcE6cnv55Fris2UADXFEdHcvDa7yUjjDhzJ4xE8/Ln/Z2U/WQ4
	RosXaYqG/wOcZv0nL/H2Fti+5Udio6ish4uNJ1Hzt/Ko6bNeOdteVGivHPYN1EseVyH7RXx0g3i
	v/BsKkevo/wXTaJDsl5wtfccU
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr506122585a.27.1792769347151;
        Fri, 23 Oct 2026 08:29:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr506118785a.27.1792769346689;
        Fri, 23 Oct 2026 08:29:06 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:05 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Fri, 23 Oct 2026 18:28:55 +0300
Message-Id: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb7d44 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rPRfP_fVeLzQRQyiyREA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0pbK_kMbBlZb0ACMCLXTuQysx60RIpim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXzdDJjJw03QMr
 BtqduOf8A+HJxfPMDZk+nWPF/BE25OsQLa44udrkXzCqKjziFvPuqucq+wg4y+1KHOWde+DG+zS
 bW2rdfJDxCvVlp9mJ+98lZQwv3KICWZN6PKvnM1A0Lnif5qkLx1dFmVc+vY9nOAXyU8ICp16JHB
 Y3rEOJHNLwGc1T5emH/ELfjSWPVbKzEJttfZO8dA17oW74aZOsoJPhvO16/J4sPhu+0ITtC1InZ
 KrONHXPD75Z+WbijkkC3f6hKjecrUgfoMGNRYJA/TM3ZX/lvkd3PO/EiUtu+bPRjWnZ7A8Ybd82
 7yxigHqISacroW6CiA1p546MYndosOCNkcgJKnoLF9Os+oFKrrlG412PXSTi+FSeRshzyVZzsLY
 PUm8s2UGdZXA51UCBrL16T++EsVynOXR+rBBEkxqvdaMZ5GO3AIgSHXkhoTPEs31vD6fi2XOhWb
 UrHQL/l2O4f5mykIPpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXzewPfCxDlhg8
 +MTyFkag4WAV/OumbJTMGSrKgQBGzXo6zaeAEtQGyhz2wmNHvvVx18IV3eWFPoYoxk8TAErHMFB
 HVzijoz9j1ljWjKiOs4cRkX9ffaraU8=
X-Proofpoint-ORIG-GUID: 0pbK_kMbBlZb0ACMCLXTuQysx60RIpim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
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

