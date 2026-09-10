Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796BD367285
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025547; cv=none; b=ZDMuNFpy95FB6sWft3Sbt85OVuRk3wAS+0r6W3viF3sjJhYzdzDdvKUgEk8Oy31tv1mAl1BGvdABivUuF2CUeSOJt+CPt21XTXUSLkIBQwO/zNxRqOpwLKuQTMsiQHA9b9Z93rEX5tVtHFLTFx4+WVE3tAWTCaFgELGBXZA2XEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025547; c=relaxed/simple;
	bh=YwG3ShPeEoDdW/VvtVBJ93NMcAnPV4JbQbuTOD40zKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1kWbCnpRZfc4w6YGnaphtvlmF/esZqfJCe/yI6UHUO8NaS2TSth8m4/Z6/eAxFSp0X35C0P//55YpRAMFKJJ94du0/jKNPGJyryzvQGbV4OZANe3rmRqUwgDfOFYb7Rbwt1h1Z97QXCS/OB703A4YT323BJEaoXjVQZGU8yL7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkTKHuXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkizFbiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkTKHuXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkizFbiD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gvuk810424
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=poC52eCWfGjTRuyFHqnXPZmO
	tWy55VBXZIWXrPhthEQ=; b=KkTKHuXWfu99YB5ufLTwRvjc6+Y6GFSWIW+6zY4d
	pXW9tEU6P0qArWNSdla/Vfpk0TfdA5+5wdZxcWn2kWK5jtowGBaov4Nou4kxoM9j
	kMYIaAwv30HrRpWfolHUDvI/L4wUSHjZuG9WsF3fQoNUXvnpgxZZ2wq2Ps/1hWen
	eqO+XJ9BDW65bccb/i4B9UdQV+mDJ+vXM7IAuOtI8101mE2v9FgNgSkAwHNphnEi
	5wEpbzxbxd8NJfyzi/lPD7+uNLQm8JLMMRrI0cqrY3cFQSWZfQC0UNlxoB83Cpjs
	+hRNdbZbE1qeeHJndX6zuNOVnvmF67dAFEqJuLfnHS9ePQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjn2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso1053359085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025545; x=1789630345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poC52eCWfGjTRuyFHqnXPZmOtWy55VBXZIWXrPhthEQ=;
        b=KkizFbiDgfzHsA4e7KQqLRCVprmXQ2xMaWGHVMOXiYO/ejHtZ1A6sUp6ZXya++CrVH
         fVV0ToYdzZD3eaZDtRQ6smVXbs+qbiBeRu2zGjAOdujtYkOi33VP/A6j9DfzGRd3UuNt
         zAC2vUchA9HJozYNEkaRktUKo1g8KRiQVTM41VarcfTkPmAJKZyHCBcw8xCmEqwpmVRY
         z8R75QhC9XyyaycWVRJUrD+K0LG8sZydCLfYhmQ7kBLWUpMLC1yk3PGF4B0JBkLO/l1n
         sefdmMrPoD7uYcBG/ESlUab7xy11d5qL7e2Z8ekGIUyDFsqpCAxVsuqAgz/diO2+BcXF
         CR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025545; x=1789630345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poC52eCWfGjTRuyFHqnXPZmOtWy55VBXZIWXrPhthEQ=;
        b=hiRVm6gKqi0kGWJfgD2XN6ZHhd6jMN5usWvo8xQ5Xbl9arkOdUfs9JXEWc4Wurb7Fo
         s1npL+bI1vlP0jYMPwovJeehd/W3QEQK7dBO98Q91UCj2JzhfhZ1VBUwEzNGn7CZ9zTV
         P6fGy/+2VpBvcMHnqa2zHAh3zKKGm2PBSJoc5Zp1/EOmFi5Lk++Iwgb88LYHPEXazkNc
         bsG0cganamL3dBaJLq39rPG+Z8mkib4EDyG93wPVjMvZyn7dePbA+y63d78bsusmpSmc
         TV8Ica3Urvf/tyfwfFhpg8vP9BnFI22JLeTiG/GDwYP2xo+OB10eNLBGG++D61lYPxRd
         5iEg==
X-Forwarded-Encrypted: i=1; AKwUvBw2EoNFqrN1lr7RbT+Pm/DwnCY9tGMPX9b9oEQFU461KmtyKKrHu+7NYH5agjRv/n/d59EX7bmMSrbpUjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nWzgonIVfpl8ubdqJhOWSp3gjEhA8CkBuafVnppKmdriIMHj2I
	E43OOKvkoyCzEf+fiLXd224o5sTA9eg5DyvVCPZLDgxxV5Mq45AKGTykZVEOLKm95EicaAbdnKw
	PBZ7uAZhhjAMf57hCjTyccJ5NnL/XtVQGC5Xin/7depUUHnPQLruKBNmrMQ2nGE0iCFg=
X-Gm-Gg: AYBFou1of9ziovyStHUKXQYjDJ6ZqwP6Ys3yy0QezUSgStIVLKQJHg78TV6XVKC7e6h
	ficU53qxyxSTbVPU7YPmT1kjIZdZkXKjHx6yALHfR+hR2zptU3jrMZ0WfjEfXLh1nqJaH+0X4UV
	Iu4lnU7m7pfdzhdiQAEzVOv5m3fFfeomWeBr6Hy/9YP6bgJScFlZRFGMzA7vdxduEIV4q3Xc81i
	QwdOR35nkCo6wq4tY7QFHhwRKJxh4IoS4iFIfHzIp9e3NagafCTkIfUZ+Gsd0jyHwYwjmVecd8Y
	6JlHvzzGBhM/QvJyGb/zRZvmbfnrLjTqXDv53n8+ahn1IjRNXqiXmz3h9xn2gA7io8iHCtz+jdL
	rWsC3i7WoLsyF
X-Received: by 2002:a05:620a:3186:b0:939:c9e9:81a3 with SMTP id af79cd13be357-939c9e9e6d3mr1215272285a.30.1789025544732;
        Thu, 10 Sep 2026 00:32:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:c9e9:81a3 with SMTP id af79cd13be357-939c9e9e6d3mr1215259585a.30.1789025543213;
        Thu, 10 Sep 2026 00:32:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm249206745e9.4.2026.09.10.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:32:21 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:32:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] interconnect: qcom: msm8976: Configure auxiliary GPU
 QoS port
Message-ID: <lhle6hy3ewf6tahr3ynmvrzlgai55n2rngy25vhqaawj7jsmt4@znu23yqxfn5v>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MSBTYWx0ZWRfX/4hv6Xj4sVq2
 mSZFd/4+fzifF4VOfUxeeXz9pvh/YmW42TCY4XYG4O21GZo5+2qkXUtfP81uqgFtcm42OGEhsm5
 H7VOUb/F96L/GKPUbjs3pEubVl0DPu4=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa25d09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jW8lGn9s46bW74Nh9CgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ci3cnezZk816c1hz6siwx-tGGaV8khhJ
X-Proofpoint-ORIG-GUID: ci3cnezZk816c1hz6siwx-tGGaV8khhJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MSBTYWx0ZWRfX38xJUg4GS05e
 5qfRtAoSG3WnzKyzbh9apT/4ldfSijbq4cyceQTyaJ7BXjVC3NCPnWK9vo8jhOUz9H/b9lWVs6I
 9LydwvdMCo9/15+qtq9uMZFlq5oBzNZaEjdYacmhtGGwCoxehgEojw524MtKpCnd7s2ZUUR70Aj
 npGFwLC1dSykGTnMTfnR1u1lUz4Viblt7H17HX0WNKgzYdOVO7i0XajmHokNT0bZeTYNWnybzRy
 rqZsk7FqdU6TBYA316/Yz4xtRqhm3/0siKnFU657YCXqelZ6QFlAWYdmb0+2aiYqNuTMv6DI+KY
 YR0O2oUFvbkqTwfI9989FdqobnQrPLrx5d2jOcz/C9dhsmThtrcfDEFV9U4BIr0Nipg/2t3k5TS
 UTavv6ZzJALuVmWEOuKp5jMr6sQXZxVui4PDAcXHbQAY4kICT0iUwvodlrRBkNT9kLCj4JFfppn
 TLmA+oIImVLjhFkRqaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100081

On 26-09-09 18:41:59, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8976 GPU node.
> 
> Assisted-by: LLM
> Fixes: 6e3ea1f36b10 ("interconnect: qcom: Add MSM8976 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
