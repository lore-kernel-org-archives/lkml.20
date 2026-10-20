Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515309;
	b=WvRH5tKXRU6zrgD6Z1jGnUEwwRYAtBjc3q4AluqB0jdEJIYbVto8ohq0kay6XEUYLfqt
	 hQ13KvXKUEG1kHdPbluDyuweTx2mMogpzryQXAEf/bpwRFo5jnTZQNOtMdIqAnADvwrYm
	 3XMlD8tOsejwk62UJMLu1s6/cBnAKJOTABNIXRSswH+xcLVKfY2J+N0aR8wRA7lcjndlx
	 5eTJffzIonQeIX+vDG86qpsr0LpzN9BBOFGvDFKK8jB/g/+XM3jgmDDc3FsQy2Q3eNXXo
	 sFuIuQXUZl4jxpJvrZeugBG75YGssVBOy0M8iiI1KjIQi6i44+PiGj76KkUma1dIw1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=;
	b=0h8tjZFkfdVF/RbQt8msQUnAcnWbi+wjzfMRndu7jDue1wiGTAfJQCcDtR6w32WgPrvk
	 9BtxzAodWp0HlKKTnYYdZhGDzThIWac5G13ti3W8BDf9Ua1s9JhW4NHm2K7kIsUlqy/Kl
	 eRQM0pDn318jpOB0Ng527yjHzE94Obg8SxaEHzCsYMafT2i/DltcBpnM0dB36uUpZWuNu
	 k0vO6kHLcfICHiylfVpe9ZzhDwUOZzTrqGcAS6hlrZ3RETHgtsF6YWoI6VdnY967Ro2IR
	 cRa7wGduvaimuqrVr9yj3gF5kOTHqLx7YCgHcBH2IIEmcxiK8JxUj0w0KHb6ZPLORBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN1LJ6Lk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/pGpRPp";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB8606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EB8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN1LJ6Lk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/pGpRPp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGaJ4s1332287
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=; b=LN1LJ6LkF3Q3cEnS
	CZ+j1cMLZpA51vhZB11FFRFYM6KtoCtdvUIHYzJNNqS8XsfDX+qvZqC0fG35zNj2
	L2rL0/WtZnVvfBwdbpGqU5JxHNvZkrV0Sk7/8QwCVyfXSWdmhyJskOHN9sl/Tsn1
	p9G2nET0FuOHEwTtixlNCA9SdLuepfos9R0XhmlqxfGMXjqcNVVySxL2+Exx8/VZ
	qj3Wplnf9nIMw/47WJJptuYBtRvA+doFpsBMLyPJLSic5nscZhyUipjs4S4ZotCP
	ThKCTVN04jc4WbjPK/J3EHLD4wym2+F8q5m7ADXn+DNklqBIwjQr/I1U/72Z5/JI
	3fB+9A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd02mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso9550059eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792515308; x=1793120108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=;
        b=g/pGpRPp484JTJ4YidDHe0dSJjdEG+znH9vMmQH/mHa9CutQFWU86+xfBX1ctt5MWP
         fulR8q5mKskbWP0bQIObTDY6rI7XT+LHyDtGCC8u+do8cNen+5XN/oKZctKfCbZqTAat
         UlU92ps07ve/aPkay0fpNpr718zHjcl4+9JXC/359QR7fiukyiETYpW9jVo7yZ24dG13
         ugTIywQJCL4A+LIRi6zuzug/r6pHxpOqm3foBlEWaJ3o2+B+dQ/w7/sUSONF1ZJ2ENSG
         tl7EO0sELw7qBM5swj3ykv2B1grqJhL/1K9Cm+R2y4H/LzHbAtBDoYKjg613CaiHZrXd
         bSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515308; x=1793120108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=;
        b=xmxMhpUkC0vOsraKTTebM7aPugj+XApatFrBA0hDJFjGiSlpPKZzHICvHGRJD0FhZz
         5VamLPZ5Pw+5/9IhATqzq+sg2LIC0//0/KcU0VzapeM38tUHjQ6TOZz7Ny6lAa1+QInx
         HaoEVQfenIDmqe6Q+o71Q+/C23XrIOlR1s6mWJyaR1qfSawraqpaNR9Clw4MBSUMMRs/
         oXR22T4M15gctGLa4hMQ8tQlorlmjcizDdI57go1rEaV7aDI6DfBivmrPdHkjZodWBj3
         oa90YheJfWLe8WcSl8qP/NZMa5pyb0E01sS7kCZepKNaM6XLHwnzZTIzj+F+woWVlsFS
         2MPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCnCKe34nY5Oa608yjcqXOwgDcQmqbjT7bkpNeMLK11Fp0KHQDZ7wEDfiNMlaabIX78O6iZXrflIuRhds=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/22KrYNn399bIZACWBxKJD1ycBoey0t0WmAOLbOa0xparxchk
	WjNQ9xBwtxsF+0d8KCgnzOvXSnEgqPkA0AZJmirexx8HTePNB+/wKrDN7vjcPrY1j/Z/HKOX6aA
	puDgY5XCTblUX//3osgXopxboeWcRNIGuunHoxy5jZLWBwjUa8zyhKeUDq7l0nKolsZh8YJxyk2
	0=
X-Gm-Gg: AYBFou3pj9q9msE5Tvl6E2934q3G5BNFK1EfBIgXVXb2Bkyc5/SbwowAFXSbnAtF8j4
	cf+JxJlo4I6rpUZG6zYW2LU/uD1lLMMWTCWpMG1LGUFsfCBIucaWd2fD88U0oXJv4+IVcSvp147
	BdmoK1vxNkOw02ykkxsD+8gwuIgUeE+Ku/5LFCsHXDa3P0f53jpMGlz7d7EwWcEQ7FDBOpPSrAp
	FEou5dEfO0tKmhi72uoP6nRhWKmBG9fR5G0TiEJESfoTAErXPQ536fOBMEqtND1bXoanPhX07VE
	YeqVMzGhwxnrAav+3h39q41343LsmMuA/8And5sCzyxQdK5CnqsrItaxkhProbgZ3mI27d/8rL5
	vcF20q9nLusH1LrNKLJQDlGASRGklYFlbIa2Oglcg4vfdRXIqGBdC3vkxF8ohqGkjzm+SNtvk42
	Cja6OUkhY5+3yWITy4n/vaJBgUlicy5dvZoA==
X-Received: by 2002:a05:7301:db07:b0:366:c497:610c with SMTP id 5a478bee46e88-366c4976309mr1749962eec.33.1792515307915;
        Tue, 20 Oct 2026 09:55:07 -0700 (PDT)
X-Received: by 2002:a05:7301:db07:b0:366:c497:610c with SMTP id 5a478bee46e88-366c4976309mr1749928eec.33.1792515307298;
        Tue, 20 Oct 2026 09:55:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm43204868eec.23.2026.10.20.09.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:55:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:24:50 +0530
Subject: [PATCH 1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
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
Message-Id: <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX0IsIvALcOlu4
 HlEG9CQSw1YhfxU6yXs81Zxi9zhmsVM7Co2wWSNbIPDv200MhrzNhA7ayvITDIOwUuqB+2pAVdq
 BEPElc3UauSxQvPdZOhbd8Zh9dsK/7Nz4zvHdwZ6DyF6YVnJuf0JtqztoRYcj/vpEAzmb/Ly5dO
 ql2YoFZlQIkYZikkYYhlp1osLpf+CuxUJHJw+oqAIcafnCRPOxFArXi9gb7lRrkGAKIjJWml77k
 IwzbbF/vsyO/RakGyGCl10ZwaMY0QHIGleELMHusfx1NpJqb6Jre23rEmcGWASVoeK6MuIG5Ebg
 lXuNyyHQCUCjyBPmaI8Inaftj/GwBCJ+kVVlu1KIn6AQA/eToHzpmAY+ZecJu7KU6UD4HLg7vzr
 dG5BW+u/1m7bpei87JElYij2CtFC0vptgtl3CUL/nEc0LqL8dMINrxF9yb483UlifC3Ua/ZMlq+
 A+y9BBQniy74oVXRO0w==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad79cec cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XfqRfzRSknG9cwVfMr8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: wzXzNzApszMtChPiWIoLSLvJoFpWaufI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX+Pdvn78XH27Z
 tRu4y2LH7aw2o8zWixcnWqNmcRFimKVEzhe0e5Z23d0pvywFYyLzBqYZqO6pIIVXfIbEwl1qDuF
 dHvMH6GAH5Xu+zNwGungJErri+Vdn0s=
X-Proofpoint-GUID: wzXzNzApszMtChPiWIoLSLvJoFpWaufI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200067

Convert the hex values in the Glymur and IPQ5424 configurations to
lowercase so that they are consistent with the rest of the driver.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..2edc5ec31249 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -439,7 +439,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.slice_id = 1,
 		.max_cap = 7680,
 		.priority = 1,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -449,7 +449,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 512,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -458,7 +458,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 1024,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -467,7 +467,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 512,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -476,7 +476,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 7680,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -485,7 +485,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 512,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -493,7 +493,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.slice_id = 9,
 		.max_cap = 7680,
 		.priority = 1,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.write_scid_en = true,
 		.write_scid_cacheable_en = true,
@@ -505,7 +505,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 768,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -515,7 +515,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 1024,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -524,7 +524,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 64,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -533,7 +533,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 1536,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -543,7 +543,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -552,7 +552,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 768,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.alloc_oneway_en = true,
 		.vict_prio = true,
@@ -563,7 +563,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 3072,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.cache_mode = 2,
 		.vict_prio = true,
@@ -582,7 +582,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -590,7 +590,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.slice_id = 5,
 		.max_cap = 512,
 		.priority = 1,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -608,7 +608,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -618,7 +618,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}
@@ -630,7 +630,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.slice_id = 1,
 		.max_cap = 128,
 		.priority = 3,
-		.bonus_ways = 0x0FFF,
+		.bonus_ways = 0xfff,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -647,7 +647,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.max_cap = 768,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0x0FFF,
+		.bonus_ways = 0xfff,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -659,7 +659,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.slice_id = 5,
 		.max_cap = 128,
 		.priority = 3,
-		.bonus_ways = 0x0FFF,
+		.bonus_ways = 0xfff,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -675,7 +675,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.slice_id = 6,
 		.max_cap = 128,
 		.priority = 3,
-		.bonus_ways = 0xC000,
+		.bonus_ways = 0xc000,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,

-- 
2.34.1

