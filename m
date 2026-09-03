Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA534A0909
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441047; cv=none; b=cPB2gS76CvGpBf+u2rt03Jl9JosQZUC9IdRGvSQvAbDD8UKHRXo9OtcmB0VuEq7E/7C+POEeonprK9hklfcgp96iaft7iR3BEJbUrh1Ev512u5XHFVCQ2fsPKgl7Mj4/BWguQbu/qz2jMfJrJSnU+TauOKjkzArQvHnsr988g7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441047; c=relaxed/simple;
	bh=OUocHxNHaoVUmZukJnp6L5cZUWHYtQ8kCIucV6TV0dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEul5uMKBM1L0aFpk1BpTWrUIqFSkrKn4tBor9zUlQDlYRMrbWhErk4HwMAgmVK8W+m0zBc55+V8a+tcDr79ljwjEY1mVsSokzMFp2eNnfp9p8DVU1HSVMvEylsy/pygsAPTtuNLaa7PFv1UISCe1GhWBdVzBD9XxPMenvPklyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKptOiMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Frbutl1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKptOiMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Frbutl1X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAQDK1040616
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cn7sN8g06PhLcqch4IQw8gv6
	uTx2KKsaOGyxpQeDq28=; b=RKptOiMUoW8m6un7H8mN1o8vuFe58rpoeMHd2MB+
	FpSzPfgYfRk8yln61tLY05aKdlhqqlg/yIvwhNmUX+/aTZQ48+j9nwEnd99Fm/Gw
	Yl2h21GuM/Oh16enKrF20x73FapEdqdvGAcWaD9IZ/eXi13uFCmpVxlXqgGgBIxK
	ficdduSqECy/4PHfW/BAWAED3Z63CExjKMEiSsnYee0mwj4u5plLoDErK2L6vBEq
	F9HtvbyOJJUQfUPOrL75jjVZwqeM0g3MrZg0RD4epFoULebGqCUbCd41OlloA26/
	vOIiPdV9vB9BO4GAFIxmksxZzD+ZWojePPztkbA5XfuQoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hw55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:10:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so467877585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441039; x=1789045839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=Frbutl1X9lV00ToVuNj3CqVOKjJ2A+TixGO7y9vaOM24BuZER/RdWpBFP6pZ1x0/M6
         DGHlLgUjP+LsTkUnKz9gNRj8M6NdVgGtxYbXUKLn4JuFuypiyQBJkoxGjqwkJlWuD9Rg
         kATPgQLuKMXA6ANY98AvucA25oGjB8BkebQDUICPpp3cPpEPTkqebgEhZtgt8xGP+Yr1
         LSvMQklzbQW5N5rhtnkYcPHUMVfPyiCjuQSRUgnEf4tBC6YTaLXcqoPeYWI3e98oTL1g
         33sgqqOVbXu+NrocjA5AiGZ+1b+QE86+zGesFxtkMV+ENrOWXDqZvYVuG0gjHZO827Es
         XV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441039; x=1789045839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=TrIHF0CDFA9TJmt8SS/d0sICBAoXqSjTWn1el+SdUcV2Oy0eDehjy9dEMAqe3Eq9NS
         XYHM7i9Rc9Vq7mYfp9T0xuPrRKLObmZ/r9f0iFERgZETATOnZoud1eOEM3EGr18dlV13
         3U/BhCYhSmUuKelnEPDDxbfXdmskmS9XoeaGFFE3gclC7V4b0e8l8kXhVgERuWcn2Iu5
         5fJkF/orqkfd/LwHmlAWBCb+Owkd8ksCUPBZKqhd41fQw4LE//D5Wz7q/uicm2SYz4DA
         fGIagchB7lKZATrqnGgE7f9xESsiJ7yG4bSTOSwoT1GL6zTtp8GAtwcE8z4C+r+pKdu2
         a1uA==
X-Forwarded-Encrypted: i=1; AKwUvBx9n93x8ywD/vFIwgzn4PC+Mn/quY02x/ma6K+tTs6lyf7wcGBK/MbM4KIab4XokqT7x0PnIqPE9gDrX0o=@vger.kernel.org
X-Gm-Message-State: AFuF++klwGMfsOMwYeSfyrZbprM20BinROrHDu8X9L4FP34Ga3bc8LP0
	HYnzY/YsFwBe6bsYzUuQRL4dmzo3MCiafgOBGcQqVL65rodKWkoHLrrpCQUiRRb7oeOvrlYicbI
	SLIzXpYubAsgny7SzOm/H1GG4ZhuoVhZSO3iIDdJZKgLqxTB8cqUKUdydlGhi7TnckAw=
X-Gm-Gg: AYBFou1mt9sbF86VTCKQGVElSFnQPdLoyo8R+YN8txHFTB5AHQHUGwgWvYBGnMdfSYH
	l7PQn5Nq1Msmy3Fyd9WylYeANJNGuV5WycCtAPpoMeOb+zBfJd0jnk1Zffx8HySaEFICwJO9EMz
	0PS9/4ezk9mbk3Dg5MjN17761WQhaWmgZjkuvftfY/Gdn0TvqI6Aa44IdfpiH/SPGQ6kSUsok7x
	S0mJ67iLRCi0zBvSluv5C0FZSftP1B/Is3alXDGcZgw3Fl8Ic0WEZ1zfsSdRL2YzjeNyl3xDOmK
	dPn1SzrwMvzHYdiLM6pbVyXFzu8IwyKWvl/uyo/1qScwZlAXRwYKDB1mg5vzz1eN7jRosbHRaGC
	NBF4k1Ar/dQpDYg==
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596206185a.14.1788441038761;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596195985a.14.1788441038097;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm76285335e9.4.2026.09.03.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:10:37 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:10:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Message-ID: <44uo7pmwu3iztzgwqwzygyisipoqt2bczsawojzdn7hszk6tl6@c4ybkv2zvcgy>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9971cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=T-px378Lc1Y-79xuwAIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: DknG3L1nKKDnoU7MMkZACVMKs3ok6eAJ
X-Proofpoint-ORIG-GUID: DknG3L1nKKDnoU7MMkZACVMKs3ok6eAJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX79FpyqYsnFi8
 wxLpTUwZctOhotD3TL79Jg7bCecOAu2TCd1XNiAlJYY/ExPFqJ2yvxXW6n9IqbjozwDTV3oPAbe
 CBWFJct6MAepUa1mtFA0nJMYY5NKcTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfXxf/at6EJtJtQ
 Y2fUzWpJsrMLPu0l8JL04KsG/DT9MCxmayEy3HHva/C9stKV7MvHqXc9xeQ9PiQ+YruYKcqU6FB
 veGW8o0tEns517bPhMW2aODXw/jNUPSYKIwRnTtN6xdgg/DOnezysYFfVsL/U8pH+L6EJ6j5wPX
 kfTQPusk9qjdYNmzFELOEijppRoDKoea6CckGUkvxXLQS0u5xD6ukRvFi9V4n5ewqFnj6ipe2nx
 aAUP1YqCyydzTaWp0EvA5GW3p1MPdybx9UYYVfwOSIoExpGT26S1/um9igH0mjLJ8EeYjjjGg8C
 yMmTFTtqB5tFBdtpK/H4dCyTmywInAfeyoblEDmAzzNOX5qX0AsAAF9XSGVpLdxjQDx0fv+INAY
 naNKOs6w36gLIHEtMDXX9UsfOAGvAkeBjpUnmPafZ7WMZXu0SOUZbaIrWoEKFIC75QcR+S21MkL
 dnxrOmqEwWS139WBYww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030114

On 26-08-14 05:48:13, Luo Jie wrote:
> Add a flags field to struct clk_regmap_div and OR it into the
> CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
> divider_ro_determine_rate(), divider_get_val(), and
> divider_recalc_rate(), so that qcom drivers can opt into
> CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.
> 
> This is additive and backward compatible: existing clk_regmap_div
> users don't initialize .flags, so it defaults to 0, and
> CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
