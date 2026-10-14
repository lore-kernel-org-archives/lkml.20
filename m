Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EE64DD3C4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969244; cv=none; b=AGMSEmOvbGwn9MHkr4AHaPA1+KUW9UgeS/sfp/gMntI3ZKZET4NKL9x2G/9hOFnTFeC7wbPU4gn0b+wdpcto4Uxyx6dXJZ0mt+Miv5FxFPdmWTKNFl5x0ALxOkpyi8wzMVz/jVc1DmUqsAJ9wbInZhKeMUBpTGGsQ+ZCMitMvas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969244; c=relaxed/simple;
	bh=oUcG6hWiHKgVmRBsl03kZHtJ+9y4PxAqvuNaXBrwIjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bs0v2ZhtodIFeRbXKAhUC9OdAkF0EeoMH34j29egyIVTALWlf0Pn7zvjkapm1zSSiJvg414oQpqIYvyVZ/Ad3snpPLu/biCqv5TebaVe2HujzqR3x3TGgOLzOn/RMufJdY3OWd426i8tCU5d5ERW2fCwdTpLAuuxOvhcjq2GYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYc5CdcX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1qHvTev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYc5CdcX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1qHvTev"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E91VZL3000868
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=; b=CYc5CdcXpKqwx2LX
	m9aHXErRCSg5SUGBYN0hLSYl9jxTIv35/IkMTetSdvYjCfeGA01Yor0uy8amuc2s
	piZhkafbfQVSc0+g9jQgLh2cMOPTbKH3aUDt5hnwc2F7d8eLaVh3OeRtecw3taj4
	8jWy8ktfkudE7EhoBx6gY5DG2LPBSfnGRCctK7/MgGe9lthr5eeyPDDuC+HcmDAA
	3Dhl1/qxzWeFRLy0ClPXo04ZbZ4AGjQbNNHXvjtKgBJBAUfO34XXce+VQa/kAaol
	EW6NoSiXh2iCcnYogb+86xpABJMHWxfRk/2ZsSy3N/kNN/9BsB4fEvs12MGCQmPu
	CF0P1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeu6et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e942b1cc86so2996385ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969240; x=1792574040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=;
        b=d1qHvTevfWn9N5HrsRyc2DBxYriTissaHUhc2uJPAuZdB1PpAb/K5J9TzAWYZQtvNC
         LCZADoU4a81XT9kIeC6xRMRN0GuNguIxOoe2zV484PYtq4TaiSVHyAMQVDxLqS1thcCL
         pI+yeB/V4eYPGBFBCyHV7SkmxP8NOFk2Mn973EAkJc5ZOcBc0iSWONWvUFjHiDemLZoR
         5gQpwOmwcOAv2ypK6qYhNqijWHKb1e1s5Bmg4FmDKiNSJtYqH2HwmVgd9FFstJsTLxe5
         zyBpFkpJTcPcF73DiOplhwIaqVoRNsTXe2/z7qozYoMAvRKBMyRUz+ukg3lg7382W1+V
         RQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969240; x=1792574040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=;
        b=nLHlW+sV0Q7jI9LZROfoKUSuvcsw7g6kFsUVDS4mYxKyJXb+qJzjkS92F4G0h4DtYb
         KQYpZGO9LChj407q7ZhHCR8JzlHVHMUGY5Kpv4BZjiRVlAZsXf2ScIbaXy27cTNzFubv
         YQC00oqSUSoQPrdLs7pYsRFOPFiWEAPL7zELAPnARtOFLO84YTROgpvZy+Ij+VVylon/
         uW/OKb6dckoY4Rg5UC/xpzcIeJkj+h6paJJ7QON6yQs8WnRQ3mj/MZjAB7sd+0bN2EbN
         YsWoywNnQBKv+hrkR0IJjDER5085ZDIAcIBCEEZEMyrMR+W1qCgXyS3hX44udTcIvtfV
         L2qQ==
X-Forwarded-Encrypted: i=1; AKwUvByrvgozq8qLDAq/+ZJQpGkhJPRuzy+LT4kq/up5rDcQyuQHJKLpzccD9HaTf1GorikT8nYvlBw0I+ul1ag=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4b2hMSzovieWRxjOTjAiVKEfMDr1f87mcOXImI1n2/pNMpbGi
	JKv1H7dEl25aXVMcNTt5VVpXiILC1ZIhC291CYaD+z9jy8T0wUt7PYcz/uNzpUrMXvxVzJMDBIS
	dnb1G79gmW/61/7Y0qxNPZLdsngQ4L+qKPj1dvtCbyYB3CKogeUGWH/QBSqlig3o9vdc=
X-Gm-Gg: AYBFou2nPlQKqbnDfu66yOVR9He8DuMvmKxfXLhtx9ILCQy+W82yI1W/1dmZQB2j1PW
	UlwksNtVcE0cxyQgr+y4fq3nTR5OdV0dLJcKFtkdHTGeWjJUqSYPasnUeV80NW8Ci0q4dA/XZMW
	oTnaHRmSzXclBzzgsFv6FUbAcWJ6t3D7e5LhjbRu0/Y6xgVhPEWUZ4uy3I1F0cqa1EBPRVNS3H5
	I41XtV5zbpZMMIuHp4VRxsJax7S6Vfgsj8xQztPl4cLhplYFmz6guaDmkKdB7uMcaunLF2lyMD7
	zQbk0+e5obxqcW+xfUOURJTk0HwsPE+PZv2rYWoGKphZ3KORufRyFeKziy32Zrr3VeVN6mg1cVl
	RCLDczl/9srOMf/PrwGM55k20JncRer2zVB8=
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr103675475ad.58.1791969240048;
        Wed, 14 Oct 2026 02:14:00 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr103675355ad.58.1791969239582;
        Wed, 14 Oct 2026 02:13:59 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:13:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:48 +0530
Subject: [PATCH v5 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-2-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=1032;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=oUcG6hWiHKgVmRBsl03kZHtJ+9y4PxAqvuNaXBrwIjg=;
 b=Vd4dWRz1Z/Qkp94btMwxQ80xUaetQniWi4DQObCli6LiUTplYj+/SVP+6PNowZfAk+6X7UthW
 APfUQham+XRCOT1uHGxWRUz0BOEOUhq+R7aoQWXQ754di8XWBBDarl0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: KCg_rBtYcBWyqcGTKkpwKAD4IFRud0tw
X-Proofpoint-GUID: KCg_rBtYcBWyqcGTKkpwKAD4IFRud0tw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX9ogH7/gk9DLH
 XHQh2LlrgV9IaHXySuNhB2ZyX/isgLwtiL/up2leKqI6lpwKVnxzbfYEyyup1My/fZOI4KDczUk
 7xiM0kQE6X7xiTlpNaR4UNfIkJ3l3BNoko2Nx28oJ7cUZaaIclrMokdulc75Zz7FOUPKaI0U4S3
 fmcxyqo1Mi0mbljhXWl3Rvpp3r9bvq7Tiueu91hTMt3yYlh5mNK0xDqIbGAxZ0gEw4U0nLAIGyo
 qduGKoKlx8KCXA2tZHwtBkOA0RFR1E18+Ejs7LPxwwByuf4eP/GyvUR54b/WoAaC6909nPkVJ9M
 NEvTa6vRr/EGjV4w6uerxpP/x5maY13yaYx/I7uF8J8yzEkDuYkGo53UbJIhxOIY8KTdTJ3ebvG
 kf4dNoVB1UflYXWj9AzCwFh9NcCPt4xvf5oZyK7b4NTnviAR8bQPGqJLhyVIMzn7ic+izQ06efq
 3RXI2pFqGXB9VJGJPxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX9+uBAvGNjzcN
 14KJ/oPgUBarWJz4+ZWfghudkGlX9dAvMeojOksncGOhO179zDDduo22X4b7Czz2t2COzdFTpUr
 MFaw/bbN3IRM/GFe1Gm94Z7XCxTuRRg=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf47d8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

