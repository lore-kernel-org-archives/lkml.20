Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8244C4F0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517360; cv=none; b=cDuzy8ZLTqqxSfac1YsCI4GRi5M1+ks5u3L2TEZtvTVEdS1QyDaRKb2VRo6mVzvJWc1kHzyr9E695tUMPm7MqJOwzt53brJRBtgsagd44Q7jwRNt9owD+SFUa2dmXoMeECZv9JknvzNCFZp+OrQeoPlvW30iyLg/NF3vyz76AL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517360; c=relaxed/simple;
	bh=qFzj3e1IJEg5N2m1tp5b4FG7iZDcpj8PhjY4cN+Ntq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+TQKsjpimd86NrSXx5+vsW3O+o0+qXEyY5B51GfBZz30RyT1q/RdNtpRqpDMiVeI7tlMUyXiWP3GcHqmDUbFkzsWKVyVXfT1r1n9Cz/mGvwgKJRp5Lt6ffNmfctvU2kqF3fQhOSCLbhEhLIVHrGju6hVnbbxNiLUjToY1vuSrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMSz/7V8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RglqvLhE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMSz/7V8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RglqvLhE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIBuK3276050
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 10:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B0FOpfvbCJVV80luCOgEs+44
	HXQFGx6sTBdAdN/+wOs=; b=MMSz/7V8MUl+HbVOcwKAVYa5rgFnUAdeZKBQlfsB
	YIvSX4T2vv3PlhSX8DNsPiLHNIq4MV3Y/KzyUuBcpEZnh8jZQsUT4ExzM0R/+boH
	+dTmIRTNQ/obwGufhAVXQrPRvKpnoLi+5pfOPRojJoKMLdU5TfZC6BAdTBkdvJgs
	V7l8JUFo73HM2V5RSeO9J4ithQWvm8CO+KpKjQxfqrR4t4CI06HVyR9GEmVPmAwj
	7Ti8bt6+uT8lzMYy47t2XEu0JANI4l7gzbDSNTZMdnhP0Q6uZOXqZ/Kj8YqtOHWy
	ggQCjuQo8bBtOSPjpev6ykytMpY1AYPoXHmPUygH+CoVTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd0yq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:22:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so150646785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788517348; x=1789122148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B0FOpfvbCJVV80luCOgEs+44HXQFGx6sTBdAdN/+wOs=;
        b=RglqvLhE5bnfXrlipleRlBVldQHqHKQVZEOtJolFQq8nkwDxvVlm0YETuYzrXYtsP5
         D4XkrdYdJeh9rHaVnMmFyrr+QpjVm8U+Fp04N07vjwZ/I/c7joN0etgXru1bALOEaHd9
         y7/s8OZsEaEEhkr8Ir2lm9dKJpIGSrYXk8W1WPFM0wJIT73/3CI9Sy1QI05NqTE5fVfF
         cQ+UqaWYm9r0xKs+7rQXVgGp8sDGFOo9A3KhBC3OC8tDfO55U3Yp4megBxzwdi+zTv8T
         PjzUPLCDCwAKo6g4w2jaMVl9siv9GLBLK13IpQHrhaf/hLCAfJBIrfHRnc/Dw5+7WjY1
         0mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517348; x=1789122148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0FOpfvbCJVV80luCOgEs+44HXQFGx6sTBdAdN/+wOs=;
        b=aC3cg5wp6cli9se1GwKg0BknrJmR5L1gfWZhbzmlKJNnA99m0Sgr7/QITSgREMclt2
         nYI9DMNl7niymCyYGxag7aWCadBD/9IUIyD0Ik2EqogJ2AHGHneJJ6S6MmHIJR0iEE38
         oQZSOEvItySKYHEQL0kC1QpsGI6NPwsJZDqC0B2yoBeRrNDK2QIUfcGbk3giOy1roMib
         GtKw9k++HKmPRX+cCrBvv262YJvvh8Z87YE6fI1hsjemGJUrSMmSeDuklcPVy6eOvB4P
         wmPOxFPazQAka2WtBgAliwtuFPvKrg8nQHKCsLnxe/NIcNRlj3Jr+bxqZMKG122hgdNT
         G35Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6F+CIiWzfFyWGpuLD7fhF45OVu3H9/+xQcCcY0vNzF+uCQoApWTirO8l6DrFS8wbHZFGIOWn/dLAewLU=@vger.kernel.org
X-Gm-Message-State: AFuF++nM9XtjpJEFRwj4wCtLuzLi9BPsYwg5uU45z5LOFAFS374BINXX
	VpS/p2LI+fSdfprW2GNSxVw4iBJHlaT1gEWgkLJL5Zk66LG4XZG6+6kUvP1uJbXD/oeIDAYHaaY
	fnR6X1udPrdoYES+1hVEVHvqL7/MFXMOBwZHadyDRv09fJJlZ09r0xPMslyuj2BknanI=
X-Gm-Gg: AYBFou0Nk0T+Z8Kzm9TnHfILC4vjuPd6kDjlQbOyCfRdXLdy2F6Oo62EnE8KeIMr5Jd
	wXLCwWH+Uu/+vYowd4pHFSW1aM2XuMvSCRshuhtAFJ3Arfls8LABH83teMaxQ+5Q8lzaZOB7z1P
	hiCgjUqeFdHi+rTkP5F6e58DvFDNE3aKPmnsp1r7yHT2DvQ0VaCJK7OmuWjq4H1YSGYbe75BVwC
	4cYYInSS+Gp/4tS/4qmxrGgR8k8qBTeFdOYYqkoe9DO01wr2hk22KXFZXDX560ga9OH2SK9VkA4
	MZpsJUD0W3S5i8uu3OQSfYyktiFwC+Bc5egYjwrCJbfzL/Xb0Wp4kyROOFpOiqDCCobsSY9HdLO
	sJ7gztOogc16l
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr510424685a.14.1788517342666;
        Fri, 04 Sep 2026 03:22:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr510416985a.14.1788517341941;
        Fri, 04 Sep 2026 03:22:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7710aa5sm59464915e9.7.2026.09.04.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:22:20 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:22:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dsi: round the byte clock rate after reparenting
 to the PHY PLL
Message-ID: <2gqk2imrel3bwt3ezkccimixvfiioxp5eeiaznzlyejgkhmave@7eh5o6ms3rns>
References: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
X-Proofpoint-GUID: nHI8_uxkz2vJ2iL1s29eowdrLZILqe_-
X-Proofpoint-ORIG-GUID: nHI8_uxkz2vJ2iL1s29eowdrLZILqe_-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NCBTYWx0ZWRfX8qF+X7C/4Eri
 rg8hl9BPdgp2O0MrkJDYIbCXJxRsPlQ0YsqQGlw2H0D6UXncdgIlaaqSP/Zr8Pd2DoYWFH4fbhu
 +TDbg4CwPv0gQ6fL5AlIcb9CqRKy0Ac=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a9be4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=df3BZnECoes8ZJFSp-YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NCBTYWx0ZWRfX+ZKZItPG0IO8
 kZuZZkKEEFVOxZcKYafaQM0Cb0pz8hM1l4M6AOSLLS5RHftee2kzZZJHr15+cnV/TrfUuotyaHM
 Ur/qdv5XsJUJX5W0ePpIf0T7XtaHC7kWEPhE8PEVhchoYCapWcm/JX1L+UEWzfN2MQg5g3NoXj9
 Gh/m2Xs4cFDgdO2F5Ohey3yiHbP0sxNRU7bbGlZkcHubngfuCvoOLulBLwuUw0IZReMx+OtGwcR
 zRkG+saxyKAI9ftqIMRor06B7+kYp6xXxJDpBW7P2U81LA15pHRGY6Up7/2hPulEx+MYWK4Gzz8
 Gy8qSlmT4qxJCZG9EXEqMUu6oRm0TKScpLAPTD3oetSX2Z5ciYJ5e7zRBm+TwMgXySFUjYNxKTv
 eQ2ulB5THkhggNF1Nln4Xy5krRzgnznS8RR3m5paHXxHLBj5Fy/5iRRO0NbluTUIa6fKhFYXiz1
 kU/BSUn5BGgWf1H7W2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040094

On 26-09-03 15:19:10, Dmitry Baryshkov wrote:
> DSI 6G v2.9 hosts (SM8650, SM8750, Kaanapali, etc.) reparent the byte and
> pixel RCGs to the DSI PHY PLL at runtime from
> dsi_link_clk_set_rate_6g_v2_9(), after the PHY has been enabled. However
> dsi_calc_clk_rate_6g() runs earlier, in order to compute the bit clock
> request for the PHY. At that point the byte RCG still has its reset
> parent (XO), so clk_round_rate() returns a bogus rate, which then ends up
> in the PHY bit clock request and the PLL gets programmed to a wrong
> frequency, breaking the panel.
> 
> Move the rounding to dsi_link_clk_set_rate_6g(), which is called after
> the RCGs have been reparented to the PLL. Storing the rounded rate at
> this point still makes later link_clk_set_rate() calls no-ops in the
> CCF. Derive the byte interface clock rate from the rounded byte clock
> rate, otherwise it would keep requesting the idealized rate and
> retrigger the PLL on every transfer.
> 
> Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested on Eliza MTP.

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
