Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3DD4A260D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819069; cv=none; b=S1/FTB0D4XNMJpOGiaMlCF76OUkei6pikfjp1MpIVfFODhIynOELKJMTW2fNEtcFd7G9Au0klbCX6jVUquqd0iaXACtV3IeYXfUnETdADRoGZipXb1a3j9q1iT2asEx9gYtpKpVS+ZLYZp4uEjYViD+3PsFnVBMg0Zvp44LAYiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819069; c=relaxed/simple;
	bh=J/AWg2rO9t6Li0W4BRRLPjLIlRWnFxitTywIJjioLSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zq4EdxE8vl+oRFdmnCuC6Ijw3NKNKmt81s/SIV05BQzXl4D9rcM4Dd+wer14s5zfrS9A2dwaeeBYCiCZNljsQ9voXj4nhtHDcsg2lhyKnPyfPvXdfkHS/XEmciMAX4mmlocs+hFKZQpoKuEb4sE/RLs4j3Qrnd0n9Y1mJ4JkNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eS0NZrAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSiuXtrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eS0NZrAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSiuXtrV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0B9h1686419
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=; b=eS0NZrAncxL7CP9E
	URE+uPb+lbqKEBKR12AQ7Fw5nIN+7hUtX9CjVZRyFDfMUXWNS+/vxbkGAtIJQtSI
	qo4gXMtJJmrRAUxLbNO/Yz8ubpXmaWDAMlnTnphwlJyws+0saGmPXDfObudXSIx9
	3hQ+Qbv7dxKfNp74qlfZNYcn00NODxKkvYvaIZPZIcRW37MVmOnAhejsMN1kYIXm
	+p1mVZErAFyIEfDMZnVJ9LQkhxD5r7fitKQN+AOENkZTMrEh4s/KYu7LFIZLo8Dj
	aeQWtI/wyGHmfSldgX1N4w7VEF3drN7/8+AEYlmBzEh6RNWAG+8wtpYJtoSU9icO
	RbnJfw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1g74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c101b7f863so47646137.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819066; x=1792423866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=;
        b=BSiuXtrVOif7KvyhxBJ6g4C9nUclc6FM1SbH9CTE9bM9jUiKzmrc3UTqi+mZapN+Tx
         ONdIX0e/krodf9hDUA5jODWaqWzcmhYMdzlQMn7DEpBS+3+7B/zCLWK9C0n6prYqHNye
         VeCm9yiuIZ/dleC+uC1vqU2ja6oOkWARQIvNNFf9Q3lSrZ4QEtPrZTqftB0k0o6CW/E1
         Rxw5CimkCp8F+V9vBSad3svlLtxcpuyoqhNWnfApQtlSOzLJ7FLG8jAlU5AX+9xIsb5h
         SEgHMWCPaXDLyLHJcGu2PBTURxb0sZL8LUxwYjcZ61VuRSleusVxFh4JZBHz7+4ALyTC
         wFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819066; x=1792423866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=;
        b=cs/HWAAgfsbGkuakhQuYzdb956Qu3mEl+Nl3BbJc8XPULJDydH31ZHTv+60UORwSVx
         pnSV9oO+87mcy66RhkDobxjcFdOVLvOdq50Twe4B8T/XRfg3UiUTOBOqHXnNke3HJwyF
         fYncdFvYL9aLvIU1+CKcbwiGUqzFwVJ2LZaLENBSHvUTWpOSbTsc7aw3qG/1n0tKe3qF
         Zwl+PnArmoLszkQg4UCVTjLtdC894N8kJIEpWqmxE9lybQMH72KxaBRoWLxuc7QWT95G
         FBdmvpX0zvh9RGKY4+Fna1tYQgQ3XbphpeXZg9JKFWJBE3VvgeW3fwvEwHBSBbkhbFK2
         ChDg==
X-Forwarded-Encrypted: i=1; AKwUvBzsa1fCmtKHKHM61oMjTYj7ChOWJdc033oynAURdIggSicrveiZQg5H1+x171VZ8XJqd3NcasFxC/jaXOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiQoShxt55Wh7mCdqgLaUiDusVe5KNXaovUYGLg7RtwD2trR99
	Xqw4F+NsHgCSNYgkYKB2wtAhGjtwtkYd07E+yt3KT40g+1wOFMnHcN8jZuPJBpFBi0MK7LFUsmD
	6oMoU/zNonGVgZDF+rFPHh6ZPXwZqGUiOthPoI87v75s535ufkVszhcFDWrLTD7dDBjc=
X-Gm-Gg: AYBFou1BiGZV8lvq4ljMbn582zu2hIMXa6lzCvAc616St+lx6PDS7J0Ehv9SJyNkgXb
	2cbVd1Nvolwy7JZNDwu+uKpNnC3xI2Oc3jNVCiZv14hERN3FB7xA6GrStjmtlawj8JfuqLRcYUX
	cCg17wKgB1LFC7pyMy5iDXEEIKhXg7j1qWSaZeHFMfmYbl18ZZYc9YH3FxLFp2sN28rWguwvA40
	rEoxFsZtLFMLWiCdbHCLXBeBLCkBzH6uTDsqSI6SP6MP1R9f0i1dNMyqYoolFzID1Ux1551Wkow
	YZaeKNLUiQM38kjXeqoFbpvuH3wOQyksqllkbq89Ndce8yr1zO3FjiipThIfOHWYHBBW1yevn6+
	0z4hZOiyMqeM9bRbp2FVKSg==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1467512e0c.3.1791819066250;
        Mon, 12 Oct 2026 08:31:06 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1467403e0c.3.1791819065083;
        Mon, 12 Oct 2026 08:31:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm159103066b.51.2026.10.12.08.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:04 -0700 (PDT)
Message-ID: <4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property array
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6XILU+TeNTq+
 BJwPTYrfQzztxs7LCqAHeK+wDmktjbmGMtY48jigMbNsfxQo8I79WK0H0brtZNgWFwYpE3znFbW
 UotWV9IjwHKhIyrLMlEEruK1zLepDzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX794T4KdjrJop
 5V0zm4mvkNBjvSlRRygbAVHjqeBh2X7X1FdGr5A7fGcCXAzBGysa7KAlVbN1d3mBfns/CABp1wP
 EvC8qGvX6HhlOcHjsShF4mkKogxMzKUIs0ucmh4SQsU/YdKv+1o+h7YIY+LVvBOKeomQzXGjM+u
 HHfLlcjJcS2JilIuK6Nc6O95UTrOUiaKTi7TLcMvwJ+BzYlr4l3rChYjDrm3dgzE41gqI98J24b
 qAltAD8X5x4a0rsZMFEdqrttl0a0kjsx7C2ulaAq9Pp53YgHmXqWlavoam8YO7e0BO4iMz6k7Z9
 1Wf+7BVjK2JlASnm6oY+B4jFmCFtLtbqz0LkXRU516EJq1jcnswEtrz3u5M0bwhX1ticTKsxirm
 Mf8i7ktGp8Ib+bhUaErzMUrCyH65u616Eszwxcq4OA3j+/KZ9VMY5Uug5dGgvnvTWAq04H3XiRz
 rel9ZKUccbaxHy4kZuQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfd3b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=3huqtpSITNoFkarYwggA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: FjIzYg2ILCyEdv9r0E0Ti-MSopoquEX1
X-Proofpoint-GUID: FjIzYg2ILCyEdv9r0E0Ti-MSopoquEX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There is an awkward line break at the last elements expression. Put all
> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
> formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> index 24632af28d52e..d2b576a37c47d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> @@ -278,8 +278,9 @@ memory {
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
> -					  IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupts = <
> +			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
> +		>;

Let's wrap it at 100 chars. For lines that overflow, I think we may
need some brainstorming from the wider audience.

For reference, we have a couple of very long lines in the Qualcomm
soundwire nodes (qcom,soundwire-vXXX), and we just kinda let them
overflow for the time being

Konrad
