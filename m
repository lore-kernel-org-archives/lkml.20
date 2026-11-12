Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488106;
	b=boQ9RluyJQkAyFm9MTH2hI3pgqrl2iQ7qO37GH82WGHxJx0HLvgrHUZnS6hFROK6OWso
	 vBp1YFd5iKA1IanDUeMEaQR4ayENfzsEtbflhcxdGxQabFzRgsOejOFqobwbeAWvMq1Je
	 DU7zy/TJp79Mcljk0obgKojISLCAapqKrYKNiDqod+HnfZJ9eS64NA4WhYGmjG78A4VDU
	 Xa2lB1UilcfuRmloZZgrc+CLaV8cmK+pyOqa8x+xHUquJGlrGyvHHnM17dgdAiFQzuE5y
	 9UMkvcB6P5nT793uzznG2RrAQVm3kPMKV4ql42CUVjrr944ru3lEp2vZz1p0f6WSpuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
	b=a1jOAXf71vrzcVsqZl48oT7CqJ6LBls437vMdVUKBpnUKym/9BYs+HOuFSQ3P5HVG+s3
	 UJxDZaNkt6uafPRVgI+3Kh3aabeY7my99D87Yk5tWFbKyhuQsbCDzocou113OhFJu5dS4
	 m0w5rfVJr/VJ7GS/rULgZi/dYNDXuXYzUqKlfftOhFfOv7gLGIWQhcL84KxrWCQY2eVgf
	 dcum3/sd3RudN57g+NhUVH/I/mOen5va+qza6ghH2BG5ZSAimhJdNVhedaGq2wNnbk5Nk
	 +oizEHxOWSMa+pXf1obtokKAndEFxrU1f99VFlksZZUIrCW0eJYgWLr5EA39GitLaNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mpz5ENUg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ATRO1fxp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB76606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB76606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mpz5ENUg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ATRO1fxp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfJ5r1953697
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=; b=Mpz5ENUgcqRabHUP
	PD3J3yeBOVQuO3lto59EUpQ+arQ2gq2AwvPOsTfYA95ODC3Rd2VWtXnNMSumVmxn
	IX7m2D4pTpCsNVLNR6W+VCpIfjV5z02Ym5UXkWfYDRbj0W3lmSde+LMcM/Y03e3J
	pT3c5m/VovkQTPynUrjPx12qtGwROyoAbSXISgQC62QVKXPDyK95qTCf2JLdji07
	G6XQGZWPa+cs0PVEDzxhTuHVELhXyASTkjc036K/YUv4UBbKkRAsWHD02P9D1rCY
	7OgLvVZe12vQOHcS6cQaLqmZ/VomqPit472dY/vnqmfJ4jE9DbqRmpCw+0V28/XS
	XdG5Eg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30e9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:55:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so2507680a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794488104; x=1795092904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
        b=ATRO1fxpOaqjoB3TBeRQ2Iq9xgkvwpqdGjYnJh1DFozvHl1ptPVKUSJBMtFO3azSSV
         wRx1imsYOTRFk5L2lQJsu8A3TDjmu4v6P1S6/k7nMB/zXZ8GPWXrLg8BTbzKk3ygHsiU
         6fndKA4mHPSqf0FvxRCg3J+ADRMa2VDJTS8GvK6WdvNEdJB0Ddz+n/A3u+yj4Lz+AfNT
         KwYc8v2ViX5dRWxUO2ltvRMIWyini6HkH9fclVPDGzRjdHp0VBLLnGGW+ZW8RrENPUe4
         DsO3cbXKfmMaFAsF6a16tc2KUv8DddAVKyZK6THjZnsnMeMfaY60o4oPgC1hUTPPxyUS
         zrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488104; x=1795092904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
        b=jIQiUeR8s5vxhcPFWu9+7MTASC3mR+mj/ndXvAjBkaC4Rwt6G534PT7AHJf7luKuYy
         hyOf66Z2rK7FvdYdJu3B2LwQmFTH59nIXYmHDpuJRt9Rju5xYh7Hi2lIwygQJOY49ExO
         L+XOv9YnvAu5CzoSF3o9vTHjt1Tq4puUOh8fjXi0zD9JzEoFwEaKfGaBxaHS7HXSTJXN
         6ZG8gUndAF6bT8o4d/78Lt936CyzdSXrFNCW1rf4HnMZmDm/hp08l4EVDhG+UR1Di9r2
         mHBnD2dVzxTSYlJ3ffaLLfAT+945j5SMwEQnW+uBS+RO6MioMN9xlvKXuWSp8gMYMUDV
         OtvQ==
X-Forwarded-Encrypted: i=1; AL+hErGj8LbuUa29+fxHbVXZewz8Zut5tI36tANFg87RPn5QmRuvJh8d63/Zpd1o8aC8zsVWo6Fjt6XhU811k1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/25rv/V3VxYVrezU5EqLTI/WBmcDKkH0M8j5nqGaV2qovz7WAe
	pyfOyRl5MKu+7QNYv3e9icvn8EH/t/NOvmBBb2tQmOJxi4yWegNxz97cnEBKZRYpJQ+vnsjaEsD
	nEcMtoL0zYoXOAYbxgITFyoo0QeEgxciUcRSSV+cwsgEAHvJlJofL2lTmYQpO/2/e8VY=
X-Gm-Gg: AYBFou0sVP8b/wxPKwKcqDhm3qIeCEn4nuiqOtGdUYRoj3W57GDKRQBJjD4wtURUNn8
	aJS668t3/BH4mYqcwaqKkuHiarCPyaPuxrvsUxWwWTtqfc57kjorjTBZI3zZFLSc1e8sJDgUIKX
	Qqbq3P/OjmKWpN13Br5o81JC1CcSHVbfAchWJDYlxE8U5EuP1TQ81Vcy0KwjukeL+K5X0mPMIvW
	9RhRRnoAmqAVdD68Hkq6GQWNfodY75aVlPl9/2sbKosbGi/U9RK6ag7funC1t7jC+HjtxFjDioc
	LbBJeT6z5UQyWfvQbnydRR5qAPs6xamyyXtsbIDhnM0yYYLkMU8m5t1CMglvcpMa222pcS6+0Mp
	Z/Cx5uaRBW7N17nwzvtqHcDTZGL9v23jAhL2xxUt2HELFJdK9h0miGoMGtr7PoemZZQDddvFdQd
	malCoFuAPzNpk3B75sa5ac1KqlDrsyVkKW3F8g6lysS773
X-Received: by 2002:a05:6a20:ef01:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f2ff7caf1cmr4970705637.61.1794488104067;
        Thu, 12 Nov 2026 04:55:04 -0800 (PST)
X-Received: by 2002:a05:6a20:ef01:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f2ff7caf1cmr4970682637.61.1794488103530;
        Thu, 12 Nov 2026 04:55:03 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa9631absm3493088b3a.28.2026.11.12.04.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:55:03 -0800 (PST)
Message-ID: <755d7440-28f1-4c9d-bcef-33beb25c71bf@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 20:54:57 +0800
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
Subject: Re: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage
 constraints
To: Natanael Copa <ncopa@alpinelinux.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Milan_P_=2E_Stani=C4=87?= <mps@arvanta.net>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell
 <troy.mitchell@linux.spacemit.com>,
        Shuwei Wu <shuwei.wu@mailbox.org>,
        Aurelien Jarno <aurelien@aurel32.net>, spacemit@lists.linux.dev,
        linux-riscv@lists.infradead.org, stable@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261111130430.10359-1-ncopa@alpinelinux.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261111130430.10359-1-ncopa@alpinelinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5b728 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=kmYkUENqAAAA:8 a=VwQbUJbxAAAA:8 a=OUwkjY6KL-vEgWlMa8UA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=p9kz6gysRiz6SGr9lVkz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXxS8MfR4MEhqT
 SR442Cu2MVXeXd1a63Yi4W70/AnepuMhnjA27VUZSo3I/sj2IhpS3ZDPMe115uuLVu7Qg3wiNK+
 tsZrTB10LfGqiIfiA77YVR6XSDBUd4YImkIJZSA2B5+nyeHY+5UQ0ibDifT6oaIE18/qvbo+vLw
 Pq+e/eBY1q0lX0zjYABhYdzUztelrqTd3iuS/2u3XxrOvlxlihuja6jYioDqNSuA4mtFpgK80Da
 hpkI0pIUmSqaAEkfAwGQk+lanxAodwqpHUjAmqviEV36gdp0o7TfrXOxKVEelHjrW9SzyI343Wo
 WQxCho7TO4oZOcsn6r6xX/5fX1Q9qGB4jW6fOpF3Nxg2T25xegTQF3EORD2vh1K8ZFIfh1EjNVM
 OYARtLeIM3ujXOHYz0k62qRcMtrWFltB+LnfiF/TYKyq1T6U3iPVp++hmj8VZT0SiI3dpglfQku
 zUjPEvraQ9UbbRiLdRQ==
X-Proofpoint-ORIG-GUID: 1htXdMUX23497UyaCG_lv8TxUjso41iO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX/ljX5fIxYjK9
 Q+iDsssM9w/9cT4GtA6hbW8Cpa72XBhRcck7L/YLfkQgruGpJkU8lOMLyg5sLni3XjuDy57srVU
 p3P6JRTNGXFl7rxt7zO44cGJyG55TlM=
X-Proofpoint-GUID: 1htXdMUX23497UyaCG_lv8TxUjso41iO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

Hi Natanael,
Thanks for the patch.

On 11/11/2026 9:04 PM, Natanael Copa wrote:
> The cpufreq core skips requests for the current frequency, so a policy
> has no voltage constraint on its supply until its first frequency
> change. Another policy sharing the supply can then lower the voltage
> too far.
> 
> On the SpacemiT K1, both clusters share one supply and boot at 1.6 GHz.
> When policy0 scales down, the supply drops to 0.95 V while policy4
> still runs at 1.6 GHz, causing random crashes during boot.
> 
> Set the OPP for the current clock rate of all CPUs before registering
> the driver.
> 
> Fixes: 3b9c34556fc1 ("riscv: dts: spacemit: Add cpu scaling for K1 SoC")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> ---
> Reproducer, booted with cpufreq.default_governor=performance:
> 
>    # echo 614400 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
> 
> buck1 drops to 950000 uV while policy4 is still at 1600000 kHz, which
> crashed my board within seconds.
> 
> Tested on a Banana Pi BPI-F3 with v7.3.3 and v7.4-rc2. Without the
> patch, v7.3.3 crashed on every boot with schedutil (three). With the
> patch, the reproducer keeps buck1 at 1050000 uV, and five boots with
> schedutil were clean on each kernel. Not tested on other SoCs.
> 
> Other OPP users that never set their current OPP have the same gap. If
> you would rather fix this in the OPP core, I can rework it.

Which other users do you have in mind? Apart from K1 I couldn't find
another in-tree cpufreq-dt platform where several policies share one
cpu-supply. MediaTek CPU/CCI has the similar issue, and
mtk_cpufreq_set_target() handles it by not going below the boot
voltage until the CCI driver is ready, so I'd keep this in cpufreq-dt.
But I'll defer to Viresh on this.

> 
> Found and fixed with the help of an AI assistant (Claude). I reviewed
> and tested the result.
> 
>   drivers/cpufreq/cpufreq-dt.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index eb15650f99bf..2646dda10aac 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
>   	.suspend = cpufreq_generic_suspend,
>   };
>   
> +/*
> + * Set the OPP for the current clock rate, so that its voltage constraints
> + * apply before any policy can change frequency. Otherwise another policy
> + * sharing the supply could lower the voltage below what this one needs.
> + */
> +static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
> +{
> +	struct clk *clk = clk_get(cpu_dev, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	if (IS_ERR(clk))
> +		return;
> +
> +	rate = clk_get_rate(clk);
> +	clk_put(clk);
> +	if (!rate)
> +		return;
> +
> +	ret = dev_pm_opp_set_rate(cpu_dev, rate);
> +	if (ret)
> +		dev_warn(cpu_dev, "failed to set initial OPP: %d\n", ret);
> +}
> +
>   static int dt_cpufreq_early_init(struct device *dev, int cpu)
>   {
>   	struct private_data *priv;
> @@ -251,6 +275,8 @@ static int dt_cpufreq_early_init(struct device *dev, int cpu)
>   		goto out;
>   	}
>   
> +	dt_cpufreq_set_initial_opp(cpu_dev);

Does this need to apply to all cpufreq-dt platforms? Could we detect
this dynamically by checking whether the policies share the same cpu
supply, and only do it then?


> +
>   	list_add(&priv->node, &priv_list);
>   	return 0;
>   
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620


Besides, Sashiko reported some issues, would you please have a look?

https://sashiko.dev/#/patchset/20261111130430.10359-1-ncopa%40alpinelinux.org


-- 
Thx and BRs,
Zhongqiu Han
