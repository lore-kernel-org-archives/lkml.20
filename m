Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92708357739
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480279; cv=none; b=kL3cP3/0ichoncIlMCLWmYHgnN8TxsHPvM2Fk3qw9zNeXPxgeJQQFfd0hCp3dYkyf5/6K7q2VvN4UmZJvuEkanK7GX9pFZjAGCBnXKpPNWZrfsqwtXQvZcCiCGvesBkxxg4cUsbvggjczKdnmbCaqNoo+ZXkMQcEYMyftYgtB5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480279; c=relaxed/simple;
	bh=b8G4zW5Wtr6HvO/O1ycad5fvQ6fZmNWP5M+lpqKGF/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SF1LZsqjZxKzZUllsFyySGk+QOsDpc0mFNmeuQ016sYYlnefUCBACNeGqWhAJPCEL37LYErDEUNVjzFGnpdwq0wpbl314KXAzq1lyJi0ZMyahYm2MqYqyvjg34fAXuahO0JDAB1htDzmAqZZ3/UUyWET5pwc9sbH5pLIBhs65lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNtoRA6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ia32T2O3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNtoRA6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ia32T2O3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVFXV4148827
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 17:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwpqtceDom1aGkBdN5g2SVPWt7IlrevNh3IiJviiP98=; b=jNtoRA6trUQqsy2/
	WxSedGq8gkDGU+gQNQSq4r3TloMX6RHsT/PBakkw2u50DJrnrYWypcvunISk29ub
	GBRriuUWzo8shexE+AG3ILHk3eRtuFUdzQebTSLVdvED65DbkLqJhicohffPnThV
	pyiICire5tCpnUTLNv2+pF/E9UetRvAB37eeT4bV+YVGl/6dPoDRmPJitDIVbnOu
	XCUkxbBer8mIsrx75vLdgU8vP9Mevw+KVSZjaFUsWVgM84ECY4e7q//HcAXqNpF8
	MuwpqzoSBYDQYii4WuNMQ3FZavpJeiEy/ZmBnjs3PdoM3BJmbnxosRoDJN5PyGoH
	HHR64A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6c0t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:24:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so8922386a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480277; x=1792085077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwpqtceDom1aGkBdN5g2SVPWt7IlrevNh3IiJviiP98=;
        b=ia32T2O3vH5/vnc42W216s0tMTJJ6COwi3rsOKsaHBmolBSCfL3sAYrY8zEDtl7y0s
         2fya8aTczj4QZpD5X06mXY8aFAKcGTwF3SOivXECRshNisRyuDzOWSJPbXlHlvBdfgPk
         +JL/TeT3sE4dRhvgEE+EE/YGNfhaEgFGcwMBppl+aBp/W71NIGdVv/kU4wwJZ1goRfyO
         zSRW1fo0g5hebllX1ggybFmwxE721HBvUAe5uQiWnq58tSqCG06pk3PtAKhpkxwEh7LQ
         cXhI2ztA0P8DoPL1TrHEBKL84H+/PmGoBkza/5ZJ3xT0kry/X17F8UtE/wQsrHhBscEW
         UQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480277; x=1792085077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwpqtceDom1aGkBdN5g2SVPWt7IlrevNh3IiJviiP98=;
        b=Y+q7ZcZiSpDK085rb4VRGt/Lc17qZi9XBYH6Pm8ZZM1C4KhYavWkFTec/7RgNwYqyN
         cwL2tyloElNpn6uKJyDKVg8UtCa56rpzYYD0civAlDR60EaYIOSRj43cO2/5qcDZ5Scy
         ws+W5mcxT0iSLWmGgcsvw61uqTEIE+mFCV7Tax9tehrq82a+vjp4GLhdqT783UEFrcjO
         Ije7rvAcNdPl7p/ePtRr44clVsbSviz19Mx9pcX+HazYQyoTh5eG3iJqRoEIRD6Wp03K
         MgZPAnn+LmfihEdKlxWGy0SR5zWs5PyHZRzoRATJjMlaSdKwOPe8K2+tUREXAA1LwO7+
         VCBA==
X-Forwarded-Encrypted: i=1; AKwUvBwnzIYfWZnpsgTZMFoxYxX1jp4chHmgFVhPiG4OBoEza3FOg4JbnjFic8WFGhezvwB7pSm7Z/hCeve99p8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ/beAexANo4FC6BVhrdv2doZ/4NftVoYxXNsFhumd2Sx3q0sB
	NisyKoqNFNmSTUOhGj11zPN6guLM8hJ8Wve7fv55hY3bYRLs3Eg1Si7YlaMhuxdxnE60qQikkVn
	LJV84bf6di32611qswjVjeh1lrlpWXpY0GWtsUvEE1kvOt+Qr8oc8cj7RR48Q77hgWzLFK339RS
	4=
X-Gm-Gg: AYBFou1R8+tWADwZOAo7UBCZszfqjmxy5EvgFMg0LktNoDBaPQnwmY1onpoxLJA+lYM
	jI8XQg/6EXqWgt9oFtzGqbB0DTE/6RocNaz7Mmp/h/jHBn2v7YH28yWnSjwS1gEukcoGmU+FRsL
	pIQP8GTjWSwB7xP90bpCkGdfseJwf564eO84o7+UI3Y15mf/rarvIaIg0yYhfoblVMB7fhwlssa
	hTipdmIPY1vxawmyZ83xMp3Rax9XsIMiAGPbblFjTYogmtZY9ObUa8O7RNYuXmFrNeVDMzRQ528
	8UPB3RMpRVE+rWwvcWOklt5lEGG/XYnvKpw/IuiWH8sBCMtEMasadL9AEcnnkMXBv8t0q2pyTNj
	dFSFaznmNHLems052JuAa/pjdqA==
X-Received: by 2002:a17:90b:48c7:b0:3a8:495b:d65b with SMTP id 98e67ed59e1d1-3a8a04bd8c9mr5760839a91.5.1791480277000;
        Thu, 08 Oct 2026 10:24:37 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:3a8:495b:d65b with SMTP id 98e67ed59e1d1-3a8a04bd8c9mr5760814a91.5.1791480276515;
        Thu, 08 Oct 2026 10:24:36 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:35 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:50 +0530
Subject: [PATCH v4 4/6] drm/msm/dpu: filter writeback modes using writeback
 maxlinewidth
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-4-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=1605;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=xKhHPbKFhLL4gdnufa1GvpLiPv0X7mVU1jtEuTWW/j4=;
 b=eDuowAHuuxNU8vFBxCO997pMI1s6lyVxVNzDpxSs/SBlCVdZSTXZ4IPtBAFuKKDEbqXUNJhbI
 2TRhfhVfGjUDtsdRXA+HAbqWbmBRKT9l7Qd0sIPZCpZe8fQsiZ1GYRz
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: AK24frrTCBX7q96n6-JMyfpo0m1vOr1g
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7d1d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=K26iOwrG_T4ePdtMxkgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AK24frrTCBX7q96n6-JMyfpo0m1vOr1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfXwxyfPZ4qSs9s
 b22SgfSRwob5ErKwy681/EdZw2wSTKASltjzUkD42XBGotlkeJCH2HkDKEAyfhXYFKHK+GYfJ5G
 ZoTp9Zn2YrOS08NtqWnvReJF/RjGiVb1BPd34QKuyh/qI5E9n4F4fqSrGSZMPxqelTmEFnXMB3G
 UPUgNCVE/PKMF89Ktz0OVmt0jSQV8lSAMZyYWAmJK03Lv1vBQh5kLdLpoaLNDenXn1VGxkE1xMC
 2rwMgfe82eBmssaDkpucGuU1Qm8aY/f25B2DcUtFO4C/RtgHWFyxBv5uU3aHJZypHQlLl7EFB/w
 pOXV9ACZmTWUimtOzqSCv11ARN0Ei/mh/FkqCY4yY0UsrvOdmC+zx6YGBDvLCCpwWi8yXVO2xaj
 wLWU2AfqYRDucr/Nr+RyG4Jo+U/oIXCDprifFcBsDNvwUpm6ohw6jfSORcaWx0EnkF/N54RmABm
 barjIJNR6CN/nUAu3rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX6SZhOGQuCa39
 pcfT/O8Ub5Sda8P5IKWNvQqLji3tH45rOKSS7oUkkftluoG+jeZ5Q/ZgN1KYSaq2q4K7APjDxbj
 x7WPaGoy1SlfGqwy4RzzoTQDIPb4vI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080069

From: Jessica Zhang <jesszhan0024@gmail.com>

Maximum width of the writeback mode is limited by the hardware buffer in
the WB block rather than by the LM properties (LM doesn't have an actual
buffer). Use the actual hardware limit (the writeback maxlinewidth) to
filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: fixed commit message]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index e7b09013ae4c..a31b6e2f5cf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -15,14 +15,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.34.1

