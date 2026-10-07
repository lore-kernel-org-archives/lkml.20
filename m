Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891448D899
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373159; cv=none; b=taB+a5sEM/jmGym42j/iSS5DPtWKdBUp3zbG0hVbuVGgmoaV8Yfj34CarcmIQ1h61rE2g97BOX3wPnk2K5UzQnhmRLZ4S1NbeZyx4aXJPipda0+RfUDNvL9VsgVxGwBX2CRadthbYUVCzVw2UsFLgH+7HXRF9+Haep7WHJRO5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373159; c=relaxed/simple;
	bh=z4QPXpORVR5Xf14NHBxY1G3zQ9aOG4ZT/P3y7qfWzbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMHxNIvtsPPc4g44cL2BXMFbPrf6tyLpMjBLyocEH81qjHnFrGfvBj0b6tTIQo48j0XMYF8IcgHpuqKkiUHSoKT3Zq9Ao2Qw/Zlwh5/qF7mZPo3w44EzNbdjxBd52YQJv1IBFtEDAO6mE3dz/0aQXBnAX73k5YRxCzIfdLOON6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFWpsaM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zklg1mTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFWpsaM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zklg1mTO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV7NK3687343
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y/ODJYOMLcLA3XO60L/6kQfC
	Nx0dr3FAvgPHpiaMSw8=; b=kFWpsaM3uBnj+SQSSPSWj8W3L5nrFiS3+BaAXHuS
	ZttBZf93Dp6MWRnHpNbAIXd+bSogPgPl/erpsFZQZw82MzLt6T96MCxzTX0z4P7q
	k1ka6Zn+KGPQZOyOUdb1f6lHNshZSo5cM0eVLnWs4/P265cNYpeGpAboDwo8Maf9
	5ewdL+aMWnVTQJ5I15QumYMf8wA7TkLii3helWFmdPZ06n73cctKR6RvnpWZAy+D
	68j4Mjs8i7HTvJd3tCKLs8clXKUNiIU6Wy06hVVsTGjvV7XPo3ZHTHnxigMRuxe8
	zKq7XD0ZeaaEsxkWEUiASUmz3o9ysKKKS4WdpMSQouj/jg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr8685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:38:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-155a75f91e1so3079969c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373126; x=1791977926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/ODJYOMLcLA3XO60L/6kQfCNx0dr3FAvgPHpiaMSw8=;
        b=Zklg1mTOF072cCzChT4luOSR5PV2GJWzjo4al1oWV5fpahfXazmi8b3LeBqnKu8+Gp
         4q0V7vzFCC4/bNmVQPTTb2E3m9+h7cslNbL198u5te4gTHtkeosAqSmPEseIw/k9Ir/k
         NyG13vUAWBxvEkbhPt9MmKtxyu+owW6SPVhsCXcha0CsjCGss1i7R8vp4VOKlpSZv+Fo
         ISI49jL8TbESU1UVk2FSQnnL5QuFbKZaztLiSs8dszfH81JaP4a0Yv8KRDmAZ+ygSCv2
         0BkR6a07TtrCofVNtmSttKzC6HmHdmd2BQXpUHBlpJMEGY/eJlr7v5RIKCwcaQMzTac/
         KTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373126; x=1791977926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/ODJYOMLcLA3XO60L/6kQfCNx0dr3FAvgPHpiaMSw8=;
        b=v7aqgspZKE0iO0mR4MM6ySt+AHg1KdfAQ3qTHxgoYP5SdBvVMouw1hrr2P5S7D7h9I
         RF8aiXeUvvqnb4BEakC4dtMzXDE6ea8NfJG/3iYBlke9VH91gPdNxqz/6ZIApQ/KYyqM
         amA4ZZrcnntMBvooR6leD87DueSJOgxe4qzvLedSGFXfL8/oo04XhG22Ex1TxjL78oeE
         i4ULmIMHjQpJh+S1zGgDICv+UHKfnqNP2EtUXbP0cTzPRHh2LlwOt+5RitcTR0eUbO2P
         CHCYhkutvtdnK3SHR2FxF/7GPRWfsyHwVMTL6kn/geGGL0633IZEqw/onNFBDDWTSNjo
         8sag==
X-Forwarded-Encrypted: i=1; AKwUvBz+zD/fIiC23uOGdEvG8/1/grXINT0C3FpULWt/k8wEK1zaszNnsA+aI/Wt1K60Dgl08uYpDtqZi/vQ5Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++lRxMurgFVSx9Lp3eqYqNec13/XnbP7di6dXDZGE7pQuTpQ4SJU
	RIwT7cYY2g7Qo3W7NMrJMwOFay0Z6sPXj9HOT9nmHS2uhYH/YRFHhn1eYFRROXBX/hb9+cvsBpo
	i/xPZNu3Rr7nWmlVnwiMZHvjYXDMHOK4rQslQfmblBVzPvMZn4XfZz6DubP7oHDNImdI=
X-Gm-Gg: AYBFou3LQTD3RuamIPsCkJM2nXt3jlAkc28zy3+lDRBPDc8dbH4rYz0kwPO6FPgqkZI
	il3Ci5BQ+Ti2+//sKFPAjBEpR/zLVzmvu6m1njo+6LvdFCMg9stVrRD6MVsGrKUC93yDb+6UmZN
	D1+KZWkGPnwE87z1G5/hB3BkCelCriW1eTLTBUNvc0Q7QeBilWHjO9N6+bmGAfHnUQmVYubQJ2o
	5LM4ywdboEQmumW77jsKFUJNQw4AwL8ILgDnTmYAk65XhcXVeFeoXF0/y+uPKKrey1f0/7Af9Fc
	wwkHlDWVPYcdNja0/E0RE8nepvskCrwwhAoNs95mwEs0jHo7XXkaUaG1mS7l3QSkMMzDngVLNgz
	IRG/zz4oDjdcW5KA8Ubs3hs3S3CKqkrq2HeuKdqL51g==
X-Received: by 2002:a05:7022:439b:b0:143:f79:f662 with SMTP id a92af1059eb24-15d27917976mr7990386c88.1.1791373125577;
        Wed, 07 Oct 2026 04:38:45 -0700 (PDT)
X-Received: by 2002:a05:7022:439b:b0:143:f79:f662 with SMTP id a92af1059eb24-15d27917976mr7990358c88.1.1791373124948;
        Wed, 07 Oct 2026 04:38:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615ece2d14sm9539683c88.1.2026.10.07.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:44 -0700 (PDT)
Date: Wed, 7 Oct 2026 19:38:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: negcc-nord: Keep the AHB2PHY_0 bridge clock
 always on
Message-ID: <asYvP2vhMJTw-xfl@QCOM-aGQu4IUr3Y>
References: <20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX1wcSEKkGZtqK
 AU78bygsyssN0UDgnzs7Y1WgyTWllXrMvm7kbqsdlPmO88fwTzpjCFF9B3McvyKBjkWWEgjRlpB
 eORcKzgVmWoYOgiMC5Hxkh0mQP1SJomd75EuAyCtT+tU7X8lyLAfgOL0GYdAjrO4Nwh9tDxCE4q
 ygLgYfJ8bH70UVr01NQWO3hy7CFt+Hw6Qyx7XMhaPedT95YQ81ODR8TTQok3TzT453iDuim3Bpf
 vOGiMpzhLFyBQvh/pu6zJd5cOtaGz3R/2GaBaRl8r8KYSpqOA3dPGpTqbRtH0R44Uo/zmgzhSmN
 Zom1IsNJSemZOlzT+ldA/lWK/M/mHDBfKo39sRXkoQPH9uKoq3NurQqnKnYg6gJjWMqBJu0lje7
 RqRou+YIx3J2r8OTdYqP3LL9prkc5PuVsgrBINVXqm0kt+YQKLvo0fuO2vxauRKK1ljjTFtWp6v
 G7G5cBuLamoofgAoZfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX+h4XhgNEvo+r
 orVYDZNcu2czlWglo0zOimBpERyQbR0+48L5O5T7HlvEp4fznyDzTZ8aaI6gP7yN0C2wGrjtJXC
 pqFAkELNt9bZwk7mDJ2hKWICEdd81zo=
X-Proofpoint-ORIG-GUID: v6u8e7HW9u57sewhtEL7AvhNZfkVZHih
X-Proofpoint-GUID: v6u8e7HW9u57sewhtEL7AvhNZfkVZHih
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac62f46 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TEv5oFMQsD92tgmXscwA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

On Wed, Oct 07, 2026 at 03:31:46PM +0800, Shawn Guo wrote:
> NE_GCC_AHB2PHY_CLK gates the AHB2PHY_0 bridge, which fronts the
> USB2/USB3-DP PHYs, EUD and PHY_REFGEN_4. It has no consumer in DT, so
> clk_disable_unused() gates it before the PHY modules probe. The PHY
> initialization sequence then never reaches the PHYs, and DWC3 core soft
> reset times out:
> 
>   dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
>   dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core
> 
> As a result, USB on Nord only works when booting with clk_ignore_unused.
> EUD has no clock binding and may be accessed while the USB PHYs are
> powered down, so modelling the clock as a PHY consumer is not sufficient.
> 
> Mark the branch as always-on, as is done for the AHB2PHY clocks on
> other Qualcomm SoCs (e.g. Kuno, SDX75).
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With an offline discussion, it's not desirable to keep AHB2PHY clock
always on. Please disregard this patch, and we will try to enable
the clock from USB PHY drivers.

Shawn

> ---
>  drivers/clk/qcom/negcc-nord.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278ba..9c9b4a83df1c 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -812,7 +812,7 @@ static struct clk_branch ne_gcc_ahb2phy_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "ne_gcc_ahb2phy_clk",
> -			.ops = &clk_branch2_ops,
> +			.ops = &clk_branch2_aon_ops,
>  		},
>  	},
>  };
> -- 
> 2.43.0
> 
