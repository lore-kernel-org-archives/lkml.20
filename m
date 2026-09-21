Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B535F170
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969569; cv=none; b=Dc3NYjjwKqGd5MruK+281U59RRSBqv35So20/ICIT6gW57DhRZMyp9DEHc2H2HysjAwgDOWekx4EOuTF15svv09FfDJPayWnrF0RZej3RnC23c7iI4JHrwiPe9LgaK32WHkLHWatkhfMHsNhjE+Lk0UmkkoctdHIK2GF7/X0XLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969569; c=relaxed/simple;
	bh=mkmcsRP85uGFiTIjha1BtorjoUoqxMqyOGfcchI5htc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5OUb9PO8QUExXOUPbD5SyoDoKWiaTlNsIyPqPEmg9q+xrXLmFUTBMJZVb3a3urQScN2iles9zC7J6vTI3xDnVbMZg/yB70qnIHblhURB4+yXJh6pn/NBJTuPDfhvuKBX+9KeLh9mixZfPVPuZpBhoNPK4vO2PpF+z5jadoDblc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkjlQwZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AX9ZH0IC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkjlQwZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AX9ZH0IC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Zkj0007354
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R1Rt2c8lFyUjXLabVw9ThdhJ5k8x8qqwSYGlOjh9pA=; b=UkjlQwZNfXwZNWTt
	aVwYJ2i7FKX5giZC952G4CF473kd+EyIBhRIfNWjNW/9+XFJ9SyG2yBAObZAMDq7
	BpkstQHTPVn4RwKPl20gCItaL9/kfV3wNa9e6yqEiOtKjheijc5ZIADXsai97fyA
	7+3iqr3pgi8WBa9Lt31cSncZaO1xBzG6532x+yfKUnsdyQBJ3AlhBZeP0tTVm5ub
	YVR2WWItXVVKG71cwChqlg7r4oA9zpj7Qw/HGWwHhzThvge3Iap75AjK8j4ChPdi
	q7qOikLcU4P526Vj9ThRdrX3hfTyMPP61LtZdop9oaZ+S120uaw/bTVJqRU5Y1Ll
	oqO4GA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b92af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:46:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so3950696a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969566; x=1790574366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3R1Rt2c8lFyUjXLabVw9ThdhJ5k8x8qqwSYGlOjh9pA=;
        b=AX9ZH0ICxgRLg0vpSGAYHW2bWEmdlwoAorSSqlZifAYEsK5aw0Jrg+gE134+vfEQG6
         /lIdhcuxiq/NsafvHS61Bf89/jyHlThE2HQ6WPnnyuO1+MMA9NA01Jdq6yXkdmJwEevJ
         k9RrOD1gRA9UrqLVZgtJKDTYQb8oV3N4Lro4gqtdgdo+lh59YbJe4TjnnbBZb2XW0V8d
         XAWRkI7KZe7Hu29uCyqe31RPQJxR/erTDXoB7ZpnG3PzboiQZP5pM5BagXSW4gfBKNwB
         Nu441IBUcW5/c0aIkTdLT+bnBbPkkI4bXS4JqOxphhTO2yn8IBn0QIbWitGjWVZ6HbId
         yaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969566; x=1790574366;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R1Rt2c8lFyUjXLabVw9ThdhJ5k8x8qqwSYGlOjh9pA=;
        b=zzrqXqRx0RNa4K2+mMfNug0FZkcScS2fYJb7+a7BS8CLO8fsJRYWy5dQFlNVbFrtOQ
         E/8/uGeXpsnCdtHYbfK8Ufcj8tlmbEkErBKM1Y4LOazt2GX4okqzLMgA8Cz+UytnoKEq
         dW13SW0zTKWgQ41e3M/74NLIW7mMHpSZVf5We++4HNtnHkUwuYALhTwVf4jrnSxjDPkP
         YYDmgDmJSnG7I1dHws1PKCRxg1QENM0hAZvXjC+csQ10Htg9Up8MWxRvekekndTzuSx0
         Od8tRd+ddlsLsItYLU2y7Mphqxww4oie8jPb7s9Cg0RkRzdJ8ZQov36QuoN/YJ2Vb4sK
         +41Q==
X-Forwarded-Encrypted: i=1; AKwUvByLZRTXnYykEXOtgV+43JGXnqjVXShRD0LRJAcMAWPfaG8AFl2XCDzlYvLbOrVNBkXLOfV2liq+EW6mQiM=@vger.kernel.org
X-Gm-Message-State: AFuF++muXVRiap9ndHmT+D7O5H5PrX1M840bwSUW6Rwb3dSOXkR3oUji
	t3/LFv+qZ3zVdU6nvMPSbxJRJXH4ZH+XYygGzEGvqiNVGnS2XaZGqp+GjR4KJscOEyArf+Dj3mC
	FeIBl1P4Whcw+AE+fc2F5RwpmRCNzzLbqzovnsrbpC1znY0qJ1b8A1Ws9QCf6N2p9z1xm9a0myT
	0=
X-Gm-Gg: AYBFou1R/5q8w0nvOZW8oesK1EcrTk4SE+1wi6TPTOxnQDpPevXQMrn8+/3cdFIwBur
	xwkrulKYFO9mYWSfvWITpz1r3Lh8s8cgw3qqQELy8dWsb17L7jWTnRAa5YTdLmHWDiuPDypfuDc
	MzVDbIirHe/obdVkzEtlEzQDHvuVgHLc3ykzjHlssXlP0iHh+2eFnkqFmrVcoe1Lm6n7Q0gd9T2
	g6GRJhH8JI2uIlhYsVGonluSHyMogazZhDAVGXT1kzHiCYyfj57Bow5wPFTKmrHNMs1QFC00u6j
	narhN3rp/PL/L837ArthHjupGG33lrSdI9ugcEAAvSSjVcBIl7y7walBVfYSIbx8TEjCBjYVx4+
	DDC5iiJtUZToR18mFCxqrHSv08nhBBr4=
X-Received: by 2002:a17:90b:5403:b0:39f:6c3d:d4ed with SMTP id 98e67ed59e1d1-39f6c3dd7eemr5747542a91.30.1789969565610;
        Sun, 20 Sep 2026 22:46:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5403:b0:39f:6c3d:d4ed with SMTP id 98e67ed59e1d1-39f6c3dd7eemr5747517a91.30.1789969565095;
        Sun, 20 Sep 2026 22:46:05 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm19472922eec.0.2026.09.20.22.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 22:46:04 -0700 (PDT)
Message-ID: <c7be81d0-5472-a157-4c38-2f5f43e34b0d@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:15:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Content-Language: en-US
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <aq_fP9Mk9Cuk9pSw@QCOM-aGQu4IUr3Y>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <aq_fP9Mk9Cuk9pSw@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4MCBTYWx0ZWRfXy3dpcOi2tZqA
 Wq8FZTW+zT+iMeg2FGxt/R0RV78TgKSbqzvjExM3EKbuuBo6/KemeV9b5c4gJUbOCMV6Kx0VfRT
 ZmRl3BBzlvWCftpiZHCUFOPubJbxqzrfxXyYDdKA9Nx0pjagUU1JLqJoygx3hGSCxxcQY8uE4Ow
 1vbi05fUk2Oc62hOIhP2U3NutCqcx5JmyIjSKNuY4CKNJgeI03NE1lCv36C7gQTGnFXYg/waWbu
 eX1ZqiksgXKKAfVIRE2ELvi0NnDEETwxxdk5rk2GL+Zn1xUZgztSneouSbjFB0SFFoGLJ0WhdvQ
 Zc64A/4Y4G0XD1RoQlMrNGhoc++BCX98O3Mav1onq9FfxuZNsOOrBjSbLk/jBNKi+0vrsFMJIZN
 //qcOQzpfFxHmqAixWqwbxiEm4X+Ty6/k63HFOGH8FZlPmHoSBZQgsy887wnGC2KJlG8zmU9x6O
 9PydRjL6hkOTpl4hyuA==
X-Proofpoint-GUID: 7X3N0pK6eAainOeGyMe6kp5EMRemU9Vz
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0c49e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=btFDxjqg97c2-cl2zVUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 7X3N0pK6eAainOeGyMe6kp5EMRemU9Vz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4MCBTYWx0ZWRfX9ceJKW442Hcj
 FCN/7FuMT8FJQDS6C7AMMWeIgyTI4pdqmQORrBaHERENMNBgkFU+MUzhoOAGfAsoUhEvJeTgWL7
 BO+cfsJtd4w2Y6dKAqRrGUrTKNDiII8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210080


On 9/20/2026 6:57 PM, Shawn Guo wrote:
> On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
>> The nord platform integrates the Qualcomm iris video codec hardware,
>> which is compatible with the glymur based iris implementation.
>>
>> This series reuses the glymur DT schema to accommodate nord iris
>> support and adds the required iris device tree node to the relevant
>> nord device tree.
> [...]
>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>> Vishnu Reddy (4):
>>       dt-bindings: media: qcom,nord-iris: Add nord video codec
>>       arm64: dts: qcom: nord: Add iris video node
>>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
>>
>>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>>  4 files changed, 131 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
>> change-id: 20260918-nord-iris-70b17cd16a77
>> prerequisite-message-id: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
> It's been agreed with Bjorn that the dependencies of a DTS series needs
> to be explicitly called out in cover letter, something like what Nord
> display DTS series does.
>
> https://lore.kernel.org/all/20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com/

Thanks for the information. Will add it in the next revision.

>> prerequisite-patch-id: 15b7e40d16abb923052d14832a468b832822e02c
>> prerequisite-patch-id: a127e821eb3382d30c05fbcf8f3fb520263cbbc5
>> prerequisite-patch-id: 2d52b8db1dca030ceb064f13dc912eb5478b7d63
>> prerequisite-patch-id: d21f937c2939a84117e7f4e1473875412914f9a6
>> prerequisite-patch-id: 97b755b1bb9cf6e3bd0b402bcec890161cad6868
>> prerequisite-patch-id: 97f41c3ba82d7a7b866b35e7aced283e8d0f699e
>> prerequisite-message-id: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
> We do not have to depend on display driver series, do we?

Will check and remove it if there are no merge conflicts.

>
>> prerequisite-patch-id: f8fbc6150e3c9173a58c51b21aa361b4bf427ff6
>> prerequisite-patch-id: 914292456c91f83f83d078d3ed589e87ec1961ff
>> prerequisite-patch-id: 8b04289460ffc81d540c383255e644eef8e7cf6b
>> prerequisite-patch-id: bd8d5373421d6979f63ca6782dce3cfc8f7b8878
>> prerequisite-patch-id: 5dcb5f0b6e62d524634f4876b33c0ef3482150ad
>> prerequisite-patch-id: 4ec69028284b5b4f1d727d600ac81f9c91eed63e
>> prerequisite-patch-id: 91d92d9d408bc5722e5eaa7f615269e64e459bd9
>> prerequisite-patch-id: c7b1e7672798e47c66d645c14bec824b2eebed9a
>> prerequisite-patch-id: 008c9c85a07687ae136b5cc62ad8aa2ea22fc2af
>> prerequisite-patch-id: c90b7b7096decd328219c71689e95ffa4127e841
>> prerequisite-patch-id: 112cc818078b668c3a08b8011a22cdaa3c965cf7
>> prerequisite-patch-id: ae16d3341438d6d49a5d575f0e8d67465cee5d41
>> prerequisite-patch-id: 521ccda14a5f47e8c231912e82ed32a4653e8805
>> prerequisite-patch-id: a22fdd503289f80720b26f8244185226e0417115
>> prerequisite-patch-id: a3dba98903fd87c5893422fbae7c376a77d44c30
>> prerequisite-patch-id: 86e23f75f4b0f169e537ab6430cc33a2a4ad43a8
>> prerequisite-patch-id: f93d80383550a3b1475356ddb725f3d6c2d25634
>> prerequisite-message-id: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
>> prerequisite-patch-id: d3621342d373b4e41ca0d0b9eb4648bf0187cf7b
>> prerequisite-patch-id: e8b7e40ce305132672ca5d10063c1b20bfcc8361
>> prerequisite-patch-id: 2d02f5f60554a49da2d030e507bb9a27ad99f092
>> prerequisite-patch-id: 7c326dff78934f41e92cf662989b1d11fa670387
>> prerequisite-patch-id: 7ad3809e9f6fe6fd47b95a7fd1dfc27fc290f457
>> prerequisite-patch-id: cbaf2c4a49ef854d3f908de5d8871e9d49ce4a99
>> prerequisite-message-id: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
> I have separated clock controller DTS change from display DTS series.
> So the dependencies would be like:
>
> - Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
> - Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Sure, will use this in the next revision.

> Shawn
>
>> prerequisite-patch-id: 654ba807f2ca53a3b580f4990c28fa35fa7fc4fa
>> prerequisite-patch-id: c9f7632f7f31b1fe6e40c2df354d6047553ed967
>> prerequisite-patch-id: 95df9bbc25e2f96c3bc8090543bceed0a31527a2
>> prerequisite-patch-id: cb3907b10983b3a473cb01fbfde657114e468523
>> prerequisite-message-id: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
>> prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
>> prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
>> prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
>> prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
>> prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
>> prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
>> prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
>> prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
>> prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
>> prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
>> prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
>> prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
>> prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7
>> prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
>> prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
>> prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
>> prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
>> prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
>> prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
>> prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
>> prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
>> prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
>> prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0
>>
>> Best regards,
>> --  
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>>
