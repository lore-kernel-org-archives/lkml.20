Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538323;
	b=vp35rcLiEABj+Vgf5cYlD5MSuPGyjLA1fY3fSbhuLE+FZlnwaClJgYIa531+qB1SAvPX
	 rqKzuMZeoAnYfJeWbjDiGlSqR3mvrh37LuUN1bNnFwQshMH6M9ovJKuF2Z6jegNPMQPBz
	 djMT1WkP9Oh/IZVqpfZDdL65330XS/wJIj8Im31+uhtMmlZkej+VhttH5RkkFv+wqsEqc
	 zph6Rx04pC4knxIp1ybZjYiP/8jnh5r5lJ0VdPWin2UGJe1x90NaCsjZdV1xvU1693yhy
	 N0kkZQP3rdP0P1QtLxLoP4JCjZ3aEpgXvAco5W9BlQ5NkFi/7IeD8bQ+IxPvexsDc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
	b=lo/uTtSS6n/cNQcaeE5MFzaeI6f5XvSxcGaYicP67JQTf3YjJ95aktQ0nhOnZOYwqrKb
	 NP2uKon3X9OPtWOd5Q/vWtYg6B52+m7tRzlOIJjLas8U6uTmNZyh+nAVKLakX2Thuimcc
	 bdrIzfTX3A16MSRbtOQXyR4OCExqQHa95MCfpWW0Ys6Kj+1uA9eeU/gv/YTKHXPZj5muo
	 GdJ65suRK/K6PaSWWwCshVhLjgNSACHxwvH3g0+GJ/030+Sh/dl/v3olZ9inkoJ8+plEc
	 fmA8pP6iqT1CkthWNgTlq6V3Q68Xl6gg5q+U4bMx7OzQvV7Bkj/OwdEhEogqFrE53iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEYT+nQD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD13606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD13606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEYT+nQD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KJPd1534473
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x5yFA/n9nxv
	Gq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=; b=Vpp+Hz02BVWXrRiiEbQnuboyziD
	ZbkneievJBqeDJgMqu5EI4OFJ4zP14AMNOP5wxl6qW2GmCNbEuav8Q76TywHunH5
	D+latF0oPT5M+S89PNtLQlPgDSAI5U6Kiz453JIVCSaHc/RQrVY9pFQfxW3Zhv+3
	5DhiOquiTN0HU6Y6JMksegrh+LnKtpXL0+b1Vci8AJZaSWdUsXDM4Z1UMhnerl4a
	6rJRLevnZrSg9UhOTzzCk+jBamvb/7EdsSVTVO2fQ0me4hFqIeJtBLd6htksPNGj
	+7QQ7yakt4mt5wEjCE2myu4DWlAxtA6spbOnnG/UPEyEto9PJy3LLGGHcug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1ba5ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so6309895ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538322; x=1795143122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=HEYT+nQD2EzC86Pa5pVS9iFRD6YAOv4oTrM4o9Q0TS4munC4UlRwl12HWNto4SR4oV
         mFWNt6uvIQOeV/R9conTnpU7LIPRHufQ+gykzi3pKzXcjKJ5dPx7HReHUDLyhg3x4Ycd
         hL5S0ON+VLlS7aYXao+JX15CCpBcwyzaMnieC+iXSOxY8GJhM3mP45SDQbf2cQNQ2zrE
         cHxh/aRoToQckgF469V1BmIag9xkxiZGJamHiXTXsX1SD7uWOJvRmbr+xUCWiIjApXUh
         tAkpjcDlQdY/FWvmNALCIjwOkeLJez8gbANcky73i6CweiFE1l4Ix5tXv/As54+hJKok
         dILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538322; x=1795143122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=i4Yd53tjc2cfeJbKY4jXtqw0DeckE+M6Uf3zmcA9q3eI6YX2NbL6PBEaEARcpu4/u2
         aKSm5mgy5VsOHMLFWMN4EtobfV4szGyq1ahP9LjNM/AhDrFAGRzNOWhBVNdi1KAEwb95
         n2N7XRV35YXRF5kAAW97VUAtzIoUwK8bY0/lFxtZA9YZa7TiUCtKpkj6OBaKJKg+QODY
         qbmUyJJsBJrUnBlWsnkAAuWLv71/rVM5mi7xBqUAH0efZQ8FziFeLL/9LZ38dkdVFEvJ
         TPG+CpgCz/OBFttaPsB1eh6WYcJXqIb00g5AbYZLiXMzwDfexx34vjRj6NQrJWje/NYq
         SSig==
X-Forwarded-Encrypted: i=1; AL+hErEJ1avToegPPUpFRBCnOSJPhkPgqyYzmsOtRgk/ChLG/qgWXHW8g77DD6WORsn7i9cmFL8Y67CkE8k5Z8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ir3ZLkOkycL7MUO4sB18KgRD5dCvewXKJnlfzguu6AlAEMemj
	Qif0k2ucblL80uYcuUxy20dXknK3LcFisYMu/15ddR/l4+R/skhAkTt1f5nL5N1JsfsbIj9SgX8
	rBtPdf1/kecW5TXVIMEfNqqQZgUZJlttEAELrwrGBZkBkC3H3qiDoC+9k9jXs490Tfs4=
X-Gm-Gg: AYBFou2b1ZUj0Kiv5wWu5Lk4LEj3tRtns4jOfjNUpkLY9bOCVnx+MjOQIL7IBimYRJN
	zplEVX33L0iw6roIKc/pEgc+FxYFfG8T0Ptm52VZPWEb4pH1y9xufSNtJyHog54e6XrykXPl2RH
	0LJxF3M6oZWjLw7on0iW8rGE5qcGNnMKkPEG61whDXVh0lCQkgBd4Xgy15n6fF67+6LWJ1F+iEL
	9FQ4cXmYHOetDgtwX5C2gfAr5wNq95gfaHJoOMX4nmk61xInBXAypIs96Ake2euFtuK4pCJRPCs
	UlUN223rLcB52UIPshNWI+IaJdwe10l+P2sy7q68ZOQXeHzSQdHfSSqeQ6BNPDz12MxPzulbWo4
	QVdE4Gu0b0hkkQRCIWyNbQyN85SpTkZ2XyiOKx8nkFmkamPTs9o+T4Z/yX9xlBks9eaPNd36kW4
	WeyNm2p1M=
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325595ad.17.1794538321698;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325425ad.17.1794538321253;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:33 +0800
Message-Id: <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af67b52 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wQ8sKV_PtrUBvD2kYdcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4BvfIQHUxjoJDHTWO1LeAcmEOpJpSfQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXy0+/4Ew353bN
 mlM72b19cVgCaGbFiCK7VV3x7Wo0alFB3euJjtiBlCkYe5NA1593lU51S5qnAejx2k2cZsAtt8+
 FZtrKQoNiD7MzEUwVnNLbD4IyF62IxxaddX8bGmqOMBgaYIIi3qPJBn2gDgZDcBV3Pedehn8jyU
 oO9R4VUQp/T9kNqvbIIxldGwaTGPvp4A+0aWkEpgJ8xTs7jNvbkSyAjJz9rSQAzOPAlhCKPsZdf
 MjmJYW+cUMggQrrIOor8+vl9SQB7Koz2FwLGhwz4vrdQy/L9DUvKLuY3omrbCb3hSBkGs9ivPUv
 0soEVvxkV+l50i2bK5yNuVJXb14n5JSawMCiSdNfiMn34XEFp0bNPO7L61vqHJbkc1Xez+L6z1A
 GSYb8ABg2Px0pHO09hegWVSFvswFM7TTrwbNHMXt4jWSUaaNcHYFiQptPZJKl4HoA+58N3Bo5p8
 9Do5deZiMfKuzgFDOVA==
X-Proofpoint-ORIG-GUID: 4BvfIQHUxjoJDHTWO1LeAcmEOpJpSfQa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX29EIFVQYiPW1
 Wnoxke41lfuPTk2XQ0StiT2JE0OMj8IqAyLpyB7M8R51ztEs0zhrAseXG9BmtwdVq9M3d+zH5Ib
 LwAPooqhV38I9Z+CHWJ7ddt9sD1MnDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
(0xfc0) within the generic CoreSight management register block,
immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
drivers/hwtracing/coresight/ that follow the same register convention
(e.g. the Qualcomm TGU, which uses it to detect its timer/counter
capabilities) need to read it too.

Add it to the public include/linux/coresight.h so it can be shared
outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
CORESIGHT_DEVID already moved there.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 include/linux/coresight.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5286b3606581..7ce0366c7c70 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -37,6 +37,7 @@
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1

