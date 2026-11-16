Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812929;
	b=io4hnzACoMACe96KJ9WikiG8ubUkkZcdvYzoi/wCQhvTfhjBWIbVfWvVimiVSB1NbLT9
	 jmjclT0WBygapMYc1Zt8G965jLWjNEKRiPPL6y/5mSVaXKIDKZiC4eHavTq3Ev/5WvbsP
	 XilKUXBZvAfl+SU+2tdOeAYZLl/7IX9v1CWUPQBky9d25yaNgVi4yTB8/udRX++nbT+zv
	 c3eGe7tWkuNutSXuLecbJiiJWw14QcBQbSj8VYjdIbQxdC5g344B8Sfsw8MYz4EYDeRe/
	 DV1kmUehdoWW89Djr9pcG0vo7pNlSprVpUEJJl504u/IbM5BBYe0KaQK5IY8S6Tl+Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
	b=WSnrFWQS9AzHNWHQb+XIUXU0p1m33c5KGreMLr5FnXLbb+7bCMY6WnE7vnVXh3jvu8qA
	 vauE12QLDgYefGy0ROVJbFxYCe/iDsIhr8lysdzUb2G8qiihTRhVsyM6Xh7YXawmYQP/p
	 aS5ZEZefC48nVih6GITtJqzMtV28jWqYtICeReIYPgBdlwS+p3DjS8geokoXOnMYl93ju
	 sXiMv4ReIF5FM61A9/o7kDzI868ruk72wdNZLMrzW4DYXqr1Y5I6ptCNAgxoYHC2CxAhr
	 x9iGWCMo2gqQ45AefRSbD55VR4UkED6xeAemKzJUlSdEieLuzzYVVNlb8ZrQmta2mJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UU+lkmg8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI1lEujG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2264606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2264606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UU+lkmg8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI1lEujG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M3mE3177645
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsctoSyuzeDFyOLJHRFtf5
	FpkehAfPMSRea91fkgfbs=; b=UU+lkmg8mKbhrhmA1XaI+i9P9IE1ak1bAcJpyo
	ZMiNibS2UNDUIHc99dFfWj/bO8F7SYN3Zts60vd9qgevheLue2niTouNQqrDQbVd
	Z5UuSdYXbMgVx3bmioBuPqS1W/37Lf6DiCL0NJ2CUpMY+tSCnxf2dVXF1Vhs/IFN
	i1BvYS/mZO7Yu6oAsdBqHm02V5k7T+0bUmFwHGbIrgKYwaXDsJToG4OJeNXovLnl
	aSQ3URKryJvs64POzafE+87Rsd0JwrlMs8ZCF3BwibYgDZGWcb9cvOia6o4ypZnz
	9YfUxb4QqHpZD8rKa0rx85oLzCwqmKKxVzge2dSoEmcRTeDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcd7et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso1476119a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812926; x=1795417726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
        b=LI1lEujGGe1Lpa6zJ0gKOLH8EsGxNBR4X7IrmAczkLxzZhEml4cDItkRbHgqhFf7Ab
         mhIZCnGnp4C4WCnauY6xATLNQXYF4wrz8KKNzOWBte7yec0eI2W2/89x42+nNYfxNxsF
         Sa9gn0N65yMiIsQNA9BN0zMrMT9tEDg2WGo7lfyYl2teRgxxM3YL52ALIJfdcjkVXPuh
         fsWAHcGddEUtgObJev6q8A8P3sQXgY7ZMYonO1RUrtaxBZhEpXhoXp1lnJ5z6CBm7Aha
         mgZQb5JzxkqI7AmooDglDJF30dsaCiZqYCsE9haetmEq74HT/tIpsICXrEa8saf2tkqF
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812926; x=1795417726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
        b=MCjKgQWUqiudnGpVThmDnGxoHMXBOK+mtD8z85ynupqWU+JVVLw/cgiMQ0bamtzK6Q
         m1CLjrhCkF+mIrFwW1chk2VNq1q5KvbHTdFRtDyY9n3ecZBYhRnpduQgNXnIV0nzdEum
         R5lLyKnCMS+O+veOH4AMjgmE877mGUTNZZJmSOJN8l0cx0+0tSV5esCmXuZ69VWBsj3O
         632DiHMpVGnSMl6ZaHdgSET1BmxI6jKkQ9vN4EgjyFDnSp4ttxW5djPWbWoloUs/F3D0
         tHxs4iXGacM0vRq8WS//mJMZyTEKZnnJsfcxnS80IGBhjo4rOClrO7Do26eHKIXcaIb8
         2NeA==
X-Forwarded-Encrypted: i=1; AL+hErE2VpRE9Zk+Y/ifhs5jX/MsOhqgX2ZK0d0DZ3DgKe5hxDV7mhADA37MIXvafmrQ/VINVj4iyNpH9fj0d+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TqZMDRkAfZa9UaI3d38Hiyrf21IM8H5+6kBGhS7hWucuXT27f
	3mSO3MEFwZ47wDEx4gbJrO3F6amC7POVFvuxQOphPHERy8x9mUFFcam5CJa+mdYCPHPJilVrtKR
	iSgg0r9GSscOKp9v5TuUVVIlkYrs+6GVKKnZKWcXQV20T8R0u7RKOzuLooz6/I6vzXKI=
X-Gm-Gg: AZFdTZdv3WhckHHBcLNOmzWHJzR2umYn2S9KXYCVC67KQBrCZ3iVa5M98a24fFDAhY0
	SMLaQ6c2KAvGUpzjASXk+UwVD4nB8JHDX/xzzJaujuw3rhojNJSEb1wLqqjZj7Uu7wbbmbUVzwv
	+vX4elHg7sUR5uvv7wL7wqgjz/CKieDnJzs3EksGV6eO04IeY0EOqq5yxAIacXg0JTa9ZcDoyH4
	PA60tLb8r9uCb3Z9AfEOYReIpavO12AxEYl9pyqH4lIV4r2VfY0+B7ZS4Rl08qFIOe+3yTYZkXx
	vOPxczgxpKm0Lte39IoDGfQOrKQ8G6NR+yO/3n4MP65YLgAqtEAy/di2HD7yIJbiIsWqUs1ozDD
	wINpPeJnxl1v2tYKhrH5MKKvcqAaE8ald8uBgRWiKQVlJguc6x1n674Zh5wZaUycEfnn5bFTjQg
	==
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8804474a91.49.1794812926488;
        Sun, 15 Nov 2026 23:08:46 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8804451a91.49.1794812926018;
        Sun, 15 Nov 2026 23:08:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:08:45 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] pwm: qcom: add Shikra PWM controller
Date: Mon, 16 Nov 2026 12:29:47 +0530
Message-Id: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOp+moC/1WN2wrCMBBEf6Xk2Ug3bdILIv6HiGziRoPW2myrg
 vjvRsUHXwbOwJx5CKYYiEWbPUSka+DQnxPALBPugOc9ybBLLFSuDAAYebl128H13ZYP4RhRoim
 0MtbjTjUirS6RfLh/jOvNlyMNUxKP31J0xIwfcZst/rzu1Lsj/8xXkLnU2jsAnUOtYNUzz4cJT
 +m+m6dYvg8tMsl3E8Y2q0u0ttHaQg66rCpEAGwMKV+gA9sUta0qX9Zi83y+AOJqPUf8AAAA
X-Change-ID: 20261116-pwm_qcom_shikra-a63526bfad29
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX3I13vee8PYNR
 Ov3Ri3cSXuh6jRXTFNKXKI31yoUkzsihpJF4CR0UWXJzN7mW0wdH7TmIaiDayxpkJo/okzVRRg0
 B2VlcUbY0WIXN0jeYsmI0H6T/B0H6ZM=
X-Proofpoint-ORIG-GUID: SfxEcjDEYpxIgk7Pe66Km_iyzuwhDvfn
X-Proofpoint-GUID: SfxEcjDEYpxIgk7Pe66Km_iyzuwhDvfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX3NiTm/q/i42k
 y42ubaqaNGhNmITG0UBWyp09h/J/6XC91AUmIJvgyXMi7xc5nYutOXCJUaIajOMI2NoIG2ujuiV
 blq2sGaPHBhJOoOoRBKVr5Yis0uXMxOl2we31N1RAHwaHtzPAicbssDReihSkuY3qdSfaTDJKH3
 prbQ1yCkRZDAEauZQN4UBMmXyekbyiQs75lOR6cz2LPNoSAOW1fOepHabzWacq3pRDp+I32jhhc
 5dnKkL596NTGiTjZQaukttKUj3Vuh004KvCjqx4Ee0T6e+o8f7M5DdFIFB/O2Vcmv58Vm7+TVl0
 wGRUXPscbVHfUUyMXOKut+2QGRTq5xEz3cUMfHvYNy8BaA0TAiCczJNDVPWCQKUJ8VWGdpx+uI1
 ww/jKzDWI3yPIn4vXJxfZok6I8rwp1j1Am9VwrNsHRdoirO3zV5d8I3g3qWXvE/+CfHXKIu1GwU
 NGNiV2E5llZ9XeKwRag==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afaabff cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T5qpfgZGmVIljgUINK8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Add support for the Pulse Width Modulation (PWM) controller found on
Qualcomm Shikra SoCs.

The controller exposes a shared output-enable register and up to ten
independently addressed PWM frame blocks, each modelled from its own
device-tree child node. The driver retains the shared AHB and PWM core
clocks while any output is active.

The series contains the device-tree binding, the driver, and the Shikra
SoC DTSI node describing the controller and its ten PWM frames.

This series depends on the GCC PWM XO512 source clock, which provides the
GCC_PWM0_XO512_CLK_SRC divider feeding the PWM core clock referenced by
the controller node:

https://lore.kernel.org/r/20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com

---
Taniya Das (3):
      dt-bindings: pwm: qcom: add Shikra PWM controller
      pwm: qcom: add Shikra PWM controller support
      arm64: dts: qcom: add Shikra PWM controller

 .../devicetree/bindings/pwm/qcom,shikra-pwm.yaml   | 127 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  63 ++
 drivers/pwm/Kconfig                                |  13 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-qcom.c                             | 685 +++++++++++++++++++++
 5 files changed, 889 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_qcom_shikra-a63526bfad29
prerequisite-message-id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
prerequisite-patch-id: 25c90a2ea712aecae7404104dcc83e1c79227b6c
prerequisite-patch-id: e4b3500eec0cf6bc98edc43780b2828c28445b5c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

