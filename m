Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FC469840
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117717; cv=none; b=gO+WwFz1QpZkzLkR3qA37CW74FbPq0pUV/4om6j1BJPM5Ghfn6gdB0a8Q5CQox54JgDi3GrgR8xWQCzY7u48uoRHYieCX27JL9Jm7fjrQ5bkYIoGAXEz7+oi5AJ4ue5q6QN4Y63nwL+xjA5Puy/1mepi1KnY5dgNqFPr2gRjW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117717; c=relaxed/simple;
	bh=RLnxW65ivjishoxMlttpjv9dgI6w10qF4H70h00weMM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P/6qA+Fxg1VqwVKaSTSgqHm4S8G8oh5E9hyHZz1T9Qh7GtpRCJ2pIEw4sdHoVCPrZCtUoQVerbhwypNp4QiwidZVNr5CLJRVzEcxLxCaSJf1SjJr32RmwO/EkzEgYGoN8JhPn19Drjq+77ab//+XQYwdrgXcPT5tyz6/024gFNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSdaSJZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxeK/+vJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSdaSJZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxeK/+vJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kmX33463998
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2TEKpFgj0NQRB3u88e14uT
	Iv7Vzw39LaDFD0hVsSQu0=; b=QSdaSJZJXkcKy5AAAdCt3aPyj7KRZrJql7WtGn
	+D+ZA0fMOmIwwcPH3wUXQUsZGBAhLv+AbbG1Pdup6q3/OA9jYNal0rdxiq9xRo34
	kykVSBShqDoWU2jhtaZfzzsaG2ipIxRrdAOZDOi7nTFsBqxtqXBSC1RR31whc4on
	rn4GqFBhjWFHCITC/T43KmiGSwDDkr8s0qNfdFr9olIkLKIYJetenJYj9Bnsb2XG
	piMCv8DT1MB+cPJAU4yrXFwswArzgX/S1pBgxbCsNCqK0zPZgguJEsAHxJjN9Mqt
	O5ynEL70Mfckhx58eAJBKqFHS0Q+Xmq+5lgZnMDMAX286PTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr8uwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1415038a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117713; x=1789722513; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2TEKpFgj0NQRB3u88e14uTIv7Vzw39LaDFD0hVsSQu0=;
        b=jxeK/+vJOdO1zZYWsAoQiuGNNS7IeVo1APywm6NXY2uVC59Znw5CERCumvrZxhXWrj
         mGqc43ts+qEGTnk0qQKbNqkx9+q1PWNylcs6vDiyyOCtn50iGlATUPWeZXKWNBzDw6z7
         vZYcr5oW60CoeWeOTWJFNu/hXHWqgTEpoQs2An/M2swAzBWhi2qSm5RADrMATyj/y3CE
         mTE44sVai8vcc45vYBXH1+Gp7polrhe8WO9PyY9iSNjZGdijfoS+SzJEh0/QCvEt7igX
         lenDjYyUlRbPuI9qDjHeh/F1mI5xM1gvemmLqD1s2OO+KiiRyLrTqrnwkUlF5xsQWLM2
         4Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117713; x=1789722513;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2TEKpFgj0NQRB3u88e14uTIv7Vzw39LaDFD0hVsSQu0=;
        b=YVu+6mbcbrX4Y/RV+pFZArHhQYd3uanV/3eunbQuYBIzRisCj/XZlWpvrXM2+S/BqP
         palOimDE5sE3sv109NwNHirHbDb+IJI0IXDGa63CWiM9fgxJolA8Ktly9t0c2l21LITH
         dJeXdLqiHdHzvxrpjXGrgNik1xj8k2TPWQOv5YD/Rm41sJI9FyhTnC43Cp0aPkTzQwIn
         h+Udu2lDpSuf89jcQk6zhbAn/x92HvMQMJfUj+JgylS6glB5ma4XQgrc/I8uFYBCMTWj
         Zu5bluYTu0feyNkGYdHOaBacOWa7VCVntP/Vr4IF3UtGzPbniWg/Gmq8UUeRY0iDcUbv
         kLlw==
X-Forwarded-Encrypted: i=1; AKwUvBw6sug0ekhVJmYiA7qEp159+lk2opMLy/fnkKNQnZdNglYT4W2iIwI1xybG380pUTOS/JbjlJmV94HX0Qs=@vger.kernel.org
X-Gm-Message-State: AFuF++lfd2QrGkpUWSjpfIucqbIVGyo/azcMpa8QVo8gbnvbrLb4RNTR
	VPbw1Lrg+mdYTaJwSuncYd61jN5+GXWULKTllM0DCHWjB6dYzIb13MKwDC5ZXb38WtGYG1WlmXK
	TES2h/1LETQykP2YIfwwhK1gQrs+LbjWZEa4Iy49qO/SNycEPsYTEJ59NmfZUJtvuR+o=
X-Gm-Gg: AYBFou1VMxVz0AH5yZzEE4UZUlDTIsXpnggi/rQAYonBvpZrFSG1oHvPXZdsimv9o9B
	qBhyqj1DXIyWijCRj6mWHciapD7ujD2AVdpS4+w1CAQb74JbGFrR1Udi0pzjL2QGLpRF/uiA46W
	2/MfklDIiMcgizjqmE4YMbCdoBgmII6t7TcoHJ71v8BQHSIuucWtRlQJqKMoS9KclMHegwgc/jN
	KaSCwqtBwgWV5VdqOMWGTAS/sCtQY7trbTnv+pyrtNGl+RtnR9N2DYP++7k2nEAubzOcmBgA+0L
	ix8noLpUHrkBO2JAsnFvfmr5dUCdz0yFHuLq4WKc8SJztYjEvBw0x7wem8pmkeD46gwIuaxt/Ph
	5cSCEj6r78uvmwMOYd7o+hQ3ywdEp
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39d9c2276fdmr6226501a91.19.1789117712759;
        Fri, 11 Sep 2026 02:08:32 -0700 (PDT)
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39d9c2276fdmr6226452a91.19.1789117712329;
        Fri, 11 Sep 2026 02:08:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f82c69sm5040447eec.27.2026.09.11.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:08:31 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: rpmh-rsc: Updates for RPMh read requests
Date: Fri, 11 Sep 2026 14:38:12 +0530
Message-Id: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3Eo2oC/22NwQ6CMBBEf4Xs2ZJSIogn/sMQU7aL1AjVLhAN6
 b9b8Oplkpe8mVmByVtiOCcreFosWzdGUIcEsNfjjYQ1kUFJVcgqk8IzXj1pI1RpilNFeYntEaL
 +9NTZ9z51aX7Mc3snnLb+ZvSWJ+c/+9eSbd6f2SUTUmDVlp3O0RhStWNOX7N+oBuGNAY0IYQvC
 gVZF7kAAAA=
X-Change-ID: 20260910-rsc_read-27d689e37cb5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789117708; l=2406;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=RLnxW65ivjishoxMlttpjv9dgI6w10qF4H70h00weMM=;
 b=jvEzWanianNehZipJW0i7ikBe7US2iDblPilhWr3jVa28sLUMGDY20R1kxj4pJt26MIQyhMby
 e5gS1OXv2bpAPpTYr1MYrzzo9aWPbjFvHUwqrEEFGllIUR+yHH85m6R
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: LehBs7yttFMH4Cp2ppYNs9oXcJNjBtjJ
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3c511 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=4iiegGfdhm7NJzgoUiUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: LehBs7yttFMH4Cp2ppYNs9oXcJNjBtjJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX5f6wtqLxshC9
 ShixHuhcTNm5igktX3GndXpdvRo9tXmleosEV4Tfaql/g1rVJKyRbuMGjclFuibO0DOMXHOxFkj
 CCo2FZYY9dm3P5tLVnCXUfrFeV7QOaw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX16N0p7Wo3fgN
 YN25z5OypCpeqiyGecmTdfOJdiwzCo9zvsgrGRqYpG5FRVJynsWbiZdn7TrDoz9+i9FkVhGYOQH
 QQAtLTIkd5WVCIniRbA4SnkArszAU2Gd3SlOHFzeLkN/pWBlstMlFxMHA55b/miij7ZSibbd1XM
 XOYSDCTdUSeZNTFzsGGUZRmIyaQKRKBE7B/Lhm+qq/olwLGiVPrGXC5cMlMB7RVZE5vqMx4L/nb
 qJxQ+elFhdzuvpDFK6g4OGzWly5JAMp38O/LyX2vW0mJtOu0aJaGfogn+5E4AeoMkVOaL7LsAwE
 fwAM6pWDp+TbrIfTDIiXZdz+il6RZszzbcaYOSW7YFRo/K7fy6y0zZTpjzpOmIldohaCmtY417J
 c6gtZzqx0+vC1NVY5G0RQnhDd9Bo7jnYbOShKllLkeS5SMU2TXf19euG8g+MpqzEthsbN65eIni
 E63sh0dk7NwFbKeZi4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110127

This series carries two RPMh read request updates.

RSC v4.5 and newer expect read commands to use a 4-byte message payload,
while write commands continue to use 8 bytes. Update the message length
used for read requests on those controllers.

Some platforms either do not support RPMh read requests or AOSS does not
respond to them. Issuing a read there can occupy an ACTIVE TCS indefinitely
and block subsequent write requests. Skip read commands on sm8150 and
sc8180x [1] returning a zero resource level so callers avoid error handling
for an unsupported read path.

Patch 1 has no dependency. A Fixes tag is not required because existing
upstream SoCs use RSC versions older than v4.5. Patch 1 can be applied as
preparation for Hawi SoC support.

Patch 2 carries a Fixes tag. I do not have sm8150 or sc8180x hardware to
verify patch 2. If there are reports like [1] of read requests not working
on past SoCs, the list can be expanded in rpmh_rsc_no_rpmh_read().

[1] https://lore.kernel.org/linux-arm-msm/0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Define CMD_MSGID_LEN as a field and use FIELD_PREP() for lengths.
- Keep the read length selection explicit for RSC v4.5 and newer.
- Keep Tested-by for patch-1.
- No changes to patch-2.
- Link to v1: https://patch.msgid.link/20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Maulik Shah (2):
      soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request
      soc: qcom: rpmh-rsc: Skip read requests on unsupported platforms

 drivers/soc/qcom/rpmh-internal.h |  2 ++
 drivers/soc/qcom/rpmh-rsc.c      | 21 ++++++++++++++++++---
 drivers/soc/qcom/rpmh.c          |  6 ++++++
 3 files changed, 26 insertions(+), 3 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-rsc_read-27d689e37cb5

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

