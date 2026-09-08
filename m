Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651CF39E9AD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853183; cv=none; b=MVbNLvqKfhUsdH70DC/qcH80bTfjzFbiuZKQJsk8qbWLFQv/kJ5o2t1S7Bv5LL4OJSQ/wpo8sL4AyTRaGZk9op866F4Wos8oyhFm2z5UAK7gGk9JvMoEp3tsO/sEYMHXRBuoYr4f/JXxLxtSDZiO0oeqy8LLORtIiYMLSKU+XCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853183; c=relaxed/simple;
	bh=vL81cJgOvudKv5vx5g7F21SEULAc4ClndxDIMCUG2Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWbCZ0lE7BMH6Wb7zInuo1OMTUItrzyS8oTep/Dr1qmU8o331dkjQh8dWlhXmMrnIs3UyR4mL5Txngd4wHErgrP+TTqS/s5X4ZiveUG2wX3s5r3sL7LOk+Q1zjthQ1Zu3opshC5Qy9jliEa+rXLceZe2ktLsrv7h2+YfWoIDEws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFifstF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lf/cUTmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFifstF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lf/cUTmc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9xH1521684
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=731eDWp0YnMWLXrCZivqIdRg
	turWkNpesp1ykF83iW4=; b=HFifstF6B6fPLfEXAb5wmB4vBKuf+6i8xygebpmZ
	s1rIsZ/Clom1pKi8D8Et9vMJKXWuFVEfQC6Cq1K3tuG3zCz6H+A6H0nHzWAaKNTY
	KMml/gS0krD/4zbvT7zdvMXrwKdZ2OW78W0MslO67EK0rjneEeIx+LkaDnicVoE6
	mjOP49uzcyjWJm+DTIH47zveVRKlMa6NiTMw/SggPousd7BRAzVamA72jCZcpoDy
	/FbPRsROzuCMP/6bnoV80+u+3vrbA7AjAXby0qz2Hhqvbh/Rr62NwKRSl00PONJA
	UyLZSGxCGLM3T3hhXFTuBexOFvK+TNpErWIr1IDQj7UzBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jkak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:39:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93975d63ffcso478615485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853180; x=1789457980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=731eDWp0YnMWLXrCZivqIdRgturWkNpesp1ykF83iW4=;
        b=Lf/cUTmcfkP7+E7dgbqrg+capnc/Jq4lJSIdnb4/MQiTOqVEiFMUTPaxLQiCI+LSzl
         G2k3jo0WnNNuPqfPFVz8qZek95E26yRSz+BBkclBjZ/IgPJNRbOBpK3/y5BDibw+qTx7
         a17KUWKw+lvF0+Qh8g1e9MXb1SIbwFmRXoVVm373DY9anNVYMxh6STenMylW1QhGBMRJ
         /uvx7CCkvF7RdnrO7R8u8rOblk24a1ZA5fnH8n9szMNQv+LzrLLzIwSdsMBUfXvRnwCh
         dG+ldT99Zfq8XKIGKd55BzhmLX44BWi1xDedpyMEHESyfUpR8xzTwt+YQuWOSdd1UfWN
         B3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853180; x=1789457980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=731eDWp0YnMWLXrCZivqIdRgturWkNpesp1ykF83iW4=;
        b=VNhnlIfihLXi/2YPh+wg5pm6F+ta9EX91E0acF0oIRY8FQ2PscIInEJcEfozLVKXnp
         5s4WrlI74d73wDxK3n7SkMBvY5gAVdIOOqQjrcwPgvGss1Lrm2KupX7woPo1hcMBKVbp
         vPBhSru2Ph5cIHHW3KWS4dkL+2jInFiC6R7uR+w7F4PvR6iwHbvf6rNpduzCkJk6yyli
         Wwd3Z0qEC2gKitzObIXOCqudEfDvsAOzVq7yZxe/5QfHwcUL+249OtbkDFt5lgzsBoc/
         H7eVVPfNKbdjdpo0bt93+qTpGE4wJwwINPNMqemxA3GQtLM7x1xOoqt0ndVvBjH4UDgv
         k9jA==
X-Forwarded-Encrypted: i=1; AKwUvBypd73XSX/BrWTFKpHMC37eD74pT5LDglcHV3JEZC7w9nCTD+KGfCzL2i07mDyFamYM/UdV/yb30X9yMd0=@vger.kernel.org
X-Gm-Message-State: AFuF++ms9/SmQAt2qNcxJsos4j0XQ4idkt8vQ3IXG/WdfR7D46EK5hGp
	R/B+p0wM4SzQK0icq1cO/fw8V2VRzSIRGWB22bn5qmr/NUc9k0ddBYiM9pUoVAd4vEPjkoR6hvz
	ZU83yY7FPQujHmHWQnsBMi8yew1AWIEV8zMosseNwTUHCNOMoGj67U9Ks5xQxwTRPwaA=
X-Gm-Gg: AYBFou0MrrPWb88cGbhyP8aB+gI8GUXR8+hveAlFPFm3XYmiGtLn5kilS81aj83xCo8
	uZkiVCmtcHOPTPoFEF0vnsVPYoQrlacgXyej72vmoHRvTj3Ijhi17XMzqHKvlUJGkY1PwXanQkw
	gMjdA2Ugw2L8tw9wc9WevJdB0o7bY22LPT3qJ80V+Su6J8fKrRXsiBuPuKfLHvOOig9892KryFa
	4CfK8pJfeslRpQNd34/E+CsbFnxLxl3RzFxMcpW6edwPYRHmJNYD+RjlCRYMK/Or7L+w6IS6vcO
	x+ukvusEtyG2jpnpKuczYryyRKHwZblf6nQDuRGSslDaIGB9JRneYqU0C9O/k7f6R6EiAs2jeMc
	1Y6FJAfl6wJE=
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2707866185a.2.1788853179516;
        Tue, 08 Sep 2026 00:39:39 -0700 (PDT)
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2707863185a.2.1788853179035;
        Tue, 08 Sep 2026 00:39:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm25535999f8f.15.2026.09.08.00.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:39:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:39:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
Message-ID: <ahxoakctfkslfiybmxgbvqvarznrbiwohr3rnu5aonmyhkrfmb@cm6mm2azcqvl>
References: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfXxqiSwXxhJCai
 eKlkFJjiQMTYDfGxsU4PJa2zxEq6W7r60Z0Tn4r+vYwVpqcVofB3Djd7oDWag3eoy5zUtwmyj2c
 WhFIp9p6eSjxaFPNH7qtSVDVpNJSSWng3VSxm3Pvm/ttR1qEqTrK+aFQphLTqCmkFLPA1V6zK1A
 Dk9wj11pDIJ5JLDfOkKjZ2wtwnjsgwRgGVqvau4atBXiY/ygENLsbaER7QvGgKWqL+ihTfyUMpE
 34ZV26ktKYv/G7LwWOgfYxPb8UwmfqSUCYNZBujS24aITBAk43zT85qM1IpWEm2xExkI45rcZ3h
 KyW23gR8LIXSMeOrCpqS1sLqyNmGEaUoOChPIxmOvp/pYmDDHZ0Vu+2/6s2tmb/yCuu3MPrgRPc
 bJenjBnZgUF04xOGhM18U4a7DHqjGaOaLLke2cUV0k46WVNkUvDgVFCfda+ekIueU3SGuTtUNXb
 GPehmI1DfsFkZh7Bqrg==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fbbbc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Zo5euW2OAAAA:8 a=EUspDBNiAAAA:8 a=hKUfJe5KFNZvrTfkyfoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: SYlv-rUrzE2WOfJIF-I2ZP3pRUud2S_8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX/p4MSUS6Q5je
 2iH2KKA0DEqt85FAiJoo1MZg27tm82EUUvl/DDenPF2rXJGYGfAHVFfiOHQ+1icTPOrmnhx4MJI
 34hkZcsNWtCWB13z8gN7PmWbQ1B6TLc=
X-Proofpoint-GUID: SYlv-rUrzE2WOfJIF-I2ZP3pRUud2S_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078

On 26-09-05 21:48:25, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in ipq_cmn_pll_register_clks() due to .num being assigned
> only after the fixed rate output clocks and the CMN PLL clock have been
> stored in .hws[]. If registering one of the fixed rate clocks fails, the
> unwind loop under unregister_fixed_clk reads .hws[] while .num is still
> zero as well. With CONFIG_UBSAN_BOUNDS and a compiler that implements
> __counted_by (GCC 15.1+ or Clang 20.1+), this triggers an
> array-index-out-of-bounds report during probe, and with
> CONFIG_UBSAN_TRAP the first store traps so the CMN PLL clocks are never
> provided.
> 
> Move the .num initialization to right after the allocation.
> 
> Cc: stable@vger.kernel.org
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Assisted-by: LLM
> Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
