Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A61E98E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380250; cv=none; b=rnQo0cNIyQhS+jP3s5Qy0elDRpCAVz+zgZotQ2ekCu5QsTNN3YFVeF/sm5xeeQaYTsBx3b4FoaXrY+lF+HGteiUwnu3l9ANOH74Dte67HQVAbLwdqRBbK2TSaOVDlYQ0VMdfFjKYb6do0fp8+sQCHcoyu0CgMPEqAbyKplRtGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380250; c=relaxed/simple;
	bh=Nox2+Biob1IFc4ylb+sWvoF3fbrjOJ6ecXJO1gYItxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPJhyIvUDJLvFl1MqvOcc0Xb9CtrUIWu3pkH30wZtjRI78VDqDfbdIAvvs/FB/LClm6cGRhJLORLZf6zHNSFhynpag4Q39pfCSAhcWaGiJAq52Ty7wz51pJA67G5VPprJwYtSDCgx7pC8Nt1qgbv2xpMTfxvEDkQPXdnlg1JMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHASjO9n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crrRXbHK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHASjO9n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crrRXbHK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH8a02523706
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+W6tpccLyWv
	9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=; b=cHASjO9nJpDVndRqPqR+0ZBZe5y
	S5gqMEV2gnPj4s3n6BEV7NXgRHhdxo2t0J8shBsPe84l25uRRQorpCDeYPC6YnSC
	OKft0Zbq2yoHiHs58iPdkdcmhbsRlnMhwhCK6oxRoW38JR/QJC+pBGyumeR96CuL
	eKNmh88z2yaKScZqwLyJ4LQFBMLCggSJLOZjPef0vdX5LM0qiJrez8p52ZABeQ4m
	fH9g0Es37j/K5/wBfk5+csMuAx+ftxFpWvhK3647Iizdm4lZLTNWKEtdJr3OxbGA
	ohXjXcbEau00q26eI9i2SFV5O3n3QlU5c+RrvTAgZrmy0HdwOiQpjGX4dmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so2009403a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380246; x=1788985046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=crrRXbHKjoottLfygO1PHNtbbx2mIVXkEsj6BGw1ddYVlT7U37KVlN+OO8qKHy8C6W
         JzCVRWQZZe/sgLQ/0cAFK/rK51h7/mqeGw2DG1sK1WkabYwLBeBroRo31m2njqxfie3q
         7POFUw25B9RIA6SZFEJV/2MsW8r937VKT633GwYxex2Z5Q0rKmSCmO9hOwH4T9cMT7JJ
         lwNrQyZN+6NIMbzmDgVyBzYftvb4PIsI6K492oCZphA4U9viRAd4oEEciNtqOCO/7z21
         pzdg9QAUuOpi46+4bhxpIeej4Q2QDWxjq8gzEeZBas0RpFHmQM8gzOmGFPEcDxFQ9wq0
         5+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380246; x=1788985046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=qb1T/SQzPFiIBXldPtfV/WPd9TXuq5582EEne8kzjZ95HTgCKaFJKxr3wlclVhz4I1
         c1qb3+mfJEW6/+aygx8+5KSbTMOUtP9sazpU1aSe2EpKBXs1omtIqbBLZxHumqyoRbQu
         Vgpk8mEl2zDUdFEOSx2KNHc+zOnAqesmMccq3NZ0a8QlH78VRM4HoO50oMoKJveIQh8y
         oK6nf2JGikVgVYywjZMaPVC1PiUUd0nw3v3Z6N+zpRIahUHj0XM32oOxw6xoN+RiYRgN
         c3FdBM3hJLAOAtYMzs1zfWj5GQtxClbeQLRCu9L1tbkldclxb9NhlBjMFaLvLST3WBv3
         m0DA==
X-Forwarded-Encrypted: i=1; AKwUvByvv2DB3VgGRnIEEczpGegh+gMdabMdikNFMiIkcvlTRENjltyKczdy0RpVeGwnrSq2AuZweM4Bm8N94CA=@vger.kernel.org
X-Gm-Message-State: AFuF++mBjKQYBMeAlk6OdQPDQVcd2fL2Vqh12bcj6J/UBpbFyV6QEwv6
	skXLLThwycWtnA71+ALjP4FN4vbIRDxwFuNCtds46Dz5m75T3xcI5nwJ2PLCNLiUz0qCpTnYDrc
	HAJf1CyGScy/vRGsPy4GX0OzP96WzDhNY474pa8890OICQAf//NrcAlLgI+hMq4BqVFM=
X-Gm-Gg: AYBFou00raC7pWCaT5ymtXtCfnTPYBMPUBXB7LYRfHkCShQ5WFlFs7EOyghlfYlWHJr
	PPx55HJJZWpfdiv+HNdJMCcWqRbt1o+QpUf6PlIffLQyBanmAL/hHhX3f9Pf1pCOdFIWpVuA+YO
	EB0HllSsaZiV2WVlMa/PJgTI1LZuLtsCvtxT+bmvp0wqS4NkTurX64LwuzNkOwEZx0mLbjLg4M8
	dqqvNK5MDynCaj/Is3w1DM6DRj2oPPR3G3ZNEqylz0aN/mTIrowKR/gKrVtYAYaoaI68gYTPcQ+
	PRk4tR55xIyfc1vgBGgViBKXRL1B6prczSqlTU3aaaQQYcE8f0eMVLE/tZMt07T7lXpf7UJFewv
	Ku71LjMq4++C8IqUJQ5IU0Am+31A=
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465780a91.5.1788380246170;
        Wed, 02 Sep 2026 13:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465704a91.5.1788380245604;
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/11] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:33 +0530
Message-ID: <20260902201640.2024648-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988457 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=8sfNmL5Et35J21XlSqYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 7EQGtHSupO0Iv-qm7LKANUQjILuHuWFH
X-Proofpoint-ORIG-GUID: 7EQGtHSupO0Iv-qm7LKANUQjILuHuWFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX1nfABc3zHbN8
 EFPS6NPEkXE4f5PQFzW9AJXRfVgerjnsV6oYLjocCEzewLMBo9nR04CiZB41F8lnsS5Dlty8oVT
 Nnsp36NUnvkw6FFCHsTaSWMUn1tWrsvBAUwCnvQ1zFTsZkS8Hu73dcvvUOMEdCJ5FpjJ3p/8pjl
 sAfgmD37wQCXzgjk+H1v8/PbqkkV0Ufehd2zzvH1cTBIlUWTeuuiVYo7laVSpG1POTXuQkzRl5H
 mWNtAi95HmHEZSNE6UBeiFxtdd/FeC8BsanyieQ6ccig2EoL16kMP1ECCAtexEc7VOFEx4RvTK1
 PjmoXnjCXSdo4TVykFsqP9fTVagknYWCVe5eYwlS140+H5JYmzK4cyegNCmVXx7alhZaZsu56Wa
 6pGPiuMN9gWqoR7pfxcXhkn9lDqrkyL44DH6ri1V8QxMd9N0jN05Ks5KEN1Rsrgyt6GZa6U1ob/
 MEgyMUW7q3NQOTnc21g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5xsEexEIxEtu
 AIhm2ZfYFB2/FaZTnKq8Xl0K8xP+dpC6J7+E9bOEpdyTKwVcXdde+ATrjMi91tW1YB2ojptpgum
 69L8Ojtej9VSkP9kN4532n3j6Evy7SM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.55.0

