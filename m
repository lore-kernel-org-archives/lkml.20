Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582924;
	b=dUGDgd/iDe4rRN4TPxgeUhHV6gnDbp4L4mLWbDjsN6TB9GCb6f3JosykoY9+Dg3veIHj
	 vmLNRjPEqcSJmR8t0OePBdx6ofpt7ecSnojdQ/aH5e6j8W5969tMIVBbaA2tbwhfNQYDh
	 7rbTmlVb6gH9dP6QTCuZXrcRZfqieWgDU7UJ+xespYusIie262WFMS6jInG5O95UnD96L
	 iVNX8vXLCDZcIQqmxZy93o7Vf+M80FdXPR/Kq/PNQTTATfnnxvgxk8BHZVEICT8/drju6
	 KAcFdZw5HBu6IzIfFKq9Z1IPkJ3PdGr4Kk7bQj2kl5U9oDwHm1P5qpkUQnv1Tj4/ZQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
	b=gyhGBElxqfmtRXeHiPrC+dIxdmwyEs5AVGOry5xGsu6l/2aOe1JmgqjFWXyBLLpEn6x+
	 P7m+6+tDlrrbSe1ds0/e/ROouZxj57iD7+oyDxDqC0UafcAIIn3X3WrfS2YEd6GnHI6Ba
	 3q9Ywdn/uSQEOq1XA7MB4CkcWBUqFxIHN+BbAatMU4cffWjdysOaZlqAOciFBkBEsRV2U
	 XxPlmFgS+yGURB4PhKMngOqNnU7IjjRk8YlIFrfeG73Nzih4J1D3U0G/ZzrJSYRB34hMU
	 VM+1rBQFbEVNtutkX1M0VGAAe84u0axaoLVaSRXykA8rR4bxNPqnUBZkiJ5VxVwDpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=joPVtpmc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECP0PHPc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7153606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7153606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=joPVtpmc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECP0PHPc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6IiB4170579
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=; b=joPVtpmcy6TSTeqI
	10ffHdh59BK/YbVVENvKPlpJnItmiJTO2fyZYv2k9oRSlyT/MBiVBtdHPSndH1AG
	eOqsjayQiY9hB6GNCrj4nGSaH79wmUmcLBBmPH0MOPmY9SmDmkbjolupkoBwMWib
	LG7oDXNYqdIV4XjMXNkHV5ZXHkYNghYGoXVGw56ss+iz2uCOZhTQGI3TBUG6tf9V
	+pIWORd8+mqE1QqkWC4lGKPQxTMMP6YP60Xp/pwQ98RrJqTji74sBnWkBpqgfJ5n
	u+OpHYfFe8BtEv/M/81M8HTk6izGHeqya3dbivIyrKSUI/PM1PCzoxMJVIT9A/x1
	4b0vnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hupjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:42:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so11892485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582921; x=1793187721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
        b=ECP0PHPc844KKyVjZ56bHksR+R7DT47g9F6SDsnJhEJxZIfT+Qay7YUD1dKk+TkFP5
         VdXGvBg5fLeB1M9JT5t40QW5wH9rU6f80nY9KjY9CA+ZH+kJkAifAQQoz4tDI1Hz53jq
         s39mh9VQlNJpI8XUiL522Ud8+ArJf7m+KcwAOf/ikjjGy7R+DBZoPgJG8t0AQGfLApHU
         pVVctNo0PVfMsDxnGazU9rTXhVX0CEqs6V0x1MTXUYXQ1T0xjjYYvRnXtlNGYUeQfl68
         2E2DRRYCN2D57Uv8SY0qazr6eHat46M1x/z2QTG20Sk4y6K6g+2+StAXPTiu823dBMGU
         ztcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582921; x=1793187721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
        b=IkozER8D+eVF8c2GLGjZX5zhRwu7KRaFxZ+FDpSVxD/iIDBoySXlNpylKJwNLy+qzv
         2A+JKETg4GtFdwQZHyRUoseatLFZcp9b//iPOgntRtwAEzN5kJlWqJwLrWVlwmITBQ9K
         04r/j8byeiWtDgucDic+CrHH9pedUiZS0MgolgxL6NWP/PEtZmoLTPOjE6ZUklk0IqFa
         pWfkKCeqknklonsgsoMFlzx7R6kn/RB6C7CaTG9IkvuB5Tf+daqhnGbuW24JUxamrJyw
         tMWAaUzT3IxQdBuwu7my74KlWJ2Uc2qpETdX6c9d9EJ/cmJrrvj9pRsVyztjIDzI396d
         /05A==
X-Forwarded-Encrypted: i=1; AKwUvBxyrobiLvHmJ+qd/dD+N2hQLvq1Uisad1Itq4AP1NCKYemK4gNbAUtBq1vxjPqzDg8+T3LQjaTQ9xXayic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwY6iP5wAAnVT5LdpboTRRP9jLYpWDOUOQTfarItsmT7rMo2Iy
	6OispSavvQba9yPmPsAJSKZxpdO7P5Ps2l7IaL264SqnWcNkFpFVnk5vPVkxH9B1EfB/8QrksAc
	3uB+3pMvgDHVFapu2ZUbw8X0m20B6BsOiB3cq24XKNWkxsgEGes1LSMpjjZXI+kg4hf0=
X-Gm-Gg: AYBFou2cMgWr1ehx8Qc+NM72GAO8uD12vcIyQ2lJ/dQXddbiIwTcFEAAT9S0APoc9Iq
	LH5LLhVsm9y4FpHy0XQOXUn2AcgNYkDqJH5QpJVmOytVs61/nEp8TGhlJ4JznvTNlFCnKFez/fj
	Cx4VYyVxVIqxOP+EBGU1aZx3/6f7qnB8Af7GRzQ02X10gof9oePlkuD9BWasMNRm8BwbJ/W/hFX
	LxlwpQDPHic2UKwrpVe4sWTN9bP1NoE9ytJzMpMSPRlzC9YKT5zqENWmA7f0ft66UdaJ9wPwDyd
	EwxfUSuYgO+omvAgorGQZPPq2hd2BdQGBRqq3uTUK5Tphus/AIJD64M88FRPlnH7KxG0iuiN4oM
	e5LG2l03rdLR2j0bC+3IlUw==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr474751885a.6.1792582921391;
        Wed, 21 Oct 2026 04:42:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr474745685a.6.1792582920907;
        Wed, 21 Oct 2026 04:42:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5b763sm69095666b.2.2026.10.21.04.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:41:59 -0700 (PDT)
Message-ID: <1fa61e39-1ef4-42b0-aa9e-ca7dab94c336@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:41:57 +0200
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
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
 <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8a50a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i7A_KPRCft12q0410FAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX0BXrblrSv/AD
 kt/x4HwsXJcQlH3VhylHDIIEbU8zmpEeEpvUn/sHn+CLvr1EjI39p4WBLvw09UjkHhGj87IsC+n
 PqbPsP123cm+LRtxqvebfddE6wLhlPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXz3e/URndmtEw
 ZiiPCSZv+TFZhKfszLnVWWcMXqXfOp4A/tNKjSrhV0DMAw0wGczfbafYoRrgJ/ZxZX7EybRGdef
 +EWSsUOqkxb03WODEhFdR2Yh/+Uo36joTlSwdVgaL6wJMRBIM2bCl9bPMS0zYakYskFJGO7up+C
 03ded3qg5SwpOaKmw4D76VKbK8mQVUtM1LWBt+twRnz+TbpzrnkhQ2xFfzdVcxUBP+zGZSXDz61
 raHnVZc9Sv152Gvc99WcXVfGhfTnWf7vttAjUE+GTQYMON2YijL14LjcWsU0brv5A66nRv58OGt
 yOZb2DCTIGyIFg/E98eYOSq6OiS1xHlIM8FW0vCITGosMmJXqNJgBjyQ/q6gpLo+c5qL5NCnXKO
 sL70gY9WIkvCz1/jfCN2yUqudNWsbz656CcVSxH+fUMgb1sii4Ac4HnE4jMSydXZcM80J4uP45P
 8RsgvbFnMXdYm5uD69Q==
X-Proofpoint-GUID: ItsDvHT-iK53Q5qsH-QODlmxADehz9jy
X-Proofpoint-ORIG-GUID: ItsDvHT-iK53Q5qsH-QODlmxADehz9jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046

On 9/24/26 11:32 AM, Imran Shaik wrote:
> 
> 
> On 21-09-2026 02:23 pm, Konrad Dybcio wrote:
>> On 9/16/26 1:05 PM, Imran Shaik wrote:
>>>
>>>
>>> On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
>>>> On 9/10/26 3:44 PM, Imran Shaik wrote:
>>>>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>>>>> every clock, keeping them non-zero until a consumer takes over. If there
>>>>> is no consumer, those clocks will remain active in the idle scenario as
>>>>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>>>>
>>>>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>>>>> keeping other targets unaffected.
>>>>>
>>>>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Are you booting with clk_ignore_unused?
>>>>
>>>
>>> No Konrad, clk_ignore_unused is not present.
>>>
>>> Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
>>> during handoff. If no consumer takes over, those votes remain active,
>>> keeping the resource ON in idle and preventing XO shutdown.
>>
>> I re-read this and yeah you're right
>>
>> Is the handoff functionality necessary at all for non-icc clocks?
> 
> Actually, if any consumers surviving on these proxy votes on other
> targets as of today, removing the handoff logic could impact boot-up as
> well. Hence, introduced the skip_clk_handoff flag to maintain backward
> compatibility on other targets.

So is that a "no"?

Konrad
