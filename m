Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527E37B3FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845969; cv=none; b=KVo/8hngTr6GOnM+NatfiJJfurbj5ghZvE4W+rLZQjOZ9tZWNNOvNCHBIYwAaUzAPXqsoUWsz0qxoGx7qaN+IWu10b4llCGbadQkVY+WBnNZ1bOco/9PjJRAbydWHJMj+RT16ClFPo9EK8CKnKbO1CbuFUlcp0nSTvFhdk3jJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845969; c=relaxed/simple;
	bh=5aoWEdoIK4LG8jJFDqvXeQojo/uZNre8Vv41wWy/GXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G30yYgOtc+tJjrAgm/i57IZI0tWdt9O4F+HKaeafKZg/hy1erU1VD0ucKPDIdxxIqW3cYuJPNwjUbRKhktnX9us3qoKNq5k2LzdLQ8L4OmKEYdm11ZQfVXVwEr5R2qtJqopixTRgGZoAJmxaGumaI/g4GOrmsQ/3PYZ6IdqpqZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/BhhBwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHYyu08p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/BhhBwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHYyu08p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6883pPmA1151278
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 05:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgXJRuS6j45tDk50aJ/oEXxMgdJ1P69nwuH1jm3ZTs8=; b=a/BhhBwLUUXM2Ams
	UKjGYQsshyhWnq0ujOrCSpk/JOiNz2KONFU70OA3hdAd1l0mfZQNyi8WaX18yWzE
	OrR/69sk3b2aiiM3NLp8jBnf2HP22qz/XAAMOaB7sQ+1ZOuTKM95XDRo0fXt0bFA
	X86WfZ7abxpF4BltOTHPkdSkG9kNLSnI3ZPXwTPNIxy7PTS3ICAYaPSK6796TC0o
	4ESSUwfkyJ1AGSeWg6ijNKIiC97n8BFnifRRgfSHHeaeyG/VZZ8M59+nmxLUl+UH
	r0lmoS1q1yx26J75WiH77edD0D/dfMnWCe/sPhSPj90u/dU+PBBrtAODWZrmYVSm
	iacqIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjga1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:39:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7169704a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788845964; x=1789450764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgXJRuS6j45tDk50aJ/oEXxMgdJ1P69nwuH1jm3ZTs8=;
        b=OHYyu08p5NRQg2U4MsVq0oEp6wVODueYqaJkWfWIMc3AwURymxuiKLCrxIZB9h/XVt
         3bjJogXSnHy2IQk1TivU8/M6EX1ttcRnBnHOYRAZKTue9h80EY5bz//JpCaYK0g9Wq9D
         SOjjb7YkL5PLQp4kacYUJvzh/NswScSwV4UQqSUJCUxbCZQu/CMlJjj5mN0G57zUbvIW
         WoyoNYAwim3hJmnccjGS+vqdp1hATrk/EmjNQGwx711IuHpGypj73tqjt0t/kTGbYPak
         F4qjsPcrwmN/1/rKv8+WmPcbTGFCJ8C/sUWxjDtDlfRPU1mg5p/ygEt8OVHXGmVoz9gK
         li7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845964; x=1789450764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgXJRuS6j45tDk50aJ/oEXxMgdJ1P69nwuH1jm3ZTs8=;
        b=DD5p6QbfK6Xc8uk088OCojgdYr/0JBu70BxWtgJgQsWU6X8mihn4lF+suFOtUsOWh3
         9GdSH9JcHUO5zJ6d1givfqjTwTz/oBV2lw46JYbR7jQixQpTC3vLNSdIUG70DqENgMPe
         JqTQRTmZwLG7PoaKV89nt4V+uKFAuJs1nj/AXunASFLGO+VHkuZ1e2kL9Wv/v8MvWZqa
         kwIU2Z0J8hwqKHCCokJO8WNSuIRndLS85ZWPzznhqUnzI0Ya1x4HqgQoesq1u0X1H2oL
         zM3aCA0u5LjFDpIoQhtVhO/SRwT49VzsjeKkUGbVN3U/kKE3n4GlRh/tB3qrE4zxpfJ0
         3TFw==
X-Forwarded-Encrypted: i=1; AKwUvByX+cZR0kXE0FjXpotjFuXn3EGhDDaDCntRHz23arBOTMlrnC9xn3XyClIx3T/gbGGyNLzmuf03+1er2Zs=@vger.kernel.org
X-Gm-Message-State: AFuF++ngmKYk/UGhLtMfcaEkomMwMfkURuOqWt26rXalHQMgRoxh0tXH
	A9jy43URrsVx45uo0OmftDY/Rr3+UQS7q/+Oo6bAQjfqtJ7KxmAAOPK7GZy/Tmwzg0CiKPPs6hD
	DDaLjW7sWMJwQc6WRMQvRCFtzpNzLCzVR7+7w3dRQOjJeb0nPMP3/sItS26gJA0gH/Hw=
X-Gm-Gg: AYBFou25rPXO/NAeo1I1wF9neZ166jIRzK62I43b3GcToQzL3IEUb92w8eSHOaJPvJW
	YmRyvZ+jJvcCd7C7w+yCaCh1khQfVQtkfKF4aX6x41IAKHp7ZAII4imsKJHrSjbRHWmO0R8yaDn
	pljmW6m7cRfMRA4XHWhVce605mo9xghzhrTG99xCpmU6k09ioRpiwmuf8OWeyv9fZPXFMXW+fqb
	THmIwAKOJsUk6rt09GFhK0E+PNYOjvfA5zqoUaRx6CpIO/3mE0t6IeUErJzULiQjfWtS0kqUfvT
	S1lSoJ4qMEm13jGtWGZyMk4J6WjdY/w6C8gj9cTKN2DHnvrlIClRJ5/KgijHb3T8xShXL67HbrN
	u/Xnknpq/Zdd98d9gJ7rqHYrqxU5wpg==
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr46802512a91.0.1788845964454;
        Mon, 07 Sep 2026 22:39:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr46802442a91.0.1788845964016;
        Mon, 07 Sep 2026 22:39:24 -0700 (PDT)
Received: from [10.92.169.30] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm27672840c88.6.2026.09.07.22.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:39:23 -0700 (PDT)
Message-ID: <8d10d92f-0afb-425d-a517-1a7b24b80342@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:09:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Shikra: Support for QCE
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <CAMRc=Me=JxgZv=cuysWhmwQjUp5eHcxzkzoPUnDWipjoNdn4Ag@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAMRc=Me=JxgZv=cuysWhmwQjUp5eHcxzkzoPUnDWipjoNdn4Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfXwXT43KruVjQ2
 9ACBlIZcDxdHXDxiU8MZmobYk96G2tZ3c+hUMz0YqXO9E+GS7jF/+bZlz9j7/+Vhn+jHIxz3Pvt
 x5aNWlS9nE6xLLFct3mUh8FpsBbQpls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1OSBTYWx0ZWRfXy08s4Yr6DaEI
 E0Vu0huuwPbQ/w4YSmOzovIwKXtJZ/izIz9dJL896Q8Qk8wlTEGWL2U5EPdXcEX3UCKcvU+Y+M2
 Nnvtn8KEt9N3+0AxRicG0EU8PaFHiA8Smqe6ZQmge3x1SZ+X0seZBqO1k15vkVV7+83ibw8uItb
 2qJt5SPrOycoLeLItXURhXioSXN7UXs+pLtdP9SPeUXPo6/wONQoN4tqoBGfwkS/SKOe89yhGEp
 4M9M1b46ryo3CvHifI2PmVOakG+E7guOu50s+1q+flf+jB3JL4SkoHpCYLS32Ua9eJTFKK5zcu+
 GdgnUnTeFGyGwy7UwYH65w1/rqI8aQiwmUb0y+a71oW0jJBDMrMuCETaKxLIsRlAOuWaUI5ezg3
 dcV/BvyaJ2IpCDzlYBO4i1DhSlHW/I8j3iadecJH9EXiz26Iza4BMc6y6z2f82BiavYss5F1wAS
 sKBvvGhyKLJ5EnhX26g==
X-Proofpoint-ORIG-GUID: yKJRGHcgTD3cxV4MROau4Cd0kCP09Z8C
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9f9f8d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOgB9dYqbrrgEkEPSjwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yKJRGHcgTD3cxV4MROau4Cd0kCP09Z8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080059

On 07-09-2026 19:16, Bartosz Golaszewski wrote:
> On Mon, 7 Sep 2026 14:03:35 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
>> This patch series enable QCE support on Shikra.
>> Shikra is derived from agatti target and QCE was using different
>> compatible configuration.
>> Also, one more reason to update QCE is, clk-smd-rpm was doing proxy
>> voting and crypto was consuming it. With proxy vote removal, qce need to
>> vote for it's own clocks explicitly which is already being done for
>> agatti target. Adapt same mechanism to Shikra QCE too.
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/agatti.dtsi#n889
>>
> 
> This looks like a set of fixes to something that's already been queued, why
> is this a v6 and not its own new series?

Umm, both commits are having fixes tag so indeed it should be new
series. I'll collect feedback on current patchsets and send v1 version
next time.

-- 
Regards
Kuldeep

