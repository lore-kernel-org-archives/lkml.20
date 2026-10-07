Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC110480DC8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368929; cv=none; b=mG87yIEw+m69YLZkyf/R9XTKyPUr1UV5S+9Cqybs+Nm6oFlnceefX/tuV381klsJ9VRCy8DSoj2FVlQ5GqHfzT5XCDE+a9obhxb/9jqAPBseK+DP1PA3XB4msa1KL/LZmVMaUJgReYKhrBh7QiGVQK00eHHChF427WXjv5SUtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368929; c=relaxed/simple;
	bh=ykhcPrrbeFy+nNEr/jpSJsH0A4nJvqK4aa8osTz/xXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qc50tyW09JzChwyIQL4Qq+VSXecj/CD9RKCnSVrAQ9SHBNCyGvEI0veGC/hCMu1/6M3BN1cW1gj/g79YYXq/9xk4hJafcK6vdzFChfhbuM+U8Phu+0O+nr6maWWhwiBL56kMcm3FHgR7bQYmmWhUMcwaLxvVyRkUje3uJQ9qCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJk63ZCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvnQRmFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJk63ZCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvnQRmFd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jlY83686121
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qJd8c3YcS/jWGwlUkQ1NCk
	BRZMwGD6CmRMTRMWeTdPw=; b=JJk63ZCWnX6obCkxRwKCbG9eLXvvy69Q/K32r6
	FXCp76zClHzNC/W1YmrhyYuQK4IEmoDya1Ce4/hstcLYQ/dIpoIHHhhNvsOxoVty
	hRHUMwSGby/WZRC2w+8lpB8CEK4hk0ginvddCbgXKmQV3DbVvGKGtp2eFW0CqL6P
	kUoLMCWZnFIhmyMwvCJ/u9zMXWoKh3wiI/uvJwZePJlkrUyswGw7/VGUNBs0cNIV
	/orQOd4MF7l1ptg5f+un4Gm4YiQY/wXYa3JqzGgPqVHmIUvc3wMx9G+tLSjh/TnP
	486ioGkRmK0zfkiqHZYi2CRRzFbUKzAvtFbhe5eR0OVm6OVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609p18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:28:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so41824315ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368916; x=1791973716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qJd8c3YcS/jWGwlUkQ1NCkBRZMwGD6CmRMTRMWeTdPw=;
        b=cvnQRmFdeBzMcv0omrc4M8EsZvF6ra1xkU3bGnLnju2Oaq85i49qrJpKS4SW0yqahQ
         y+dw5x23X/xHWKB4k4tJ6ZA6q96jdgypWO7PEfzAxncdTp3yYqKztM0YEtLCMaEjsRCx
         sDmY4K7nnUvGWSqWnrAm+C+E7U8tulsjlPPvgAcMTUsXsDst1v6JFDCQ6T+puN9IP5Ge
         9ph1kMSMt0B0lpIUwv5mPhYdLBGuNVKXGxGZpZL5H+P+vzv06ZhTvMlV6NdNpmFX6e+2
         GcRzNOOHpTGDcQTbqtsW1jwxqqtqLdrlQ/gP2iZcm+anq8rCgWB37aw93e35fAg4pCMN
         7vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368916; x=1791973716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qJd8c3YcS/jWGwlUkQ1NCkBRZMwGD6CmRMTRMWeTdPw=;
        b=n1SrxvR7BIDXrV9MaZj9t67ZoSib0Jpo0/J+/XFXSpv7yIGwWHEJOGJGW8Wmw/mdBO
         kuAQCcZ9x8YydAqBfBFhroBehbLwZsElwUjpWCdUDjAA20HhaM5vDZW9nisOxNMCrW5P
         34PW20mb6ps6fIFQII9HKJbyUFMaJnbMgE9I2Pt2gTafvERT2SNjhjif0Hzd/R5jm3jf
         PeoXCX4pQTkKXskacidf4Frezlhi3g/yI3eZBpNBVY0X1LoE2Bp8DXvfYom0VhZC1mdX
         L8JiDWFROqSDuWBV81RlH3nPCWyCTHrWrWEfw8cEVtq4WE6NP4X5pcQ+nXrv2duTyZfc
         aggQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYjErrxmPz0sS/83t1llwil2O0pvepPjvVlt2JuQ8O9OHDKX5prChq8K4Y5t7HIqtBmlFmqfWQ2vYzaPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlX/AiV+3gMConkokHcq+XrJbw8IV7J/g3UY/ZvKYrh/uJkfhI
	EJi+DhyZ+m7m5q5sCXCBLUjWzrrRj+nMn9ol5T/uP0fnpxqA/ZuTOT+Zygi3cu/VtF2exNEc8x0
	hjyVbdEf0rd7wDM7nP6AU+GdWeIa7Ml54sxYG6I5S93Aaqz+CLm8izvWjR1bauV8g62Q=
X-Gm-Gg: AYBFou2ueolp2kHXhaXgHbHczsKhsN5jrno+443n7fTRXNOWsblTOD7S86864LpnOjN
	i3C3gqmo3N8G/mTMOZkHuCbXYfp7BadTR3XdkO881sEIDxS3yj5CkOItssKzD0UzpHXI+XMAZyU
	51BLjgUuz2xN2jjoybOhhVipKvHutPkMbN0eYkrf8M2XV0PLT0XWGWKsmpBB9AuyN9/M+1xll4q
	tpFoXCVG/kEtoLopl3oUVMGpHQWMWar9c9roBP4rzwB7hzhRRd9fQZHMpgQUBX3Vx41BX6uQZmt
	IIct3YPPI3bvt5ObIWAp92Tt8btkdihbDUZZq4sQBPU3ZWy8vQuhJsYrrzuvro6xPC8CDZRNWXf
	2sdGfH9LuRkrky0tG3a0d5XxzNxB0XwMk
X-Received: by 2002:a17:90a:51a1:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3a8c0dcd0c2mr285653a91.23.1791368916189;
        Wed, 07 Oct 2026 03:28:36 -0700 (PDT)
X-Received: by 2002:a17:90a:51a1:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3a8c0dcd0c2mr285649a91.23.1791368915689;
        Wed, 07 Oct 2026 03:28:35 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8cf2b69sm1221334a12.8.2026.10.07.03.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:28:35 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Date: Wed, 07 Oct 2026 15:51:16 +0530
Message-Id: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwdxmoC/3XMQQrCMBAF0KuUrI1MJmm0rryHuEjSsQ3YVpMal
 NK7m7oQEWVg4H/4b2KRgqfIdsXEAiUf/dDnoFYFc63pG+K+zpkhoIYKkTfnR3cLvB5P/s61FKp
 EbZUFZHlyCZTrF3c45tz6OA7h8dKTWNo/UBI8X1nVRlsgqqv9EOP6ejNnN3TdOj+2eAk/DfllY
 DaMsqLCLYHb4B9Dvg0BoL8MyYErRWhdKTfgfhnzPD8Bz2IQ8zcBAAA=
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791368909; l=1874;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=ykhcPrrbeFy+nNEr/jpSJsH0A4nJvqK4aa8osTz/xXY=;
 b=R8AdO6T5D4uOuzoM4i5eqCgiEViZPN8V/RpmXDihtqOw+o1i/IEgeieJKdcFHlkCHs6su6iKv
 qwPyaLRSPK6Ap1LGJg0SWMApZ4CDqtVVcM8KWGLz39r//I5d6OlNGd0
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: 41yDaeOWczH3CGgU-e-CwJZC9PafSbb0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX5aTlZSAmZk8u
 UTNeRu9fntpzW18FKUVvOR4w2Shnftw0OPTXO/4phskATwV8pPH4Fd535KwU+b1FoFTJTVqJbf1
 /eNzP7UpRSFja4PV45t+zJjfzJnHAEA=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac61ed5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p04a6VuR7GaqaFzguDYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 41yDaeOWczH3CGgU-e-CwJZC9PafSbb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX1l3NnnPEvKwX
 BeTLpaXqp9q5ffHdXd76TIEtULpATEPOd/pul9UHxnOih/IW9fXjBoUYISHy2CDY6QhqH9ejhSV
 +Phg9gJg8jASBn1YVtWH75Q2BgF9Y1N+/A2uZvRYb8m3FWYKXfu1sFwaOyhILznHMSmRNMgjiL0
 MClykMQrcbKpAVUdAG8biO4jcPHYW+BjciC617ILACjko3Q2ptITdjNhiX0Tvnf6Cv+it788Tf9
 oRsBlplVPfbuKmU0SHPAh0Bqnx2YZCJ1MO9/hrD+WqCiC8YrM2v9A3MKGEY7OpVuLlf8It7oeGh
 DBMGvDUqvDcYJJKmHl25J48hM+84e12CqOVuol5KgqQFXGiY5Unv/w++uoxRaFb7H565/ojaMtN
 rgKWuBQHanodI2sE2fkcZ3tmJMlb8j9SB2JPPqtPdtmHmg1TSVkOSDYQsv5Qin+THu5lbR2t8d0
 3MaZtsWTkXh/zlfuF9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070041

The reg value of a compute-cb node must match the SID (the lower nibble
of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
of the Glymur SoC, three compute-cb nodes had incorrect reg values that
did not match their SIDs, leading to SMMU translation errors.

The fix renames the nodes to use correct lowercase hex unit addresses
(per DTS convention) and corrects the reg values. Since the fastrpc
binding's patternProperties only allowed decimal digits in node names,
a binding update is included first to allow hex digits.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v4:
- Change [0-9a-f]* to [0-9a-f]+ in the binding pattern to require at
  least one digit in the compute-cb unit address.
- Link to v3: https://lore.kernel.org/r/20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com

Changes in v3:
- Add binding update to allow hex digits in compute-cb node names
  (required since unit addresses must be lowercase hex per DTS
  convention, and the corrected reg values >= 10 require hex names)
- Link to v2: https://lore.kernel.org/r/20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com

Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com

---
Ekansh Gupta (2):
      dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

