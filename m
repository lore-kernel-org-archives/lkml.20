Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07747ECF0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992220; cv=none; b=FFpCcJPWokj+lv8SCR5hivYREHggx3DZZ9OQg2+9D//t4RN4mcNyQG8k8lPx/+evvIS8AiEAfFNiCrhE8MBFwrXexuYzMJ34Dl8oZSDUPlBSVz+NJKzD+t5OZK9EBv9LOXJCJi4Ah7eZEMmb1QnXct6HwK3Ok1vUxQTUJqclW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992220; c=relaxed/simple;
	bh=wrCw6QYtbAtAjoXr8u5vWlaJ122mrqoxMHssYpqC5PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLOz0cLT8D5buuCFOdsoMKhAMzRfAynGqFoKu7WaAgCN5Oq1fDwOgFMueaNtDE9WBNyWXKizyuPU8WkT15ntaXujh+KdKpKbDdDqfN+VXthFmyGBHNlmz+MowR5UmPZp1EY+ZNL/l00D4a+RFhH74pdImR3OP6pZDsq+qy0b86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/E5fXIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0ujr1K1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/E5fXIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0ujr1K1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeAIj837791
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VArKn6HRSgJ5ORsNQ2h5LlmQglM2MWTODNVNkO1AMKc=; b=l/E5fXIWIUi2ga5n
	68l3PKkeuQfCkRrACbkitObZjQCPKRtbyOD/KVroG3bZtibwqwww6LbPTn2ttor4
	lgqVBMf3qsm+TJbmcKpDvM9u5l665qzWJ7GU75JmbEti1rQVC+0TTcbICTy10Ajp
	QlglCmjAV5fo8FBrX+lTao4ufrFUXt8Ek8YUzgNZovGeZ8B4KXA/1a/bJ0XIB3dS
	teqOHW0wy3z9bElB8Uj13suxH+M6cSkpLy7Pqs9lpYxYAmyNmj6ahLI+s9sTCF1r
	1VucRkKLKNEXfkEgJQ1lMuBQ138/nYR+G8VIACt4RpCIqvJQ7rwrEyybQw/ol1Uq
	gT3AEQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hptb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4040307a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992216; x=1790597016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VArKn6HRSgJ5ORsNQ2h5LlmQglM2MWTODNVNkO1AMKc=;
        b=b0ujr1K1pXF5eo6SM9RAoKkP0chCPvXyyZ90YoyqteyDc2erTyR+b2xEER3QtvTywv
         8p5MxxU82kEPmEEJm0YluZNjddlbbwdR/kgVCri0sWli7VmrNvGIRajAaDYePUFE5f9o
         R4lH1foKu2HhXYXifAC8aM0L5d+XWOIs/gSdJLFnPH1bOQNPHsufdyjXeRYsQkElJcpw
         ivYySlYyYhHxJhyKVYd6JbNwxyTmbEVm7b//HqPBPyz8uCPpvaH3yzFaZx09ObcSOYuy
         p5wBwia9pYCtRDU3NtdwBKlBrO8m4oXBf6tnGEXSA/mFbcHhsI5vdK4KVz+/hKyg2ymi
         Q7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992216; x=1790597016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VArKn6HRSgJ5ORsNQ2h5LlmQglM2MWTODNVNkO1AMKc=;
        b=aWc+9mIkyMUwtOZ80S05/rlP0wwyqLGf0AAE45PFvezG1n4VeHEVe8yVSdl+zUK2tC
         brGtFIzsNLHUTM8t9gYJvEBzZmcAZP2GOSH5O7fDMUCuDGy3bhzZTSJSSbpnMwxI9L6p
         GEMotfea/KhRnx7bqHwqdXArXL4jNa5mMsHTVyJL6jP81pFJsBf5rt6/WmQ0BCj8ovM4
         mWqXnRav0kI/mAz32XvmD/WJ89OSB+PnU422Sihn7CT5Ud4kbhHHGdw50j60AaLJo6mX
         qAA+cssGyCDVQRpy6QNXz9Q8PeSmKEa81RuGULtVN/FJ/kSbtwI4WfnTvc+mL6vK/lbV
         vqfg==
X-Forwarded-Encrypted: i=1; AKwUvBy5/scTZyPm0R8CFNEZF94nYBJ2lWybp5JTWsSEyrGKhSnb5b+ZGQa1aREo/S1Eg2ZTpf6dTuGoKCHDVF4=@vger.kernel.org
X-Gm-Message-State: AFuF++k0YDH35zjbSo92gpaInRxDAVC9sOEyr0uEHwFdfLBeDZsZ5SKa
	1zQQiAoGlaXXbzVFhTdzSjOWFk55VOU2cfgZ8M74Sco430fsWhb70s7sSHW9Yhv21Nf1t11cEqo
	/eWCxdhCH32dVlsIFRHjwMNAZaBvANC+gebnhJUZp1vdTjqIzHwche2NGcgNXReJu5Zs=
X-Gm-Gg: AYBFou0WUIUkLxIKJs8nHyGPN9r2tPVcHmdVYtvA9kgTPeeO45J4ObzsYM1b3UfzQ/j
	NSoj8E7kZFvZUVC87zoEOgomNRzGfMtYcT2LWv+ubFmT49k2Ma+wpvVODCtNM6rl9i7dPV2dBjB
	Pa+tCo+u0s5hdAmFmgSpVb6TVt41VnQsSmKn1voswC5wilvPW85L43Vk4Y4wt8rDzEK82EQ2YNU
	Cnh/Zq0IgeiNm39F4KewIwGP2ZKRljZ182eu2Fuynb7E2EbO/z5jt4Swc+vyKndbLHPgF4H2y89
	dx0QFDk++kI3L+P3So9DplHen3JKMaMWL5Jr5BmP92yCR6Pp2OqJuI9Ii9srQDNNKgpt74nhZz4
	r/X/px3/t0e8O4XCdj146hLQbYh1z3qE=
X-Received: by 2002:a17:90b:384d:b0:39e:6c6a:656d with SMTP id 98e67ed59e1d1-39e6c6a6757mr9411738a91.48.1789992215614;
        Mon, 21 Sep 2026 05:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:39e:6c6a:656d with SMTP id 98e67ed59e1d1-39e6c6a6757mr9411692a91.48.1789992214968;
        Mon, 21 Sep 2026 05:03:34 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb427casm14277769a91.17.2026.09.21.05.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:03:34 -0700 (PDT)
Message-ID: <5fc58faf-dd51-4b7b-a2ce-5acb0ac6bbd6@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:33:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: Girish Mahadevan <girishm@codeaurora.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260921-i2c-fix-se-clk-conf-v2-1-8b5537ceff2d@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260921-i2c-fix-se-clk-conf-v2-1-8b5537ceff2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab11d18 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=787kBdZmKeldAlDLGqgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: EJEYNhoVTf5gvrsda0Yc4rxpaMgD-vxH
X-Proofpoint-ORIG-GUID: EJEYNhoVTf5gvrsda0Yc4rxpaMgD-vxH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXyxmFo3DYz0Pc
 1WPtJFWcpOPlwoypPosqeQ6joeqH5ETJ2QkQRvZNDrhUB5aE27xH/KvtFVoUjekAyS0z410uwsh
 oUvLEuDvG3eULkcDk2y73w2xjFE+JgA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX8Fc7frQiutD5
 h+var0X4mMNul+2ByJhJz6TFzpvlfMbNvRrmUxTcIIhTtHuhJU/17ThwFIBlwwXqGRaanV8emNV
 wHRlqjkSE/S0DGllQLs1BhDBmS/9IB6xd4/WB0A/twFUFL424ykd4cxlSkjIOlWdVSV8sUO0yn2
 rOE1MutQJCoduCxGpQ8y146EKEyhBaCabfMk5F6Dzax9Jwo//P02rB2knngkaYwjxjZcIMYMaWl
 RJcGwC2IoPp3yiAv/EcKvehnbhHeEcu6wj1s80Gc+w14h3lD86uUGoRrGzWAPG+YegqtEmSY+kj
 pKrxZ5EsXvVFfbCau3Lq0rn7mq+Pv+Hht0qyuoqRqjTt0srGqxY0zPvBTlINfzxMUnrJu0Xlj8U
 gFs6rEZXGBlrqkyJn0uY3YvfUAlRaquGFQ5js+pev/A5ATVIJ5RULLTbsCTsZPuPkIL5oH93iDR
 cQG8Idl7DwFa2ZqxNIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174



On 9/21/2026 5:17 PM, Viken Dadhaniya wrote:
> qcom_geni_i2c_conf() writes a hardcoded 0 to SE_GENI_CLK_SEL, which
> selects an index from the hardware clock performance table. This always
> picks the first table entry regardless of the actual source clock
> configuration. On platforms where the matching entry is not at index 0,
> the wrong source clock divider is active and the I2C bus runs at an
> incorrect frequency.
> 
> Use geni_se_clk_freq_match() in geni_i2c_clk_map_idx() to find the
> performance table index for the source clock (32 MHz or 19.2 MHz). Store
> the resolved index in a new clk_idx field in geni_i2c_dev and write it
> to SE_GENI_CLK_SEL instead of the hardcoded 0.
> 
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update the comment describing the source-clock frequency requirement
>   and the rejection of higher-frequency multiples.
> - Add a blank line before the final return statement, as suggested.
> - Link to v1: https://patch.msgid.link/20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com
> 
> --- b4-submit-tracking ---
> {
>   "series": {
>     "revision": 2,
>     "change-id": "20260807-i2c-fix-se-clk-conf-89f6f92d373a",
>     "prefixes": [],
>     "presubject": "",
>     "history": {
>       "v1": [
>         "20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com"
>       ]
>     }
>   }
> }

Please ignore the --- b4-submit-tracking --- block; it is internal b4
metadata accidentally included during the rebase.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
[...]
