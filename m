Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877374;
	b=KcNxAiBwYHFH5vFrx/fdjE3USNb1oeh2BBh94galDB94XfDVgMsB1xM1jzfvPxFjHT/S
	 UlWMHnE3fraZyc0mHecyXtAaXCXe2JzWyNYKW0tusQ90IPQxOFvdIKkAcnuWv4nCirbat
	 GKiKcKqkiLdfr9YV+N/GjnJdJQAN4/3fxKH59K/hq6DSGDlRY/yKMRELtnBkZrXqDT+KW
	 t6Ygip/oGme10XJNRux0tVRUHP6s5hcqbc6E2VxyLIqUGGTYdzZF7OQ/WUFxDciITCRJ2
	 yGMe9EtmBnLGW9op1DU4d215G3HUveOJ8hh2kccxtvrpS9Qxur8OSphTzcEsxXXW3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
	b=qJqyER8twLTse1136yLbZNbE3JO/cQl0b5mfg1Kao2CLF4knQgNlgHJnRwIHUAZpQkUK
	 0QZdLi718xkpDzZeqH7wnbPLJfW+gPd4nlIaeTtZZx7zQIJmV5Si5nhI1xmiFg++bBZow
	 hr7mJplGQmKr5mUqLXXWeEfdTJvGZcSm7Fref3Erft/I0flQAqXHZZqjdo5JdVqg+Y4oX
	 9r+xSMM8kyXDBHIYNhIAr0X4XABxqNCWM58jeAfStAM2vgjXuHh/Hn5eJxPBrwX0xTxf1
	 uFoxMriOGqhrkU5Sv6CcTgPJvvDgqsHQ6UyKZQrMVvHkgTNMNmlcYPL9Lb5323aV5cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lR+BddGU;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgEGOfsi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2D606D82C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D2D606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lR+BddGU;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgEGOfsi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tWtp406831
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=; b=lR+BddGUfsubROt+
	nGVAasMFB6qoa8WOF+XapxKijBjG2H4V3l54WtyRAdlAUEG/R2idfqVocnUiYTrA
	ARWOuZwmIFj42qyEXJTC6ThUhZ1NMJBzbYlJogCvLz7XOcnTRafS/d4S+ZYzuRea
	yVpniZdeikSYRYXgi37+t4fLfn7J7pzU5iJ6vXC4TIppppyk9JmixPC4G4HLXNlP
	iUIcvcHX4njHV5xyIfDINe7OOhnL+ykx1N51j5oCnC1xeLofoRNku3yP0fZxZFf1
	A4xF1oYBsdSku3i3CpXVUwrn1W3Tl6fcKpyve5LdyhEDXOG0T8a9J42BoAy+hM7B
	7opICg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v16xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:16:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso702207eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877368; x=1794482168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=LgEGOfsigdMaCzGRg8ybSat+ZLb6GCDRH2lLF8nEZzasd01e8nMdBEiYpgRAujhreq
         3dNQhmISDyY9oL2WLYoFWLQ34s+j/pnSC87HKCbjm0gQSD8XaS3ms0cDQ1ntK+Hyppoz
         JQ+KWUkHHs38iJnIz0mRibfD3YDWk/02VQiPonZg/bE/CtjccKOPfxZ+ovSsy974ddSy
         yTg02EEsgPC0gjpp0WdULokPkJWyvMUC/uY4N4DMUdri+8w/R1mJQdL0HSrOc3wGLSlv
         gSmqs5dGE9DO8eiXld0JU9NNj9SjcVlxn+ZxGZMU5ki35KB/L3iDl51CLyNLx60srdbE
         gouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877368; x=1794482168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=wgBBq7kiBvG0K/bCcLRJNrVtJ7xSmay/19SM6z9rVIAVDiNLggbCOMxv7sucQV5GDa
         b4YU60CDSdA19UGwKDbmj2CWyA4MSGw+59K6qEr7rbMZ9+FcqU0ZUy0sAuvb6Yk3Kg6D
         KGDwRSb5Vc7ggzqdyKFuY0l4c1XvO3T5p7Eu3t9vKSczXGNQMVvE/K3HQ7f8r6/Cyq2e
         XdnEItBXP/P8trcLEZ/U9X16Kt0S2zsMFNqWv8AmCBW58Y72Li/Wlm5McIgXgVpguVCw
         ewEsMumLGmF97Hc4N9hp/hsVjWnCmVzv3DNhNG+sQPMjSqmG4oqUNzAkgTKk5RUrOU44
         /b8w==
X-Forwarded-Encrypted: i=1; AKwUvByOcYdLXDODhPh2yGsPrzmSoqreARHOzQexhxAx2/IFWQoqnjSi17Q5OnoThG2D2oeuQ/0G7c1EExyxOsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q7Wg+XMcTfu7BuV9K5qzQMYg91KEpB68BadI5Iv0Gt123F297
	smnj9ywu14CNkCHEh2rduGSmJ9gzRKijmpAZq8fhQlx7BhsiGhO22opGm4dI0ZOmPJ4R7XsquKF
	ycBFOGHj0LQmPhSV3k71G24mEA98nNWcT1bwzOqoEBTsyf+6vrD3NiWh2sSRAHiaxZTw=
X-Gm-Gg: AYBFou2SwRMNdcf0k1YbFJEwJKwDWkfPImSrHASUwxgJPNt6CykU4+FLfw3yZEAMpKy
	Jz+012GN0MTKYL+Fa0kqSyoEmGvdV3CIESx2V3xSA86PGIZZM9y1nPSB5UK+H46gPSx7SXDPAsm
	FLm4JZKZoEipnZt33CGIg8S9SF5jqyUyIZJgRPEhAl/bnaH5UbwF+WSn4OO5xQNG5RxNir/oFJr
	cylUZ9APOR/2BCR6Tvhe4NAf0p8viuPCMvMhPAnXck01iRDzZN/ZRTYFHzlxWxWAYPEHv0IsNOY
	1FqzLQW+DqVHBo59ufoLy/dBdqxuvl9QRmSY3qYXapVk0VLkG0xx2/yRVnhC1gdBI5Qpbsz2LiQ
	jTT58053RfVs8FeZIj1PkJqoSt+IEoRSMTGYS96Tu8yUvBVuUwg0b4NSzS6ZpVoyxK+6CFYRHpg
	==
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id 5a478bee46e88-36eca058eeamr629092eec.2.1793877367550;
        Thu, 05 Nov 2026 03:16:07 -0800 (PST)
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id 5a478bee46e88-36eca058eeamr629067eec.2.1793877366941;
        Thu, 05 Nov 2026 03:16:06 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:16:06 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:55 +0530
Subject: [PATCH v6 7/7] arm64: defconfig: Enable UefiSecApp TEE client
 driver for Qualcomm SoCs
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-7-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=1240;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
 b=Ro59s+sMdEnPuTJjz1hVTNxB0xO/hgmSpPmDiIqtiTBstH6De1YfYGFDwOx1GP11ZH9UQkkoS
 ClnOQO4R5RbCEWPsVLFgl8eFwqUW/QqNuvbQngOJpsGou+L69pmFyfj
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX5rUZqQZYE+JX
 sDtT/+/mMDteLbYhIjVW84U9uRNfCedGfUVz0ZvaCIciVgm3E0ZYR/n7DrRBOEeGS0Orxm4cFVE
 wE6N+2fttiF8uyk02/RHMxxyMsGHLYg=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec6578 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L1DwG8FsHRaiiIOMTvUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXzM1BzTQKqiKQ
 hAeGGP6dIlD4jewK+70gWU/svdWwQ3TrTbNQAu0DEqtWmitYiaoTx9lTL2ewNx9UJXEQVOroubc
 fsrk/bqVIqRDkTnqPX55cXQOvf+ruWDzIl6nexyHNc/cQzesbMEpZmT7RqQv0FE3Vjm7Em6+K+I
 fywXixrhQqewKyxZ3sqSJrwh8d84xWNKQna5oImSt862ax23vq0QrBdQZKSW3HWc+DFcCtBdtCF
 cC5cNlYsJ9uFxq+HBtkMqpCEwQzASteuXr59EjYCKzm/rICdFhm6Evg+YAsce/i/wU0Isixa95D
 qUqgLjFj8NeplHBajwqgmeti3xC9ACRzxSlv1scqmoHvJcAgkX8VBBpFcvg3i4EvIA/zFmhqL2Q
 DYLxYBs6xB2tWQnCcHWvt+LJ8G018XmzzaSb/yAUjzKwuet+RINzAXrvTSNoLZUGO2YKytk2VDd
 qxKcgyh7NPAt1P9xvHA==
X-Proofpoint-GUID: Z15RPirnnGzYsXpQqPdyPpN9qRbABhzt
X-Proofpoint-ORIG-GUID: Z15RPirnnGzYsXpQqPdyPpN9qRbABhzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

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

