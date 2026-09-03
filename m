Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E2B4E1413
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449772; cv=none; b=qtuhIiUff02Q/Yu8A9omRP0JjmHiIEr8Xdkj9nrrDLQJbRz8vXo2Fhu5jS5OvDnM2tqVEfce4b9t7MmE6drEXMPBtx20sSiK/psXQhJSoJU7r6KSWOO1WUBvWYOPJK5wCNQBgsPXCixC5RTbaokfTpShk3NUMc+v5FimTj77PTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449772; c=relaxed/simple;
	bh=V9D8GuQ4SakAuLfzhLF1uQ1WBbPG5alQqM4F4fDdBwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jObOKy6g11vpoaoBHbKR/CMv06FHTWQZqyhqekQ4gss4KSnf29ZK6HYZJkXJ5EDMEHMIwWFmwAa9/6N9iA3BshWrp1jRNEGlIyYi8JvBXlmLHfBgrgVRO2sb3G/6estCcv8yi4btAfsSdfP/WaWceXqrzLxfksHq+VJXgB4i0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmDVb7Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2sYsZ8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmDVb7Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2sYsZ8t"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAMl4539095
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=; b=QmDVb7BhKrLHB+o4
	Cz5WHcLlAk9fc2bzSukd/88uzvcxxndoLrITDeJf1HEWZQvkEliL+gHBewl3Pf+c
	KvCrngAwQaPSICfImGSrksmjfzNdlu4n3PlfKv/DR8CDMTTfBkyP2hJ2E86ca4BE
	CeIeO9wUPIg7kA/LkS6dMEaaRuWhJm5q2tZ9RiAjGab69Q5AXwtibfiee74XwwGr
	HTogC87BnILx5SjZA/2sTuZ2Ep+fWAaZvASP8L5lB0q+2dtRYbODKl3xLE9fdQYW
	wHNVYi/fe5CVPGnz1WpX+N2tS7DY/Oq4NJaqKd6MwtRt4xDLWlk2KNUVscEbRJYY
	ATQrAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx1cnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:36:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84842381150so3128127b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449769; x=1789054569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=;
        b=C2sYsZ8tJdNqlPZVtlIU4PNkccbwtynNCsPPcrMJXDg3conKV4h7fmNQ1V1psp2ww0
         qbxNpRcfDKJzvPWNS28lTzYxs5nw1SmuwDJPKg6t+QuYKajCqlSN6mc1nz0A+iIdjR+M
         BUJ/5s8IPxJhzm1p4bY5O0OvB8d9jp2bPQwmlArBMvEjfx2HK8BdUhaxvzvT1BEeAYIt
         Tj7sDfp9dSv+2J0PDakdmxmYdeAmz0jttCpqpvm4O8o1/Uh46Jv19jmRfKQcmp43keTJ
         5OdujS8FINWbWNM0+JRRIDTNqjNKLbnlBRXrVp/VlNhcigldwjOIAjvT19f6WMzeuBDQ
         2B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449769; x=1789054569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u253SUzgZpIEwxT0FxYMftNDXzO89HykRn97FBgneE8=;
        b=dTAAIiOqpxXRhFx3naDdCKWzOVaSMB25uIz33HY8WGQ0W5XxKWvsLFarZCf2rM6a4L
         HTVdU5rMsBAsdwwmj/jYdrUOURJsKHlqxPY11H7WowTDUSa8VqGacGfkVtE0fKrcpLgm
         x2xz44faauTh5HIWr0v7eZplL7Tgw69/4hTebjNEqH8r2OWBq8DiWFlO1OFlmG/bblQQ
         ZivCQf44eWMGTLCJdi4UvYYP5ysuDb314DEYuM0esMwcw0GuuWLbCsng+qJPSNWtnbus
         v3b7222w1VYJsFTlHQqKIYpmmJEFFQQhRkCt8AXDcfyYrNIZFjlwYk7HK2mhc2mY8ld+
         p7Dg==
X-Forwarded-Encrypted: i=1; AKwUvBw/Zu32kHMj9FtsRFCrp6qASqDR5Rqw1jaKqnb77TDVHK/b+3oft3EuiBPo8x61tZ+aqMQxCno1ti1w/8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lxc8ffGDME35US8LChhBz9wwtNinTCRHP5Rs6XVGvnN6gTvr/Z
	Jkn7hn6UN0J+9TbQSOI4jH3w1J+xkDVITA5b3W0XAJCsaMgHNxBlSj2Z2Z6tpmD6i9tEDerb7Bf
	wqwu9cMh8HjcoNlv9hzjmhaFreInp3CXq9twlx7mcKsRyrvyqiaVejG4cSl+78wwVLdc=
X-Gm-Gg: AYBFou2OX6/6BuiuLz4Y9pmt8OlRa8fVpgF0oaN0XL3PcP1hGp9FMPr9d0gGVap+d4w
	RNuwRgFfRi4PTZk/8E66a+l8FLwPOYchC9RRpKwxUNBuS7rtOU+zYIKb+zjlD5G1H/5yW+2iE/g
	MH0NdmGGBQgT57Hvo4+Mgwsy50f1ezlcPeDENaCC594yIS1Zcck+n2RXDJN/cKeitvdkufTdwL8
	VmDg/iX2GliNwQAnZ1LdW1tSg8YjfhfWDp4oSakia2f8qiT3tgyoTUmzWnSTXztbqw8nJkUeDIT
	HaI4IO9PpOrHCQV7DY4tNx0UluFy09QCPky5ydt602asXbiaVibOF9bHACe7edHut8hq1idseXb
	OY+dxe7bguLWt/h1kLBoaSy4aBSvgnGT2EDka4Q5DpXy32r9SE7+68E1v4tsMy8I=
X-Received: by 2002:a05:6a00:23cb:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85ed26e5420mr17401909b3a.9.1788449769115;
        Thu, 03 Sep 2026 08:36:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cb:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-85ed26e5420mr17401830b3a.9.1788449768573;
        Thu, 03 Sep 2026 08:36:08 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f872269sm105836b3a.6.2026.09.03.08.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:36:06 -0700 (PDT)
Message-ID: <d9ca8f52-b00c-499a-b924-49ae4490b4dd@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:36:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
 <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xc9zGs_vdkiMb1QGcfFHYP0Cf26LCz3q
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9993ea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QVThMpbGrsNalZwocfEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Xc9zGs_vdkiMb1QGcfFHYP0Cf26LCz3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfXz3dcA/8hwEim
 FtNLgejTnDJ1jaumZsxUcu7pUxhbLQfLKzm0/4N7YH8Fpj4DdNPCd8B7e5zDurs43oNT+WqqnaQ
 HBljYQjD5UdEz8JTYyygl+6TT8UIPurl7ItrGr8cuLKfGBmGXKSJQYKnvo6Uij0ueeJcGss97KE
 ktBeNI198g1ctrbcGP1Y4UijHDv1YjZ+iMcVrea7NYFA2VUEEN2F8knDGbxYvOvuEsBwRiRdW1e
 QaR5epvfKD5wZ6FxCbjVuVFCiIbVUPHEJGZllQJxOVPkh/tR+OqrZQIBQPZFCwLKbMT1fpdz8pj
 A6qvp61xEHqYquLUaNPu06Bpw7FkvRk1zW5CilWnsOAD4fzpAhECv4DHDMsscVXAtJlKXHLT2Qz
 35I3GHTiUTcK53IlHQoDw0AByMRnK0s2jMISRJ5CAbQE1PtHrwAcBXZDIOWRz9xIYK0VfE0p/nD
 ZWJVQri63e2RyZczFUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfX3XiVg/RzdslB
 Dw5W6cLDfNHK6yPZE1JfuqYWUE+yYyG/tAW2zvU14gdOJl3i+teV+j1XcpQw2F3bh2eYewrFVXs
 Qqn+Fk03kvLQVDpm8wHzsDObTkOq+1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030135



On 9/3/2026 7:59 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> Some CMN PLL output clocks require a hardware gate in addition to a
>> fixed rate. The gate control bits reside in the register
>> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
>> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
>> rate with enable/disable/is_enabled gate control through the shared
>> regmap for CMN_PLL_OUTPUT_RELATED_1.
> 
> [...]
> 
>> +static int clk_fixed_gate_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +			       BIT(gate_clk->enable_bit));
>> +}
>> +
>> +static void clk_fixed_gate_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +			  BIT(gate_clk->enable_bit));
>> +}
>> +
>> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
>> +
>> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
>> +				BIT(gate_clk->enable_bit));
>> +}
> 
> This is also all just clk_regmap / clk_branch
> 
> Konrad

OK. I will use the existing clk_regmap/clk_branch infrastructure for
these gated outputs.

