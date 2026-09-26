Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397371BC08F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790464817; cv=none; b=a17g/4bWyt2s+tuKpBh8ybRTqlodmPtOcte4qIQrJeQ8K17Z8NeL8+DdvjadzssnDt+V7heAoAgn3luIu1IpTFfsmXLwEw4zVX0fENHGiTO3D8zy4oQhlE0jhcanh7L67c8zlCOrHy+3mgM64R/Igcbf5FSrOiGMLExL9PBLUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790464817; c=relaxed/simple;
	bh=hjHuHiBLPXeUk5bCF3QBOyyC5Mqbbj635QxQ6KydDgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ECBltxKIfpBo446FFpBHVy73fwloMDw/NXSYs60YtjA92Xf4coS/WNnwaVkpmdHtn+bcspjYYTB8TVTeV15CF7uhnQScl6ob/dLCNLfTw03HxyzszREj1aR8qXhbxO/iYhi0OfV8JjxPrwrNRd01x2HmbhBc0DxFszHxjXqivcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFCP+kio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvGQ5V4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFCP+kio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvGQ5V4n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QH029W246069
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Apv0bUxILz0xu2ZX14w9Q
	0OojfUdgyE9G78ZnXEiQM=; b=LFCP+kioTfYKE9EjEwgd5wQFAtZ5DIbPw1I3dH
	SO56H5gpIqzG+IBCamhCQAM066L4K1SyyyWQ3c88ZtkDPgaIrBHWGm8bWZxa8PH0
	ufaNXS9IFLvpMfxjQ+kuwOc6vY8qtlEJhsWoTguWYD84qkN7/qIHB6lXn2aG+xT2
	EXwri8dk6vq3IzUbpu4WmOHKyEO1VKHeIYyZtdWzLjioJKDuGIWnO3ftKgBgQoiF
	Uf3YMxhGo4igPNPrYfgb5PHPCPfJ63m6tg1Goh4ZzasfawrkMeDOHNtt1+nQqd3Q
	DunIIerqHaV20eBQZFq6lYRRZmOPQ4hGbybHQ5UFGy+N+hLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp27ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533306413ccso8116771cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790464814; x=1791069614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Apv0bUxILz0xu2ZX14w9Q0OojfUdgyE9G78ZnXEiQM=;
        b=YvGQ5V4nMeGwFUl8aGyd9HxYEYhX8CqfkoDyJQFRa1YlKIpOLQ7FAePcfZqki5//Ra
         qykZjJRmtTQIkJvPzMmuYdg8Os9LWK9tYirpxJ4w2G3M7PSYnJi/TA3GjOF7ECDjtsen
         TQ8cnMbghATskmvBaxKnt1EFiYSxRo6vI/cVhUxrvdxyUgRKgLUewpoen26VihLfvKPh
         bqC6xnIBd9tTFoQRI0rTIeaKKoliVy7A7zX2u0QURXFAOvNG9HRcVXe30caqaTMdDlPC
         41AkmFGbEXFl6WJZryhB6JsWZsDDJyhJXnsGXGerU6IfFuXzg0pqZvkRFfPMgHivF9/W
         L/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790464814; x=1791069614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Apv0bUxILz0xu2ZX14w9Q0OojfUdgyE9G78ZnXEiQM=;
        b=wByh7ptlBYn1P9vXpavBBoou6dsVL3T7AL2vumJ7k12JVIOndenAWLr9PjAg7AxEkS
         /vmQOedYNj5/06mkzZvOEJXFZcYXKK2VyKHsKwvbYxClAR2rfQ03uKdU9pByNAlQKE2d
         A5rC8Du83aTX9Px+IFKT1Qj2H7ljonfQExnZK0pdSEql6pHRGyIufWc8xrJ/BI5ChFHH
         Y5klYScoq58htNb1h4ND3goVDoG0LRjN7LOWnqEnzhiFfMhZOCMeHbSV220w/TshhLMF
         KwuZFiM8+Q1HD9r/0nt/i79BdyJiIKoZK1R/dum8GRARk7hmwIYy2x6uPdcbXTpk8NCp
         udKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/UIcP0loh+F0ACow7csJmopDKxXbo3wSEcPsfo5IjH6uipZWNEjkk1IFnWaM2Q1xRoL9vYXOzdRAJ2vg=@vger.kernel.org
X-Gm-Message-State: AFuF++kMiIs0tGWm+D9Brp3W02x9EbCcTr1O/huB95ZHBjfKX90UWn3b
	NEN4YBDbTSJJfTHCG+WzfmtXml+on0TywVObnFigEa+Ht/N86HgCuavy/wDJykVQ6Mig8qv5aUv
	IrQZKTH/lv4pge1WOLbgGv01dJlZ+SNZBNwYAgZ7uV196CzCtFknlP41df0D6yTC8iKjPHG2QKk
	k=
X-Gm-Gg: AYBFou2dNSJyED925HM3fvsGKGsQM+hfPS/Dcc5mAbugAMYB6Og46kWhWrZ9hZo4blQ
	zXE2dE5zgtgjmyeijn36Zpj34UffVjdS054NhioE/kU82BHoWTAY+jC7DybeeKtNaRIfKfx4B2O
	qbyxH0S/DVnc9Yn45KHXX5PY/eMcAeQSZZWGn2daM+M362MZBhX7Fpsa/p8FDUT0xeZV0fVWriT
	57loztSOUUbW3FkcIrC1GboxLMKzGsK2ygJ15VkAPR9KMkXyeMrrNi93/3mJljDXZo9FbP5cKgq
	Ju7wqOELj8FEGnQZij6sPu2YbzaCZIlLQyfWr22InZfpv6eP96BqXQWOEkqlbkxgk6SQKnQX6dL
	NVTtUFhVZgAoFyes4woG6OQ1uK0ADYzh6ZmObaKtlgxBCjxaQBPJT907eYWe0RJcRdoqmnIqXRL
	hWqI/ZNrASDsIF
X-Received: by 2002:a05:622a:310:b0:532:d36c:708f with SMTP id d75a77b69052e-5330b70c4b6mr119234021cf.30.1790464814326;
        Sat, 26 Sep 2026 16:20:14 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:532:d36c:708f with SMTP id d75a77b69052e-5330b70c4b6mr119233621cf.30.1790464813825;
        Sat, 26 Sep 2026 16:20:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c3274fdsm17676311fa.38.2026.09.26.16.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:20:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/adreno: implement progress handlers for a3xx
 and a5xx
Date: Sun, 27 Sep 2026 02:20:06 +0300
Message-Id: <20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZTuGoC/yXMQQ5AMBBA0avIrDWpShRXEQt0MBatzCAScXfF8
 i3+v0CQCQXq5ALGg4SCj8jSBIa58xMqctFgtCl0ZazqHKMPauUwMYqo0o6VcbrMcltArFbGkc7
 v2LS/Ze8XHLZ3A/f9AFCMinxzAAAA
X-Change-ID: 20260927-adreno-progress-87f92d081376
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjHuHiBLPXeUk5bCF3QBOyyC5Mqbbj635QxQ6KydDgE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBquFMqjNDriOYaePmDwAq71b3O064p4ktvyxjMv
 x6PbbfqAOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCarhTKgAKCRCLPIo+Aiko
 1TxJCACiaQuVb82DBrnCRZFAUVZzWCobCtUOEwZGV7KpF2T5FUqnNxXLC41Zf/d8CgIqiGH/Yq4
 SoZVdcbZKQc5DbR8STm+Jsvb1B6cmdiBjujoSDaev6qQpt3g21kvGo5OMDvcNwOs/5Fb17CjPid
 J3Wnwg3BUOAPVlJWMzZvznWMPjE4RjdyIZeYXJ7RTvucfUbkEn6KIbFv6L47cfFtRseLBvtXkQi
 MECQuPDKHR16FSzaWzYAAddcuDRGRen6b3HMPWoPorW14I0Ekh73ZOLFzdk3p5P00HPKSLeKhgP
 B4zuwFt2ErijU3DfMU/GhM/QaqbOzqkcJe7nbRqJIWiBY86R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfX09qtspmq5Igh
 yKboDsutXOh8Y6EbzOTTlHLnThaAZThqtK16SIPq9mq2oZG3IgFEVS0rshEp12MfFkl9y0Sv+tC
 2yFFGnQRK22KTfysjI+Ywh6UkiUned4SEqAtz4XOlL62zAOiJCkxCbiXXeJ4dMkWBah5vJTGrAQ
 myXThxizsiTaAdDi5ICFoV85bXNUHHx+JUvVK0CbG7l/xeK2PQGKSyeJjO9wy+OzwVEGa31N3jc
 Bmqi9WL+DY5yq0hdran6o657e5E44fMbs21ISPm40ZgANzpdwns+SXhxD62qTQFQsdyzAMncm0N
 UjpsUjmLjdZfd3FsQkoIuLLjcc9A3xSseUxDre0pO2CR6kpKp36sj41YAPOefam1t9KmPX1JLe7
 nJXAZDox0zWxFJ9QzQz9sKN8Fz7nYJOubNinKPVfyBRIz5v7fBtzmx1qhfLQZrMDc5SNWEPjji3
 UPkp7kFC0vEGtKB439A==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab8532f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=NlBUUgI1MX_TVLqZzjEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hBb6PnoHviO1gg-va9yY0QR3ndDzLBKy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfX+K0ok5s2D6rT
 shJJVXpizZTEPkV3UZ+K4qS1vioo6uaQM3mKzr6LG+QsEquWnUVHqQgktPwoDqvCY0ya9LuXIFW
 eVtghUgaalAJ1SmOiyelumck59XtYeA=
X-Proofpoint-ORIG-GUID: hBb6PnoHviO1gg-va9yY0QR3ndDzLBKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260093

Adreno A3xx and A5xx don't have progress callbacks, so any submit still
running when the hangcheck timer expires is declared hung, and long
compute or drawing dispatches are reset while still making progress.

Implement a3xx_progress() and a5xx_progress() callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/a3xx: Add hangcheck progress detection
      drm/msm/a5xx: Add hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  2 ++
 3 files changed, 47 insertions(+)
---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260927-adreno-progress-87f92d081376

Best regards,
--  
With best wishes
Dmitry

