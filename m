Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A72352022
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455522; cv=none; b=rtGrOWJikGEIWaUC9xP1D7ZMPx/Y4llmQPEq7FIJkxoWJIGxWsF7yccC9luHDTeaqABbWjaPwpB5IIXKVQCZJqaXT2sP26FQKGchpla/+iA/k1um8MaeCjYqsH5k1FWN6YTZje8x/ebKLI9x0XKtJ1JA3BHLp5u0Re+S79bqmk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455522; c=relaxed/simple;
	bh=eM8m5PJNe9Wj4UEcHZ8+zCCkgTYp6JXWect4NlrR9N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zr7iOTQCdcdZEfOoBgX9sqDpeMeQH4rV6h0Yc+oDx1Tk1CYZucWr4L0Xg21xWAgmgZGVTXAO61K+Gw4ikyf2M5wPNdkRNERTih0Yr8d1HFvxvQ4i7sVq0EESXWf+H7j34BW7ePueFwBB5DWA6o1aVyHJ6E98+LX0JnvGPG8mE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRQw4uFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvxvM7Ur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRQw4uFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvxvM7Ur"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7Ru2167824
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZCsc65uA8MgDXlMUwl8dFF
	0FCP7ZAaM9H+LcuyiyhxI=; b=aRQw4uFPcvpoXuTefXtEYYBbSocvongtDAeUIh
	D5ucGGyNya5M+EtKqGwVvQk2aURNhiE3EJonnhNL0UVk2NvDDziItQ8Q5Vd/oZhm
	3qpPMeuUoAfljJy3S5RcV6sTndAcrUdfRtPnSya6zNalzur4/iPOvPhQLa9OgrcC
	3N6eqzkaY8FEs7pPYRcAYfGKn+6QWPgxSD/C9ekhB2AT6Bt5bIneunIxAGzT3PlR
	FyeUZipURMOHpcPNPmphHaxQy/1D+ksWaLjOtXkAjqkA1tjN7XASy/NH7hxtnQLV
	grFyB963A52u8KI7UEKwPBuoKipgxyLnxHDqz1xpTzgJzZSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8qx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:58:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8c152622so40992015ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455519; x=1790060319; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZCsc65uA8MgDXlMUwl8dFF0FCP7ZAaM9H+LcuyiyhxI=;
        b=PvxvM7UrTmO7xIoSP3D5G6Ity7G0nWFIir1b4nJAxGg4kBPHrPhd0HIUQXmgUtHxIB
         h100TgzSA3tQ0PoN07EpeLDHkGx7XKoCEMREZvG2yVddILw6aXcgtHLgDtTw7kfmN70U
         5fgFMY/kZn2eou7yeXAq9l0P20hFjmwivP+Ok4/ZkRUOhq8nnsnJkiYkMSQgaMR1Gjxs
         iUvwyBZOhQwJpKLPe0Gv04aTBTXLlP341DTsSL5i+EzSxQ49JIuDpJ0748HqQq2XM0je
         eHvXo81sfFvI6qF+rabe7DzEYsVX2lUf5UA+vdGAkGmyXovLYna56ZGwX+XdAHrRoloI
         EGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455519; x=1790060319;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZCsc65uA8MgDXlMUwl8dFF0FCP7ZAaM9H+LcuyiyhxI=;
        b=uMx8KVMH61SA2dUnDNTj/aZXlpfw4Vogu28acV9nZYwLlcALc5BRuB8ZJ5sD4p3Qn8
         Z9nrHZL9IPh4+JcsbNnpmMQSwzLIxZKQlkHlHI+vAK46dFRCrXNg4hFePA+hmVat2rzu
         f3RCRn3/XcDKjRczsrbPUEvhyCXaHB5t/V8u9aDLpb17kq0WT+6WhGKw6ZpZMm5RtAG5
         wltxOMIlMtRKhiWfZxFXVJa0g40dtYFg/rkx33gHtv8xdjjyDcSx9eSSeIDunGHtgPo5
         XOlvaKqAmvP5OWg4L7CHQKXgrSXAM+cFQtZDnwU6NznHL150EeQOxu4cDmRVu24+OY6o
         eSeg==
X-Forwarded-Encrypted: i=1; AKwUvBwtB9y3pBS0CeqdzU3coAkoNZ/3wsHjgF/8eQ5mc6e2sgHo782sw2vU5baR86BFeLsJZaAUTnzR+83dguw=@vger.kernel.org
X-Gm-Message-State: AFuF++keDqHDT4Gn9/dQo4QFt+s1kmSSnqYxDz7mWkXU5vWQWibQ4HKI
	yfPK2r9+3rsk4rv23/SFflNZEB9Ex7L/geQfep/0SuEhVhFxDkKLUOHy9gmKqBHXXlUx5gqUHu5
	u/ncVfO/j8tsyTwxWTUFKAVg04/oRWIxy5je7X9R/5mq32KGN4+mOCbJTOcB9s4r8Pn0=
X-Gm-Gg: AYBFou0eylZgLs3gbTkBJN3yImUOu/4oMuiirzf5F/02ArKUrOvI23b9j7jwltcX0Zk
	eq4iNKX7Yl1+ortVfvBRr1RFSGqb1hcyWoMV/8oTvWJMKor7xkL5jkc+/eEIPRKDYuec9i1tmoi
	AbrVd63JpbPkxsFOKN7xr4cxEChNqPrpj5dQRD3j01wPWnceotg0QO33Qc94WYC4C0icdeOtie/
	eWn9/VxVq9/i9eWpTl0FbXhnstgIUmgGSpK73RTPrtfo8H/JvFozB+DbeLUj+pbrJsCmZiINT/P
	LCrX1F4XwaBz8XiNh4ZOZ0PMydjZi1fhQHl0K/E6yvI3LAwvCRFpVrqv3K16DDrpY5jp3ob0Bjk
	VLE8duWw33iH7Cx+Xq4XJr44R
X-Received: by 2002:a17:902:f54b:b0:2da:e553:c70f with SMTP id d9443c01a7336-2dd6c77899bmr118888185ad.22.1789455519273;
        Mon, 14 Sep 2026 23:58:39 -0700 (PDT)
X-Received: by 2002:a17:902:f54b:b0:2da:e553:c70f with SMTP id d9443c01a7336-2dd6c77899bmr118887585ad.22.1789455518881;
        Mon, 14 Sep 2026 23:58:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm36268092eec.0.2026.09.14.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:58:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:28:22 +0530
Subject: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI3sqGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0NT3ezk/Ly0zPT40oKUxJLUYl1jy0QzC5NEcxOLFAMloK6CotS0zAq
 widGxtbUAtl6xA2EAAAA=
X-Change-ID: 20260915-kconfig_updates-39a684a748d0
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX1z3tAJHo4dh4
 8QM1zkEv1optj/0SJ8mSk0AAcrWIyGM6NNWdrBSI5iYzp2Mg7CgYMd3YfWNfwdslQcP9hov3Cnv
 +ZPKTnv5Vkz3HurRODsLNwUTSmEZb3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX3drM+v4kOXU7
 vh35PAfQnEFlYuLYrLTCiAZUQ6ksnMRSe7kEkuViwvqn4xmQit+PY8Z3ipofr5Z9tPvwcw1kEWH
 F0x+vADPyuPMet8HhUQ7ock4d6PF9YR47dHoNvUawCMCbXOmYrvO1Pw/VtUD88HLbfgI50cSRPF
 OOLZ1EdFtzCkdOmbYhDt/kagYUOMBfN53//BCcOTkFxtShrzFqhdWpAbpLvPuw7erzMG0F870tm
 8i2R6x/JU1/+ZiCAWOESE2BJO7GXmvo6nZG3kMNyITRiDPd6KOrbrh9+KoJ2kbBtJLeIAno6+sF
 6EAEJQa9PFZf0bOjMF8aS9/YuzgQDzoxLkvuQgGMAXM58I8lpdVtFpLmsC9omwfrhJAbNNlpoE4
 UB8A6v2wByimcx7pkg+m+O34c1DueNbzbsoz7nipsfHwlF+RANmpi0qV06rtq/HK1RbSTUwm5kr
 GppAlia01ylPWycBWLw==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8ec9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SEz4QtLsNbRT_sFNAkgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JJM412_14Kp9JTCi47h5NSo2OmPaMVcU
X-Proofpoint-ORIG-GUID: JJM412_14Kp9JTCi47h5NSo2OmPaMVcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150097

The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
was missing the 'default m if ARCH_QCOM' line altogether.

Drop the duplicate on EVACC and add the missing default on GPUCC so both
Qualcomm Glymur clock controllers follow the same
depends on / select / default / help ordering used by the other entries.

Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
was missing the 'default m if ARCH_QCOM' line altogether.

With this change both entries follow the same
depends on / select / default / help ordering used by the other Glymur
clock controller Kconfig entries.
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..b3ffe1dced017e6f4bd3f0fa9c11bed5948391fc 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
 config CLK_GLYMUR_EVACC
 	tristate "Glymur EVA Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	default m if ARCH_QCOM
 	select CLK_GLYMUR_GCC
 	default m if ARCH_QCOM
 	help
@@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "Glymur Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Glymur devices.
 	  Say Y if you want to support graphics controller devices and

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-kconfig_updates-39a684a748d0

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

