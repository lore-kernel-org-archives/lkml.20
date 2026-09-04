Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5C3ABD8D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544148; cv=none; b=iqmfmYxleRAQ94Ky7hAr+3l6eJLwXOwoBK0/ZQiL+oraGVSJhAnO4lZ3WDndG3Fato4YOXgcbepo14cTwr4R7ltOCnyJ3IhA+zHM+R1yWRjOxOz+gkONdkkf6smnMIBBURCV2V7XeNVo9kq8i8SvCFsRKxKUelOgijMnv55qpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544148; c=relaxed/simple;
	bh=Z8I/KWioWVql4eMWWof65XaF0VvF9BxvMv4aMm1/0QY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fKbv39Z3efJ4k12YohEzikC7Oyw6fC9Rf7cpV1SOczzOi8eLUXeDtik9H4f3oCmu/Bu78Zjn1S94sSgK9te4IKfKiu9pGyy5N3SRq0hB8QEzGVsp0Y0XO3AdpZgOrXD9AnGXC0q9JSkSVutCMVvfcJeuYmdY/+ZoRB0viSsS4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFoc6UaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2h6bNbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFoc6UaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2h6bNbk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HI93I208810
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 17:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F1RHNyaRWJ4ta0UbAGo1jT
	ekzPqzeCJ6gFiA/tyxCaM=; b=GFoc6UaX4HMepGOGzj4U1947POHaWrVCdA2jGR
	PaHOKyjjhwXcKnjk1u4TvTizVuY6hJb7xQX4ZxEa1IfA6rXnGupcGDU+SgyU5fri
	eoip6/n3mwxbZ9xACIYhk0hs62PpEXcpHkYzAAA3a5zxZjAEDn7kXN1QuiWE5Spp
	TIUhluaDKImg1p9DUXbi3PU076FEVtmVlgBTEdvtjiRNxJy5XtVvRnGDJQp/I6Qs
	KXAl/N0yhLi6dzr7Ltys2Ci6gWClO10mnARE64cm2MJocAoQzSZbo08WUqmzyM6Y
	RE4KBUfjoCbncqY5f11VrwL/sb5m0jwOtMxgCgr55510PqlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp783ymu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:49:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398bb9a6408so270033a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788544145; x=1789148945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F1RHNyaRWJ4ta0UbAGo1jTekzPqzeCJ6gFiA/tyxCaM=;
        b=f2h6bNbkD4sG8hnGFlQIX/Xa3ppumv1k7Mp1XhuXTFDYAX5tgHteB2plCwCVR3trYv
         7XPEt3XlQy7WKTFVYg72rxvi4/OYKGqcCYU+hulQrDJ63KqVp9CZGpHGaQfMOyV7Dmtl
         KAk3wUob9/H3+2UA/5mwVV8ffHqlMxkCpGTiyOXCp8xn3wtPZ95bHQZhVAXGkPYm94Oy
         TG7SC8lBOV4CqvNxQ+IqiefFN2OcgYOUhM46DDQ43yxkMNkk2LFm/W8LdTpx5vomr06K
         3xY0I/FMSwd1jkp1q0grGIio9AVz+gP02dlCkpiPM1dfAr0Rk+K4MeF5j+0ZFCAv/FHV
         61CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788544145; x=1789148945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F1RHNyaRWJ4ta0UbAGo1jTekzPqzeCJ6gFiA/tyxCaM=;
        b=Jl7OzkF9vxeu2Ke+uJwVZ+C/E9yT0FNMOFHS1c5pywX51dOJn2KunoJANgirft/tk7
         ia2RNrDky1c56+X1zAwoBQk7vQnx+rnSlQxjTIB0P3iu9hHbPxteqaVJC1VQPU2zl0Nr
         Dnw5wGIQ+jyJnz1qkCrN7KNg97lDVUCq8bPomEvF8C5t97Xsm/Ews9wBrUBQvDXq/DoF
         /YOsQVXLNXIf/s83PWtzHyCNOj48/9dl1orcfSXozFFsbReE/Eca+M5IwYldMVja8YOF
         +lNg2X/iH4/qKnYNW9SZtV3jh84mHAQim+E8tt2lXZTNUpTNxAWZP+mJHHEHtC1FnWWp
         UJhw==
X-Gm-Message-State: AFuF++mHUmpv1dz6U0oFxGYExB0sCP2vPvP08crw/UUwDs3Q9RAMBhEp
	Hv46t4OZ+j/sP0APMpxwV1q/eEjpoDFV73tAnusy2fhz/xNIa4K89QT4GagYlH8s6Bxltpg01jp
	s70KptEEBRN7x6yoPDdM65oZGF8qDYJJpUAODIYY46dkgbLLXyGXTV4xEbef9WRisLBDAXRxsce
	c=
X-Gm-Gg: AYBFou3ev+424vWlXkmzw8jdanocxBbYrBq3E5nkh6Jiw71Be/p5KKoKCbbu90vAUYG
	z7aVYqdWcABoexQNTcDERTNtV5d37KUfGJcUlcw3bU70xRR93/MgjtIRtMsWTji0KMzVh6DM6Bd
	3oQgsl6vR5QB3pnSjl4EA3MLZoPo1+4e5Gg8MMrB8cdc4CizuyynT6GEJxjrtXGcOTJW9I25jmZ
	TpjCEOEkNA4maZj7oRGshCyU/GzzEnDkqKnENET+3bRW5tHghVa1O6JCCbMfGZtzdub3wOBZXcW
	wikTZ4Sq1tsyN/p4/rkYbPStCUGPZMWpK0Xdq8ljaf6AVzS636Ej28qYokS3xoPVZsAr2VccXfd
	ybDfK8aedDSEld1cpSXfQwcaqnvNpm0PV24FA1j8QgC5WbjFZOTyGLexjZiEjsDfcwwRB1PMIzn
	DUOsQ5FnKzt4uXTji9NEPa
X-Received: by 2002:a17:90b:17c5:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39b3d7595b4mr687013a91.3.1788544144636;
        Fri, 04 Sep 2026 10:49:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39b3d7595b4mr686969a91.3.1788544144177;
        Fri, 04 Sep 2026 10:49:04 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm8937751eec.30.2026.09.04.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:49:03 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 23:18:59 +0530
Subject: [PATCH] arm64: defconfig: Enable Lontium LT9211 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIoEm2oC/y2Ny2oDMQxFf2XwugojT+p5UEr/o2RhS3JqyIwTe
 xICIf9e5bER3MvVOTdTpSSpZmpupsgl1ZQXDfjRGPrzy14gsWZjW+vase0g5gKLXFc4rKNFBJZ
 IeYlpD4EYib3l2IvR/2ORmK5P9u/ulYuczqpYX6WZpVb/VEzN19uwBc/8hhOEklgHlwFa6Bw7h
 24Q7N1PrnVzOvsD5Xne6Pl+GIOvAo8mrVMjDinSMKBCKY4sIwfuggv99tMqiGNQI0azu9//AVi
 46WsHAQAA
X-Change-ID: 20260903-for-next-lt9211-defconfig-bcd1cda2df7e
To: linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788544141; l=1292;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Z8I/KWioWVql4eMWWof65XaF0VvF9BxvMv4aMm1/0QY=;
 b=gp1Xr5/feVkjDYpPFdJQrMd1paHl4UZkfQe/4UcmnOMqKMkRL4/t9AbDN9bAIOtM35pD7Ztcy
 qeIpdaRSM4yB3NUEZ4QxOKegGOAoCSp2hTjBKSHGqtrDR/t/L7vszS2
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE2MiBTYWx0ZWRfX+Gf+fflLcUxp
 WqNZt8GqT8eh9xQxovXYBCjZCB0dvY0n2KhVP15jsxNzAaZI0EGJ9YGUigx2ig7nGOhKaL/aQqD
 7nYiLMRsw0/d9ZPc2zE725mpCIE6mec=
X-Proofpoint-ORIG-GUID: R61M5-moyhw0dtOeecPd_dUT6ax2Vbgu
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9b0491 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AzMbarAktCzVnCtgxF0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: R61M5-moyhw0dtOeecPd_dUT6ax2Vbgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE2MiBTYWx0ZWRfX6Ft+ap0Yw/Fb
 o1tOKrPFprip5QlfIfiwJh8t7i0BgX0l4yE1ou6Qbud7Rfe/fDmMMePIrBniRRaZrChymS8L66+
 utxIqoEvHDdnQSpd/qS3g7cMAt8Opp0wf0XHZdgTK2whpNVjjT0Lphl3GU52MSr3ok9ct/nPWkK
 PbXMe+f2ygT6ptQTcEe/vnvN56gv4T8jJgRnjqnWOGo4seCxD+xvIgdZzSDwGyqedM96wNgDXN1
 2ays9xcp1hCgbbgb1filQK3fIkQ3VeFog4dvlFE2EnKr7YzpyQKQvQt5wHOjW19Gqr8bzaj25A/
 Wa0sO/eahovUo6HnRzbFf/J03uXbM/c83BZ7S4ceqLzBKd6TLfjfYMUgFZrLE8ZscuRKlWY64j0
 0GlIK0DCsIHafVzGVehFBGUv7IgPugaQCUjtEdDnlakoaKflHRdlTor80MANYz1Y5pBgUC1ekvG
 SbKwMD0tAY+PDQknyAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040162

Lontium LT9211 driver is extended to support LT9211C bridge
which is used on Qualcomm lemans/monaco/kodiak platforms.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
This depends on the following series which adds the LT9211C driver
support:
 - https://lore.kernel.org/all/20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 87a6c50bdd14..5666192659f8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -969,6 +969,7 @@ CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
+CONFIG_DRM_LONTIUM_LT9211=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m

---
base-commit: e61cfc881090cf9de9dbd3b6b7452661dfb0261f
change-id: 20260903-for-next-lt9211-defconfig-bcd1cda2df7e
prerequisite-message-id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
prerequisite-patch-id: fac2b93f3e250589dffd7c076d2ef1aa7a2519a1

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

