Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD213F7A9B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357892; cv=none; b=f+K5/Wv/pW1N9n7YRWSrBm5N4J3Pyx83Zz5xOhec6murvcSqbpQjGLU4FFo12fo0W7rqjjWn7qCpAvPICOVrYo4v/JlDXRLdqkuy1Z51WfF2SwsUcClVIdQp3AtN4846sVmuuOCKfmiBwLoCmKZ5dlWaxng0cgKBiiBDPUUWtCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357892; c=relaxed/simple;
	bh=UxZ50NqwJpLV70DqujYJ8OxnuapLGbpMQOZeIC/fP8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCy3siZ1pqKDoLxoXlX4Zr8R3W6QQhAf3njo736Wpi6TRoeyH0yY/LDTup6gZsuQaQNoP4SqGEritUy8+PAFN/fIPUIFJ53nRA9fkElrKXqgoozWdrlndM+rYkVpadWgIGDFzaXARBCn2PwyVCkpqc98R/P4WwTVDweCHyN7ovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWfS0D0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHmoqFl1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWfS0D0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHmoqFl1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U8ev2063023
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=; b=NWfS0D0eVGD8Ok+a
	ItVMICbFmN4Pa8s0NHvUUl+KV7E4pFyLF8xMcW5GyJuzewPKBPrg34y/X9dB4Vox
	6LjMoR1/CZxdK7XNeIJ/Q9wyIfLfqkDQ4BzVfJElSE441HhIhQfEq5/AT8FBFKe1
	VkUrztA0mujGiZ7CW2EipTQtypQ2sIWyt9rye4od28rD43d4pkC/BszGocZtyXGN
	z9o3QKZgX71bCK5MfynKya07QL366faaCEVHSAdm5O0xJeKj2IAw3w+LtvdKHGZO
	M+Te//uEWi7n6ScQO74BAKIP7G6gHPiMdXCLWMWD9UXvR9Vqhr8vd/Je8FUZysMs
	g7wpLg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u128p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:24:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so3083596a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791357890; x=1791962690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=;
        b=kHmoqFl1Y9L6LZ6OIEjFEBYZIwR9Mbltu8Y5HDRPL/D2d764grsemgb1WBnZTrXwmh
         u1Nht6XPkvmQ7L1XVdV/CatpwzNZsFni4CJy7P+5HQPpy2Mf/rjMzgbo3zpOmEdduBRF
         zLRK7ewYUZU9QmUMOOQUdLLdHINGYtjkWkPgYSvznYKIbYzRryufOQxEXjEXFDdztuqC
         E12fWD75/ap8ZxQI5TkQQaBR8BBL0Y7WCHsiUpSnk3nxXLpp20cTDE8iQBEzk8T/mweW
         o7K9/YrfqiDGwAEOPWIOGzN/m0VEdKIVhBaKnQeAtc9oEHVs0QgK4khdnKyvIvczjURV
         67jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791357890; x=1791962690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVpUwU22uEKD7W4M4o2CONa/iooL55EIQZsHgPp6kK0=;
        b=irDwzqQwmwt950BuFZ1IC3tiViwLF44Yf2r2rWaoAZ5nuABp40dpQAEVzKlVsTTld1
         KYjUnmY8MJruIhHveOlGMJ1iemSbY4SyVBsrQ/uw8rgQzgFTBMhYf5HKu4++qamauUpY
         cObfvj981c5g9kS2eXKxMX0vbHSxnns1EpZ8SyPfOJ8VmnXnx4JvxfKGPawhHNPkazwB
         P6URGexUyurGXuWzNlM1+6vpAQPe+z1pEWJsOp4ASVCygxRsNa5lwaEdiT9+3L5IGxXT
         6LpnBTziwQKvK7m6cv6fW+xbK83KNBeQgPa3z1AbFSmWm5dZuqhWMYWjEAaPaqlrR+JR
         V6yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq/3eMDo4+i7vTpwS91YrEZlOp1/VL5/NVDQln927oA7UlaabZb2jjsKzhxzfiaCyew4BViCaBTR/2Yso=@vger.kernel.org
X-Gm-Message-State: AFuF++mJEOp4gXyd2TiroPuhcqzA6QWp0/cN0rjoWsCVsazK1Foi04hx
	1NtJzyrd659GYn9BSHq9MxX7VvnyWEglCJ2vQEkJmjie5WDEg6cldgnFDvDw4Een2ISSZrBM+Ho
	RvbqP5zWlw3ke+K8jsyRfIOhshoQl6atH2NggfO+oBJC5x4w88Y4Fq4Emh7c8iq1KOKo=
X-Gm-Gg: AYBFou0ZCJKNFma0SFR0YXDZhaEAv8X5Pdwt7pQbUUY9XvtvnDfBvQ71jiPw5KuMecb
	HHnK0azIhaCvtpPkYKGNqTpn716Xb3PmebRXKF0LHwbC43sFbNEBz6dRva9GGLQKQcX6l7y1R9A
	wN9kvT2dqIW21qQHCxIMieUEgxxIoDw8UZVn3/9khxcf+jS7E8Giqm8OyglDZ1e26APhrwMhLLp
	N+9pEwiAOUq4wvzlrEoVdEr5MW5zpYi9+ZW0vD8K8ujkNicEZ4SceQhDaHo1eJ9TM/AVmTNxABC
	TQ1N6gQbSdTn68BrLNMUG6unFBh+E3kkMHvu5591vY8wEVl+B3rr2Gl5M4ZPeQxvIDMKDvWV6V5
	2hGr9J1gQzzLedg8IUd1mjccwSCCpfVhmUg==
X-Received: by 2002:a05:6a20:918b:b0:3dd:85a8:4c56 with SMTP id adf61e73a8af0-3e134051f3amr990998637.29.1791357889581;
        Wed, 07 Oct 2026 00:24:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3dd:85a8:4c56 with SMTP id adf61e73a8af0-3e134051f3amr990973637.29.1791357889108;
        Wed, 07 Oct 2026 00:24:49 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d6d7sm954172b3a.12.2026.10.07.00.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:24:48 -0700 (PDT)
Message-ID: <0f113c6e-b868-4540-9f57-75b3530181f1@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:54:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-2-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-2-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX6dg1uSKppAnO
 mOQW6IuNDAsZTJR6AQi/AHGTqDuRUWR1ohC9heBpJTq9DkyyNBEKplnLm3Mts/YQsVvkLpZYZk4
 wtbKFvJQrS8GGbfgR65ZGxdodajU1BM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX1qNSJIZ/8dnx
 wsLUAH2KpmkJpZj7xGWV/y/YmAICNWV51OQ2PStH8zsTZ512EGrcE6dSFbO1cC+F3Mk8rHju1wG
 iH3ZivjgGB2+wcCI//5QFs7dvbJdD3ZNc0DZ1Vzgvem3g1o+Q23JfFYax/iNWh0XQsq2xanz4yR
 pGD1NZJgGhS8QGSk16nJ0bEfSjP6jpdiofxhQR6kipQ9Buc1+0gIgZCD4jHHOcYK4qpReIPGg4L
 dP5mp7yt4BGHcDW1K+1xv4aF4tRBn+8mqYu/cKjaVzkrbIvCxJE8zyS+Whk1zIDdLAAzF/rSEsc
 9leCqSvSB03BeKOmMMKLCPS11m7TJlfrlrQg/D/pBAuz/wGicqJJh1YjjYML3oFH+rGAcHjIJ32
 87suJMXnD9brOfEkqD2k9VaHA8byQF0EOVUqWF7Kb57IM6wP3TAunsmBRgNv+e4/giaLcMTQUIB
 bwY2KqVpYY9XMgmW7vg==
X-Proofpoint-ORIG-GUID: 2Pbs989TcBc92LH_OLQ9gNnBoW8O4Ztl
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac5f3c2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Kq5vhQSCjsUw4Kr_5AcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 2Pbs989TcBc92LH_OLQ9gNnBoW8O4Ztl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028



On 8/27/2026 11:29 PM, Praveen Talari wrote:

[...]

> @@ -1175,6 +1181,31 @@ int geni_se_domain_attach(struct geni_se *se)
>   	else if (ret < 0)
>   		return ret;
>   
> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
> +	if (num_opps < 0)
> +		return num_opps;
> +	if (num_opps == 0)
> +		return -ENODEV;
> +
Let's combine both in a line.
if (num_opps <= 0)
	return num_opps ? num_opps: -ENODEV;


> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
> +					sizeof(*se->clk_perf_tbl),
> +					GFP_KERNEL);
> +	if (!se->clk_perf_tbl)
> +		return -ENOMEM;
> +
Non functional to Simplify, keep level = 0 outside and increment level 
within loop> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> +		opp = dev_pm_opp_find_level_ceil(perf_dev, &level);
> +		if (IS_ERR(opp))
> +			return PTR_ERR(opp);
> +
> +		se->clk_perf_tbl[i] = level;
> +		dev_pm_opp_put(opp);
> +	}
> +	se->num_clk_levels = num_opps;
> +	se->has_opp = true;
> +
level++;>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(geni_se_domain_attach);
> 

