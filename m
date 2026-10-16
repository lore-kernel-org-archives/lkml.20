Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0537245D5F6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141587; cv=none; b=egMWAGGJp1q0TLRAiMFPEnwGNyPS1aV87Uearr1Brp0D3T3armTALsbMziIND47gNVVJCjE3cZXi8fq+tSemI8vvo0tTtNK7pCiPIt/SymoxiE2wVrRSvdN1DrzQLMXfO9ca1SfoCos6D649CqTRp1Ofsn84UvGqamS8kEskkus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141587; c=relaxed/simple;
	bh=LEjiLApMQqTHDDtk9CHKJXxbNV7MEotxA1g5DsDCPLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPZR7NoDLiW9K/jsltoQP1y5bX2sRE77HfmFA9qqzROx7irq8411281RXDXIzxpR0NGSpdNyhPyFSFoQAv8Co35hSwprLcAyMRVyzOVTfoD4DhJNzHZj6sza2Ms+xVJVtNEL3GzyFgftV+SzgqQnuwUtSXaeV4N6llDp7PJkpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC2HB+hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqO6HD8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC2HB+hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqO6HD8C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lvR31611516
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MiRPL2ULAV5NkriOUKUnMN3bqwjMHXjIke9axrwz75I=; b=cC2HB+hALCM8sxdt
	RXlFasSkFUqTXT8xluv1dXjSH1LHhiGvCQzZ1Gp9W7cKmuG28jiU77b5LvB6IM0n
	yOfgoztJbOwJQ6oAfOcEhrDaGXMn6MBfbmbhi+d7OxcblTRWhVsMbWYnDh4PemIj
	ztC+csKZtcxniNpqVIYyC0OEpEDKNAvNOTclXi/fwvL2YT6wrb4gQwAEwsqjw1U/
	FXVzF4Bp/YOAnJEdMdJi4mP0t5+q78STQCLTmR/kxLmbnE8dfxkMg+Wl46imYQLJ
	oFg2vk7veheO7PboBWCPrmBdJ2zQLSQIacotPBjFl58XaeAx9sabSISENXC/e2Yu
	3WQRnw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sety6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:06:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917aacb7abcso15993056d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141584; x=1792746384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiRPL2ULAV5NkriOUKUnMN3bqwjMHXjIke9axrwz75I=;
        b=HqO6HD8C9FO/YHTIq33bQPSLqlWpe0bXbw0agPHsGcHpTNZOldFh+gqmWvht9P6XSs
         SuDbkrmYzXScZk7TKY6PYA7/Rgx50xjSIOcwaiyyveSUNJSOZYPApY5VRp54Q24L9aye
         scAsndDxo/zNu4QEvLOdg/FiuT26IEhSqV/pPNQQEj/z2efdcGAnwi9WMBtL4gnTNfps
         PIEmOpDX86SV6dyGKUu3o8zd/JGkufHKO6+/Z/5j06wi9CeGtSEW1up1uvlQo7SPGhC1
         F+jqP1W1L/PU0I/waLiwkfljyCa+2ilURw7KS2bfGq8fQjxOPl9ySFVFYxkMz4i2uDUX
         ZIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141584; x=1792746384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MiRPL2ULAV5NkriOUKUnMN3bqwjMHXjIke9axrwz75I=;
        b=ACxoOtTp+JNLTIFbsr1c8aYusAeYOePZ2hc3//Rf4vVxCYZz8Au3pqcxA9Xi63vKF8
         R/tIMseCKqBlhSE1S7PpNvsMWA2TAB9Hx7kAAV7XEGQVSXnxewv1dE9ROAMHuagqSEz9
         DiA1lirYC8S/jTsht2QUb4d5/vzLwxGGYsoOX5iNpOkYC1j8yPoRvnqIj6YYkCjWZf3r
         9FEqoYRhoDtFD/WtrkziWvDF/W52j6g0JtuvGklRvp3Ead/mVYjxTsgDtUslY/3cWRuw
         HxAfdCVQxZAx82P+w2Y1iKU8kCu8SmawHQN2lk+ZnGiKovmhqUO7KloSRmodHU7LQW3X
         w0Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwLo1pCqPfuqNFxjgNcpBAMjRHsvBHZCpC0weReUiOp9BsLTNbXHJojo3B/5oX11EfVIofy/Vf1Bq6a7Ho=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJOXZKJupGzzPCSBnioLORw3JunqsRcyHRdHaPlpzxGAHKse20
	dXSexuFswgplNjd+EoWdNRlw8h/CnlQAQRLlPmUwKmVsRY1K3mmLezKKYd/pNax4VSveXTIFtOJ
	xa22SvaFrGSXruLB5EpGv6U7iWHp7qdEBAG3Zcyx2tWo2u49zdiKBtca+x77835WSNqQ=
X-Gm-Gg: AYBFou3jR0lu5w5fgAMlQtKaHyreRELYwkLpu0BM26RvOM7gEgiNsuPXXhQz46LVWaK
	Fb4QuzCP1i9HlOD6T2yOzeR9lO0vFVNRbHkgzJsRUk45u6OlgQxTzZxJSZfmQpvfO9K5WVcR3ta
	jE4zbsrmIazvxik9qPtF0BqADo2W8ZuQHxA5KsxEolalW1r3mV184S652m+ghCnr2OzSCX9GSDS
	vitCsiwaiYCeP8AhLeS6399Cnck+mP3kppggMQnoZfYxely9YfYkWFjkIweP8dhUZibPgvMzOmd
	i3+ww5uJiCFu+kBca/hcCfnkX0Xch/7JRtnkJ0QBxWpIM0YRQ6NyhzA78Y3WWIq40mPF7bco4xY
	56fVQ/iOw7P1B7hI5yTcOqw==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr3711720685a.0.1792141584221;
        Fri, 16 Oct 2026 02:06:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr3711717485a.0.1792141583729;
        Fri, 16 Oct 2026 02:06:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm52320466b.35.2026.10.16.02.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:06:22 -0700 (PDT)
Message-ID: <d6c92920-6258-4740-a151-e6512ee8c610@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:06:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from
 UBI0 NoC branches
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002121920.994608-1-me@andrei-z.com>
 <20261002121920.994608-3-me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002121920.994608-3-me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: apB5SE1YhZK1HAt5dOYrQC9Ilze6dOn6
X-Proofpoint-GUID: apB5SE1YhZK1HAt5dOYrQC9Ilze6dOn6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX1KY4IJKetbJv
 o6SLhj8U646EzX9s2x4mURpt8GoeggPTi+6gdVuKBXErNgOOLCzX4NOvoL8N1kx563HsR6zB+s9
 XXt2R7ErMym8lXbumUULWBkd9xfbSjQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXwWxmSatIMb7X
 DZLswQAxcrn02STl3xEi/kyRtIFJLY+wXrQ4Ni7a/nMVQsll4G/AW4pXNxLl/+u4tPOyHhM8TDQ
 owOwr7zSk3idiIFQ1EHsXsNwH+By2PNlMg7B2an9T35azC5yfLxoOrXF5MRuciTB0zJpKKsm93E
 uxQc9bpdR7afyJ3epHLacgcfhR7fIpptjCSqxAMgoGSlSswpEz7vveuCzl7tIJGkbObLw+DrBRk
 hUb3+ua69B2Xc9QFpS+k4Yc/FaViEJ4EJXP7LprR9wFmUXz25mkD/QhCE+fk3WQmUKK5MddUcv3
 ULbhPO/Cn1kv6vF3gnZOcWyXQ14vOw3U/7v7R87h5JvTj4/yBaJoRpUuLZ2EfVznBE9YLvDgyUx
 gXIfr6mrTlYBI1QEHTrAhn1hleLIzD9xaWK68fLg3SrULsuT66uKyXd1YgpedzpZ5BRisLVRAmy
 R7N/iLo/iPF6mjuA7tQ==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1e910 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=KYwysSycBQfcZMiHb78A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/2/26 2:19 PM, Andrei-Alexandru Bleortu wrote:
> gcc_ubi0_cfg_clk is a child of pcnoc_clk_src, and gcc_ubi0_utcm_clk and
> gcc_ubi0_nc_axi_clk are children of system_noc_clk_src. All three have
> CLK_SET_RATE_PARENT, so a rate request on one of these leaf gates
> reprograms the live NoC clock sources that every other peripheral on
> the bus runs from.
> 
> Each NoC has a single rate anyway, so drop the flag and let these gates
> follow the bus instead of setting it.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
