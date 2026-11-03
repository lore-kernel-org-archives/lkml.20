Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747944;
	b=hS6oJutAg/BgJ2KNzQeh58PBjSqFibA/pwQq65s7HRSU6i/dg+a6mCO2WYHkZAsPkS8s
	 p+9WT2gkECqhIZW++FTN5xR6KnBtvFjnPQEDqUgzuqClXr6swWVRJe+Wc1PxWPgipHINP
	 ZIpe7J94KuUKBXHjH9ppnLM3gPcDvw2L2wn38euCHbShlnYPY1SqScSvmXWmF1gvgbsud
	 NbW2vpCGoah8yYb0GDOSaWN+2xkbDZOSb2QMQRWROgJWUbKTBF6N+rxOZDpyL9pJOkWLY
	 RTmx08i+S2gIQ8qlUGWkG3D4dG6K4SIwOvPcGCZH7eP+/NTgIakWxik76qKIs8Uk5gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UUiqxGBqlqkyCyP/zaZbA61tDabtLvEYu68IDkN9RnE=;
	b=Sc6KzM866PNBApqwrozKGz0di7fXw8o7hmXq1KPKQmJIOdVP9j4307Ak7WSVGU32A9eh
	 uYecz1IiNnGXwtWd2JE7APT76vg0xfvhkRJI8b7yurCzT2hPhLagbbGDzMUHK9FTPqWo+
	 /mCV59VrDXenRWEhL+nr+sAwtAuJLBehyVPEJaonRX2Siw64xndyGhwoU7bpqvfBXn5Wx
	 ehCudmXOPExuTugc5eyESvqr9jt8Ijji/nn40wmMoB1GOADmWbA6kNoVnSBhGTUFjlJk1
	 /ZbDm15spK6iyIZS7od13toVeUFa/R17CpTHRb4tQShkhOpaXLsVmup1EaNlC8O3e0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyY2rMRs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QX8tHCS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A093606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A093606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyY2rMRs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QX8tHCS/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKptg3065603
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UUiqxGBqlqk
	yCyP/zaZbA61tDabtLvEYu68IDkN9RnE=; b=eyY2rMRsHR+6K+KS2DA9pqAm79T
	QYEZkWpfV8Bp7J6OfSwwJWCQ1mN6w0cPm17EnEqiHiJDY5VmLljBwLe1s/Ov5JvI
	8M5pnabqhGkW97h7lgR8EDZJbB3rYpOcPrM5uc+b0qbOtlHNsMUPselLrEsl2ulW
	2O6Jth7TI8I6ZbbNeImELx0NF6f+IQPrKVWqsnGHzyrijuzYuNLIhuWhCjLJKa+2
	pOcLwLfUB/xNjoMAKJFdt3dGZIy23D1zQxrEiX3VPaGbk+eZKDxlHjSffw9bl9EE
	2NGlyb9Bl886Wk6cZcN+wWT98sBRl17XDEJYYVIN6SdkJWtp+BIWVgnj+FQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bt7fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:18:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea381ce04fso375335ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747937; x=1794352737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUiqxGBqlqkyCyP/zaZbA61tDabtLvEYu68IDkN9RnE=;
        b=QX8tHCS/wixXT0D/MdERHy2cYoXNOOd7w6GQuYNmXzUKAtB266EMiF3PtTzg8pF8jx
         UHE1Iy1SDGinxEJGTVicupkEBC0EJfI/VwNxfvatsVLHTdcxXXm5sBvWOfIFKlA1mLBA
         4q0yk+itMQWdf7Qs6A//q7iKFYeL9ReaFAAy0cuH/szlq0nftJV+S+zm38lSjQvj4uWV
         oiRWToFa4gldP+G30nZgheRJX9eTf3fq30LGoUJj2/wUsucBO4/g5J5ts0vmhX2FJMY0
         UDrMROxA1/RQU1snaQZ8xeHbihRlZoQBjLmjumokaKcuFBo4qJUMIpWgRup/3/U54R0N
         70KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747937; x=1794352737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUiqxGBqlqkyCyP/zaZbA61tDabtLvEYu68IDkN9RnE=;
        b=zrOxnVpq9soVI6sAe1odunScz7T1SQ6wg67Q1fYpuOHYy8FfzWyFcTAXK1OWY5XPSU
         nzZRQbmjRzlBUa2CyGJhv/VH0m9D5e9QUHeo4I1XassduOfr4h6uIieY748TCHdyuYur
         qkwFECLgRa3GxQrcG0k3pJ7jpb1AOz/xwC0vVN5WuMGetQqzqhIz3ZbeWFuQx9eVCRUt
         Dw/GLOuVYrtHtSq45yTwV2VLLrpvq8pc0fCfq/QBAZeEY5T9KoyA2i3oQUc85QTiW9P+
         ZaBoQlWS7vwZGoBaxUh7YgFna9rX80uAcdgXDOPevzS6TXR1/HYrqZDJVY/sJu3M8V65
         NXsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/xNJbDVa6/Azp80uRR5mwXLrKX2XwGtTXwaMDFvjbH6MmMHdbX09LxDM/vWkc0u06IEoDxh7jAxS7PrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PJnDfUjrOBmWGZkTlhkmFYFk6WSlBu7wtdSTVvtsmK6PjwYYV
	AkY/hqcqKsHbEuRoABd4HByVRCSY24IKY3IDDHRo2A7sYKPPsfxLzj7Y/anAQYO6T5i7e6tHLIm
	dMDdlU9IuBxSXItRazacuLK/OZpjVsDNtFwcEpE8n6yIfPRMIJboynnklRmUopjtIpkA=
X-Gm-Gg: AYBFou38HfXGUfVH6TPNkX/wKqF+mFAAufHGgKIULB8dnQnVHqhH4QNo5FllTA/90UO
	0cC9DwpJwnJyO5QANDNP+Zm/1UZpANm+xas4Xd5UJAYg7p1IEl9sHejU29RfpRmv3V1gypUh+cQ
	TU369AKR7l5c+fOhELAQCbgnsN9OiVsp5dCr71AJ1euI/pBk4sC6dXMUvgY1bRAvzsbspG5aRa5
	2JTh1OHAOzwxUD4L+crUjLCakIyhgsxh295xELa8gf3g4GEmSJF4GPDmUZDAFYvXiaUOw7p6hg0
	Rva3xKZzQzi6Fdm/oVGwA80wVA9UYmotKibG4rC40DNwsj6clSLUapGVGrh1jUdURfmGzFO+8Pd
	w3JGQ4jhd5otdzkgfu17MTLfKh6Si7uyzTZPfolj0shVIRTlNJwL1j/SqJQpjzuUzP0ZuEX3sr/
	gp/sx44r1+l02XJrJln1lmI8CE66iztT/z9mTQBaq5ZzAK8xLxZcwhfhjtdw==
X-Received: by 2002:a17:903:324c:b0:2e9:5876:17f1 with SMTP id d9443c01a7336-2eb364c41f8mr95274065ad.23.1793747937347;
        Tue, 03 Nov 2026 15:18:57 -0800 (PST)
X-Received: by 2002:a17:903:324c:b0:2e9:5876:17f1 with SMTP id d9443c01a7336-2eb364c41f8mr95273965ad.23.1793747936806;
        Tue, 03 Nov 2026 15:18:56 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm358665ad.21.2026.11.03.15.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:18:56 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/6] drm/msm: Hold runpm ref in set_sysprof()
Date: Tue,  3 Nov 2026 15:18:40 -0800
Message-ID: <20261103231850.17493-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX2L0TpjNm1pFe
 DD6hs1Ovp2jIFRf+hLQPS2umFoqGI1mDlNLH81ifgBfPutslZG3avt+i3WFSFApCZQUq8oYfRzA
 5ltQEEG9Y8mmxoeQEujwtI4ge5bllhs=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea6be2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TtZx0lvJKI4lzRINSrcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: J3n8LV2a_4-CDNjgtVT3szQONnp30qFo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX2/rFByv7m9KJ
 sGTOS4E1BLkbW1wEYDGle/LkkvtGSnDjMaXOaohtU0F9OBN41RZr9GbeIddoL3xtWLcrW0mfQR0
 B8rCdXsNvYg19ei6Ql1F6EkzpvwlbNz/al9FJzBi+ib27X9GDDeQcdCaVUR8SXMeAdRn7r1BxU+
 IV2CHv+/RmBvkeETkWygs20YkIoWktDvpvmXEIS6tqkDbDpe+NmqusuC+Z0bfqikmzuDJnh9u8p
 5w+NaJTaI+vnw2bU9xBIMm+5HgwaBNl4nOZ2r9pMGMDTBzAwJ+a0vx+oMZ4Tr732RXDsjvoJW9Z
 pFdXrWWdh4GCW8mmlEbysgQVAxN7nZaW1N2LcudcF/irvLMolVvDhSSRENx/LB/GueMLXXjSHTV
 5z7wAVmrgqF7b7XO+07TIj6V9YD1oq+RQq6T5PY4FI7Rz+nSQn5/A7fL147fUckzxt4dqjW4dls
 3f/o0mgMOJbKlgQpoIg==
X-Proofpoint-GUID: J3n8LV2a_4-CDNjgtVT3szQONnp30qFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

We should be holding a runpm ref when we try to set/clear GMU OOB
requests.  Apparently we'd been getting autosuspend lucky before.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..e3e7c401fa5c 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -9,6 +9,7 @@
 
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
+	guard(pm_runtime_active)(&gpu->pdev->dev);
 	guard(rwsem_write)(&ctx->ctxlock);
 
 	/*
@@ -21,7 +22,7 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 	default:
 		return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
 	case 2:
-		pm_runtime_get_sync(&gpu->pdev->dev);
+		pm_runtime_get(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
 		refcount_inc(&gpu->sysprof_active);
-- 
2.56.0

