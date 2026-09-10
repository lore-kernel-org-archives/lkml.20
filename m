Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0904052BF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033653; cv=none; b=OHCedZ3K+189Z40xhwQG59C6KtWbSbeDIhC72mlDjYdPPrJ9oyEEUoCExC9uVT+fpT/jo+84SjprgI5MoEtRae9CrTz08mKN9bopbFVKzPTZo5USjifieukAZ02Bja/It7WxhijohrSlLJtTPPKloo/zyfEVqHD3FcPYnDvb/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033653; c=relaxed/simple;
	bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMCGyr9bRxV2F3Xmekep7dbT6fpCyR2eEKtmrgSQMkeou5cHVKqERoIhfrwbRojbha/ihrDUsbRoUpWvpy2uB3Ce7zk5MMU6Bwy40sKHcscA6BbImPF5BrgaLE7X0IIJG7ngp4nZrEIvPCkdpKcIocEwBUusZpjTw/dCHhnZR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkve1dYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJAcXscE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkve1dYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJAcXscE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q3Ci800208
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=; b=Pkve1dYXS7qT5+tP
	G7nS5XldSHKoDXYb2aNzykx/yJ5BVL+gu6641EzSc+C0wcgJbz6cqWz6j6MFHvB+
	gdL5exdlhZivLZQMBQxp8807rfnk+OOc56VPthbsxOr1FE5WqkTqk1SZ6OiJWMkE
	H0HpwmV8lyS/CkMdQWGPb5P4Pz1d6F5HCIPh4tswlLDboOkKLsUt8nPWcVJKhbPT
	fgTQ2p1bYBhlB+TbwMPX4WxujimIIPCupH5Vyt10QTSYZpO8ctjJvLq6KaQQgTV6
	8hKAEKQsC07FGnMoMalki402iKxPfWPOlOkOEMvs6LYIBlw9xxAF9D6paLyIAAjT
	KwD8fQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjrgrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so87148585ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033650; x=1789638450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=aJAcXscEbd6zGlg+hRGLPW4dzFuXZbJ9WvbCrBm+M8wpPqFh5PRFx0fDIkPfq6rvJh
         /5Q2myQ27OYwwxQaCpwHcTo4vZOQRvrBDdLWJglhyhoLnSz6HajS+/SXjAW4IUb/hMkk
         oop8qZjQvp8kAmN+if6VNhrukHCekjhYJXr0GZybAgBSO7SmHLYztagQSuSFWJDokEKK
         LKngGNEY7fVq5tEaAd9bcoodyOtK5NVQjMSaBXAksKBMxLcfTvaBIU7dI/brvOSz6n4Z
         9t8KDTFKgyc+U2jcqJD6EgiHjBrXzy7dsS47kkru8BxSaf8/hpUnURpp+3B937Ccn7YY
         sTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033650; x=1789638450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=kdmv3tQZPzW8K4eE4UyFyFhdQbvAQvaUrwAH0VNlNv5yoccUk0TxzlolMS5kV3ZFjL
         kaWqp5+OKdk/p8XXh60YtspGW2/DNGAgNGmMQzr5HlMWolInng0xSrilAXV7slGA4vbf
         Foi+W2QJeI9oMsA6DfaxFU1pgQR1ESN202za4l2sd9mWZZhQWoDiAF25w4rEYVEyYmA6
         tq45VOeunNFcFkuQS8Ii/Zh1T/OQX540RtkVdp3PqEgln6iABdoSuhujShSFeuXB0aNV
         bmq3KLPKnVbsvUG02g6aF03vJO3I8zE8+1fXZIBrrpXLTvjPwxArm7BmGg4qw6xA4Dhl
         HWZg==
X-Forwarded-Encrypted: i=1; AKwUvBxahFfU0UbPDtm4FkVX2sBOwiF6et5BTJRSfYseCenPlAAh9eg7uwqPYBwnGIv0lGapRcuTPsa9a1o1vsY=@vger.kernel.org
X-Gm-Message-State: AFuF++nnrc7UYCkbdk00rjyVbtvZ4BCyr+joZVO5A3PTs74RfynKgE2Z
	E1XpzbftQd4C6/QBtU4+utTJniAbt+rjtun4hZNNGFLz0OvUAxpMzahSeKtG6ufKk/gw9EFefIP
	bukxRaciFsDVpK2Gl68COUaMr1VvKr8Lz6CrIjkTx23z2yqDCx7vSELouhm5SqidscY0=
X-Gm-Gg: AYBFou2A7vbTPosWv2wmlUT+BesH/opLiZtFY7QTlyY/PMDDDt9owm+gMkkZOnPcdwt
	8ztIHjEop2PcU6EM+K3QSFcCMGBjaWoEZdRDG4zcNZdo/zRkLeI+ZOeR1PqL1TErgSt1c+oGDYZ
	9WwY0pJbXyBA/wucwcfXeDmfCmR6JegED9H890BcuR2Z8yAtaTtW68FV0idZWr5qlOXpbXHZmo8
	8ghDzbb/qzEG4rsvIIqey5xgLO4MLKqTwUIckZ5Hs7t+kK1ze0OTSjLXYp9Cnp2qJD2RCeUwAnn
	f/X3pFwl21MCSp+XVo2SlGvkxao/gpk0+iYOA4GHn+wM4l/Y4ooD5osU5+DVzuFFIeWn+MRl/jc
	/se/nAGuO9zFZcjN6xOl24ODH7GJ8AwYt01yO
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322585ad.0.1789033650025;
        Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322195ad.0.1789033649594;
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:53 +0530
Subject: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=896;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
 b=9vnuclAJhYWlGpQD1qQiEVG5tCtfh5GCTouC758hlLvHN+C1+1+7xPRnKfgXYk0OPdAJAGY66
 m9YDRsxIf4mCMgmlxoE6DTlAnXi75TswqDGmD76PIe4lH4NDKYIsNOV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX563OFVLVK/RS
 XNkJQHZdoSwkorv4CDCoXVfCyLwoeC4+qFI6epvYQlw3TbO9eMnvA2A4J1PUPk0pmteRXldyjxl
 Eo+tG1Q2ccy7N3v8oxz6m3K4dxuC5TA=
X-Proofpoint-GUID: mAutbzTv_CXMS48QUSmQ3ME07XnYkw8i
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa27cb2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX/LPUe/9NLG3P
 ZjTCUPaLALtDQjilUJeOynF2G5ybXpMXNSHxRt5SlVP3g2TUWRsXKCz0FgfeeXUoA36AK0eem0W
 u+OMcfK+k5K2qyZls4tzhTQICRXVbjz/jDWuS3VMzZRMNIBA3NwXWv+FJJOkNVpJN1/rq/YaBy0
 fuMRiKgz9KllYSVcz4AVppEglLUPW5B/8Iqa8l+2GwFY1ozavXyiThrE7n0LlTLQlsKwe9xr8SI
 gHNFJrgFQKlxIOiMapoD6dQno3Dqf2jZF7fK5t0HNKOAHhuRwMz3UWZQN5zMzqBozm/zx1M/IdA
 UJ7FGGY9Y6fbksOPGPE0f4IvgDrpSE69vUm0pJhufSyveOfLSEx+xr+LcGwnpKJK8rA3UQ4Rez5
 f6zmhk9eZdQeHtUU9cSDam/DYE3JUu3sCYfuWGjnV4KMNtUITMbNQhiINLgfvlxD+EmN2YtK+yU
 kHgs6sGRiQhO/VZBGmA==
X-Proofpoint-ORIG-GUID: mAutbzTv_CXMS48QUSmQ3ME07XnYkw8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

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

