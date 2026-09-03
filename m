Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D914C77BF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448025; cv=none; b=ILeT0sxHmV1GuVQM/DyOPg39yBUfk9daiDlxx/0AWbu3FKBSQyerddUzys5zYdXrSMv+BIEcIT8u0g+Cwvo7H4ceZvm08Sll+laC2+tOnx8VUi+piq/tDvB1r9UoP90sCugLPh4bNkUDyTp5Qciomw1NoUMhUskIOV4BwOHuT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448025; c=relaxed/simple;
	bh=UcMfgKoIgbjA/Yt1Y60klCeHwQzhR96tNxN6tCPrud4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIxFxjtNtVv/IaqI++tvBZEAVRcxu8lhfcRUPT0DR7Gle4i1qKEgdHOnpPHt5rG1K2urFQuuQ8rNnN+Gkh6OKK88O3TUW9xG25gaOESM2yx//Fm7MmH+s8yE7viF61+i4vNOyJfZAy4GNWBqmnBjOJv2YL8NLi1eMB1bGU8epWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTVtJ5V/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMnx/nN/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTVtJ5V/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMnx/nN/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DALCh1705133
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJQlwKWVKCEeiPvskX1SbJyL3p4M8HL541YIt9e58Tk=; b=iTVtJ5V/yDPSlXFV
	Gq/ViW3j9yBXcY5xAmGzZN3sOcE8LJ57Rq9NoEI5hYN/Us9/0OMl/ilx55zoL99q
	Ioj1bwu/iszqBdp15p8nD0D607dYHNUuGGVVWCJST24ZVJShQKQ0xCrrrkB7pRfA
	FwgvWqvw1bUI5L7JStzfeGobAb+i62JlApnOg8a/2gJ2SAgyZooezJKvnSPqCt1B
	/1UANVZeYmuYnB/kkL7VhBLl24QxqIOgJ95HTdmv7iWMAfbfoer6Rrb8bTilfTZg
	1HzC626ud9Ko1niZj1A3dLBBtmA+Dpa+CHZ+Zlrhny12TCbQQG09QG1USReZxn/Y
	lil0kQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b18jg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:07:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so67474745ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448022; x=1789052822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJQlwKWVKCEeiPvskX1SbJyL3p4M8HL541YIt9e58Tk=;
        b=iMnx/nN/1JZU82E5/o91CqRlDTrzI+vFmwlCtlP+xL8wwkWO2D10No4FejSC+TmAFo
         h5lSRBWb4aYdpM6tlN+qzduAQe2l6v4F/yaCYrmjtE3S1Tpn8STNWzRV1MBb3E1yRXAx
         F1NWP1+m7/HaizM1JeO9q/m23O/CxW/dKT35RZAA6VG2aXlziZBvXpihjO+FwoosRvl9
         v5alaCYaOa99y9qU53mt1L18RkhvkrzHgZTqpP4lHwhUHwON6xEQYWeDoG1X//iaHKbR
         LzI35xNbuT9gace47bRXd1Mg+oYR+cDxkXjYrkXTTkhi7po++/zn8WTF4/2tIBxSLWFw
         VYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448022; x=1789052822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJQlwKWVKCEeiPvskX1SbJyL3p4M8HL541YIt9e58Tk=;
        b=j6ONNNzHGihbojJDSCSYejFx6ITvRi+it9o2R2quhTy6UnVvt8SCwEfZl8SXiwqjZY
         v3YJ3cpd+080LmC2GSdE/Ych2JqvWJZ+cY7KsgYsSqZn7/MLH6dkRpQFHgMCStPRSOcW
         JZ6iTDJt8mnjkGFwvxvDD3DePkAApQ6OrseRcUH8RXjX7fM4kHfT8H7/zA8AHrI1nzFp
         /3SJwqOUXuaxgIMq/5jpqXI9DQ7aDSRn3uwrVe3ERHikFzjITwh83h6qayC1CrXWWVbe
         IgfbuVSeKomKUWiNq4/5J75W+MrNVKpQFDahwgkoxjQxKMsr+wH3UrQSuCm7Py2Cheih
         FxgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5Nx/WcAZcDu2vntdqR6o41SRnHYCLXjAjiA5+f4UfL5pSf9HgeBSGyDvi6+7biu/rb7dA6Y/Xk2oPKZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++n9oo/weXP30vVxsWx0uV91muBMmLsMXKRrs4SrrhPjFr0rMhsY
	BUVdolRK4eYLnbzQ+92dN1sz3aUghdUKqePCw9rxitvQeVtbCB1isKaLmyguwWUSs8mZZI5Kj9C
	6UG+i9UTZY7WL9NPSQLG7G2aLVC+ZVNobJzb76nqrBsJFpKs2ReLAy9jb9oDJ3SLRDVM=
X-Gm-Gg: AYBFou2Bo/25lhV9ECDpZ02/mti/2UAYDM+3agDceQmD+D/p2w0rKtrK/fWa10txWJy
	ArVMa+yotXajPrlfOar6Ay4oGlZ54eJSGqGD4P+n7LWvBl8X1yWq/K87CN0vsylANsWNUBDh5LC
	439ljoxLguMsqKUejutrY3FNQUcURBj5AeXzqFoaAMZzgbLLzqQBDygbBgumytjtmo3z/3Iq/A7
	QpyUZIfdJNz85/bcRApeMGrajgWClXVGV+f0NDB09Yy8kGtocK/sjygXFAEAGYCFH0i1W2Apk16
	yRDJZLeunjHw3JTdetwfmcNN8L0vYCGykYN8qMZPIoXM3gSkxFECahWjFHX+RrSunUgI7ubGdPt
	QfqVeEEbfV5Sph5xqswPctyx/N9KdJ7/OCwO0PLFc89TFlaHRi/zna8fZwdnHL16h
X-Received: by 2002:a17:903:3c65:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2db104e87famr6825755ad.1.1788448022357;
        Thu, 03 Sep 2026 08:07:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2db104e87famr6824365ad.1.1788448021745;
        Thu, 03 Sep 2026 08:07:01 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe929d77sm11790525ad.39.2026.09.03.08.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:07:01 -0700 (PDT)
Message-ID: <d93ad481-b574-449e-97aa-f5d1828f583b@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
 <j6m4b2psvvg65qksij63wxo3aqoc5ldlfehqnywa3i33v4pm5j@lr4i5o2g6tdt>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <j6m4b2psvvg65qksij63wxo3aqoc5ldlfehqnywa3i33v4pm5j@lr4i5o2g6tdt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bvt2hYMXkgS-qVLibwnbfnCjjPS6f-P5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfXy6e41LXhWCbZ
 jB1p5xNoQ+ncwKeOhiXphzm8ElvnIzVqwfZnYLyZ89tngf3/38TcR33allZe8nMHdnhozZ9sIck
 RoVX/w+UnJIMx38C57MMganZGI+erWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfX9B+9nBf0sgKR
 0DX1mLEZ6gtqggqqNpZXHM/Yo8CcD5YmKsuwJWWWOSVfpC/SDbWUyg8fqHar8H5Q3VJeDJ7lzok
 YK51VS+Mrw5r/imvhPyOmTU3nFlHWlhxk+b6/Ik0Ps0/1AyIiaEHcyoVaxMtXa5c6qoTeQOJABM
 Xud4irhTDlyRMNAPTVSh1Fq1P78w7jw/3dD713l7drfIXJQGORmCLd+6p7xhRjuy7H+AMXU+ZQe
 Jxfrlky6zKe1AtxWo9pt8+8hdDzXPttA00ra0rErODheFjkw3ftYDVvrYmHkN8VZcnDen3iLodM
 vYvMUi3DdYuQbu/i0k0by+DeFYMsNwVXG8pUg45wnPNKGzE+vdMYAE6HBGkZ85YQPa+cLDuXSOT
 p73IXMouQamQXCTSUUD2aLI+5jVbO6aWbwhQJY4qAleA+CqInM5jLExc06yDwiOvx1qw+DtvbpW
 x61CA5B1Yy0XahWq6zw==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a998d17 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_0NKdZRjI3JEYUyFDiwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Bvt2hYMXkgS-qVLibwnbfnCjjPS6f-P5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030132



On 9/3/2026 9:18 PM, Abel Vesa wrote:
> On 26-08-14 05:48:14, Luo Jie wrote:
>> Most CMN PLL output clocks are derived from the 12 GHz PLL output
>> through a shared, physical /2 stage, ahead of any further per-clock
>> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
>> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
>> This /2 stage is present in the CMN PLL block on every SoC supported
>> by this driver, not just IPQ5210.
>>
>> Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
>> and store it on struct clk_cmn_pll so the output clock types added by
>> later patches can parent on it. The two plain fixed-rate outputs,
>> xo-24mhz and sleep-32khz, are the exception on IPQ5210 SoC: they stay
>> parented directly on the main PLL clock.
>>
>> On SoCs other than IPQ5210, every output clock is a plain fixed-rate
>> clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
>> value rather than one computed from the parent rate, so this /2 clock
>> is registered there but currently has no consumers; IPQ5210 is simply
>> the first SoC in this driver whose output clocks are modeled as
>> depending on parent_rate, which is what makes the /2 stage significant.
>>
>> This patch only registers the clock; later patches wire it in as the
>> effective parent for the output clock types that sit downstream of it.
> 
> Do not mention future patches here. Each patch has to stand by itself.
> 

I will remove the reference to later patches and ensure that this patch
is self-contained.

>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/ipq-cmn-pll.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 4fdf78f6829e..bcb51a5f559a 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
>> @@ -96,10 +96,17 @@ struct cmn_pll_fixed_output_clk {
>>   * struct clk_cmn_pll - CMN PLL hardware specific data
>>   * @regmap: hardware regmap.
>>   * @hw: handle between common and hardware-specific interfaces
>> + * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
>> + *           every supported SoC, but only IPQ5210 currently parents
>> + *           any output clock on it (every output clock except the
>> + *           plain fixed-rate xo/sleep clocks, which stay on the main
>> + *           PLL); other SoCs' output clocks use hardcoded rates that
>> + *           never depend on a parent
>>   */
>>  struct clk_cmn_pll {
>>  	struct regmap *regmap;
>>  	struct clk_hw hw;
>> +	struct clk_hw *div2_hw;
>>  };
>>  
>>  #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
>> @@ -362,6 +369,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>>  	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
>>  	struct clk_hw_onecell_data *hw_data;
>>  	struct device *dev = &pdev->dev;
>> +	struct clk_cmn_pll *cmn_pll;
>>  	struct clk_hw *cmn_pll_hw;
>>  	unsigned int num_clks;
>>  	struct clk_hw *hw;
>> @@ -388,6 +396,20 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>>  	if (IS_ERR(cmn_pll_hw))
>>  		return PTR_ERR(cmn_pll_hw);
>>  
>> +	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
>> +
>> +	/*
>> +	 * The CMN PLL output feeds a shared, physical /2 stage ahead of
>> +	 * any further per-clock processing (a gated fixed rate, a
>> +	 * configurable divider, or a rate-select bit). Register it once
>> +	 * as a fixed-factor clock so the output clock types added by
>> +	 * later patches can parent on it.
> 
> The comment here should only say why this is needed. Do not mention
> future patches.
> 

Understood, thanks.

>> +	 */
>> +	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "cmn_pll_div2",
>> +								       cmn_pll_hw, 0, 1, 2);
>> +	if (IS_ERR(cmn_pll->div2_hw))
>> +		return PTR_ERR(cmn_pll->div2_hw);
> 
> In fact, I think this clock registering is self explanatory as is, so you
> should drop the comment above it.
> 

Agreed. I will drop the comment above the clock registration.

>> +
>>  	/* Register the fixed rate output clocks. */
>>  	for (i = 0; i < num_clks; i++) {
>>  		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>>
>> -- 
>> 2.43.0
>>

