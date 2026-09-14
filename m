Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9238F255
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377279; cv=none; b=rPHBNTJGmKzWy0q+M6hrcU7UvSP6eT9q+ooxMTbKvoaWn350e0UWzk/BS8YYWlQBLa51sH/J1XU6b75tho+CfstYG5kiPBL8OYjnTtUAsrGYcbRx4BXGuw60A5hfuHS+S/0hJLUjSdq5q9wx8mqmU6CatX66f/tDRcDv2IPkgIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377279; c=relaxed/simple;
	bh=5UMPd77YYaMzlyCdkt2wpYn7O9XfHpcJHpQhBTQ53Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/fLqLDaVcvIXtQY128AT5n/bTrh5dK24H8VKsU9VPWJ9nlRMwV1fzIdMsbGOTw6nMutZFnMcZ8nyu4XfN3ukofSD0MMs67G6dZgJ2hKmwOIRhJGaGFGUjTjpwEWsdJbbbXdyX5KHHPil3Jmu89cpVbbuZ/pSosaZo4Jj60elhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M19LdAge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eG2473lm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M19LdAge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eG2473lm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5isBt4058198
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apiWvG/cVrKbyxPjcX7GS2bKLCGReZfKKJQBHctENrg=; b=M19LdAgePLsZdUaK
	opzsXgh4h+5ZMcsGZ7O4Bt4OVn3Ka4VZpUPBxdarzu35WQ+fp0aNzNPNOqs4ljwe
	vulXr9ttHkE8R6eDV6XqqVMqPnI7xnX03dX6wm7fVg+GmrgcBsVyy0DLsSLSZkT9
	/2mB3AnxuBh5psVifZHwnZXfEm17wSd2sGLmMCZziuxq9X8iDDwFtbuypi82oPHh
	i0A3VHjNuhev/PrDd3xvmd38ZbpxhEw95EFauqiPy5yau+kcvbf6k7LeZqbMNZrU
	OM+ER/NouQW19n93wQIGFprUNEENpZ3J7HBttUb5GF0MycyH0pO+Sf1iFiMTSc+o
	o78QzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsspsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:14:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso52715085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789377277; x=1789982077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apiWvG/cVrKbyxPjcX7GS2bKLCGReZfKKJQBHctENrg=;
        b=eG2473lmftnB8M8pF2K+m+R9/M2x8mf5dZLH18Ne6gBIz6XyxUzWhggWUvK1qzhx89
         TKI5W/eL2RNWI6LPgZYcxv6915jMk6RHMCVH3P+YVxx/tLUEeRihy5plSScz61xEzcBT
         n+kOoFbgEcjJ9Gq+stE97wTINxObslZxoek49zKsI0iWFblgFOblNONItVJpM5dtl0vc
         3rA8HNiQwqE9dE28qjZcCgcW9o4MPg0Wg7uaxqKU1ZBckpImonMzM7iCUXSnQPEjejRL
         3xUExyU8pgcyIXDBuh0yjacIZUrYINCHMEM6Rv2ft+NwA4sf+WRaRXCSD3YoQBH9xpiq
         vqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377277; x=1789982077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apiWvG/cVrKbyxPjcX7GS2bKLCGReZfKKJQBHctENrg=;
        b=NFBPyqQ+l8HB978cx4TZIhQXiTFZST9e65p9fB2lHsiYlkrAtWRt1aIX5dfOl78ftk
         dKhDkkUpvgZ9S66/a8ZQTPRhHOhDgepxOxlhEhi+sFvSVGZsPG5GOg+7lM8CuzBCCmXJ
         sQRDlZIioBMkWHUWQueFzqAaPvauZkUflkJPPb15wqj4LeKPnQXF76KZO+Ks7TF/JEaT
         k98BgOOiMQx5suWSqHXfeiP7QyGvyBd/qAy3o64S6UIx94mVNhslwhhXI8oVZ3HBhBgs
         w9g/ivvNsu4Q4YnYVNYAqfrUgvhLSJ97p2zsXXPLkyp46zzou+oE4q1QyYFIOhsjSvcW
         D1eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSZVY2kfepzJXRFKCWTfPWAwKeuopL7Ie7QZIvVDfc8aa17qLVSBKG5cNYMQLNQ5SZSQDa4A/2e6TP0CE=@vger.kernel.org
X-Gm-Message-State: AFuF++mBlC/teuygcaDqD6ZxQNZRKY/mU7xiR4AEfkRMGXbwTXR5Menf
	tiz9lSQwitydzHj0orB3F4gFLCdI/Wv3lezCUGRiGjXBPmjqv8Xwq8iR77DFT9vdUGgLzF7l5+T
	ADOzX7ocrHJRIP3TTeZIMrxXjTdytwlilHsT35wcmjB9jwcARfTW1uzi1BYIfeBgauGc=
X-Gm-Gg: AYBFou19krtaWQd+doZ/T78ZhyK2aWQXvWVuU0TIunwe07xGzp9hH70zdv0UAKT5IeP
	IaJkYyxBn0zbeYKWGtnj0QPK4IWxHXklx3QycfPLCOy1iYtXdivAXmsD1XNw9tjaAvPRC5pS4Kg
	REv62tPzTlzhxjxp4Ttd06gs4Ldi69TypmTlF64bmaJFG8Qb1/xKdreFxSn5DMpfApuoG3R4Gs3
	np8euapj+X42WdLbE3vlhFSdJBMNCOeOlpzacgGroYgFnDUoYtH+yegjXjAT1S/BAQAbuKqbo+S
	NtvebWey5WTwcuUNWVOZmu0q5E2KMHbHDoTn1kUWLO5HwwmLAazs8JH9sYjGPktOvNTlfnmOiuM
	DoaczRwgr/2lU1+clG5KwPA==
X-Received: by 2002:a05:620a:8394:b0:939:eb09:4458 with SMTP id af79cd13be357-93a29bad63cmr164413285a.3.1789377276401;
        Mon, 14 Sep 2026 02:14:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:939:eb09:4458 with SMTP id af79cd13be357-93a29bad63cmr164409485a.3.1789377275991;
        Mon, 14 Sep 2026 02:14:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5960c17sm3831428a12.27.2026.09.14.02.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:14:35 -0700 (PDT)
Message-ID: <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfX9TjLKrRQiuLo
 5ZXf6IGX3hosfkrkG2ERHvlsDjnUcXcTIn0ngROmQYzDMVk3trUSdmrBShdordTN2wnaWk2QZiJ
 cTk3c0+dDzqd4xA6PdYvknf9Lb9g+658dB+QqcDq6bUCozCl4LIAqlu0+txDwHtbP17GfDX2/Tj
 Hh2H+bl/IGZix3pE54YVsDfKJWRTqrN7SkGjFTGXLn0A+MxSSPWSVAlT3jEGT9fwCT66SPZNeWv
 kqd4GXGDNnHiuiRh6xjAO33hF1zOL93Fflt1dsHIbDX9jqpZqS4rLe8YCk/DTcQOzt0je/DOzVs
 JQce1z4ydx7AxkNehSNVjQ7aXJA3RLyepWDwJWBVXbC9ssyBmTVgcW9YWbI6sEhapYxR3dvRYfS
 FJYgFLgU/b4IQLuEih3Ye1hvGty2gqh7ksn3vi8i9idtH0bjVg7/2H7fPNCMKazucrUaXCghupu
 BndEE8G+mdwCe4vKGWw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7bafd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IZYJNoHwoc_Ow-rSWkcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: c21iyHg6Jp2gNHgcvKM-KJjar0V9Nw3D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfXwvn+r1c7sJeZ
 NYPqn3JzNaTBmgRMcCeOrvbl58avnSHJ8NRqJE/0WOiojm9eL2dUQaLdcj5gq5oda2sg724/3kX
 L1WIHAH0pnJcK9XdpU/oZrNpkNZUl0A=
X-Proofpoint-ORIG-GUID: c21iyHg6Jp2gNHgcvKM-KJjar0V9Nw3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140131

On 9/11/26 6:47 PM, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> index 17d8ff3aed23..b6e384024dff 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> @@ -697,3 +697,21 @@ bluetooth {
>  		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>  	};
>  };
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {

Please keep the label references sorted alphabetically

Konrad

> +	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_e0_2p4>;
> +	vcc-max-microamp = <1200000>;
> +	vccq-supply = <&vreg_l12b_e0_1p14>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> 
