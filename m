Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63423815D8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804611; cv=none; b=cqzHdzF7wy9QSVbpN8Wn9VpdXhwFe3GQo921OwD19UPWFkqV4PdUeazenNodLh/0018MTQ7lFaLm/zywdumvFOE489uHLhw1ltjzkw61S7qulwbd2Fj45PKth5Z9tgj8OWuh/LdI7cJsLMYTtn0Y+5NZVLCc2vs6Ih3IQZyLJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804611; c=relaxed/simple;
	bh=CVrEVnwNk+Us7cfjRj/Zz0hY36WdkjOwnysyX0mfQ0I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SBLolK4kByiAMkcrXkLh2zm9huK0TQS/oA2E3AqfFGdeKtM6TYde9yl8DmVXkgDqu38GWusjHbRRKC5u1Yt05WN0sLgdK+wAo/HKf26RatBY/AZG/LMD3A4Tpf2Le8YIF7KhlHnrNH8sP/UPaCPc4FjpFWM8a5gT6YOUA0nKH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeWiOt2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQJ4bLPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeWiOt2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQJ4bLPo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7lR34015811
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mRiByXxuwAggEWwz8GmTmy
	VSiYkyHqy75fQn32SH/c4=; b=ZeWiOt2xPu2E7VHcz1o0k1DmhfCOzGmv18fmHb
	y/UFcw8Gj3MBdCXdP+sd06tz2BC/w42eF+bcBYkPmjwJyp97rLRkwcEopiRJXyEF
	FrboCc5qsMZdXBE7BpgZdtmfHtrLoMNNVMIkndzlG4vc2VzUlroM5PfzWb8UOer2
	IsZVk/RvfKX2dnfCQ5MzpD5bhql+5SAr7ssHNRoj222lTQcS2t6A/Z4P0uzqW8AX
	Pcw7iMi7cbPcTHsxxn4TU9hY1aLc5BcgO2cXGWzMlLu8dj+OPoisNxR/VSwHjTFL
	whala7rv3fbP7m4rxIAazeknqZXxnzNwO7VlFo5nRmLegKWA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw224q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:10:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86476d54af1so2091911b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804609; x=1789409409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mRiByXxuwAggEWwz8GmTmyVSiYkyHqy75fQn32SH/c4=;
        b=eQJ4bLPo5zFfxPXSErCnG0l1VB0YmHDuo3FkNP1UtGYWGUtciHfsGHU88O3Ce481/+
         IfGTr3twaVS9YKQH+uL7fy3A781YKBa9QB51Qn/T0gVaA4+TjqkudIOtnxtypHU7j8JM
         kkBVgf15oW8mpLxfZuOmFmXI+ur13YtE7G8kQkyI5d7wi4EU/yzwIC9tnh5zicICV8XG
         BFYmNsF1oVj7wVnN8OYnoyDfggB6TTirlnwHqRw5UAZktFwZq4HDEMOWEo+Cb2y3lau1
         XY5Fvkh0S7tqZBNda+zTTkAX3gk/5nUJq3cHeVKsEy5cDGV224uJh6qAN6Yrx2Wx/YhY
         J3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804609; x=1789409409;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRiByXxuwAggEWwz8GmTmyVSiYkyHqy75fQn32SH/c4=;
        b=fBinlW0VMYIGkVAcWK7usP8F3g/I2nuzbPBd7APehZmLkVqJvdtF14OcpYsLW/OZ46
         l/B3sb+JmViVrb2d6Vu/OYonz9elt0+ONpM4jb3xP07UUQ3TrbihC9JfwAXJxgC583HN
         /K+vQIHOJJ7jB8ASWqYuBZH6IvCdehApYaRVxUnxjvUvzUAfhrnuzorzszoUBFC3TiQD
         QV7ih+afQxVPjb5i61GUZ+EcOj70+ioghVWTRn0zN4lm8Y7p7YHw0kocJycD9gZP/XI4
         mU1uwzQStHOzmTQfXoAFjiO/+p4bB6jso61gdenq+PLIK6RHrtMgKvjviSM6OABpEYpJ
         E6zQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+ZALrxdYji/JiGE8XL9sw+7Jy1U1Kzs1/gPCfMXTezyEcfcukaWqlDQOYfNgiyj2wWEvMVKlj9ac28oo=@vger.kernel.org
X-Gm-Message-State: AFuF++mlxRFutWVUiLI3nxsPIpy5T0MWfr+f+Cq2WHlXyFhQkXlxvIBz
	fjmUCNNkrtmxTktnQ6adcvHcEQdJ50J9wCZeT3H5+PQGf7EgP29G7v5ropA2nCsxMhSwO/Isnlw
	Ui9YVod0oHVo1rsnc3+mFGBjtROMhgfDfKpXtrCxaSA24oIh8fuKh8DxiikSrpPYBpWQ=
X-Gm-Gg: AYBFou2ZnSoOfXFiqnkhZGbCf3XBDPVdcuCPxWqkc3wiupihL2+j6vvTIRRB5RLE98v
	hc6VMpk+R/lNz/D54cnWCjO30fYwJwVF774TCNY3ngNjKod1yLeMijF6MdZ5c0NQtde1jhVD31Q
	bifzMsygLoCqrfBtcsUg45S0UTJ2yXK5rL1WUbW9Kc+snGLKfBVbxjyuLKhhypmRrzVZBvIS9eM
	DC8qygduXOkct976VABzWNe8+W8yXuYCPI7OqSZa2WnzHfAe+cEWdWyq3nvWYk5bKVdPBUObOyo
	UGI5aCycYSsTh6vAc1y4S7joaEhVfOzD9rJppC8mHNAVLFlmH+e5RBP/eDDvYmcgaPQNaQmLj1m
	qAeQKFeL4vNeuhZyNIk6oeU/te9q4VDzX5/DE
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr42596725637.7.1788804609268;
        Mon, 07 Sep 2026 11:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr42596634637.7.1788804608738;
        Mon, 07 Sep 2026 11:10:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: qcom: Add Nord Ride audio support
Date: Mon, 07 Sep 2026 23:39:41 +0530
Message-Id: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOX9nmoC/yWMywrCMBAAf6Xs2YU0iq9fkR7azUbXQxJ22yCU/
 nujHmdgZgVjFTa4dysoVzHJqUF/6IBeY3oySmgM3vmzu7kLpqwBR8uEQaWyoi2lZJ2RKbp4vHp
 3CgQtL8pRPr/1A2oPw9/ZMr2Z5u8Ttm0HVCY7T4AAAAA=
X-Change-ID: 20260907-nord-asoc-driver-support-ecf0f38204dc
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=1988;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=CVrEVnwNk+Us7cfjRj/Zz0hY36WdkjOwnysyX0mfQ0I=;
 b=PzhpfTInjhz7/sBOknsQJ9Eu7ojed/7KVihrqNId652Qnf4yIeNjX48DscQBXfR0J8oF2yjXr
 ekqiI+p90AZCxy2S85/7xQWhUoOpiYcvC6fXSpeClE9Vxj8Yh/O/z0K
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: mxJsbFHDl1YVdczr3vRtiM6LZPi16ZXt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXwe4ZdVqDVhU2
 h5sUVpcneoZ5YKokJGDdwwACDfO1668/SRv1cQvVVsoHl+i/8iFNUvOcFxmwI1+QPhmWrbIL5UK
 wCkW7WGa33Czi3EmDGuxGo7atEZInYk=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9efe02 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m7YXckNPeSMwoeayZyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX0F/X93p4abzJ
 GHdjGVnSiDDPYTigrcHPGATZeNQURvKHi/m13iICmKthFZnp06tLEtCGjHV/rnAe9ng3V09zH2j
 oZPEIoqr1tXKkGbVH96G2PjPBnzYtaNbD60ZECUuaRKsl8mpvYfjTMicNgQIgrPAxkx9AqZTWBx
 VoMDdlC2EjsvoITksHliMk80tjJhXl050z9ZbawICyBSSpNUPvq4O8mqinwI5meHtN/yppWyDXr
 bCCn9PDMM6Y4tau/DsUEAVj8XG36J7xKCLqyF0zdI8LkRN7OjftDWQU/D/uA/H//tYW0QoApT6C
 A5PVR+61PHae0im1s8LEdlJSTSP3rh2Tn/CVyHSr5lIEuDipo4jM6ESGVfohVNwlA8BEUocbjDK
 +LbTuVM+byufOsJCrxdi+GYHOIuhiCRuq8pi1q3xxFS2BPMXsIw/MynmrmPNY2sqk9A+VvxQD/g
 q5ippWaVcUAPEP9w5Ew==
X-Proofpoint-GUID: mxJsbFHDl1YVdczr3vRtiM6LZPi16ZXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070201

This series adds audio support for the Qualcomm Nord Ride platform and
includes the required machine driver, device tree binding updates, and
codec improvements needed for the board's external audio codec
configuration.

Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
Compared to other SC8280XP based platforms, Nord Ride requires
board-specific DAI format and codec clock configuration to support
the external PCM1681 DAC and ADAU1979 ADC.

The series includes:
 - Adding OF device matching support to the ADAU1977/78/79 I2C driver,
   enabling Device Tree based instantiation.
 - Adding optional SCK clock support to the PCM1681 codec driver and
   documenting the corresponding DT binding.
 - Adding Nord Ride sound card support to the SC8280XP machine driver
   with board-specific audio configuration.
 - Adding DT bindings for the Nord Ride sound card.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Mohammad Rafi Shaik (5):
      ASoC: codec: adau1977-i2c: Add OF device match table
      ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      ASoC: codec: pcm1681: Enable system clock before regmap access
      ASoC: dt-bindings: qcom,sm8250: Add Nord Ride sound card
      ASoC: qcom: sc8280xp: Add Nord Ride sound card support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |  7 +++
 sound/soc/codecs/Kconfig                           |  4 +-
 sound/soc/codecs/adau1977-i2c.c                    |  9 ++++
 sound/soc/codecs/pcm1681.c                         | 18 +++++++
 sound/soc/qcom/sc8280xp.c                          | 57 ++++++++++++++++++++++
 6 files changed, 94 insertions(+), 2 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260907-nord-asoc-driver-support-ecf0f38204dc

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

