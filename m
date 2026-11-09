Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213809;
	b=l5X4vS5UcJgoBXfCYoALefpEWWYDZfFxgBR7Zm1b+BsZ5poZ7Yejuj+mB/OvkFEBPuaR
	 rSXFCEuZurOtZvyqaiHeOS0UYO9cn4zRIR7uZU6TwUMKIHQJuf12pWDvOwlcan6FwTfhA
	 09YT5dHRuF/DMnnTpCSpPPT6I7UT/fKBzuObXD6otGVb7shORVMvrFXHXKQxan68V7DNi
	 R5BG8NLlHTw5bwuqCOvlroIXU3dNqnQDSahrqWfHZ00MjBp/CzAnVfrRnAGpG17oyER7X
	 KjXb0y2xc/pnUH0egQvTbg8Za6XRpcqfzetBI40RBbEgfnjPEIRCfv7TqZu3bSuiosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
	b=gAb8PtD+wPztAF7GRzfZWMzhTUH3NSUM4F7liwZ+yIBVyZ8aZjkm6PJ57WddqzGQyxzM
	 08dsCh87hSH2iNC72ivYy817Lep2jWVBQzhUSyI1x3TsgOne2UDFoQBYqKpbSC2PefZOH
	 xP5e/vgyGoJd7n8vm01D9uSUw22sLG++6qBldITsUvcZwZqeUP9NyQGDmH46PtPlID8EI
	 NnOe8Nhnx6iTTgKVHmpZPVPrTY+0oeRdRX9qKpOs36cWX1VmlwFhvNRK/+3LmFIF7eIGc
	 cCR0OduuXmR1vBsPTyDjg13lCos48DQwKjOUlDN+hVG+urtAdSgDFWcdWgDQb4wIPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOfghSB0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrQEXIHt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421EE606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 421EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOfghSB0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrQEXIHt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969xXY055799
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e+emj+6qiNrOat6TM8hv2pRr
	M0n+mR0YQ4yCLVvt6qk=; b=GOfghSB0/R60EzbDLySz6wvf+BFuGwqObvUm/K1B
	jjtXCbBTpoPoGnz4urnxpY4KQPwKrKeNKzzzuhMNFjnRRwIP5fbNJbNUPxsuX0yN
	LbU8HCjYzOUJ1BHRQgeddyUjwCE/GEcCbs/cuUQLJtmrgmbfUSoW6/uUTQfuGJwG
	N9/vjz+8AJQnQP9IrC7toRsMMuUOuEB1kziydvF7UzIJ0SCguBrXgoXSnBW6ODxC
	2E4omYL+JZTEktsv45YeL/oa04f5We2TZXeTfC54cHC8gn7TwtxZ9tgdSjnqrJES
	ySaf11LBx21aUbSKeLmsJkdTVgrUrysoiXlBJWvaHlEFmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2awj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:43:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1164220eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213807; x=1794818607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
        b=MrQEXIHtZKClR55jtt83FOeFas7Mkczfn507RQUbBimJc2NHuAIcizsmlYZIv3+Dh0
         5iX44Yk5BbvJfDwrwF2oP9yq+kCcG9zVnoPiUMKKxnPpTBRSvRBHlHfe8LT0TFdUXIls
         tFeb6zDIwBaOtrxms+W42SVqhbYdABuCM8Q5MShUk3FqSWUmIp8+O2ya/wMA2PsrESzx
         anyxjhXyeSoxKb3hno77dNYftdZvmX/6yfoxn0RMwkr85dp5c/EOQr7OcNaliWx0+xrj
         02D9qWq78udH7taFc3pg/iYcj5QlmHfHz+sAU5qgqK8T6qWLQgtBxITUElM4MxEQz0GR
         SiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213807; x=1794818607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
        b=ziD+uaFdvh6YSo99J9x6ZcBuGMfeKUwL2KGlhVedlegGpQH8vrRt9To7twxvHM87Jl
         4MfUVVYUkJQy5LwAsrwmrT0ZmoaYnmjZJD1UGk5BS67RDOy8myXM4vWzWqVt3+PVE1Eg
         xlB4rYiYUaXH9MubkMMUiWtiRpL+GZsvuB69Bd7AVay6ibsdeL6+kCU+/bkIvJHVtDks
         U1G2SFtlBhbTq+Dvpxm/tDfkut/bJoHB0NOY1IAmH74dP0sJ9gA58i9ehRiK3Mbibh8i
         L1ijn6sFKyD9NHRLP/OsBaM6Lis3WN8/5pBGUzY6Hs2z7PZ/Jmnu+uk1KVxBA2lQOmAB
         rUug==
X-Forwarded-Encrypted: i=1; AL+hErHTyu7hix8JTlsmk+YbdySkLU8C/WJ8ES8rIT7KbgZQYrTYExwzzPUehZfrq1Mm2txbr2q2CPLIyWqpL1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q/KYi5RF/ZvjTJY+rk038loTKIEx0dXAT2xRWOTLBvqC1MvOR
	eaC4QrxSzbi8By8B81NN9Q+eyM/k0yuN7aDKV7MY0TzHj3aalKapJLDgfNdiOLwhiob8HrNGBVv
	vd4xofFDSqPtwx4QAabcm121IxVnX6lb4N2JASjwOlL/larrKP5tFJdpZvGpYpb5W0WA=
X-Gm-Gg: AYBFou2TJ+r5kp0J9Xj4P7dGFCCUZLN6DTEQWxlEVlXRLxgnBU3/dAPGMRizoXkQNZ2
	MtlTWHriwzq+MNn1hS6T6oQnRfxFTyTOrlPONWDW8TmKHT+IAH8ZHi5GuCwdTopQF8dyWMYW0vw
	erqluDEOmszNzPDE8H6NyQQOxt+LZ77dti2IN0DYqAgH+qoT5Pqs/uHLnD6h+ldwHo8gF/315yM
	At8zF7nEgeon9TA40W3quYGghNqa91Uf8Wn1KTnUdd53pNS4rF59Kbhzp47s2hLG86HJkWRgRx6
	MwEgu5sH2ZCMQ4L/QnHC7uwqsgNQGomltCW1HHT1DxRO17Pt5bqeN/bw7Iwnepb5csjUnHbi8sJ
	1Wfc9MrzfcSm+DFWPSD1rhJaqnz7zO8fFZ5xGDCBnp+/uq9+k/VR/7NICKLqns+eAmfYu1hMzJE
	OPqyuqrBL+JSuE5w==
X-Received: by 2002:a05:693c:864b:10b0:36e:c213:e03a with SMTP id 5a478bee46e88-372573d242amr7233344eec.10.1794213806925;
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
X-Received: by 2002:a05:693c:864b:10b0:36e:c213:e03a with SMTP id 5a478bee46e88-372573d242amr7233312eec.10.1794213806393;
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265d05514sm11077499eec.15.2026.11.09.00.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
Date: Mon, 9 Nov 2026 16:43:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
Message-ID: <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXyTsNGjDxTXGb
 q2k9Yv5dO5xY/KEn77n35bIRV5P/Y67+WyNaiSxUVHr2f0bPA5Kzbr57TdvbpnPbA8YX6eetMoW
 piifTkcg1gKhSoXQXGWxlDVFlQmnsY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3zYEf+cF1wli
 DKk/9r1mvxdaDS3e/XldtzV1XnVwszWi+IKVpco1Slq+rNOQXGJ/xjRvZOmXHk30VW5ss0DwGRH
 BVMpESR3H/0e7ChlsTIM14UzWgWSCW26+v4RMZ2akcHoWR7rR8foOKsWz335WZTTmu+SIGMfea2
 vi1/mL7AtcxSeutMJE5v8KwDiY6kbjpop+ttvUOpNycEFx2QaomjvoOlafIkW54CI3eyzvrh0bt
 po8jQpScQIkiZUI/rwLEELfsRaB/6TtVCEecMVJByXPkFkzI+CkTut+FSkhHIhOuGnZ8NrvYfmG
 yc4jpE/jOmX50j09eN4b8P2Y/12xrRxeVFU69z1BB/X9WEoacRlWuP2zGV1AVhJVFyeGSYZRp3n
 06EUN/P78y6nhtIbmrynYQ8/9VWvnNmVgs4AjtlHEEDPbhRO6GVmY8T2e+pZh82VWQbvBZTU5Cn
 BKcUYIvd7s/NHstVHig==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af187b0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fam-3tgAAb8rIOWbl-AA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 55JQ4tnKfwjGKPE0hmm1fiuXvt-girQU
X-Proofpoint-ORIG-GUID: 55JQ4tnKfwjGKPE0hmm1fiuXvt-girQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On Sun, Nov 08, 2026 at 06:48:31PM +0530, Imran Shaik wrote:
> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
> SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..1d5f27336f73 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	ptp@1c80000 {
> +		compatible = "qcom,nord-tscss";
> +		reg = <0x0 0x01c80000 0x0 0x2000>;
> +		reg-names = "tsc";

The node should probably go to nord.dtsi with nord-embedded.dtsi
supplementing Embedded specific resources like clocks.

Shawn

> +
> +		clocks = <&segcc SE_GCC_TSCSS_AHB_CLK>,
> +			 <&segcc SE_GCC_TSCSS_CNTR_CLK>,
> +			 <&segcc SE_GCC_TSCSS_ETU_CLK>;
> +		clock-names = "ahb", "cntr", "etu";
> +
> +		assigned-clocks = <&segcc SE_GCC_TSCSS_CNTR_CLK>;
> +		assigned-clock-rates = <250000000>;
> +	};
> +
>  	ufs_mem_phy: phy@1d40000 {
>  		compatible = "qcom,nord-qmp-ufs-phy",
>  			     "qcom,sm8650-qmp-ufs-phy";
> 
> -- 
> 2.34.1
> 
> 
