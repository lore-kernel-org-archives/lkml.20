Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258752;
	b=GZsCVZc9/2zop74x/g9JAhNZ3YGB+qDekLMtmaNih7vFM8CWZkXo0hNZPd+6JGgmnpvA
	 mX/lhDQ6v5UmvK1naZJwvpHtUBc7Sp6lwJQIhlvUMQ+b/t2AZMMlrJYQ1u3QLfsa+1/jW
	 xWo9FMAiOO0ep2gQCFtYVU3cZSZMOIBg1ddQnq0qCxZMKaS39dMY5h/PANgYNuSIs3Pow
	 /2ZNBHwPle2KSQO/CgPZqr+FGVvauC7kN3GFJe1/mOEHtOPYTuEHg5g5S1n6fCb2EoAm+
	 DE7NCwNB0Z/gn51uLBqCiSBktc2ow4laLycZ6t98liMo7Fd7Q+To6/S6r21nNtwennA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
	b=zVF8ptbRwFoCTbtkEYO9nrGS6eG7OIcY9lCOs6lnmvLZL+S8aWKLJUvmrAECENRXm9f0
	 UoINjKimOUFlVl4Huq+QsDu/h9Y4TV7oEZxz8nfF+auTP/68y+pF/4P5x+bCrHHrp5VB9
	 fydTPm6wbQXirrjxmu51LdnHdshhfpVmLrvcdfB+XQQ3WL0+PfzhxDT4InALWom7pE3BE
	 oSQCAEW/lt6WGEvBANa4WO7VgWuoo8gHpshvjsShxCfdfnFIpUFnfTA1/pGL4HgFCYq1J
	 g6s3U4R4AxSGJB1012i3paukdMAWLdhOAmc0/15NQJKx45gNeWKOpUILCJBz+PrxOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GqdrpWKf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GqdrpWKf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gmmi176793
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=; b=WMbDXrgb+uS8dEwt
	DjFQF79dR1ep6mfPqr4H1gwzFJ35mCShmfFtfCshkwKxnGD56fDCx74h8e2wh97W
	rUa4FlmajEarcIuR6Q+OO3UwbWTaBG9M7G6tyL1Hyk0eqXgQTmA2AN3GWQuKVLx2
	uuPrEMpRfmX4m6Tr6WGDjLPQ1x7AQUvqmUY4SG0SYM/XI/0BffHG5nfx7ysB/YC8
	bO4pu3ADHcqcAyqK71NzhqAo9uuMSs0oPGhhQQ+pSC9SbPPYP44ClEvwwflZF42E
	2sLRkxybcB5FYvZukMxQsiqAG6/QtMMz+nOS7WMD8yljtdKfQFO44Qp1vuXCS/jl
	NHaCnw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehue3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c70349f65so39371336d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793258751; x=1793863551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=GqdrpWKfCUk4imCVsSVEKcRZPv2JRmj+5XT7hpK7YUmufnLpeSYMLjTE9TKQumZoPL
         aNBk5O6rEJ2uYCIuuZZZpCxXHR0Dq1ZU+SSxEAwr7B2D7rgnDF4fnFYITPVAaDsAGYoO
         yjIr7lpInBOcW57eyrFeTY1zicJJoMsEJmiruQWkoAlD/WcRbpYMe/CpLQrbE4ty3K9i
         3S7h5/fQR9jAH9KIXZytdPNv1DUFsl7FLQh08OiTR4+wzqy/IWT2W6fV6NDpWhNixA96
         RKby40+baKyz7Gl90COd3j2w5ofaZM0skIlLKBXi4N7FeJ/9illy97w13Wis06pQCKar
         NpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258751; x=1793863551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=FGi70TneoZhV+uyGjxHwDWf8pBpORZWhrUwoMPAhufRxuDUvLUld5ktjck/YQ4MkJj
         51SYvSW/uop75+zpEYCSBPm1QzVDBbslmy8N8DbZbhb/rD2QxyPjKVu9+A7gAJwA9/fh
         tjH6e84cCaeoJb99wds4v0Qirsq9ojVWquPg1b5lXlc84mcXY6pDO6+1wRoy7UocqOwB
         sVGoaGs0cme/7bJuQbjbTSxe5Y/wCPADUw9YnY1Mk3y1Bw87lKSHFBrylumnTrQkcrnj
         jlqstFdXAX/Lbtgkqq0T+NZYvm0d0M5mDlw7hgwPkr94OfemCBbPsXRaqwkfJLR3podH
         ixkA==
X-Forwarded-Encrypted: i=1; AKwUvBxTWvp+hL7ni9HL87rfeP95o4IdNuMf39V1nixZpW3Nr4M4a6nUGwZYyumdiXHmoNci2wwQh/8hdeyYDio=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkQRkyttnOCmSCOBhDKO6s+CGE4uWDSdcjMYjAVnTkf3so7gHs
	JC4yBJPgnBWsHyE7s6c6gNJtYtSsoPFOHrgUXXsf465znokGRMb5zPGex9/34gr6pETG1yv9xb5
	W+7JREqD1TknBBQ09ty72fVfS4S1sOlGIf7psw9sXboFUg7L6tLowRHVMCISLgw1bQfY=
X-Gm-Gg: AYBFou15VxuDwvBZtbp1DKfQpZP8npNRldhIm7W1/46Cvv5ZfCIbrldgMxvYkN3oOsz
	ALNp1Y0p3frLVN3BxyVb0/B32q4WzPtN8ml97PB51nGla82jho8aZB3+Jv3zjDPNoM8krjUN8nc
	R6LfXaaG5AvzGcy8lYdnzw+dn/M2syhDRyV9E6JSB/NRP7h/UC75C59nlxc8CblwfgTQLVY6hgl
	YSTnylDXKTZlta5dX+cFeFrBaWfMpv9NO+BNqF6yExe+jbSZsi30I0YNfVg03chxS/ZJ39hZIUH
	JtmAvVUblSQGh1ek1OpiswaTxkoF2geSiuNAoILxyylMjD7sNcIKgMh+kDXFYMa/v42Yy+R++qY
	adax6Yhrt4Sy7+b3EkCiOnSu3STRDEbFO97fGl1kYKo4tcsF7jdT+6FUOvTh+SuCp8chn0yMcGQ
	Jayw6yfne5CyVI9w==
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614856985a.54.1793258750418;
        Thu, 29 Oct 2026 00:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614853885a.54.1793258749900;
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm18038106f8f.13.2026.10.29.00.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Message-ID: <d59a7591-b4ca-48fe-9f23-335e3bc21d81@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:25:46 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o_P1Y0JUMQudwgmYHPVDQNBLA7EHuzF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfX/gSzRMCw2AMP
 r2iDbyDnInqA+6esZY+j/lmoTq8l3qYnb1R+En0OUgLjRia06RiAdGprkD7AzSS9pnNvnpbY8Ef
 xVTXlm3YbtCAFCrClLrNr4Pa6xoOGkAVlTVztqqX28Gz1UnVqjvhtZA2aNRSOsYDmsjRrFNO3V1
 TCtBU2VYSWAKhW/Mzzuu9Zks6PiylnvHkjj4GUk+SQ9PHR6ch6YmeiY6X2S5VAT87+ir+sWxdie
 YISloJ9nVREyca0pMIDVZ2mtW/lHM3wAWkJ4ohbiCYmos8r47fq/DUuYbYrP1Xo1vZvHH/l/a8C
 mh8rOvdpu0QXemqlOZb6pPodgQtu+iRulNFwXuRu8tdkWkyulPfEGPbZQAZ4k/RCjvgOrNH9Q1h
 E82rO6VbSwYfWLbsIdke1TCsf9PrU0PdkhoQhOcbtfaiwX67N4ZUdWS31cwvO5uzCUnLb3m1C/5
 kng9nshRYl2OxnqZ92Q==
X-Proofpoint-GUID: o_P1Y0JUMQudwgmYHPVDQNBLA7EHuzF1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfX3xn+GmMjAbR0
 4hx58GIuE0CdrOxDsSiTxEgV5EQjPOsyK9GmArnLId8T2EUQfKLs3EbJy3qJqWjHBnf6FYF+snJ
 1E1e8V0Mhf2FrsaSZ75JgkaI4fWuBKs=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2f4ff cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bB782UoiXxmDKwpK7Y8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290028



On 10/29/2026 12:00 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
>> What clock votes cannot express is why I think the camera NoC is an
>> interconnect:
>>
>>   - The camera NoC is a bus with several independent masters: the VFE
>>     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
>>     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that 
> happens to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's 
> not interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two 
> completely separate producers/consumers and we have specific ports that 
> RPM/RPMh is involved in managing.
> 
> Which is not the case for CamNoc - here really we have some shared 
> clocks which we need to calculate across components within the Camera 
> power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We 
> don't really have many - any ? other examples in Qcom SoCs where we lump 
> a number of different semi-independent components into one area - ICP, 
> CDM, VFE, JPEG and ask them to share aggregated clocks - in a way that 
> is specific to - guessing but - specific to how these components get 
> modeled in silicon test benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if 
> we get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I 
> think just doing votes via interconnect and icc_set_bw() into icc-clk in 
> the drivers directly won't produce the same bandwidth calculations we 
> have in downstream - which you may loathe downstream code but the clock 
> calculations we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c 
> heuristic for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more 
> clocks/SoCs this disparity will grow.

Just to add, there is a CAMNOC interconnect within the camera subsystem
that handles arbitration between the online and offline engines and routes
the data to MMNOC.

It also provides QoS settings, which are currently configured by the VFE driver
as part of set_qos(). Therefore, I agree with Bryan that, if implemented properly,
the downstream driver could switch to this approach in the future.

This raises the question: should we update CAMSS to use the CAMNOC provider and stop
voting directly on MMNOC? CAMNOC could then vote on MNOC based on the aggregated bandwidth
requests from the individual engines.

Regards,
~Gjorgji

> 
> ---
> bod

