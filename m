Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941106;
	b=MshPmPLbIwtOJWpjEYAjfubIx4b8j5fSVkBiNuBo9pTGuLKttOoliNaT7dsayXrSLHfy
	 wqX6PlTDgnc5FT2NNirWU3r5bVaMYdAuG0ShItOL+KgHHPnvOMeneVp04YP4V77VQMQy4
	 H1DCjwUUZidlLacFiF/7v2GCh7rTaoR+j9+yI9vKlB3TgCcdEVrb0Xue6mzlCRESgsuR9
	 E0XxTf3eYXAdf7SlqFioTlH94iTQ77YjfnOpekcmhU99mUYTuM6Dsw8QxndaEYecWV0gB
	 6jJD5JcqJVU2CHi4aT30+uQ5FGUc2gAyXeTgflWDYxwZIefhoGGawqzgXiFvLpDsfxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XsgzVUmQJNtfxzke+KkwGJhVOf8KyHdxG/9A7ILLhkk=;
	b=Ni6OWjYIauID9AKxQcuG0fVqweG01GT5ol6TE1BkBFv/i9HbcQggHEabB4LvGT74fKCc
	 nZhHHo4c2tZPxI7K44TmfiD9HmKTZazVuZZbi/gvBwvSVu5kNcAJu0unEh0lr8lgAIl70
	 D1BONEPXKfGB9yHDzSlO5AZBKkEY/hzNEIRjoUXGYu5psmkxK7nivxMwtYrEI/9Haa+Pn
	 doSJEvBKRIv+0yO+cqVoEhEOph/I+NjPtdjQO4faY6LaHLupzhPd+fhx+SLlHtREvA7wn
	 e0PtdAnn6VubSZK6aDTIDtOdMtOnvOBjEzuB24hQtUwQf2KiBDOkqFu01JOIc0coj8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BKXpZ0uB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjcSWPvg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA15606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA15606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BKXpZ0uB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjcSWPvg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640tx73419437
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 04:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XsgzVUmQJNtfxzke+KkwGJ
	hVOf8KyHdxG/9A7ILLhkk=; b=BKXpZ0uBffnIXUd44jYNYymX8NvOygEOzTW1H+
	LO3hKZ3Ume2i74ijhKRAVOpCdH+if4ulzGcdwV3oWKFEmnKJBlHutPiIvx0t7hu7
	hQ09C2fPzCPG3AVEUhSFl1Zjngecfe2j9tjDCUDyZKSUESrVplx1lDywryYXbZDs
	q50wxuXhHGIqdjoSHUyz/5E+Y70FRUkX3DaPzBbqqogcrLFZs/kuYVTIurVr/QYP
	w+iyAa8nsyXsH+PKhTT5TPyBvCZexsa659FyR4+hRxs9IfQwHamLdP+cU5c4H/YC
	qLR6QyUZAAoqmfzy1bMDo4MbamZmRwbtrg8YOvEKD6DQEgZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb0ynd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:58:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so499045eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793941104; x=1794545904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XsgzVUmQJNtfxzke+KkwGJhVOf8KyHdxG/9A7ILLhkk=;
        b=HjcSWPvgRbI79bJLZwuzMZYxOYWToHF5Y0xvf43i4Lkt44mZMrHPmGfEBBCOWjcQmU
         q3gL0sZ1sToe1ksxSZZOAk4qiTk03Xvu8cV623FzONPbtwzEJTlzqONaOd39eUdF2tTl
         hxH6pELpP/Gd5p5U73doPb1U+oqM9Ma3YaS/G1IDndZYoyS/0JHNSdA9azqQF/WJcY8U
         VjeWkC9EJFsPWvmjJIsRcl4/0ULiuVPJq45ACIFKBkyvg1Mt4Xf6gtojPgdPwrPw/QZl
         Bhz11PJCG9xLT4tJPOF1331MDrz9fJHN/paQ6azhPwyenofIzFZ2M/ES7pgIUbtvyno5
         BR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941104; x=1794545904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XsgzVUmQJNtfxzke+KkwGJhVOf8KyHdxG/9A7ILLhkk=;
        b=gq8DyTEXlaQyFczlhVYwD6QC+UKXFawrpQPmCrURG4fcctsgB0IWWrcpCVWrk1jrmj
         lzXbiMcHlXmrJ7sePVQSXwT+92+tF6toE+hom0w/g7j+D8geDP9srcCjDA430439EfuV
         bygDnWDu17fBjugVAb8ZIS/e0p/5Yb9594xrGS+9GImU8b7KuaiA3fTK91dfl7aRgFzn
         rPFR4BVLqDnIznCU1jQ9SEQsx5rRxzFNtVEtznvPoWj85ze8IGMvwQqPdUJochrS5JB+
         mQDMDWb1JjAXPuVAjwDMYNCbmQcU3NKO+bYB+uqh44XnBD5C9OCFPATnE5KxuBH6u0KA
         k8ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEdQtv2AExAU7CECOEV8KHI86nhU7eleIwydn3Y5+FYGL96G0k/DL1HrSBrfYUT7xvQtkfYVsK7jzEMUS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SVMPw0KaQRgJ3fid5RGMRvAVS49PEuvHa+7CIv5aw3nJbs/CU
	36XPEkAIa09vNL2Cqc9xXi7/JJSpzvPG0bvdGRfOXRSu/OnxgDEgnN127i50rTdIFRC3tDY2Ner
	5Sw52XXqgUiqXxsqySOZLIrEMReA0p5o+EHkueN6N+oLMTLgUHVIbRqCJK8XtorPc3Oc=
X-Gm-Gg: AYBFou0TMW8XVLCHlUIOkmhs7fCQtJftNIYnrtkJ6f2kTn1d3I2qtujIuQOuWdEx/cO
	85eLPWOPlE31HNNnPiGu8Vdd86E4aDvCRI+nzPlPgP7PAb9CuFCebHgeBEmdvTp8LVkKk/jcHLa
	UpILWd9/7lgGFW/iA6vS8spqh3Ay8UUQm6RVUps0hSGuzJGxnGOBUNoVXhPUk3MaziW7EBfD807
	kM6IUr2graYL6s1CPCRSiUDyJg5hii16Q0KtFdhqUHCSsHA40iOJf2aqcxXCSfu6vKDQnRTZX6I
	ReDaDsFnpEj4SWEaoTh3xFHBoDzkT5LW/MzshNRFacMCooFN1BNTVgGEdwDb6TTfwN+gsU+2E2v
	HYSvFXBfzr2bPhCXGGSmP8z/gkggnjLkZKPIeKpM6IhO6DGg1vhPdOl3HZ3kG5GOOyg9NSA9cOd
	26Fg/2qpbnvyRMdSW4gQyXGjRgo/MwqDQC/7nsniwHz6DTrWUsceshBw9fiyT84KXgrfsK//LQY
	pTg
X-Received: by 2002:a05:7300:d112:b0:36f:6b99:f963 with SMTP id 5a478bee46e88-36f76023b1bmr1859394eec.21.1793941103877;
        Thu, 05 Nov 2026 20:58:23 -0800 (PST)
X-Received: by 2002:a05:7300:d112:b0:36f:6b99:f963 with SMTP id 5a478bee46e88-36f76023b1bmr1859359eec.21.1793941103304;
        Thu, 05 Nov 2026 20:58:23 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3021327eec.6.2026.11.05.20.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:58:23 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
Date: Fri, 06 Nov 2026 10:27:41 +0530
Message-Id: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEVe7WoC/x3MQQqAIBBA0avErBtwhKK6SrSwnHI2GioVhHdPW
 r7F/y8kjsIJpuaFyJckCb6C2gY2Z/zBKLYatNI9keqRXcbV4C3ehhu7TdudzMAjKajNGXmX5//
 NYLJDz0+GpZQPxE/huGkAAAA=
X-Change-ID: 20261106-eht-ba-window-5c2df1a8e910
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Paulson Raja L <lraja@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793941100; l=1181;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=rbcT2clgcen0buC6OtLy+ozWF59CI4Wkol1yGU9nElU=;
 b=gcqBGq476ntp/TuFBnNIyxk7qA7phEhnZv73IWeGFuOdIj96tGa0ZjaX++u8C725SdCkgLb9M
 OK93rJSLTTODWc1INGvjkNfy/0+dtmWLIq+zjyMQ0xDUJxs9m1jeTgS
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Proofpoint-GUID: 8Yfg5BfLBaV8Hnm9FbDD_vLQful3qWbw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX6Jm0tKkq4HZn
 tNpQbdfm5K05olXDD8C76WlU15Qiudd4XOaNMrfPYzy+ZT+As0oJnGSUBcBGHNKoeswx/u4Y5UI
 +aJeyVpSipwN9+fEAcld9dtTGd+bOjU=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed5e70 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2SF_I0XtRLf-0q3h2KYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8Yfg5BfLBaV8Hnm9FbDD_vLQful3qWbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX5wNGbCgHzGAo
 oEvzMi3LEWOhpKNc1/XAR0KWq2eGPm8ajqg4AU083HEBVnVGChBPRzlwisVUb6mS1lD6v2+wj2x
 FyqU1QprVFvhSWBPxAQmIxeuZhBCKPaMOrgV4ZdUgwjEjIlsIEUgXj7tTD9hboQ31M5ARQr0n93
 VbfI8KuARf2kYQiAuqTkt6dK8Fe12E6FLW/pR6hdfq/Qgf3eG+GnqUybVOhXLirXMgQ563XD1Pq
 Vu/OOl2p7E0lCa2mjSIUnAczAsdr0LhsOeDwgCXyCXgsMMQlbAVMZABCtImlAoCeg4uFsDpQkde
 D/lUbPZCWvJocPYjLc7qnqPhvCZAUUF4e2YHUyeB2ChifpuibZj/1H+ubMjxu5w3TJUIcTvm7fD
 hUiApHXR8/50nCtcXSMF/g6rmc3gzkG159bu+yGGHREgz8Gf94ZI5VoPokElb21yYVJhHPo+vtG
 zndCrBTKCiNEYsQRd8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060019

This series addresses two related issues with Block Acknowledgement (BA)
configuration for HE and EHT capable links.

Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
for HE in AP mode. The existing code placed the BA mode configuration
inside the he_oper.params check, but mac80211 does not populate
he_oper.params for AP mode, so HE AP links never had BA mode set.

Patch 2 builds on the fix by enabling 1024-entry BA buffers for EHT
capable links. IEEE 802.11be extends the maximum BA buffer size from 256
(HE) to 1024 MPDUs; without this patch, EHT-capable links were limited
to 256.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
Paulson Raja L (1):
      wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links

Rameshkumar Sundaram (1):
      wifi: ath12k: Fix HE BA mode configuration for AP mode

 drivers/net/wireless/ath/ath12k/mac.c | 41 ++++++++++++++++++++---------------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 25 insertions(+), 17 deletions(-)
---
base-commit: b9acb873d035fccc8824164246535ea6fc95c71a
change-id: 20261106-eht-ba-window-5c2df1a8e910

