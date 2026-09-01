Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E340F754
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274607; cv=none; b=YpY1RQhBPBsd8LVtr6hroBBd2rNi1O3xHY+8QFFGYqWlS0hKCtqp2gnZAsY/BRO/mIVNQn5xLBSw7giz37eqUwneLTFyEvMbZ9RhyHmX2RW8o1HVxr2KONIZKfsYs6gen1nuVQG1mfdyiK2zpfcr04gH4lRgC56o6MgOW8GbfAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274607; c=relaxed/simple;
	bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7SmDEYwbQg6vWtxFc2ZnrqGCI/vqkz+jzfZKDlDPZCDsfDYvQUtKy3cqOE4xxeCywpCnI3kcngmS3wAOXEK1ffGavfOPL624b6SrjMI01AeWj0kD6x8uUe5XSeorsw0gxeb49HLlwtlDoUrs7CXN1bVsn9bYNFoba+X7p1cIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7p9gW9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9vmsMkG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7p9gW9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9vmsMkG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9XS71639027
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=; b=d7p9gW9WUiCTvvKg
	tZetSrzwUD3izJ59InSy/iBUxtsJ8gTtqz+Ub+E/Oue/qkWo6OGGGe/ckd2/hFKt
	ClfyaKsnAazja405OZGnxIkX1YmO5lnyvZOjp5haNq0P/QlQ+G2tqh2E1DJnXFDq
	rZzd1Ks1th2dCk+3LKOiIBKSJbuNYHMYPjTxyu9q16uFadsMDRYqWiq6bQnA8Vkg
	DTtzfZMhqgyxkeEmhmO1gDNNmsbr40SLe1CByxUEqcT3mezhdA3eMrJVKa9Bphyi
	pPZ4S1sbaHLbbxo3yFWnAQJ0us5BL54fVAAKtglLSsxWoLIhFvw1E1FHPClHiw0v
	rSXnRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjfmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:56:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so1181933485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274605; x=1788879405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
        b=K9vmsMkGstQnXaIbnfG+EkFDcOXUJ6fvh60BEPGDxLg2LzLRycDXssiS31euJEJmRm
         1+s+Y53JccRCGvHIUCI3cUxPLux/6+yrF2WYOdkBi1LMWFIeJ17Db2izbrrLOm9GWT15
         YfzKqa2z03EDBBUL+VHdzqjfrJvLg62crl5GgPbUxDrmqDltlKH2TbXg5CK3U4+q/X/r
         LQ0wcjA+RfnZnVuZBW8hvhhqvFw1ovpf9zYN7N739fGeacj6XXGXkGrsTpwLxTsobi4f
         MyIVk2kYy6MaPHLuBsprkg7pEx7Rf23xTgpwQ3fvKFUBxUR58iSUUGvJktBENwNxR2bq
         R5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274605; x=1788879405;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
        b=Mtysj6ZGA+YgtXymlhEQEzrRWiqbAelehqPYiFa8C+nqy8wQJdgt+IgpmqYsng4ZnD
         HJi5GJdT4fztsRAW5OOP8bX1RnEalCFP/FM/xEFmsWY8E/bIZs4f104HEq+WQu111+kB
         1SqO3lRv+NYtLCQld2EcjkLa073SqXieLwq6edrV4wpbfa2doktXU5HsX41gEBAddh8a
         sVSnXm1RMzbEQwAJBhptuPyBrQrokfCLlspuA8ASkhC4c8bbltTv3AoMq5tqPSf6+Lqe
         tk6U7eQgNmNhnvjC1KHH9Dx/6B1Zo8cPqP8+OliwIFL6b1x7C5jN66Eyeovym7e08GnF
         9vHg==
X-Forwarded-Encrypted: i=1; AHgh+Rpgg+UlFs7gBu8q4TdyxH5EgLjwGDIqcrQjxxXuZcxvWrtibDt5DHdd4k12H1P1DY1QUW3oFXJ92cCaZsk=@vger.kernel.org
X-Gm-Message-State: AFuF++lDTLKcRZ6yJmTKSl6EkGzotySTF9Ng2wAo2Urn6D7Wm7crm8uX
	iBLnc255QJgzg2rPuWvukdR5a/yt4+ZKGOphqTyWvyMVk6q07BdxxUNGQxm0iEFrp+pQHb2LkhO
	/M94dsQB0xQVokijX7epcL0cfoHP103iS1UxoWJVBIP+sQzh6V03mbo8bfSb6aJNNQ90=
X-Gm-Gg: AR+sD13+v2aP7kzZM0FT58M/Uiepww5WlJijkDTwbwFdaZwn8SZx9ixXi+sZb8gzo0D
	7Ft7FJdnuht/Yzfdg39zR0FQ6RHpO/IgB8SFNy44ONQVrPcamodTn0V2ybyEpJ3laOY7QiQl5rs
	EAK5mG+6+YCX0PY/15A/V/jyePqzDTYM0PPNGKr3rZNqhVVMCWAIfJ1bvvAlPzlV04zFKmlJ7mV
	5DWsgZxbrzNshFws4F2CAV1ShEQmFvMgZv5AiG/mYBn1W35QZV/JD1JBwAd/fC98l9teR5AjG8l
	ncZbSJoNaaBCAyaW0jFczBtflRcJmFv94JFRjuKe2No3X2SjMI8UOic325MX7PP9HHESbkFqn96
	YL2iWx+eena1WWVJJ+UVCs2kBeJid
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr3624046885a.30.1788274604402;
        Tue, 01 Sep 2026 07:56:44 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr3624032085a.30.1788274603330;
        Tue, 01 Sep 2026 07:56:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm302654475e9.1.2026.09.01.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:56:42 -0700 (PDT)
Message-ID: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
 <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
 <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX5fKLmhpg3B9E
 wHlKz8QyqYN8RNYuZ9Z8ntcbhCuSjZtMLGwx4sQSQNDt8byhXNLugb62gZVq4ppGrRG3Bc74xY/
 OurlPlcWbAR19+pMVQzIu7kMjXvow6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX2dLFa20X+yBG
 7ZErNGkDc1XcJDOiNs5QG5/DrI7kni4yywtQu2OgQZ+K5Gp+TQw2DJQlVSr0RRjqSFa1yNsr1Dz
 ahgFKtRZ8LX9yyWMaV59y3YNpo/59XuYuZ9H73DdvQ7Bj5M9fcvmI/9yGcaLpu+ms0M0doXS/wX
 bbdvipXkcwTuYr9ornPB4dFXdd18LFtENFEdlujFY7ixAvBQWdvOnaRYKbICYHvU9k9fhIlSSMT
 ui2FEW3FIMbzlKSC6UEgRLAuzqeCCH0IsH3fQzpENdkgBj32u8f/NpS2iaWH7IuiJYMo0jhlPq8
 ZyUw6GiLFpY6PsA+VgPz0olfYGeDF3MMYqEjoyXor6c+zQ5J07q5qk+mR1yHqYq8wiJ4OEFuz/F
 FTmF93xINGEMQvI8BmVh8ULsXjdD5n6a/xh04q3wCVXgZY+rkw3NTywBYC+GPW1H63Tvk2n4omF
 7KujQPii4bHY+Vnf9DQ==
X-Proofpoint-GUID: mXyWtvEcQ_7wkP1EX278M60HH6JDgQz1
X-Proofpoint-ORIG-GUID: mXyWtvEcQ_7wkP1EX278M60HH6JDgQz1
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96e7ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=hm1GCXOpcleeJiWVx8IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010132

On 01/09/2026 16:46, Harendra Gautam wrote:
>>>> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
>>>> Usually DT binding filenames are aligned with the compatible string for clarity.
>>>> Is there a reason for the naming mismatch?
>>> The filename reflects the controller; the compatible is
>>> variant-specific. This follows the same convention as
>>> qcom,lpass-cpu.yaml.
>>>>
>>
>> There is no compatible for controller and the only top-level compatible
>> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>>
>> And I already asked about this in v1. Why does this have to be repeated
>> at v3?
> The QAIF hardware IP is the same across platforms, only the board
> integration details differ. The binding is meant to describe the IP
> generically, with board-specific compatibles like qcom,shikra-qaif-cpu

The binding does not describe the IP generically, because bindings are
not generic.

> used to distinguish variants. I had qcom,qaif-cpu as the generic
> compatible in v2 but removed it in v3 as I was not clear about the
> guideline. Could you please suggest the right approach for the
> compatible and filename in this case?

Same comment, literally as v1.

Filename should match compatible, as in this case since it is single
compatible, filename should be equal to the compatible. So first you
determine what is your compatible and then you copy paste that string
into the filename and $id path.

Best regards,
Krzysztof
