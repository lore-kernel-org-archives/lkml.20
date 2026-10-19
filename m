Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1A597F3A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420771; cv=none; b=JaPKUPZE+2onBw/xIlV+DDD91Tt3sYoNrrV629TYpdd3N7FI5Ao4keJRnipNWcGRcxB3OVqRk98MThpnM4c/NKZSwrcH6U9T1ExVcYkj7J4V9cY0ji2R5HjKyAJv5IAkAqzHhFukhxIP/FUbJJEHNMZkoq3Sr9JuHfMyew7by88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420771; c=relaxed/simple;
	bh=2TstF2SND7fE5Rmpoe3pXhm/sLFsTBxNKrPB1QGiNNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLXZkM9cGKiyBq5X4bL1QdTdIwbCEsg3yO+Ve0Uws0f9gUtEiM1WVTShMgDU1+ZjecVbPOROrYap2tmRdlAECEvrtBJ3aBfmk+RSStEIL8Amf3xhyng1PQZm3Ae+3zPZ6Zv+MWretjZdpEnCbq+Ew7dFl8gCtkgXSA8KLKorbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9YrcygU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXf31nSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9YrcygU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXf31nSw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0la71457260
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjCx6/yxQC9ysAu05r7/WSvftYtqgg6wz8K+mhMEd3Y=; b=l9YrcygUhwTOQ7Nh
	dIfPh1Rqcqm/o61WYYUob87U8BJKaWt5z9SDXZbf0Tf9HP927GzUK4JdswuzQAdb
	RfD7IYMit8s+zxKj6YllVlzBCj85G0FMpfkpkTTl/FBJGQvCLxggMMg3ighYdG9k
	IXaG7qDAa0p40DpRJxnb4EUOvRlXVnpgO1/Lx3PrX4yQmVjJs6hnIyEr3eYGJVVE
	raURo14CaXMdg4ucLH+u/YvLpW22kRoyfrkbamGQgTbg0NYLOKSDUz4FmT20Fc4p
	tQadOG6QiSZs880h3oO+NSHDrRFixU+RJkCpkHxdw7RkpmrE7rT5nB1udDc9fSby
	KZz1JQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hp64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so621875785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420768; x=1793025568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjCx6/yxQC9ysAu05r7/WSvftYtqgg6wz8K+mhMEd3Y=;
        b=NXf31nSwcnP9RQ3phaf5UZWRGK76MfRBluXp/ugnJpdYkW0nA/0yjtP7hyFK+XkNaw
         iN78/FqzmWY7o+y+vTxm6OgHHtIr+Ki8iRCa1sn2JsW7ZBewKIJp+EGvuHzScIOPs+DJ
         vOSYF8gc6/uUvX6TCkzVtWwIvPlqVXJ2xNDy0ufdi4/oI7nIMwBX6/F88oCPv8dCk2e1
         TDOlG3cSJDTMqBq/c7tW3U1c7Ba5Acf26B769pywwyQMdCxIpjTiepiLp2pzr7g81xt5
         jy3GsNFpu91SVvp0jlzA8OfnXfaKQlJrNveZ340GpAUtYS5JKoQoGNrLWmq1LNXqWxu8
         O/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420768; x=1793025568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjCx6/yxQC9ysAu05r7/WSvftYtqgg6wz8K+mhMEd3Y=;
        b=kcF0d0UTnklImLnC5YfY42U3RFONkX7QYK10HZOoVWPHleERs1VOmOKrNqnawy+/PH
         REQWmIFs15+/G4uTiYSaciK6E6LM7B3yP9QvXRicA2k0nuM+bDfNwbR3uhkDDEFEBPZC
         pTKISkaomj2pdQlS0Tp77kzonqNE7GSPv+GdRlwUfVEhVhgp0VqHpJlGC0ov/7mjURW3
         ojMzBKBwwjfYL3M35Qvj8PTvy3AuFXAtk8xT0MKg0Jas7wm7BKgRxCesEjLA445bAy2o
         NTSforwuNfhW/obfT/5thV64iWmFv5uQIwx3et97rHJsEKTgxTRRIbCVUMAQhJAqv9sE
         2wTQ==
X-Forwarded-Encrypted: i=1; AKwUvByS/PfwE+sdSBi8ZhKDBtIlE2BB7J0V355lCVApHxBk5Wqy048IU9AixPHVy54J/AGfb7GqM1kz7OUPstQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU/M0Kvvp1dt2KashRH+kEKltDMNX1DoU/KMtHROLBH4emZQdq
	7bczJzeftBsgDg7Vrubls5Xx1SZd9QdH8QGsh9/CIvEKaDcG55Lg8e5yvcdFW0SmWEGKwJlrfYm
	HTp/Bk98E6VKlqkzJw5mI90y8eUZp4tWphy06T74lxzl2W0uAwbEvrv24ebDbMIk1zYE=
X-Gm-Gg: AYBFou0qM+UWXk/SELoX0wzP4abcMpy/MmPJ9aAFxYU81mRbPVNmvXgBGuMWHywGakY
	r0f4NP3H2SKg4eS809ql+IquyRZIea1g8+/5z/oGaelCsKKdajM5xQZTA4EYzjcO7WlVGf8cxCY
	X1XoO1rsV7NWnvxshqfkOsC4yiMEElOs61g9vzhkQod4O7hSBu/pKx9ACKQBNcXeSWkscxF7HnM
	PvLaRg6IBZ1C9C51Q9VbRaATSiMjMaVVnyUk2KMZ/Jc+SfX/0LQFlgrt+k+0s8spzp00JiXfFbg
	AutUbcPyx0t4cLsNhQ6OU2gk/5eQH6dNZq7wZtvlWhTF3APqZZu/+6t7A0CecDRoUDqSi3vpq4r
	5NgBdIVvNdRXKU64XxmkbTZVmRLGlftM84Cmzt6LiR50LjV23sK3RSMqleBqF1wstujLD1d0kR4
	TKgmdW/9QtbIm2
X-Received: by 2002:a05:620a:800b:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f29dfd65emr1413395585a.81.1792420767887;
        Mon, 19 Oct 2026 07:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f29dfd65emr1413390585a.81.1792420767337;
        Mon, 19 Oct 2026 07:39:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:39:19 +0300
Subject: [PATCH 1/3] soc: qcom: spm: fix the SDM660 silver L2 AVS control
 value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-qcom-saw-v1-1-9c7ba3fc2493@oss.qualcomm.com>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2TstF2SND7fE5Rmpoe3pXhm/sLFsTBxNKrPB1QGiNNc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuY6bpLJierCag4dK6Bzw0D+amcMWhxQzKVA
 ekR1qbYYxOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmAAKCRCLPIo+Aiko
 1TCeCACYOrLf7U90MxlU0YEzW5lPoqIkDGGPtNFxF3pj25nPJP87GC1fQ0atHxRs2OYMOW6xNJr
 85es0hWWsfWFsDsuVqJ4FxC4jfvBVvdwjoYn89sx9qTKupzypWL7hs5vR38O4DEowjwQeQB8MiS
 CoG8Ovbov2o2JjZiVuEO9avi0ikZXgwt9dfrS8oC8hv7r5TxwciIYg3TtPjjAn972S1AEXxVI6I
 M6Ks0xiDGIuxc/I6U0ffFbFs2RyvtBGnNg0xPHIH+b+5/UYiui59bIwdptcw0mYzdK6JMjLaSpm
 chJv0Mos+ThFMteCx7EWY0+lwJiVhBBSdm05xyEtofSp+Gzm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX3zWzyQiNiC/0
 nqlUA4nU8m7lHr5DXB7X3pXSqD9zLvrhD0YUbY2SZkRj7yTQO8mn2nbf0+U7si62DG4FGXuX6/s
 bPovY4rl98s2Fty5oC8LRXnIr42iUNk=
X-Proofpoint-ORIG-GUID: bxPHbn62ut3EipnVpJH5-gprIMgyyR6Z
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad62ba1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qlPoGPJu3atbak1x7WIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX6N8vS3b6+MDq
 E8mBk5Fu/aHi32PGkee+jftYzEmitjLI3U0GBbBSauvsBf371O+3PKQh9Bt9WTh6nW8TAxg7tKI
 OaDc1MJjcmtXp5ToKinOS+rDjVJ4r3edwseJvwl9gViHK9+jZOyQZUicNHNOBhszcxAF2mD7ft4
 vWRWyYFHyPSQP2LmgUhx0mWF9B2A6JvOx7kvvGYoScEC1guNAFn+Ef8wdNGHzYJ0WyrE8E1RHwU
 du8eppE8SorfYiaxeDjsK6ybqDO4WHFjtsoDpvB3ncrrvgtF1vM3QKN0DtCsulDx3mDuF9w9fkF
 UZUTbgArTyymmwRItZAjle4iGt3uFefTEtLtTLB5wAe9SHUtFtveFKYp+qFf/FpOdi/nJwFvYgO
 0UAeG1MVsV6jdm+WiGoWPvDSdMnuMTrkV47HOJEKHGgWO1mZf9WMDw4N3Gaf/VCmjs7N5FNPtfT
 uJIsw/LRbiQZKSVEgvA==
X-Proofpoint-GUID: bxPHbn62ut3EipnVpJH5-gprIMgyyR6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190058

The power cluster L2 SAW of SDM660 is programmed with an AVS control
value that differs from the one the vendor kernel uses for this SAW
(0x1010031), so the AVS hardware runs with the wrong configuration.

Use the vendor value.

Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/spm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index f75659fff287..d41c94d32b51 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -100,7 +100,7 @@ static const struct spm_reg_data spm_reg_660_gold_l2  = {
 
 static const struct spm_reg_data spm_reg_660_silver_l2  = {
 	.reg_offset = spm_reg_offset_v4_1,
-	.avs_ctl = 0x101c031,
+	.avs_ctl = 0x1010031,
 	.avs_limit = 0x4580458,
 };
 

-- 
2.47.3

