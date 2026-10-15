Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3533649E5F4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051739; cv=none; b=LD9qlgro14C4+0H+5hSlqpwt1Lci0d7g1uOYg2FRx9IADud++V2HzB/ZR9hOhcuGwQEUKgq87F3UvchudEYhLV5i9BoYTlR6KUk1y3dlDSZaONiP7hB3XkHnfwMbe31D6ZbiaAsi3XDrgVzWSNaJGuWoh+bGZp1+7li2srQq+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051739; c=relaxed/simple;
	bh=45PV67NtVgc4sgYoNCXN4H3us/yM8vaBVPcRzxk4TYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYGVa3ttlMK5D1TTJDt8Kp5u1Aa//7hBKe1849zEVpsGf76mgrzK/cVRTW9QMnnV8R1fGsnkjuA8AchwieKiLai+yU3xceghYFZnm3usrPfDDIYONFTox/jvAbR06v16RxkgAbEZ/aqnjK/jvjvatPSIGL0bzRU61H05a42YCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Res8tA3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guTIaqTA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Res8tA3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guTIaqTA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6w77k2121427
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMnY2CqlgwWMj3YeqL6fccDpD4YzU58CT0eUffdDoHE=; b=Res8tA3hpKW+/v3Y
	qd9PdKElNkpfRFG8PjnPy5qMMB0ADXBDMqSZRbUDe1sOwIVOvbCX67jHZ1TAOrrw
	RqAjKI3FMEQithBfeOjNv/RhMRxP26sxxkReXOHuhIq6aGCQ0uoJho6Fx0EVfs6T
	sdG0/BMx5ARj4sY+0bUfCMKRIVhX8cZ1SKdmHYigHq+qqjypnRkdTsMNq248uC4L
	ZvbPtTOJZLcp5i1Ce8PHv/GsxW8JFNpGtb7zJcAmobbVCms9AAhHYc0OxAxHrb6t
	JUGriX+6tWN4YZwcBvzkwBnHRLeLdmmoHj0phFBfPBBlqPCVai259ulfyYPG8LVo
	DAGj5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1m80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:08:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338d5d0509so10906071cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051736; x=1792656536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMnY2CqlgwWMj3YeqL6fccDpD4YzU58CT0eUffdDoHE=;
        b=guTIaqTAHl2v/qBQVjjinXWaTC3PmoEhn/T3D1gR5BtDrkAelKxrHrtQAKNIY/ykbK
         Z9gj14LQoIQXuioi0ga12cnBhSh7vSI9AR2FtCq24GiNcWCEch0ERiH/mNP0Wj8SWzdN
         kHQRo45OW9lMLj28Ug5O+gZc7pH7+Jrvs0sXrI989jcorO3uqKSyPgPTvyaHvCMF/0Ls
         5XA2szQgkRnSZ8DRFH9SeGbhM32DzRRMbt/0+0bvSncKXGccxuEf0mxO6CtL0RpJVzDp
         Zr6ibSO4x+Hq+zIbUdgXSp8lb/AaJHS4HnAlZdWDC1BzVAPOtZRv1e5+6pQkgOAXoC1O
         rYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051736; x=1792656536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMnY2CqlgwWMj3YeqL6fccDpD4YzU58CT0eUffdDoHE=;
        b=IiZoQjPdMhSd+xw+xFH2A9ZyJVwPA0K/WSUT8fntlPf7bT4iPN7cmW5un71470cnz6
         wjrN8BC2Ei9/eID4wkw6GhLJGSr+ejM/yZObYi5ZqrD+O86VqBdPYW+Ok+PkQey8nnzJ
         u62HYjJvL7bVF3TD2067IFXdBlYz+Xq08MsX8l0nu/Uu4KFfMy3hz4/NRypsR6ibY2Uv
         5Cu3q5OqekexvkSU0LezK3biHTHODs1FenwIm6f3m0bYCkc2sIailBy7Ftgm806q3SBf
         e8CzmkFWqHlZV7vX95NcyytndfUQYN8a9KYjThk6jXS2p5PSWLSrjOdO+6thUN3wBvVv
         A2Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzd1TZ0mMupYk4f32d5Gaox1A2EDL2j/yN5neS7KNY/ltZlckK+2PQBF5q3PuSFibmaNcjJzQnbjy5QAEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbReXKW+y/w8zt6cuKqMTqshxxKagNyPFuKorNGOj74Mdk2TTR
	br70lh541x7P5KnZwLhVDDkjerctXxUC2BirqfBs3C2T4U5ZhMO1jneYN815vj7htVc3osflnSj
	rG7e4VtThfAviQB44Y01kQjDupATkUJqpXH9Ttn3mKxU+L+SAhSDis2Eo/Eu7q++0uLg=
X-Gm-Gg: AYBFou0jpLdGBIFrxXEjay6C/0ghFuLrIv+MM+qUOzlCkpI2r0AyWls5Q+vbkEfHzTY
	6XwycRqQNdo7kEQBZtbfiKhDnbRJ0H/p6DXMCRNWG/fNWyb+opoo9RnMhLLD5E9MUM1sukI2Qs7
	5iNfYK6uYRdvK7BoPwSGZcA2pF7BqN58HbQlNs9XbUwdGdRa0Azr5okyHkZl9IXlpN3ScMejvoU
	a3mNPrvMiu8bNJQgoU2seJSKigRqujEP9sTpeTFbfhd/NcW2MXilRosIkuZvQp9M5JkrNTZb2G8
	Sh6zfXtRoUaIJ2arxpa9a75w2CinSKD3fHf9IpPWqvgZkHavfaUYT+d5kH2hqZzVzEOYAxv23F9
	IOLNNCkNV3+ltrZ4LsBJnVQ==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3390575585a.6.1792051735995;
        Thu, 15 Oct 2026 01:08:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3390562685a.6.1792051733632;
        Thu, 15 Oct 2026 01:08:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm93441866b.23.2026.10.15.01.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:08:52 -0700 (PDT)
Message-ID: <47797de1-b50d-4b4f-989c-00ac2427d40a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
 <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
 <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMiBTYWx0ZWRfX0YTGFQcJ3taD
 B2SGJYBy+YJvOa9TXl4q/phN+dykXqFxT5xaztPSaJ074DlUov2fW6wLaTvjmqgF/a/xiDsMJKD
 0w0FT6Ne7kNrEzq/6C82aoGtJdghqZcGGVIb8KAihyqscrbE1iARzi3v5b5Eh5SrsWdyg4u0rnK
 Ybdop4FrqVr61QQV4IzrgmdXYQxuwGSdVZHL2Bzt/2UAxI8tQT197+OVwXgYw6NtBMRkVC5UASn
 olSITPTTSJjyTgZn3ahbz1rre8AHsIPwoAF/DIw7HNNCVz6AScdL+BPZmQQSSxk4jqToMi5Rcr7
 XYeDpbE4Jp0ZkxXG//SYUugEAloM8DB7NMct6jgV6w5mm2/tOmGF+ljJdpV7eF3QWpZ35M+PCr2
 UCs1uKLUJpm3w7Ce8TyTfABDzQrfbZZRK47pcqGOy9I6fYO6jFb/EsbAJ1FxzrzI2dkjwAMyjBn
 1VEb+jP1Q9qL6CJePtQ==
X-Proofpoint-GUID: 2WUHZ8ShDktwAQ3Kaqqopy5fP1NUOHg_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMiBTYWx0ZWRfX8OYNnbL324Xx
 EC7aYXr9eklM5U6wIGhJBRz1Kk7hldiJ+rsHFPBjb1jmjlFwxxgRB15gE8IBw39k4gShxgfRNKc
 EE0uM38A7X9a1PhpNZx62iYKxGZKPxA=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad08a18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tlWqZDqU6_vpIpeepkAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 2WUHZ8ShDktwAQ3Kaqqopy5fP1NUOHg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150032

On 10/14/26 7:31 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 06:45:46PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
>>>> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

>> Right, but the meaningful difference here is that the consumers
>> only know they need a certain frequency. The required power votes
>> from that don't stem from the consumer's requirements. They stem
>> from the clock controller's inner workings that are necessary to
>> fulfill the consumer's demand.
> 
> Doesn't Iris core also have "we need this power to work on this
> frequency" kind of requirements? My assumption has always been that
> those are just folded into the clock requrements.

My understanding is that is just an effect of the requirements of
the clock controller.


>>>> The Qualcomm case is easy - RPMH is *always* reachable, so the
>>>> pmdomain provider needs no clocks itself. For the other cases,
>>>> "patches welcome".
>>>
>>> Ok. There is a promise that I2C PMICs will never ever be involved in the
>>> clock / power tables.
>>
>> Or at least that someone who needs them will contribute a
>> solution to this problem.
> 
> I meant actual I2C PMICs, like PM8008.

Yes, I know


>>>>>> +static unsigned int
>>>>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
>>>>>> +{
>>>>>> +	struct qcom_clk_dvfs_vote *vote;
>>>>>> +	unsigned int level = 0;
>>>>>> +
>>>>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
>>>>>> +		level = max(level, vote->level);
>>>>>> +
>>>>>> +	return max(level, rail_voter->safety_floor_level);
>>>>>
>>>>> I guess you want to avoid having too many voters, but would it be
>>>>> possible to have one voter per 'signficant' clock and let GenPD itself
>>>>> aggregate all the votes?
>>>>
>>>> What does "significant" mean here?
>>>
>>> I'd define it as "using a different power domain or requiring a
>>> different corner".
>>
>> I still don't get it
> 
> When the consumer votes for a frequency A / domain BX / level cc, usually
> the parent clock (at the corresponding frquency nA) also has domain BX
> and level cc. Sometimes (like in the case of PLLs) it's not the case.
> The domain might change or the level might change. In those cases that
> clock must have an explicit voting (I'd still prefer OPP).

I think what you believe is the PLL case is actually more common - the
branch, its RCG, the PLL upstream and anything inbetween may have a
different list of [(rail, freq, level)] settings (I say list
specifically because e.g. the branch may need CX, the RCG may need
MXC+MMCX and the PLL above may need CX+MXA at various levels.

Konrad
