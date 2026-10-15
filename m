Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966B47F79F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064429; cv=none; b=aK1ySN8AkvRVUQdofFoKjkJbsEa+lsEvSPkCtZhFyqS7/qGqqDSjDA29LAbUqMVV6HVNGjBWNX0y5spWUhCX5f9hFUMuqUcI+QcoiIcJJ9vgcmxU6iGN0LpX/nUMG+zHCJd4eJFfbjAe7wlmAk92rK6eP1Wwq5F2R6ot0fEjgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064429; c=relaxed/simple;
	bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrbYh93eOiR1GReiBDrrorhGrKquETTheglp8ICOGxUtEJ8wdfECsiRXrh2x2X6IvU9jKndvv987RFp6A9Mnz/pJhX4X6mtQgytUCBFim18Hmm/APJPD/nf9+Q8DZJgVkiAlFS1NQD4C0pxHvxvWHUelmkBDv0Nsw6BOcJaG18s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fccRvl3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcgrXFD0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fccRvl3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcgrXFD0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kFsC2999158
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=; b=fccRvl3q5BxB0woB
	nKbTJz/u6hBKEKfzNruWtx9hvX9Ha6CuYHJLlKRVIwR1WM82MBSVTl8LTR6bJYKJ
	bUQi2C1N4hWZUz3TP1z52TG3ChLZe3aOQA0FRZavomV00PmszB/X5eQ9WsSJ1h66
	CIiU7fYbankI5D3iC4kfq8/qMKkchaWIxJZF1IseAzA27KFQsITgtPAlL3Kq9Lv5
	rMzyw3XcMuen44/K5u9U3k3CPI+l5etpeymKg7fiolrTlvw6dmEAMMuMsFBn/sQl
	BXpplSx4SF50gSlKTFZdRQQcKq06sj7P+Jo5oI5AfG7ds5tEIF0F9FMPhZbDOTW0
	rqZ69g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0qkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so2971410eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064424; x=1792669224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=fcgrXFD0eyfqdOBzrtuuOL73MePFxYiC+Dk9CE9Xi8OcZeXSAlyU7yopTgTzXgMZxI
         OwIne85HM9E8O56Dlldj4DlbZb+sAxhb60SHmwqU9w+gNyq0xupFw2DZbN/r0XiwVa6z
         m/hxlM3Rn/GE+Sli0iQRTKMxOSt1oBQORaD18uizU6sgkRC14YOoMmmrxfO6tjoSkRte
         fPGWgrgZMYyF/8h7fTIkDmCOmxKn30zd5dn4FWY+BP0XVLcf/K70BeB96+OJ1iG1hxPE
         bGb3ShceCFw3q9WF6j0c4w/KkAtHOMNjGzVUqYM8iAYsXrYXnqo3YUWU//2yX2gG9dZ/
         Jv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064424; x=1792669224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=MgoGUB4eSJqTv4oJRUkJ6D60Dn6NBJKfYGoywgQU2sWD/WC/n+NpOEM1ftipGJu6nE
         fIhX6452yL3L2mSzyRR4wM9U3eL/KAJhEOBIZJvJzYeZI5Iptz6/baedfcyFT/WJGn7M
         2Jp8aT2xjyt4hijgj4hXN6Ep7Z/Kn+I6kiLiI+M2p14cOAIhSwOVtpsLbKW8SVR0eA0x
         gVi75NJVhrVUHgN8KNVQY13pYdahoNrHKaBAtg0Tn1J/KOS1datnEBLlu1NsZRKx/f3R
         UDJbQfb/uckQ093iH6Fstm1mgQlTzJ6dMuQjc20A8JrnpLggqRN/NlpHDxr0Ak6tEWVP
         rk6g==
X-Forwarded-Encrypted: i=1; AKwUvBwf/mMWkBKAHDiD0fR8OuaYLpkYRFnt58Z0/wOLRy4KZztnLmC+jbUbVWbwIhcqfpCPmLh8koqvfAbKZBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaIZpGvWAG73deNjWzwzqEvHr/LV5MGQvxbOPtwZx7FAZMSLnI
	oEbTB8qoF4C9ID6hdQxv/LyMIRo8Sl3dmX4FHSANxkYxM8xctR8mzpcdrkTqkP1W5MbFIfDgwZj
	oeMPN9oEanKKN5s2Gt4fFNwI5TNddz2XMYkmj/VNkcIG5Msp6/YlqQuAy9Yg7iNgg8aU=
X-Gm-Gg: AYBFou06IR6KEf6iM90i77rO9TuPFZ9VZtZJYz8AkpTPBUZwDkuU9zVo8EEhKU0nOqx
	cfFQqTBiu9KCcWosffb2O7Rg+ZYZxy91yDESc/albE6Il0CyWjtAiTKHertewfsa6wZCmvHuVm9
	gXJt7YjuPFWYulPYZrK1dQFvbezS2wxZc3h+xB2+WFys1KVIOlk42yCJcsb9J0qzKYwPTGejh7F
	K12gCnBlrYS1aAVvaJtPEt94ywvNAmPY5ss3Er785dMsRUkWEUAISlk7G8wK3ZRS0Kb8cqC1tod
	GaXb8+87lo6IrbVwBVokl8uUNI+Hw8lJ87AWPWxs5V8eHCFJK8Y4YoVRbhC+0TNFJeCDUjGjLs/
	YTTT/g+HDmNo6uihAfuIl6/NgiQ==
X-Received: by 2002:a05:7301:77ca:b0:35c:6268:8127 with SMTP id 5a478bee46e88-35c62689d3emr10317825eec.13.1792064423935;
        Thu, 15 Oct 2026 04:40:23 -0700 (PDT)
X-Received: by 2002:a05:7301:77ca:b0:35c:6268:8127 with SMTP id 5a478bee46e88-35c62689d3emr10317790eec.13.1792064423384;
        Thu, 15 Oct 2026 04:40:23 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:40:23 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:41 +0530
Subject: [PATCH v5 7/7] arm64: defconfig: Enable UefiSecApp TEE client
 driver for Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-7-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=1240;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
 b=h337Cjzx40d1Oa0bgdtGrc718cUop1UqHCOTA0q42DmHXOvEVZ2J/aBIuy7x0aRk6pSyDNODj
 biXyTymUe2UDJ6HeGcdYLrNpdiHe1seBVm1ao6vlMZcewQz11CPjPbm
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: gme2OvR6Abnv-a19W1GYwPQAF1O1PI7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfXzjvAeQRVFq0z
 woIQKRv95R7k22Rnf+/MEo1Jth38SQZZdHXQ1wb1hcaREaou9fF8svtk1J0W9l4mg32zpss0nPq
 q4tQuiseW2Wez2hGYUSa5GRMnpna3qXE/vAfExJZY1qFNaJC6OAjkLHHT8jyEwOqYK9ENtB+Hqz
 IMNFQvZ5mqxkFb6U2IQM9cQtbZoxGjQ8y+V3NS9e94bZtA2Gnrtl0AQKtEQVSGjcwHmiDS8bt+H
 2tqbezMViE5X70+DXzxaxoebzdJonkBv23fYWB7ONF5AcUSD1OWroUhb+lfCbhWFzMyyp2+7rkn
 n42aWBCfdJTevfstbCxCxxrAVplqLILm6yPCR31Ey2TYll+F+O4lbUriyn78hQaH4d408xjRITl
 AXhOjuwItT52EwsGTfZ64lC11g7XQLL9v0eQgCMwZg6k05IV248vJFeKJhsFC6sCSTZXb8+p5y1
 sIl1rCvxAYH3hTofxBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX+DMmLpL+mNpW
 iVVfD7AAsznMLz8JShlaLfvJSOhjQzOS81iz1JD59of7uiXP7Vm2ALBigTMbhdz5W7Rs9e7zhNX
 b94WjlMLuv/StcNOX+u3wYICKzI8zhA=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0bba8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L1DwG8FsHRaiiIOMTvUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: gme2OvR6Abnv-a19W1GYwPQAF1O1PI7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150046

All Qualcomm SoCs starting from SM8x50 provide access to the Qualcomm
Trusted Execution Environment (QTEE) through the SMCInvoke interface
implemented by the QCOM-TEE driver. QTEE runs in the Secure World domain
on ARM64 CPUs and exposes secure services to Linux running in the Normal
World domain.

This change enables the UefiSecApp TEE client driver as a module to provide
access to UEFI variables on Qualcomm SoCs via the uefisecapp Trusted
Application running in QTEE. The TEE client driver communicates with QTEE
via the QCOM-TEE driver.

Access to UEFI variables has been tested on a Qualcomm RB3Gen2 board via
the efivar tool.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..a8525878c679 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -277,6 +277,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_QCOM_TEE_UEFISECAPP=m
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_TEGRA_BPMP=y
 CONFIG_ZYNQMP_FIRMWARE_DEBUG=y

-- 
2.34.1

