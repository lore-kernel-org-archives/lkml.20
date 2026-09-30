Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565136197E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734080; cv=none; b=UsmjiesOtrP8hUjNXNWF5Kt/h2rByfu0th+rM5ByZKtb3vyTPACAx5ERS5upTIv2J1WXBX2QtuwwNjuC6CXyqVynugl36IaU7mJhjbZe+jUxHKsJWzqHelykMdiHkrU96C10BhaZWVAYAxpTrIsqIgOALejI8WR9pDLcEszl2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734080; c=relaxed/simple;
	bh=j1Ni7tBKh1a7tkJJg9B48MG5RjW+DM36zVpSIvXS8uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJO4xGYxZVqg2Ev3/BFGvaW5h7AqVwplfDUiIE3bmIGMPD0ZkIdAen12El0eTClNaWtMyDURRauh44v4N7PNyfAm6975QE2ec/IYZqyCp7iS0b3tf3rUg4HvcaOksH9Doumu8c8WpsDrMx8FI37dYnOKMYUINoV3FUnIZhWuwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pewoM4yg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SovKqDFO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pewoM4yg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SovKqDFO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1AQqh1264055
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTItptXsNpsX0KmzqsHPB3FdHZtYdhRX31N
	Ltm42Hns=; b=pewoM4ygPb/I45bHNgJYykTXzvNTWt5Zxt8UcyMTfJZFLWWii4Y
	oy9gpfZC4P9ac3eBOQX6FHyvyrDt0yWJFMcme1L08sHeC9iwwAmmYQC7ICoNnk6x
	ryLjo8MSNdnHfJJ+cTXVcewlrHfFMGjfwlvQXCBqmWr120zhRVPP+7Rbhi9rltgS
	6M5YzNF2LePH3QR8swRYKPobgvPP6AlXrRY3Kk34qQimiOEshKlJ9hD/8EcssSsl
	Hut64VYYhTI5Bn3Byd1f8JezYxuvYJKiP/HcmqE9xON9e3kEpuKH6+Tvn7AZ2h5v
	OdmrxjLcAB2kAGoWpP76fwjIF5oUetxvS5g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheg6hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:07:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so1289608eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790734077; x=1791338877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTItptXsNpsX0KmzqsHPB3FdHZtYdhRX31NLtm42Hns=;
        b=SovKqDFOqsVsDY9adgUuKgA5CJ6JCoIpZfK7SVEowcVQdUZW9deMyLU1R17qsKRuM8
         vYOthmDSe5e3eN66zolkr675EZqLTYln1hAKXPX4Pr7mlq7/FEoRIY7WcNTMI5fs7Wum
         BWP+KOiK2RG3fT9BFYCUQvNeXgc9b5vEHGcnWQYh8iSWwdibhQlvcsC3GCGtp72E9ckU
         21T0uuoHNTm+YCH7q3WpT3+74uOFDnfiL/22XqkWWQLpXjQ5BgQtVuQucYHugL4H16Ju
         4IQOgqMJgMmuQmbjwS9ozpKxBJnOH9m85nnVI0WiQ4LenQXt0iZaEi9R+W6vZPTKZs5g
         6s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790734077; x=1791338877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTItptXsNpsX0KmzqsHPB3FdHZtYdhRX31NLtm42Hns=;
        b=kwyT8F/aLDO3DGWxZMcBa/vTIn+TAR3orEegDS9ozJVl9WbXdk95GipcZbNbKuS6N+
         lTJbAk2pUEClqUEqy9dhxMrPYHUJb7P6dt05yZoyqJy7YXY2WnqWYe4yq0aZY5FTCMe5
         ZlMytzPbXgl9tdGobhsOt21iQqTTVAe0lYSXuKg+1arzvPgGHhHaUjsoTy+sc5q9+CTP
         ImN2uFK3GlIhJR70i6Km3pa9HKRSjDzQ/VFL5Zq+GnqvdLGPIWB91mNXbOughNXPnIUB
         lrrgXFOJmAG1A7jv2eX7+xDB8kXnzNFLAF1T7dNPzYiUjr77gJlbUiTGTYlItKr7RkXI
         jutA==
X-Forwarded-Encrypted: i=1; AKwUvBz3QXxVCgp6o3EqlnBIeHHgmrsQmjXIU4pT6E7dRtcDERe2f/jSHYGyt7ErQ0pYuP5qarEilHOHaTmDU1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTEBwoCOnMlJajaXvowKVsBWSgbwNkojpU7YJLLShHROztpms4
	UrCpANubk8plKhs80ttuXFIZkXJd+4z9T7qprHjhL/BEmPbz1S1romQ87jIbih9IOS2Nk/zXl+f
	wAGG2ALI2+TzSsmptuuUbHE3rsFQAaEVMGZl5iMPLdBYTHybpLcDCYsR+6Vy1Mb9OsTk=
X-Gm-Gg: AYBFou3FLqBgYh1AXLrXsQuECHPFB8zz2EHmQ6wPwBLK8Xrxh7pn30aVtLegoHF340O
	bTbURrbpZx9iCfi3YYPVnRHnN+86c3hrBZyRf1EXjkyx4u7LGIrjQOw7vRX0rEkSWBsjl8/StfZ
	QFRcyPai7oasLegza9CMNiD22G/IsD+3fWUBr4MXOPA5AxfLxLnxhxpQqLOcmGMV3NPz9iv+49S
	lVk1kilY2uOOtBF0r4lnP8Y8L3eUPQEGb/6UUBoelI+j4iT9GjfRS2QlZyu8hmOM2+RHt5gY5lo
	VwqY0YHql7UV2SNVrkN7I73t0kaLsWzBB3S2RqXmfUx4K4Zy1HWHkvpZoGWU1gPmQPVppf9m11x
	fURfE+wZZEgZZ+DuT2DNNWij8D9yMJrOp1KPvDX23p8seqh9xiSYyAsQoAIo=
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr196171eec.17.1790734077105;
        Tue, 29 Sep 2026 19:07:57 -0700 (PDT)
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr196126eec.17.1790734076558;
        Tue, 29 Sep 2026 19:07:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm2782812eec.16.2026.09.29.19.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 19:07:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord ADSP
Date: Wed, 30 Sep 2026 10:07:45 +0800
Message-ID: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ItaxXctnAyL3vvXQ4R97nohKk3nNh2HA
X-Proofpoint-ORIG-GUID: ItaxXctnAyL3vvXQ4R97nohKk3nNh2HA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAwOCBTYWx0ZWRfXzY6pqE3wylC2
 w1D9fTMFjUaZi2F3tTyWywZl30KkbkQDmjvsTbooMC8NCUFkYzstb9ptQRau7oT2ATlVIM21CBD
 kBE/QlhZ9S6LqmBXViv3wxAuA8DXZ/dby+zLHjEMIGo8D/uO+wdgaiG4d6IcvEOgR4O0mQdKKZ6
 +xlcWQeHKJRfr/MNmUYD3pF2fnoHCQ9ICyHeuXMThAdvzv3wNT5br4lZvHyocFC5cRqMgDFcgNm
 /JpGwvFNJnpKJRgWFnPZzegQjwX+FfUcnBFGB05URCVrx7znfovIn7M6rTpTXBTlPTJp/AST9+0
 8BM3A5GI3ruhzBXhwnijiknc5yIdPBvHaOiq3JviYD6fffAA+GQSX3W/3uaesYTOCKTTc6qNyJb
 E45gL2CvOcEkKVXWBVio2KrUxlbUmaSDxV36xhG+1q2leXHyZmqMYHSr1uywhdDoyD09mBI47nK
 7MMHRbAIfuzgstfvVFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAwOCBTYWx0ZWRfX66NcCYSbfDNH
 7DpXguC47GBdWEH/GjUyzoKbmjDJJdwQiQKZD16haPr3P3wJ9+ASTlCo6kRHKeFO7sW2NpFe1xQ
 z0JlsZxPrE9kHF130Aq6O+gWrVGwE7c=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abc6efe cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=sh0ooE54KQypwE_MK_IA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300008

Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
Nord ADSP for that purpose.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..9e7fb5c5610e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1582,7 +1582,6 @@ static const struct qcom_pas_data nord_adsp_resource = {
 	.dtb_pas_id = 36,
 	.minidump_id = 5,
 	.auto_boot = true,
-	.early_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mx",
-- 
2.43.0

