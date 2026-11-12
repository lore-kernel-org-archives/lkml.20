Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478278;
	b=VpdKhkvLrVjbVaa7cEOufnxI4cJBkawxVkgOCxrNB1jeWqGpBRJiAbKmRU0OqQWyaKli
	 aMOj3hggoI6ZCnXzRfJM15cVKorjAZf1gNA+z+HCGYDEgFXot+ChWjWRvf+/i8CUmAGWd
	 jj2v6+ahZiGscBRzhKf/44MT8CS7/Ey31JT0/e/PR7FETwk9Bk2o1rwgBBx4q8EzvQX+S
	 5vvk2xKsIZKBjzu9ph8YL5jCaGWlP1zZyOL0BNcq0XT8OBm/HTFP9+cHbnvx7vmEg6cgx
	 DIxYw70LP1Sa5e97CTMFOie2gGkzaga+c21nYa0aV349SGpDNrCAOfmTx/VYytVHVew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
	b=q674bYaUPXwp74Obw7OS+OumeXu2AL4zngOjRSN635BisxJBUQro8XEg6XCuVprdrldd
	 s1GWAnrYFo7UBPljrrtr0Zl3raLCuCoU+Ym1lq2OlXs6fw/jvZAiXLC/cbqU41yfyvQ0A
	 xjMPGQw/pN2H5y71TJSiQ6mWBEhz+yxqdMTBV+n13u4wJjgn/zXCovK9NZ4l3gm6dDjzZ
	 f1TVvzM0N9WVfIKpKoMQrRCFfNCbTRmVhhAdPfUJEu4qDjXwF227jqFIXTxXQ5VCYa60E
	 i+SmU6M1DwBAwckdHziZEWmidlBSsyGXiA0+kJlmU99vBQwjrarBMmmk70qxh95mKQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPl3mf0w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI8jmE8y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3B606A887
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D3B606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPl3mf0w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI8jmE8y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4luUb3893075
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=; b=TPl3mf0wnEZZiYrD
	BA4Fggl3UUBrsz0os/YuZlvZRaCVUPRIPEU7H6qGyaut/36RtBgvdkXGGG1pG8aF
	cLIf4Qk0XYaJ4+Q6fjf25Cf5ep6CcjgW669TzxU/onX4FOWRJheyi4eU35gQH50Q
	PB5VoVXeLXhts9Olw/wn7LaCYNbKOkKcDZG3BxSJnUfZlBqmYsdWIJZjJJrC1lE3
	D2BmccnVebC3T6a9utJAvP6LoFU4ORqZwVRbl9albTBDIWiTCt9/Fe4nU+9JgWgC
	loIt78qpM3D0O8i7wGIlDvccZ0ev8dIZFD7MA1J+rPdgXBL5HeB7lD58x2j/rad2
	Q7Lj7A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re13ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:11:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9995cea88so38654655ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478276; x=1795083076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
        b=eI8jmE8yzGFhHLAPCVNM6t/CC34mV2VwGLvl1cgw1svegQsaU59jJzB+72t9vl4qqB
         QfWpxMb66hooyET+LZ3UhbgQqOn4rUH1xcb611QTyvYCcSIlrdU1wFkSfPwogddDk9bC
         skINiPP1QFePXVflGtv0474EZWqhf7IjACesxgsj5FBDH7tV+yE9SlKidvWdxyYzKgF8
         ObscxgeNRTX12vf1Y57O55N66DkbuT5lVB9oRH/4VQ3Io433hIvxWEt6hLYlNHDID0pt
         AH2wexydR3IHhvM5Nc9axz/R26G8LNkdwHkEhVFz6nkyrCmFHNy3pcIhJlUxqj5VJCSi
         errw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478276; x=1795083076;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
        b=klQiBKyq7GGXCQa4TQiGK0S5eDzMU4GU/BAIaSUjZHYt8pQMPiNCWWjCyPoufxmJyu
         N/L9BAa5i6jQb7IgJfqYKQmU0Ojs1GW7m2dF6QhtviIJ7a695O04Y7YyO+WOunXaf1DI
         QVxBvC5cd54vfakMGSgWI3lm2TwaDKoG689UU5JjiysTUD/Hellc69UjsWOC8YCjUsgn
         XWjoYCEqytNnxqlYa8gs/9jOrKLN0trr5AdKB5RlfrQ/B5r3k36lKxXzopFZsyszHKuG
         pacEecGqxPasiLz7N66mg1qXEXq1NUgCpnd9TkyfYEyZ6p/h8ljBxSLXnfabcmX4eOrv
         dM9Q==
X-Forwarded-Encrypted: i=1; AL+hErF1IeYAGVr875mHcBIQVOrg20N08raVWvS/0FLwh8TjQhJZJuBksX43teGOd2UoiTk7Y3FEcZpUNBpVvSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wwZI3r/h58nxGl0V3jkjDvtzcGaIeymPejODD6d1SkDeztpVG
	JJGiELVWqt/WQUoE3Y9+lSP5JpXQYqjP8zB0HVXS9P2n6qPXy5BeqvMjBe+/rXtqWEzfpPmM20F
	wDy5lt4UryFirdJAfWf5qCydon/ESMIFOFgfMdXt0u3uycTgO9kHuR7qkTnSFn/yfA9g=
X-Gm-Gg: AYBFou3fkTF8NICrJTGlB7BpmcVkMKPAoS6bixepbAYdjoeMnI1PAC8XgRjwggWEzZ+
	4mN+4PaSeqoan5B36n3WyNUTMxw+F5eYkhwVVpAQAh8V77ZVuxCdbM9YxCO7TFZ2sGCOa1IZSrs
	j+li0h0cI8AhdGyG83R/+7VW5o63gW6KlFTVfv6lrxFSgO6/Km440s0hpfEwoLV8+ZDEDJfJpes
	RbeJcd5YatDZuiZ9qPbHhLEfEmjUmEQ0WHV/lQy1XQPbO5fMYA2INfbn7+kepaGQA4+k2ZcQ5Fj
	wF9D1Fiq+/o4XQ1sI/JKuIGUp+6HVqIEscjWsS0RPxssxF1jF+lZJl6tV8qADelhZgHzVMELO4e
	+8sZGFu/S4cQQZ2BIvvbETzuQ0hZM2AESQwp1ey9vZ1XBKzYtaCTcLcuQMMVxcBhANz3nTUQBin
	ydEy4=
X-Received: by 2002:a17:902:f690:b0:2ed:e35b:7d1 with SMTP id d9443c01a7336-2ede35b0cfamr40899795ad.61.1794478275983;
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
X-Received: by 2002:a17:902:f690:b0:2ed:e35b:7d1 with SMTP id d9443c01a7336-2ede35b0cfamr40899675ad.61.1794478275533;
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm32254925ad.9.2026.11.12.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
Message-ID: <60d25371-4dc6-4ffa-9f20-4c995f5e0d8f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:41:08 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
 <20261013-pastoral-magic-perch-1a2e5a@quoll>
 <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fvx-qO5NWpqnmUq_VTxp2waHRoMu8C3t
X-Proofpoint-GUID: Fvx-qO5NWpqnmUq_VTxp2waHRoMu8C3t
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af590c4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3XU7zFwr6z3BxEykzYQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX5hdYk3krUwV2
 eaIISNg2tf6GDjK6VmNMdMpJMJbXQJABRlRnnEs0Ah8p9CDKcn/yVdtDukSEDQMtHaeYQxhkRNO
 oFYJTuO3WCMc3n2W03Lzpte9m4wF+HQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX/4LGZxQCYXrV
 x7tHC0aJdoqJHj3oVCmHTgBJuz48Wsl3hql11B9adWdegThUXAqArh6dAfW0vu83ucxmr4Hm0tk
 Rkp9bqS6rATP9SETG+MBnzoKQWXMfT2Smv1n9GP//ZCLjIK2et5h5YbC47PafkSG1Qhek0MtuFs
 gHCgVAIohpJvjOzKAKvF1gqX5Ki51WCohYugtakJzULG2WKxRBnDRwSQ48SP2gPKyUL+GOpAzM4
 586rzf/wEBCY0PSj7vtLXh6BN/gS82YRZbSrbKv52P1CTTKXMoY6WsYTIE8wtd+0IS2Ydi1tAT/
 TkGjuR/lhCx6Lc4ev0i2L91ZPmvBTth9co40/iem8UdQUyJ07JMqp8Qpwb1tKrvyFhFIzsi+wKu
 W8KEY/fIrJ8l3KkmCmq2yFXIG2opAirO4w0ZwAWSCcBMnrdpo8y2JBUygDkfb/0sW4F5lmANLMU
 z8KoWWCsQuYw+n0sfiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

On 16-10-2026 17:40, Kuldeep Singh wrote:
> On 13-10-2026 12:14, Krzysztof Kozlowski wrote:
>> On Tue, Oct 06, 2026 at 04:44:03PM +0530, Kuldeep Singh wrote:
>>> Shikra reuses the same QCE integration as Agatti and should follow the
>>
>> `git grep Agatti` gives zero.
> 
> Agatti is chipset name and compatible name is "qcom,qcm2290-qce".
> Maybe I'll mention both next time.
> 
>>
>>> corresponding binding requirements too.
>>>
>>> Move the Shikra compatible to the appropriate binding hierarchy
>>> (matching qcom,qcm2290-qce) to reflect the underlying hardware
>>> description.
>>
>> You do not change any binding hierarchy. You are changing fallback
>> compatible which is ABI break without any reason.
> 
> Agatti and shikra both consume RPMCC managed clocks and clk-smd-rpm.c
> does proxy clocks voting as of now even when no consumer is voting for
> it. The required consumer i.e QCE need to vote for it explicitly as
> proxy voting being dropped now in patch [1].
> 
> As agatti(qcom,qcm2290-qce) specifies explicit clock entry as per the
> spec[2] and shikra is derivative of agatti hence, follow the same
> convention.
> 
> Coming to updating fallback compatible introducing ABI break,
> "qcom,shikra-qce" compatible in bindings got accepted in v7.3[3] but not
> the corresponding DTS change[4](which consume this compatible), the DTS
> change is queued for v7.4[5].
> 
> So we can straightaway update the hierarchy then?

I was away on vacation for more than 2weeks and hence couldn't catchup
on the thread. Sorry for delayed response.

Krzysztof, So we can update hierarchy directly right?
Let me send v2 with your prior suggestions.

-- 
Regards
Kuldeep

