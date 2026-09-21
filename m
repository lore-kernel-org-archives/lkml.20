Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37804DAFA4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008597; cv=none; b=ccLOEoPstz0DH0GdKvfiBU015xcp//BRtBx/kHe5wJfkDdDBinIHd55ci4UWDwB/0cQNI7zoHMHSUUjPdJ16N+ZuYDwkf2Q4Fuc0dkWACN0JBIVlH3j5b5l+C3mdB/B/6yAj31tvfFVFBGeHdwTArGlK6pHdEB9BFY7zLaKik5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008597; c=relaxed/simple;
	bh=MmySXDpweXSXT6L0BR75PjecJ7o7GLBlPVL3+j8etyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1d6lOgWZ7BxL/emFFvxEsuGexDTRjOGCmDz8To4Qw2F8JoFgrJBEsf1hLBSfC5iusFf5e7/5Vhyur4HmwbGAE3a+3jbKxovX9c1Hw1cPEn6I5U+fGq1I9GvYKV1E1SoUyGJ1RO3hkvXGGgNzet9DFJ8d6+4GLoit9qIQIz1W90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP+YEjC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKA32lFa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP+YEjC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKA32lFa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAnpq2164167
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=; b=IP+YEjC/UVES9zH6
	UIE7RS+OP0/45KY5Ov2oaQ4kx/dDVs6EJHCp2+u/kndnYodOzQVFJUwK96LBnxpX
	w86ns7rXYb8MfkKbSnc8tQK8DM1cdUIouV3bpsKiRcemmyDtl63f2Jh8LEZRBcW+
	0eUOb4YolJzlEGLVfeI7Nfuh91qS+vDSzabsO9cIJvOAVgDH3HUcPwqjrGgV3Tvp
	jPE/kROjdoRcoREnA7P4bNY/GiodDuyWR8Q2OWR4Dvyz0qJ8tl16fOiy+Xxhyw9X
	VnC/w6lvRWdB0qh+YdR5NJ4qDrOaq8+JFhe8LaoME3sCTcHtqjXNwYFEWEn7lvPY
	/Yr1wQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw2b15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso54124015ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008589; x=1790613389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=;
        b=RKA32lFaBQ6JqOtgI/8HZRNQMG4IO55ftmQ6y9F78pquB1GFF3hogph2jJzJEOcueG
         AV+vbnQz4xOoaGVrDFoTGriuQUA7iWxH68Qimdh5zhmAyXepb7S5LLwrars26PakgO3y
         zrtmcmX4uqohQlW3LQKhDzSgGoA40e5SPOB29bh6sGO50zoiyIPCRPpA33G4o5vExXuh
         GcWvMHHOx/7mHM0nNgV87t98jyuffcoCB40j99ko6bwo7zYVjSGrXlxJfKqlIqzV3L7I
         nbvnAb0D6xeMODHeaLZCgSKUmUqv2Yh2X1ttSnzoY9oEt+yjT55EEu0cEdUbDa7J2adu
         we9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008589; x=1790613389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=;
        b=OORllvPURrj8OR6ENWKM0a0afklzt1nzFnIsBA2k0cCWP1IJM7fw2/Zy19z3onCsnR
         1E3dYCSVrop/GkUgoRRk/yvlMl7uTcRS+MarSEvs2USdZ1wB1VG8cEXHJYDQV+6T2Lfk
         obbNZzL71cSrz/Ill77p2KWk21PuF6TGeBgKVUUp5CMfxTu7RMIYU96SWB6XjeepF+Z9
         svEczJr0Oj51E0AQ67+1J6zOj8qw3R9asyM+IncUjYkltpuNFlMBK4j0c9Qc5KRN2mAv
         yZ0T0mAfbRuePEmKjNrVnY+7vArlsQm1RdbGN7E0LMI0KeBgu23UfqcMPcL43S+Tk8T9
         jMdg==
X-Forwarded-Encrypted: i=1; AKwUvBzoAj1ztkQJnhvYhqXyD5u9DNl3Scj5BhqeQpXsr3umg6X6hycfT0WuMTIv9JN2ousDkwvlwLpLZi9Vh4o=@vger.kernel.org
X-Gm-Message-State: AFuF++l0S55jvCry1r89oRHRrzR6rt4mZXaTyYTsMmDhMi6DC+dpAngV
	1aSVXCyV9wqqC1NTVkNeI77HKWcU7vuZAhXdhrSC8RMwQMUJf8KIQW3wM+tsqQlOiNVO9YvaRP9
	KtnRlOUJ6XU2Q4obS18OLOA2qAgD6JW2Ac8bfRV4H0LTNz3lpG8syEeY/aGuzdTHH42s=
X-Gm-Gg: AYBFou1p/ed8D/tq4CIdraTBZjIygJJTZY8RJLUI+fayhS9kZiCwfZTQ3FOSudorm45
	OQ53pf0u5b4g0+PvQxbah52Uvp7bb8URlQSfRSNpE+bz1m1YtaCXSpLPctIj3CHyCfuSSzSKyqX
	+D3Yik36RrQqAgMqu5K7dgZAnME3FSWq+y9cMEo9i5VVfJMdpuAhAPW/cJ0cVK/sBseLnyaAB/l
	XF5YSGnk6ccvAO+XVgyybC5HMr1Or9JXdU36XtAiKpm/Q8MYRoB3Dqj1IMlzr+MOavo/rOipsgI
	ZS+4i5CuckMlYqwgdrk73SdWTB/7aYp/pCSPp7UwcwI2QLGx/oSNZrSgCF30p82sqg1BR5Hv5zB
	uKyiBFXpke/vs7nb/bCzpiDyRdXI39JIrcw7P
X-Received: by 2002:a17:902:d584:b0:2df:4827:9695 with SMTP id d9443c01a7336-2df48279700mr45200955ad.46.1790008588613;
        Mon, 21 Sep 2026 09:36:28 -0700 (PDT)
X-Received: by 2002:a17:902:d584:b0:2df:4827:9695 with SMTP id d9443c01a7336-2df48279700mr45200735ad.46.1790008588150;
        Mon, 21 Sep 2026 09:36:28 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba2c5sm37192355ad.49.2026.09.21.09.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:36:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:06:19 +0530
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790008580; l=1468;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=MmySXDpweXSXT6L0BR75PjecJ7o7GLBlPVL3+j8etyA=;
 b=xv5PUW3JolB673mSXfd87vykzyVX8mVcDJnaz1MZ64L4dvxq8xTFR0TmH1jNigJAataIJjf98
 vrqv7M4USl4BJ6VomOdMdErl6dLx45cktvypnn9jSW4QhHJoZ3Z13bp
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX+97kEJnbN0J1
 yhImfw8MZX7PevIOZ1zCzKTS6QPgd/B8iG4TunjVC8HZAIyfl2WGdS20BdPd5vzMyvoICBjgnVD
 R2GA/TzWLLsm8lN4VV32fJEYANKA0H5VzAnMm5LHyzqjkww5pnZbZXJWIqY2NJN45wxzFK5zQZf
 m65quQRozCLgn5Ix/G5pJ7rVWGiuBOOBeZoT2I98Wo5ZvdjScPVYG2w3KYXX4xwmQ1zsACE8Rf7
 K8k/Qa91sIhrWCV8hT+4Crp9HS/qtkGxVXw9S7bw1FUSKKzn8vEC+aSNN9Cft4Ej903n8ERIcOt
 g/NiLRqmIomuR3vKFiH3TUXrbrEXk2IqiW+M+EtDGHlEoCuyMa+jqZnNtWHQSgEDyqrJuozjOaw
 3jhr82mcvyctP/9mNSfm6hCHHAQr25/eZhP9vhJn+2ztlwj0c2LX56ZGCY9TpLrd2eYrQdlQmzJ
 H4RbgBUrOhS4iAsdxjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX5LE4rdKGJtkR
 aBAWwwkjzNpMffODTI2rZltry52fl8Of6+0luqneBn1pohmrWjsGtWJ0FavfobA3kjXWno/gcPb
 /8B8sqB0rm1cr92Krh//UAnLDu94xss=
X-Proofpoint-ORIG-GUID: 414nHfkRXGh68sftR42DL5k3VnF7EU3A
X-Proofpoint-GUID: 414nHfkRXGh68sftR42DL5k3VnF7EU3A
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab15d0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Eo0ntd768-WPz5Xdes8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210242

In adsp_da_to_va(), the offset calculation results are stored in a
signed 32-bit integer (offset). On 64-bit architectures, this can
truncate the 64-bit address arithmetic result if the subtraction exceeds
2GB, causing erroneous bounds check failures or invalid pointer
translations.

Fix this by using an unsigned size_t offset and explicit comparison-based
bounds checking. Check that the address is above the base before
subtracting, and use the form (len > mem_size - offset) instead of
(offset + len > mem_size) to avoid unsigned overflow.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 46d9169a37f6..b014e7498f63 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,13 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	size_t offset;
+
+	if (da < adsp->mem_reloc)
+		return NULL;
 
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;

-- 
2.43.0

