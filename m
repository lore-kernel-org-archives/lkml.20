Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC83B71CE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882157; cv=none; b=osr/NlmjUYeLQSu+Q/vISeAZYgXTPySZugUF+tFwcn7DhxLM9hZgqZUMy42e8faCC/krdCh7LjjU8ne8bRVpqgDuNje77U2nLBBXsq1I35eeFnRFUitnAw6e1814zlAYP/svLC1TTlb6G1q0QHS7AhUeVcd1HsMMOi2p4XND+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882157; c=relaxed/simple;
	bh=JbciLIm74BwXlCx8BvBBIdoDAcxeKe6KT3Bs0d7Ohk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbEQHBBs4uu3LYBlGHbXeunP3WjOr9lXp2Bf/SDS6EeKVyx/++Ydc12c+/bRVaeQMYn6nvriw7lAm0FN5QS5f7YHFvyL2bG/e3d6F73PNJemwHl5dcycMBced3na5zZltnGYTemjPQqwjuGOkXvep02w/8G2rF5mH5MZfvJdub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOanNEkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCwBck+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOanNEkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCwBck+A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CS9s949398
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3ROTOT5NmCg7aGxkDpwUT2Hj0+sJX/h77YrLceB0Fc=; b=dOanNEkRJMJ/9FLQ
	+/TI89ktNfkA0ptZV3S/yf4VZQfd48XySBJVRuvB//POAy5ILeSEN+XaWFS4R3gW
	b2OM66DC05UzUQ/TTkZhq0Cjtich5qzsxV4pbobL1CWA5SVOV4xSajGMjeu7S7O6
	FfF9160CGS7fe5zU5Wsl5oYnZS2fkWmaIyQ7kiIwzbB4LCtLFjFhFBhqiGsH6iFx
	KfxaGm57s8lTg2Dr4zN6tvU2yaS2LyY5uTJA+gM4QTqFWgNiU6kveHuGOt3aU5Rd
	UQlDSJtQV6iNK5+Kq/BzBvYNTcEVw0Mbs9PMva+KirK5vKUEZ69qYIO1Uy/ndoD+
	JsOddw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628p0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:02:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53389750985so5414311cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882154; x=1792486954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3ROTOT5NmCg7aGxkDpwUT2Hj0+sJX/h77YrLceB0Fc=;
        b=FCwBck+A9bDQpqOPqrk70DaqnI4Oi8MUBNe3IRl304RJeZasUUILMX9H7cB8VPuq5W
         KloIz5nY+njYJypuZjoZoyXSS99NmctqiM9phZMWA5501KAsgi8M6mP0J6oB+kt7/v2d
         VOo8PMgShLVN8TjAAA34DIs7MHUqskz2oEOHfSy1qPTGaRlynNF1UO4ZUCYuW2+8OqcU
         cPKFOC4GzAzJibUmGaGSr1B5iQndFazGbWMPmWru7SzYtdwxVIn+TZyG69od2RIFI30W
         VJfsNENN7LOBg5jjNWzTqQuUqUVTpP4HhYqYcR6N267cHVGZ0N6OOsYNwO4IojLkChap
         L+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882154; x=1792486954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3ROTOT5NmCg7aGxkDpwUT2Hj0+sJX/h77YrLceB0Fc=;
        b=uPNh8lHPwosgAkMbGEfIAjMiv6jibRVD9mhIhbsCQeLw16MnRv9yf1jOUbyhjdkEAm
         Ir3k7uPnNtTtNO0jkHtt1aJyRnX/BPy4RLPR2gC5HL0SHRdwNTdYbDwAuItB8PoaD6iK
         shiFYF9ixn1eWpn8g3R8fi6ImWo02uWGqMjZaLjZUYTJdiDILY6xS4lAXq9rz/QmiX9U
         hE2Mosb2ZwJFvuG66upiqyW174AMT0ltA2bppsRZdGo9s7GKcW9u7JXL3wZAbSnLDcXO
         NrOiiJ7Ubcy6XjLwTxVcvTkMdwtJvKR+D6ni6284qZJOA7zA2uY+UpDeqGPwMSD4nBAr
         PxuA==
X-Forwarded-Encrypted: i=1; AKwUvBwk75Nraw/0pN5nyMhsUup0n/hFCfzz+2KLnZtDk7vaw6mXEbpXLOiSo7bXqwjtZqnlJbgUyo+zPiA/u2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPwaTFa3aWKHDKDKrZ82K1AuWHBxwgjVJtActppqNNcw+Aj3K2
	gGAdP52gG7SHlDB8+2CAb6nqBX/hDNk0ViOOMPEjA7L5QKrJCS7ryjH4plVyCdefEAT/CWZyIT/
	TUL1TxWoMelUZnMgRdXdzwWXeWmklcM0DzmxurOpeWwGF16gJhkHf+cMOTDD/w/ygIuw=
X-Gm-Gg: AYBFou0lNNFy//y2hABK+EaEk8e78bGi28+Om8CNW8yDmhyAoHDc4To45p4sDgKYvAO
	4w6B1wM+wccd87qDYApm81GiVkejLlMcgraT1B15tXFR5kw0/GK3/8rTpSWUVB4qHex5Xzaty4U
	RPWenKUbsByB87Pa/Y+JLYAsVtatliQRECOD+9N1eJpsGljfLuJ185Bye4/oVT0oGofTCg63Xqi
	icDWiFCCFlopE0d8lzl+PP3vROcVpH3+OJIxrO4ehgb5AEXCDePn3LxNE+dwYXc8NICxk8C1hBe
	QaRoayXegzMatBtmD6Ztl/vu9ap8kiB42kzsdZ8LpU9ciW4o3iwgePGr6L0JoJni3M7GUmKzxCy
	S92zUAnadHg/MwjNTeBf3Cg==
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr234072331cf.2.1791882154579;
        Tue, 13 Oct 2026 02:02:34 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr234071911cf.2.1791882153956;
        Tue, 13 Oct 2026 02:02:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm549448066b.8.2026.10.13.02.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:02:33 -0700 (PDT)
Message-ID: <65609aa6-fb54-4987-8573-36fcd650977e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com>
 <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
 <CAFEp6-20=Hkb9ZsubULMg9YYVzEc11Y37g90Gu1mxpvOwqJB9g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-20=Hkb9ZsubULMg9YYVzEc11Y37g90Gu1mxpvOwqJB9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdf3ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9Ai6TmSYiC37dqtxzEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX1bp+7B6MoRld
 lU1XuUxH4k3Nn6DMl2Fe4WXIAQvW1+xxeUu0A/NBikv388JiSQTglxhFmc1zO/CSW8uGx9hQPx1
 q1zgOVAm95eTcueOs8ac9pSYrunATEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX73COcra+aM4j
 vSn6o0uZSpPodQwZtd3/uiH79UjIQvAN1DpcpEPI7BoLo9WxqiOBvlcXWn+0MpMv5B54HUQJJbf
 5uQiJUctvN9WB5zRld4S9/S9UgAIWTMsq9aT2uauZdySXtl5Pjj3MxS02dgXPAp8A++lGXn4JkT
 uYIJ/QnOO4cbEHPRndVYJx7nn2zNKoqpvtLJRAhdAR7Q478hb7ankm9GnavX49iQIjqDMVJqzsm
 sAe8NkefWkanmJ2CaN7pmyzAv1a4G/48XIGGWJfunUw0CFTmVUMQD1VGJjwH7mCYw7jjhFWSXay
 WYo0v/GC1djLvMjZjRjNbGcuUpvtoput1ZLhn5kJkh2A0U8U5kWuqm90m9e7xhttrNXCzdmnNPQ
 GPxocsDsligD9hV9njVvBbogSzLI3VhLiUn/Fp1Q8ZmyztcnwH2sI/ur8/BVTtZUemGSAUwYyJK
 F2CJphcMmV5qvIz8vpQ==
X-Proofpoint-GUID: aCWB0RUazDInDVGp5bYlFDmZgWEx9Bvz
X-Proofpoint-ORIG-GUID: aCWB0RUazDInDVGp5bYlFDmZgWEx9Bvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130035

On 10/13/26 10:21 AM, Loic Poulain wrote:
> On Mon, Oct 12, 2026 at 3:58 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/4/26 9:09 PM, Loic Poulain wrote:
>>> In theory, every SoC integrating a CCI revision that differs from
>>> an existing one should introduce a dedicated compatible string.

[...]

>> This looks a little sloppy - can we infer the number of masters at
>> runtime somehow?
> 
> Yes, we can either add a small msm8916-specific condition in the probe
> path, or derive the number of masters dynamically from the number of
> master subnodes present in the Device Tree.

The latter sounds good

Konrad
