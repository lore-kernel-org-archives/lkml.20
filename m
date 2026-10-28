Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206949;
	b=DIb27zhFbD47mV3UmxVl6/e0b7XaC6rm3At1CA626mSJEHadmtLAlV+9A1f0pNEmr761
	 IwZSDRRhhdCr8O8RFfSJ3rIndMLbaFEjhg4FgYAKUhAM1I7d6TLhjW/gOmTMmw1jWXrSC
	 hSaf7mukQaQ+H+5cUYe/0kmDzFkbw0nzcwq35wvDZZXvxhlsix+ZuiTFWNTUFK89bsx8z
	 bg+lM1WokB8Qjqi45rgYAYY0QU7xOBT0epwQx68bDZvjJKwur8g4zTKyWuOott1FgL+Lw
	 uQe6UB+vayIOzGBngCSRY7Lek4E6e4jy0ZpcF3uKdpyODgQ7LxQQs+5qJvKhgmHqefQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=;
	b=hdawXzme8wlxT1H72fSmh4lahlwvFbNuisbXoifrloeNGzv9i4wjTuRg0WZwqH47+H6S
	 upC+J4ohlI8CBQATZarAjXZIt+zkdAeyVSk39Lm6TYx1qm+01t0vvStZdhHJ6MOKB0zqd
	 yQ9BVcViT1k2hbDlGI+Gbiu+Y9JjYX9KBoLyoeRXhe07/RbBLNgQnn+VQbVXJwc18tbJf
	 AXTpbNtkPy0PVTPrrIqW6A7uIKHP7No16BZLQynTZbAZ9RlSJ0fnQJwPzZcdAGy1+bLb/
	 HX2y3BbSvO4CokYw8x3IvujdTjdfC95vDv/Fcbl5dddt5lgQFamBAh4KmLWMevPvi9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgxTOODj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdGl9bVR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E5D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgxTOODj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdGl9bVR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFADge2001634
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=; b=GgxTOODj+CQTvzoa
	+iMMYh4OZDS31jfoUd5g7+3NVuiEthNoiK6u4AIq3TkrJ0QmcZHsdHsrfpot+iD9
	wnUIim2fvXNGWdjH5837AI+T4Yvyx8yKFF15elWutpv4oX94UIMtXq+dyJdDMzyk
	qzxlVdaqk6zBddTv95/QIkfDjnaBDid7qTaYrJC2AVk+83zt87fzYEysY49bxsSp
	XvdBW1YI+WpI/AQNP/eVkl7WvFjuQmgsApTbFaIu+tq7Am6A9+EZYngaWc9SlQ43
	d6Da2sEyI7RpH3kr03b0vXxopqEXSxmgaIv0oK3LXrgXjfTo+jHt55TbRBKTJPkX
	HbTOwg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7t4j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:02:28 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45f00527132so426780fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793206947; x=1793811747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=;
        b=QdGl9bVR3Z1QKS9Nne1jXnwgZrVVvTe5a0nZjVaGe4pFWd7/2O5ePK6s+MMJ/r5pKw
         EAYwtweGTJRgdXFsiqD5SMNQBFPdwrLfdAbhHrG8vqT08uKHhW/ruMnJM//AOnhQvZOu
         y29heBTeJJjOtXl05RY3n4FV5GzdyDSJx9qkN1mE3UCSq48f2Uv9u0z7cxAcKSfLxrca
         FEdY+wOunD2IKBejkDGOZgB2Z4AcIwwESocHK43hY6zjZxduw0Swg+W4q4zrdDIL0wuF
         JrFMEgRkL5C129tpnbY63ymyiROziIXjNJfSh2HMPUh4wTEqAftRN4FLix19ptRhgtDg
         HwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206947; x=1793811747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r59FKrnAgpwtFUEMnG3WnE+uI3opwTysJe+70bauFCI=;
        b=kBB74wQb8J8IkEKh70bZf0cmrqRNcM5EUggsEZt/KpmSJGSepTbqywHrRP3k2e+JS0
         883TpRZhyjhEQKVnMHhILcnhwjrQ4KlNq3QynQ8//f9bTAp5GP9TTPI0g7Fm2HgiKGfM
         9r/tm+36wlXgXiuq+pNQyWwmd6UGxW9XawjnfUFb4tdh8Xy5BqSXN08UPtD/teerZej/
         ne5j7QZRV7iMEytFn9tihazEG6pdbjaNREzkkhnzRhNDXZLbQ3I19GFkcDdWjxf8+y5/
         tYnCYaAgdHU7oDEsEykVQoa6V8drrx6NR6PTCX+cOcWPSmbiskvlhEq8CGXgdVV3cSja
         kSpA==
X-Forwarded-Encrypted: i=1; AKwUvBwcAn0x4+Xmk7VcxmtkHh/2m2nfP94h95noVMm9zWWo5ilyevqQE5zAWOchGnQJ1MLbcFylbHS2B2YeXIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRmo5gmCFqNlthU58XDwe/J+GG3eH+JlnU8K4rpOqJSu68SO9f
	Ze1L+mvKY84TV2sYK52S9R3U1amFo1N2wRRi3sB6rtCyCc3Wr+d2DzyJrUNmRLZovY8ia9IRkeG
	DfyqPRVGWG3NPl3ecIHHhQ3jB1BBt+ov861eaTLUCeuRhz51G35v8lmMWW2fkQKZZVGM=
X-Gm-Gg: AYBFou1w1ur4WLjzqZ2I0aHleqY8RboBTQ7Wza+ENmIWV3/7G8efnopVqb+VOLAxZUo
	SIIyRJX89T8xhPFJ2IKXMbV/mqp0+8b6pVy6AadbYSrA/31upibqcpakOgUp0rsVEbBZeJ/EzsX
	/q0TnVtM6fsN0nPkTNECgKq3fnUfYA5Pa8RQz5ospc6VVdTDtA82du1hIW7bfqbSk7YUmLEgxT5
	o2uJtSxHz1ZD7zmj9AbsYsaDh4pPVW4RHj5VgWB/k7UmDlsnwzCj15TWO88qN7E562ivSTp+8y+
	7KD50YsTZaAn+bQppDjW9GLiU3RIq/mI+uKWsrBwL9rIYB+RUBEXB2M4D+KkSF+7BectdKMqYw+
	yAJg5Xb9ZFlA/Ub7PygLDwUBQDUjFpaWMoZi94UdONzFFWKjhGgsbTv1dzg8d2Wm5Qh46s/8=
X-Received: by 2002:a05:6808:bc1:b0:4f8:4a95:991d with SMTP id 5614622812f47-5637fee0c79mr2973076b6e.2.1793206947293;
        Wed, 28 Oct 2026 10:02:27 -0700 (PDT)
X-Received: by 2002:a05:6808:bc1:b0:4f8:4a95:991d with SMTP id 5614622812f47-5637fee0c79mr2973038b6e.2.1793206946735;
        Wed, 28 Oct 2026 10:02:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964203bcsm1733841a12.23.2026.10.28.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:02:24 -0700 (PDT)
Message-ID: <efe7cb6e-f4cf-462f-bb04-e3aa162b1158@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:02:22 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
 <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
 <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae22aa4 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d7WKDHGJSlPa2Yu6rV0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: tvGqPSG2L6qE6VewYawCKd0gOsKqbfhD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX4GbH0dAMtRBe
 TU5I1KpTX7JbtWOkatD5kC1GJBc5ffSNoQXbePgTB51A4TlRkgDpTGO6DkZ7/f5vwEq/KXVSMZZ
 jD50n7Y0pC4t9qAYKnGvh/3hrlsGGxY=
X-Proofpoint-ORIG-GUID: tvGqPSG2L6qE6VewYawCKd0gOsKqbfhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX5wmpmp7fpDhR
 fM4643rgJe0JZnOmOv0D2rJyhAroXt2MVBLIN/KxWFCQ69DpxrOphTmcAWhVOwp1ugPmpjhLn33
 25KcDMZf1JCpxVUtvnZLK74YqNgwDflCiHkj5K3VwhY+klT0rdhnAwnYLI+opCKMoYyMO7tkxyS
 Ma9lDayb7bBzz5ujT2+YdXYlOp+/M68+53OYDc293J4TY6J0debRBU2w+alKH3YLYGiK1YPzRcU
 tvS5ebe2UrBZuYkGjgaOrN24Q+VIKn9nfMainvGzorRP8nGqHBSyZIjstCZwDSF7TsT/5fEqsG5
 Ru2EwlZx6n1heIIym8mAVowEU7i5yGeDgonGD/KOjufnFPJvdvFoeTVLPwH3JLDA/ebihpLpZBF
 Rw/ur4zQ8OYC8DEQwzYyheWbC/OUiBhtNdaBmqS0+Cx9hHvbiUiy7ZK63+T/LQ3zUo4AKZIE4GC
 eWvizU+wjDexLXsYNlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067

On 10/28/26 6:01 PM, Krishna Kurapati wrote:
> 
> 
> On 10/22/2026 1:51 PM, Konrad Dybcio wrote:
>> On 10/21/26 7:28 PM, Krishna Kurapati wrote:
>>> Both USB controllers on Talos are DMA coherent. Add property indicating
>>> the same.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:
>>
>> - kodiak
>> - lemans
>> - monaco
>> - qdu1000
>> - sc7180
>> - sc8180x
>> - sc8280xp
>> - sdm670
>> - sdm845
>> - sdx75
>> - sm6350
>> - sm8150
>> - sm8250
>> - sm8350
>> - sm8450
>> - talos (fixed by this patch)
>> - qcom-sdx55
>> - qcom-sdx65
>>
> I am sure for the following:
> 
> sdx65
> sdx75
> lemans
> sm8450
> qdu1000
> kodiak
> sm8350
> 
> I can send a series for these patches if that is fine.
> But the others I need to confirm.

Please send for the ones you're sure and please follow up for
the rest

Konrad
