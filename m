Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234094;
	b=acmA0SAiqCnpwAEyAvY+cBjdTzJzJIAFhCeyVkauB0v+H3YpX7dqHh/VX6xNvc8UM69S
	 PUwg8xlx6nN4Cp7VCHq5wqjInJNvKHDXTcF4ipm77a6u/4GnHjDp2mXxfqiZ+pxo6tujI
	 nsCYhAzJKLyz3DDOoybh8ZtR17YWe0Toa5qXg3u0TECCxFUlMPHXaA5/+DBkMQsMY6v2+
	 21zkfxo5SoB5EMsbNVxxgVamZt2AffbmYyMsYTaGbMbwZJJ7o3xKvOZ8HHP/+Z+X/y2rG
	 nDJGNrXyac45VeZ1uIEWK69B+9SLSl3ODCT/hciTasslVOFZYSJwLXzN8JAtzYoMQkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
	b=B9CQtOko8b7EzYQN3bARGtRCvGJOxJiCzqJA7gGHbweTVVHCLgnh/+RDcJdBYPYUqG8/
	 hyBhjwfV+P/Z+BrKJvW1hOQ/y/gDKHe6pwp/Z4R9PNR7wGOVgtIq6Rg3V8aBeyCPhndW0
	 EAbsAPfL8JCFF8nkzn4K0WaBKT3QKrhTC/Yum0Kh+h9K3WlporEAQReaC8ivVnY4mi1Lu
	 FHui/ciJ0/oVy0iOuYKRy3jLssZEAyCZgJuTKsKcdBifgl3j4sGMf2cG3rK6xtC5CU/D2
	 FkubXrA+wKQLLhRfniiQcRsUqL2ge4LvTpL6xsMJ55W1CrErI2bvvJbtDgF/rnP/zGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GxlfGPQ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiMYlRtL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4576082BC5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4576082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxlfGPQ/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aiMYlRtL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFGa3971398
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfoXwA9UTdo
	ZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=; b=GxlfGPQ/B0QTgJj+VxKJcPcr+GV
	ruR9j7k+NIZsuS3xdRIU3n+/H9EMBDzt33oxJkVADO7KBEkvm0LS8Xpa6WTrYdWD
	A17luVLRTqgTGeSUiVuO/Whtnub7FZsFIuCDfL4Zoc01Ln9MND75uZ7iut8IQnm2
	ZJFj1us+OUNAjDUjskVU+u2AJZLemvDaGN7u135dUcymBLa3VBquGhLfa0J+Iv9J
	X2qRpHf7f1wzkV/tKl/9wbF9tAw7VdgwFjMG+cDi0tZ+w1FIpZNSRwBzEC67bpbU
	nI20nFw4YrjUwCxzNt9NrShg55EAnvwp2d3Wuh4Kzo5jbyEyxXnUfkZIf7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3h4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso9615185ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234092; x=1794838892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=aiMYlRtLUrcNdlklgHiR4NBTVEe3FaawU1KgESm8HHL2QySBRiF2jJ3kcYPN4DHxrv
         WUei8CHk4d2LqvsbpqjTB5cq0uzvCx4F1UAAFxVMU/tqQFYqHXvyVd05HR6/wWKHDrJ5
         XFRif0fqOrSCLMC87Adnw7ubeX758R4pmtjIQE7PZzxQtM28cB6ax1PkpY08S/XQRqoK
         cn3lKtzaqWodQ4twMFe4rCuMAEYL/EGiaHKr2C5ZdLE/4VYA4eW2y19My8Jhln9HdQMD
         6kStTGyuvJecaKUm33G6ulfZGttn6GQCY7CwpXnAzRhrPxWK63Ewq/TEF7h35WcBYbc1
         XdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234092; x=1794838892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=R8AUz9+1W0JplILmPtANoLa6OX648+8Z+PzKzP66/4uI2oP3kQMhpfWwg+vIMCSI7L
         m3pXvKeHLvJUPpRpujvLDculN0hndioStBRiCn+nQDAE4XpDfhgwtuaU8UY9M7vShX4k
         QprX5J4hRyeDZuyvcameDw79HTti7utFqT2GgH5MOvCSFUSGKppWBpiBuNRT+8UGUfSg
         QRfF8yrnwiCf0FdTqdssVEc/eT5lV/HsIpeQ3lZBln0Hm9SK+PCX6mNkd7pJxtx6i2JG
         yJHdWndJ7/ielkjRZZ7IAVWlvhu8bBasMRzP4Mg/rkGynXx/p/pEKXpxf7KLZPQoUua7
         Xo7g==
X-Forwarded-Encrypted: i=1; AL+hErFwLSaCtWZIyv2U6YsRRAMRhfF/5yMYzJ++kEhQ6H5VgsXahdK9hrXeZ/IY9CzhUQsLQ210wola01sJhf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aUeqONQYhBSBlJ85onMjc3YHUp57iZ0tOcrnMM/RmoRDVz6KV
	Pd199Dj2ynkW2dCvd/s20ZdWS+FYqAroXWqI4AlxcPCgr4N+EeYZ+JRDZFjbvqbb6WKIINck96P
	7XPBiVx/crUWOyhLz/k4oyk6XzqKNQTUQI9ge8lfhuDUxzChyGvIj1URYRsPHaE8rcJU=
X-Gm-Gg: AYBFou2Q/XQnTjC1/OoVT7VkeTb8D3TQoNcxiD/ROZIMpgcup7LvBY5krm4bgCCBXAs
	l1RXPEMe3BY2nKc8B10Q7kwyD9IJGZwYGAPzsN0bRh+moH1FCDDK9jB4znHKSO1HljwHIHtM02K
	dhhKPRplulDZeccgkF9lsMGbkXECCE7EfPu2QHrq/J6OXPSvpRaEOkFnfaqDJTjzUckIPNtRhcI
	oReQ5sYPWpoRIi7GhdRs/Uaj0LnhsHBjIeaRWYwgbQXeTfaF8a/kQJkSSQsM/GJaWvBMHgqcTR7
	SC9pehtnxZsx/dfauUSMUnXye1ut+HyxIk4NBQ9H/7PTLp/9RfBZ/SAjd1do9GFEClwxLOWRJ3o
	23if5GZqYm/3KX83mLmafFic2HjOjl8paE1aVVIWfANXpG2z2GftUEEtoKIbsXnHqrwaUuV5USS
	HISKx4lbZslB5XPrb0cXVKMBWGMV0X6PR9UZRXXOuibuW1dx19mK+okw3cU0Pxjg==
X-Received: by 2002:a17:902:e810:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2ed833c44dfmr41960865ad.8.1794234091937;
        Mon, 09 Nov 2026 06:21:31 -0800 (PST)
X-Received: by 2002:a17:902:e810:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2ed833c44dfmr41960585ad.8.1794234091496;
        Mon, 09 Nov 2026 06:21:31 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81600ac0sm12128725ad.32.2026.11.09.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:31 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Mon,  9 Nov 2026 06:19:55 -0800
Message-ID: <20261109142111.256630-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX09H4qhWCaILK
 /HTOEKB1BCW6zkFVzAFUUEG0wtEGOX13AO7/vpXGofpkJPj33FAUwFjbGggvwK+g+Ca1S6Q0toe
 vApreKUYtRdwxJdBOlZvh6nUwKnsEZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXwSJhTx98TwCY
 0vPQgzYjnUYcHsf429bqgDBMYgyEvCU7iDEFeqQf1y0zetL2JWEDkFNSVb/uOk1YII/WvSQ8dQz
 QhRAHCswu1+1Dp6aa8p3EYpKtMk5QqUIw5DgHqSfDAVapqtfMRVk19BhV+TeWVngLYncdm2av4c
 ZatsXtK2K+syRv0aVEi//F1AnLkNHwwAWKRMt0cCKEUQFKQpcsoE1k1zH2MRsbQM98nJZ6anyjm
 zwbN2BEc9sghpD3ciKgZ7/LGOb3VXGw95R0oUPLw7qDV2P6oI87Q20qMaHISbsjjOef3loEokCL
 pH6/kyZgGd/tTAgiRipuXHpc6SEjJy9GGD6tHgxhmBwKsjP2Mnrwrex18b0Ik2zT4mgxBxqqBFP
 TuvTbZCfnrsvRRwp3KfMEGcJ02dBMPNV1T3a2FmvLnsIgV0UvKSSoXw2cNJIU+Vzzo9mAKIv9zK
 kict0VtPoIIh+HGdAtA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d6ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5VHPQfPT90DSkkNPp7MA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: krMSKOjKX05SDl-eKf0RwXhp505-Uvis
X-Proofpoint-ORIG-GUID: krMSKOjKX05SDl-eKf0RwXhp505-Uvis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e0d37ec9c15..2408adfeeb23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

