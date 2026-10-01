Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B7438470
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832287; cv=none; b=NdwzRgsdO2Sb2DWTs/HzOMBEFtPHZ4rBuyTc5tIVJH9FiOlaHFAaPPwt/9RBua8IjPeC5RuEyNqfJx3EoeQwAa+NMTdih9lha1QAqtZO3xCP0cZHMd/OMN7B+dgMvze3SQCWiY+S+6gs9QDX3sorIwkr5mKF5UqzpFLHvbQrHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832287; c=relaxed/simple;
	bh=OTllQdlKmTDotnvLB5YmAFIeXWpUlALuhilhiCpYNtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGQ26lkNbWd3RlReQmPja+QJ0OLE/Tc8TPvrGkMuiVuBs5DOSdXy/xTf2oH2ikyNqxbuIsj4HKdETKR4IJVaI43GiK2L1YX1pS4AbuMQErN1IzTZupu4ggQAolYhqq/IghdyuhDzcg3h2Xn2NTyGbF8xaRqyujojOa/YCCwfd5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C517Vw//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8a9/16P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C517Vw//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8a9/16P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gKdT1088524
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eQud+U/q09O
	AASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=; b=C517Vw//3riY1HrZ2Rru42Br8sQ
	RQQoeSylAikEg3qBU2BpkMk/GMw8nGIAlDBAnh+P7dXbSsQW7il1LGBMC3tK9+gO
	lbxnKz8xzvK5hzR4/F07EcZAGR4423qEx6G8bLCjNAVs8FIiyF1bM/7RZi+vRPUr
	Boh+bVgxEAbUEfmOmAWV6sy9EWfKiof7JDoDXXtWdfjmJhdjUDe2aKoIGA7Sd/Tw
	DEZQimNyJzOnsYWjm1pADydyyekgxOOYdMOWdBd+ae84jQ6PpKJDyF92MPWBQRZ6
	HqrYq7RnNTMGauMZo9xGi5iSmxncLw94lMKaVnKfIMRrhVX2T1gJ3ecxpLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sswb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:24:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2f3251e91so7769145ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832284; x=1791437084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQud+U/q09OAASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=;
        b=S8a9/16PeNbRoiLfqxvlr0cu8ucsPQqIVO+GJGFwt47/OE61FdpjR4sgaw4I4RtWUb
         sIptO34pCsWZnA7zbcp2rY+sToss9VkFy1JXtIHO13FZo2c2K+tmq5gwRsT9oUJPNIxK
         HG1zmzvKT2sjd+zeQk9ahfAkeR7sFJ1YALI4T0c1TPo2jzIK3NLtBqIMYr4WPfKirYyy
         ekeTwH34CFLj5jxQOo7HGQ8s945c54IyphstLwzYdu90yWSqhlEBi0k7aYDoUeisDfnD
         EyF0FAXdPGOPCbK69oCQGrd0pAQ2pHBNpgR7ad9wm1rm4LTzUa+VLGKmJRUalIdDKinw
         EKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832284; x=1791437084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQud+U/q09OAASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=;
        b=h3x6DQwrgwd+TJWcTOVWv9FGmXy6VS8E2V9lHeRMkLhR8Sn3tSJQ6rRw+a72YBuBNu
         P2uIdWDlF/KdL4KjXIOJlMncn6FCpmRL47oFm2QDpGR8E/ZHkow9EChihEGfeUyFK8iY
         rIxYRlY0O7Kx1W2flAcd2ok1V5m/xDLiAtHhH5KrBqKxaa5ppbHUDl5xH9PeTWcE2RZ+
         BcGHj9TauEzxcIUdBNRspELIfRiQXIuyEVeGGewzwGpXBKqjOv12y9BlmhOqM/Q34Eti
         w+LOjfIYYx8hVMXuMKd54DTPrnrciv89+rotmqniwVd0dDVVvd2DGVqWkk8RytHIrlwf
         EUpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS0sFZOpT6pYWSEVoIYQoxf/oWM4knBd6ELHGCMKnFACnM9T9GmSkpEzDf40dlyCwYZklUUKcX1KJEV1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEyRjizn/9zgQEG6FVDPMgnic+VlOqH+7isKIm3XQu17V+DgKe
	RT293qx+6cUr8rXxf5AnGnPgJixRqcORmf1AusoDGEaITcOq0vu9I4JmsQwvJy6UYk9lu3fQos4
	wHazxgsnM7nvxemzXkuOzjMpG6pM6/trl+Y/S3g58cfTdazrXoNipRAn6Xt3dAMWqcJA=
X-Gm-Gg: AYBFou2vwm3drUlToU5vhXE90p38hths54SPWTIO7B/NGC+nGr92up8dN0uoEBQXDco
	0roKUeyqQgxW/DYH5FtYyXH3GoOcJEVTgJsPbZQoSrAW/wLUsZaRyOuyk8W8IO15V3tJz16NVpA
	IuZyCQ893drsy+vEW+zbUw2bb61Mj67ksFKyakKf+iF2nqiEhFZ08X+iPQPfJcFNNFS9opeQioE
	APb03N6p69e59VHkp1bXqVzxBumnn4ioSsIQ84EdSNDBXRfPKw7mWLxD4SZVIoUsU6Iy8owr5JL
	+MUfTzIQWMsAvLRu+MICTQcHzJOEgHEx/bf19swcM0gGWBD+x3ctlkGRbGIRWklmi0A01ShGSy4
	WlQzk0oo8AjiBiyMpsK+UZp/0c0avt4GbPdqMIh/Zbxp/mGRPdOQgqe2PEDtFCBsmIPfQDqefrC
	hmqtrzSS9+sIvgfkjKjYKT93Gi
X-Received: by 2002:a17:903:3d06:b0:2e2:d02d:a171 with SMTP id d9443c01a7336-2e2e4b595e3mr31893015ad.19.1790832283813;
        Wed, 30 Sep 2026 22:24:43 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2e2:d02d:a171 with SMTP id d9443c01a7336-2e2e4b595e3mr31892775ad.19.1790832283277;
        Wed, 30 Sep 2026 22:24:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:42 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Thu,  1 Oct 2026 10:52:21 +0530
Message-ID: <20261001052243.3042627-11-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX0FxtXiS2Grmf
 QkomJsWjTolYL+AxynZ2uYgWi9xD/ycKJakCPm7J1dTFrBtcdTx3DTCrJrLBa5PXVoT9osJFoGu
 ylovBpnIORDlIE1echqQvC3gvO6BSnk=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdee9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YCfEXjoPYnDEDssWwwYrFKMFmWKWtTJc
X-Proofpoint-GUID: YCfEXjoPYnDEDssWwwYrFKMFmWKWtTJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX3uiEBeityIW/
 jXXz6EyccB13lShuoOgBKy0k7kg0ZI3naJdyFXp5ar1m23h27D9WY4NJQJZPm78gJ2AKBTKbceD
 xUPIxrNhdtVkLE4fwrB2ATUnLRFzmgK5a0oC2IPTXuPKwezPO85nQyrJ99caLCwUrrXoMKTjoH9
 LbdK7VVR+zxy/1bNboS/N//2NkTwUidqRbRbdlU1e3LyhoXqxzVkmhinzwOfYitJ7RoBE4IGGd1
 O+SPT4XLoQ5CbBCsi1IV/9R7XWfAijSLRc7BTYmuOTusATF0wzhHMV8sPUO9rczCc0eWiUVKgR+
 M4PVmfdo3P2b0KLo1xjuvALT2frTqXE2HXcw79es/6oXZfhX2Jb5Rtu06+nS6H2I4oFoeBPgCUi
 Vd8jCbMGAn2NsFrpWSsDm/Tn+YQzuzW45uqTBWWqATZ6pHcAgi7TzoI1BKL5s7FOkb/hJSwm0c1
 w14jMvkKCxQKBJi43ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..7319421dcf7c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -306,6 +306,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0

