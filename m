Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBB3F4841
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743937; cv=none; b=t84mOskJ6JnsuH9zpylKYgcgx/d6++O2c7nwdRoicWGD2rExWUlxE5WNMSYDAUlz1ND46tpFer3iOqzovThU+RwrNcu8LSbwpksHKOE8ewQH2/zuD9WYREPpL2lxV6KW7gaUrSuZoXQIaYznQnlM2TDF7PSBt34c5aWmh2CWATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743937; c=relaxed/simple;
	bh=UQk6T/e+M8fBl5GMK7VHLBD6ptf7rBCi43/Bq11Knjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tyTbtNX+VbXVXn3gLiYPLr5W5GrgZJGe2Ue/gLyOT9wj45zWAYilwkdC46EqkF4d56ZV05IzbFB/8HVv+MoR047sr2QiFVBe0g+dkOZFqimGvVEtwCxxtLmvaOxndV3Vn/hN4Jntzf0k51feBlHMHZ5T4z14sj/04PD5vlWHbGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8Z2izu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heRKCU2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8Z2izu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heRKCU2m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGecB630919
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGU
	Unx2Zovg=; b=I8Z2izu04pZvX1xai/eyxobtyfAuAAFoxzzppf2nToFxpl2iO7p
	i1T1uPB/vJvD3SYIRK4HABLizkerVDw9Z8bC4YVRjN7QQR+o3EX5I6UvZibnFvv9
	P4QozwK+8sFEt31sJa/gpU6kATt/2JwlUUSxKNPBC+Ek7EH784O9GCVBtevT8RWl
	732L5BmW2IgSvXn8S/ON1RHS73RwgR5puWIDxKgsGQTuYtLgFuAtBilpHm1PtnZd
	ELr5sBrx/sLEba3EA2m9HYXl/dqBSUfXQRh2O64m9d0eZvqa1/eW8rrtNdOl8Yrp
	KJYYK3alXU/k81fg4SogGJYNMApWY8ftM/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1v8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:32:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1553681a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743935; x=1788348735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGUUnx2Zovg=;
        b=heRKCU2m+mZH8IW61iP0es5dO4YaSxOAdYTrSqvBZz3FZbhQP/1zBWhEz0Bqs9V+uo
         LQRZJvFtShRbh7LwAd+rQ0kwb+ydvBqdq+Fay9hZ1nOeGvDU0U+Cd5Uiuqv3vAXYgSUn
         eaei6g79ieMBJD6jcCZVlpF9ZbOxpI8MBo9MQUVIDb2Ob9PQH3PRb8gcYsYAXE3GJpMU
         oBokh9A0IJBwfuVFSvoTDLPJxRjHBax9dAkhKkq+hEkluyjopwrlgQjNs/hqaVibVUyw
         IAcXnYztShrHSBHsxwqEUAt7aBT7Usn+4KrVEwsEn/bmQ9epfVtSsSFWAuuJcDhZ4Jzj
         pE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743935; x=1788348735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGUUnx2Zovg=;
        b=Nl6x/iST5MR3NwBbDJZgT5TuB8tfcgogpAOFV0KYSL3Bqt3d37u2o209ORc/nrDuW4
         KqVqS6xPc3dDN+4IAj6oo0zkB899Qq2ODwn+Y2BmVpZj54Tr4iTmLR375VunQT+bUhzQ
         GoyOJ1RitGbWMRPkn2YaZhhN8XpVAjAHXWXJRK5ZvCL3esetDLAWU1UoSukL5I2iujdQ
         8U5y07knq5r9ggsF7xZZHiLJzq5JsLe24YyqWPysJ+MfyPN3hek8NL4w85vHYOf9LAKc
         PLqED83cqShG+sWH3JPo3NGS0j63DTicnKZU2OYUGhsiOnblcK9b51EOVU3lVsBhGtwT
         4JaA==
X-Forwarded-Encrypted: i=1; AHgh+RpjdP72/guOjNZvgPlcKvPZz/lgxuAwi/eqLbBXPvMKYSaDE6kh6X8FHQ0ve61h+Kv4peeVNz5zchiszX8=@vger.kernel.org
X-Gm-Message-State: AFuF++micfhaaZsrM5MKMGm/PRExw6XVRcIxEMrNmKgyETjcTcHR6QR6
	qtHp9tc3Pp9EFp7MPVeMlDsgIKZKH/S6t95GIRiVcR4uisb/g2XC+rkjo3bnSElRpXoUIRUhq2k
	pogKhidtuc05OqCx7/DqJAuJqN8AHV2GVTthdj+MmCRwGdBDkUjzdYlVElfRvrQIkS4I=
X-Gm-Gg: AR+sD13z0veO7SPBP7xpLEK+oBy8YudY6SHMvLfhOUPEuQmlmZHA66BRbV8EuEnhWAC
	upJkO7UMVurHQ1K0OXV7CFPQ1O1dUiqA/ZoAqHfCfFdDpla0hNHVrGARQzLn10GxeXbwgnqoKdb
	4rHz4rGZ/w534mv1YlPHOsK0AbV6l2FMg/1q8Y2N8p8NMu4ZCFhs/wzN2qPdzfYMEx2PKOS3evy
	otMTso0gopgTKWaRgNGzLDRYSMDfQUyamLbx2yEyW4fw+HVkI9n9Jb/7q3piFC2EevY197CO4UR
	lEGRpvr7pMlBmI03KBzvgLyuz3R+nX7Bm1Ps+10s3IXcRCl9MzHhfm+o5bYWGna7l36VI0bdGaJ
	mto8kNUM/8c3rrroBOChOZRTgvU7Dh/7NsQc=
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3966d1bae93mr11394316a91.6.1787743934759;
        Wed, 26 Aug 2026 04:32:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3966d1bae93mr11394216a91.6.1787743934299;
        Wed, 26 Aug 2026 04:32:14 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm7748929a91.6.2026.08.26.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:32:13 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH RESEND v1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage support via overlays
Date: Wed, 26 Aug 2026 17:02:04 +0530
Message-Id: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ecebf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=A2BV8qJQPfFdF5fhguwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX8eWb5pTlGI6d
 K1zl9zLp5LoENsgMyTQbfWMkW2p7B6KrO0v+o5SHZssNNFUeHvpz5dF+HJSjv8w4i/PE8kCwAMr
 i1Km6ZoSWsenRj/Jb8jl53xOS3Lz/bw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX+OsU+1E2TBWL
 gGyrWhFOtr0r0dxGffkelpNTK+x3XmPWqi0V2AD3tYB/wrEJZhzPOnRlrXKNJzn/PwCaQKS67Uh
 BC+R0F64TeUVBXtAj7ylao4tg0zUMz3vxo2nABDZI7aDyf7MMjypnIOyWBj9KmvXZjhoTZH2Ev2
 Wd/BJ0swRN+VKlcaIViy4nArBhOwXT1yOVpsmDwkYyrjXpI/4u1fNGtWdTatm4IxSo4TsQgRJZw
 FY6OKYepJCqKfCgXmw8mvpLhDL6chnSY4L3Vc8Qi9cyrtFGrZQpZJpcnF6/+I0J4GJq/w3x6m5C
 OPgkpy34w5bOuqVO6qWL/wA3jeES4AMdaWhu+RVxtNGwnUSN1mNUsBhXW6UQJyC3XpEvPj9Kejp
 stu/85+5rqb/nJnKrgkfa1PQTh4qCO0gK8QwHIVXDwER5MX4X+R9FmoPIITIxJqZR53HRmJR3sU
 CDEBnb/5bfpvGJvaong==
X-Proofpoint-ORIG-GUID: 2D8ecoAfNv4DQV8Rvx6tyovbMgr9iXuR
X-Proofpoint-GUID: 2D8ecoAfNv4DQV8Rvx6tyovbMgr9iXuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260096

This series updates the device tree configuration for the LeMans EVK
board to support dynamic selection between SD card and eMMC storage.

The LeMans EVK hardware supports either an SD card or eMMC, but the
interfaces are mutually exclusive as they share the same controller and
resources. Previously, SD card support was hardcoded in the main device
tree, preventing easy switching to eMMC.

This series refactors the SDHC configuration by:

1. Moving the existing SD card configuration into a dedicated overlay.
2. Adding a new overlay to support eMMC.
3. Updating the common SDHC node in the SoC dtsi to include necessary
resources (clocks, register ranges) required by the eMMC configuration.

This allows the bootloader to apply the appropriate overlay based on the
desired storage medium.

Monish Chunara (2):
  arm64: dts: qcom: lemans-evk: Move SD card support to overlay
  arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 5 files changed, 102 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

-- 
2.34.1

