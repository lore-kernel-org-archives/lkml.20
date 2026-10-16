Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377E456DEF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141436; cv=none; b=o4/jLZqKeJLDxYeHxVXh6366S5ikleeEhvp0f26nnWCrSPTm2YODk1KbUxY4uRS51y4QY7J6TnaZ5xVGYyhiOgEJ5OXWa8UNFPfnvVjDQ7IGaXGfli/Tirmuy+hccgWln5TAllxM7XUqOklWhqkpavPfq7l82V0fnZfuY2y7TK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141436; c=relaxed/simple;
	bh=RA/3AdwxcJOu5RTjRAAO+2c4HRixWYGDaWsAdaQGN2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRn1hEvqe/NMdcUc3WEZ86pfkz9BXU8HZn8wqZNBK7dB1fN9b6NUcoW1luZjm0c00qtyKUtc7E4Sb8DDm2cEihVjOLh4XT+Zv2HAc+eiCWF4tSED4bVkA5Wpcl+HWbWVoouDMG/WlIbykAanhCPzw5zU9H+TnA+kkpzeWSoRJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeXcz5qn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlcBR9Vn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeXcz5qn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlcBR9Vn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lq2q2313182
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpFwNiJHRmYDM5aNeWpbEdOd4xda8tZFmeBFHKELgqI=; b=WeXcz5qnlo2eFrba
	pPcVHRVB30iAochrNpnsvUWMMRlgTm4hNfcmxjBpTCyN3SPomXZAvt325+834exu
	ScgsEuTt08fklCif7sZDUyGY3X1mT7I1NM6smE/tfsaCgoUU6MYYK1J8kNkJKZ+f
	qhDkBeBpDsi2b75/aP+2l5fFpKMM1ERucPBuzxP1pkwcYj8kEr2VhcCgGyhy2n7Z
	/5bvkzPnSQPH8Lp4oFU4dzLpDae8sWRp8+g/Cq66FEal7rpQqY9W7WbMcYN0ZHzw
	AmifXbUGJpZCqCfAe/nfQvZkwV0SKnQxPLlttZ3Ukl6WbXV8iJUfCAvMsKqhTX77
	PMSErg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2xqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso73853185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141433; x=1792746233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpFwNiJHRmYDM5aNeWpbEdOd4xda8tZFmeBFHKELgqI=;
        b=RlcBR9VnrHDjNzfrY8pUd/k+fX7R1PYhG7H8EUY1p/qXx+ph+P/BfuIXvDo3F67FJd
         rj79kRI4iMWeFsnrRGg5nZWTVgQFAfP3ZfcO7q84eb4MFrXN4d1hbBYZMYvxjDKpL5hO
         ZTx3r0Sb/gsjoXITv7eOtxrPrmTICKMj0cMa/gFWX85aBlytxDV4KO8Em4V0z4YqtpYy
         V4IjfX8GpGqnVlGRskttMGnViiHYhZqGaosewfTGHX7SihFHQW6fQ/YUioZWJKW31OdK
         h///3E4FRx/e4i4e5OnFddTZR/UdqO7TXWSPTGkL/zfLJpP7SSWZzo13cvv02LzmdJDq
         gB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141433; x=1792746233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpFwNiJHRmYDM5aNeWpbEdOd4xda8tZFmeBFHKELgqI=;
        b=xX0KpcAH7Wmulv1LpaVDt6QWG3KL1u2lio+Nm3yxMG77c+2er2mimc/LmWypN8otN5
         Sd/6p2TPZII4nQW9G6W+sN0e9DGeRnFHq1My27nIbYQXXrtcG1zD0L4wah5w+LrZt69Q
         D9F4hzZ5Tuep9hNanQ0Ujl4en7+4UiaHgIy2qtgNTVWn3i0UHTosPuPo3KJgWJ0Ev8fK
         cAapN9VHYU0ipT4FQETY3IohtURilobdAothzqEJC5U9ZeapeEgfwvj1p7kQ1Wy2Xuwa
         qFJrv8biw94zuDL/nOv/hPP5Ti8t22MVcY1aG8K839lFiXdYx2ncn74RbEmwfDtyCL6F
         s/9w==
X-Forwarded-Encrypted: i=1; AKwUvBwZlwgQBANK84BHNko1kQeYnxNxAez0XNHI5rxdt5kZuzXmcYd1jb7VyAFTPh9FnLTQYOfGMfLO8ZTpLRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlYNQzkF04DcR+/zFFbvwMzrj7TsSN+C8wUf8ye6fyNIvC2M/T
	g0GkIP31sCZySqiFpKdNPjZ3Er6pO1G8ItSwXWnMOAuTH9iOtuzpOd6iIg0ynpDNVZPFQTTyyKJ
	QPDSWRjYhg5rcPH5a0syGG7oCf0+oZT1i61bVjDlS3yAlB1cVHj4LGYiTlOviXLPj5xM=
X-Gm-Gg: AYBFou1vPVFi7xUEzpX9tG3DpDDJ8O+/lHHX1DWIYf2JSm1xtFNB1X4sprXBKxiUjbO
	8UL18Nl1AgYyvfp6sUfJKJzkoOv+bUExBwldMh0REsikyJH//mhC2VvL1A+3vmE4OQOu577Z8Cn
	5Md05PZtfysCTKUBTOYAK25WAiNU2BdLolPI3OWR9Z3eq6BMGJyi9wXunnjuopnK7AxzrZufAfZ
	2KsU7y+z4KBCQVOLMZjEBZZ+AEesgMWddECyLC8rVg28DrT6o2/Ac6GX5Mlm+WAV2/lPUyiDrDd
	sd85I08/un2MCykgqFZYHtnbLdgDYxuLlb1/xEhuLkM2nRz+LL/SA6u6puQ4EInOb7W69VHoZNJ
	GtlFy0tje4AqqQQ4XH3Xtzg==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3845639885a.6.1792141432978;
        Fri, 16 Oct 2026 02:03:52 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3845634485a.6.1792141432515;
        Fri, 16 Oct 2026 02:03:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a0bd8eesm692473a12.0.2026.10.16.02.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:03:50 -0700 (PDT)
Message-ID: <939e324c-846a-487a-8fcd-5236898fe9a9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from
 ubi0_axi_clk_src
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002121920.994608-1-me@andrei-z.com>
 <20261002121920.994608-2-me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002121920.994608-2-me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX3u9//0nERiAx
 gbpmTwvEtC/MTvq7ga1ME/geX/PuugDBZAiC1cAtDsl3nS4FHqS2T6d/56UTQHaUFQLYJ0YNviJ
 cds7Mt8nHRnJCf/xTCK2cVD/WkU9cZs=
X-Proofpoint-ORIG-GUID: RKiqBqgyTFrZ4kbSYWMCxgS8fk9ts1Gx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX1eqsxnRD+Slq
 kHFqNytxFLXU8Qqe14Zr7p/jIhy8QD2FqPkEAw1lmt916KnmKV6D+eNYfg/dQNLyxL87N2+ULwg
 LAQx9Ab1MGx30Pr+BO0SaQtzPgXDjzxjH/+Pij6VGpE+YfWz7xdPSHT44SWJoybZjflr5wIDQ1l
 NLu3ysBrIvL4KwPzVX8fh6INL3f/LseAot+KTuqbe002W/3SkJzzlXPRt1N4Qe8IkE3J0Glq6yW
 RrAG+3y41AyqWzKO8ScpwoDV0C7yR9x8LbRcLUv1M3/4oFRb+YdfKwJu9VSd6ibi2RVri3qubC0
 bnYXchsVnV/CKnNu74OC1WCTu3mYAipH6J6lkjZW2uwc58E2Kok9Y5DiKD72dzr6ahJ6ELtfYrC
 mvi+YRZryQ3NG2tBKZC6QPLn77WodsWo5poRVZT1QgQXRKrjT94ZAfuCtUjy5UUA9SW6/pJk5la
 WLNLglMFpG8rA/ru8VQ==
X-Proofpoint-GUID: RKiqBqgyTFrZ4kbSYWMCxgS8fk9ts1Gx
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1e879 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=t9TsTAkN07mTYsVvT6IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/2/26 2:19 PM, Andrei-Alexandru Bleortu wrote:
> ubi0_axi_clk_src has CLK_SET_RATE_PARENT, but its parents are XO and
> the read-only GPLL0 and GPLL2 post-dividers, so propagating a rate
> request can never change their rate.
> 
> It does make the clock core treat any rounding gap as a GPLL0 rate
> change. Requesting 400 MHz (GPLL0 / 2) while GPLL0 reads back as
> 799999998 Hz makes GPLL0 the top of the change, and clk_change_rate()
> then re-runs set_rate on every GPLL0 consumer. That includes the live
> NoC clocks and sdcc1_apps_clk_src, which is gated at that moment and
> fails with "rcg didn't update its configuration", leaving the eMMC
> controller and the board hung.
> 
> Drop the flag so that a rate request on ubi0_axi_clk_src stays local to
> it. gcc_ubi0_axi_clk keeps its flag and still forwards requests to this
> clock.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
