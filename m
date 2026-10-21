Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592564;
	b=cR16FR//yDP7RFj9FcqtzL/eVIb1Ck95nILZjYL9TpDaoIFmlDbSuaPa2X+/Wn31rWMA
	 eO/PkY2oCGVICYvImGj8qjd3NVNuIwLUqKXQwIE6HGxYr8Sz/3nRLyHmvUIWl7zLtNASL
	 PdlVCLsavzDVPYBDo4dCdyH7hBYRxtnHaYQiihefOlp+rZTuu5OxIQ/Q4m+QJRNZbU7A9
	 +aAY4g9pOQQ+gdtsXHRg8mfl0K2BCU5z2wOPSDeeO6D7EpzibjE5DSI9pY+Xa8mnh43j3
	 /v3BCBDVwE9dg2v0RGB1pfxTa1PqOoALOtZBv+ztoBv279GO5c/gt9XVpFUsdmzoDUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592564;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
	b=ySq3QDXeMAO8wi1UNKC+WWfobcP3obmbHaB1dzm+uwaxIKL9MieaxVwoARtoAVmo5Ujf
	 C+leF/HoF6c9Oozm1fmcNZIrRGzVUYIkLQucEgRHGmpy+fyJqlAFXEvZlUGNz4NxQxKAh
	 jyVBmo1ps7r+qzimPivYCpiyenR/CQwYFo/lnT9ILk8dt5icLHRzkpSy6SMAH/VPq0Eya
	 +A+L3eiMqKBi01SWkXKdLed4CAWtd6CAO3fnzO9hyuRTWaiDas/HWvSJ3n3uL4C+Ksw+o
	 9ifTSEnrUxcP+80+u7TUSnx6QV2+1rZVn2dh/oig8U38JRxdVuspCNhBvaTWBOgfQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdiEhipY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B1606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543B1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdiEhipY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFoBZ3994872
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=; b=VewUM90tac1EJ1iD
	u2kspP3k5ottnaeCKtfGoIvVN6yjkn6NOJG/esUL6PM9njmP4XpFo/u2YgZihGXL
	SYIZy3XhPjHiWDh7foq1K0xW34hapKkLbNQj4WwTLjjYoz8k34D6zhzQzIA/vlfT
	GwVAyexTgrJmByVkds4JfQ0utjNUYbChT5mz3HQicLdfVMfTzDHtojEpLMqlSK0E
	oy+jJ3fdqFtHqwM8kJkaeZN13+Ut4JQSCSaWFdq8pW0jupPNH9tea1J3UzvwlUt3
	e1Kvs/B8WA/i7p3VP8WLbGqNeFj9TbCoh8266hbvQUFV4n2BTbM2SF5KKnOQ2rfR
	3pcy6A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313c7315becso117106eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592561; x=1793197361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=cdiEhipYGI0cVc8bc20oXkv6yENguEr8yN2iuyM81zWodf9JM66QQ0wwv7dozhd2ps
         wZ7ZwdVb0jyixJjSdBXHl9UElg176Kzw6d+8m7RB0oKHnKaFuZtRNiKyQVy8pn66JZcS
         Mi0wKXP9AR3v4rwQiw9Uhj9k1EVCcTwPxerF5PMkWOdEP2BfimLAogwt/V32pNXjEf88
         qgrFUrYFRs7sOlCo8QACO/PO0dTgub9wndWhqLnsyTIqJ6i7v2nZiOH4UoYHFhBM0J1U
         WammE1Firrb8jjitaMd+shq3k/Rtv7748gMdIU3lCp14maB8hj6DuEy1Aw4tPU+j/e8X
         8tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592561; x=1793197361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=pD9vy5/RntFAxsON17q8gBTVGWsY9jtjp48XnCixRj93ylQVlnGi8QiSrEqsa4unLT
         tU5Co5Vv/KWHZwjwa2miNDz9tzgFIHqMIXjfqca65QtRslQRB0gK+hfgJcPSFiIr14td
         ugGnyOfi8M1m5Y9qRh3OHKPersd04bVJWAqtrdu2GDZz8znw9lkxlj1C4U+sY2RTiBrl
         LIe0ZtxAlnbDqYZ3YGaEermEAUQ/X8NQPj3su3uBzhZJj+eLT8jX5TFwPxS2epEvNbMz
         WrIC2QxDqYt6njX8IbHxa+wuTkZR2WM+b+FUQMItmZ0f8XELWJKtt5Sff0nCoggRatGb
         +Rag==
X-Forwarded-Encrypted: i=1; AKwUvByXzmhS7JPCCyzBMFNxKO/qY10isA6t8Hf4y22AKudyzxGjoBWjo44+mQZOJDhCpvi+l7e+ZWEXhU1r7Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ/HbiJf1hs+iIgDIcy9aU2CUKD0zjzg+BplLSRmEyj0HaCDAD
	/ZnB21GueEjcn1z4q2bjjWcrmzGUPQ7muRqDC/XAvWVUH/7oSjDvNtJs48Qm6iMKetT9S2ddDhl
	mHi3zR/xXS7zb8qV67sSK0rvGkKBg2UTjk88oR7zNz5zPdty1KTHLH8120VFyEH51xqo=
X-Gm-Gg: AYBFou1Uu5SiJ2iF3ub7zdnHo8JvRUMxeUGpYMT3jXg7Z8Dn0dRW4LQi2+Z4tiSGpdN
	4QOJLi4k0qndICVFp9FV4rufq8s0LSEM8eHzimPFJS3J6/ZD0rRABVzhO7fLgiBHT/Fdy53VU/a
	ofsl3m1UKJoUpWyHTmi70BFqs/B76ZXuju3Iu/XGGg8HcpzwvGS25TPAVVR3iHurELmADAXPzSV
	zVTRuy/eB026EC2qDhlSCtwRBYagh//AJjrI77EdyJP/wqk2zz55o9kTWgVrM8k35j0CrnDI6Dh
	yBjAxcNlzZaQeMK82wayQBtvNsaehHdBwOP3RtTZWzIPCenCsvfOPBOTuUTDQWHVtc/Y+wqWS7V
	Fiz65BgBll02rtysSzB1Hi7sWKFWLDBf/jmiR9dTXCpfndZ62mLpj6zJloijo2QccwfrKpTWTrr
	OV8ws09jAFnY0/2oZ0ymydqkFehwG7BZKMaIJAzKXX+2h2FL15H24=
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992462c88.2.1792592561118;
        Wed, 21 Oct 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992373c88.2.1792592560306;
        Wed, 21 Oct 2026 07:22:40 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:47 +0530
Subject: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2 regulator
 and ILI9881C panel
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
Message-Id: <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1221;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=U8f+j/BLf/HSFgdLnfHMeSGonjaUCp8+bl//vReoFnE=;
 b=DzMMfaEXvKx2FFuZQfwCxTAstnLov5p96AEPmDFiRpSHF3LH3TYw/+3dMpqJct+TP4Xzzc2rL
 Py3tRE/V3FsDndfVbDG11q6MLSzHliassiWoyYADNnoENEPXXsXiYJi
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX6DROHRoEjqQY
 pu/rpnIMwAlpgmwTj/6Kd7qf5qJXcI7cDq8+8Yym1MNI5eDP06YOLBOz/lI1JhIwXUb8np8O6SD
 3BGVc7v25XB9Ko9sVqGQubN8AjtFtWg=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8cab3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: MCIvxv4u1KNLOzHQOA3ChnPHUZ6k-Uaf
X-Proofpoint-ORIG-GUID: MCIvxv4u1KNLOzHQOA3ChnPHUZ6k-Uaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX+2qf58T7iClR
 PjeiJfYMjgbhPK03KAqmW/cGNKG1vK+9RmbC/uDpjmvYZZ1sxT195N0eyHnV8eCDcbv1TtVXKyw
 VKZh956UmOtOd2EJ5Cm6gx+vL5hqueT90DG0yrZFAKUWVU/yt1sMCK11t/uNVGbco4rQ9iohCd/
 5rrYYLXQevmq6QqPYDgqKG2Ukot6AeNTRJH8zhXHrhDGshJInMFCE8aGlHoHB066wzcq8q0aIFX
 h6RuLkS31Dxv28ILUQQiTW41P28FwGoVwAUlKIdpvlo/L2/fsEYPjDYEAo0Jm1bm8T8lmkegAFw
 UfokSPbHjdJtSGHQFcxcTfW6vHFTjyVZbJmsYXakjz4s7jFQ6WNcp3fVQNEggTwaa5c4x49VlVz
 HFlsqVzImwgPtxXsVtmiOYrjg8Pzv72gUwuJpBpoe87vjg3nkXId9uR//3hwOJ5iGzKcFpLVTPY
 8TwarC5RF2ECJln9wOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

Enable the regulator driver for the Raspberry Pi touchscreen V2 power
and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d18f72e55330..9c4c47a44af9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
+CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2=m
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_SGM3804=y
@@ -1029,6 +1030,7 @@ CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
 CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
+CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1

