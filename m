Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483293;
	b=HfIYw7gupjMw/MCSbAVmjiWZVADDhBSr5B6/Tvw7+Qr6watSLKK2y7FYp/2eiK0VXgjv
	 rQvqFZpzkJNY6nyw8db7nSzvypjOWaKubqaDTVqJc1vyrIfI+GoP0kgwUQ96PPY+bqMkB
	 R5c9qjsWqs9Q9iAd1Ni25dQKMcIWAPtup2ulFm3j2jm4aGb2GMhW8+bwPNo3JfuXFEEVn
	 lqLNAwZpqg7SRjCPaQMj6QYW7qHRS0mihx7BIpKisjXm0I/5FjjbVTU9kChi39YCfgFwL
	 GwQOgGhszmB2DIP9A5FaMJDZX5V7O0n0CErAAO37uoU3jW9sXxcHuBwfAppE1XV2mgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
	b=SpJJHTexbD0BZQFGXKWMWLKiGZ2lh2dfZODdUW4xr5GJY/d4c0g1/5HP6/Yqj/M6HyUO
	 pMaAIpzIrVYuqYYwq5kdTb1ntI0rGCdSqaqlkrRQ5BGcdCq4HVrGmgcMszrgpOeDH/37d
	 AZCjozV7nW7Ug4e1xE5tUXMYa1n9Aq+EBTOE6PWOjdfSyjdGKajgBvw2ntkJ37geuNoWf
	 gRmGM6J+R2rZZGlpdf4H8iXdrWjsrDmfGLw/Xosf0dPhEETJmjhZOwGZZwM0WsXRzHtMR
	 isOY+pjMYwLovGlyqD2kk/jLoEomYf3e0VlEr2eMC0SVccsk1WUAf8Q5JDPDpH0pIIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN5aJTzg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff5nXpYw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38A606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF38A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN5aJTzg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff5nXpYw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFULF3977015
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EItL5xvGpqO6UWOBBCZmsuF
	utwBGP9FjsFh6RXA9XA=; b=YN5aJTzguTybW9G+mlI0XJtw+n6bdR+mgrsGe4kH
	a8Dyzz44XUjSs7EpHb6Uj13LvRztzPUNAERCSCVsjO4uQzUyrOoht1lktdmwIwJN
	IB23nBH8TUFg9jCQboo1dkPIHs1ouP3XJ5POq+XgPz1aMiVzUjJZ+Ix5Epq27NKv
	sKdmwHSFLUHcMEu+UbIgQsUykWcPsemrV1fICWURhTyLU9ULzLIQS0+hnvQ3Jocx
	VuhbN/GN4A9+yQpGPF1gvjP43XD/mhfDm0Wfp0x+PVMVgtS4JS90CW47Qhkil74N
	u96yuT7J7TiTdXdJNKdFseH5+s4+L7EdbKpP302HsMVCEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rt8hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:48:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so180957585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483291; x=1794088091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
        b=Ff5nXpYwnYEr6e5KbW+B3PvK0xjSoccwciobXjCTwS4s/CLEWZxQmka53A1cRWfGWj
         VfAL1LkIio4GihDsDomzy2EF6IT6AiTCvOJdrXfpOYzSoZrttEjeWFVhQ1jOEQXaCki9
         Js/NIVZOwOr3WUxy3WJlBEWg6QCg89V7f52pxhdn+bMUFyl1FJXVNxgd86Af9mYL1n7j
         6nzeZyYcJbIRkYTCJaJrpSj5Da33kfGx18gsHG0lj1jie8jFzhawBOGVhuZ1ogEpVk+B
         cZ6z+o1Z2nFtcSCGPlfHtc2Zwz1wOGs3W1VfDHrnqvfxpZWQhIP7B3DwH1m1Xs7QK2YE
         4rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483291; x=1794088091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EItL5xvGpqO6UWOBBCZmsuFutwBGP9FjsFh6RXA9XA=;
        b=crdH4cAIjZ8YxqOcYTCuBTOmkVf+3/ZrAW8xVk2KRGTeAexm70k48i4EqiNZy6YXLu
         zz/sVawDG2Nq9o3OXFNdDCpXOHQZV2qhHGUBi5EdRb/t5sbmcM8qgdWdn9PlVyCjHTnV
         Kk6Cq2mvrVnmR215VlJCoGmHzx8Pmrzt5g/SerEZyjg4o+E22PkofXF6V/8q4mcunjZF
         PkmqUVG2v6swH4cPkbhwadSFoSN3qisF/NBOsQFGcm2CuY/w0/vl48nWrgCyYwBx8HFB
         Tqi5cltNHL2jr/t6EkYVlaHi06Wg72Xt5rbbRWcqxkyfxd04UXHgccb+NrL0QalARUmT
         htOA==
X-Forwarded-Encrypted: i=1; AKwUvByjv4jnQH8yB/1SIxmZTYLsOaZT/1ZGSoxteWgu74YEzUAV2VB3EaI49nu2NQezSTGiWgWTI2V1falnjeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4US85o9Wkf+DjKkWYnS2gcFF3gEopRqch0bxVl13z1WsgK9fn
	QIUZIAZLkxy6XONy6+gMkosaYrFzU4DxTFDFc7FUaKiuVE5hg5ZLIutaXgvy59q2aUDW4mDxjtz
	VSCyYQaYH4vdeEQaZ10k3MSdMb1ljUqyZz167PlFXClvM2tiUflZDGkNvpkotlWETqWI=
X-Gm-Gg: AYBFou2uXhRuNQJSNO1FsO4zQw0OH4IAeWdJCk8j+ndSw07Zn7f6HHXuE0t8Xar/qJz
	/MeaF7ZpBJq1HiEM/Wjh2lilskKYz1vREiJuqYorHKlG/h4BfdVeCwePa7lppraU87vB2kNKt7U
	2QkvkGXlMlhFpP2jRYGMRQ1Fq3Jabv/PtE4CwqDHid6OAtXEO05jl9h3NzIKHhpUvuCeY3/juNx
	VcQa7T2z/QLxgpggADFVYxC1wlVfCcn7T6lzrvwo95AwJ8CWYfzlbWA0Fk+oc8MwhNFAtLpEgNR
	ZVtpLLOxBvS7amEMuGFVpKXABB+iGzMPJNv9m8tTVGiJvTsCa0IrXhBmyXFsYm/OaNzpLraEGp7
	OkB6plQI1uBl7kzzzm+f0B/aGQccHvc299WL18BAbJIscWRcsr1utlA11bqsoDxNRrF9xaxN838
	h1FgEMR+NvBCHDRM/p1sAfY4KIuQpYG+3LbB3i395moLr22rtYVd7X1sg7CR9XOw==
X-Received: by 2002:a05:620a:29c1:b0:93f:228c:52fc with SMTP id af79cd13be357-9442175b13emr960250485a.58.1793483290815;
        Sat, 31 Oct 2026 14:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:29c1:b0:93f:228c:52fc with SMTP id af79cd13be357-9442175b13emr960246385a.58.1793483290275;
        Sat, 31 Oct 2026 14:48:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e5e6sm790440e87.57.2026.10.31.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:48:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:48:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
Message-ID: <dkwloahmxcka2ykjdrf6nh6d6cde6zgd7fe5s763h7s6nv3eqe@pm32d33ghgbb>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: cIvOkPn-Q9DZ1NqILIgpKWb5HVnOZy44
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae6621c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=b0wOoaS58wixzsa18XgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX2kf/na2mw6ik
 eOA1r506/0rueXdlNDTm383lVJYdodfgJ3FNTM+tC6kuo9NKxuiHdpNfjFlawvYP4Q3BYzYb1iy
 7yB3IaCjYCtr8KBvSTm00f/FN0jJPWo=
X-Proofpoint-GUID: cIvOkPn-Q9DZ1NqILIgpKWb5HVnOZy44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX3vEdiNbr9KHb
 p6InBasiFSJ0ZkhENsjP8WKO6coYf2BeVskIxkpuDqfA2WVc/7hgopFxSjsMhCwOQZRQ2KHVdfl
 cHRAkAJvS07kZB5z3WVoVcrxhoBLJ3UpPRrDhrnYT1769echisMKu/Yke4M7LEesmDwbkKyk94D
 zk4N6PSiQH+B0t8QtcEVVDUV2G7k6NUFfrhKW5giovNGqMzD6vpXctE/bqqnP86Lp5xMsPsLQgQ
 JeKrAxcdpdy7XqtrZ/XpNXbMfjSghkNGbm1vic8hz9fuVSVUtUIA1MyB5d7NyXuxB3G7hk/L5ki
 vwC9w12pocDwxKN5Qehw58fCVzp7I/ydmXeKY6MIu+rnjIQwG9fWDvW5Pu3ndJD6e3F5/4La+T3
 PKMDfn1p85JecyH6GlqNJFiJ4lUW2mowL6374EomMCmZSzh6KGdwVBmNzJNlLBXGJMCdYlVcEQq
 nAA6SAOHqk765aIcCDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Thu, Oct 29, 2026 at 08:32:38PM +0800, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, block resets for the MDSS core INT2 interrupt controller and for
> the MDSS RSC.  On devices whose bootloader hands over with the display
> block still active (PLLs locked, MDSS core / INT2 / RSC out of reset),
> the kernel so far reset only the MDSS core and left the INT2 and RSC
> blocks in the state left behind by the bootloader; command-mode panel
> initialisation then fails with command DMA timeouts and the display
> comes up as backlight only, without a DRM device.
> 
> Describe all three block resets so that the MDSS reset returns the
> whole display subsystem to a known state before any display hardware is
> programmed.
> 
> The reset runs after the display clock controller has programmed its
> PLLs (the clock controller supplies the MDSS clocks and power domain,
> so it always probes first).  The block resets do not touch the PLL
> registers and no display pipeline is active at this point, so the PLL
> configuration survives the reset and nothing visible can glitch.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index dd738d13df..950c528bc4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3071,7 +3071,9 @@ mdss: display-subsystem@ae00000 {
>  				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  
> -			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>,
> +				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>,
> +				 <&dispcc DISP_CC_MDSS_RSCC_BCR>;

Please drop the RSCC reset

>  
>  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
