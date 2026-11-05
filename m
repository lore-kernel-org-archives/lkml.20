Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896926;
	b=c6A4wdBXo1kIj5tJoZXqqQJSSPWqjOiXsxw6puXhSMZSbypChirw6kbuXkX+OYoGjhcZ
	 HWtK6jvVB1yHBBVp4jUmeRfGr3Ec65cHMszx37ey0bbt1I0Vs0BMM2o/+KQ6i7VnWUDIe
	 xLNMS8anc7oF/IqBxTW9KQe/VjCbWIAraKzchIX4PrFJ9gtWjHLqyJZC6ZNyhCkQBkVvy
	 8XfrUoGGKRJ8gr7LHmEt9H0PkujeoxRXRTiQJCu7+LSywCd6PWExDa4QUEiSCbwr1gk1n
	 iZwRU3TEC1Ax/mrsYBTqOwA+cjJMiY6GR2v6yWT+2UVovnZVrexUY4bAyCY5RLqup7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4WiKxk7FBKJGDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=;
	b=IRZjK5i62HNWGr7DDn2RqAv9bMOb9NZOulLE+HNHAq7hkWg4WIzzTjHgryL7JEk/z32/
	 weAsF5O0W1XRG5na2RjlgLFkjbyZhaikeZElJxq1NSObLgyz6h1aM4qZdQOKwZGURjgdT
	 Fsq+urLhEumOpCXu42DXWax9Vmw0fYj7V8nnT+XzzJpw+933Sxc6jy+HpyBQm57vXSufE
	 N4n+X1pnS8AG6AyPvxDS9oZKjhC0xh5e/7l9m1K4EXQQm9A6yhOhEniDGhkVSmwpctZL7
	 eqy8PkhxxMKbEcWyv67/x3MSyqdwPt8MRbSzEYapPLp5abBAl6Gp0lqsgZAAgI+tZ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KP+35F22;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAFbkewY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3524606D820
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3524606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KP+35F22;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAFbkewY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8UQ094491
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4WiKxk7FBKJ
	GDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=; b=KP+35F22f3H+NrnpEZ1Wc3CTglY
	tt+8r2EyzyG8kgWUSnr36HWvL1o5DGfvTAN2U6V5Wd/1Z/zhCe1EES4VvQ6zgtyN
	W0ldRUaQkzzdcl7v0EPl3Ddo8Q/APlwuILMYPSh/+k7noiG323XEkLZyBp0GcXCr
	6oYZaNbQAbIa9wLEt6sWj2i2y50JvLJ2Ww2cZlcvM7xMKrQSW6wDYtD6Db08ZdPa
	T+yh01c7PQPGA0h9aGytNxoby/kDDXeLgiC7aEZ1m8ozkIO5r3XbmEmLDmLjAVZq
	izUgIM4O7QzqmV5hcfn+4U9GnVPwH4IoDF3iq1ZCp5ibmgg03L7J6p5E9Ww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43k5gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:42:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89ff475a0deso2114654b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896924; x=1794501724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WiKxk7FBKJGDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=;
        b=TAFbkewYtSAJz4Ny/I3Hvi1LQEztq88KHKAPn/BizfAbvyde0mWsreQerPZKJghatI
         9V7tw7dRxidWko8oPl4Eyf9QhF6cXlh2Sdm7gyUhZhg7NE3KKxP1ZCUOGbZ0DkaAJ8P3
         my3crGWlXdsKrzo+IAJ0gIE8bxgOJtas6T691bBjdFOMsR106WEvjBNQXSoKH/Re5yyt
         jXFQh2yZMbLT5/GH7opFLmxu49mOD8gc0bv5KECTSbtEYJC+bHIH5R9MUmMddp29CkY3
         EAkw6G1XMPLoG3DgUZeSHJ/GLSLLdFqsCgTOLAVKeFW0MeGvJWkVU8y1UHRmqFts8twh
         ypcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896924; x=1794501724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WiKxk7FBKJGDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=;
        b=fK8bLQtsBuaJCo+84meL86mIBIprxC4WqioQL4CkIZxMhVwQnkrNfxkZKBJX6FTPV0
         Y+Zg+O8+FqVsFfJtD8BDxG8kuPN2+LXbSGIkyvolz2l7LfhsZY5Md6U+MrELWWSJM1ac
         FBuDppzO3EpQ8ZNoTsIa0XB3LKdRew91i3U2kWZs2NSUfMkvCRhFpRVzJia+ex/lXDxQ
         NiBHZ7YqPFe+sjOSE2Qh8uspTGxwg2ukWGTMSzAt7oD6m6u4svQIFw1K+X5ybsxGjXfn
         HoDKAFHkdoWKEMAzV7xj0deNvx554Z1pK3c2X14m+vaM883FHDU+yxX93nSlrcCLgOE5
         vMjw==
X-Forwarded-Encrypted: i=1; AKwUvBzmpkv+Rm+bqm7g98dj8h9d0nTQfpSQLLUiZl8nPaRCA0LPWrId6iCvfPnS4gx290Mi8T1R/V61DP/IzmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rqpxO9HG5EdiRsGBJe6H1TO0JjwztLSEP2/pIz85c2t9zmiD+
	azh6x/UEmt59/G3v10/Er6AR8r0coEVdwQXFsF+5eWEBttq1kadh01wPXCDup7AXbYa7+0sB8bG
	7o/NCTjb+YohuM+CDRpdboSmZ0lVk2zqrBP3OVDdw1QDuNLgsmTawZqK40X/U3b6o0EM=
X-Gm-Gg: AYBFou0L/iQDP6YBQvbTtHxKS/mOghhnkVkP+fGqkiXBhMyTZFFxg+MIiV5xuBSg6Ml
	JNIEb/GiCzkbV3wiGCeyWVq8kGEg7iFp88oLGJdei2/KA1+BK3S5Z5MGJrH5E/V4lr+MsQ8w2VW
	1tWYrVqL+i0D7LYQp6QVpCRiXGDaWd1heqcGi5LCxyA0KzU8bCcLReGHnFpJcpP+oAa9HNprKRK
	Cckwwsz98hZoIOA0g770q+6wDB9iGVa9mj1ZMkiRz3poAO3CsVphfAFyosq2U2AtyffP3HXtjCQ
	MqsvQHealg2YC9qOd9zm/gt1UKBrxzqpfCnuiiQdD9VjCa4vGPDaDRV4+qiyD4HwMIzlBJ9s9GC
	aBcoHWZ9eyphF+4arEO1w8OzDiFlMncj9w/VVWmMhEmKTUuJo5uAcuE5gGlvhgx7dzBZf03Tun6
	cNBlUB62iIIwLs0pWl6EvwVWntMnXftAbevQTxk2DVs2rmkeOVD+jvn/h5iWgs
X-Received: by 2002:a05:6a00:3990:b0:89e:db8c:7a39 with SMTP id d2e1a72fcca58-8a9bd6d8c91mr16175007b3a.30.1793896924475;
        Thu, 05 Nov 2026 08:42:04 -0800 (PST)
X-Received: by 2002:a05:6a00:3990:b0:89e:db8c:7a39 with SMTP id d2e1a72fcca58-8a9bd6d8c91mr16174992b3a.30.1793896924026;
        Thu, 05 Nov 2026 08:42:04 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918d8sm2233004b3a.22.2026.11.05.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:03 -0800 (PST)
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
Subject: [PATCH v6 1/6] drm/msm: Hold runpm ref in set_sysprof()
Date: Thu,  5 Nov 2026 08:41:48 -0800
Message-ID: <20261105164158.23263-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CmNigBBOVrXDGu555wPvx7bUjbqWCJdf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX5TPCzekT9RmH
 kX67Ppyj4fpXUvtSBLttMkGRnpvwRbAo6B8tS1h+946SF5muvnWhc+P2SQgzkvdgiF4v9mDjq2w
 iVAenZ1I1ZMvtacyaD8+ZJ2oCG59iBeGTnbiG2+2diP/DsI3nXvZU9A2RzWtX3km0EgQP2uTqf7
 9gxdCJZR+d1YluBZVVs0JnxH3Rm23cPP/zjh+ADp990mHj4fDSdAv3jG+cEfykJRj8PmP8rMQE/
 UM6Pur4qCK/N/+elsNuBsTNC1b/WTF6po+8z6xLmG+r28YGqfvJsf+uJZMB8YidMH0/FBYTkwNr
 oKCedDsIY+1FtzyT7bH0oqGHAIbfvsv8Con/G6Se3T+l2bKrHN4IXEW0AihR3hZdCzatDtyAsV4
 vnhNpAuc/tU92PXmEVpMnIeJYFsW5XfVtz5Mab6oEZ98/b7lM+MxaIMVdzudbzh5NIU7csn62E0
 86QgsEJSiQp2TS9gbSg==
X-Proofpoint-GUID: CmNigBBOVrXDGu555wPvx7bUjbqWCJdf
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aecb1dd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TtZx0lvJKI4lzRINSrcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfXze0aNm1QnzeB
 A4BtrVUlCpQ9OxUOnBn2r+vncVjAZw6wSVYvz47qvDA21UYR9dPmf7N4KjsL6VbVl/WPjf39vW3
 NtVab/gvS+b96iZzhc0tL/BmDoFW8y4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050066

We should be holding a runpm ref when we try to set/clear GMU OOB
requests.  Apparently we'd been getting autosuspend lucky before.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c         | 2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index dc89573881c4..cd59daa02bf9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -377,7 +377,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
-	if (priv->gpu)
+	if (priv->gpu && ctx->sysprof)
 		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8d550d281704..4d744604f436 100644
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

