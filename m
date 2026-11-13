Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560572;
	b=qXDomVGINZp0hnO5ZBpDlxpkHQ3qT4zTD+DVOqq3ir3DSkWBUYsENj4A2TT+LzvZjX7M
	 qpV2Iiz9aUxjOoBmF+b5yREn8piEW36T4PQrjU3NsHZxOKC8dSFD0v8BBdsD676hecTUO
	 l/f390i3P+MRSTPwDyXJYrJd8hzFplc7BxQxrrjTNXgL/c8xkYsPqUzB+ABHLwHD7dPcK
	 RLWl0dqQQIwya0CyPN8KQo43KkHk4DKeWaaWrkxUXfH6FYfL+VcD9Q9wG0AwfprhW/kgQ
	 GUhAWtVRmYaEyJ8/jHezMuyKMve/XduBDbvgPn+ob6gbfpdZODnvcYwra1uZmdxT5zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Fbol9KQgjBLhvDCLyK1r7itbX5g11Y93wLPdLSd0Wxc=;
	b=S6h3fYQ/Ui3MdxVQM2H/PGp77GWfCBWF/5Gbi477JM/fjej/j1ZViSr1PU35nDKDtSR2
	 ZCAN4bvLnJtlTEKusAjFD57+C2cDgtG5dadpx2vxl7cizy+OsJK+aKpPpS/P2FI/dpzcH
	 BfpwId+K1YHIXGaGqQca9Uh8iSqLlxyWwsf8CcGXfWxh7QwmGWHKE6Cnr++URPsKpwUNd
	 sDTPtnpjhSVxfZJCnGTzagnH1szkwj4hHlk7CiCNlt1yJUmO6Cfwo90vSDWvDbTGqhX9m
	 +7j4f9Dk/BObsqbF63XXfyKYu+bnjKlpi5yZq2ePpsCCY00clsKUegZTxlZNbRFf6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bN4OS7CO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y4J/zJLm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F325606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F325606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bN4OS7CO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y4J/zJLm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAk9074787
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fbol9KQgjBLhvDCLyK1r7i
	tbX5g11Y93wLPdLSd0Wxc=; b=bN4OS7COCJmC4DMxFjutj4qAKGUSnmOiy5py19
	b4X3kRxlNbyZhVzr4F5deb0DNpehGw5GPkl7rxVQA/Vkoy+a1Z7n8mlWvm9AMXYf
	PvSWI8SFPZeVGZV/P39TWUSaubRqreuaMAiJ7HvYpIEjE+eOBL+v/BI9ehUyKwT4
	GdmVeLWVMrJcluMu8dYRpFjPDYDIAsd15eTph6ZBBKrYlKZg8//ehtsZxyIpQq6z
	rZ0jYpO3qwocXlJ8A3aml3Fc1+luh6uYmao2pZFvSFLC/OVOlxXZXEU9r/k/1m83
	i7mU7rKYWuxEkW9R/0IYB56hlC4Xu0olDcd7Y0XQwDmc7+4g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhmdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso54367e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560571; x=1795165371; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fbol9KQgjBLhvDCLyK1r7itbX5g11Y93wLPdLSd0Wxc=;
        b=Y4J/zJLmsXERLIrBHGZKQ3ZVDEss5MDx97/GDowdtkRpsExlNY5dFb1DWINBJwkn1l
         XOjvKGhxMw7fJ8+AXHOzjkiMU2Zi1yhZOsmWH/uzEpwbEq2JdzfK084uTk1JtDtZ14yY
         FKTRy5wB/u0kraRcKRSkeuZzv3ADOgBXGISuQG+cOOIfrNFakcDfDCyeUoIpjo2WYi5L
         D8x8EhUkRJhfwQhN/iKEtEfrQwkUCLdu3IXa28/qBPHUEVNEq0AEBvqd/iOi2FHjoNzl
         Ix/VxZJH0eGzi13BqXVea2sktQRzjJi8WK1/oQNp+jMV57UAiKls33nUjdIGTChKZ41g
         HG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560571; x=1795165371;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fbol9KQgjBLhvDCLyK1r7itbX5g11Y93wLPdLSd0Wxc=;
        b=HlsyVHXzReyAWcj6RoocOXs1r8DGbbYG8dYl0pJXXWIvabLN2cWq06ajYqQEw09KFj
         zEqAXQMoEvTdqrI5UJNlP7OQ63yS2kbcK/TU7Q6RqGYDdnOre8e7LpAItBvj0s6B6yG5
         m+F9OPNBjwWlcrkJNlrBhhtKk6xO74c4i0tGzKuxxevDNPj9ddjebzVKbP/3b5WPlnxK
         DbKnIc27mgE+6Y68pVle3+oGLluYyhb+Vfz1Ck1yslY99+sfn+Pm2OQrhgNVm+QiT7UX
         Ps/R8OirDOlY7h2w075NAmMqay3X5QZ9OiaNk2oSrGbYyIC5vJttIT/nLgRHA0iJJury
         vvRg==
X-Forwarded-Encrypted: i=1; AL+hErHIfNFla9PlmQv61BsbS8HfHXFFwDlnXKrk58mlhf1BsUW8FLYDDqxgAslHjdiAnQ8ay6BlWH4pyKjsRwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XmpPB3xPDcZowXc8MNxVBsVV3bjOyqrYK6GU9dO/b23fIQfCS
	bX6Ax9QOdzwH9MZnuDAP1a+oRBcikv6YuAFbROmHK5lIXHMem5yzvtY++hQL9VpVZSQckJWK8Ei
	LWq9O54BFma3wyHPwIeNz3+0Tw+1Jp9MEs7AUTclhG+fHMGg80pfQE1vjiqLsL1hXWLk=
X-Gm-Gg: AYBFou3oVvgtNDLpQG0Cd9DA0Mpg/jxX9sSrOEHzDa4xS7CYrutgT70mNUmS9lmE5Ho
	aonc0hPvSAkZumyHhmWDfwX7rq+ppn/O+3gc0lWr5HK0FMjaH8VPAg0Y5lp7QI+4xkvflTSrLne
	zJcY+n9QhQnp0+rNztMe9XZkYo+oDzK4xfSdkN3jpbS8CUY9HuHby1ck0kIbaiHtIFv1ldubppB
	r3l+ZrgGXQN9KGsSQXSz5eF7E0gaCO0N6swzE+wu72j4J5OjHxRVgLOXfo6FQ0lYvVq8avTa5Lp
	ycQq46ZohkHmsFUTi7XQ8SZzqMjcA7cfBl56Aq0jHrd4GWkj/PNrsxcLOcj4MzEUIyKIQF9KoUW
	7FYbd3mUWzvScUX4kCMIKQlKUhDGLhVl3nfVChGtildqExfgSq5NTK3LWSifiyVkQy2R7
X-Received: by 2002:a05:6122:a5ca:10b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee34654f14mr380115e0c.1.1794560570269;
        Fri, 13 Nov 2026 01:02:50 -0800 (PST)
X-Received: by 2002:a05:6122:a5ca:10b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee34654f14mr380106e0c.1.1794560569794;
        Fri, 13 Nov 2026 01:02:49 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:cc30:ba36:15ec:b660])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm4683815f8f.45.2026.11.13.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:02:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:01:27 +0100
Subject: [PATCH] soc: qcom: llcc-qcom Fix SM8750 settings
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
Message-Id: <20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAObR9moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3ZL8gsxkXQtzU4P4nJzkZN2kFCMjixRLsyQTU1MloK6CotS0zAq
 widGxtbUAPkfTcWEAAAA=
X-Change-ID: 20261113-topic-8750_llcc-bd228d96b455
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        yzddMr6 <yzddmr6@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560568; l=3077;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=HbT+9TGvL1iQEY54tJsF9aLJzSMEn0pqn3pqWaT9g8k=;
 b=n3bdlatHAHYNJprcV4zoP2eQcCOYzC0dF6Zw78yeBNJlVAAVREfo6cz2JJ4/zCklGmZHDilV7
 UBcaFq4PLe7A/oFRSRCCCspEluQOWkzAqxXEnCMMO1g/fff63I1BVZm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: HVUBuW8fZ39M7BKZWL6z2wDdcV9A1Flx
X-Proofpoint-ORIG-GUID: HVUBuW8fZ39M7BKZWL6z2wDdcV9A1Flx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX4Vx5SLW9GRY8
 /pix5gFOQrF2EC6KhioPnqwmnDSTH82iPbfmC1vkTx5zGEeZ6r+SFPatHdRi1rJDhH/D6IUeTcB
 dbwjp8tcHbtWEo5V1qxypT6Qj72elu/I6zlx0U20ONN2SWFIyc1I/N9ccVTc6q95qnN52esj8fw
 pFIIvj03/VfYx/Aaw1ht/p+7VD85IYnB0b6PQhbgTYjRDXUHjjIbSe5zdFGCZ5EEsJ9+SgECKLt
 eWw3aeeYnWEkBuAwL3e5KAq31BJ2Np99AIUyDHT/zdZQjJ4156L/oytjIGQN0GMhi2cw0O0EQvG
 YiD+k6eusRHV94cAV6OCnpM1V1LmLXeAMcPxD0cWhf1QpQYcCvNXmPLVa2ZZls9sjOx7tafj75M
 tE4iiLj/1w1WWTme74WzXZ/OwNQQt77Ig5sqpvNcTJt2AJ+wWZR26GFScV3NF8n7jD2b1GSo9GP
 otw4jf2JEaow01Idp2Q==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6d23b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=96XK8CVwcyggMHB5iq0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfXznZA7U1hhXwV
 L/Q+cXtywQRl7S9GM/pVIzYX1xNToreqoP2tAxInxYpBjBAZ4lez61ZI/Eeg/LvRhoY6hrlGFCD
 EV1oAAv8qTlDUmmyj1EgwbGRWLoxxBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

Bring the settings in line with the with the recommendations (and also
with the downstream kernel).

Reported-by: yzddMr6 <yzddmr6@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com/
Fixes: 2c04e58e30ce ("soc: qcom: llcc-qcom: Add support for SM8750")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a16388a79c24e4d1f1e88de9c87ec0..df213548637351fdaeeb81b860f0ee2631f2062a 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3869,7 +3869,8 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.priority = 5,
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
-		.vict_prio = true,
+		.ovcap_en = true,
+		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_MODPE,
 		.slice_id = 29,
@@ -3923,7 +3924,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.max_cap = 7936,
 		.priority = 7,
 		.fixed_size = true,
-		.bonus_ways = 0x7fffffff,
+		.res_ways = 0x7fffffff,
 	}, {
 		.usecase_id = LLCC_DISP_WB,
 		.slice_id = 23,
@@ -3946,7 +3947,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.cache_mode = 2,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMOFE,
@@ -3956,7 +3957,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMRTIP,
@@ -3966,7 +3967,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMSRTIP,
@@ -3976,17 +3977,17 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMRTRF,
 		.slice_id = 7,
 		.max_cap = 3584,
-		.priority = 1,
+		.priority = 3,
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CAMSRTRF,
@@ -3996,7 +3997,7 @@ static const struct llcc_slice_config sm8750_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xffffffff,
 		.stale_en = true,
-		.ovcap_prio = true,
+		.ovcap_en = true,
 		.parent_slice_id = 33,
 	}, {
 		.usecase_id = LLCC_CPUSSMPAM,

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261113-topic-8750_llcc-bd228d96b455

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

