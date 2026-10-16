Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F17F30D3FA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113380; cv=none; b=AU844vHAt7LYmoa2Uk7eQcjuKyL9gKj8OAbZ+BLVS2imTqG9wwWQnwe8S4qXxcHNRRka+xnDTYJQZVWY/PEHyAhmrjnl5cbp5SuZlvFk5o1ic/2KLkpRuMiS1iZtaDSdOU3aJFMweDUEe8zCP/dxv/01h1bEM+wGjc3dFN/ACj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113380; c=relaxed/simple;
	bh=2c1wK9gYzYlKbLjVTNj0wetDDWNe8rPYMH3tP678Zpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gzda79UDEdWGuhv1cXoO0R3GxLmSI/5D1YzVDuStem32sahBN5pqTCEEDgNiQnU0uhaQKa2eXBymHhb1Hyvy6VpouWNLa9B/dzLPv8R/dea8t2IvpTOzJMurQW8ii/B6lJoOriUdzpqpnR9Gzaawseaol2Sz6+5noa0jXSOpyKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPhifNud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LoUskICH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPhifNud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoUskICH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKZ0Yx3462803
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ceil8ApEuXIOnzvOdNHC09v5aFaMm6YBmj5PvCtp8Vc=; b=UPhifNud0sRVad0+
	n7VFeMMEZ3bBUjvNNtIXjWc1AL1penavjpVnltPXweHuyetFctH0FJyR+bpP3kst
	DFNhnwym3yVW/7iEOOCcOd7JAJ2qIkIm2T9yJ6e6JJj67OVJAqqoNQ6eCytUjUwb
	+bQtwNJUwzcOHzMx0pBeL7jo8vfYodTm5wbjhSLxHKJjjkuoIYfcpBdaguwBLzfC
	6GN0AraXbuhHmmuQvMwtGl8QkloII1R9NJ9rvOeVzon8yJUdGu937b5+pAuAxZ6P
	qCodwqd6LnLAZZqIpAXfyhX9GfgKFu0nlgVsC3TSWNust2QK+QFiueiLoGa4Rz04
	mJ7dHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6ajmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:16:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8ba4757caso5126455ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792113376; x=1792718176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceil8ApEuXIOnzvOdNHC09v5aFaMm6YBmj5PvCtp8Vc=;
        b=LoUskICHYbluHwbmkYBYiK7rRhenCyRfXoSrkB2+IzTvGULY5m4cyNbw5Tj0KyMI3y
         LXIIkecMacdMhTG/TEbA5WvfZIBD/8ZSuVWpe2Ta/+tkDAGpRZLNVhrraZXIj1G+oNlB
         73SFDD0qGdPvKEws1T4rL7nQmGZeLwY0OgUsD++F3K17PLzUUugmI0HftcHdMr9k3iY0
         OYfRyzHQWY8VvC39RN7c82vMu7OEi5rULOAUyeYswZPwq36pt4EfT/AD/gRI44znllgF
         kJXRXQCYYKukbtr0t5/UOO9hSfxzXbfHF5/uzMJ5nfmrcRIA+9jYBNOVT126UMuxW1xJ
         UdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113376; x=1792718176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceil8ApEuXIOnzvOdNHC09v5aFaMm6YBmj5PvCtp8Vc=;
        b=CdUoyfejakrE802Wbl+g4C/zynLN8g/VYgqqNU7kCG6GhzpIAh9UTxRalteoUN6Pn6
         eaF1EG9vxh/7rQ+0UQkQ0VjcpwC92M+py1ihDXbeG31woXQda2XKl7CInnkfw6CCxom2
         0rRaNVV2C1fJ08A9VEH91HagD1fK1Y0Cjv3Ph0yBrGOO9Ncd1yn8WVluv/jrztMHBOnO
         cCYBm2+IHWGwhUA6IvkdUHIqSVF/9WkH7Atr/4lvVpeLAqgC4z83Hq2vPRLG2eI52U/+
         4fjNVYdZjZBji8wLLJQ7MWaZgvCsJKHdHgk66/Hxrb8jrW3Jdj8xpcahMEViNsjiaJmE
         JBSA==
X-Forwarded-Encrypted: i=1; AKwUvBwBdav+QD4GQBTBGuC5dzM6A/zf+VnCBkqIJ/hdaCWX9HaKV1NAalA1vsuJzX3tmZI7AJrmcSz/29KWlDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV7ec0Ugqni5S7NoXGojmVU70mr0vhIWnemKxVTE6du1YWcqCT
	93mta6ZPW2XiZYwIQ94YEAnz4/Ox1ooQ+nAY0+ESu5vJydIxGF3oWX6XjBP8wHBQsXzKSjw4lIR
	j2LymFlFUZe+x730XsJ7NaFcSK/eqZtpWAQfEOYpm7mfzPewojdKc41uqVXKXJIcNgoSdqi5kbl
	c=
X-Gm-Gg: AYBFou3au+GkM/yvuAORJvi5G5HOY2AhPUBsI+Wld2Nm5NpB2cOS+cjJIP2pwRZO7xa
	xX62RRaliOY4TjOAN7FAC3W7TUdj9xHftLNhmutCRjl9MFE3EJLUUH9RcetXSMUCOBUcO8yZMpl
	IFeSfLjt9MkMEtqkNi47hTjRp3RzfXzY1wPPF9euOsrCYzp5hxCM4mhhRr8Gje03pwihw+jrfQS
	k0o+RN0R6OE25ey8rYpGCDSVossxGeY4KrsTW1cOEWtPnpDp7cF/Mz9ERuHsc2tcStnyRaR+m83
	paic6td/sSGyAKGCxGnEqg0LI0wAnk8HXcY0Qiaqxm2Mg2KgNl21NoZiGSIbMY6A9D8EWZ2FCpe
	cDzDxTjA6B7IVONJ5etJ+S6Uu9Wrr8PoXg9hQtegslC1MnPago7qqX9DdS5JxqJ0i
X-Received: by 2002:a17:903:251:b0:2e9:6468:1ffc with SMTP id d9443c01a7336-2e97754397dmr11749085ad.20.1792113375945;
        Thu, 15 Oct 2026 18:16:15 -0700 (PDT)
X-Received: by 2002:a17:903:251:b0:2e9:6468:1ffc with SMTP id d9443c01a7336-2e97754397dmr11748875ad.20.1792113375413;
        Thu, 15 Oct 2026 18:16:15 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8997edsm2651535ad.63.2026.10.15.18.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 18:16:14 -0700 (PDT)
Message-ID: <97246003-eb3f-481e-a659-2d5a0234c6a5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:16:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
 <37ddf1d4-4c53-4f74-ae15-f1f8025a79f7@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <37ddf1d4-4c53-4f74-ae15-f1f8025a79f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QsFQveLmgH72ja3x0D5IFs5HDYwMyioC
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad17ae0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xuU9YvB76CLXlpF1iJ4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QsFQveLmgH72ja3x0D5IFs5HDYwMyioC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfXy3H2/M7Lcs5E
 Yh00pwITTcrp6L5/7L4tzJytewMfIdDGriP+EhkO/mo3IeXkC8HAjoh3crb+XWC7vqJc+5WrJux
 gdQzNxMqnYJj31vo29YYauQrrVmTdNYGn8yXPszCwAThetrlrvacb3oVcXJTUXGKZH6EcLpfLRL
 wgd2Sq2W7eloEVaDwfEQpKJEs+wmot94LRjj+QpF70DpwcK+/ZSa1Pr4+DChN8H0KhcQLJM1G21
 w3Qo+xTiliLcY9R3PTJsqjAqMKTh44oXrO9Ub7VscxNAa4AEm4iiI2jSRnCvlwbsTGE2PkAwErv
 8ZCCa0q9pfhVB+id/HTNiyThygZIXldJ7HiSvPD40XSRU3Jsk1iZlyEgYeAHny51S1CzFKp/fgL
 gZ+NR3ikUEFhaKs7qV8SM2ir4rARYumyDJILYru7qp2Em8Ck92yUelg3yIdI7Rm1lkDINhX/hU/
 sqkgTM8OAYoo+qnrIjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfXyNTyx/l84U5a
 Vgd0WpZcEIIC03ifcb8T64Gc8kRytfWcrF1iuVjgYhnoEdlrTYOTuY0Udrh/nAE4OkLKsIFMqnY
 Jav9vStNG69c0bs+rutIfVB4VrrSoJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160004



On 10/15/2026 10:18 PM, Konrad Dybcio wrote:
> On 9/22/26 12:08 PM, Shawn Guo wrote:
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
>> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
>> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
>> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
>> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
>> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
>> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
>> sink.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
> 
> 
>> +	tpdm-nsp0-cdsp-llm {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_nsp0_cdsp_llm";
>> +
>> +		qcom,cmb-element-bits = <32>;
>> +
>> +		out-ports {
>> +			port {
>> +				nsp0_tpdm0_out: endpoint {
>> +					remote-endpoint = <&nsp0_tpda_in0>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-nsp0-cdsp-llm-2 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_nsp0_cdsp_llm_2";
> 
> GPT points out you have a separator befoer the '2' here, but not in other places

skipped '1' here, we can rename the node to llm-1 to avoid misunderstanding.

Thanks,
Jie

> 
> Konrad

