Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649051E455
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902582; cv=none; b=Kt+DVx7R04Zpwaj5b5x775mpP3RTOr2N4RdoCF0Q38J6htfqy8WGkdxhu58cCSV6p1LfA1rDjrSxvBjdsBx7feO0CQWtbhV9IXquSL7gQGSfTD0ddTjBwXsb3UNTKu/T5tYCz0QqEy3VGVTNkWuOrkhOi5sDU5bhL7wc9dkWfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902582; c=relaxed/simple;
	bh=nJihTvkKW/jjyq9FDC5njYiM5VHlRg6tH7LUP9HrO1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZV2L85rhUe0qGStJsj0FekBbkJmfYs3lego5Nyurjlm1IpUZZc2MFZYbJZk9TgFDzB/cv+rGbLVsL31J0gkEUOnUklJVAg1jo1UGzuBlN8FZZDgYT8nk8uKT1BBSw5bwlWIwA9RTQv+5DAcDghpKhNWcrLIj/IA9VVsx3pINrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhVsVR76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYrRN1Ux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhVsVR76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYrRN1Ux"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4Rfn2571175
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=; b=BhVsVR76itck0D3z
	zg5QPmRmTmTshnVrtAy3gUypdrbPrRbE8opK5kfXg173xKSMZjBmX5h3XlasoTKe
	WBCAx6+Fn7xz/IKL5I0X5EntGwE+mITdDgaFAO2+vnXlRSERTYXbY5k8dlYaUEGL
	1AV6rBZG1dAZN9NUvpVbTBcbCcC5hfHe6Jr+QNG4MPe33R/YZ07oJhLOWUHe6S0Z
	7onQOckA4TbnYyW7YP5yoKFR59O7d4alksWf9l/VNSVURANpifW86OXdP1OdYV8P
	0CDHXnifePpnH1nC4eBY4T5CbY2VI1NCH8+r/mriwmPRmc+JqIO2VsOj5QOsKRJH
	f7ulKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbg0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso23617085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902579; x=1792507379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=;
        b=CYrRN1UxNVjOJzrltHuRDmJbrMlT8O8FJsAokPVtz+XYzVP2/A5YsMXR8ojja6ZlmM
         T+JAp3LAnJgFIluRAMXB/wrIYT3aVnTVbRlRCkPxd6UFrJSZmeBHAy/kgKscMDAUsnPo
         DggqCGBAGb4Ck3r7IrJRuIJtg1CAfXStqjmhdeBM+7j/riCKlwM+L2qR+jwnt+1Cqdac
         FuP70IL54MBKHaYRNZIPWx+mmQ4iqkTkT0n6kLKGhteYTZwPm8vmNQKlI6LacA9gzB/n
         YSpPRVPLO8JmSKNbrJRzNOpzsimuxUVlqWsgNCnNBZy5rVTKv7jQLRsMq2NCK69NlIuf
         ybBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902579; x=1792507379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=;
        b=zgKe5CX6P/d/osQwZ3zgCHMEI2xFirA1w2WXFbW+gbiUTKYkx4zceRtlZYeJaRwq/+
         8cRfjmmhoLLI33urGnEvswgzEWszplmXq3K8lzcsx7T97GsnW9AAY4dwPFRNXo7Ot39q
         HBQ8jGcGOhl6O+nN9ocqozb7dgf7rwXvVj4FN/8n3qm4qL6esBrvuwq5bhVLq/dHyaHc
         f8AJ4TH494zbwSS3KJkWTiMSpbJqJLldIokDqMq2IA1g4JSqSdoBTTwgJUHLw/v1VQQE
         a1el/GigyM3s/utUqlYg0fExLFCHVAbiTdBqaEOyaoztLEHHLo2TN/8JXqdUhbeO3VYE
         6p3w==
X-Forwarded-Encrypted: i=1; AKwUvBz2BHUfds76EgBcZcvYcbmu0GYkzTLgtDflc+0ktdrlK5jhAIjJfNrYMS0jiud/i64r6LIB/2GuZD+o810=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHMEjANQbdJCsOKufPzb7glbPlH/J6Fu46E4zSZ7HG6QDvjJtG
	TNYjY3YNCf/RC4HnGSNvkg52GVdlBO7gwQzckX8bKIwqEnlR1+LaAlykIXc2e1p6zeK4Pr4n1fu
	lJdbNmSZ+kcHEf3n9ctqxLxJdM8uswJ2z0z1oXbZoLcUVS3CdWOL4/w8kh9TjnWTft2I=
X-Gm-Gg: AYBFou3I+kxmDv/LILadIzhHwcvNUxT6rc7iIi1HtwElTvqiMJB2s1p8gc85I+HcmkY
	rOI24CF/njDlnm5WcK/icoi9kjTLk2fXMrVhl+5m8zEeYiSutITPbVXVrnlrNr6T8VY+J3IApTf
	dTo8UGHr3mEAGwxZpkR/Poy4DlSGfMryJ0agfP8YYsLlVvdYnNA5vRycdG4YdTR8ytGT3aiNGD6
	7zv84VjQbMSfTu6DPuGisJfR/QV1wR/zhDQ2Xz9yDugnsFvBaKGfuQYQW80Ih1UgYybwO4ZGdtI
	EWcGnDFryw1uzsNxbXPbYnFynaaWgIon0peJwtrEWE0K9t6RY+o4bU0yyNyVbfCXPXbJWDLDzpk
	bve2uC2DD18tD9R/laxClBQ==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2186834185a.0.1791902579091;
        Tue, 13 Oct 2026 07:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2186829885a.0.1791902578567;
        Tue, 13 Oct 2026 07:42:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9764cc9sm608540966b.10.2026.10.13.07.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:42:57 -0700 (PDT)
Message-ID: <591af0a5-ff8f-469d-b7e9-7e0d72b03ff0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX9y/M6EvJ2S7r
 o2PGHUJDCN7M27GT25h3K9PKQd/pUhmD4okJo0gf83WqrPM2UvtqhkRhYo1aLJnuabQ6TW3fJMo
 pHdbG1Y3kdnJPUvyc8fC0WVIAVkj2rKo0xjqGYjYgXIyE0WUWLPnvU5B9lX18Vz+jlWV8hAKvsy
 JvSYZM6mGguCqbzakoH4TsVzJ7UjVEFdLcDJCyYO9fn0zW1zUXov5c4dXotV4SJNU4kQwe3i41p
 LCdPmNmhQMr8+BS/0jPndlpacNxC2I3iuWGIl7qNAQqyFoiql45zUhaHG5jcq4woVODU1SHVhsW
 WmlSWWbpHRIYnZZ7uaS19ZX7ZIZwnuaQjaA96cFgPO8EL0Hxb/Iso22pm5kckzqjSrbfjMSTcaH
 HpzZv2/rrTKIj2K4Z7r/Kbv2EHUcIyfPZi0jKAstMoQzdoCPCzYTidq9AWlT08npN9QK45Y2ovx
 oxWNGfbrrSICiaBOXkg==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace4374 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kLrOTjvlBrV8dJFV1dcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: g6KHtSj1R4MJG9Nu6A2Zmn3L2wAhs4We
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX7Dn+Dbfl6ARG
 bAsrl7osa7lCfobGnmstvki/UWfujYoCEcmOjV3v301xv1gPLO63LcNLFV/AGREB72paf2bJHNN
 8oxkUx6RWLRY1xwqLdj3zORX2zp/2f8=
X-Proofpoint-GUID: g6KHtSj1R4MJG9Nu6A2Zmn3L2wAhs4We
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
> all CPU nodes.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep_0: cpu-sleep-c3 { /* C3 */

Let's drop this comment and rename the node to cpu-sleep-0

Konrad
