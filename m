Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919AE54705C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714652; cv=none; b=UMNXQAHD5iuXv2ZKLasR191YMXi1sJjaF5LhYhDIvwtlrHbka1EIDNwvxOEU//g8FrBHshsIMryph+mH83kZEqTsHJe6H5s/WjaEj36G03L3vNNyhhvVEK5SFT7k/W1kaZfLtYo6JcDWHHKHbauQ5sD3BHSa9ulZ++o9dqFXfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714652; c=relaxed/simple;
	bh=WmfAZW7sVXMa/GOifNO3h2xf0LgQ8zx7piA8+FgMS9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tutP69050iymmShb0AQlnMuUob6lHXDU75Bw8Kzdz00B1wqfnwZI/EUtbSwEwlFR2TaENdmTfqZNZIonkYNxf/cvenO5bAGwqu93wNKetAwemqYqcxdhlAf447LGmbf/0+DM1bvz6Xgqe/qjetwr8fD6Gb1VrfRCHQSkHQ0fzCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuPsA3fL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGvJkrfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuPsA3fL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGvJkrfr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xoku3254752
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1FLM+CkV68zd/McNTCIwsQNIBUX6pTcu5N0rHLOGSs=; b=SuPsA3fL4KFS4RdR
	SGRtCc2ecCPNmAl9AWeFSBpXmeVYcikNvk7EcCtwcSYh241UaFUII7FsHpfhtTSS
	aNAEXoCaKortPpQe0Ib/E2cDFVeU/E5Bk3oL35M+t4gLPvEdR89FP6SnjNG8QDgZ
	WgAK2nWRZ1KjWc4hA4Lnpu+P/q2Ek4n4tZoGrxXpamsfN3Q072DT6DmHerVW4BkG
	nqtfVujj/xMYz2p14oe/+kbsBjxQk3lAxeKx6PZ8vKFz+6eg2eoQH83sUay2Ibsv
	RiCWhsrst/etTZuLrRRaLoK9PMNTB2JysXNF7/lbNHamqZXTR4Ai5j1SF3rMY79T
	JCLVgQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5jv65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:57:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso6831975ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789714647; x=1790319447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1FLM+CkV68zd/McNTCIwsQNIBUX6pTcu5N0rHLOGSs=;
        b=fGvJkrfr67wRYTP93XoOlo3AAv8e7ob/gLEtXzQHXg67QqAcITwjDnkqzkqPKJ1IiZ
         DMbgO4ZDiZnfcNlHXFh5NJmtzyPna2dpGejzZ9b8xevgw3SQ5hihxQvDxBWI3JeMpwO6
         fjLX7ajsfYwfku4vmExSvm834p8LZJ38cmRA4zZw7UeKWPxmrsWZ/IaH6f6jRyL4PLHA
         WBhRC+VqAn1an15IsDWGIpuzHOA0YnRr//7vaMEYwDzFjD0t4lfhzgcgHIfaoSxHq2Iw
         PHZnIzgWkFL2L+c7oZrBw8e8q+lWPaGghpJOA6o/05X5b3cZFFDpaf8y85GzsK3goFrV
         AAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714647; x=1790319447;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1FLM+CkV68zd/McNTCIwsQNIBUX6pTcu5N0rHLOGSs=;
        b=WNBn2o5UjM/t/eRka18jwieHhlvLIib7pj36esmaOvIYB68fGeunCHE8DR5YqYJatj
         4KTJFZXT3trQSLTuLl4npUAugAHQZAYIpTf8DZbO5J+CIZQjCEcEVgrXI/rCFz0WE9J4
         OV7mkuTe2naEvbarf+flzO6W6d0LLZdsz94gir1/q11cr0b6opmLb8G3fbUjt14L1yE2
         LHzBwhnX0MVsEBJdND/dggJiKgsI8ASoPoRqX0d7nxTje7TQmGxVaKECm5aDMmOLphp/
         7Oncmq3WeaBd6psIJmwmoziixsEAMjRoymvQIVOlGr4l5Hnx8oM61N8UxLi+wIuKZsnI
         mKjw==
X-Forwarded-Encrypted: i=1; AKwUvBwZFFuo/ihGGmd/AAUSuEi7p4eHugSr3LQShsJ9lBNhKkcSg3ECTlbeHQe7TILkpCHEaYO8f9mZinLz0vg=@vger.kernel.org
X-Gm-Message-State: AFuF++kyu6hqlGYGtsGrTGBe2XFiEwCG20vTMFEKr6NaXtnz9xgt+HIg
	13c5S10KfovvJuczLub7TuR/sXls822p7VzxeAjijlmD9lpwMqQXpr9gQcNl2wKSxgVTllfknp5
	MI+6z5ZFjZU9di/gzpf3DApAi86978CStQ2d3n9WohCpBj64iW7t4ywKlqzrwYk2Mbd0=
X-Gm-Gg: AYBFou3nyZur0I3yVPcBqAKIqO5Qg2NWA0i7F7z7DAPGLz4VbeQTWc1gkIAwPxRQwt+
	3hxQRBfkYtCjyS58tZSS/SQjxIJ2DToZdUOKenSLkB211VLSRnWUwcuZxGK2gQrnLWpZMSqXiXV
	7pROOuOdRZLbpuJCqFcSbz2Gow1zYdW9XCNcSfx99H++m9ciP68OXmbTyxi2O5Z/y0faG9xUP1n
	R5u47Q0HJD4vFFP3ysxqUN8X9guged1fE0AlEPemDppmaktEDze3rkgP3pcUN50lp6AaJ4nYhdu
	UJW0HbtQnz8sqlMLb0X3KYxQ2FPrLfrlMm/ldyWUGHbOlAmo0tVYqiZ1Tq9OJyPf02yP4euM+XW
	QJYhYteOM34pAeSgekk7wXfILdS0eJQHs
X-Received: by 2002:a17:903:19ed:b0:2dd:319:c9ef with SMTP id d9443c01a7336-2ddb1ab3349mr35050905ad.3.1789714647511;
        Thu, 17 Sep 2026 23:57:27 -0700 (PDT)
X-Received: by 2002:a17:903:19ed:b0:2dd:319:c9ef with SMTP id d9443c01a7336-2ddb1ab3349mr35050555ad.3.1789714647078;
        Thu, 17 Sep 2026 23:57:27 -0700 (PDT)
Received: from [10.171.1.18] ([106.221.176.116])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2890b915sm1950432eec.30.2026.09.17.23.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 23:57:25 -0700 (PDT)
Message-ID: <ad600338-dc87-dcc4-f1c9-8cbd53a1dc46@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:27:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 0/9] media: iris: Add support for glymur platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-dangerous-illegal-honeybee-cf479a@quoll>
 <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5MiBTYWx0ZWRfX/+Z/As9mIDl9
 SYkFu59gJ0XltKz/fEcFYovI2KymBwlZoYJEKKIyy17wFMzT9sZxJo4Yv6g8zddD2xYzMzmAonB
 C8hON+H8Fm3n96xyYcl7FwAiaXuHUwDBlsdCDmFTqRtQ3iD/CEw/i+kK5pwBdEI/b8PyjyoOCR0
 bmkwajiPWCErowxwPT+2lrNDqPNoEIYoTzys1DgV+wqtOT2lfujd3ojoXU6LA79DcFlt2qkpl+/
 ljfhKmJxj4SCa/XDVHwUE1lUTmNrPbfNM7pbvBiRSbrCJWasgpxVv364nslNk+Zg19B09HMlEUP
 uK08Fnzc58ao9CcoEiwKZA3GXpZm/hb7bv3sqIqSjvaLaFaIz0LSfj10u+Tcxx31LL1+jHPnSsJ
 4r7FKs3Hs7qhL1w6tKlKnn4XykqxPDomARqQPBgMTabNZiMqymO+rXqFT728fSJReRVjgW26flr
 oDiGJK5lAFCioFvONNw==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aace0d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LX4K7wk6A3+k0W4S2WE0Kw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7bky9te5nA2tsC3mpIgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YXDsdVrdkKQVA4WNGZrdCwRqD9ejhriK
X-Proofpoint-GUID: YXDsdVrdkKQVA4WNGZrdCwRqD9ejhriK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5MiBTYWx0ZWRfX4Rj0xZ5fLbVu
 vzuGJuhsPlZzrZTDTj1OQ354NpcxwJcG1labFs79ZTKLFHE3bJ/vzUOImSi8SG1kFkBBxbYG4iK
 U5sR6QzxHqMXgN7UMOBtjjPoH/UkUL4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180092


On 9/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:09, Krzysztof Kozlowski wrote:
>> On Thu, Sep 17, 2026 at 10:30:19AM +0530, Vishnu Reddy wrote:
>>> ---
>>> Mukesh Ojha (1):
>>>       media: iris: Enable Secure PAS support with IOMMU managed by Linux
>>>
>>> Vishnu Reddy (8):
>>>       dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>>>       media: iris: Replace enum-indexed clock and power domain tables with per-block structures
>>>       media: iris: Add power sequence for glymur
>>>       media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook
>>>       media: iris: Add support to select core for dual core platforms
>>>       media: iris: Add platform data for glymur
>>>       arm64: dts: qcom: glymur: Add iris video node
>>>       arm64: dts: qcom: glymur-crd: Enable iris video codec node
>>>
>>>  .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
>>>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>>>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>>>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  10 +
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi               | 120 ++++++++++++
>>>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>  drivers/media/platform/qcom/iris/iris_common.c     |  10 +
>>>  drivers/media/platform/qcom/iris/iris_common.h     |   1 +
>>>  drivers/media/platform/qcom/iris/iris_core.h       |  32 ++-
>>>  drivers/media/platform/qcom/iris/iris_firmware.c   |  69 +++++--
>>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>>  drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>>  .../platform/qcom/iris/iris_platform_common.h      |  46 ++---
>>>  .../platform/qcom/iris/iris_platform_glymur.c      |  78 ++++++++
>>>  .../platform/qcom/iris/iris_platform_glymur.h      |  15 ++
>>>  .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++-
>>>  .../platform/qcom/iris/iris_platform_sm8250.h      |  26 ++-
>>>  .../platform/qcom/iris/iris_platform_sm8550.h      |  26 ++-
>>>  .../platform/qcom/iris/iris_platform_sm8750.h      |  29 ++-
>>>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +-
>>>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  67 ++++---
>>>  .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 ++-
>>>  drivers/media/platform/qcom/iris/iris_power.c      |  20 +-
>>>  drivers/media/platform/qcom/iris/iris_probe.c      | 153 +++++++++++++--
>>>  drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++----
>>>  drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
>>>  drivers/media/platform/qcom/iris/iris_utils.c      |  58 ++++--
>>>  drivers/media/platform/qcom/iris/iris_utils.h      |   3 +-
>>>  drivers/media/platform/qcom/iris/iris_vb2.c        |   4 +
>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +-
>>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 216 +++++++++++++++++---
>>>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 ++-----------
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 102 ++--------
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  13 ++
>>>  38 files changed, 1229 insertions(+), 444 deletions(-)
>>> ---
>>> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
>>> change-id: 20260917-glymur-627d049900e0
>> Look here:
>> https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com/
>> change-id: 20260601-glymur-4fcd4d832ecc
>>
>> so now does this work?
>> 	b4 diff '20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com'
>>
>> No, it does not. You are sending bigger work, multi-version one, part of
>> even bigger work, so please get the process working correct to make
>> reviews easier.
>>
> And it is getting even better:
> v6 change id was:
> 	change-id: 20260515-glymur-6e69bc258fb0
>
> https://lore.kernel.org/all/20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com/
>
> ???

Thank you for pointing this out. I lost my original workspace and had to
recreate it, which unintentionally changed the Change-ID. I'll make sure
to preserve the same Change-ID in further revisions.

> Best regards,
> Krzysztof
>
