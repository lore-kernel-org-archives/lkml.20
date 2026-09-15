Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8F4AF68A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488131; cv=none; b=KP6MqdWXLb5QkbwVqOrU34jyOBOjWPZDcWyF8+e1lmZpfiDgaB/Hn+HesH5kb6kx3A5S8jcXQ/KueEOgJ7Peio1wd0FrWzS+ug5S8/VGChsrGzuY2K8qJVArG9x1mODIZ4YW6ZArjwgduDqdmBdhieqO+h+vPdEtglGlllhcvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488131; c=relaxed/simple;
	bh=NKJuB0TIpLrtUCM0wUQ3aJBmWdnBf3WJenqkw3nEnrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWkBY0LDsIGyzMwh9y6G41sFt9dS6Z8nwZyZFlN4Yr+qmtCcpP0sjra2yhdvd5YbU1n+Qo1h8Qq78UDOJdBnDT5g6YrUwVF59iuC5wwwR3IqYnHqENC38wily0byk+XqwpQvrQJF2PM1fjEYWWaZROUsJnCyQgV5vAS196UeOiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eycpzX0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLZDE79e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eycpzX0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLZDE79e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAfkL3567058
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=; b=eycpzX0VnxykGJNS
	EGyXe31E4ta5U+T4OafNRm4SfX1w/Yy3tHqqklKVLnR0f8SEdqgeBxstJGqnAtqQ
	yu9wKqyYDEDwHcTDeDZiIw5iomem/kVVz7MFsfXzjadCiAXVMMOh8JDPSwSCuryE
	dTS847DBS0+ewmjo1q7xah/LjqiRpu88PjLWJP6ga/BKj8qSGHtu1SlbSdRYMLcm
	eBp0M2Ko0an+f+/+iAMZ9Jr2CpzClirqCsy5qfDgKUBPX1bhEkIiC+Brh5jDrQ3v
	XRoouy2cIZD3f5gGim5wqpDmmS/F593l1GMR1RPK5XAA5aS9pvoJ8Yal/PWS1XWk
	ycCb2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxydaupv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:02:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso85104685ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488128; x=1790092928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=GLZDE79eqAsBTa4Zb5SwepVYwKnF8OiN+EgBISHQXJSG20xYo4EEw+ngUFSVF01zCP
         1g3v1N0HPNr/jxo63y5m+vx4b04MUPo7NwhJZFmg9XyOO+psn9WFRjhtCokV9KC/sPcB
         Dj+On+R58SGzBcGLHq8LH4eMBr9U8G/1/ueB+Jeze6rCcnYAx39P8wKyUcA8NrIbNsOn
         GhVU4HX+/jbhB5XyQiOe8cy+/YfeMtDE3PZjG0TX6vBnwS/7Y5zk+CJoHOZjiqTYH3VY
         3zjUjDmyXn5PnF2GfwOEH3tvORLRLOd3oxfywDCZZ/B0eMZ5s3ZtRjXZCOnGeUqKzNaJ
         sO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488128; x=1790092928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=dBUGS+4CIwCnDrBt/piDq14/vCL9yM1Rr2ch8LX8iNnqInxHU/Xx1+s6nRl9INZsYJ
         Tojno42IGVhsgjkX4h0KqW31IbnWL86nAc/qTtWXBJEjpvW6u6SGtxlUQ1T4H8D4lWz3
         wP7owxmGdox916wqAHHC7zhYhB01zV/MEDwDG7tdG11Uq221TtoEt5Jg3TUoJCZj6/dw
         yBfIfQOVg7BFYCsKIpSRL2cyczzgkXdbDWR2X2gZg1kBBXRlWPZvS9X90cEF7P8ERAjR
         7BIAL5Xinz001VZAyK62HYejKaIbcYe5MQHTR46cc480jdaCGWffnRj8N0SDLSSKkQ8A
         A/tg==
X-Forwarded-Encrypted: i=1; AKwUvBwOXXhKXEr0xKo/Hy6vfMd9qOuoHGVtDTtGw9W7Bj2MnHxxB1FJTARctKeJ4p4CU7ixmPXB9ZCKupgMF3c=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Zmhc8q5XVkBxeZIZshZ0Qq/QADoJfgO1mRDAbu73JcQ0Kr7c
	itQPnfHaOyZ7fLJ8oNibI3xvDHQPyStKTBq/8yiQf1hVIrMFunxOVKUdCQbe1eulS4YdKCZ73jN
	RiffeUNr/4MGQNbP3LPxr+Sed3h1gp6ipKfmf3wpaycIMK3YZ//yjpmCWfxThBGoTUp4=
X-Gm-Gg: AYBFou0JNrdbdov8t8bmCoI49acF84OU3ILg0xSjMpqvLBf2ZzF7kDc2QhuGD6hRa2d
	om0ehWk+uObXQHcjAIiuamT7Qchs2N0MXziDTnT++HPf9XN59+Vsa+pe74DYLcQ2klrmD8lLm1V
	0VJ+rEUZGh4JUf33+ESjBgk1ILbfM+W8h6Xmy8RZ06+j7MJJR8DgmvbIqe/UI9WnlhbVdAwO5yc
	AD9+kqsY3wlG91Gd98YYLw0IPS9SyfJCk8V2WiS/dBEsHvbhQNlLJl00Vc05PQ+fE3OAlJm+oTq
	wo2YwWWx5//VF0pjxYIf037JKh6Cd/H6NL9+AzhcuRK2UsUzm3udzrdCio6aeqrDLGNirluB/Ro
	6cuvtu9+03x1yIkdJmPJMJ7P/DCMR4TJ8oFyZtEpy
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819845ad.13.1789488127779;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819005ad.13.1789488127162;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm69974165ad.2.2026.09.15.09.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:06 -0700 (PDT)
Message-ID: <f67b20ec-4c5d-4fb6-aa91-f3ab616e80b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
 <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfX8Hv3/FLfZhi3
 rYpo5g84z9l35bScFOKoD7nqYAL0fZ+z3gIP9yJvO8jxxl+AAXpkyGRdVhJKGUEpYiWoTUr/GVL
 VPdvPK1dfA+bPdIoEvSvYun6p6J10Gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfX/KvtwIJkSqFB
 UQODvR+PzNsLNj8iMhnMz6MQFOk4BQLessf+u3mGMTF9SaAzZHU2iIBjGjHJtPHipLiZEb2+9Jj
 RJtX8jywGklQhg9+spAXBvnzNuZX1M+mP9On/UR9ErBCqYLwlOZbD+zr1x6iJJhGAkoYP5szuVZ
 zKqrsTWkcgsZ5ZpydqL6CcHhFNNRAPTBfpg8NtsmV5y+HnIvfX1ijb1iE48XUaNc+/OFQE7U4s8
 o9tcrPS8CfLCa+622ZfQW05Acorz1rCWQtD6j45jkxT2dDPPY+l+DPIvgDO61Eo42yigoYl/HBM
 DkQuyI7HfnaJ8Iwz52iyex/Ov7h0Nr9fU1tuEUE4+Pc2wUlB6eMejyLNoce1lwSNAqch1aCRKcy
 Zavoqamhl/63kBX0LhIrI1Z4AEIFZjq3atqdmaYB/haiTt9GyaH8BEU/pjMQADsu9h/D8/qBE7d
 sFv1HIWYSpsdjp2zwuQ==
X-Proofpoint-ORIG-GUID: dDJwAK6aP3Gw1RzuSarxEIm19QvW6Hdh
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa96c00 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xBKF7SBF3-SEUEZML9sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dDJwAK6aP3Gw1RzuSarxEIm19QvW6Hdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150233



On 9/9/2026 8:24 PM, Shawn Guo wrote:
> On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
>> Document the bindings for the Qualcomm Nord Ride board
>> specific sound card.
>>
>> The bindings are the same as for other newer Qualcomm ADSP
>> sound cards, thus keep them in existing qcom,sm8250.yaml file.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 1536fcd96d68..bdbaa8c822fc 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -38,6 +38,7 @@ properties:
>>             - fairphone,fp5-sndcard
>>             - qcom,apq8096-sndcard
>>             - qcom,glymur-sndcard
>> +          - qcom,nord-ride-sndcard
> 
> I wonder whether we can make it SoC specific like qcom,nord-sndcard,
> so that it servers both Ride and RRD reference boards.
> 

Ack,

Sure will move to qcom,nord-sndcard.

Best Regards,
Rafi

> Shawn
> 
>>             - qcom,qcm6490-idp-sndcard
>>             - qcom,qcs615-sndcard
>>             - qcom,qcs6490-rb3gen2-sndcard
>>
>> -- 
>> 2.34.1
>>
>>

