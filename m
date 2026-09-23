Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA847484243
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159236; cv=none; b=rUx1FYCqAB5n+93Z07qws9U0xBwEiOQrSFiHi9zxWNrliN3fkaq/OtNwRSJD7UUZIOHlgd+JJ+JeNiCO/AEASTK+NyAcsotHsmCKBtpp92Z0ajSQQ50xEUzuiZpW43uxqPNbInu6ME0Iu7eXGoU0gasqBmd+GBrZhZ5ewoe5ZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159236; c=relaxed/simple;
	bh=y6Olh75Fc5VCdWLQG6EWVT/Oxp2EPOrAyCE8KeR1J1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Es5bbJcmXrlgboB+4IriSghCtVQri7p81Gf35iZ5vcEEM0NIIciyQDUaPdv3V4ke7S/p/ddNEPnJbhrBUxNGOknzQKSgSdQYCyhI1dIq0hpig5nwRb8F7CcAulc9cWQJNvPfJO4vzcP3gR2H1FEoyv6FikdlEsz9KFr0jGbT3ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqfEM/dP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJnE4rFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqfEM/dP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJnE4rFJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2oXb3087405
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=; b=SqfEM/dPwnhorwBi
	UxbPCSqj5ZYcaKZ2Ap9I1Ae9bmaYO0LTAlW/d7YEP561DNovMjZyeSrL/YkFI51K
	PV1/U8DIatH/RFkDXdR5gpha53dB9sYYQG/qFsIRRJwbyjWY4PtnZWCvPpcEq9MF
	3Y3YfzephMd2zQue0CNzj7u8YAwnEg1n2t+jEBRZgFebHIgxs3MLSSQezoJIa89+
	qhV4uqhjolV2UEOphs8bTmB1Hpd/cnXnkUj5hpnTijBfkD702oF5o3FaF+wiU1lD
	duX2zvqRILFd0l3BkQ1/vj3Aqe86lIVHJ8iMCrRcpvWfNGKEOVAp06Iik6x7+TT2
	Ec8SGA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8ap7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso1306236eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159216; x=1790764016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=;
        b=gJnE4rFJ6MBSht/uz4q0GS2+O4cMt0otzGxpPK/XJ9nkUeIaqoKmgbxE4o0lv477Xc
         FXUAPjEvTmIt8l/H4MEbHB4KnfB5THv4sd7ocks5ldnxwbr4C5ombDkXbKUJVCtBOJgf
         1VSPBUcEOMgNUqyeTcJmK6heMqoFeZbfrLjF+2LLTedVvZ9ew5XEVXL0Dd0wn77UuU6y
         WYXZY2ZcKKSNhVu2XFP0/TCy0EW7OEovBGu71eTE/9Ne2Z+0p+4ZbSYv1HIHyYwf0r5U
         0FhbNJABwbb+o/CHd31pQCp9Wl3pS/+5DU/We+N1L2ZV45WriPU4nyu8u8SlJaFCpWmF
         yavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159216; x=1790764016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=;
        b=JtT8dIWZXTTJhMFv6vnE3yvleJEaep6/IejnSFeVQGoCrFXr1XovZE8gZTXSfgnvPG
         jurcgU+QOwb23XC4bfZcVhzHvtg09pcSmrRAydBFOuv9Wl84gO/3+MwHKoy2vM82NWhB
         E1TNZSTYqKbnwPxLGb8urJ3b90Mgg2hrFOjQSrAXHm86tWSiFjUgSNzRCPAgu+8kDON5
         EcWLikxdCZuaEEv2pDNh4+KnfIvHDCRqfwE0WZx+h0AgFAM5qjrMaiG3LM2uQlvM7dCH
         T6LcZdENzqej8tQkRrmlyLsogB/4rLVZKbCeI4gDnDOzjlu5O9oKe/SDiL24tWgxqIkf
         HuUg==
X-Forwarded-Encrypted: i=1; AKwUvBzgz1EEOxX15nR2lcbwLTLTgWcyVMyVLnLS0bAxJJg2SgnrNVpR6xFH7GoCZaXNoNEF2rW3RCGtTv6E/Oc=@vger.kernel.org
X-Gm-Message-State: AFuF++migYJI3PMrSezMgHQFloeRKdZUb4tDgq3BFohg0Id1GYeE/W35
	LmWxSnGis0uy6llzcVgBmMnMh25UURTpCR2F1KAAXGHUgZrQVoNv+55XoEPJyb0juH2G6WoA0uH
	ACTPn0T8jIvW4+v1UMCMFBQbXyChcGrknpDAJLtq23ko4JJj6vCrY6lint49eACN8fWY=
X-Gm-Gg: AYBFou35o66C4fDC8GdBC0fb3uYvGmfSCbEsSrAdAcNMCi5oRtqF7cvmnEbe1ldQcQb
	Y+B9ddEAk27XpScYXKe5PGCWnHKItRSaKmTRatgkV1I8fSKhzXSH6faku7bsuNvrL+87m1/OZn0
	MPgE7DoOSLjVG/y8e/VwvVSFgF1a7tGb/1pBQm2Vwa3Diojg3A5F40Y5BRIGP8m9zTcsdXJVOTi
	qJGnVpLxX+IYWZYcTtllk+6ispxDPXXrkPNEwkXo0pAH3624tADibA1Ghq+phPZX6h62K9gJvmd
	2BIAVWzisfXzvlg0ImlHvmT5Q9KQDMfZ7FdbT4XV+vAmjmXxmXfXPWusaVEZ+UDxWawh7XMSf0R
	3Lsw/dIqXrXoyrsSl2R88enY=
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2388170c88.9.1790159216316;
        Wed, 23 Sep 2026 03:26:56 -0700 (PDT)
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2388140c88.9.1790159215758;
        Wed, 23 Sep 2026 03:26:55 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:46 +0530
Subject: [PATCH 06/15] drm/msm/a6xx: Clamp MX dependency vote
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1006;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=y6Olh75Fc5VCdWLQG6EWVT/Oxp2EPOrAyCE8KeR1J1E=;
 b=EsDOz8yeV+c3gpSP6baw1ovG28clMjsYZni4lG6rN/FJULX99TZzacIk8ZsJLWufpEOi+PvmV
 2Cw4rPd8btuCPeWaGinzZWxb2wY+olFO74PiH2SuMrA5mubIRElH2Vh
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX+maUk03Ams5j
 qgPB8JrcJrJVABBni+A5o5T0hNeJnjOGug9fkwfl7/qfNplCsmf9K8BoSQXk0ubf+kjvB1XRzRT
 1cOk6arzJ8FL4W/SonclayfaXerBga4=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3a970 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MBm1Spx5gLoAAc79GfsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 372zhciY9Vq6z6HdWGgTgiR5Ik1QqKk7
X-Proofpoint-ORIG-GUID: 372zhciY9Vq6z6HdWGgTgiR5Ik1QqKk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX7UCRZKagXLnm
 QZTYytcrQLb3hhB3BYItZClCRLcrCGNKlykCDWTdt+EwwwtcE04GDSUdxY5W8uFROTI9xkcRJHj
 rs07AKwqfPq4Y8NGKQTQVqgmufM4pCRugUVHPGwIJ+juBlctMbu+6pA1IZ0hGK1q0vKNBJ801B7
 G9sEhC3RSGTwujq+LoWnilKIULvsabfhXTEp7b4YAdzxweQNMm9R/5JBlQfoDXTHt9wIJVe7Oi/
 GOROidxDRFa+0P+sUnIXzNS8alrKHwhM/w3dLDEplnjrcnhX4W0J+3LcJIY2wW4jkTsVHXeyGXf
 H+iO4/hZD7wG7ViFfvn9BnoHEece8Mj1MDU5sugHtTeIR5yviBWxMs8eVLAJinHFelfgrJ7SMVM
 qZ7BRMHgtZi0E8ruycDpf3LYrIIZyzMx9cKtVMKPLnYvfTq1Zsi0hp103NWbXliXctRVRpBtoVz
 /hs8Emr9qoybkR7n0ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

In some chipsets like Hawi, the GPU arc level can exceed the highest
available MX corner. In that case, use the highest non-zero MX vote instead
of failing GMU initialization.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2b66d6c7fd19..14d422d7ab95 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1833,7 +1833,7 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	/* Construct a vote for rest of the corners */
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
-		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
+		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, true);
 		int bx;
 
 		if (index < 0)

-- 
2.55.0

