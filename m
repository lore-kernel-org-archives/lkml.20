Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B633D331D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307829; cv=none; b=RMQ0nnrX+cV3h30QSMfuTkWNewjD94QKzKhMphmaDsbwNGbDs+B4c9n8VZ3FPBcNVkUl8kvbstA+CjiB8VZWa0QGDmajyPhl5Zn4OIxxwqEtx084LLfKa7hOjVfmePeUBqDAzMT0HBZA0W8YyZPo7tUUhsHncMsXIJA3bgyx2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307829; c=relaxed/simple;
	bh=uUan4TmU0vUxvbUxw/i2eIb5myqFE5YLG0wMDDAUu/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m3hs5M9bLxsjNeNHt5/v9IBMVh9JS6AZn8hSITxjI9QcnCBfWA4vhmOy1/ly7GCfG7qOFVVwOKIVUD9zK8x9UsJQ99ELgQSBerByLgfdr/bijnuNid8nkJAEEz8QOwJ6352Ghje3hXVfZKCQAo1/KmqO/T5cW3FPjYsiYMWd11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpKFPpDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+S6+rav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpKFPpDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+S6+rav"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5txSF3684740
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O+gTfOsXpjgINoG1d0vg5N
	if4Ym3/qlhF0e0i8UvHMs=; b=lpKFPpDwAMkdN8XUQIndBQzvBZ2MBBV2NChvwo
	X5xKz5gRmM5EohMebsyGml3kp1uKLNC30de1L441yoJcxDiUpT6LcWqb//uHi9d6
	ZqtrT2gJePYqNwQBSlDu5zJQqp9FnOFwW7TtJWjV1h3lv2K/PcvJ1FWzQrBwDB9P
	Xx8f0/89zoB03F4Vi2briXkC22p8AC1WfY4s+EMfmGNeQfHEwbCblj4WtWaJ7bkZ
	NF2DdbvRR8WrpdQ0q1buJ8jeE7nwOk0j2cQ3OhFGAHAoYoj0FgupTFQZ2QD5vLxQ
	CaWqFLw3bFTdHsC8sbTdv9tFrTLkB9AoeE4Yler3OG11JyoA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxjmwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso2759165eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307826; x=1792912626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+gTfOsXpjgINoG1d0vg5Nif4Ym3/qlhF0e0i8UvHMs=;
        b=e+S6+ravRF23bt1Whqgu9EWY6B1KqQkJGXWsiRzB8zAF30+vwYOThL5SztlpzVv38L
         cwNRHAfJv5ei/Zpat6RqaiE5pTiJrUht6nSsjPQsOFQ4fo3ITDCSTvCIuDd0SHfohL4V
         LUYilOONH54TclGmQOBNVPMSqvR1HP3iLt2GQjbXCus3uWDNmn565kKpCcsLFlGx/AVm
         jZeypybnv4DkmfhAQRIa1VKyraQ6UHPKItGxLYoeHcmqbls9hOg70nn69RJOalR6tiHM
         hU7JaGWpWu8DsWFzyB6EWySBkmi75kAcsYqYqgzJRslH1k3D+utzWMN+OylunJnSPgQT
         NeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307826; x=1792912626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O+gTfOsXpjgINoG1d0vg5Nif4Ym3/qlhF0e0i8UvHMs=;
        b=zrLSDr7i8ZYYDeNEItyWvqrjXhrxzRDkRgZTw5+aWIFkftsz4vg9sJgZi3i4id/47z
         d+uimfmg2oG+14NuWQCdh8ageqpT6/llts9Ns61WTSZe/c4KUIyxvOU8u/y/rRBFwyRa
         rOrRIalAirzMJwMtkT6FXHC8xK2zlFG//+I0oyDfpWW00JKcpdzp5HPwQkI6M9V+5Ubv
         mwfSM+u+UhXES42If/+H3+fJlRYE5jb7Nj2nOUCpTVC/kMiwtl/1EEbdbJsIWvBNQzQH
         xGv70tCj+eopknsloNxivEWEKyiDZoe6cfvHWQkGJofQSjjwFDbPlY1zeunZMyC+TdOj
         bSXA==
X-Forwarded-Encrypted: i=1; AKwUvBySYDIx13s/Qzusmt6AJEOnXje0A2QQdzOK95AGUDNGKVYhF7EHD2aceZWL4ot0h07//GQGdstjC78XEvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEl9vfHDEO1lUVuCoQQTPdm+CCpY3hPuf3Z4swRPkPY2rrrN60
	he5G8rQHCcm99KNnkFTZSOGE0WqQFjQLmC8boEU4Zr+ezJcidopPrAK+9MpVnHvj/V7/Gr4YnCg
	hu9eegoMkkS7DtxB9j2il31NkMXu745KRZSGmpaesHRdiIJQErzd0m5wofAeEG7JqrGM=
X-Gm-Gg: AYBFou1a7cSVkEEd0lnPVCrVXXAzfUVEfePdAITL65hOvQ/ZBR+auP7VVw0TXBxjPcV
	6U+74cqrD6QoHwVt6gaOpQTkEs1t8SLxPuNDsyrbYu3gY9UNw0vEB0XLWIAHJICpOOEE4xzDs2v
	iw6uF60SPNn48Jvtj7+e+faEpk1pVbGuLQA4OUNkIRyyEgC5kOFN9ZtRCFfR56PiCT3703Fs8hf
	ACzINl0arR01/+A8f5UDcmVijmfVLWThIGquDKdMzEW71pMlAchKhkgIRo93vc5w1YbnFsnIyfW
	PLMBcTPKxjHEf2vVKjc0kOaNqrKaYUq1MkGf7cJtUGN7VJ7oVhtQHj61egXJzc8YL5sT57BifAU
	1vJV2Q4i8VtX7j4f+jRKrEp+cE1fC+bDoHYk=
X-Received: by 2002:a05:701b:450a:10b0:166:862b:9bcc with SMTP id a92af1059eb24-18512f1b124mr6603207c88.18.1792307826255;
        Sun, 18 Oct 2026 00:17:06 -0700 (PDT)
X-Received: by 2002:a05:701b:450a:10b0:166:862b:9bcc with SMTP id a92af1059eb24-18512f1b124mr6603172c88.18.1792307825668;
        Sun, 18 Oct 2026 00:17:05 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:05 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Sun, 18 Oct 2026 12:46:45 +0530
Message-Id: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1y1GoC/12NwQqDMBBEf0X23JUkJUF6KhT8gF6Lh5isNVCNz
 VppEf+9QXrqZWBmmDcrMKVADKdihURL4BDHbNShANfb8U4YfPaghDJSSI1jTB45Ojehn7FtnfK
 qqpw2AvJmStSF9867wbW+QJPDPvAc02f/WORe/XDmD7dIFEgkj5Y6rX3VniNz+XzZh4vDUGaBZ
 tu2L5+btsG2AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX7NC7gnlrhxsG
 zfb7yvC/F3Kd3F4XuY8t2y+uaIClCXgsYtWM2TUi3KI7QZXf8I7zlE3uqybczLApCBbul8Lmk0B
 RYL7HtueZSml3CO6AOoG6u+pJoveCzw=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad47273 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vAcK-UyUk3z7rgjP8dMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX7SQpPcLsBp0o
 xSbHLl1if1sQCDmYFn5324utTH+UZWz5Q1RnGinFGZWZnc0Ee76c0mu3wpRlX1rH94TaR/JvFw9
 5ovh0qkR1AZ7/Ae1kTHqj7NDOiemwh4LlGn96bGcTI2o+7yElByfIXRvQIc+yJWstcJcUKjqVZk
 0XDP1Lc71+NCgaxsxSOG46hwlvYXT1pqhj//8CkuTDHgOIfkImP6CznfC7x/xixl73+NckSHQmo
 urUY4+mOGju/8guCZF0iv3wTA5e4j7bQZOeluwmzD/cntO3rZjjE7y72EvZvbw13VX3FxIHH+Be
 Gka1QX7Y6R/vWf/c6vyXLk5RdSxcq08DW+sHg8d45PuieJ6hQYx6qEDSoN+JyM0FtoNAohOCNvd
 7bc78OAk9TgokpTwYaeNAmv/+bhBKcfY1mw5NSgHGWCmZYueBqtN3pKI6sVgy21nlLBqbuNwHRb
 eEW162I47nQ7fOxpOIA==
X-Proofpoint-ORIG-GUID: 4eE0Bs0eJ4y3Sy3J0OF3oulwoQ5kFsHK
X-Proofpoint-GUID: 4eE0Bs0eJ4y3Sy3J0OF3oulwoQ5kFsHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180028

This series adds device tree support for SoCCP
(System on Chip Control Processor) on Nord platform.
SoCCP is used for hw fencing for display and other
use cases on Nord.

It has the same interrupts, SMP2P states, power domains
and clock as Kaanapali SoCCP, but its firmware ships without a separate
SoCCP devicetree image. It therefore takes a single firmware-name and
memory-region.

Prerequisite series:

[PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support

https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v2:
- Drop the BWMON nodes from the Nord SoC as they are outside the scope of this series. (Konrad, Abel)
- Enable SoCCP by default on Nord and drop the board-level status overrides. (Konrad)
- Amend the RRD and Ride-Embedded board commits to describe the addition of SoCCP support rather than its enablement.
- Fix missing whitespace before the opening brace in the RRD SoCCP node. (Konrad)
- Got Reviewed-By tags from Abel.
- Link to v1: https://lore.kernel.org/r/20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com

---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Add SoCCP on RRD board
      arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     |  9 ++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  4 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  4 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 57 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: 601369ae08a35f1698a96bbcff02f3665a0cf675
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

