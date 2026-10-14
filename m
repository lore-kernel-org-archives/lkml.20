Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3109653ED04
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986718; cv=none; b=ErbqFD2hRFqL6YEuMmNSnkjSqLqJa7mP3IIXrmE7Y+lVk9c64cT2jRII4HGXGoxm6klRO/IfHiLR6aUXiefUu4zy3YfVTtiKdJ2K01vsDIASj3lkm+iuFXeyt2g1qKfjHGHVQ/aLenyLsq6KoeToHhJEczdJRnQ9urpgJSyeDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986718; c=relaxed/simple;
	bh=on2PEhB3zQq1g4jTu3KddnrV7cQSAaGoMUS/teguhck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9catMvggcbfewC87kFGeUc/xagFThGGi03sDZ8Rx4YFLDBSz6YEfpN6smxT96gI5HsPPWZChUUeI30fWGiW122Wp6h1VSGhSF7QAXY/C5ezFRNc9iDyt5nqLZ+BrPVBkiU9Uq9x82zTJU/N1rZ49FRSSyuLQx3IWChKqV252Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4YyJgJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqm+93QL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4YyJgJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqm+93QL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ECBcSd2088021
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=; b=H4YyJgJCbnABl9nz
	FmZ7sqPp+0OU5N0uI4WwVsQ6BxuZtcWiYZwgKoCwW9E/5flb+LG/sKBPnUMaNxGb
	7MiUv6vxm7rrJbssZja31V8RfPFlrQZnt4pmlMul6VixjbYUpA0WzmfXSmxssXsH
	GexKlSPHb4hhG/zIxIejefUy3VlURerLDXzfPEfZFE6w+E8ycwFaDDvZSLAq7tVz
	Ph5zbELPlNS8yM7v3qB2/zxDXe08DKhDLq2hCDYVlbcyt4Cx01KAMKto9sft7DEG
	ZNjw1b90zrQdHjUPewyxunuqZJHwgsqSU4Q9iiHBK/BDfDVeL7xKFNUXBM0H/+jz
	QAPAzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49k7as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:05:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so64603385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986709; x=1792591509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=Gqm+93QLsvhXkJGzpMiguhMUoOOWRp47JkJb/vPHAmMuqVmorC5sjrbFdCBfaRWp3i
         5yh6XyFHB01QIV/05mexdANyKCBPLA3hyh7kF2udnQP9kH7v94z6GEamTe+RuzwNrY59
         e7MRyGo9tjbVFHTp+LloYaLEvQAFqFbN8wvMbgUxV5I+gj8KoqFhNOZOpcS7pGKl351A
         MfroU84up89C1p8xQ13PbqfD6m5h1mSgva89+GPg+CicaxXavVZJoxQEAaR87Mq1V7B3
         QXmo6aACGyekZVhW/EBQ+2QCp/ur3XzpfVn37YrnMedZRgj6DlKE2I6m9Fa6GewkYw1Q
         5I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986709; x=1792591509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=JJaMbjmMtvJpSSQL5r/30tLPN4+w4a4kUCEJg68yY0VJ9Q9HiwU8c/BiCnXHegwJa9
         7dPsnnlfJPshomildjfXNdeDhoe+WU8vH21C153bLcEwu+s/hQogVBD7pvbjOon6qIYJ
         gkNgBS3V+P6j7ex8KKlGdBG+KyMr3DcYgMxzzwL7/EAf0/nTCLEW56q5DBNsWrRIk0Ro
         Kupbu8RO64tnTWwu6NwcjzfjtuibuV8agqfyprx1ABnutEYf3zdifbXPLOmGomZQwbFD
         PzgyJRKiYFsfImWzvC0kZ8/ElUM4O3P2sB4SYyjie0hwkdp8KOyDtWhP3Ln9VU6X19Ao
         pEpg==
X-Forwarded-Encrypted: i=1; AKwUvByIV9CaHpfEkIFd88OJ2yds9a8szWnfCAnbE4TFf3lB+L3LYGKUb6tFSpB+I+c6vYNKEGVccFlJtEB8UeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCAfE0BiDt7zD2SkU6LAGroUZX1seFaB1n2I4xqOhpJIPJykc9
	Hn04FOrF0P+mm7Hy4cxOxKvupxCrvPSGQ3DMrHra7hU/VOzQVzOop7aEcqZVcCEDY5pBQseK6AI
	JB230ijraI/lCGlXNypkFNknSfCUXaxn8MucWc30YhJTsBsRuhdYFiMlDkc0vU+Naxq8=
X-Gm-Gg: AYBFou3j2vQcabNlXKA/h2sR5KnY20q3GckMMHAGVbxpqmovYPUhAT+N6RxS99D+sZz
	Z00swtgswH7hapPRRKhD3GyezGfb6CUtcBu/Ucrh7V3xeaWSFo7ItbRhcF/ul+QV3ZSEBmbFlz9
	WE7ZJhrOyuwbq8NncJ40bHJQqOUAfUmcUsJdDMavkkqvH671D9oX6ECrJqORllAtSSSqudg4cyY
	aYwYlVW9Zm5b/3BA6b7GV3F05DVTHNF9koBL/VYiliHposuquCk08VDM5GSTuchj17aUFp+6NYE
	C5AsErBY0CMeP6y4MplwV2ISA3pPVi2SrP5X36f56FF8dY+SiNHTUJJXCYulvItUKh7bZiwLqna
	Ddr+NqPCXEEccnzC1AVVYeQ==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775884785a.2.1791986708876;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775875785a.2.1791986708169;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c6805985sm38426281fa.2.2026.10.14.07.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:07 -0700 (PDT)
Message-ID: <11f513bf-fdc1-419d-8eb6-5cabb6220fbb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC
 addresses from a UEFI variable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf8c16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jRqq2JA-ig1rCJpZVWcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwgMdaHbH1M/O
 ELprO+7hUKuUjAHzHcG09wmEU8XSbLpzEJK8wpv1RMa3P5lPmKesiiFCUvw/Rg4zszRlL3Y7+TL
 E8EyiW2arVULyUR8rPKicfqn6XDsR/eZXNhKKjaUdHH/Kie1kq55pou2PdMcYWK6ZHaGOCulAkv
 nJisD7x1WUR572e9GugXiv3ATtL6OSag4D12OWXGVgQY/lRzXvwX+wsprVDnpsFxdcb3Mt7D82o
 +ygHgYwEGhON2ExqeZrNlJhRcu2JxeKlc6T+/hV4DXrljSdgLucHnt75YqZ44qXPE+ErpWnKcT+
 PpLpRX8itRXjNdIm7eW0xk+vyKey7S7ZPO2jaIY63qwPnSayvqtkRNlnaolxjlg2P6KvkfGyDe1
 wwSk6gWhBH/naC6t2c62rbhmBAdgrw==
X-Proofpoint-GUID: 3oEz9LQ0bCQjFXnPOOEcQxBUwa4d1PK4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX8+woU8epwmgW
 d6cqjzlwpYkjYmZVRiwD2+4FLZkJVnbiShdXcuBjYJx8/ZL9yvrYiINu4bgYzmupMrnCsGLppPn
 FGwpmfVme1CuGa4xH1vefXGMwf8IdJg=
X-Proofpoint-ORIG-GUID: 3oEz9LQ0bCQjFXnPOOEcQxBUwa4d1PK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610140056

On 10/14/26 3:02 PM, Abel Vesa wrote:
> Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
> carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
> (bytes 6-11), both MSB first. The variable is looked up by name, so no
> vendor GUID needs to be hardcoded.
> 
> Wire the bd-address cell to the Bluetooth controller and the mac-address
> cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
> binding. Until the variable is provisioned the cells read as zeroes and
> the controllers keep using their default addresses.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..2dd09ab1d550 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -31,6 +31,22 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */

Let's drop this comment and sort the node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
