Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776650;
	b=p00cqi5Jr0Omkg0jGKJagjEf780cUmlIMvHybSmVrqXnb8c3w/lfkdNLAU9WkHtn+qPX
	 nAV0E/TnOmAS6ABSfO9C2foUINfUqNPoVG4qTwd0ksZdSC1Lnsesps1rmhbLogNREuBBq
	 vQumd92UDCmJhcc01tLsmcv0dsEzWKPUIoOeXuOy9XeLKJjSVrzMZnJMAS1oVFF9ddsRX
	 1GcZ10j+Vg1XhWfRRLXEX7qMB9J/qxivNPSgVSTlAnPhbHJf08wxSQwwxqs9cBBtrovis
	 eddyU1B0rC855XBG5Hk40/uIQYYM1/U5ldJVILzEOFFri3XP5udeKI+iCrpvAYwOx/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
	b=wpzOEr05rcsmUijb1B/6rH15JlHiXvs1p+up41h+xvqQZe/2uEJuI3ZYAxCoadhAi1X3
	 ppjNdbeTggEwxyET7FV/PZd6icRobHq4xDIAduDlUTe0YXbF74OY2eVoxvmsCWFYHOJFZ
	 Id3ZVzEesEigGWTviwEHtSwqoCIJ4/3VITNezz5RfCZsxz04/Ghz9BOSdWh4YQaRkOlIA
	 fA8wglf1c//591e1FQfjoYV/+nBSDN+GvLpLS7Rekoz4YHzHlqZMQyiKD7OM0wBayWdnS
	 OObDFuAKoVp9HokRbf0fgNIC9HPPAA5i2wztjkD/RU6VLtnZijBWjoyddEtRzTRLK+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MXARMSj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80D606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C80D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXARMSj/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRfqx1814419
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=; b=nZ78Q9basjtzbufb
	bsGuc5p9DB0g1PCj+faIJPTKWjoMfCYXmUiPHibTlP4jWRRRbiTTM3ubyUQaiKuQ
	ygGtlWFw5d9Z9zSmkTB/6WrZ7B4QM8cUdq6ECTiyasT57LQ9Rn//EliSQ9b3XqB2
	3kylkqLUMLEOca+6q5ypWJoTC/enUbrZ3qpS4OyVxqvD3xCh3WUqBsZicI6KuZRM
	0ELDEvMNwzP/VjZbChoQcwZI57Ov3ctC8DC6r7a+yiV5AAf+9qYXUjVirIrRFJrq
	J73jJRDWNUJ1+5JtpJnL3hUsQQ0noyljMJ7R89a7wannUyX2m/C1mQJ/A3qUJtQJ
	eu+zxg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcbqq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2cba05824so2637479137.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776647; x=1795381447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=MXARMSj/UQW1iD14BO3VGCZEZbg2RKbFpYl5uOVBayL92sueDW2Gbjj04+HOnpWK+V
         kj0p6rhUHC9XWZ6ktOyvB61Fb78qvOWg1T2UDAWFA60Yu+wKIjP4Yby6dCDLp4g94OaU
         WeR/NcSP6drn0brwqH0AUyhWsURVFdRMZA475jIj4qpVnGp+dcswko0RuQ+gQwVg+rJZ
         uQtuazvQwS1RjWKDOiMdRzxIqlrVUDw5W9m/QcQKp+HrEqV7pIkSYJ64kL7oizuDN8l0
         pua14L0/BAhNXG6J4Mi5OcNxQc7O10vbCad5AMbLmbtcOvalYveMygL4JanJDR7tjvKl
         i30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776647; x=1795381447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=jWB0MRSjF+0xmTq2mRz0uVr6MKaGkvmS7S1Wn7XSKA0IHd9lCV1UycroreXaPho6w7
         UjTKFNIz0oXMqfTS5v4WQBIdJNa5loXRKDY6UfM4q20NuiJsDXuYM8nt/BfdNkixcVox
         zJY8PMKWsN2Dqp8WHVbE6FN3CEZNEiQXR5hKvz/yFiKpg3NzB7ATgkwVQGaW1VI+2j1p
         etd9LGPhnm4VNArExWUtM9HqCJcM5iUQyszE6druL4aPSCvuV6Q5IUna4s4dtr48lY0d
         T6XZj4O1XKTm9auJEmKNhegMIy/Mplzl0sC7n1+39Z8FYz+5f7HygoBouI6MGexgYNEi
         I+SQ==
X-Forwarded-Encrypted: i=1; AL+hErHEwJYpeHwS4zZNAgKQPpUXR7LXWa5HYjf0aE218ciUOW9jt3NWPLnl5VDbZI5V24C2RmMupSMFQCcr/i8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jw0BBu4jO+efNc7cGHty4VYacTgKlXlb02+NqxWxYKQ0uGOAP
	lzqvvAfybAtrXZS+osUM2sywmzZgvdwJW8AkufsRlaz3jXtcX91ALMyZwiYdf5g9z0Ep3CWgZAg
	fhlwmkv5w4HD1DdoeTxPL/oVD/G8Q/6Pr6+E5QcxKM3Ndny+LOhPFFxpFWxxN4PXbk9E=
X-Gm-Gg: AYBFou2B5FOWXnOyOkVv2Nm3AdHktKaTjmR3h/smO9/tSAQnPVxeW0R1qE07ZhZvzrb
	Uld8+tZjt5jdNiD6DpxUJe6NyOrLBhZovME4aHddMnwJXWXXVGWzwgGKcWnVZcuV0EnpAGR0+aD
	BHBm/xGvNYzPmf3zrd6ExT4EB4qhZaRl+LwsSNHSnHS1ix0dPtsDH1aJ1l/S3eyYifRiCu91rMf
	+XzMFbUTMFJ7iVEPMTPQGigIeViyZ9v+OwDly533EQa9tjvLDwWdUqTYUmNxujRCwp40fPBiBOg
	XctcEHbEeALRenw+Lw6wtCaGpUOP0dXt4LU5JTBqwDPMHvklSKhaK+tqe7IQ2GUFsccL6iMmcBC
	P28ROgTpDcqz/bJFy+5oE4uT54m+b6DE4ldVXoMVSmJwocKLXqJ62GPMSWUHUcF50GJwwTmTQ+X
	tL
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103477137.2.1794776647564;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103456137.2.1794776647090;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:06 -0800 (PST)
Message-ID: <43da6a90-3a5d-4a2d-b2ff-7f007faf7abe@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:04 +0000
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
Subject: Re: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in
 calibration mode with per-speaker events
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.6938504071664790577.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.6938504071664790577.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3wpplvBDgp8x
 Ize3ZSA7ouVnNsbdA0Cjqyru5Jsq9geZX42CNEwUoeeFmJQGJlcRIydRL74XqDNIKXvpwfANP/P
 FAZDpx2sqFPij530KwU5MsGcA+r4QgA=
X-Proofpoint-ORIG-GUID: TSrQcKKTwwagCQY90ctZL4mgjMw9kpyW
X-Proofpoint-GUID: TSrQcKKTwwagCQY90ctZL4mgjMw9kpyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX9RWYfAkaYR8X
 YZN3xU+gJ0E51T45pW6d/LdTSo8u6sIzcM9j00b4W54nnHRfkwOUvD6Tfji8zvU0ES8QeK/Jz47
 byDcI8ngVBWvUOznt7OajCiYQEPqt9Guz/+5B+Mk56mbSMc9+Vuv+b3e74Ww5iz32OfksBRK4uM
 FYRceLns99gWPdtsGXWWDXiOsZtXgVUQ3hSuMc8tQW/xpNH8nfaufiSIL0PHJWzSKSFSphvdIzV
 dRyfL9bSdQvVpScUcc8sEBqr2cPMGxfxcvY9dbNycrHCCan/dZgaj7S/d4jsgC7D65xvfyFj3Ys
 lIqythcUBtUc81df2yB22CFYnZFOeIWznzTvdIkWfGvYeXBN8NoccQ2v9ymbp1yLTadlS9TXG26
 bTmtZ0PrRw2dK6yhdxm9fCvhsBNoLbGxaxMqTocrkAG9EcT3tkzXC2Eph1aTq4f876T6rIeiBuA
 16KPQPDNR42/Hx+D1Dw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa1e48 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tHvR0g-A6sjxE3NzUXEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Put the speaker protection and VI modules in calibration mode and
>> register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
>> and measured resistance are reported on their own.
>>
>> Number the V/I channel pairs consecutively, as the VI capture packs one
>> pair per speaker without gaps.
> 
>> @@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>  		return -EINVAL;
>>  	}
>>  
>> -	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
>> +	/* One 32-bit V/I word per speaker, so channels == speakers */
>> +	num_speakers = num_channels;
>> +	if (!num_speakers) {
>> +		dev_err(graph->dev, "Error: VI needs at least one channel\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = audioreach_register_events(graph, module);
> 
> What unregisters these registrations, or does it just not matter that we
> do this a bunch?
These events get automatically removed after the graph gets closed which
is on every stream close.

--srini
> 

