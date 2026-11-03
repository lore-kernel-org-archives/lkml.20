Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699684;
	b=bRE+BrrnNWuO6CmEDviiXWwxxnMkm67ArDR7msSQJWs5LS5AbDB1RHgbLEMWf+z5P6gp
	 JDB3MDuSzDky+tpEiV55aKy+X5Fx3vPtcVnXv/4kYPeRxRhI5iVjlfwBL/adhh8be/8D0
	 bo+nbXI2HwXelC9WhppFfxi6FTDco2oF8YcpNfVJVjOcbaY2o02iYroq/VpjNwZFvCiOM
	 k+9laO1jPM1kjDtM3Zq+/Dkx8R4oAJJAOc56lzIxQcnBPEzuP5zUrlEiOq6+KJTEBCmsC
	 owLm4YiBKFlU5T9t+ux3oKtKo9dlWPJGLn8/A+3sjvVHyog2NnxwYVMZf3wyRj0abYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
	b=07R6E6yaM8ATwNZehjuKdhfkNr0pIX/lq6hl3Tk6tQylifi3epan4HSfQReEW3+hnIQ2
	 kM7NGo7r5EKHFPXIlfbKVDhVyJZSJP6OTtGz057udtIeCiIXhacqzx19vofj9qOcEPagY
	 iEeKcEN9hzcC8iA2PrnMGjZiLodWhGPqKNvV0kk1N5wR7APpsj76CyBJaapOF6sjwLSbY
	 vbhJfJSQziBPO9yHW4p+nuT5JB58kHsHSWbOg8M42OxbMpJSn6VWILjLozQobAvaadOji
	 z7MwHXmW1cCiO+ANyCScKX1umBnabIcng5J+kvNUMmUPlaiea11Bd9X4VqkR57iye4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpCO823S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJM31CaU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E8606EE9B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3E8606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpCO823S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJM31CaU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37iNxm2402837
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MlP1q3VZQzMJWxzzvYQLQv+z
	uzEymMrz2V7pNvd5GA8=; b=fpCO823S32g/4N/mDAHnZYtkrLuTEeHpslQYwUZ/
	0xJKZh2WSWxgEV1KXXtn+QGzIzJaSXjmEwfXOgcmdqGpiyCvUZ6V5Rhr/dF01sDB
	IgI7oWryKEE1obMccTAQvR4uyR4XN1+52edoTQQbuWNgDBnAwyfkKxSmeJ4sIGJM
	xRqoWqICgoMvMWf8QSSJEheO2AmZK+KLLoSTHbGc5MtuclgIFOUFT6WyQmUXD6wz
	klh44eKpTODAeI+OuJ4KjdhFTnzMbGSGJ2Kf2bfOuEHuo5zLu1E7WyDjguema3/b
	MTgg7VUk21N2xwyUAgsRkJnvlsWPERsfQI/UuCwC8XAeyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy29ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:54:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d091514509so380249137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699682; x=1794304482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
        b=ZJM31CaUQt1CYhSIs6qQpS6MiodNNi+hnp73uLmctfkN8zcJjbHFCbC6Zd5dBNRZmP
         aH5LN6ZOlkuyzXa9tIQGFgN0j5HanJ+HK7ITIxrPMIo6rk9t3+z3ajk97VGe6Ie8mFj6
         iE/wCFbc/I3Z0Lm1TlQ4mGKwNM1TAfSamp+mvW63uD0UvBv5VOD+fT3xNksDtUHFGaA6
         0RMmVCRjBPaa+5iB452WZI7gfmr7xp7L2IqjOXsseznleSYN/o7Uc3wUvrH2N0Hi82HW
         2llMdbJMaZm9IlPH5ZvUYh1Na7KZ4sBSk1iRoHeAn/Ti8t8jaN2lVEoXFr8TZrZJwx93
         I7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699682; x=1794304482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
        b=QpV7/vJoO3XZLgztmxqmA0ZXh2mVn9GU7oWVR21BDId7OxAX8r+Z6N0nnjk6R28x6+
         OOjm4DPna+8QslNb2tGy3fezKpRVa6nkKOBeiRNxqH1LqmPskXlaN4QT364g619VZvKp
         UWlvp/49twLHF3Jz6p3buDvPtkXEooR18+o0ejgjtuiroIlLcZMVqdOsd5BNXjAU0CqD
         9m+WPHHWAowmM65DAypFFWZee3FrfZMyR7pzq07B1wahAbrdGIVYULtuX8fPSgoEhKzX
         +iY7/zRZpyNARkg7/8lU4uMLviH2OLG4oTYHbSBkm00cnyO3j5Y8CqTn/oKXSJcZ7a17
         zp0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQLpfLdkyYa7bLTNDkVtvtQDLFGlyOtStEXzEWvP6kJbQrCDd1eRqdFfXjnOnieUTBNqF78NnQxy5bZ/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v41a0QXhEVROxAIYQRMu/uCdouW1+7PJ/tUctJjuOfR17eiIX
	GUGrCx6hRlJlkn1hpA20U7HniDAg27s/QWAMxSQ4qyOaCYuzFX5qqaJu79dD+MiwzdG4EBS+7Pa
	U/w1h5PqcWvvHGg227RrOQEJIx3x/AvPCmq6OTv3HUeiAbar+Jjle6faBF/3wvOZpeAQ=
X-Gm-Gg: AYBFou0rh/tAGABqxuU6h2DCZZnuMUlTAdWFnniG7lmiM9FsGYTUxWd2oAvQM+DB49k
	ga2b28UR9XnFy3qvC8bPJHZm8HcVD3LDTDrRxg5kt7tbK0yXSZ9S53MbMUtzL7AcTtySsfz2o92
	xHRSYdpkL+vNVz2RrF6/ryMtmyLz6x9H/mKSr568KGPY5PnRjUahpKyMKJAQISFoNqCkdSPqEi4
	nXAwcnk2ROyKLJwWjS+5JwR8glKXNDFBVgXEE8CU1NXQuIIg8cstvQ+XkGeYqOuCgNExT5GY8JR
	GnBTL2D8iUqVXHAafnNHhsp05z97/8cw5KnobLaQJaBCdPhFGZCCluwqTANFoTr+H0t3PCvdipr
	COKqckL9ygqJYaqgDqNnGX1uqo0UqArP3pTULER+Pj2oXIxbSn3btvj+QxjC7PnU=
X-Received: by 2002:a05:6102:a217:20b0:7d0:5add:637 with SMTP id ada2fe7eead31-7d05add135amr2794505137.19.1793699681867;
        Tue, 03 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:6102:a217:20b0:7d0:5add:637 with SMTP id ada2fe7eead31-7d05add135amr2794494137.19.1793699681192;
        Tue, 03 Nov 2026 01:54:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm25815616f8f.55.2026.11.03.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:40 -0800 (PST)
Date: Tue, 3 Nov 2026 11:54:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
Message-ID: <gvcpvbyzxrgo52iu5ba2s4sri4wovte7w6pss2zuqtiptemy7f@5k45zx3uih4a>
References: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
 <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
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
In-Reply-To: <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sSs2la10iBS3iy3HZeS0dgNEN10p-D3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3AjBrdl3tZy5
 zUAUEoxP+iGhJ9JU/70FnuBix20tskxuL9iubQf6dW0IbWnNRJTC11zVRkJ0qfrVs7CIsWkqFk2
 pRCL1FCEvnGkIplFtVTjgHj5JVTC1CJ0etF/3K+kCUKrY+d+Ekg2dovMs7AYjgNBOGENBo8Qjno
 f234MdV1cuAXLGhbrl6WHBYUKRCQrGsKfap4jfi0jWC8zE4KEB9SD2UHUqZcApR16BNM8bx6qfn
 0j+IgqqAIWRo6mAoT5uHl7bzBpZEwxWG8WBT9QT+MkLU4BbebT+GfOMofnt6k6E2IjB6FH1kPSt
 0hE81B2ZeWNdB1vVBcslk3b/QQ81jZbGqCNwF0+pOWKgW+UUJzzJ5Jn2VEFpV0ozcKjyta5EnF7
 7Z79Tk28ZaJHl0paWKSmFpfRqn4KQMbTxy7sih6LnIFyTh0OlA1MGfFTi91JL1gfbjGEc3OFVWi
 nOmzHZTZZzWw8uS8Y8w==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9af63 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=U0MhLFlXrxXVFuOl:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UVt8oCwF8lmOR23gQuMA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: sSs2la10iBS3iy3HZeS0dgNEN10p-D3z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX5tWCZKfZ7hTM
 7ZyNrRtTx+h4rw6ENyp84BnI95Ey19Zp3p3mlzPsMuzwMJQET2K50uXhnTx8js+aSSGx7H6jf9Z
 OOqTZxqrUZr9RwP0DngBXORuw72I+hI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-11-03 10:49:34, Konrad Dybcio wrote:
> On 11/3/26 10:48 AM, Abel Vesa wrote:
> > The alpha value of the Zonda PLLs is signed, so for a rate with a
> > fractional part of one half or more, clk_zonda_pll_set_rate() programs
> > L as the integer part rounded up, through zonda_pll_adjust_l_val().
> > 
> > Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
> > zonda_pll_adjust_l_val()"), that function adds the rounding to the
> > requested rate instead of to its quotient by the parent rate, so such a
> > rate change writes the rate in Hz, truncated to 32 bits, into the L
> > register.
> > 
> > Use the quotient again.
> > 
> > Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Prepared with help from an LLM-based assistant.
> > ---
> 
> https://lore.kernel.org/linux-arm-msm/20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com/
> 
> Konrad

Thanks. I missed that one.
