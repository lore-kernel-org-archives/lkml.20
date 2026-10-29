Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305082;
	b=CfqG081PNoy+fkjSH2Q24/NRfzPImRHDoHEE5S1LCrw89+1ZCoHW/sJjMdlKCiVYXC+0
	 6hRzEGNkqRvcl4tscmps8a4esogIE/6m6VHypBZwUbBf3dp6CLCFHLP4nZMleAYYYR2Tm
	 4trpAu06P0UpSeI3H/5SqZjZJlxbrZGHEyMu51p/vXuqx4dBPjpurVuFhGoPxGLhckXS0
	 0uHmMoyGEZM1NyGdbP+GwWW47cPS5DiNV28JciN8c0AMd1L4P2PYY98T8u2y5wZVfn3hf
	 GJuIECOB0xCEKy2AP66q2Z5r5pPmw6Icg1aWTnKDJ8QNptmj/231tDO1nx6xf4qA/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
	b=RUNI/vE7ybL/NCXJ+NwH2SFvCaSflBoJuWiCU8PgejOMWJf/ZJUa741Z/e5L8L7WyLVP
	 xjhxHVJE0oQnhTdfft4RnBDY6iqbFUM25QJtEF4Zp0rqskbe64fNF11FQF8EjlKPjBrvS
	 ySlmfQBmhF5L/zu30aFQlseRwtDYmAaBc+/fWiKWsyyo4youRH5p2MYukC9ouNWu+9sq8
	 NXaKGV+130ml4e3gXKpHMF2vHLntwKiwobaQ5rVUdv1cV9UxfpYVt5wnkin4TVJVS3Gtd
	 vcBT4eHZ+ugXzMOmzG112lKGTHNyqjyEyIASSKLhuqjyOuhfMpVk74A2/vZQY9tPbjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pHtX//R2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOCOfK+3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF160A3807
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBF160A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHtX//R2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOCOfK+3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjdu8530385
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocDu9x7a94S
	WPcpzxK16LgiMD4smeVd0t/ViadjFsRc=; b=pHtX//R2xJT+i18ENl/QKNWY0vJ
	7r8uCHQI5u4k3CnifuU/x69t5GE+18sF28UXcBBa9Sd8qrfkkJMvuwmLaFVvAKzX
	YgJCtb5mXCrUes321Wv0qPfLRqKQj8G2cK9w2en33zUlBXOZJfyhsV0//8hQ6bxf
	wyr9h5gFFtaOmGXmBAKOJ0SyOPxwgyqfU/0+ObDusaBsAFWgecTD5UEGjlEPuB0e
	Ex35pcN4axvuLC1w6RzIFSZpVc/ccSrdh1a6vaAsxANHwbwWd+S2+8asrz8kaXL0
	UVgKCULA2b/8wqT9V1G7uQZ/NEXxDHWHa3e2Io5lM5uzebHj4+Cvty9heZA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0ruyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60a365440so1770255a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305081; x=1793909881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=BOCOfK+3lHlkvc8sz7mEInkCoxMPQW1ARx9MT2ognhvzuPXsfnQctCdSoMDMX8+Qs5
         Nochgstz1zLzzWUE9eqP5Xo9KZSyrQJv5Ykz7l80LVj1wjB73Y9U7Ww8j+2aqJUEeqaJ
         q932RW7jPEYqc4nDjy0TDUPoDpAqCPhKA+xJ9sUGPaVPMafPBlZonhmxvf8j9deYHAWz
         Q2yiphTNM5wkrrEs+a3febAIHY7L4/Ws6K4T2VJ67XP7EnWaI1M7Qa42VBzZQbef3N5/
         qhW1giMltbupV0hutuOo7K/1/s/Nd17Y+BEDcQ8QENhVxXqWphzYDCnBBbyRPvC14s1s
         0csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305081; x=1793909881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=SySGgRch7BIY1WUDHyqvMYqYv/sYoB5uMhwE0hW6NM03arlZHccSl4QEkWQUe6sZ88
         eH5rGkHumAvn25k1nHRPMETt7YxClCSm6Ke4q/mwmgABhGNbEmALHMoAG3Sfpyt0qTNh
         pIEsW+rOlLXcsNb9XC8saO4RZHP2nGyyrp//FvTRqOlAmxz4VPFd8+aS/LAlz8FStcMC
         VpJqSsvbGfPlL0i9bytf0yzj7g+dB3xNmFiROSMRmV6Grx6Up83OWVPwTGt9aDFECBFf
         X7NyZqft9smWjsPN0i2tfX6y3wqiUlUhNy/dmQyv2YWb4l+GOt2bvIlnNAZOD9Y2A6MX
         oqvA==
X-Forwarded-Encrypted: i=1; AKwUvBxVYTJXJrJaQDvDkdPgK2Ukgy9T8AR4CgoihSW1K2aL/9Z8qcSdQBnte3QArKNXp3a/xupfc0DMSGPJg1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu+xhZIZawKX+iPHrWdFtFSUjTk0ZEcS26j5KEj3Bu+m92KM6a
	MPn7QOhE/R+usaow47ANICexCsdfyDeZddT7Ysab/iOqm1CjO60l7XKpn6pX9AZ1z4Pk1UJu5pJ
	Ao/45jHyDQ2Y24Uuvu0b0vFlT5sF22S4ZRE62N3fXAdGGcSPzdNnn3RfCP85YxSplSo0=
X-Gm-Gg: AYBFou1UM3+//d/OFzl3owLRR7AQtExYyq3i7PIvP9wBiSZESffEzVX8Bp52JZdlOxh
	ZVMTcauSNXUfSKeLfc9ZJXkRZwlDRHU2WapHQRgNc55gMeWDa4IHepfH327KrAT3YJ8WoywwxLS
	ZGfGKMiDG4skZNqMUdtttHOqxpbfgfKSFmm3+uEWXcyk0DTyT/Ml8DwXQos89pq62ZxXWpS0KUC
	S68NpppsJSCgL9qDU+pkk1QlBJiXtwZyBS/mAcRHwejR+Y58Ub7l2VV1Bv6QQfig/Hln1hTJVM1
	rrfAfdF03s8w54Ibjo3EHNUAodazl7VtDs1PybsEMcSQqksxmGHNL/Bu7QksdTNzX98vqiJIIkX
	jleXZm9mvYigP2BIReLdvqTu5lvrwiI8pU1CRTsmnZmKxC0YOxrt3e7SV82MmIOY16yKrr/RBuN
	rDYDeU6Pwyt99FnfTFoMqtQQ==
X-Received: by 2002:a05:6a20:6a2a:b0:3e2:1f0b:5987 with SMTP id adf61e73a8af0-3e92903d098mr262438637.86.1793305080991;
        Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a2a:b0:3e2:1f0b:5987 with SMTP id adf61e73a8af0-3e92903d098mr262432637.86.1793305080584;
        Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0549921csm190361a12.14.2026.10.29.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/16] drm/msm/adreno: add temporary __maybe_unused
Date: Thu, 29 Oct 2026 13:16:19 -0700
Message-ID: <20261029201730.151754-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rrBaDuCJrvivUuE__Lklp0DnJ4yFw8Mx
X-Proofpoint-GUID: rrBaDuCJrvivUuE__Lklp0DnJ4yFw8Mx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXzE0rxErSvpF8
 5DE+ccnpLrxpDQKWZTwADB5IRE190AWCyILy6maBer/ip/XzOO0jsgrTuBU8YeIvkKpjNfQ9wJP
 zCTX4O1bZgAWi9yE5mVDE/xLKzIz1aI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXwYmh9YgxrKLQ
 HM9Fzr7XbsIODpf8ruNRc1ZqtoDCiOvLgth7AZuK56Z13J+FnHGPl1cfR/Gmwa7pAtVLWPt8NKI
 GElyNsmsOZn9iblNDhV/DarpKKESCeVMgMuz/Nz6lCTmu/ZH/KOCoq6ZOzXT1y3OsqRC/crPVaH
 0DUTLgZSxji+xfpdlagSbJvfdlJpoYTGFo6X4strjNt14y/mC6UFfSyiTGB8uPsOMxUylsxNgb6
 hTHskXKwe7v4bLbyboEQLUTnDWsDhIvGCE67K5Z/A4rN6Q0z0dzdCbrqOxAMAHPfGRw41eM+nNA
 0aqsVSsKXyHpv5vvy4yzgYNK/+/0bM3mLF4CIbk0OfjKeXIxb04Br+4LHIeb29ciWWh6DmYV6+y
 /abUSal9P0fCJCdbQCInJ3MJGO/FI4S4H3snD36vHYctKCw4kbAXmBdFP6qvFnD5yFEZqhKD4jV
 2gZ/jUe6EE13embDI/g==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae3a9f9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
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

