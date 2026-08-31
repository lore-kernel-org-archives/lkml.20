Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B73B9DB6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167509; cv=none; b=r+yNemDgkjqUuTCW5cahha7Nel2O3ZIviAGR12l5pkGOzu/6TIO10fTEIMWxErMPDU8jkhCxdamVRiwEzbYB4k93vjXVT7ar6FWvBFbfaFiYdyA0i142DjKBBFgNsxLMrhJEykH/yN5NXsUaOsMAttAePIhA9D4cqQoF3CyP9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167509; c=relaxed/simple;
	bh=o+jYyzlg8w6Vj1pZlgtY5tR/vJJUA5BKv5OoEtt35DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IPq3tFRlt/IIRUg9z2GlFUdllK272qfpa/EmsUZkFh1X2A6kDA/uWxaasRGcFpfJk41bXmyklsa5scbW8wTGr41+fXUafqEefygajxzJ+GUb8gA3BMHCaTKQ5lw3IKtHsI58zWhu9gqEnSU2Y+/685uwxvGHvjjl8wLpVZpsAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gY1NWNzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDsvsoIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gY1NWNzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDsvsoIm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xavi2924435
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTFxysWPYnAyH9B0lSkLtR
	KDIKix6AuMwIdf5deV7ZI=; b=gY1NWNzqL+GeA0qKbfIUvyzIRyY0fN/8rmuZrU
	5R3JL/ViNtMLTw/xNx1beOO6cE6IZqY6Kq2cHxhmwNSuAegWkaFvqO5aPKp0eDRl
	trAss62XMZUu4u5P+T3YZlXdINFH8l0+dw1eGu2rCQMwIzLByy8U6lMdt1304F/7
	yiJdZ3djja+4u1HGgoYXhIV59CVAJAjaRVI9C3v9xW03dTlben/ASXcb+CtUfcOL
	CoVm0nm+HSsYg+2kZI0pQLmo9QdBWf/MBs/LlHgRA80S0zDscbCQFJfkencw5sCt
	WFYKVlQ3ETfAKH+/HQYcYuVZqROIBpuX/GYumpmA8pnfDAtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9wgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:11:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93922c75037so199187285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167506; x=1788772306; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTFxysWPYnAyH9B0lSkLtRKDIKix6AuMwIdf5deV7ZI=;
        b=EDsvsoImf4zXthwhbsd7Hl1I+oN4J5XzupvslnoEE4X3Bkux8goH1kDF95UlZSm9co
         D/urhY8fWj7XthFeg9JagO0NdrDPY8Mm/dyGPU5Z75DsX0G1F5s3zI2CdgSmg4bQhDdP
         Q3DisL/taGbVzRC/xP2HwdGAc5QTsWJtF/fttd4ZPipgXUbgWf3BbOxaECNlsWTMaCwE
         HtqYysc9Cg3n0whw7ySIS3VdTTZvUjFKM6jfY/eejS11IUFDU15LAKtgPmMpD7CzF35k
         PIXWhiPCSRTisVrZWNlzq03gc/L5JlHGt+RfppxGwgOnuZULwbPG+1Jsp1kqmmobjBh2
         lG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167506; x=1788772306;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pTFxysWPYnAyH9B0lSkLtRKDIKix6AuMwIdf5deV7ZI=;
        b=MInuSEzPkifgom9/CddHlLqyp5V0+oQhpEghYCbOr21itNapQLLyWJwY4d/WTcp61I
         r8ViVYG7qnQntsTUYCwh2t5QWRIVh3MYdFtCD3AaSS6Qf5Q/WwyCA/YKoakLVctwYXsp
         1AyO715Uefar+MNIiWA7jtErVHe5xsTVnFC08Bu5In489dLFb7GItT9vRs1HAVOUI2Rj
         WnTnjc2reC5fYKhBI4iCCDXxk/Cdc+HhOsJ6iW/YGAGmDAifTNIjY2KaQkA2g10QwI+L
         mXDDUiFzej9FZIPSO2Tk2zMcyj81ePsYIfb5rnLFfafNV+O+5hRmkDwBugR2UpcSZ0Fy
         pjRA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx0sVH9n+sC/hQeTr8/Nub/6ceNgKUbo0UFqcbOMSO8tUy+s44560/w9zrIxzh9ERj1Nyhg37q31u+JeE=@vger.kernel.org
X-Gm-Message-State: AFuF++l6rKwIPP3VKmKwQpjLfespkAKKjBJRh1umQExGLK/f18csxNyo
	1flpHVDr5dtl6a4cDm8a9hLW9FliYV6Y/vm7xlzW87OCti6NwzI9STKtxkZ0dUqCO4SNa1FzTqr
	b4DL1IX1+uizzuzK46W16i1ChoBU70XzWuehPBbB2UxMTw4/05BuBy761MmSvdahitPw=
X-Gm-Gg: AR+sD11g+h+e6MsSR324pClF8BznEAde5+dzjit25P8WHGXbx7n8Ba9BZIT9VFF1qjk
	uAgTAJeYcYn95nNNYZi4pRN66W/JXxj60OfS0YV21xwCntNPmYOYm7sgBJ2NzUyt3EdllhfrKks
	mDYpapLhdyGzftXYSMTpBL4f2kg3D38FrPG9wH5uDxRk24YunXTfItrTiBYuV9QrhZ3N3hJNk1p
	Lp6ImbP6zKct08z7zfhFN5LpHvZeTUeNRAsEA34NBqkA8C4lfx60oQCMp829XKHvCzW0atb8b+u
	rc5Oe5dYdLWT/UKjgMfWbrSrGDLnKUtQdQdIH7AEd0Z3/4R/bVVuIRgZtsg7Gst56BXu2LB/2hA
	tlUic2A==
X-Received: by 2002:a05:620a:8298:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-939138ae185mr1964028485a.24.1788167505681;
        Mon, 31 Aug 2026 02:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:8298:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-939138ae185mr1964022385a.24.1788167504967;
        Mon, 31 Aug 2026 02:11:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm10430394f8f.37.2026.08.31.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:11:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:11:36 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as
 reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-v1-1-4a9da88755d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEdFlWoC/yWNQQ6CMBAAv0L27CYUSVG/YjzIdq1rhMK2EAnh7
 1a8zVxmVoiswhEuxQrKs0QJfRZzKICe994zissOVVnZ8nQ06FLEkUKH/r10kyKpQ+VcmRmZdkz
 oBwlYt2eybGzTEEHuDcoP+eyv6+3vcWpfTOk3gG37AoRxTWWNAAAA
X-Change-ID: 20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-4b9c6e1677cc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=o+jYyzlg8w6Vj1pZlgtY5tR/vJJUA5BKv5OoEtt35DY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlUVOxiTFmMIjzCLgCb6bDprOrtqWD0Za2bFXb
 95l5lFu1BCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVFTgAKCRAbX0TJAJUV
 VpAHD/4jvqsNB2Ow9c5ppviefuwFIE5I75hMFPh4fMDeVR/u7I18zphh/5vj2GMiRNYneQX4wSd
 xsdKQo+VZtPI04bu0zaxqLT42Kq7Pt83dwZNGJKsoR4FMsFboaGh1CSYWBr3/3YkUysj6g1hC87
 smmVcBryx1CkGWKSpS5Xgydfj1I2ZmGFsg+RePdU12rKAW2WKMy6okzYLnchy6908/RLmDja8Rb
 wdSNTixhQIhaecCSzGGnI9lINYQ+vN0+3qUxSy1qVYaz6GYS0MUwEdh7G5iQiOA3dzZT23Oqna8
 R+8Fl7XmJKTuzQJZ2NoDJME1tutilXEEjMp4EFNp6Bd7AGljxez9XpXjfPZWwMvVVosmZGRrB68
 36VqKWNaqqRbZn0syjOTMxyivb8vIvRWnzxFR55hI/HMdB9e9J8EUDpnZWvTPd/yb4GESXxIhXE
 sohyiyYWCFY1BKJJzKLOe2SMhaqT6yq9aiYyYOG8slh1M22IcX6+eQsPZaM9TMo8uaalLtnYugM
 U2aDr5WJFnHueO9KtRg6kqMx3kJCRvewRx5zIz9ZVb/92Slx6rUK8jvzGKVCzwGBlTQPqMDiQQY
 l2cc/dHp27C9l+JKbn5/Q/qiQCd/mwS9hc2jf0K4Acm37w18O/sydGvgs25zpKj9SyN11LmX9aP
 aA33ZUwl6FwuSvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a954552 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NjM4XxsBxMxLkyKWBQUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX7YTmm7iKymMr
 xM3Fv4qDUeos/KBpBk4QkNCtYampsIRLzyJVHhGZtOtT1tO19o318uLJzfjE11x89bDQFM5BGYL
 WDafhaUKoGBNpFK1z/1wE1bswdFukkA=
X-Proofpoint-ORIG-GUID: AVgWi-qZO5GM6W2dKHq60RIl-em2Ahmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX0bze8oh3LRkK
 yWA8Lf2liWDfgWeO1qKzFmn9SJ09qVn0ChTtk/V2zLVVslUrziy2k0YZDKI33X3h4DKE9dxvDKd
 KLp6gotKN0KCjJL6YMeKX7qr0PTIRug4mA45mNCLvP//L4BNQs+HpLOSJACAocVqhC26K207XKr
 nHpWUsohEdUv/P0wuwllt4DNlx3lIeXyEEW9Z8wqQijnx6lUrdzCdlLjhfaKtUl4i56+0R6NpaF
 pdeYn+RUd3OnEU7OMV10lu2ZAo5lFoUaY3sq6xLsO69gVF4LEZh4RR9oDAxtyJj3LQjZQngwyBu
 cAA8wqkyKOjWz4gCOiJHJy/2zCB643w824VBEcfbdMZtxyWA/6NuyL3UnuPcUaM+sOhDCqk7yro
 2d1SajgbTDlVPkf6Wg73rDWq0zNBgos4aly9shNal7Fv3y4qF1+UcylzXor2r2UtKbq1r9SSh59
 nZc+xG3e4v02X4VFreQ==
X-Proofpoint-GUID: AVgWi-qZO5GM6W2dKHq60RIl-em2Ahmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310078

GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..4df3ccfee106 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -963,7 +963,8 @@ &remoteproc_soccp {
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-			       <44 4>; /* Security SPI (TPM) */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-4b9c6e1677cc

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

