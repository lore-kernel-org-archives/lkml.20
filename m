Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DE4FB9A5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188411; cv=none; b=ox6995JS2YYJC4HVqZEd1pjWgNgiociBVgXS4xHSPJxqh4cGwc/w7hhd4FWfYJrEArlkIzznkl2V0lmyN9NrROFDYIIQAGHAm1k+VxexEa1rVqj+mQQCsD8/b8nUge0V+kJIxcEIcRYMOuYVYfoZ61s3W90eBDloP/GHFlSByDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188411; c=relaxed/simple;
	bh=+ofXmQ6aEwgY9wsAg+7EOB4x9r9B1VPmqlK+pXTFlrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syR4SLsBIGIVRuOanZIPsGPmBH9gBqINrPEgORR2s2VQAAFJIMelALAFs167N6S0p+k6I8JfrZI8nx5PKNwGLU0IIDIdow7+M13RKFjH0keaP2wZZjyVicR7Zjj402+3bCbuyyE/kqEOGk4FK68sIej27EZ5idBLRYUYgwT3lNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHmmwZ55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Igs1AHI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHmmwZ55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Igs1AHI4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETahd3808063
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CZ0/AJS5lrL
	G+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=; b=ZHmmwZ55ZkWxUUGmJr6kRIKil/f
	olLP59mQRyaxFb4gJ9UAzYLH4//NXYQWlNIf+R043iOWSmX2VKC/nQ3hBvEdjjCR
	bpGG4SlGH9/6+VhDwY3i4npiEZ4eGAjZhNH8MAISVd4j1XjbN0Tw3nNlurDM7sOm
	LpTwpWBQALIrAbmeBY/F83cFUT523ZnKZXsWsLPAWR0klxXt32Hr240nTlk+BSIQ
	KFM+kd+sC7u+bVKncLCyrMTXCqsx4lMGY5lQ8bUax8KOkkCectd9CO67yLA2tHeL
	nxdgKKUK7Y9iR+UwBMkgbKZrI/kpyNOph2mz2QZQKhS8oz2wM/o4djz9I+Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbakx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd16a0bc1so83804866d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188408; x=1788793208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=Igs1AHI4D18xJ+oHymeXLJCiQHaoI/JP2R5juedKPyXKgaKT2I4qZLhXYWJGOABTTW
         JE2VtHXho7nvtSLLMNua4St4aaVB9TBOvTEl+4OxXmzznj/JeKxvJ1oMiDj1KFgddrsp
         1EwwEpL3GTYqUYN1k0KfONWgok8sUrGVWWX+21nuiLuB89HZFkbWSL1E1Cf3nFCtEVIf
         mXMJM3puDxL1yNlDUnJDb9uIGXQVMYlKUCZyS69JtijkHlHVWt4IVaDpOT8iIQ/rFclC
         Ut04uvnqPGsHPy/gYOtmDV36vunA1CWUwysMwiAm0YtqfK0YReLIrpLOQawkSbCMAHPT
         E0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188408; x=1788793208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ0/AJS5lrLG+aHvu4+7DfuUzkXUVTyUzcLulD7cZ8k=;
        b=eW44/e4RL6xpyTtEXPj7BweCJNTCfiUYcrlbezT5SfyFuqHR6P4bh1G97HBjv+9we6
         R2PpILjdJvLa1WSgbCr4TIPpwxELjJniKZaaN9LeLwe0PlRc14TfuS81e+AsbjFwPaOt
         OMqKk8yw5t4YDdOg0uB9uPH5b45h4pqVXKlT+I7QF3203TOgNKqOR8eBWo+RHDPt3dfJ
         uiZx5daqKV7XHfR1dxl6jVagrm8pwUCtfwwi2MN+WikqD7jvM6FhI8kwcC0M9UbZRy2l
         Q8hHxZWP8rjYjhAXqGQbJRZyh25mvKw88OChPEhuDISDze4ecxv9W6gAh+zicuMpEyZ0
         HCzQ==
X-Gm-Message-State: AFuF++mQVl8KijcM3o2W8t/8L51t9g4ATzfjK4lAxHgwurqMtpKPyFZa
	SV1JKBQdKbyCurUszprKbA4irn2Fkf/vArV/QzJEDcowMysZTF0SObTh07ERmfliqPikVgPj68y
	T6CiQITIM4VF/JXzG/yZHI54Gkwd1ozcQktwECgezrIfWfn2jmFLBZFoQMTNHhuRdMG1N1vCBP0
	Y=
X-Gm-Gg: AR+sD10llHBvfoonPI+/g5Yj1SC6pY0D8+3xiVbG9dZ1w60CCwi5y+IeUODffqd4J66
	I6g7SYNNL3vs+YcL/Hlw87OYGruNwSvWe1orL3xKPkIYA8hV7LDEFvHJ51TPBpxq1uVqhBbzKFS
	pfPkGmP+6LXJfvSyrWgdOMKTca88RuD6jVyHgBidpOdBXYvVBOLWwn6r6yYnYcC9K20a5wsVU34
	q5vSKyiqujQ7IKQr17RDlpMyAKmmiqMhQz2UZyRi1bCDVQ5IdIAe/DTn8zxrJfLrDVBDvJSj07h
	G6e3+FD/TsS2/TJkbAn0ZU8/B/Cpz+ih+rPeWwAQq2/6HMzfFEDmWM9PeXTY+D8pomKMompwOfu
	8YHLWkCOODEiPFuza6/JI0oh3xU5gLhg5Beg=
X-Received: by 2002:a05:620a:aa15:b0:92e:8310:7369 with SMTP id af79cd13be357-9391398cfd0mr2651619885a.37.1788188407811;
        Mon, 31 Aug 2026 08:00:07 -0700 (PDT)
X-Received: by 2002:a05:620a:aa15:b0:92e:8310:7369 with SMTP id af79cd13be357-9391398cfd0mr2651604585a.37.1788188407117;
        Mon, 31 Aug 2026 08:00:07 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm24100210f8f.34.2026.08.31.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:06 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 13/17] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Mon, 31 Aug 2026 16:59:39 +0200
Message-ID: <20260831145943.313726-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596f8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX0GpluQnpW00Z
 mh4kkDoefpAq0kDXRpKfnK365UDdbnRaUNVTRsEZjsjvRn2ne3OORjY3dfn/l7tl/PHip9qxzR8
 CRzSnqzb/Bph23e9PaqF8sJrYVQd5Ts=
X-Proofpoint-ORIG-GUID: QHDgQvVTLKjLUpDZnJ8bP21cj3JhFGCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX3JLtWtF6W3pv
 zqbx6fj11AAi2LUYo7MreJxq3ed0ICa9n7B7W5DWBHP1Wm4ZVklUubSj5CEd3t9HbNlqfAgyWje
 mc6g+7KaY6xFnA+aFFTPpluZbanx8fb9UQGP2bvhZa/Jg39XA4ZpRjLrdq5oHvT/GNUROWusu2E
 OMrCObH3u1ntd4G4vE+P11YLi9dniPI/q3GwhDhE/axP3tJeXDOmwpltR2/ETbMV/b0i8EzbxgK
 krXovDVDlHqtf0GfMUodMZNGRyE746Vs1lLFnxHR8X9lPlUXtbpop1nfNdmqYlxaFscIg00hjqf
 SASJleQc2OCGVm7LWqiDo88ok6tZ7dIgbkfh1KrO5xmxOwWlND7VF58YO8bF1NNEG4UfsTHtsNb
 7RHwBB/sLDHGkxIO5N0A3j0hV7cDKs/2tnVzKTHj3s8Pq1lLOa4vhzzpks9Yik2pHfdOxaNnP/7
 LbLctaO/gjZ0XuvxvmA==
X-Proofpoint-GUID: QHDgQvVTLKjLUpDZnJ8bP21cj3JhFGCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129

From: Tomasz Jeznach <tomasz.jeznach@linux.dev>

Enable IOMMU_DMA for 64-bit RISC-V now that the RISC-V
IOMMU driver supports MSI remapping.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6e07bd69467a..1c9f2ad10f36 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -151,7 +151,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || (RISCV && 64BIT)
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.43.0

