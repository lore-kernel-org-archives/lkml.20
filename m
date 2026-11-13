Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580562;
	b=CyltWdq13vJi8IBGMU3pqOV1GcSzjA65WxVDSSw23R7bUBjtHZGLNWULrSkl4c8pwCIY
	 z1T4axTveVY/jdae3QmWsYMKfZVTIoWUaKqpura05/YY5EX+WvU/q9n41cY4uw0+8MXOy
	 pRSF3aPhAs8v/T+LMW3/8wuXZNj+SwAwHP5Ouaw62m9bc2yHrTly6JEMYmO/aEeWLV8OT
	 rfnbl9Enb5TSpoPHLGRbJGJXE1UovNMIZVx/nVvyVLayKr/YuZSBBPS1BxiUMSaIT1t/z
	 FGbhvwbXqxzPuvPQHrmyo7iCZ6JZYDmq44jwtV3UJrentV1anlwTItDKymA26oiTd7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
	b=mVa0bImVtQsqXXmaYmMwVIfqh53BwN8yhB7dLqwuy3xnuBhB3N/w6kOeqn4PxpuLLEnL
	 vDs04vikVwr8tY+2yxdxhXa91XVI+byq7gg+VUvppJaKeVm3OcgHo8ITYbXEVNuNM2QSy
	 Bv7dwIaHPUMBjSkkuUCANTz6w6355MXgWcbTm/mQ1JNxNgOu3j0R9HhrQec/uxjmnivJD
	 LcEiwEPcbPAun/Jx6JUg5GZwbJfBLR6Gifzh+WmyrKgQUaBRoC5Q8afPQkGXvP1SiO64L
	 Zc3y+5OPAsLygmkKhIRZ2wP8KDyORGJI3zXcTksfRDPiI472InWT55cClbB8vaHcpSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxls12BC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxpF8k5M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E891606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E891606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxls12BC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxpF8k5M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKQWa3126271
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=; b=kxls12BC/9ybMijj
	R/yv3Lr8wUQxobhd0fgl5nEnfr6KyG9b6pff6WwhWO3ZCkGqig0W/RAf5o4P0871
	tSdHCf48qtBSzX6S5kP16n/2pezZ1uMFy3RXq87xxnjpzxrGkXhDLy3MpFF4bnAE
	7Osov5+6P5Hz64cwA6LeUrSWt6D7s1RQOj4fPfEF3/A54FfqJqvgdXbh19yZ8J9r
	1fWKFerXbz+5q42S9NHu0HHk+N36ne7Hzys8XYUQThNbN2uk31Ykx5rQsrciG62b
	45+KKsgIy+n5nh/SzlwHfyJaQ1zT+Tt5bhlA03KmH60W7Z5BS3YXfFa0VN/XjcxG
	m5xuNA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bceqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so1323194e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580560; x=1795185360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
        b=LxpF8k5M3czBtCGqcdZliENr0XbS5UUzUSOujKzVAXK1v6oEczDMkyx85Lv/3LFzRs
         lVdtqoy0NfMLc7jgumS8zfhHcWYz1rbb/9mwmMqSbwP6WIhd+o22TlMx5F2pZmOpeCRH
         ju9ragy22PtS5wNCgZMHQjtf0z2QVRDRhQ3J1rRSKTF3VrZ80v08CKJ2CQ3s8niJbtSC
         OomrB/TfegDV1NzBDMehmWVnRlp3CvomGOjuBCAUSeCWIY5mDSq2MP6NuVrvyMtUDNdD
         ICY9ayKxjbWR6MRAc6WRjZPuN/qzAwQwMbeOX4OvYTSymGCKaQibCk0L/tNeJevAJ+YZ
         73gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580560; x=1795185360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
        b=C8aXQRziJfCXqW99RJBvs+iO52ihkAMZMIoUsNdzX7RaDUyCt1BZbpdU1lDP6fzgmY
         niwIEOgHl7Emc6hK7CMh5sy+bCN2C9+BEyMZvYA5wyRBpPAx2hgq0YH0nkspnQWYor5Z
         B6LpSJbdCyZAiA6gWn+5aeSM/KsxArZpzBoiXAGhrhuyo6Ko+Yvrq0ZJsLUDxvb4fNjy
         Tdu+3TiO4QeqqWVCkTyqb3+Dc3dVvGEsCZ4ulKzXBrmDG+I4fP5FuUL4SzIwH3BgcNVE
         M6BMo58NmUO4skUUiFXyrd0ODJtwnpazGF8ml2C/bhFw9tsbfEOdiTFN19O8Xg8R/oUF
         ttyw==
X-Forwarded-Encrypted: i=1; AL+hErGw/GckLa6LzbytWapLH0m/Idyycslu4ctlY1hs4n4fHFHiK6v5i9igNp8U1fs+jTMgCiNIOV1dUJONyPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JL366jWYVsVqawHgwkS8X5EtICQyYqFyYO+Ry4LLfSt6TNzU+
	EDqJ18ZdOpFmvuo9xtzLnvwhxON2hFbNSoXDxajtb9FAKXOTtmipmjgc9P6lGqIirGb035G9bs8
	CM5ZY27MW1RUmlq83U/zlo1p2YDxFSbV8BmLe48Flt26hQYpQh6OdrVBXEZyeQRWG37s=
X-Gm-Gg: AYBFou07hl9wPcDRAvnx7Q9uA1S1mvRTXgZTi/sqvQZ2idPtlCoylQ2OG4sJIcPHBbX
	hUDkSxqW3yyepFSh/L4RgT4eQW+Y2faLIo6ypSlmBaMhL8esD3gSK4L24B+E8B26yge/wn6qYE2
	E6DGWetyrd1N9LImsR0ygT4zMNSGgySfZyU4zup/QM6RY7ZsmFZWXrN9StzCeaxX8U35CS/7qqU
	gOX26Z+CeYN08Zv9675SFP8QqFcncjXw2LjE+hAYAg5tPVZqq4SQaK39NGxyq6+8WCEvRzVC3qC
	3/lWxsl/3ohahFXAPohERhmq99ihB8Pt1QapHjOJX2og5Uk1yQUidZpacXdZWRjwsmZ9osqiVAA
	dSP8Br4yxP+W6xLyZ9RE0wFqIYJfe6yVlP8nbKQZCLyA9e4aYUzRMuMGwlWTGCVF7OvVzfuw/2s
	Qm
X-Received: by 2002:a05:6122:552:b0:5ea:e17d:fc73 with SMTP id 71dfb90a1353d-5ee3466f8e9mr884655e0c.3.1794580560048;
        Fri, 13 Nov 2026 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6122:552:b0:5ea:e17d:fc73 with SMTP id 71dfb90a1353d-5ee3466f8e9mr884648e0c.3.1794580559595;
        Fri, 13 Nov 2026 06:35:59 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34d4ed43sm1387544e0c.2.2026.11.13.06.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:35:59 -0800 (PST)
Message-ID: <315d7bf0-352e-4dd5-9779-89e8ea75427d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:05:51 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af72051 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yyvnBEBB80qBeyI6t6IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: tboeBM19oItsCOkg2b3rEv_aXZF0zUaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX1enRuKEer5DM
 tUXBO+svWwmS28s2uKZ5rD9CVc/Adk5t6cdAJ4YrO+p28QICSDw6qZZKuDkZLrw6pRGq3Dkx6tp
 a5KY0wNL1nvzWSGcJd+v6iBFiH502VIpWGCQFu2vC/hnJZN5HUMoGaaTVJyOmJ6ch0orZa24pEA
 Uh6D/XncK6Rw6p5e8Yh8hSJRyrrS5Oy1M1uQyMv0tOVJy2Y5vxSxcAn0iUn7GhrqRBhZ2XQWxEs
 4EBgv04B5y/5qa+vY1FEwnV8I/B+IH+UTIbwTtBv8+wy+6x1Es5xtaoEpwp5kweAKUgP2vBSh5R
 fnr5yeom/qUJs103FR2yulGR/aBqlo8IJ4jk6z/tZxa4V/7yL7tG5MQgt/iXen3W7W8hdiUrrTN
 sYdoKP/7lBf5wLd/D7HOQbrUjAmWB9ws9khMS4rXxvB+xI2rYvUogUzGg6bESqUNi+1djtZ4js0
 8DH1atD+LYJ/EBStf+w==
X-Proofpoint-ORIG-GUID: tboeBM19oItsCOkg2b3rEv_aXZF0zUaC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX8dQ4/g6QsEXB
 n9w8n7PtemdiTxle6pQlpFJ5QgJSdsJhOjkop1JO5pFWp+QkNl/LjFAijTurc2ZdYiGYC6LlI7P
 72qdcpvErBf6sBwp2ULBpR6V8nStpSU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On 11/4/2026 7:33 PM, Komal Bajaj wrote:
> All existing Shikra EVK board variants boot Linux under a hypervisor,
> which means Linux typically runs at EL1. For EL2 boot without the
> hypervisor, remote processor firmware IOMMU streams must be described in
> the DeviceTree consumed by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> produce -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular dtbs.
>
> This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
> needed for Shikra EL2 remoteproc SMMU mappings.
>
> Komal Bajaj (2):
>    dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
>    arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
>   arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
>   3 files changed, 37 insertions(+), 1 deletion(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

I  have addressed these comments in v5, which is available here: 
https://lore.kernel.org/all/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com/

Thanks
Komal

> ---
> Changes in v4:
> - Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
> - Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
> - Add WiFi firmware iommus to Shikra EL2 overlay
> - Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com
>
> Changes in v3:
> - Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com
>
> Changes in v2:
> - Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
> - Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com
>
> ---
> Komal Bajaj (3):
>        dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>        dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>        arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 +++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml       |  5 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 12 +++++++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 12 +++++++++
>   arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
>   7 files changed, 75 insertions(+), 3 deletions(-)
> ---
> base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
> change-id: 20260918-shikra-el2-ea8969385c3c
>
> Best regards,

