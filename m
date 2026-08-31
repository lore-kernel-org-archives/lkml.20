Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839A199FB0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150689; cv=none; b=Rgq+fLbVTPmnZ2WvfrXBUY2c3Cf8sWxz/um1SKrc5VxS+UrH+msSQR0kCUVSdQU9DvKwh5q/F5FaBYcQihtFZk1btY8HD5mjsuYq2tVvY6BBbmgspI31D4ZXNxia7KFfvcCuZTckXg/XglL5PZUr5TPzyEupBqKH+iNZYRDCB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150689; c=relaxed/simple;
	bh=FzukXFp1mR/H2UE/m+gAEJb3pUpaPEomBslC7CLC8fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiNONEey2n4R5oTixUcocC9Sc2UTGLiDzRTs9fUVz3DW+/xiLK2aqdOumdCh3J5bTkvGq5OEPuzPUfONS+wi2T+EFTtyM4hUAZQqsLPtUYrDosxxyxAvqqjSGgMuO8W2fUv+cF9yWJmRUjbZoNSCB6tMWaIl8o2FeDi9numETiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3I8SLls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftze1t8k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3I8SLls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftze1t8k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bewE2179763
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hjgJ1lwSHA8KoSA3FsZ0pzoBF9R73voXRxLK765ld8=; b=X3I8SLlsjIk1spdU
	kFF4lBIzSKjRK3i55dg95TN7IgDUBqO/cVYS9ku5B2Q+hzDiznzTPXerQWZZAkBE
	npvqW6rInQKFW6MQTtJ1fD9aRUISuFLtawrRhaGrUwFaAlm9zU3fdrjL2LK/oa7a
	4yjj+D03G9kSIzoMY4Zjgv34MLfxHSl/mLEpzV2VnI7ntzZqjBFIEaxCLMgVLD80
	NZcmPjpd+SLc64HdCrHJz6gm1i7U8jcwPtsky+LQgTAAYPPXp3cyghqpTHpMx4CZ
	8TJ4fcM+JnfWo5p6MlPXyjRrbzcj/vgP5pWRQrwq1YuCGN5/wxC06wb3sROOeTWg
	QV8+/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2mh93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:31:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so1881971a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788150686; x=1788755486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hjgJ1lwSHA8KoSA3FsZ0pzoBF9R73voXRxLK765ld8=;
        b=ftze1t8kyBxQdw/lduJXAnuZ4IGAcoL07jKYHmr1OYs4YRpfZD/xvRolqOJTF2JAgG
         wvHr6GE1VvgvkD7iND1wSWDyqMuKf1T+Uh1ZppRxMz2IuG/GDDWyEMHXTYv26+/uD1IE
         oXku0IY3WXPMPazTxxdwo8QU85K4RuYc7Fcc8n23MwYl56PWM29ujimBryfsCPB9W+1c
         omFLyk/MQ+XIIgc+W/xK9cFXuYqwjwrYDqRqTKxGb72SmX2YNEJ00nwwwl4vDPNIuPac
         jTpSujj9P17RCGWkPZ+NYLKplATPZquUZPrVgGbTc5bzxdnVrtOPjr089VZNCkLjn2EL
         Fx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788150686; x=1788755486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hjgJ1lwSHA8KoSA3FsZ0pzoBF9R73voXRxLK765ld8=;
        b=gqYD156lc3LvgNzO5iwUH7i7dlRUAe69KITtIJajzAQB1q9ii6lgTNYstyFu8LNGGa
         qyVwlHkdA42388fWHJ7ZRlXLPX90Fl2mK1wRxIm3h8vLyeeUh6gc0geB9nCOG4KHRNpH
         2n9jaVKTt01nulvCFRKm2cx2GV5BsWyVpCrww0CISpJcSO7im7MaKIBim8u9fwB4d/pS
         BYywb8pLLQToRAHRsFpsw7Sfvpuxb5gMt6ke7PeEzJroP8TfALH1w9sFExetPxLKdhKF
         7C1OpopE4R8sZHB4RB6PC4Rvemy5a/a0klpekZ5KsVmqU8NayGMQEvryumwvnNA871db
         JHbw==
X-Forwarded-Encrypted: i=1; AKwUvBy983Kz7RnJkutcnaNCa5T91O/ZfZsF31nJboX3Lu0YX0R8XWoQyuA/9UUTJA6FlI9FrHCtI5Sw/EIG6sk=@vger.kernel.org
X-Gm-Message-State: AFuF++keEGSVeaPh6iogxiqiUWAG9jFezu+VhuT/r9Y6nYcYlw5dfGc9
	rSDmNR2dmmBYqZaIQuWqwQHLXowLL97tVL79sug4c4fgm5F7VHA4Y+KKXU3ivXsTFuvYE5tEyIk
	SxOhdaXFIK36JKgS+qDidLa7am90yV1FFVVGPErPWUdhkunbvr8KgKO8tqa7tzunnsH4=
X-Gm-Gg: AYBFou0iilp9BkCyotb9XmJQUJZpo6qyNbOQiTrAwjHbVBvKCwGh67JgCMtPC/4UUXE
	wGvWH/Fa8DcXWkMpzNFZGl5boVw5kMpM1/yLKJjMG2iPcZ+PUkcSUM3G0am2egAOJirBDCeVper
	yG8A3TQ3cPGps9TJnMJ1iABKKEFAOV0aXrqKdGuYJ+bQV9RkygCrn0rHeJW64vymm+0OBUy0SJz
	8U9qUCA06c3oRNGSbZ00Gxi7jR8twbolcFrOIUUrLFIG6a/s7co2o7MIsFJUzKIgp5C+9KmK5IO
	jmC4pHXJCvb0U3+ELKwDLdxHCbUylWcGvWvGm4s4/0iKx/oTLLd70wg/VE/dM0Z7cguVPi52XHN
	gPcaB/zhO1htYYH6fOykDZcy1azF0
X-Received: by 2002:a17:90b:3c89:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-398f86c802fmr1280117a91.19.1788150686275;
        Sun, 30 Aug 2026 21:31:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3c89:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-398f86c802fmr1280017a91.19.1788150685687;
        Sun, 30 Aug 2026 21:31:25 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm29840177eec.14.2026.08.30.21.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 21:31:25 -0700 (PDT)
Message-ID: <1e3f74a1-e0a2-4969-a236-1cf393b183b6@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 10:01:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6rFYKZ9SnTdi-XHmAN8tEhNHFSizjm0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzNyBTYWx0ZWRfX4IVRUmxLZzSC
 w/zN9gtklXxeBrgbZTuGUl+Hp9EnEfe1JQuonC7p+7qeiaAP5bE3+1u+UlfD06jJUlkvQH82KMI
 byR0U0esTbbWVW5dYVYA2qPQ3B65WMr+cu9CrKd+J6U9xaZF51T/cCSZXLlcZaKsS2QDxB92X4T
 y1YoLaucYySEPMW2DWDG13uh7qmRtgMdTVjMEFdgy71W9y7cIHiqZrmsUYQaW6JFVdz0GWIlXM0
 68MkbF66pHaCZpHe7G17IKGWFMAfPrxKxe1NGb9gfBE/TB6ytMX6T4o+04m2sf2wgGiZALtbWmX
 O5p8F/W4H10GAHzsZpiFy1gv6oMc6e1LZE88Qg8Ueg2JU3TuZoDPQZ82snPIS3Tx5/Y32wzB09R
 kKgEdp2k+ltaxrQIL4iR0czFmbvfU/C2WW6s3ztLqo3rG5He6SmJySO+8wDyYsYQjgZ2XGpaVNC
 d/dn5cXRrQE117wenFw==
X-Proofpoint-GUID: 6rFYKZ9SnTdi-XHmAN8tEhNHFSizjm0K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzNyBTYWx0ZWRfXxkqnwUzgzM+J
 EVucFFzEQuccjWVviAP0YOJ70zOTJ2AJcf1QP3yUgBAJhViza9+K/bjd0l1b4oB8eL9xzJGEW8z
 olB7cEl562SLlACNpIn1YXAjnSRbJhU=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a95039e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=V18eN7r6Dmmf8FOA_1oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310037



On 8/26/2026 2:23 PM, Shawn Guo wrote:
> qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
> directive, so any DTS file including both headers carries a redundant
> include.  All affected files only reference RPMH_* constants (defined
> in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
> superfluous qcom-rpmpd.h includes.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/hamoa.dtsi    | 1 -
>  arch/arm64/boot/dts/qcom/milos.dtsi    | 1 -
>  arch/arm64/boot/dts/qcom/monaco.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/sdx75.dtsi    | 1 -
>  arch/arm64/boot/dts/qcom/sm4450.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sm8250.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sm8350.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sm8450.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sm8550.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sm8650.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sm8750.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/talos.dtsi    | 1 -
>  14 files changed, 14 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

