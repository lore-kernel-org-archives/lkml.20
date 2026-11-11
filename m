Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402340;
	b=pTs3TjV1ppuLhQgHSXgBlJaMHyqZNS2aQ/PAk8+wUa/hL0Fl8Fow4mjP26uu1zPwpwog
	 j6OefUmpN9TjD57p+taDsZPViWaVFCUBvMfOCjDLtl+OBcsC2xorDT7RHBlMkmwGY56L4
	 8Ho+kZfZ/DbntEL57Rnk6U7kmsaKezKWPiq/Oc5v9WkYjUIGgO29bUI7Mh7fnyavmU1vG
	 ULaDb9ScI5K9W+wM77odsH6iCGjbiLi4mFWh1uIDcTyoVAH3cIEFQoPC+AWeJKY71QozR
	 zho2vM1haev1Qn2UKCTY+ipuyewAncKWdFvJLFXFyyxzAHnrzZKbT2zd+RHgJM/fZnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=;
	b=KQH2JZjcMQ3D8kpTXjDWpkbZisnUK0OyXVIeXEo2NRGqvgZEylF1XoKDTdcquw8uoIoM
	 YVQ35n4vkb9VJEBjJhHCanfK/RlYS+fs7eeITbBD2GG2SCPI6GrYtmAXsfzsQfQ3nVBp8
	 Izq2wjzfGnGH1e3izRr5R4vcaZlVEhbbbKa0vBKvFWPTWEo5Mv+womrQOZyZVjrUYxCyy
	 KQYljLLrqyJWpsP3KMMHXcepJzOFzIAl7K9CwORo3EOuOKeoxcZ8uKi336l6OG1SL+EJR
	 25QfhQT7WCyNVT8+RcnHcRUY/c5Wk3iK+jWzXrBrN24WOfw1dYhtaFoxVb1+hodzYAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NvC/L5yg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=csaEgGHE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB8606A8A2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCB8606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvC/L5yg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=csaEgGHE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZUXj708240
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=; b=NvC/L5ygkNX5bN3O
	06sEMHIa076XPn7KEoMUaduGu6JAabJZvOxMpehYGm1BhPSk5J+PaxNUGq8ZrsNf
	E8v5ndHOsWpFff65yKypozPCGBr3erL1Yf1S2pcuBFuL87v2wP++UsxM+aSNLJZT
	d/VuEpAqskFsN9/kqLMGd5udCvxzdNJ4XmKlGuDx8mXd3nx3ZLLhrDia9jBBdZsa
	vYX26WVMI1bg9okDpnsqW6o1csnVGGedymqO4HRoVKfEsi4A31Y9KrnMoF+lhUMn
	dZubSgJNY3AVcpXq1cGOuFIVaiqA93ES7HjRMU9o234LbZGPVLjOkdfr88MIIBjl
	y2N4Jw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33m9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1075823e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402338; x=1795007138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=;
        b=csaEgGHEGZp660qi90rRJm0t27KCA/cf+z4VfB2Cl1N41tadjK37e9Cq75swIrlN7Y
         GdD621Xef9/PUwfZZhkUclnF8lCDJqk/WXHkK9rGZKUk+KQ7X19klI2YYFPO81U+7imU
         d0hAWRzGVIo9sRQ3JhX5nKU4RdrQGqGvglqI3SXQFhj4SV8IATbfd80ZVWV4ZamZXrEq
         IcjCiRjoxCoOMkrTUnMZuvNqbT3yqJa9fQsuoSHeO50ee1szQk6j8RYDqEoSpDR7eNJh
         FLqpUeumR+VmGqTkILof60z9YbYOLXJ7ld/zH95xznd9B2U2KWCjKJzNo+Bb52GAetZm
         ZxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402338; x=1795007138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQWl5k5Bb5z9sN1Rk2HwinSW3Pdya3j3yf455M6otcE=;
        b=MJDA6F5bn38EzaKt+4tbPg0EY++Jziyw4yz7adHdd2kPlYXiO4s3+uN1izugEiwuby
         Vq3/C/iJQ1Qg8ETwsBcKGSlj+lxEbgr/2OawOHRMefsRw9RoTfWar2Wvv2KxAnXmSHBQ
         /LRF10TEAydMAuyUgrKxkYdV5X5H4ga+ZdBCp0YW0Hkd9IiHFteK0AenIdre8o2ntDLz
         whwsyy5913OVwc6VRvQGGGwFNN5akZjCM/NnnYVtFhegi2ZC0p4ePu6TQ7/sC+bT5/1z
         +271oOO9NNzDiUT8uLfRtgEqt2EgI8FqNne6GLKZms72F95cSKZql9BJbZer/Ti3hEO+
         coUg==
X-Forwarded-Encrypted: i=1; AL+hErEba4PNnNTQmaG4wtoTyqVSy8JbGMVmfIBsyqbzR1UgSyTts/LFG9dZJWnWqs9F+VEljNn2BM2c8487XS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6imlDb15x7SdGm7w/NUbFfpg4WiDLf5HR91DzBjlZB6/kqnhK
	WjmNNYVN4jtHsvNuCLLtK/Fzvyinv7wZ28Ihi+UGqKxi0rvtt91uFdTUIgplxIy44bSzQUamdm5
	fN9s4iD366+S7SVDesL2NvMES1J4aLwbFJYfo2CEOwpa65GkoEyJxvos8eQZejpGtWTetacbtlE
	U=
X-Gm-Gg: AYBFou3FquAj7yCtFZSEjcIvtSDyFeI1twbwG13x1o2tcndKvjOXBlmHdWj9PDpn/QX
	igbHxnbSsSxTT8yL22EGOgrqzhAuptlrs/Ebr3Ij6Ws9BGL5Z2b0+VTDGt1wqdtv0XwEGIwpljv
	IDF12HhKxnnqNs7CZmqMtiaur7PEMrAMBpY974EdCijAvYQgYA87uey1PrQpfEml2SeqjGgTGx2
	YyLsIedKAjiurccOCmzNErbJSr6n8wzQpkDrMbPLJtAu0xuNDM6yOkKURJsfa5MtxjrifxMMV0F
	JVveYm79ka7+X12lnHgCseMw5os3lVveNB8H5AUYQFPz+mfTXk0u7n/Ip7sB0CjPBvhmen7Kg6B
	eb+Thn8v2SkrPKVSbLj7FRBPNbR30lhS2qRB8FH55MNOca7zE7Vl+DvMW0Aa+5vbqs8BAAj8p0I
	QxA7kedV3HrQdjpfn73rn1zNKMCWLeRvXnh1q2mwYh6qR9esdwq7jTqrXe1I0tnQ==
X-Received: by 2002:a05:6122:8891:b0:5ee:200a:8cda with SMTP id 71dfb90a1353d-5ee200aebbfmr213522e0c.7.1794402337983;
        Wed, 11 Nov 2026 05:05:37 -0800 (PST)
X-Received: by 2002:a05:6122:8891:b0:5ee:200a:8cda with SMTP id 71dfb90a1353d-5ee200aebbfmr213505e0c.7.1794402337496;
        Wed, 11 Nov 2026 05:05:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:05:16 +0200
Subject: [PATCH 3/3] drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10
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
Message-Id: <20261111-a3xx-fix-me-v1-3-d81f50f1ba1e@oss.qualcomm.com>
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ViPfrdASg19eIkYrm3pPJ/m7IB4rdlNRmFNly/QK20=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq9GgZZG5eJUlvVozg1SvFjWYOWtvOrP+He3MS8
 ZTKpYzsOsyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavRoGQAKCRCLPIo+Aiko
 1bT5B/sESP6mItRcWy5C+hS/P61fcKVneQJymiST9tKU5DB17cTE8vJdNQ3sPi67F8Wl7+26Ir2
 s017/c+3kMM7z2yMayfefgUQjX+Kpgg5aycbRI5RNrRZbU09TvOdAUzy57fxjhsrAb1gH2TbOQP
 Qnmq244amrMNd9x1KOmIgmjZAaH/28ENzw1NYkqBxfmRbUeCxoocDcxpuyVBjzA+BGOzOHv+8JM
 /PkMuAkX6V6pW75qHDw57K1+p5JHFw5FrRPc8BW+mbpUqEBI2NY642plRP8VBZQ1z+gT+gnk/JD
 B9TMg8DvZv4igBX8zVxbmcndRBT4nUyx9M6fiFt3Nj6/qUQK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af46823 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ypG0q2TZ0WS5u_ylJzIA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX2qLVtGzi245c
 P4GEGiUjAvmbCOkioHNoLpp+yLuzqisAP+h7NsuzGEAKTJ12qVrmLjpOyK6KVCHp1dhhfTZOJXP
 gGfrezTccz+ZaRRNLZoghL41CIwQUuMRtnqXa2VTORm38a4K+hzeVUxL1lqcWGOARfstr423vd9
 Z+EsyfiZkI7MSfIxKHuuLCbiOe9dbEV0ODQr4XcbE+Yfme0T8JcOTH9pS1J1R0aTUkFW6Is9ak/
 eBoRe/8IL/S17+MoVt2zeIUJfOERwTiVLEbCNF4hWooMIrBkpA6pcpmZT7StG92iDLWf7wIijge
 aakkO85+xgXINmC93dO6Xo92KiJCeGmdYRNRuVhLDvmlOSU4I0bcxHWps1FxK8muY9sr1V1PU61
 Um7e6Kk1XLp+BbrmTWwrEiFozUjt3RixP8OGOqpjfn7sBaRK1k1RVibQG3UTzvdxiINHCIFBP9d
 INXriYORgV1kTycIxfw==
X-Proofpoint-GUID: _j6U3X8VBCYx3cOBpg_QyTj0qoc_I82d
X-Proofpoint-ORIG-GUID: _j6U3X8VBCYx3cOBpg_QyTj0qoc_I82d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX81wiZAC80GE8
 2KqDEhoTNdZ43Tz5uaRvZ1rC48hzE2OQje7DJMBvZBMso7co+voyjMHOLc7X25Wot2Cwxhp+mJs
 0n10H0p+DgWDbcA7+kwqKun4xpe9m04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

Update the CP_ME_INIT payload to the values used by the msm-3.10 kgsl
driver.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 1de4277ebf9a..1420f18bcf75 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -103,7 +103,7 @@ static bool a3xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000001);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, 0x20000000);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 

-- 
2.47.3

