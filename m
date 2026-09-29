Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2BF3AEF2D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676496; cv=none; b=BS9LAu1d5vH0pb3DDUE0clFwM0+ahu/gdnid9SplwC0/29ErfswVpMMRt63mj39WjlrA3zADVeseoMcDRLVha9/SPDgvUNL4DLTervlTQPgEaGlUZc4c+AT+LUGGs/xq66WLqvrxyFm2rZJV6G84jvy80aJM1o13840wSRnyy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676496; c=relaxed/simple;
	bh=vNUuc8jLi0AHoFh021MS5/u+VB4q5gBEF9MEa7jPgE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5OYq+bsKccWdW5tnj7F5EHLIGzLK3xawinO3hKCW7qO6k679XEhAewL0PnTS8tU5/gPuCyFKDKMT2svgFqHaZB9uX41B+85CcDKgLPdmIEgrIGxu8nY8KYmw0DZQTtvrlo6MoWpttRsTOhGcIldcuZOTgvpIzOD/7dKgBrIyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpXcaoh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE51FU6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpXcaoh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE51FU6a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U3eg3833984
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=; b=JpXcaoh3lO/O3j+x
	/VTLyyhJ412SkrwiEiXtPqbhnbk9R5s8fFi5V/9KQgjEtojcqO6etg0XhwSfBBec
	q+vUgXY4jODAYA6k5/1RIs+IUPzvL5uq5IYCbmCpNottNBImUZ1A2YAj6jwMUPuK
	h/CVr27SdOZJ50ZfsE272GqV9AzD+gT3hA5dbuxutMmHAQ/uHoTBygka6sCp/ios
	kyfd7VYQ+vK4dYGAQKuOieU66e99jxiPliFngb+PalXD/NErol21sCpiTYxvS1K+
	rXKvn3yeqRpsPKmBrhddnmRm3BjTvtJ9Hwx9liBvpZqLm9Kl3N0WyYBtdGqDdQ7D
	BYn3aQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkj6v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:07:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso6657554a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676479; x=1791281279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=;
        b=XE51FU6ayHFgW2icoBCtrMHw/xvDhPxu2TBwh//ix3LSeeJ5ODVTfB9rDHHB2UFW7U
         XKVyFBVe0gY6hLqWFHK+wyQRicw3uqVtM6LTkY52NKEWTgEsYfFlnGx53HGCO1sQEQIG
         vpMpa4svcLapS3CjjeMZzBrkHrpqQ/3PnIUtmm93KphLJPkkyrx/i1Ar2lG2qco0GroG
         8YQACVDKsmjhuruvIhk+XriDYi8HEL089PkyvZWaMTr+79jgQyffvfvKjHzUeP5wqo+J
         pyzPXYftHxIKW/yIJb+pk14TFIPF0TjcQLC7eJcOv+oS0GQTGtu8d7AmMelzOdWjOi06
         dgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676479; x=1791281279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=;
        b=xc+8SalJRLG8SdJlOw1WmhbTPdqh1ud5ZYLXKv42d4qKe2DQaUyuQZrQZYLMFMKy2b
         qY/RoZkz24kYhQn2/q7I1+GXioRW5EMHzrBPfgWameQslnrpyY4t1AA83TmZP4vUOrds
         b+fUcIcu5PIHJSlY7IAmDau45CieXy+X19MoNFkWZRt/WoZW4zYyNsALQ4LNhYrUOk/m
         ngOJL1sqc2D1b9+JEGgiSgxcbfe0q+YZT/C68Q9XIIhxtZNnyTFzvquObyDqjgKLRm4E
         qkl642dBh4b9aoW6E9JPQkj6PitHKuu4noYp65Z9AbTi/fGSeIZUVLp+3N0roD96Xu5a
         PPfw==
X-Forwarded-Encrypted: i=1; AKwUvBxzrV/ruhVMMwYU6LVWpHMf5YgtLKNdHybFDvxab6qz7V/cbdr2xfG39kUIubnmlae0BsSsJdw2+oI6MF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPZZDYeRoyffptnoBABHsOaQtQHoMINFL0abRkWH5vYharhnRO
	0BviKtYOTeabZ4D369S0PVkQIkQJdy2AIO8B1yoj5zSSbguI3yaz5u5D/0gMBlrsDi0y6bbiUea
	8qmtKkFYEWRld+DRwBixHD3PULAveKq/ukTSqhplDovp/+1nwcK7wou3Ayjt3fVasng0=
X-Gm-Gg: AYBFou3khR+EhThWHHXU1RCsxsuNYMavCVnczYxarAbubKVu1kneD84E6nCq+Jvqsdw
	ZpGgEYwEbgr7gRfw7fMVVAZc4dXePw+Gql6Kjz6vgTilzojbiyC3/MCMiSA7yUQos0gX0zvZBVk
	mIKXtmLGOVkPenFDTQbiTanXZrYroCt0QxbQsRklSegj80ciB4TwonGgxdAZ27/dbgYBHFgnJD3
	rtiZol7N/r/q/hyCM69EVmO0NTNgbjpNDTLIWSOx8uTU8y0NNlpKT/BsaoyC4vwWzpykOBnZQAN
	3EZp4x+Mn++ElHlKH9lryukESyDYgO72kSzJk7w8LvZixBmFzKTVuzko+ey9+B4ZSzi4lO+gTEM
	wxHK+/4Vicf/BNfqQurftTPmrIC5t/uy1OvP9+wpC6ZzaFaRN/FFEawjC7nnsMQ2ee+KlAGfAB3
	LNN3kfmLk0/WJt
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a0a83de3c6mr8184038a91.17.1790676478709;
        Tue, 29 Sep 2026 03:07:58 -0700 (PDT)
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a0a83de3c6mr8184015a91.17.1790676478241;
        Tue, 29 Sep 2026 03:07:58 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858c123sm5582977a91.3.2026.09.29.03.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:07:57 -0700 (PDT)
Message-ID: <23a709ba-2175-4770-96f4-0b09ca9f0a98@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:37:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <20260929-cherry-seal-of-current-bc1b5c@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260929-cherry-seal-of-current-bc1b5c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MCBTYWx0ZWRfX1z/mavmJlLNb
 /vUBHm9xNvunESr1XbRe7rC8sueIbidkySB81yvelsWLRqnjrWEwXs/s4Ry/KU2P9cMNjjMXAG6
 yqpyzkIDbS7fVn0s3WwE7IjbHvf3MNptI0xq2GlBbMnRiLvN9zqaG5rgaND0F/as/hez9Cx75AU
 9Q8oENHu0wrcVWhbRj7I1Wkqft3A0GF8tSb7+7tu2NHvvcJRAzilcIe/Zxh8SnNusOChsKLGkS7
 yCF0jnA4IrglGU865QJJg8ECZiY5eITrRtUXz8JHG6YwQd3w5HPsw1YFyww5txVgBlThvYHDc5y
 WnsuIh7n6RaN8OE8D9fXeQhmOlyELWVqsQPLwnLi2S2XDlLVBywxIOsfd/nRl2CoDw9IEvCeQaS
 DZ7U9zzb+pvsPmtRs8kIi9R0zbAJHPv3b7FH0o+8xOZLQ9WZNQ+Grp/sPPWNO0XRtAWOEBTLLuI
 kqYMNM7Oqmak4MykJVA==
X-Proofpoint-GUID: XknxyvF0vzFtNcHGRb2-Q7KJ6Dr0Ahht
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb8dff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WLWG-EKfj2tKRMqETdEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XknxyvF0vzFtNcHGRb2-Q7KJ6Dr0Ahht
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MCBTYWx0ZWRfX3TbnZcv0Qry9
 lOKm/yW12USUynxkexjShKnA9ViIokRDym8mNOegBzNlLPjbXgQFfIwHqCGwAxDm6rQzCtZqGRh
 8xnYL74eyaKH39CQg39dNSUop4GDcuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290040



On 9/29/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Sep 28, 2026 at 12:06:39PM +0530, Anvesh Jain P wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
> 
> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> Best regards,
> Krzysztof

Thanks for the review. I will update the thermal-zone node names to
comply with the schema and make sure to run the DTB validation with
updated dtschema.

-- 
Best Regards,
Anvesh

