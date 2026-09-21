Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2AB3749EB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980547; cv=none; b=chqzJY2N/jxL+PJCJ7KyjMQbM4oBZuX9lUg27MUVVYEws9rVSw+7T0bQ0JqyRC58N0pWJSvPwQrvbhigz+8fCdhmlwA8em1bvBSlQSHiw+c9egIGOtRUcpJEpEzXxHSdeyhAMXKa73mwNWI5STszxHU9CHOfptM7OIBJMk066zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980547; c=relaxed/simple;
	bh=j+2Sp2iYZtsGNJZHGKLGEh/X2OmWULXXG/KsNUWOfWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlRXikuS1l7bxcgp0s6O/U19qm1i9N2UlqluQWpA2qr4meLq3Y2DrElktRWkjO+u7jY8zX3JQeLQLyU9n3+doYINMIP9TmkZC4lw1cvRyhh+2QWTAw24VCasm6/PRHlQBLOVNvlwVAevwwGLyVO5CZzX63/gNmkXdmxC6F18dSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTyHkLKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAHmtj1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTyHkLKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAHmtj1k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79p6Y1095972
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCY4SeZekp9AuMKRHsKnNzei
	t4dh8rRliHfed5G71m8=; b=hTyHkLKyxQOoqTFttYOlHJc+imUGX6PbCHnCjCQF
	7VekXk9qNl8P8J9ziwcHKsf/tl6Sskq1BxI2sBYLGwwpgYK3Qk4T9zVjHyrE9iVb
	0ETg2wFRPlE3T7Hswq0zTVeHgL6wBUswuNCNp4uVtV091Rdll6uC53xnVma8/mud
	+/cfZeG+NNhsEsnKEk3QQri4zcrJYfYy1i+vFnR0V19T2CrvKUmiWY5id9ixBX6t
	7IpBkfh/nJA9z5TL9EAZKJMyKVAea+20aWDgDAnYGtIH4in34id4cu/1qx1k0P4a
	qJgTKfvwRbvo9N80/JUrylJYoE41FMN2cg7p3MvBVpHs1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0ea5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:49:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so3912625a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980544; x=1790585344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCY4SeZekp9AuMKRHsKnNzeit4dh8rRliHfed5G71m8=;
        b=YAHmtj1kZFim6uBcSro/CLbk1SH9EmSXnl03YNVYCpKdRJbIrCX/jl+D0TNN5ynfX8
         /fcFBOQGnwHGDDQLl3fAWv9j3WZh6jUiLVY/qCMXaNl0i7TRQNZp3+6hRfvHFcjxho8y
         5zho4IZeH2Mj5920S7PG1k7w+V93c5wHc0YKJ23sCOKM9uJg3VN9g3t5mx4+ekFIwpf/
         +yEGYMVPjJVZxjryxb7883YjEy4gZnMnEkolDOMf0/an9Z/60ACGv74k7Fl9PflZagxm
         E6BNbTI6V1yutXM2lM2sZZhkoOY1NZAc9F9eWDmJt/GMF1GTTa71X3skdawKICjzRH30
         kZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980544; x=1790585344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCY4SeZekp9AuMKRHsKnNzeit4dh8rRliHfed5G71m8=;
        b=qwpmHD0apzYNbsoJhRmkZtrXw2YkzIEXcPiZPswVNPT0+s+nwS3mCDujgwi7TMz/Jj
         l/oUUVhE5hKD1Y/C8Wo427gpTH1SGFJxHZfr9Dg3nmz2y/P/xaBbVg3j66jsZjpz5/J+
         2fxXsARFG/8iHoqgvzeWdhn0ICbgsZWCe/XKKBV9reZT5mk7nikQ2TgAkn11jjw4C+mi
         +mKBhXkzq+25yERkB2FijgPjcHcE0PWvlWtvLTHzvpYoqHbTIoiHlf+4+sfy6sprRKtd
         vX8udktzO95oQ5UpC22KHH+klqufQRb9XsMqxseXvupbxYij7fCwU6SvSl9JqgbVo0RR
         0jng==
X-Forwarded-Encrypted: i=1; AKwUvBwUd3D8ppTssPQTQbqh9d7voAnPpWXIzpvsJfx53M88ZievGZwayNeNRWG+hpdKrTmfI2S0ghu3IWdKrTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mL7OIGqfZhKHi04lZssWyk7J0iMwESvIW54kewdAqg9CDXdmAP
	1h2aw7DmCukCMTngrZjLq88HwSc7Tn01QlO/U0BNsa3an6TCEecM4mPvQeTyscO9wN+a2bfxoia
	EN0zHbAXGKCvEmvGTAl4BuiwGzOMRz+mStu6n6qdZoT5/fIQBsymzqq399cGmF/qc3R4=
X-Gm-Gg: AYBFou0raxd8cuPaJrsGUFDZGVynGHp6TlLN6obgYyH0HRzzBZ3JE88uDUYO1Te79Iq
	aEQPaH1BdvuxUAdYDme+zzDVLyeYBiRhMzwMcQKOnzAfvdahFEolsY90lmvjg1kc71phA3uetLS
	g0qfKD4h2xxRRqHI+nwSBfggxIOQPBLDVppOVMw7gUqXvk/XUN0OKdcfvRjV2O7Yru5LmKCEsz0
	n8s0yN26HxPhffc604HSBtyh/pdt6xps7I6/9q8VoGiNaO6+MRF1iUSNWMdEqsN0D082k3TrolH
	fzwdPBOkxWwm7V0SiG5OnbpUAanLebnDHR3LqcpU4GrAF5WTHuixT2/Qf8TAqrtrjfz7sRH86i+
	6cbGPkAexu0mmVoh7JjU2ioQ011xoobRbf5vs64hl7w==
X-Received: by 2002:a17:90b:37cb:b0:39e:6c69:f478 with SMTP id 98e67ed59e1d1-39e6c69f5b7mr10097062a91.55.1789980544559;
        Mon, 21 Sep 2026 01:49:04 -0700 (PDT)
X-Received: by 2002:a17:90b:37cb:b0:39e:6c69:f478 with SMTP id 98e67ed59e1d1-39e6c69f5b7mr10097048a91.55.1789980544176;
        Mon, 21 Sep 2026 01:49:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm32554647c88.15.2026.09.21.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:49:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:48:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <arDvejBVDThdga5C@QCOM-aGQu4IUr3Y>
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX+DmM+ryk5xjs
 kuYL3UheaxJlukO/qHCODntBQ8/c7eTbBCtraeAD8KMrsVHc64ZBJhNTin4ACIcxQmby/FTgJ/w
 THI5pUQSFMzCyDv4M+gbax/JybC098gUN7v5c3YuEYO8Q2kxNAJb3ADtCS0mzSCZ8RZz14zrzho
 S+TMwtJMdKZjhzx/GKkjBxsSse33LkIwYhe6S7OYkEUtodL2IQIqpGnLWSWR2yTJlCskhCM9ybY
 4skM9O+OzgZPy1odD/0fPFoScTyGAQq3Cenpv/z4XTF/Z0W7r02NqUpTOzg5Em3hfDHTcccUrbh
 Qs1jFLElWCvA45LMTdDcCy3jhbN/3gAOsiKh+KDN6dQbOtOSarHDF3nFKAZLywzpItfhj7W6NdW
 rnei+52RSDDS+uAIlB20lw6O/DEulaPBPWXkE28+kLMxqKM+YFyY2rYjUHj6HFCuUZzCTXwoMaT
 tfmgHynsX/gbLxw8QNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX3q8z8n0OUhMn
 8wd0tNQXP2tRP2nYYYOH4FktYYG/Vy2t9exodc10km2QO9DjJRF1Q5qUk/cJHbbBhqkh00OJgtG
 M8f7J2qvuuyu7i8UiuubgtSWz/55B08=
X-Proofpoint-ORIG-GUID: 7dH_OimrzD2jrOIRwFpLpAWlpvKL6yt8
X-Proofpoint-GUID: 7dH_OimrzD2jrOIRwFpLpAWlpvKL6yt8
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab0ef81 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fXYskK-hLIHSKSyG9lUA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210126

On Sun, Sep 20, 2026 at 04:10:49PM +0800, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Resend to separate from Nord display DTS series.
> 
> Dependencies:
> - Nord base DTS: https://lore.kernel.org/all/20260914031412.140856-1-shengchao.guo@oss.qualcomm.com/

The dependency is cleared, so the patch is ready to be applied.

Shawn
