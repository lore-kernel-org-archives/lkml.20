Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076C4DDB27
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057657; cv=none; b=g8ySn0SzjUidbBhPUKuaEQ3ji67XDN4zzaBObtpiOOF+/0jxiVT7+RfbggZeDkXzqXf9eyRV77g2BSrrApw/+M/cVrpzh/I75cDe74bIh43t+8B/OkbCG4zJ3M1Nk3lEdVS48CqqGrXJC1ymKKFNIX3ny0iP6hH0YOewv1poIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057657; c=relaxed/simple;
	bh=cBfxVIv9Gfg/4VI6OyYAvENJXNbIZlvGU84iWNLFcBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h81SuLpuLdyLmn150fo1VT5Yu5TIhIMytX8+Mykfdy+ttOKHqotUGaltaD/V6xQ744eslyAH9jPMDShF09wyvuZJBerBWZy/Q2PprxJukwzmF7kgzrkPBBGm4fgAwCUk8J2LCNEaGanyHc4iWd+Jr47Hzeqs7w4bkoXx7rXf+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2mJtIUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gku8Fsfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2mJtIUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gku8Fsfe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgwX3510289
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=; b=f2mJtIUbpKj/k22e
	6MtZiIbTEHSKwK1yH97k7b/APUhS9eExs5HnAcSAE5S2dIkVTfPuf8Q8yIYUZE1Q
	16eo9u42TEycFCvjXvVSgLaKHCDmtf2lZLkBA9/UXp7M5oSqXruMOYHQtwS0ioIJ
	3klfO7c3tIV+vI8plFpGu+IqwLxTpFFKid39J/YF1D7KlQFiIctia4eTB+Pf4sHB
	psWZncyxGdb1eQA4e8iI2oCDKdrCqupCR2tilrHsuMpERVzGanP8l6CIkbcWWn0B
	XeVFvqDuCEiri0/mIQTfwzYkqVQnobc8T0i9P/aa6QhnVppiXiS32/pXx4+GMqwU
	3/K1BA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9cte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so10562121cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057654; x=1792662454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=;
        b=gku8Fsfe6Ts+A2jU9avH7BGM8Y4XV7v3eF3/wOVslPHEOzw79KulctRXk1PqpeWNph
         aiy8paMjQI1F/CfTHxZcYIKZVlXsKp//jRYvoB1rnWcc5oSXB8aFwgJFFE+MeunloR41
         MxIh1L2XLiIdlD3fvy9cJKsWVffdV1CkynvU9T/Y5kGLIvxxBmIkzdiyh7mpLqD06t/c
         lRU1XamhGhMmcX2QeX1+L8+iv6kKa4yGzGgknf0ZPgMhcZa34f5driMt+dWzoQGUFdpl
         Hws3JJuVCzT5MjJokM9lDfdnoAIwHvGemQNloPVlIs81nFrCTv8ZdUw5iErQVnC6mIEo
         CJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057654; x=1792662454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=;
        b=zyNVMUjZfRbybAiacPvPosKk0Z2KvkaW181wifzKM5rs5DTIsZj2/MNZOxOa5jOJiX
         auXyvQWdacgyK4N2zzQ82fL5K3x+UD9bw3kNbo2HxtrkVAqnxD8Im+kCZQF7mC1e+i7M
         fQt9JZ6kjq6XDUXrMEI1UV+f/yWr6BwS57LRLNlkVKKUj36qRVFMzMJMbqcVFodoeKwg
         p/jgf0j14l7krER512rS8c4sRjRO8C3qNTvLF4jWfILmITl+rCIuNsVJt9uKr44hR6QI
         lrsUl9KmJ3AvbQ+nW3RWrs6Z/lB2z+EGZWbiRORU5ZyzMdtX1G6WfAgIVRRuG3IytpR9
         JnsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBfuGRoXMooApIU8eImf9y6NW+pD27OoObk4/fXO2EHdRCBeXCQdccnRbLhKBVQO8eDZS0c+RE5ZpYMUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa/u9Fvf3u04/RpAG16BpSLEPjBYe6W6L2kk8+XdQHFYx5UcUM
	R6FLdvf8lI336gl6zz1HXRUmAOUOztZF6QVaAZrBbDXM1bh4mN3cY6KTMhbdkX5XUR+inXN9c5B
	r5CaxdkICsNOGnZ0v6yF8Tl3B8vPaUM+VtqBvRKnHZ4NuHgPydmW5CKXDMsWNMs9TVCAducd5KK
	4=
X-Gm-Gg: AYBFou0A9wq+89lqsh2qIouA8ZQVtwXnxPrwp3NSN4trPemyOP3FdNQnheWXJfLj0Kz
	9gqY6oTsGCQmmxyHnIaSkYY2B6MNncM5jHv5JM3NfVed0fSSf0i6/apKBLHVaF0JN2uOtmqp11T
	1y+t5WMcpeEu2yLaLnFJaaD/kd7fq6rFe5aWLsDHrB5S2JCPEubN95zcfd98atfbjM41vWHnFfn
	Sew5dC1Y3bOlgqHPb9Bn0afuSVSdTXU0planbV+lVnWfdiZFpu416ibiWz0XS0p9xEYQhWmhoId
	L085ICsrNfEeNuTlR8OTHRgUX/wSzXAFLUzz2KfZCeylorjP3n9n0iWn9MyCF5xe0rrTi+1E5rl
	ElwLXgQYL31azlirsFEJyhg==
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr344359321cf.2.1792057654500;
        Thu, 15 Oct 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr344359091cf.2.1792057654008;
        Thu, 15 Oct 2026 02:47:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0a6sm103745766b.43.2026.10.15.02.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:47:32 -0700 (PDT)
Message-ID: <1a7d0385-db7c-4c44-9f26-74afa62c9109@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D7vfPIKWIsu96WBxGr-O0SAzeVnwWnCc
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0a137 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ThNut50O2AIRvfgEoHQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX+o4tDekRflmI
 81IfM68gdglP9eo1HudgMAZVg1cdIKDiC/ltmRdCqzbh6uFY6xRVRV8OmL4eTmJD9lzzt6ztf8H
 XHoNbN47P0dhYfC/nb45MoGd2dai5OTIi0RJsbAun/fQ6mhJ/Mhzt+STFl+LEvsajGBfE3OPDKN
 mso52c6tJFkf0IFYcNASezLuvvmm3K4MosIwyMy9G25V9j7t2a3orrEr/NlIL7HjbEGRBPlkSPV
 B4pMmnhEMVXZfXgDQNL8O9SnppJaixerfOH2xfrHW+7mX0GqwNaX9MKCBgBQhRco1hJUvb/uOhK
 b643Yxuxi1tO0l1E5/AoUfIlbLd+6WuJy0kpR0GtcVbC2I/QionKv8vC5iOmhBdZ7VK7My1ml+j
 aQzKLu53CTgqDyjyJyauyoKU2W1R0LgvbdtZM05Wx7hZhxFdtynC16WYHHK7OuuCb/OhEaGzq1w
 wO2v8YqIpVFd0TlHgeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX5SBjsqAqcIKc
 Cf7GeZWvbuWjHHd63YRj54nDhZP5/T0CU2GevpqbhAejaaO9aRIom/cnp7JhL6zIhc8EOzRxWfm
 XcB3scUf+vpZW4OtYLf1Ijbg5GmIgcw=
X-Proofpoint-GUID: D7vfPIKWIsu96WBxGr-O0SAzeVnwWnCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On 9/15/26 4:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Initial submission for one member of the prime Xiaomi Mi 8 family.
> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.

[...]

> + * Xiaomi Mi 8 family common device tree source.
> + * Covers Mi 8 Explorer Edition (equuleus), Mi 8 (dipper), Mi 8 Pro (urza).

								"ursa"? ^
[...]

> +	reserved-memory {
> +		/*
> +		 * It seems like reserving the old rmtfs_mem region is
> +		 * also needed to prevent random crashes

Have you verified that with e.g. memtest=1?

> +		 */
> +		old-rmtfs@88f00000 {
> +			reg = <0 0x88f00000 0 0x200000>;

0 -> 0x0, please

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Goodix Fingerprint) */

drop the leading space inside the value

Konrad
