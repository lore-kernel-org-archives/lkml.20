Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790426B742
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611374; cv=none; b=oZRQ4fK3lb1EWJ3wCwUwZtbHCKouqUWCB/Ce9N7iiDGVBNt7NQKAtn09dEKFds/TvP6Lb+vpSt2V9cHMfWR0tPCNrFj30HFP8EYqH276UT5n0Q+qCyyqU2ybmXgx9tBqAnZiAJoMONrvXD2AMK2BTk8WPq51wD0BhnpdgNfXgHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611374; c=relaxed/simple;
	bh=dzSHSg0tnYOpMKohtDQniZjREcPmcvX1UrDWM0kbu3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CaMru/LQq3iTYA2KalxiadWD7YhyPizmKkZgvi4DzZnvejYtcICrnEfQ+cqnZl/cXDA4Zi1wJya1GtNFbspNIZBdcGdcG2Uy4o8qwaJfZlDPxM5SFcCqSCQhsMJOYoIkbB2EU8meG86ClBi+IRYFvvo5TNE0HexlrkzaFxtgU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtwHu1lA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2m/J6di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtwHu1lA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2m/J6di"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GNM9VS1855346
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qmBBtsE3gOQe48Sv12+iXY
	x65A6NntNxZLh/Y6z9vBM=; b=mtwHu1lAK0dA0gogAIrj+W7dOfbt9yiAucZeW/
	4AJQKBOk/Fho5rJdsLOn8z/+lEJTQOs7mXcmiP5BM4vWa92CFiS8PnEoEXrVgE/l
	jDR1TyYoqeZouDsGZY2FXtzWAHhzWH+PcOm9+ST0ebrpMM9fmCNeq3zDhuKKeDdi
	pFdPWqbexNtU1HMloqIoz9a3Fe4zstXd4iu/R7YDtmZQDDInPlH4JAvulc2KeKvr
	mCognNM3zdgSXlo0z5WlEXHWGIfQteO3BAI6iEuqjAdphPck6oB1CphgFHYQZeJH
	LGf6u389aNDmk4IPwUrKJBJKFMz7aKLfqSS78NmRsXha3bpw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3v661-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so436213a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611371; x=1790216171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qmBBtsE3gOQe48Sv12+iXYx65A6NntNxZLh/Y6z9vBM=;
        b=K2m/J6diu9wo5IG7OHXWbGSEyrWC8SfuGH0gNHMJm2buXYbHndcuKHEyYy7d9ePAPa
         dP8oCqIMoGk0giYY/6Gbqmk8YNLxlpBtSgDOgBNjvbUQXPiDxza4f6Pl96e5fh03Wbl0
         MPlzhO4XFUnmVACZMax2249HBYMLYklv0ISnMGiPeZ4j6D14ph2+HA9VGMFT1qFHIQ1G
         j4l6AZ1D+3a2akSs75lfO5TItbiqqxnLjMxwHFl26yaiJ0epx9RBXdo9NNT3cqMc6SVu
         Td3/jTsH4RXj272iwFW8jNTgAiXDCsKqi3HFbgSGElOWnNgD1KQ/L85eQJkIDjUgNsHA
         Vp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611371; x=1790216171;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qmBBtsE3gOQe48Sv12+iXYx65A6NntNxZLh/Y6z9vBM=;
        b=sx2sUBMAvD+sweocU4LLY1uiBUcf1oaS6OClDlZQPppdAs9b4SROpFbBK8EZP8wvNU
         H+P6yuFMLkfCb22Un7xBLqJNkA2MXzyBBCkiC8/vuInE4ufJVa34en1V8Rx5VjNd/K8J
         QhpeLgfYw0It6A0UCgf2mFKGmL3sOurZflOkvYmyPIxH9PQSycCGS/02ZpTYxxRNB0nK
         O8RoWZO2/65XfuB07XUTdYxPLOMWWv7ZO9LxFjlUZV0veFGwNb0nVwgoC6iDmG0UZmB6
         +vhUlljA22IAW0pgpnJyWsKNdrb9FoSQ/K/XogbNuAkONJOW+IKC1N+GpwF9duYaNbHY
         ywRg==
X-Forwarded-Encrypted: i=1; AKwUvByuN/u1/Ne+rC4Tz04nNRplhh3SISIch1DNa48TDGrJQdnnEP5fIdB+uAxh0q+XBWd634Fe34eAiSaFFxM=@vger.kernel.org
X-Gm-Message-State: AFuF++lqNt0+ahXEisoY7jEQ3bK65fS0sucNVNuuym40kWnR/LB7vZla
	XJaXAgHgAcdNQSujKCaOPxapFyHBH0C6ohflECnoqtzN1/RqVPJy+p8w9UVh/oaACJf/ku7Gyn0
	hcVoemBQEHKbQp4ot16QbSnkuu5RVgafN7C2gIbcmAGr7f+HJvy/nSgg5w/ZV4CcXXCk=
X-Gm-Gg: AYBFou0lkQV3L23gijQhkjahaW/+qgDMQWOCeSu84HVHxqgxX4R3Y2fGYMafDXVf8jb
	Z09PVpfXzOPho355JBwnoG+4NXGlCKRyIje53kGr4/sKtIJR7LEon16+lKSyIq4eBK5UKxQd173
	63X/fynDbIY811Yy8jzOwfZbbN1x+TzOX9XD+Vqo57vUMRvy+lmqfcASMW0a0dK8bpV5WJKPbYI
	qOCr0n9kvCQq4Wd10GymUcTle5wGf1soVEXJ1bdR4x1/3ZPN+Km8Z1c8/UGnowQZ2CUsqfK4ueQ
	2vxJgrUUn9l2vRYGR1bUFSEP/mBovQRIjnCEc45KKT3ZbDs1WI+Y7q6LwxUqTf8G0y6+8g8/8c2
	DetFyzEF1QqLxi/hADf7hYXD8K5gg1V46/jDS
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10500898a91.20.1789611371078;
        Wed, 16 Sep 2026 19:16:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10500846a91.20.1789611370615;
        Wed, 16 Sep 2026 19:16:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:10 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Thu, 17 Sep 2026 07:45:31 +0530
Message-Id: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENNq2oC/22NQQ6DIBREr2L+uhjABENXvUdjDAJW2irKV9LGe
 Pei7bKbSWYyM28FtMFZhHO2QrDRofNDMsUpA92p4WaJM8kDp1xQyUqijKmxc4+galzG0YeZcMp
 KwRolW6YgDcdgW/c6Tq8QC6i+GS7N3ep5f9tbncPZh/dBjuzo/iD0HyRyQklrDGdcaiGFvnjEf
 FrUU/u+z5NAtW3bB46M74zRAAAA
X-Change-ID: 20260917-add_shikra_support-201761ba9f1a
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2967;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dzSHSg0tnYOpMKohtDQniZjREcPmcvX1UrDWM0kbu3c=;
 b=AxnchDvZFo/t9BYXU7cVxFtxJK51uFZ3lCpjZnnicjxOZXdZeq+30HIJbXfJ8PHGrKzVY09fd
 M9UmTwFlo3LCyOiIULdQS7ayhFXPGJwV/NJOpOKrA2r4RSeLcy2xihK
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX7XmfFMrllnZp
 RZWsNQBSo9Fp4MoOX6TB+quzsP6l6Z/ifwegwO0m+KRY+VJ6F+nN6CtRY6eKgjWDyxOKXDeqEFF
 YlnLcYX0GAs37iYrTDK5wBHUVDIv9L3ftDehi0lyGxT92en+Kz01iDdnmVZcSTV/LQOFbQNmScc
 /PrNIA5hr9U9CWBUN5vfcwrqC/o070R7eAztHZlONMYMqt6t0kYo6aTi/HJ+24HskYNEbwI+1TI
 0rTSxqkppSZILK8Qs0dFaGeo2Dsambde2zivY8KlLPWtO5aXOnGfCPOpPe1ICeDWC1Gs6wwfArp
 +t/FM4paqPm9uzCAdyGokMqGJOo6IBZ4uXDgGTym1Fgy8f6Ti5QSUW6bQ0x71+YiHAxJUxkoVf4
 I28yAV1Cd/oXjYwmO2Wtfnz8QM6ItZaSH5TqQTPpzVdoDG5Po+pw47ftpc8fkcVB4w8tMO6QmyO
 TSKZSkHu2zpiLIKGpew==
X-Proofpoint-GUID: zb8hMQFXcpKrEcFlDpjaa8V8ukDX4OoK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX4+hmgTsD9XJm
 qiDvBJ+1n0ox4PMI2zGoCoGl3WtDu/D8QunMWviK2VZLAzCn5ReUOX1Nlt8ZnZV/x18IC4/8I/t
 qx8cA28HzD/J1efCLb/mk0GpO7In7sk=
X-Proofpoint-ORIG-GUID: zb8hMQFXcpKrEcFlDpjaa8V8ukDX4OoK
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aab4d6b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=doChDUTQ96gpDzZ_M_AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

This series adds support for the Qualcomm Shikra audio platform and
extends VA macro functionality to support SoundWire microphone inputs.

The first part of the series introduces new DT bindings and driver
updates required for LPASS codec version 4.1 used on Shikra, including
RX and VA macro support, version detection enhancements, and associated
register programming changes.

The final patch adds support for routing VA decimators from SoundWire
microphone (SMIC) inputs in addition to existing DMIC sources, allowing
audio capture through SoundWire-connected microphones.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  17 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  17 +
 sound/soc/codecs/lpass-macro-common.h              |   5 +
 sound/soc/codecs/lpass-rx-macro.c                  |  14 +
 sound/soc/codecs/lpass-va-macro.c                  | 366 ++++++++++++++++++++-
 5 files changed, 403 insertions(+), 16 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-add_shikra_support-201761ba9f1a

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

