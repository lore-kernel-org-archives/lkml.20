Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7514766A8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551980; cv=none; b=J2sxhFJvedD6kcnGCLmY4+XPtdNyZRf0DX7EMnlaCrzCqPbYccHdbhHFPNGZvPlGO3aQPxtibuN+XhaJrW1IrlzrYJNGN6AoPKNKkByhfa0N4MWm77WVZ4NJng+/9uzd89nce01bkk6hDJnOOnCgUbBBOZq+IyzvX6kQS216TJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551980; c=relaxed/simple;
	bh=ken2V734ytFIdMT+0jjPVabtti4Q3v2Nyz4KGbup+5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2oty7iy5wB2e34jVZnBr/Nq8bBq+4kXEoDsNoGagnewzhvGoqhI8Kjp3FWaBJFWu7rmDLy/YLV6xdsJrWBrlWxZWcEVSWV4OjDsxZKKZdV12LGmqhspZWfTuUhqtiwXqBi2PPHWjAZEYlrXLiKE5/iR1h3NJ26BRIc/O5DJUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2I0w3MU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHp/ovMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2I0w3MU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHp/ovMb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHrH906834
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W4UJ+4ics4oOYunJeOoO5yAh6ndPjCZP8h7
	AuddGqC4=; b=Q2I0w3MUoI1F/rcbahHtwVXf54sFuoZfhSgIlfEm78sLKRnrFHO
	IKDDGaJuMerPRnVVD0Q0Y4lw8qsnAYY/YWiQhu40AZLJ0CPoqjXF+DWZNeletpBM
	htDDiyvAsNaHfJC+9C1chg9XzcWd7hF7AAGFXvpuTisC6Eo4wlIw7d34pNiHjBZP
	12Lli7FsZLbHuMWzcRKmXca2ogfpH9RtbWyAifel2GaGlG1V9UOgu0fvkt2eyGM+
	3wHbnpIcNwc1wS/aB8nG01iEsRaauhipc2O0Nl1NKfUdHW76JABR6jRVZBVb7fCl
	m8MJvSbPjj/DuaZCzknOdmSS3hI9bIRy6ZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmquv53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:19:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so66267065ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551976; x=1792156776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4UJ+4ics4oOYunJeOoO5yAh6ndPjCZP8h7AuddGqC4=;
        b=NHp/ovMbJ2pibLT0edcbUbPYAzSwsctXXX9Iq9nUb+Kf0WVcXi7Te+RZV7ZjKu8mac
         yn7xRb0pU4LXe1DcADgrD2QVj4z83GLQsqQ6+1Zn4vV4CKAMfq6a3t+7jhxMIO8JNOSh
         dLlhXZOOnfV/cRGjtPwkAXxRozV6tdRDTi+6wDcL+D5ExG/T9BDdM+sJo8vcyj12yKVW
         L9iNy5LsG4ox/F56Ew6oCx/bkaVHY6601b64yIipyulZlHHTcsdCi1qElPnh5sWImjtP
         wLiLWUDzWWV0Ux1QS015oYCQonCdsxCLnpIzz+gKCi5DOPVWgEyo6UdhXjsS7UW8th/N
         NneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551976; x=1792156776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4UJ+4ics4oOYunJeOoO5yAh6ndPjCZP8h7AuddGqC4=;
        b=i4LhnJAnIUaMXTmcsxtqRrZaYSo1FM+Nzb5Amk29MtZo6Z6FqZMX2z8UoO2UodedSn
         sGDLmVvXzHd58VgZPhothRYfzr1az9KoDIi3gYwSflsGgyf7SWmAY3qJVaLbyQLHFAsM
         HdZIhlksfkVlEatm0DZcyMQcNij76y3bIuyCGDgYdEqxbgZKEThTz2fIsA7xA2t25Yyv
         zWoqb+vLl3YdFTm3KPbxlFXMjzyH1IPxr6Rsrb3FX6fZrugq4yjpgSLQOqxYL9JaIYQY
         WPBcrlQXTpcQ5/tN8Oi0IDOMqqtlRelTWCRGM94lJSvVKJ3vzmc5NFR2iyUeNMW/m9Q7
         TPQw==
X-Forwarded-Encrypted: i=1; AKwUvBwV4FHJkVSrdZ70itzOJM5HmInaATfqQisLtyzw3j0u58dn1vnG3Tc5CJsTt00GOcNCQ9ZG1d11V5ttX3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSCUdYX9FzURXa/97uIGtlpnjxhxck/pgNzji8ClUzEsO5dIVa
	SGN3B+UipW603ymrqxWX/1SpAzUQImqNxxcjRlH78XQipn2iZ4S0FhqPaAZopNuthvMk5MPwdLc
	WYZXhft5ZbTMU8NpzaknUHmpS4TpZAzUCVlbMmTntv78uf9DyW7G5ehkDusGxfB4EBVc=
X-Gm-Gg: AYBFou2dJUiCOCYp58lSAIWo2QbVZ690yoZoB96AWrpoXlfe05dI8mZ06bOZLFmjNoy
	OyY2e3TaGSfson/aEKCV2GYK7C3WoIRJjo27WpQGa3Jvf9RnLlaO2nndABGJWLIfbCYOI4kFF9/
	U9kDnoW+RKAMBgAXVGYMOSym2v+2LDWVQ0rHotvHPNSRW759QLnq2tXLTvmSSL716WmSpEuoeQs
	tK9PbVoUFkG5tGsc8QFL+N+kuVrTtXvCXga35Rl7f5Om7iWQBSu/bElcqB0x3n9wwjBI5SnNVnL
	mLLS2wPLQMOwO4iq02ndsSuGRxkJc3+XKGeq9mIQ/5YpU8/5UOI7BexRuzuTgeZ4j8VF4QRNxM9
	6y08XfiBqHiznMfdkHqo0C0YA3WkmZY1RS/XbnoxayT+TEQ==
X-Received: by 2002:a17:903:41c1:b0:2e5:33a5:36ec with SMTP id d9443c01a7336-2e84280af99mr16694755ad.4.1791551975763;
        Fri, 09 Oct 2026 06:19:35 -0700 (PDT)
X-Received: by 2002:a17:903:41c1:b0:2e5:33a5:36ec with SMTP id d9443c01a7336-2e84280af99mr16693755ad.4.1791551975238;
        Fri, 09 Oct 2026 06:19:35 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0002csm9095705ad.3.2026.10.09.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:19:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Split a6xx/a7xx/a8xx device tables
Date: Fri,  9 Oct 2026 06:19:20 -0700
Message-ID: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX+1Wk8SOKi1rd
 ejVXTc5O2jFbbjuusIlF3Wp9lGAOi9A6Oc48mcbRocPqyvZdn0StJiL8TGYbhNeuPEIpZj0TJzT
 bpMNzL0IXZtUjwR9LIp7ekBc62SE3gI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX1A9JYHys+txU
 yIuAotd5z1CAcBlYy0hNa6aB++imlgfPOFymNfZb+4GGEU8Ncy8Yc/DTSzhHcAdmk1+veju+06s
 sYhYbulsBvDKJIpj6SWtI3Y93fKsk3gmWpl5LlIbn1xPq5DtxHRCcn8gcrBtfs8b2phEbUZxxgb
 cI9m5rc9uuCbvCtF4RwmnIQJFc/zfPz+wJyml77NzUo3g34gQ7PQ+9Mp9SBFqwwD1gTU5PwC9nk
 wiy1fj+1TEYmyk03BaK0TEa1iOkvDbPArbEaETvWniectJUtysjb5demNlCq6KnX/i8T5hAJnw3
 14SoKsxuYvTvu0xuNAgQLWlOv5ZRMs0neKUlDWVj3SOdZyWKCH2ujjfOvmtaIrxMoHMp2qQ+34k
 FAaGNcwIg5BM4ZXFD/Lmx8XjP2H/MndEUlVZ/FSj1+yJW9mJSlDSDzmRo4vSGc5+Lj8Z9tPXokZ
 XQfvFNXLS1yKrZbiBbQ==
X-Proofpoint-GUID: qNXaOcXe2g1tBlI0OKYFyapVote2-KM9
X-Proofpoint-ORIG-GUID: qNXaOcXe2g1tBlI0OKYFyapVote2-KM9
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8e9e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=jbNVri9b6eyAa_OJQsMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

Prep work for a8xx GPU snapshot and related changes.

Rob Clark (2):
  drm/msm/a6xx: Move a702/a704 to a6xx list
  drm/msm/a6xx: Split out a7xx/a8xx device tables

 drivers/gpu/drm/msm/Makefile              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2433 +--------------------
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c |  496 +++++
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1847 ++++++++++++++++
 4 files changed, 2407 insertions(+), 2371 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c

-- 
2.55.0

