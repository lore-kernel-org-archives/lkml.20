Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28C331A48
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718464; cv=none; b=XXFbY+8fKZKpqGNgTGb2dbO4EMQwDTk21XJTXKap5h3Bi1dgSc8+hzuYsENOojrtHA8X0zvC6ShIdd4LcI24qYMy1+LCErv/4/lPgBevscsiETTxFcQXIHtlzaSe0iRqCHtONTXJDu6RUWWVDZ8CtqIW/6AhS0eA0AhNEwxQ2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718464; c=relaxed/simple;
	bh=8+ZoiSE0QUXpLLvwBa7Gs5wfMdhLA1mfwYrQghFEgkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IepQCORDiNvMnzO760RhdimgEKTWsszGvMPQacyIXM1+fwubOrg1CGJUvx0S1WPPhoanoXE5o+EuVz6FgExPPu8iH1oIrBPItqKXhMydyB/2JWujuj4K4mCHv+X3VLdmTK1ct1NA11Er0UDG0O47KUk5QHq60w9LBJMuG7tg3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ks9JTybr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDsY1U9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ks9JTybr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDsY1U9E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xxxF204167
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=; b=Ks9JTybrqc2lnucs
	y3ziplJwm7iDeWksqUsdq7pqq2FOoWFjLLJoUv0RogJDMf+Wy3lx7lec+DZERuFn
	vgMQX1b8LruQnv8O9dSG0MZRwv+LGG2tHazMqz+UnDy/y3chb6w91uRx+LuoPhWU
	jDKS7p1J5XO/1vTBGvtIYDmU79pzl6GAeZmVAqUhp1MshHYkroltMTPY3mWG7wEr
	s5e2fw79mMyDLXhfTBQ/7funrJyBNIdj/p2RCBjOCeX8A9ZBbFp07Wu7MXt8z34H
	Ey3k2tDtB7My/UwydZCa5NdF0XehRVqI8XsPKtV/LwNneeAIvFYM+xeJmBD2PPNf
	hKEJzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2rp3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:01:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a399a12baso11078885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718461; x=1790323261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=;
        b=eDsY1U9ElvBRL7ngUZrvhZ59ZerneF9ku6KKoi+ooVRcaYy2f6lf63UEEi223ZHQCM
         8HXJBfsQYcnfoPtqY5cdO54M4ivUFYI+zE4blqtdt8j/brCbmmmsbFhAJiUP+397vwEv
         h7qWo/iwr06sBx5LJhRdwXEw2lCFFE6DGfw1JkPlcgiPWMVDitnKsBlXimxV6vv559rm
         XdDusqioWIKn1PPdAxGnUNbf8qE5dsEzxV1pJqRtP4qj9lQ15y4F46hGucMRFUcDweQm
         ZSnd7j7//T7o0BUU2BmKdKaDcOrKepkxihfk8hDQZQ1gyCHoxwqATz55GAy9i5LDaon5
         NrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718461; x=1790323261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=;
        b=nVQMdoDIAeHekktk9lKpK0qrScJOFsjg93MEh45rfWH+3UEJ8cV7OuBItpVx9scZGr
         p8mR8yswdMDOoP6uW6vUA22ClBKozb5OtbkNit6Zv5r1GVh3kSPNoiXOKhXl/57zoGwQ
         9YaLH2NUp3k29+WaWAhTrs6zq8SoBoruamGQy2fyzsejWAjnmIFVIg2mGqGxugfAgYm/
         68gRofCw+r1mw8HSgAm8gqUJPaPJkVxo+GeX694Admw5GPwkHpb7VkOWqmuAXx6IPr7S
         YjyV3vPon8+Q/E85K3DVhqwJoQjq3F4UXQlMNrn90ScHryLz2BpbTpHpG/IYU3YDpu4H
         3R8w==
X-Forwarded-Encrypted: i=1; AKwUvBwrJFhT7yCoxSaXApbX+CTe/ljaAKib3Bb+jVyqwUSerLyg5UuAuYYEBEE25SoHC/nCRjIBKVrlyXRr/uc=@vger.kernel.org
X-Gm-Message-State: AFuF++lL/nbu15xkZpwLbrSvcG5dOVivVTxD7h+d+MXHyT/x4vL0UU9a
	H6syWhp5s4hIeBoEay8YeZLi1kO66rSW8nu55QftqPHu9EY3gI8979zxcHfNEVhVFnifnKfyKss
	TfBJp/RwlxaqCsEeIqb8GLClSz28Xsc2uKasft/N4YLg6Tdpns9s3Wn0m5bAs0zdBwIc=
X-Gm-Gg: AYBFou0AwvlpEy5N9vYKjQkky3Z/E5eEK2+c2FDE8F4kGErFc++EZdT6eK2eqcenk7Q
	hPhG2ZZbQMAnEJVemt3O5JtG7qEAfmrR9f8aoxPpzU/6oKf9aQVS1stQB4usTVEKOqW8oE/0VyW
	nz2qKYR2flqh8scFuWLiaVRBGMLitiTlQhPppP2SsTyHoEOHnphG8aobxSHd2pWmcW2DybX/6IK
	Bsos2UyulkMPYAEIFTEJIJu6KbzDFy4FFUcTbHumfTfGTorFkIh1++81/wMQ89bbc+hrbkvPkjj
	Cdnqel6XXz1J3BlBrrg6Z1tfLQsnL6XDQ3n7u1rXcJAZhYUd0aZovLV9NLIXIKuGPa9+YCTcmui
	VWRR6X62VOv0qC7lxAbzMUA==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr151695985a.5.1789718461079;
        Fri, 18 Sep 2026 01:01:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr151692185a.5.1789718460747;
        Fri, 18 Sep 2026 01:01:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb45b0fsm30000666b.35.2026.09.18.01.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:00:59 -0700 (PDT)
Message-ID: <8d32cbea-fd17-4f3a-aac1-6f44a50205e7@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Add const to reg_names
 allocation type
To: Kees Cook <kees@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260917211009.i.312-kees@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917211009.i.312-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX3z2Jrz47X7Dp
 Yt5tHCBSrDVFgdQ2mD7HkBLVJFs43NyhyitciZtBLrF01tQvPQsHNn4rfmw+ZehTHQgMedQfrJL
 yfixZjjnURP8BX7AiULzFv4NM70fCPw=
X-Proofpoint-GUID: CB0r1JZP3VssAXFQ42KkpXQJtKTHyEQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX8SN/aUTLJ2Om
 ngOt81fWdwvRtHILTFr7YJhwnI8MVQsXbZ4Fa44qtPLY/eq5sZdN0HDEWjCt/aNh1quzOUJxHX+
 G+Oog0UUu1afiaqU0v+RgTHlWPCMyFGfD6fbC9vaPWlDb1PkULWTlsc2sKvF98m1oCS1YXFrmhN
 o5WBipDiWnGsLqtTay2WoeWkS6p9rlw85+4VbHJYVFP/q8ek6NbFbjbtbnBfwSpesGhpFjF+Ayh
 XgiznUMP5O1lqH5W5yZ9f51QYzv4Po11HY46o4ZTeHh9b0A/p+lHZlsnYJQRG97bQcRiBFH/sL2
 87mteWBIUTpdtWvGjQjK7yxXbxcj/Im0CO9WYMrxs/DXxoOS2l6DJtaT8fJN24TmufZm1YCIR1J
 5JcEzlACxzAl8xnXGCjvHVgHkWzPQhOlpExm3cNSmlnoeixpbzE0rPFqcjLHqh/jta41Ol5KARC
 qrRMgRKSf0HG1cMsgmw==
X-Proofpoint-ORIG-GUID: CB0r1JZP3VssAXFQ42KkpXQJtKTHyEQ9
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aacefbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xPH-2WeAMKhyT3qgJ8UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180109

On 9/17/26 11:10 PM, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "const char **", but the converted allocation type
> would be "char **", which is the same type without the const qualifier.
> As there is no general way to safely add const qualifiers, take the size
> from the assignment target instead. No change in allocation size
> results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/qcom/tlmm-test.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
