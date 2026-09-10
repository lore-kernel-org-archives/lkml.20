Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578F3F12C6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033646; cv=none; b=q1FzLzkEuNKkFLlShTosGSafM0V/0FQpMyzfMagbCNmHCvMOLJq3Acxj/BTJof2DDCPi8qk63YckjJAX1Tpuq5AIwUFyz2gNCahl70rbbFB5nv1jbuciYDxPRiv0uYXnsCK/0QlHMWDKKVScBe6yFUZi7IbFfwZjCFBcvX0BN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033646; c=relaxed/simple;
	bh=ivDNcWUQj3GpT8TOs6vZnVozhXqivLXnPJ4KpDq0gL4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SUBP2msLeGfv+9JRFHKR4FpObZ3GtN6P5iCY94S5hCjgAeH2thRfmGhvQ801PfqJfwuw7a8y0tybvcJo3iuq4PdeA4uAoemmxo1D/XcdOpLIGIkuo6Zhs+Kbz9mTFm7I/xnotgU5s+ZJJp+APxfdcUpxHp8HR5+efvNb/3LD+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdZUq5NX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0XYOLBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdZUq5NX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0XYOLBo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xRBd3468689
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JwTb6aJu2sX1HP2RLSab7t
	IahqPqWFuWrN/etTrV6Nc=; b=EdZUq5NXsVYEAQOYW1pvJCiIQyYOw7W3Ub7xLu
	fcWAQltW4VwjjxYmsxiNRKpIx5LIsLxXdKrbt6AFUEll3P55EaKxiGnRnNY/Cf1T
	06pVGpBol5LvDJ7GqM/AEduVe9PjoIk7Y3LyCXbyKdXmdrB806uas6tJRQbfzfuy
	4ig5r33OnqUkMF5RnVE9KYKz/4mJFJuZFWWGl6WAzIhkQTjnK2O6L7y1H9uuPLQg
	2+yLFxBdadb7rWorJ3FpP4QRc+He2fg9dzgIMMKOL2suPJspllc8SMAUhz1XllD5
	nvfIuijPSClAD2aHBR4EgKz8UYy5cJfZrDsLoOFyn/ApxhKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r7d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so12766010a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033641; x=1789638441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JwTb6aJu2sX1HP2RLSab7tIahqPqWFuWrN/etTrV6Nc=;
        b=W0XYOLBo7pe9OD5/0jtrny40u3v49GbrnI3Sl4Dc5UwrJHTSAuoP4zyu6J1+AQHEY6
         TqVZBxJNDNnwhbZ6E4zE8X8lK/PB0FbyC/NYTSkPCmr2cCTJ/tMtDJZgvbgSwAN9ZFXj
         nja4oc5UvPUYqGGPTtalzm89Dj0Qjlba8jABrL/O6wsUBXT0ycMHmmMiFSuonn8bNNfJ
         f2q5P90+shI1MHSk7D1lTuAzqe5OUWc8GDGS/UG6x4t3pPR3BMazSz0dUh+C0lzMPZW6
         IMvVjdxYJcKrq4Sc6x6Kk15TaMOoo+EOjvzHoKidZ94nFWV2dmsglozKxCWqfr5AjSVu
         gFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033641; x=1789638441;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JwTb6aJu2sX1HP2RLSab7tIahqPqWFuWrN/etTrV6Nc=;
        b=pPPa5r01f+EBmL+B/l07XQz62GwaQPaU8mDyDtITPst8IPzY06QXz9Jk+p+AFK9s9F
         eAjhOizLcKzdfoKeGBrSpB00uHtP0qtFzbGQKznK4p86gzf/ouY6Tirzaiu0WqPN6V9d
         LVO6ltcjGGbYlQLXy+jq/muAN0fFsFNLNtIa+pF9Zyrqq/HF8j+t1lxvxxdXiLPZQb3N
         ueM2pkyxyYTssQGdMuCOj6Iq6cvlTKeaIt9joE5bEiUmeiNz065ESRPTl1o1KEEC3a/p
         xWduZZ1J24rvTMglH1dJXYhZu8TD9IaH20jpsg1sZf4Im27Lay2Cjq/i1HfsI1KHF0pw
         4AFg==
X-Forwarded-Encrypted: i=1; AKwUvBy57XL8bUiH7aSRKMloDtci23raf6zUAoCQCh4XLITdJhrsFHB7JLs03I5dVUYNfnbkrMwKNP6tnaRor8w=@vger.kernel.org
X-Gm-Message-State: AFuF++leFlvyBy45dSef+eLrR7Ebc+aeQRt/jq/fJjmJQIC/Tz+Y0q2u
	ChJdF3aSz9UcNuOw2eNuTV6WlpcYMkqzTs2a9ffXkoRj1cSv+SOkd5J9iYMRxTLP7YvnDF6pSV2
	2COqoCBz6ZjoMlMYQFDwI8KeDkCSN+VfaO2lgzxZVgE4fCqYoCBJ3KuZ3uebgpP/iwVCxT9nD2o
	w=
X-Gm-Gg: AYBFou3HbwM0cwawy5dpNjpznHH30g9VIYGugPVkBgOaIcrALPbzLlqx+KvxgywdQur
	pdevDcGM4uGCPbFbPEelQVV/XI+c13vzlEGw29Bfm4XJ+uONrvkruF5kDfyjpAlHWQTslc758fj
	OHtH5HnxP+7qeZWHxgWOL1ZH4O44lYJSMke2M1KvUhVQ4A/nol480a5Znp+sXEoLGCHfmR2MXGz
	S/14By2Tww2Ana52RnmxXmbDUbPg/jz5QlmaPq2i+YMtSYCphY2dZ8bzoz0qGOxMoFgDWNwmykC
	I7ybFQ7b7XTg5oyBeURou4porrj7lA+4cWd2LhSo278pU5JxGzWYTi+PVNMWnXhIk69uvYj8a8g
	R+etQNO/zXTGzj2BKtn8k+9Nqe5BR3IKLf5ML
X-Received: by 2002:a17:90b:440e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39b261e1011mr56961710a91.13.1789033640645;
        Thu, 10 Sep 2026 02:47:20 -0700 (PDT)
X-Received: by 2002:a17:90b:440e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39b261e1011mr56961621a91.13.1789033640020;
        Thu, 10 Sep 2026 02:47:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:19 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/6] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Thu, 10 Sep 2026 15:16:51 +0530
Message-Id: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIt8omoC/yWNTQ6CMBCFr2K6tg2MoYIr72EIKbTYEUuxA0RDu
 LsFNi/vS97PwsgENMRup4UFMyOh7yPA+cQaq/qn4agjM0hAJkWacKV1RRa7oCqahsGHkdetyUD
 qHGQBLBaHYFr87qOP8mCa6pdpxm1pS1ik0Yff/jqnW+44kEmeXqO7CChkBgXwlDtvlXNKi6BaF
 GQVdndPJD6TejfeORGFleu6/gHSv0JRzAAAAA==
X-Change-ID: 20260910-add_shikra_support-bfe526d82692
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=2446;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ivDNcWUQj3GpT8TOs6vZnVozhXqivLXnPJ4KpDq0gL4=;
 b=wPM/kBg1ZQuV5a2m9RMvVAFSuNDSpnR31qwJt5Gqgb4umUWOl4R0kken2xJJ2CSgUdaVh37+n
 4GywW29KbKADTjrqTXwq8Sz2yoS0Z7wImWJ9wcEvogAfeWPVMXQI7VJ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: jTHsW6VnMEYvCpJoQcTHTNBn4vV-5quv
X-Proofpoint-ORIG-GUID: jTHsW6VnMEYvCpJoQcTHTNBn4vV-5quv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXx3MlyK6XLFSV
 X5wJ5kTV/0LkEo2j3RUVY+0qBpdmHmYm7szVAEAGY9+3tp+wOQZnZNKT/QjR/i47xcCEpPjKYEU
 mjWzid2TL0Q0h1yyeqPzWFjdD8NulNa0L2/XZUUMyhBQmXBGrrOQq+qmQWAQlkliZtY2ldG7fee
 SY7tossizD0GTq2f1L9H/IaBHWDsG1dGXwBuv7ppLEGnWmnJx9UwLRv1IZaOgi2dP0Yc+2yqCys
 ABmUDRK+uPae+h9goo4K1tU0X4cJ+avk9ctvD/gyLoMm/7Oh4qO5c1RFFn03Fp/26Edw+AppUAA
 O2DVynV8GD92AcvoKV/osJUVEg6ThV3SYh8gQMmbP1cL/0Y+UT/fr9cxejq1GBOvPp6cO0WcGr3
 Q7qF+aP7URB2EzKHgIpTkbDc8qY6J2vfOz7syW6md37DrOfyT9462VqxIoQU8Ot6Zy30Irmu2mt
 Z35nALo3ZgDTNt+ymxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX4ap0yOrA7d5s
 06pE36r0fAKEwiIotbbr/pi1wG1nwhsH+3Kg85GydeKRc9bb/aoJkU043Ufn6uqr4gyoTe7so3l
 yr3e7UHwWZjets1DbKyeqX7+02g1QD0=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa27ca9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=fDprqlrTxk3r_JbkCJQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111

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
Mohammad Rafi Shaik (6):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro compatibles
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-macro-common: Add LPASS codec version 4.1
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |   1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   1 +
 sound/soc/codecs/lpass-macro-common.h              |   5 +
 sound/soc/codecs/lpass-rx-macro.c                  |  17 +
 sound/soc/codecs/lpass-va-macro.c                  | 352 +++++++++++++++++++--
 5 files changed, 358 insertions(+), 18 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-add_shikra_support-bfe526d82692

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

