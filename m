Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483100;
	b=K88pLDXtBNsBTDy9EK2YgZsjS49huhBLiSQxynLyDUTx25M0Uubkf25lgkTeZf4Xm7gI
	 rVLT4eP5Vim+y8OrQO1hweuIBl+RYZ6/sVv7oHefD2qgTt0ZFeBt+VUb+9YgRHH7LPRPd
	 FTAUu6hfC6Fw9zM+K8nyFIuYug7RI2TpIic2KDfhhNpYwLFukU/0e29yaYkvZ9wfZKcNz
	 xhx5CM7AyJYMaGaj1tEYXt6MMjafpsQ4ExNHP+U88eIZ0M6BIO0heBr1FzBDul5csuIu4
	 H1UcGf9OHUUWUSH9KZcuY92zoHUQki+MdjOXxzjC4esorvADX2f46xFjVc99Rwq0huw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
	b=k2EoqAjTT3umjxdRpxleq+bNzuzJ/BhJNdCLub8dLQ5TLB4mgpazPPVWYfhRO8EWx1Zc
	 okJBXfDJlvp33dgE/6tC4hIRiJpirbrVSPp1HAQ4mBw/00T0PLq6nhqTFPYzq3EssesPk
	 P5FmAltB1unsxxV7klaDj+vIDGBzniZcwnyn8l1JUXLZchCgBoCMh1SJIMioL4iKUANhI
	 R8H7nZ2JqSv33J6MQh9qVrOn9DLDEMkR1kzr36XJK7cg2BZ/EpAJOAkhLpUlp0gzjwnBO
	 zPzEStASlBeP6j7mwTbIR9ywO0LsVjJqvuRFVAgP6kuPnOsGvvW+eRxgzYmaMKhkrGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqy0g2u8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBrnOx8o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B0606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqy0g2u8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBrnOx8o
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF3m12969664
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yDGBpE8wO71JGfIhhYSREmTT
	DT8BIMcwQoGjF/pa28s=; b=Tqy0g2u8Y/mHPZEmpqKvoI9nEA0bTFPbKTpRDOpo
	cSXiT5tsequCmwJxCOE7xbvLLdGx+iOEyL7B3jURpVBQvAt4BcUO/q6aox/lAPfi
	RNHnN6R9yDreV4fzjOUy7nqhJxaw3fach0IFzS1ZUGsrev8SyuMPQmemBcX3PidB
	d4jvX93H4Y7+c0zbWrekez2g5VQ7Zq4jil++c1Lwpxj1AAWISfjkcrKOh09+7AmE
	8xyZ9eAv4LoqeLFIZNJSKkeuupgYAaxOmb73llTamWZC1pT0jdZ/fhP8Vwt8r3fU
	NvV/WdmnR4hp6ibPfIBTiGMbxBUIit2ZwrcTiRSLAs7Qaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjgy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so348859485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483098; x=1794087898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
        b=kBrnOx8oSeL8mEkRogeeYNnuA95pZ3+ACCMQnVqx9O3Q0w/Wpd1RLfHlyqtR541vP/
         h7BbcxbebDpH54cDftLL3qqHXGrMYOYaDO2c9LnHdN/68PkEUDDlXv4+nAokqIWqklGt
         sknrfXE/Yb/AgkkHOKhO5vEZdqIDy948DQn8YLRsGn1NH48036Mk4GG4NvoTJWwX02Yo
         xgtLHqaRVZpw149y0qshKUVNpHkZ1qUAXw8WBx0n92FVEHSIebF+n35S8FR6gvcfqaT+
         PhTIXbY+bF96BQQZaStOl2n0BAt8Y77vCj8wTBVqDXB40U+QvWuI4AJWsjMWdr48eGml
         UzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483098; x=1794087898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
        b=w0NWbLdUVo0CQbP5RYv5geyNlcf1yq+zOZSHGrI8KNOvhcW4CtZV81eZ+gxhH7ztYq
         kADn8q+YTNU1xWJav/3E4SqCGX+qLuZp725uWtLfZSgUAp/eyysV0xGCndI+XnkRvhc0
         sdffs5noVqQPCBUDmIlsdDgs3xjxhBNnzHkrAdlAG0Nf6k2Dc4zroHsnDOg9xjpBPCvp
         9DFPuiDlQWkDXe9or6lgLrCMGAJieMQB9i+Dklr44EQtx/o6Zw5fD3HxO/o0ORg8NsmQ
         5fw2144lDIZY2WB9cqjRkT36gMOpgLDWSRNj6Tur+ANL70qp+p1EZgZSIbHZP5bKQCUR
         zaAg==
X-Forwarded-Encrypted: i=1; AKwUvBxxMnycSdtV1t94R9mgwpXduEVKroiDND8bunqitZ6zR2DkyafC/aDJ/3vT0NsMzh+WxGRy9HKKq4QEiR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY0VU6mXP4HMMZLojMrqVr0BSR1ZQ/Rv0F18THY4ZM66jVA6ax
	7HL2ut/9jFxkkgZeEbE38Ww8KLGILNvwAuCEWazfyuQA3EZ56gRhdBKfRq5dMxgtc8WXQ/zSoBm
	H0qwv85aQSNKWaDRUfIx0v/GtuVoxTmqhTc6B+hxjapCF1ySX9ouXLmWecISG+eZvTd4=
X-Gm-Gg: AYBFou2SXV08onD1gLlrMNSEq4VH/Q/5PuUMpFMflyZPvLcFiWcqgVml4F8WY8JyTIe
	rrl769POjNXVLRh6uooqzs4R9m40uH9+/u3d/AJRAiatMMnpfG/DIrCno2fMsGIAcWnJg643TDl
	kw2xdu0ofdVbjNJj7rXRAfv4h9gLMG42/wwMVnU582mv2k2miaaHG3wimcK+woyZKeYAM8O4tEw
	WRTLE1ArEqsfTPhC5tclF4ja+NzfuXDUDIwMquESBYg8Wypn0rmdVClV7OQpDSG+ifd3zxzdEUY
	Vj+xLj94ZRYWjcBIjicRAMr/3RlKAgFyXoe4ytGPzd0ljkrnOjF5InT0nRSr+cJ2BXX7yFSHgic
	Y6zMq3FDkaHZQS40z6ipHOm9BULh48Zyfk//e5USvNG8Qdr45KHipKZTT/hokm9vfr0au0ZR+kx
	RZLhAdG8UB2cnwRXKCy1N0kHhL1pGduLZIEoIiumT0NAeJzHXs+SGysFMe04yCBQ==
X-Received: by 2002:a05:620a:1a20:b0:93f:57a3:ed4e with SMTP id af79cd13be357-9442175a8demr1040526285a.40.1793483098208;
        Sat, 31 Oct 2026 14:44:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93f:57a3:ed4e with SMTP id af79cd13be357-9442175a8demr1040523285a.40.1793483097768;
        Sat, 31 Oct 2026 14:44:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm757409e87.1.2026.10.31.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:44:55 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:44:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm: mdss: Add SM7250 support
Message-ID: <qshcmax4t526oqoj2udcub6oqtgnkol7fptswvxuftlizy2g2y@2zqtdemmz6a3>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
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
In-Reply-To: <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
X-Proofpoint-GUID: byD4xJ2P7HEkc8Y8YJV3dcZzBb7kr51j
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae6615a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=r0WxMInjeZJlmvLLs6sA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXyL8oNxhpYg5P
 Tk2KWyeAAT9CJcU+t5E4UjKdATJqaItaDd6gh9pjExy1j2RHJOetIjIiD3PMheM0MN7Jk9oWgVu
 MbCBl5Y8XqnrjSN4GUkVRpv2dv02ESE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX4tOiu0UAT2AI
 Nb3/P//X7HP2DHx+46evajyslSp6jME1EkzhNpT2f/Ss2WOzZ8V/okQ7hdjMfQ3lB5cqXv5EhB2
 1A+NYx51nOvh7YSw2YWRTADc3k2Vk3nsBZRyqaZsCgkfxiSR/DZm+s1kbtp0EJ75YaMp8K+l3Ub
 r6WdnBJ/VT9BXJdzd0693BrJl5+ihDoxcGjCc1ndlXj531EZJI4Ee2Qj0nhbpTG1RYHcjhJjDba
 UZ5Vc8Vp+IC4jYFBkSeOphYqRAu7adYkF3g8ECYP44T7uQxoa8pCY8FOokGBskgmlZdCqfKyEu/
 yyLDsgnt6FSd6XLfVFy6gJEYPBREK1PAongsk2s5WROH8EgRwG63TJHbQ93HBMlC1lWkQ7VTpwi
 SDLmXI449noQ/Fap60rhtl6Dc2hRmNpP74CqTfKVE0mry3TEdqTuEutCsR5DSP0fmt3bPwUyOll
 9vEqmuTuaxHCQEN4jCA==
X-Proofpoint-ORIG-GUID: byD4xJ2P7HEkc8Y8YJV3dcZzBb7kr51j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310086

On Sat, Oct 31, 2026 at 01:23:41PM +0530, Ishu Brar wrote:
> Add support for MDSS on SM7250.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
