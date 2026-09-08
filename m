Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A311A6822
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835888; cv=none; b=XMsLl12UHK9LZFSvzOiBxR9597/PzhNgMbpnWdxNOOARKVCNouQ+W+n1f1DO3UgtyBdkDtGWoU+Otv51dQI7M8xf/+ZxlooizpVxVw7BHGLNvr7i0DCtUpdgWOiBUdDBhyudMxj4ypghcGKg0rS10mWrntgdYtTX2uSuSAKm7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835888; c=relaxed/simple;
	bh=VjVgSIEHErlpVkc7eq+UEEYEg/iQEcRtAbhlLZ5+dpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGIKzcu/mE8fxJMmQFWzWV20dsChMiSuNYFww9Tx17e8cPxncoX8GW1FYKGU2P68gH6P/o/aDoKUbFHXJTIF9sCJHqq/c6XS4q5Az6n4jRD5Ry8FvqL4TSExbHuM1JpBiFgaXWb89sHlEy8RDmbi+AFqy5X4Yf4iZ9rgaIx99Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bzdc7Ao7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOLFY3nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bzdc7Ao7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOLFY3nx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Nnfrj684284
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 02:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXX73wHDy3wDhoXCZ7H3cw2yZLyFvFtSWJ5lStmdwDM=; b=Bzdc7Ao7GOAstmBH
	S7HFlU1yWBfnLbEY4k/ZaL+NvsGTCKgkzEZE37B8HrHk8jF7kjsFkOgUAt9Mxk64
	sI6Yh2mkHqYzuSomdl3Ha38vgSNUjtdB2wmjKYLuH9OKIfYPLB2LQUN+dDJZfKz8
	MDdJh7h3Q4gDy1d/VJsabaaqhQqd4YoLL9CKJlpH9qbUz64gisueNnVIxLU7pOlj
	ccWhCi608AC1BkgsIx+9CpkQYGTsvqB8o9JYkE4iFgUY4BISXQeLWDvwtfm5vc4P
	9cibFlMdPABs1Iv3w1YLhmbkY53GaE2+QaCJlk4hEMwEG2AWQ2Eikemov2pcsUm3
	HkF2Fw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077hm3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:51:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so80183655ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788835885; x=1789440685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SXX73wHDy3wDhoXCZ7H3cw2yZLyFvFtSWJ5lStmdwDM=;
        b=WOLFY3nxeaz03Wiz+L6Jo6OH0fITHngZU6Vy+wxnOPGmBMddKAdybM49epSflyM2up
         YwEpMokkuKYqbrrDqtUaehbr0ZZZXlHodVvL52Aqr44fQxWGRFHaLp3hjFNPhtoUiWlz
         MHFsIBaZ7a1vMGgdG6ifgkeGi6wo5Z1prpO6hMtpaSbt8kKutl9YJrrYtD0L8dPtXbTf
         VrpcaohyZQWngTKPBpQzVYTtEtM+TXHJ0i7ehgTnYm/S73yV4xwcAXjQ/Ve7FQJNfJBp
         lHOclsQG2l3uBNtzHQUHXJvClS1gd2Y5qwcZMU8J5M+nc05elc4TMn0tdXKTnWY2M5uV
         t9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788835885; x=1789440685;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXX73wHDy3wDhoXCZ7H3cw2yZLyFvFtSWJ5lStmdwDM=;
        b=C/Q74f8gbh7mJjjZh+D3Y0ccQYmXoWgcfn8ponhJDm9h3OnNYTwQuCLNQEAhOeZn4s
         HrURKkDMFfosnT00lzj9FUWIrGm9el/VcKu+J1EV852og2ex5tB1GNH50ZslTdTR8Bbu
         De5UHD/lMy7n2wSOMo8Kw3aJrvpWt0AGWmB/tOVjoTd+LqgmJxSOabSnNtotIIx0KWx6
         GvPDgYOYDSrxqCsg5kB4CawVnHz+0vCLJjeh9Y9Ty0+D9T7FssjcSgHwp6ia9Y/8H6fE
         AEPHTnaEJNqlYyJW4fhGdR5IGO/oQFNe6T4KXjwNReFyYTZWeJwpHfMtQOpEbdBeqtCq
         165g==
X-Forwarded-Encrypted: i=1; AKwUvBzCKMCQuHV2amNIqbf6uKsOyL7C78gQ2wbrk055vPzGddDb5ldOw1r1FB/EBuBTCObkoyCBuX3KbYRrnmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mCaDbddmUVsobWFzVXddVunZUEAf8ym2DRRd8bO4gNuHjjZjR8
	9/LTjc90pHIQbzelzwH7HtM+WMtU/88PozKUD7eUInfn7fOP555YE0V69VPsZEbHzfO7PL3kz0s
	slNP+UYqahqZvwDMp3+VQp0h+yiKmQEj6AKtv436XWjf4Csg0wxJKClhgEZURhS6gd0zvXzQQEp
	Q=
X-Gm-Gg: AYBFou3HalWmyMRRPuFW3HCkwJKzmqstehI6QAZbz1ctmM247he0DYkr6itqbjLR3Ao
	GKBtarPqDPYg/Sl9VdZm/BCulyYa8y6w+DzG6ONbu0VD+guSf11XWCxXGFoXlj4oAJjGr60t+hA
	rqQe9zjcTdYMy+Jkuf4CqdB6PTGJtj2rPGljHV30hoDoD7KaiLqkMZVDYkShHlg163WBlrZNBLb
	ZiehyadknXibyt5WgoPEl9sYjec5GOfZnBkGqEs13xMZEE+iIC9TD0n1QfnjK4qrAWiyXe1MJo9
	sIkqwJyHj0RjkRmvAneGDfQalLfc/AR2iHnZIaXUp1hRd1G0SqUtPriSxbqJUkA9KlIY3Msaufh
	XtnSCoFLsRFqMcXdmkFeR31b81Fq/Z4JrALI2gUx07QH4vLUW7GQxvM2H7nSwnO82DBtn5gA=
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr40560635a91.21.1788835884814;
        Mon, 07 Sep 2026 19:51:24 -0700 (PDT)
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr40560573a91.21.1788835884354;
        Mon, 07 Sep 2026 19:51:24 -0700 (PDT)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm23459473a91.1.2026.09.07.19.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 19:51:23 -0700 (PDT)
Message-ID: <062ea84e-07ee-41be-82a5-20600693a219@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:51:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAyOSBTYWx0ZWRfX4o9MEH/3Ul/3
 e2NTEwg8qA77NhKxfFBNmtNe6+Kod3y9mjsHhb1chOZ2gJVrNa6p9EAru+Ac3j2Ds+qEIC9Wq+S
 gsgsfv4WR8DoLecuMWfzlrFns3BTMUu9Zx9pZ5jVSTQaralb8wppFsu1GFvI3VSz61KYdBK2rtS
 BTAuE8e+5mDoBx0aXOOtgtt7KG8+HUcwxkmTNskQ8Y8w7fm8GUqHkQGDa6CPdTexzxOLaDxmuOg
 Bk2tww+6JZG2cO0ZA+dqu8yxtqV/2omC/pXwOCadmzWJv4TqLFawSWTlQ+nz4bN2RvTWz2832Z7
 MvaacVHi6RrGvcH/VnUAQDfU+V0tTDlUbCHLNEhl+4e+FWANjH2+64tGiu6QcCdna8jL1lrhr/E
 oMV1cOrAzyXJPdYbFt15vCBIpe6iwLcnmK4GDOaHbR7KPF7TQUT+DYBxRJ4emYw1keOyMqgM+Ez
 R/j1XYl19uNh1raPjNw==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9f782d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JBeEZWaBV44c9fYEBTwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SWrnKd5wApccOOqtT9I9u2iDydi1r88E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAyOSBTYWx0ZWRfX9yZVYXDNb7eh
 Nmm/y1A/qUcwQKPgMmszue3ZDR07qE6fv+3+fbdNOEFbCUhIg3xM4ZIYpgn9GJeWw5sEGQr1s5e
 uZGWc9IbLSDpz5+pQKcaOhjdrPe0mPI=
X-Proofpoint-GUID: SWrnKd5wApccOOqtT9I9u2iDydi1r88E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080029


On 9/7/2026 8:03 PM, Kuldeep Singh wrote:
> Shikra is derived from Agatti and uses the same QCE integration.
> Update the QCE node to match the underlying hardware implementation by
> adjusting the fallback compatible and related properties, including
> clocks and clock-names.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index c1f06f692f66..30c7cabc058a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1075,10 +1075,12 @@ cryptobam: dma-controller@1b04000 {
>   			qcom,controlled-remotely;
>   			num-channels = <16>;
>   			qcom,num-ees = <4>;
> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
> +			clock-names = "bam_clk";
>   		};
>   
>   		crypto: crypto@1b3a000 {
> -			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
> +			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
>   			reg = <0x0 0x01b3a000 0x0 0x6000>;
>   			dmas = <&cryptobam 4>, <&cryptobam 5>;
>   			dma-names = "rx", "tx";
> @@ -1089,9 +1091,8 @@ crypto: crypto@1b3a000 {
>   				 <&apps_smmu 0x96 0x0011>,
>   				 <&apps_smmu 0x98 0x0001>,
>   				 <&apps_smmu 0x9f 0x0>;
> -			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
> -					 &mc_virt SLAVE_EBI_CH0 0>;
> -			interconnect-names = "memory";
> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
> +			clock-names = "core";
>   		};
>   
>   		qfprom: efuse@1b44000 {
Tested-by: Wanjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
