Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572000;
	b=qqWcPvyPWV9X4ctzQvmmmIYXRvCGIftRlatD+G/uzmkTLd5TuLvm5AVeUIkLt4zzAJqJ
	 PsUs1zNKk9cS1Z7lT1VyEcijbopvPL9NZ/wHJHjLfRW644S/lCLTdixRpT42IUdwERzlh
	 iCchPfdtLBaJWnq/ZC0mGMHaLN1Cm2RFLAoRFyHhgGEOfiEZsV8USR06ccLdhD5IhxslW
	 g21ST0FzmCa2lNgytJNgfQasPt3+TBo8iK/9FiybreNCmTaPaqL1PpRO7ExjK01o/sP7x
	 3qgtGMt5mBPIrncUgiaenoQQySdKYf3ZYp3yaeqsBkq4i4nSq72BvOmUk9WNmg99eiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
	b=3ARHGyYiclwp0TL+Lr5XsD/KtBOB5vw5Rw6iPVxpNzCMa1mYSa2z4ZQ4Uymspd2uss3m
	 HBbIvqxtysQ6M5cPf85NfQqNCSAZF2eNjberZODa3EUjQFZ1FnrNgLWZsrhjU6RtMlWKp
	 WUhOLqZEN0sGACGKuyWBmTFHJ5x9+8nIwo7u2veIZZMOh0071cJBlI39CHyqOReO5yMN/
	 0vnE93S1Od6dxaDzHe2oVTJnCDZ3FMnjJ7zXYbumILI1eyPGbMYgiGIIi//lkSuu3lglI
	 IeDwa74jd6RRkq59/nYWIbPMQvUu+Xylku2Ob5kCmbDQPcGYA7PXQK1LzFU4MmUB5Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/qx+OFc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJKu3I6o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADC606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EADC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/qx+OFc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJKu3I6o
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLAl2848640
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eu+VlkZRyZabpCBno7qI5H9B
	N7q4P+DGNA4Dm+cX548=; b=T/qx+OFcw9/2D6aQFQ52yElW5d9+dtOlK/AYphrn
	1Kp7TdIIM468zvynEAvijO1JOOeBLIl447DdhN+9JiOY5RjehQVo683FKLlgnTCj
	nB0sl6YcUQZ6sseYks9D7M2fyJlFEsxloKuRlSLUOMxjdS4Ekk+VmHIr4xo+S5XO
	aSCjB1TPVJz0DQkhvpPcSOessj+f0tlYKgAegUGyZEwBe+C8fIFypS6noTiper5Y
	MVJ1AJg7ai6n64bi3jvMsKsjH7AR9kv7zRSbNG5iDPnEm9738wmzlawdMkn4cPO7
	WD3up+RFqEmptY0SwGP/A4RkYW5GpL5Zd6jIvn/qA1sKQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9aqx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so54221085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792571998; x=1793176798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
        b=DJKu3I6ozPRQajuG600bNUKwedCy/gzNDD8EAx9afw1KYbpnRUYC1grggvaKNrvE0E
         dTCzi/Re9VfBmZjmqjGCrG1RKgF47lAXutpCDIC9igoyKEYmt7+1a8zkG/110yf4YHI8
         Q4o89X4vHaA5bKSwE1Geagu0FVl3I7IorfvqKhsHz5ykv29JXUXwLNpeAzXzki6ufgXK
         tj/U69B712pFQA/RJtBqYwUJt3kMa73v2Zo8ft0saux+r5HZmxn2hvGfzFGXlSU1d9A6
         qtT1iTvEiGt2DxtJrM1yh4XFc/+/MvvIeYgA8XK7iCONWKIj1RHifpdkvtP/IQPJQre9
         MBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571998; x=1793176798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
        b=YkcCqaSTDJUBAPUSHGeZ2LNN7IiRp1YUdy9+7mrYCTaayqyXxgNczMl0U+gv3HylHG
         PvayPRRCIzs/P33czdk3j0LG/66xCJukZHHFJ5V8OD0a7RS63MJ4PGkwafHZp6beluiI
         bMtp9vEHkd4mKBQa9LQH3JOliUx0oPbriEHPu+mdsJ0tHYpQMA7+qYtvR2AdIDBeT5BS
         JBA00NC0v2PZ76HGJ/3WaTvGS8UiNvjBCCMNP+Ee6UNhej8YJHpFg885YbAcFnlBz/YN
         kwwwLG4YJZdqONEvvJw59Q33PKkAuqW/GWZ62xzFrrkpHl+4UydgyqMKDx7GDftOT9gE
         ZO5w==
X-Forwarded-Encrypted: i=1; AKwUvBw5ByPzKPH4lR8dslW8XUn2zhqpNwe5L37W1PHsl1aqnagvf0GlvAjNACVWODO8MtFqjVBlrB9n0D6YnLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzf0esYIJsccDpgBkGtDofkjaUbq9HkWCgFb1NCPTCiqw95fjj
	q37P95Li3NHAS7lJXMoJX2FzbHYI57BcK6R0a7EifNQ4Le2u6naaUR4XowvKAZeIcfMzE5SFGJw
	WtgKsXLZjjlOeFYyAMrBzNijWK749Bm4IpCIOW8nLwn6dJ05VSTgfDFwMF84nlCwO7qU=
X-Gm-Gg: AYBFou1Hw2ZnorbDbyc+DFh63L7I9zdBxi3YjFgZptrQrBtQvRYw2BHgKjjRBPyZACb
	mTL/k+3hPZCFIiqXrIl50qHlHi6s5jBGnHJngysChNsulObXyE5lPfYrLVM6Eb4O0cLfwPHI6eL
	CIGY9wnUYdhfMgFG7ZhQTEWD31NwsD6biBT4bgBKPI3CSzZ57dHUWRKZggBc9q1TbcI37eJte+Y
	P+2E3akCbbHEiRaPas7d5TBe+Q96VB0kMjia+l/BU9R2Mr/orWmdhUx8uAc1SoqglV/zYZOakgp
	CgRjODCDBnxmQM/iXmTc8dU0AEkJhBujeeOkfeyRgfVeXDqLjAmALp5SLU9lHmoBCo0PdzdsUDp
	6+elveQnn9IRqcHSj
X-Received: by 2002:a05:620a:44c4:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93f57f8184bmr302265685a.45.1792571997403;
        Wed, 21 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93f57f8184bmr302262085a.45.1792571996712;
        Wed, 21 Oct 2026 01:39:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm4383464f8f.12.2026.10.21.01.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:39:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:39:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
Message-ID: <eqgi6p625bizyb3rnrwmdgnnzrwja4w5cywdy7rjdgokfc2vd2@i7e4da5ymatc>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-2-sushmit718@gmail.com>
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
In-Reply-To: <20261020142157.1749-2-sushmit718@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXzzL2hYknb74k
 z7eRj+ugBTo0jGslmAftT7VMmWETJ4Jl+pyTTho+EHUQDogxGDD6bMqoUCsXGk5hEJzcu4iExSg
 70bH9VpHjXHOGikZWx1s08R6P3qN4ys=
X-Proofpoint-GUID: IgwgNKWoMPymh9hulUeuEXKxtKziR2v5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXxqOvoO+pWg9t
 N2lKPUVFIR494akqTu/nIvvYsirdtipV0nlr4leGP7bvOPHo0+Vm3jCOrGKeNYLuCwB+5uw2PCH
 NPZBVjJ4V6h1I+eXVQONUDkoMnaErX66Tqp6AgD1NqAa2X6fMvFQ5eC7m2392FrlCe0qKOFCzgA
 jOFn5gpIGEnSEiR94LUrnK/8AH9Ws4fADQk/ucuPuiW7TDbCZLO0hMVCfBrTN5jyHX8styY5uo5
 xqIKRnAgv7f2bbiThFiwP2ekuNfc+fhLfmUTsdoW9sODWwctsTbzYdmH55RhokvuXL38s4bsM7G
 pAKfesYR6NVrXsCoJCWaBqCP+Q1FqoxB/CA/87F2UWT4L+S4mnrMu2umdKkV89iTovTBm39Dkyp
 6WHxA/5t2500Ox85ifYHGiQalE0h0RbfCrAVGqeADyJMQx+lGBBxGIQu59jWb/sAKRa3xNfdkhV
 UYVtHGHKRoHNYgjz2aQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87a5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=b9oLyuJ6L9Q2BeRKDwEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IgwgNKWoMPymh9hulUeuEXKxtKziR2v5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:29, Sushmit Singh Rathore wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
