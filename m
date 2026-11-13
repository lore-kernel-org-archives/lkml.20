Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538228;
	b=M8RPXeydpvBKfF8FYSvHgjQN/Dt647f9JYk+H4qCWHQrKp/cw4TNLbtIe7r5LNgguxqm
	 /PT8RNuh6Th/jF78cd2uqFCn4EGTrIS+VHAi7ryp5eyRzmw0gOpMKfbrr6F3VCyvqOvzL
	 uxhFRd7ypV87xua8LHVwcK5z9hOMtIc8qP1ohFygPBO/Z9V4C4Tzd3jnkt8Bcuu/PhGdE
	 fEcAdYWl4hCOTq6NQntR89r9MXaWqXekZ8dyoGX1oU/BK9OJ77cWFiqe1K+7fjv0M5Hy0
	 TVE4ieiY922v0PakEalwSmAFZpl+/CxVfiKxFpKvphj+BEwBgBP39t3R81Cx+wyFk+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a37g3sHH/BrPRBIbWRo3kiJCZHWLxPAU9WXyszUcBgI=;
	b=nVT77QYaomDmfZJidwRhH891OdiouTebrMmPB+Ow/pfo4q0tggIL9c01yMld2LUNsIHL
	 +uUMBFFb0hpbAP+qMZSsaAPkeXMJq2pEHfS7vYXmcQtGCOi58aEUNjK/otN782HiTXsYC
	 J3xJax8tYP5UpzIqKF4u8NQBshyO2evDRl+hQONDQufjE33udY1DvzA8Pdf3W4hFuDGEh
	 yhr749icdt8gaQxddhiamuZJhZa88E+DuryE6jtVDviJgHOuYcafDcGppI8BsLg5JBgar
	 hp1ItfeMlP56M2aeC9q+1qJyqpvZHv+R3MOMMGxzGk5nKuDiWrbQtVGQlI7P+2PAZsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duvN2bda;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEr1JKep;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6222606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6222606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duvN2bda;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEr1JKep
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KJPO1534473
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a37g3sHH/BrPRBIbWRo3ki
	JCZHWLxPAU9WXyszUcBgI=; b=duvN2bdaP/mtWi+IHKqBXT06ZX4NazHdJpSWee
	VTEmlWrYUpgopHKXhnxdqzY3zf+qsu1Gqb7sgmfQ306p4yboRteI5ANgIkFtB3cN
	owYe/XIpRvFgtT0/s4aBUzak24t2YfGTjIzAozlLWNX2QSuO8L2fu3FnQypn+lWt
	AM94hu3RSEovzJEAwEecr8HCmiFwb4Ji3Z78m/wsl89o6u+bY6+R9Wp8YtWyJ3zz
	cxZNNY1UqXZJrFjSGHS+dBaOQRGQrxv5tUH3yt7ZeIc8nCDdyrsN5X0T+dbZKr9z
	PE+SQ+hwopoCU0DIzmFziNN/d5PywKGfRsOe55kaAnqDSH0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1ba56v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed8aca9775so4139795ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538226; x=1795143026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a37g3sHH/BrPRBIbWRo3kiJCZHWLxPAU9WXyszUcBgI=;
        b=MEr1JKep5fZLegxQDxktwnALhk32B9VDL8NU7aiG+kxyLAsA168O1ADYVRMZowfV04
         8q/U9KUwt3ipTBPp3sEJWgtZqfbcJcxsVFbp9oaETbIa5P6b9hYfOvaVvYxb7lyO3qwp
         1s0qzky0nts++vPwhoKKXaIBuRb/8UFqct1EB75781KA+h9q8QOHTTdS5/P9vS+q1PDf
         GcjGa5EoTffN8qDHuwsNV2Rpdv7O/9G8L8ACNXIjJiz3tYd5nINAvT+GwhliPHp+j7z0
         y00pK9wyKuBhqEUIyGkDSv0oA+X+bkfwz/Lof/ha3pePKjeSi35a6EYyQqj8uEGeTewP
         I/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538226; x=1795143026;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a37g3sHH/BrPRBIbWRo3kiJCZHWLxPAU9WXyszUcBgI=;
        b=ThBgygx/CQSCsjaAbrS1CrfXD6K9ZrrA3O3hVOFM2DwkH81Xt0Kul6/fXTvTGXh1yk
         H4eFRR+kkNhv9cQIckUIRHDQO+CBBtTUwaqpM96nHbKA5ZwlvcO1hJzXlGBF+cX9MVtF
         AeZqrqM/fxEFViYNB3JrOYVGKrLk8mSeXPg0rhQX2Vh3A6VXgokBSkAwUL3ME3Ro2CmF
         H1gcMHnlo85Xth3Ym+b4j1yrsE9dzKJt/b6fUYNZ5zPPCtyVdKAp2vsrFo3SAEZZyhEE
         YgU+B47zEBALrbx3IQfHfdIJL5ZnmMTz0zubN/jXoMmNczWLpv+euvRyXnEeobk2rIXN
         KVVg==
X-Forwarded-Encrypted: i=1; AL+hErGXKSIEQsuD2wkAKaMVe9ZXNwqpcM+coS9eNxnPgfFOCFv72dYrnz3wTDE8p27DVxvTF1dFq/fk3Zzjc+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V0k/V8WJrTEhZLlSfLJmkBcx5xRaE2OSqsWqT9chgsNI661+j
	SAVrseWfptPm65zc0Urvl/4wtP1Sfrn25wg0OUdKaa8IrB8f8LaZE5ruu+ZlZ/QB7MIyL8bfALF
	i+p+xDZBtVQTZvcVIYsUVTwAv1uIjRgynjOkTpkC+YV8qNcYaUkfbsv987nHO2/S/XOo=
X-Gm-Gg: AYBFou3vmcEN0f1u7JUd3mvyco1n+bPQQi13Sa7C1dIk4+7c13bt79fduPJ+HUWEG5j
	53mWMsBff8fs2lRYw8DZzx9Byw5C3+eCBIJ/w4FS8LJJAL9J/PKLqJGCPiZ/NBAPrWw6Ep+YXLF
	C/3s4HqPTeoySFYHMrPHdxPRRf0g/gqVFfduQ27YSfrEdDycI0vO7zJWlV7Rl3RpXO8O+2bIqkU
	nBFx4HCPUrcx1gor44YyKNevFCuw8qIfnlyttY3+kCHUAesT5w3WpOGVX+Dfu4lfMMCNMwUQLOQ
	xPOzrwaIcngWXjzWoXyeexzSf3LtYpxqtiLiMWL/xL+YyZhP9p/YUy5PIjtBB/A4TTRC+/E5jF1
	QL+XY2Zk0ARpdhOmnze6tmtSdNJKQ463YEiMo8j7chw6FRS1wdoeAvGoqhYDpplH3xXV/7DqIWc
	dtzKDTdvU=
X-Received: by 2002:a17:903:1905:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2edf1e7b461mr33349375ad.6.1794538225762;
        Thu, 12 Nov 2026 18:50:25 -0800 (PST)
X-Received: by 2002:a17:903:1905:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2edf1e7b461mr33349135ad.6.1794538225065;
        Thu, 12 Nov 2026 18:50:25 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:24 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 00/10] Provide support for Trigger Generation Unit
Date: Fri, 13 Nov 2026 10:49:25 +0800
Message-Id: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af67af2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=xzigjciHnW99mS1hBE8A:9 a=QnAfVtFXjStKg8Hu:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: psNq_ObUahdB4qsICKCICLnxCW0NwzxQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX1Uf0ClcTeC/K
 plPYaZCKrmSO4xVM8eVqXKKC0r+0jaoWXCW7vgiv4WY7KcyOy2anFD//Fyf3LShpmS+K5khVUQZ
 3IC7TlRwAlNRSWaqwfWUmY4fIz931GA56zNKvPmKntsXH0TSnIoHuiuuA0xO+gPkMKv/gOYhGv8
 B4y9w0qONCoTP1lEUvmFmPHpS9jc4tk6DqOP3xdEIgthHKd9m+tJPHqo8bNNK/hykYoNCXIOCMf
 YaD4z+eg28D9j1+xqHP8TZBHREmsz9RrusbHfyjqxasXkrBWHGY0flTY4Gj7SsqBZt6cCIwPJ3u
 LwH1n3n6c7cPkcvnJHzbDzoOKkEsmUfUHc0iFnDp2uG2TSwLuE7UECrXiqtJz/vxW/JqcdfqhMn
 VK7nHgHY4K77uqPZYy5in2WFZBr4MxMj/yOqIBexO9VarRhttGuALP21Ytu/JtVsQ1Xbk/0Rus1
 880zXpXhNDRsdFFaBxw==
X-Proofpoint-ORIG-GUID: psNq_ObUahdB4qsICKCICLnxCW0NwzxQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9dt4n41CZF/t
 w1xh7ZLylFmn/7pRksYnydqebAItnWlvdyWi4YpzqHLE5OpUtcAmEC20XqZy02SaqpkDSJZfT0n
 aI/kr8TfpBYnRTFvpd13JwtXzcIiFiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

We propose creating a new qcom directory under drivers/hwtracing
to host this TGU driver, as well as additional Qualcomm-specific
hwtracing drivers that we plan to submit in the coming months.
This structure will help organize vendor-specific implementations
and facilitate future development and maintenance.

Feedback from the community on this proposal is highly appreciated.

- Why we are proposing this:

TGU has the ability to monitor signal conditions and trigger debug-related
actions, serving as a programmable hardware component that enhances system
trace and debug capabilities. Placing it under drivers/hwtracing aligns
with its function as a trace generation utility.

We previously attempted to push this driver to drivers/hwtracing/coresight,
but did not receive support from the maintainers of the CoreSight
subsystem. The reason provided was: “This component is primarily a part
of the Qualcomm proprietary QPMDA subsystem, and is capable of operating
independently from the CoreSight hardware trace generation system.”

Chat history : https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/

Given this, we have been considering whether it would be appropriate
to create a dedicated drivers/hwtracing/qcom directory for
Qualcomm-related hwtracing drivers. This would follow the precedent set
by Intel, which maintains its own directory at drivers/hwtracing/intel_th.
We believe this structure would significantly facilitate
future submissions of related Qualcomm drivers.

- Maintenance of drivers/hwtracing/qcom:

Bjorn, who maintains linux-arm-msm, will be the maintainer of this
directory — we’ve discussed this with him and he’s aware that his task
list may grow accordingly. Additionally, Qualcomm engineers familiar with
the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
will be available to review incoming patches and support ongoing
development.

- Detail for TGU:

This component can be utilized to sense a plurality of signals and
create a trigger into the CTI or generate interrupts to processors
once the input signal meets the conditions. We can treat the TGU’s
workflow as a flowsheet, it has some “steps” regions for customization.
In each step region, we can set the signals that we want with priority
in priority_group, set the conditions in each step via condition_decode,
and set the resultant action by condition_select. Meanwhile,
some TGUs (not all) also provide timer/counter functionality.
Based on the characteristics described above, we consider the TGU as a
helper in the CoreSight subsystem. Its master device is the TPDM, which
can transmit signals from other subsystems, and we reuse the existing
ports mechanism to link the TPDM to the connected TGU.

Here is a detailed example to explain how to use the TGU:

In this example, the TGU is configured to use 2 conditions, 2 steps, and
the timer. The goal is to look for one of two patterns which are generated
from TPDM, giving priority to one, and then generate a trigger once the
timer reaches a certain value. In other words, two conditions are used
for the first step to look for the two patterns, where the one with the
highest priority is used in the first condition. Then, in the second step,
the timer is enabled and set to be compared to the given value at each
clock cycle. These steps are better shown below.
    
              |-----------------|
              |                 |
              |       TPDM      |
              |                 |
              |-----------------|
                       |
                       |
    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
    |                  |                                                 |
    |                  |                          |--------------------| |
    |    |---- --->    |                          |  Go to next steps  | |
    |    |             |                |--- ---> |  Enable timer      | |
    |    |             v                |         |                    | |
    |    |    |-----------------|       |         |--------------------| |
    |    |    |                 |  Yes  |                    |           |
    |    |    |   inputs==0xB   | ----->|                    | <-------- |
    |    |    |                 |       |                    |      No | |
    | No |    |-----------------|       |                    v         | |
    |    |             |                |          |-----------------| | |
    |    |             |                |          |                 | | |
    |    |             |                |          |      timer>=3   |-- |
    |    |             v                |          |                 |   |
    |    |    |-----------------|       |          |-----------------|   |
    |    |    |                 |  Yes  |                    |           |
    |    |--- |   inputs==0xA   | ----->|                    | Yes       |
    |         |                 |                            |           |
    |         |-----------------|                            v           |
    |                                              |-----------------|   |
    |                                              |                 |   |
    |                                              |      Trigger    |   |
    |                                              |                 |   |
    |                                              |-----------------|   |
    |  TGU                                                   |           |
    |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
                                                             |
                                                             v
                                                    |-----------------|
                                                    |The controllers  |
                                                    |which will use   |
                                                    |triggers further |
                                                    |-----------------|

steps:
    1. Reset TGU /*it will disable tgu and reset dataset*/
    - echo 1 > /sys/bus/amba/devices/<tgu-name>/reset_tgu

    2. Set the pattern match for priority0 to 0xA = 0b1010 and for
       priority 1 to 0xB = 0b1011.
    - echo 0x11113232 > /sys/bus/amba/devices/<tgu-name>/step0_priority0/reg0
    - echo 0x11113233 > /sys/bus/amba/devices/<tgu-name>/step0_priority1/reg0

    Note:
        Bit distribution diagram for each priority register
    |-------------------------------------------------------------------|
    |   Bits          |       Field Nam   |    Description              |
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    These bits are used to identify the signals we want to sense, with
    a maximum signal number of 140. For example, to sense the signal
    0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
    represents 1010. The remaining bits are set to 1, as we want to use
    AND gate to summarize all the signals we want to sense here. For
    rising or falling edge detection of any input to the priority, set
    the remaining bits to 0 to use an OR gate.

    3. look for the pattern for priority_i i=0,1.
    - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg0
    - echo 0x30 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg1

    |-------------------------------------------------------------------------------|
    |   Bits          |    Field Nam        |            Description                |
    |-------------------------------------------------------------------------------|
    |                 |                     |For each decoded condition, this       |
    |      24         |       NOT           |inverts the output. If the condition   |
    |                 |                     |decodes to true, and the NOT field     |
    |                 |                     |is '1', then the output is NOT true.   |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
    |                 |                     |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
    |                 |                     |Conversely, a '0' here requires a '0'  |
    |                 |                     |from the comparator                    |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |OR logic will be actively              |
    |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
    |                 |    (n=0,1,2,3)      |this particular condition.             |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |will need to be '1' to affect the      |
    |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
    |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
    |                 |                     |requires a '0' from Priority_n OR logic|
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will be actively             |
    |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
    |                 |  (n=0,1,2,3)        |particular condition.                  |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will need to be '1' to       |
    |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
    |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
    |                 |                     |a '0' here requires a '0' from         |
    |                 |                     |Priority_n AND logic.                  |
    |-------------------------------------------------------------------------------|
    Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
    and `0x30` here to activate them.

    4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
       are met then the next step will be step 1 and the timer will be enabled.
    - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg0
    - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg1

    |-----------------------------------------------------------------------------|
    |   Bits          |       Field Nam   |            Description                |
    |-----------------------------------------------------------------------------|
    |                 |                   |This field defines the next step the   |
    |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
    |                 |                   |Condition and Step.                    |
    |-----------------------------------------------------------------------------|
    |                 |                   |For each possible output trigger       |
    |    13           |     TRIGGER       |available, set a '1' if you want       |
    |                 |                   |the trigger to go active for the       |
    |                 |                   |associated condition and Step.         |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause BC0 to increment if the|
    |    9            |     BC0_INC       |associated Condition is decoded for    |
    |                 |                   |this step.                             |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause BC0 to decrement if the|
    |    8            |     BC0_DEC       |associated Condition is decoded for    |
    |                 |                   |this step.                             |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will clear BC0 count value to 0 if|
    |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
    |                 |                   |for this step.                         |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause TC0 to increment until |
    |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
    |                 |                   |Condition is decoded for this step.    |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause TC0 to pause until     |
    |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
    |                 |                   |is decoded for this step.              |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will clear TC0 count value to 0   |
    |    1            |     TC0_CLEAR     |if the associated Condition is         |
    |                 |                   |decoded for this step.                 |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will set the done signal to the   |
    |    0            |     DONE          |TGU FSM if the associated Condition    |
    |                 |                   |is decoded for this step.              |
    |-----------------------------------------------------------------------------|
    Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
    achieve "jump to step 1 and enable TC0" once the signal is sensed.

    5. activate the timer comparison for this step.
    -  echo 0x30000  > /sys/bus/amba/devices/<tgu-name>/step1_condition_decode/reg0

    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
    to enable timer comparison.

    6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
       has reached the given value.
    - echo 0x6 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/reg0

    7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
       i.e. when the timer reaches 3.
    - echo 0x2000 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/default

    Note:
        1. 'default' register allows for establishing the resultant action for
        the default condition

        2. Trigger:For each possible output trigger available from
        the Design document, there are three triggers: interrupts, CTI,
        and Cross-TGU mapping.All three triggers can occur, but
        the choice of which trigger to use depends on the user's
        needs.

    8. Compare the timer to 3 in step 1.
    - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step1_timer/reg0

    9. enale tgu
    - echo 1 > /sys/bus/amba/devices/<tgu-name>/enable_tgu
---
Link to V16: https://lore.kernel.org/all/20260730080704.2903540-1-songwei.chai@oss.qualcomm.com/

Changes in V17:
- Reuse CS_LOCK/CS_UNLOCK/CORESIGHT_DEVID/CORESIGHT_DEVID2 from coresight.h instead of duplicating them locally.
- Replace the dynamically allocated value_table with fixed-size arrays, dropping devm_kcalloc().
- Add TGU_*_COUNT() macros for region sizing; remove the redundant memset() for condition_decode.
---
Link to V15: https://lore.kernel.org/all/20260701055529.445819-1-songwei.chai@oss.qualcomm.com/

Changes in V16:
- Fixed enable/disable race and PM refcount handling.
- Fixed sysfs exposure before driver initialization.
- Fixed priority allocation and access races.
- Fixed uninitialized return value in condition decode.
- Fixed sysfs attribute naming collision issues.
- Added ABI documentation for the default node.
---
Link to V14: https://lore.kernel.org/all/20260417073336.2712426-1-songwei.chai@oss.qualcomm.com/

Changes in V15:
- Add a maintainer for "drivers/hwtracing/qcom" in MAINTAINERS
---
Link to V13: https://lore.kernel.org/all/20260402092838.341295-1-songwei.chai@oss.qualcomm.com/

Changes in V14:
- Fix some typos and formatting.
---
Link to V12: https://lore.kernel.org/all/20260317032639.2393221-1-songwei.chai@oss.qualcomm.com/

Changes in V13:
- add ":" after "KernelVersion"
- add an enablement check in the enable function to avoid increasing the counter each time
---
Link to V11: https://lore.kernel.org/all/ee1ca8e6-8e5f-47d8-8a24-f904ee2fc6d0@oss.qualcomm.com/

Changes in V12:
- Remove the in-ports property from the bindings, as this device is decoupled from CoreSight.
- Update kernel version and date.
---
Link to V10: https://lore.kernel.org/all/20c5406d-3e9f-4fdb-84ba-4cbe629c79b5@oss.qualcomm.com/

Changes in V11:
- Change the names of members in drvdata: max_xxx -> num_xxx, enable -> enabled
- Use "FIELD_GET" to replace "BMVAL"
- Use devm_kcalloc to replace devm_kzalloc once create members of value_table
- Keep a consistent \n above return
- Keep reverse-Christmas-tree style
- Add checks so that the enable and reset nodes only accept 0 or 1
---
Link to V9: https://lore.kernel.org/all/20251219065902.2296896-1-songwei.chai@oss.qualcomm.com/

Changes in V10:
- Modified code formatting based on Jie's feedback to improve readability.
- Applied inverse Christmas tree order to the variables.
---
Link to V8: https://lore.kernel.org/all/20251203090055.2432719-1-songwei.chai@oss.qualcomm.com/

Changes in V9:
- Decoupled the tgu driver from coresight header file and registered it as an amba device.
- Retained Rob's reviewed-by tag on patch1/7 since the file remains unchanged.
- Updated the sysfs node path in the Documentation directory.
---
Link to V7: https://lore.kernel.org/all/20251104064043.88972-1-songwei.chai@oss.qualcomm.com/

Changes in V8:
- Add "select" section in bindings.
- Update publish date in "sysfs-bus-coresight-devices-tgu".
---
Link to V6: https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/

Changes in V7:
- Move the TGU code location from 'drivers/hwtracing/coresight/' to 'drivers/hwtracing/qcom/'.
- Rename the spinlock used in the code from 'spinlock' to 'lock'.
- Perform the 'calculate_array_location' separately, instead of doing it within the function.
- Update the sender email address.
---
Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/

Changes in V6:
- Replace spinlock with guard(spinlock) in tgu_enable.
- Remove redundant blank line.
- Update publish date and contact member's name in "sysfs-bus-coresight-devices-tgu".
---
Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/

Changes in V5:
- Update publish date and kernel_version in "sysfs-bus-coresight-devices-tgu"
---
Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/

Changes in V4:
- Add changlog in coverletter.
- Correct 'year' in Copyright in patch1.
- Correct port mechansim description in patch1.
- Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
and set them through reading DEVID register as per Mike's suggestion.
- Modify tgu_disable func to make it have single return point in patch2 as per
Mike's suggestion.
- Use sysfs_emit in enable_tgu_show func in ptach2.
- Remove redundant judgement in enable_tgu_store in patch2.
- Correct typo in description in patch3.
- Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
per Mike's suggestion.
- Remove tgu_dataset_ro definition in patch3
- Use #define constants with explanations of what they are rather than
arbitrary magic numbers in patch3 and patch4.
- Check -EINVAL before using 'calculate_array_location()' in array in patch4.
- Add 'default' in 'tgu_dataset_show''s switch part in patch4.
- Document the value needed to initiate the reset in pacth7.
- Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
- Remove dev_dbg in 'reset_tgu_store' in patch7.
---
Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/

Changes in V3:
- Correct typo and format in dt-binding in patch1
- Rebase to the latest kernel version
---
Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/

Changes in V2:
 - Use real name instead of login name,
 - Correct typo and format in dt-binding and code.
 - Bring order in tgu_prob(declarations with and without assignments) as per
Krzysztof's suggestion.
 - Add module device table in patch2.
 - Set const for tgu_common_grp and tgu_ids in patch2.
 - Initialize 'data' in tgu_ids to fix the warning in pacth2.
---
Songwei Chai (10):
  dt-bindings: arm: Add support for Qualcomm TGU trace
  coresight: Move CS_LOCK/CS_UNLOCK to linux/coresight.h
  qcom-tgu: Add TGU driver
  coresight: Move CORESIGHT_DEVID to linux/coresight.h
  qcom-tgu: Add signal priority support
  qcom-tgu: Add TGU decode support
  qcom-tgu: Add support to configure next action
  coresight: Add CORESIGHT_DEVID2 to linux/coresight.h
  qcom-tgu: Add timer/counter functionality for TGU
  qcom-tgu: Add reset node to initialize

 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  60 ++
 .../devicetree/bindings/arm/qcom,tgu.yaml     |  71 ++
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/coresight/coresight-priv.h  |  20 -
 drivers/hwtracing/qcom/Kconfig                |  20 +
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 847 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 179 ++++
 include/linux/coresight.h                     |  21 +
 11 files changed, 1215 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

-- 
2.34.1

