Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BF3E559A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286482; cv=none; b=nzMQMoxMe88fBECiCOqOz+10zh2mTIE904zmkcEStgsS5I3qbuHemCYVwSBU7le0x/tGrrEC6906CT5QQr9qrbZJZhoVSvjuOTs3t9ELblRipxGNuHYrm54Nb1L8jjFsht9dwWOIBZxKvv6iJu63cDd+ihu6udAbkA4anpOjxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286482; c=relaxed/simple;
	bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sivcribMOn0QsNU3aDjfP/31UNhYivPLLitVmNohX6uazYtL+UtWXxqiU0I0ZqaQ3mu6LjNS20SvsTl1RSTpaFLsJME1YeT54vvNCwV1+QhOvj3K8s/XOMlBd79Q1enl7x9/oLRnCjGIfKQw2baJPczzKS6rNZjLemmigdVyIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaGfpqZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBGh1Tve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaGfpqZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBGh1Tve"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPgWO334518
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=; b=WaGfpqZjdGPd8grA
	UlnPO20duchkDDD3HhGTwUCfhxCvNseSN8weivXt0gn1t0tNpDxS0NktmrxB/nyg
	NgLqZ86sONkFYhwpwgBzlJ5hlRaAz7WZ5gnFqdHjbONHjQt7A5hEIUmGgGyCPgPH
	1TqIR1DiKfsAGq5w99zvXnB5451hdb8gumKUU7yQxItpPvdqIY+JeJ84/qyKWUir
	iFqhb38F+/kJb46M+z+ixJhvzxpvAFPejca1MD8e3D8dGbIDCY2Aqsj62f/ZJNdk
	Zurkhs7IZ0vQPOEe6eJyXmCRdve4XMrVWaN/fuvjrKaWvQeZmBfnx7bsrml3usEN
	rBCA6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdu8d7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:34:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so684811a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286479; x=1791891279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=HBGh1Tvewnql9YimGXub31evOQMe790T2AXewiQNNOH0GDhZC18D2Pf3JidAYGUl/P
         5YrVXminqu8CLz9d7vA+uh13G3uJFhVTL2ga9BEPwlRtCD/UvdKariuxJlJkrqgrKirw
         r4WEpmDjiZ2zYa9Qa7f1iYVlFsVhIVAgJSF2oYJcTpz0+oWOOZxKPXRLQCGGeI00URlI
         LM3hxEoBAaC4jS4OzrVKp7k6yfC9xZlihkOdRyMM1A9WjaZ4/dEC1MdMj61LHWGBhd8y
         eqF8DASLQDRqrm5+8F/7Idc85hhVCGH5ENoR19K8y1v3ivozdkc8Y1h+d3w1NAZ3QFjY
         39qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286479; x=1791891279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=J7WUxz8EJVXa6OJwO3BZaLbblBo+VdT+bSYCV93ZHwvqFtkxIrGXWAwiWUhgz0l2eJ
         YWPZBwjXSfO6kJILVleMysZfs6ZJrxzBChIJ/rTBLLQfnIf4q9DLr3H8ZTpGbL0rHlFK
         yOz+7JkfwMxPaU4SVC3D/wABLZiGEd00l6JZkVjwR5CE+tRopIUMmHYkBxTRrVpAgOFU
         xHuquI562zHkjCo03uwJw31uPt7S4wTAwpMtssDEXxPkocZXPEF/VIGGdw/4s6yKhiWm
         +8yXUA83jYo0EiF5QSoaX6k8keBVZz0PWvIDNZVUqwUb2Y2+MdlybcgNxCGdoNAdt/dD
         B88Q==
X-Forwarded-Encrypted: i=1; AKwUvBzco9DzgFs05fnmh1CvPjrwEBfPbJ9cLpXHrzoLEIn1Roua8vNOCo0MZUF8V5ACFY4Zlueqmr5WcM8dhTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1ZikQoAQe50Ul383zzMZyQLnPizw1cv292hOJ8boZYa5VNdve
	qC/XdSyjqsDg0dJySMjxqpiiuT1pUj5NEJqPnDNUBMpM1ufcmfeLcMH3rCnQuhiBGCK6DM9FdvZ
	4Pvdgr4CMJRlJCWvJd1Ts5EJWz9kzxV5Vjgndg5rKSNd5qq4yiX8qil8hBm+QOJeLaZo=
X-Gm-Gg: AYBFou2XfhlUwdsuHA+qqpmAB1KUXc8Mir7r2M66vV4f+9b+9hjxFkBOcB2AIgwjrop
	4x3PsFZ5BnWjUz5WUAnSt9EsmrsWkUK7LYU6np7Roqg0S3uwmdB7GD3HaopmOgMKj6w6JmOjnMe
	TFIYCCZ1cY0M81M+lkIjY3Xi9xTu1Iiv6uCkAP0BKNWZj+APe8dAsj4ewxUQ8AGsGt0HHmIKl+S
	nboG0XFn9k+a+yUwqEHYIlMX72kBb7wIJhAjZkXuiNIeISrAD4abuWtVwbdaJKgEpC4dREAnqcJ
	WLQdC+hBMODyNDr4dbyPvRsFOHHjii08aRXVwzA4I7bTxMyAjeM4EBTlw2QlZOJkeg/wq2P0/aK
	wSB1LQzqOTu/BKERopY6/F68A
X-Received: by 2002:a17:90b:1b09:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3a87368608amr554157a91.18.1791286478317;
        Tue, 06 Oct 2026 04:34:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1b09:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3a87368608amr554137a91.18.1791286477300;
        Tue, 06 Oct 2026 04:34:37 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:36 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:28 +0530
Subject: [PATCH v4 7/7] arm64: defconfig: Enable UefiSecApp TEE client
 driver for Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-7-bf1c8e2a64ab@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=1240;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
 b=YjzJU1dcgPuRriBWDp0JHYX/56t9ZNJrr/NFnoRLRhaU93MIfOhqsRAhHc9ATIoUjByrLvAxM
 FlNUuIfbYJRAELZQYbjvZMUCWNweCX+rXzhJxDIzEorlzYt8MeeWCg0
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX8ae4lXRJ7RjG
 m4tLIrA+A3uEkX+a/wc7xA4SAyIZhjg91wf1nVAP/IE54fTsVewwtHOG0lq873ben9JYyFkgf8P
 9RZV104buA2hmNdgZKmAar5dzJTpM6Q=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac4dccf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L1DwG8FsHRaiiIOMTvUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: H9i2ZGUR3mfMY3AIVVgzSXC3erQ16y8y
X-Proofpoint-ORIG-GUID: H9i2ZGUR3mfMY3AIVVgzSXC3erQ16y8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX9ruko1NLqH1R
 cm5X/Tg0AfJb8t4S9SD+5G4b7+7kKBA26lIiN86S748cB6L6i59Wm5pql3n8nC/Amombr5CyjZf
 nq8TamxjrUQ0qJsYTNyStMZA2b6rTSOQ1QmxYUWZCZtdlzcVXV8VBXRbBUWKRY3N7cb76VQt6gA
 LkgMqYkV9s+uZwPOxcwspUXwGycfnJ/XWjO9Z9U9jFdZZC1dyTJGB+f1ACR0k/P/Wcwuexbq1gi
 C0ZxGDIR24Y3hjVOa3ty2UYPOt5dCu9qT9OhLHzrIymBb9N4Iws40mvnteDDAqqox6PGr3H4l0P
 UPdeu6O7OtYwNp10Ok6W0ey8KBU+SFZISP+szSOXBws8r/W/jgS3bui02ORWBSU33RLz1JUSrue
 pv/lZIvz/0XwC2yhqh+rgyBsjIOhZjWUxGQ+Ovdk87oXQVnWlDmRMcrz+Z1J+rgI75oIH+WfBJ0
 zf1kgFj6wiEnb3N1qpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

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

