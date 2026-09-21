Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E74DAF8C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008589; cv=none; b=IzktXUpyyngNEEpQvVBzYJ2JbzyQJCIQNj1lGBxQLTNt5wIQIqfxovvYHRon7LOM5kvQPc4TIlYBEDreiKc0lVcdny66GACXXCUM4RKYnGWnVMccC7pxrqhiNzE3XZNxQi7HGhCBvF9KAhvxwz7mM9K+VW3LiU8Ubx1eafkhk8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008589; c=relaxed/simple;
	bh=ePj7LWHmvyDl/tdSqb4au0ZhhGQySssn8vaz+N9s7LM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BzVZJeJ7/686t8h+ouLHqcQIZqbd1fd0awOtWy3Mc4bMuxW8+vN3RmgfILNQhI1Ox/JWMUqvdS3N+jGxMFgRuB6CDAcju2VziR+IsKt8HexwcTXHYFNfg9B5kPSz4aCOCq0mcUAyd4+Gu+Tq8vXHUIeXPPDKkVyQIkOLsDEWZ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyQNeBXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJTjH3IS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyQNeBXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJTjH3IS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFABG9827839
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+5h/BTbGMLat3GlcUa7PND
	asgDbF992dy/rhfglNTnY=; b=cyQNeBXwp0tObcEkXqTzL5/s0lmvHsHXZ1Ichv
	P2uEm6IuXs90mVNe/qgZPHSHP8Pi6kJi7sBI+928NZnNFDk/as6Vu9vA6ShI1aps
	rlEtCrTrf0+Wh8v2+75TU0r1MrdvFOkNR05BRjkdtb/lmYXRu2isDmTINXWmM58g
	bNJ8cziPUeWz3U+HbIFS+KT71+umhKQhqWTTZG2BoEfSCULuH7HoEvIBYFQNbK0C
	iMMg1Hf/AX9HoR/lJF59P3ILOpMaUnB9ShtmPE23QULmK5KYRewQg9gM1Hk8XI2f
	DrWEDvW7rkZQJjT+fDwG1iiBJIpHKjxn25tOyYQq8cYrxA0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsyuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so31206315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008583; x=1790613383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+5h/BTbGMLat3GlcUa7PNDasgDbF992dy/rhfglNTnY=;
        b=eJTjH3ISspJHKDEAHXqhPhRCQ6BIVu4t7Z3XgUGRDs6xJpM7Ri/cDHKXuzDwyaR38R
         BiO6rHZKJ0Z3x/o/aHT9837yujS2v1b393ZqyPWyCreWn1eb0qHvpwhCOxdhGE3d9z//
         DhYsSxdaFU9v/tY+R3skX/fcjpdemM49CREleQvgIsvPMhxmLx/pXshjtdFi63T07Te4
         K90dipIaMLno41QE3sfhUIGkGdnL39mGNjY+1GGp0Vfd7KU1QKAJI0pTpf8fyla8KRdo
         VVVZHP64aZucvNMP66eKUp9Ww/eUUsvZcp9ezhrkWxqCtQ047VlY7thUCFfCf2iNoURy
         QdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008583; x=1790613383;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5h/BTbGMLat3GlcUa7PNDasgDbF992dy/rhfglNTnY=;
        b=prDI+ydurMoKFh1VUizZY6YHEsjsYDvCM1q3GlI0FcmmCCPRK8tNwKZ8n7KwUXvzQ7
         AvmgL8X+JnXKz4850XCSUDTLG0IVLId4oxFuqwcfLrS6FwA2MtvYpVVH76SefUB/pfBP
         f6oxOd0nBMsj4yql+Ov4C5deRmI8Yzlz4fhcQFmrjfgqPnNhSX197m95kFCgf18gNlzx
         ITQ3HEwM2muC32uiyDig91XLUhJzxU1So07dZjKL4WkRcAm1TZMDm2mV36YhYfa7pC8s
         SVtGrY1TwUlnQ2gWIghsAj9f3JqcePpyWWoZoLwWOLKMcrGD9ae7CVuTN5aDkG9BngbK
         GiGQ==
X-Forwarded-Encrypted: i=1; AKwUvByoLpH8kYc4CHl81lrT4pgX3KPtgHSXIqJ3MLWMrKdyM2CyF3MpGO+Bxf0JTYH+pft/s7xA8XUBu6Z9Zqw=@vger.kernel.org
X-Gm-Message-State: AFuF++ms8kQ6SuATJqOb3B1BkbIN6HSXu1Idmr71BaxPhea1P/TBT5ui
	zoL5Fp+bSYcARTHspocWUgDEXxxcSkCgzcgLf8ruRDnkqmnYcV9toNE0gLTA2GexbWCM/HUi39L
	uAWT4184lS9s+VCB5qjwjTsuT0b51BoxCAP4MNCn/4rrEkpsfeqCbuAAq/Wu0FK9ezOs=
X-Gm-Gg: AYBFou32cecy/ubR5xOKXvv/JgWMAMzz9SGwz6GVnyipOlOBcUY7hXs/iWvsknNMKbo
	wQPFDY+u7hwA/Idp06PEpTynf5ywjBgYfAdyPUzCZ8SrM7VtX5WwdiYuJCwP0mZXVmcXP8tFI1a
	Uquvos8gmFAE0PmzQMUfD/JnNUL+4oQktcINKcfYTwGjXwUI9n5Ayz0f0U/1SfAgF44rJEsZUmj
	c8QDNEmUIBXSeOypLLqqw5Czk7ldEIBHN9a4MdpqztnsGheIUrINo3LFszW5mLBkZcNK0/2K6ge
	sFwWVz6y7We8BkAw9lttmNuIg87GiRgTd+IagyJsqNAFgmT6Nsc3yo5o2FRwfrsdCHjY03gVred
	9ccTt1zEae7wZDyqCpiD9MphFSbhlafghD0+j
X-Received: by 2002:a17:903:1a70:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2ddb1af333bmr167485045ad.12.1790008583266;
        Mon, 21 Sep 2026 09:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2ddb1af333bmr167484745ad.12.1790008582732;
        Mon, 21 Sep 2026 09:36:22 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba2c5sm37192355ad.49.2026.09.21.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:36:22 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom_q6v5: Fix 64-bit address truncation
 in ADSP and PAS drivers
Date: Mon, 21 Sep 2026 22:06:17 +0530
Message-Id: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFdsWoC/yWN4QrCIBRGX2Xc3wlO0rJXiRCnd2WQrXt1BGPvP
 lc/D5zvfAswUkKGS7cA4Zw4vXOD/tBBePh8R5FiY1BSGWlVL4aj+JhZOx8jIbMrVHPwpc3cmL7
 Irk5cCP1LxKDtKPXJnq2B1psIf0bLXW9/5jo8MZT9ANZ1A2OLFIGNAAAA
X-Change-ID: 20260921-b4-q6v5_address_truncation_fixes_upstream-dc59f0579896
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790008580; l=890;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=ePj7LWHmvyDl/tdSqb4au0ZhhGQySssn8vaz+N9s7LM=;
 b=s70G5mBGeJ992pwQBrrWqbV8+WLEN9gIPMosXjC+aQ7y44rnOxpHSF4P/r7UZNsos9D4Wv9Pt
 wjvn7hGZXolDbBeHR69dLbeNADtj/K2lZCIAPPvD95xNmEWyoko5XSL
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-GUID: zbhbbbuNh_PFzrxkgKDXA7mYij07L850
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab15d08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PwTnTnql7yQPMyGp394A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfXxNJwJTtMlMyV
 tKWyREtCCuuu9pgFXVeAfNZo3Sq0GIyegjGCzrFljei3/2vLw6uE3hRxAJt6EefilxqBEiiIJ0k
 I3pYuliKIh1ftLdzIMkySMjjV6obXByLoMiFBa8Ek/aa7ZDyiGmOjcl7vWruu2IN118zupwAs1u
 hK7pKsToSFx1nrQQz+Wh2KD9/suCNpkA7JXDEHxCYnmSbVTt0gnWI4ENWbeKzduM9wD8O4BfgEm
 2jkGsRzROYiLduF1Tfs0nQK9xXVGnw/vdTU+yH8T4fWhN6YfCTR7diyJ7yeyUJvCAomjdktC2Y9
 TLt7orgRB2FeINQbxIIFkeFqvvD2hFw0koAn53bMaQj4pqoOp1vGJArUxKwzt6nui/M4C4gwiYx
 3DEvqqV9SMByIcB6/Yb3vs9mwceqwuDRafx3u+0F6fON/4ep9PgvXJpK6U8EAhQzBFe1yRB5P9k
 e3w288MTo0Nyl+pr+cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX630Qqm6w7LCG
 tEfTi8QbTU9FvHbl6tC8B/qqdK0+xh3LujqWuthNn5CPuvuu6Du9K8m7UUpkGx4Lst7PgAm43qc
 1P3lbeG7H7PF5/0Ip3XP6CLLRJQo9Xs=
X-Proofpoint-ORIG-GUID: zbhbbbuNh_PFzrxkgKDXA7mYij07L850
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210242

These two patches resolve signed 32-bit integer truncation bugs in
the segment dump and address translation callbacks of the ADSP and
PAS remoteproc drivers, using unsigned size_t offsets and explicit
comparison-based bounds checking.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
Anup Vishwakarma (2):
      remoteproc: qcom_q6v5_pas: Fix 64-bit address truncation in dump and translation
      remoteproc: qcom_q6v5_adsp: Fix 64-bit address truncation in translation

 drivers/remoteproc/qcom_q6v5_adsp.c |  7 +++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 22 +++++++++++++++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260921-b4-q6v5_address_truncation_fixes_upstream-dc59f0579896

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

