Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49229B781
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987457; cv=none; b=nc/GJLqqTtb+DhBjAJvyLbq4Mqk1e1/ELc2CD5Xcqrlmkh57M5hi4cbVSIJp+WhlzMCd34n9/jrQJfg+DeQRLxwQLAJQm8moCBTGS9Y2u6KmsBmbdLnQeYfH6jfBvfKMyN2YNdMn3PvgE0/jipg26B5W+0EkGoNtGIxt6RyoWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987457; c=relaxed/simple;
	bh=Tcm1wwjFUx6qr560GHqjRbA//0DsF7WwB3VWVPjtYn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAFcytNEQJbx+XGttNrTn77MvfukIab9mRhdB8FpeLH+4Zv+jXTKXEqMlhtpJN6KP9XZRIPTiJTkrj4+TxTx0DKn5UPuhyAHrbhrUjw99Os3U0uVeC/IghHwOR2tVqdiULTzGkx6JmLbq5H1ggL10BDLNQE5SzNzYyD7OdKt5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrW99CZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VM1LC4Zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrW99CZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VM1LC4Zh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne5Fm3812192
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHOhCOzc/mfTLMETVqcNmf3tHPYnwjCQ14Z/p/+aNzc=; b=mrW99CZFoTtWEbva
	ASB9L6EE7QSfHG/biXyu7a8cz+yORecTwEvGWfLwpRxiZ+VO5/qKZsk4NW0VeSU+
	zyPKTJ4FA4//2OAahM9oxuuCof6aF6Nhj1pCGjL2FOqLTAhLS7lpt7NCBrw1KGJF
	grVRXWRc5r58jay+WApPoCYfQeDks2WDDgTZF+wPTGeHwXz8QSqAC0sCC2PSrzj0
	ENi/1EjaUUY+1kfgp1twV494gRhbCkOAUzC4sAXHKZfFcYrhw54Z7NTEGN3cUcXq
	cE7Gx+eoAcUFp48OrwAcJCjYKbfHDl4VpQToz7Ppb84wmgDmE70kmJa715CUfZ9j
	lr2CEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mv4pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so28886885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987451; x=1791592251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHOhCOzc/mfTLMETVqcNmf3tHPYnwjCQ14Z/p/+aNzc=;
        b=VM1LC4ZhC66e4rbW8CITSpflE6X04sRX6vkO3AGBd6UBxsv0o39y2kaqKpibRJv8Sk
         jBpwaAWuOa9nm4U7koGJ9rVzjFByfE+nZoQUMBwnAjITsdW6WmszfLbPX7VvVLWvVm0L
         gqKdIenhxmTr3Zp9WF++e/6vjo5becDc18LcnfkP03IkkhNmBiT6l54Tw90GS426NvtC
         j7SuNhom0eFFiyR4VcqdyZ7gqrTRdq8YFt+YHOv3cHO+r2D5b09dHEAWf3pO2I5M2/pD
         yii2/7yCnbLWcB5Fhw/1pHwWbTNVUuFWXlTx2+fqnxvUejCVhcS3+aqvVURLtbqrwAk1
         glVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987451; x=1791592251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHOhCOzc/mfTLMETVqcNmf3tHPYnwjCQ14Z/p/+aNzc=;
        b=JNg9MyyGF8dwd03c7GCKA8oZKmIgeb/2sqMpER6QcgnEVhXDsnbf286J6x7Aobt0qN
         wZBKFYZOY6nxDQmnaVoQ+eeZvqfK+FVixLvHM9AXaa6UrBjXnsdHOsMgXLSn72SVXh6l
         YjTY7Ewzj/KuU9hCUa4S4wV6LoLYRORWtiIdxY8lBB3AaCR4Z38U0bHslTjqYOLxuGMB
         GSl+lMxRnwSqIwJ+6/WO9XlRNTskOjV5+R3OWr01wZQHleqRB+uKz5HDGzwx/PygPs4c
         kgQ4IOlOzwS9CSyHYyZ1Z6V6up5AJHxj9oHERMz4dxUeMJV2ylx5t7goQuzooaK832sx
         JvNg==
X-Forwarded-Encrypted: i=1; AKwUvBy3DhMQ1P58wYTwXu9SXyo5n9if0WmMPx+ew5E2C7tSgWJIjxkp+mF8Ok1fpW8l8O/jzZmEMWYV3ghA3v4=@vger.kernel.org
X-Gm-Message-State: AFuF++kolp/YRpOZSJ40pU6VV8n/ixjQ0QQQJemR1x9d5ujOZMJFvVwh
	WplqFnCfd7m0ErwvbVacLWUuxle3zMLn6lfV4xJvaC75jg8D1fNcF4w10jpjMeej+4mMJU8jh1X
	URHYVhGXwisdYkLPa5uo24l1WQ3pAZrPU23hC4zQJqyrIn7gZVFdXZyfBQyfJ54RvgKs=
X-Gm-Gg: AYBFou0Q/tNyrJOA7XJiWCq1vKnr6SKes6uWzyIN+/tsE3Wilma75nGnkBU0hTIyrWH
	fIPSaJBCfrDGLlVneNWFPpotEhv4cK/1CZD5IfVeLNktafZsTnxjQwp9ZUxTaw5eaF4QIKbZFGO
	lED1HWlskLTizLD+1ayiKSldxXstsMDNYrq1sDyEqpjh9tmIY1XXKOwBF1NJs1La/Y55fiwBny5
	rcAM+2gK671u9VR8xu6Q11JsO9S20mA+KzbvMCWfFIyduiT6YIEPUQGVlMiVJFtRbKT5/hGQ/uC
	A8C+Swfi/Yhhqd26hOgwcZebCNA62OopoqqDKagj22Ccb5YenveTMn2aL4B5Jp5teqpNT/1nFAx
	89TpPulUfQCOoo9CJAhn+t9l/wH9/HnDm88COFC4nbXwfevz7McspSocAIFU3z2nYY9srY0f4sT
	3r52607TnFrkf5
X-Received: by 2002:a05:620a:370e:b0:92e:45e4:c6e with SMTP id af79cd13be357-93ce7c126a2mr814748285a.22.1790987450554;
        Fri, 02 Oct 2026 17:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92e:45e4:c6e with SMTP id af79cd13be357-93ce7c126a2mr814742185a.22.1790987449819;
        Fri, 02 Oct 2026 17:30:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:23 +0300
Subject: [PATCH v4 08/10] drm/msm/dpu: clear the DSC blocks left by a
 previous reservation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-8-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tcm1wwjFUx6qr560GHqjRbA//0DsF7WwB3VWVPjtYn0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEyeHM3qodO1Z4dWypShC9HlO1P5tnDPFr6/S
 c53ThRUNNKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1SPpB/47Q77z17jpxRb0zyfwxmrG21V9owc/wpGMXOjNrvrBp73o7zHvOh9yD5inwpjcIrd9ewJ
 jqqE/akhDolwoF//pVDm1CB0RkCP0Rxzf/++W06MnXJfjmKr/8gzRStduh0a5cpJ+BF3XLfJxVd
 Up9uDma0k/ldJxYyIu6H21VVuwKeJIFbSxQNBe3yTGxIPxxDLx6hk62fiAOyWwbZeGhsCuqkIdc
 mEVxbyuw9ym0Y1z4o0M4XjJpecjmUSeKYr49h7xJtJewkTMHZKAqH20eIBOS+MW5BbH+PkifPzA
 PWQ7csibinNcvqdoZ+SQ2tWQl8XY8/B9Jc+iRed5eLqg39ld
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX+6MRW2Pnnwbw
 jJY3J/BDaSdTq+7OsB35ynqbzWE490qt2WeS4aqBkUdljsgldxO8ICQeOGKM2XHnh35DmVbTHoQ
 UHUHt3DapOOFQJig4tcYqkKJ24kGMko=
X-Proofpoint-ORIG-GUID: 5NBvGKASicAw0he3jtodwrJlCwYPFp3x
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6ac04cbb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mN6KdvlfDCua2x_U6QQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5NBvGKASicAw0he3jtodwrJlCwYPFp3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXwoT5yqNfMagV
 iQk7j8XVhDZdWFGeRtE+V0wq/Iuw2irGLI0c3quhi8P/EmVgzlHTS9IyCgNTgCagczBO3J4Zwl2
 ECbzMtad6pct4hQLXHBwBb/AZO7DN/OSbSJDym8xf0Fi2FVFmF5AxsXaZ8G7qFMaLj3SshoukoL
 E1DFgSif4/T+hVOjYF3BnL53hNFcIsgYXNRXRwvtcztKYGlY7sAFTWPj8H/YQ9CiuftvF3aHIj/
 DsT0zWiEpBgLswbb8tuQBlDX8ZbDfVA91a5tfvY3Smm+YUCCmV2uTNHWYrSg8M+YT5q/H5CWIRZ
 bfFVq1KbbIjd57QIjUzM/vbN/oHlHu7/C9xeyN5ebEO+h3mGTKf39gH7z0zP36WzYyol16Y8A6d
 kUD3fuxBLqlVy6+qjdMWXcJfe6kQymHKP6r1maVPRIYxFmjGLjj4xBh1dxEjf9+ndwNRCGgHPSb
 yqjZBfkvGYYLmtwRviw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

dpu_encoder_virt_atomic_mode_set() fills dpu_enc->hw_dsc[] with the DSC
blocks of the new reservation, but only the first num_dsc entries.  The
array is never cleared, so an encoder which once drove two DSC blocks
keeps pointing at the second one after it has been given a topology with
a single DSC.

dpu_encoder_use_dsc_merge() counts the non-NULL entries of the whole
array and compares them against the number of interfaces, so the leftover
pointer makes it report DSC merge for a topology which has none, and
dpu_encoder_prep_dsc() then programs DSC_MODE_MULTIPLEX into the only DSC
block that is really used.

Assign NULL when the new reservation has no block for the slot.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6129b01c35e6..c9ea303a4b2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1224,9 +1224,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
-	for (i = 0; i < num_dsc; i++) {
-		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
-		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
+		if (dpu_enc->hw_dsc[i])
+			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
 	dpu_enc->dsc_mask = dsc_mask;

-- 
2.47.3

