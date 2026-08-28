Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62383DA7C3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920672; cv=none; b=rYIrxVAjVBS+aMnsb6UPUfZa5H6/myCqMmnGNWsc2L2n6++UH1maeOaPEuisAs1n98RC9EMgVgr4DD4c1fBm6aWdK7L/gByr0t+tJ6IAdza5yJMGwvbktJ+WFUjwGvH46GHWqQNMR7dXOTOPyZ4U25vqrFw8prjmRz5DMN9t2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920672; c=relaxed/simple;
	bh=xNHLosBmH0XiPfdIaRXd6JhnDcpZkYxuucgrupLtItA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dq5UI7bMVsFkiNa7HVyH0IAdOuLzjpeTTFOB/jGGm+E3xNQVCXy+c2tv8nBUEYD6YUJ3RJiJNkG5AVuJVJ/obDea5oB89AF4TMaG6JQywCsN5YqiRkKYbf9NwcOnC+M4L9W1H5pexJd0tngAS8J/Z1cWfh8pLyNUxbs267JArdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu4t0v3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddIFWmnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu4t0v3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddIFWmnL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA82TE3064161
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=; b=pu4t0v3wCfoosE9g
	dXq2hXl7rqTokh70/S9oWaNHqcyT9htAUIagX+Jxg0eotImdPdpDr5czgi3m2yfP
	iTXVBZMG/2uW54FGGSdbgq3EShkLNbJIZfoLOuKPv6dUWRxiJDbSpRlJt5QiVkmj
	XHC4OtdSBLwylx+7UO389Q/gz4DKCzZcmdj87VuQ3B5YGgrT3D+INrloYYFT4OQl
	oGjrX3bfRFXH30g0q5wBNjuB6avveEfAUqfQyRQZO+eyJoQpvXFfGuaLXkOMJErc
	Y5wG8T9rzp3Afw9DUiu7YxnxxahEL6UIbFNHU5ZVQh0nVADplY/0FWfd9vFamk6w
	WNI+/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1n7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d827597fbso11923741cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920658; x=1788525458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=;
        b=ddIFWmnLKGclrz1ShAtrBy3e/ZaP1Ba0uaicanj8Oxh1gHWYHMzrP6EryQC3FD8WtG
         STfpBGCD2kh535If+7fKPYpp3I8xHPjeEbPaOFW9wppv0SVlZl0aGme32xW5LeGUfquQ
         ue0ce7ru4UYn40D5/EJZob9W/44Q0KjoxJ4BQWMo36bp/YwVSu/4x2ilryuH9eh/9d/s
         Lbn+VxaVL49X9mfyUsvbM3wX0vMMq/61kCl/NEXEARpFQXU6nAqOfb8w80OfiT3j7pB4
         SKYSoDDEQDZvJ/lOwzjiMpsksT2ZGIhInm4QG3SocTqJ/RCxxLNcZCG8v7IG+L/h/ujB
         skpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920658; x=1788525458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=;
        b=bOJVOa9NytjQkztX8rZv8l/5shyJkvBmnsLIe6oZwbHd3M/3q9c1f52FusLRgpSMnx
         OeLgOKIlX+zImMU04eF7ZrcOspN+NysrOsuhmlVS5ZvaaRf4gb9tz3sLkZMpzMfQIKog
         3TP6kWvHeayeTq22U2kgerb9aqCj9Nmz/RDLn9bwH3u5501qRkD7pzCueHXD+XEkSa4L
         EheyCeMXbmHI7zsN8u+AOe2Od3w3CV2ocE/Wo+LQxtp6cFPrJBx+uUJkADL+AK+qA23+
         XLQsXvHG2HZnOJWo80cQIPgkO+s3JJWqWm0M2xNfuHDIVYpwnXAouKol5YwOckHCo3R+
         4tVw==
X-Forwarded-Encrypted: i=1; AHgh+RpQCpSpWlqzRtkYFSxyeMZtZiOCdtAnXGp7n0cJBFa69vfd7YSLjqtFQ0s/XM08uWtYN7koYROxWwMZnTw=@vger.kernel.org
X-Gm-Message-State: AFuF++kbSuQpxyQzwZQtkfz7YRZMnINy4UblEbE4jq8p2kZ7dz7dLJOj
	D1/mYmpMWajFSjgPywoUoSPPIRvtwP8zpjt8R6D1TjTBqj8D6J2WFSRB8Ke3SdRfVIdTMOPS9ZE
	PlPaR4oWNTF4GPawHYiaox+GjVIzYEatQqn15Bt+2Liz6Vo2YY23uUPltux6D1K3tYsQ=
X-Gm-Gg: AR+sD10P6IrbwTeqdzaGNqPEUZ2cw6TmFP1VLEu4bc78F2sc1dRwuluawD28SPeKk2V
	lnxoaTMTLVgMN9aaoHbODsW3eb6yfCg9v3a/fDNQiLeCYJEyN6k2laoZ12jORDqWiTejOh0rKf6
	/E+xead61W3rBQvFOV0sqVqF2WbdTh/ShDPjWCezQR447Zf62+aqe+UMadc7ZWfTCXQoa4jMa+u
	HdHoXlhW5R+XUU2WBE1QRqP53jcZtRw3oAgmZDxOS+2qyvw5pMmBl1VmA2/LrrY4Bhq1LexodOP
	3klVm+le18QZmJ48UTcsS8uPmHOnmfi91Z91q/6JM0b9hyiXwWDaqPlEzdujS55il9fziRP+SGi
	qp3NSeqwZpCXdm762wEBpbgR4mgY=
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr81965921cf.34.1787920658472;
        Fri, 28 Aug 2026 05:37:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr81957671cf.34.1787920653235;
        Fri, 28 Aug 2026 05:37:33 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm66837655e9.12.2026.08.28.05.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:37:32 -0700 (PDT)
Message-ID: <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
 <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a918113 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=bIOyMTNkgNfJq1KbeLIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: m2lzeLjQ0C8piuadx1HDZJccHdKdzA7l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXzxmCGp5PlvKS
 C5bcoQScOAH2JYN6qDkQpbc3BgUHeODhOFl0mEZTCtYqZzaGDs9fxeTnYCO029Gglh9PQGXa1y1
 xU9T9VND5fKcOTGlECsajHLEN2KG1Y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXxFSs9loelxvr
 a/zBRzmggHJ+QTAv5CIYahzBx5XzhfutpzaPXRQva3wRzlUhLW0pYpJMKtIltuGMDVV6PfY2o8U
 PJbnmtMVoHyqV0HB/XPQV2YOhzuOUU2aX+nWYomFbC26nq6OrWFvY2vQoecy00x1EGG4MZis3HE
 LZutK+eINiFhR3LYehpwlclbJwYB+bzOfSKlder0rENRWVpqbgktQ4kqbyFTH5foQU0yhRwfYvP
 d0rdIEjxL0Xr4r0R+rqEOeAUdwkU2L580Sj0J3vSy5rDTIGxKnZG6X79xWR+SSYs+9qGh85UIxO
 91H5vfxJcaQEXHTDR+MfVdaCa8NZbvCa6jndzOIHCXSjEwn4Pzu7cJRSXS2TzAaKGJOqk64aZs/
 RVE6C76nPaImzoC1bwLNVpLaRKfLVVnpK3BoQAex/a0T92DA40LxEkg29kHGDRX+NrpwNgtoi+2
 butoXncv7G7sYowPVrQ==
X-Proofpoint-GUID: m2lzeLjQ0C8piuadx1HDZJccHdKdzA7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

On 8/28/26 9:58 AM, Harendra Gautam wrote:
>>>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>>>> +
>>>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>>>> card registration to fail.
>>>>>>
>>>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>>>> beyond the supported LPASS port range.
>>>>>>
>>>>>> Best Regards,
>>>>>> Rafi.
>>>>> Thanks for pointing this out. We can either add the range check for
>>>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>>>> platforms.
>>>>
>>>> You should add these ids to
>>>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>>>> conflicts with common code.
>>>>
>>>> --srini
>>> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
>>> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
>>> Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>>
>> These are IDs that will be reused across both dsp and non-dsp solution.
>> So it makes more sense to keep it in one single place to allow the
>> hardware description (DT) unchanged across different software solutions.
>>
>>
>>> would it be better to update the range check in common.c/common.h to
>>> accommodate both LPASS and QAIF DAI ID ranges instead?
>> No, that does not make sense because these numbering might conflicting
>> with other ports in future.
>>
>> --srini
> Srini, could you please confirm if adding QAIF DAIs to
> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other

BTW, the dai ids are already added by Prasad
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240


You should use them.

to your question about increase in size, yes, this is know issue, i have
some changes to send which will remove the need of this static array
which should fix the concerns.

But for now all the hardware dai ids for qualcomm SoCs should be in a
single place irrespective of dsp or non dsp solution.


--srini
> drivers eg below
> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
> -Harendra

