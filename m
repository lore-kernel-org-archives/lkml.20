Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4A440A2C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804560; cv=none; b=ID6Ehd+apyDlLOPTkhX3DQqQ/CQoQz8O8nOY0kLq/cIfZtsmlJZBAYmR7ftZniN7KxkkJPsQE/mvirmw6b/ghtyCKqgyebUlk5AOyCxwXKZxA/NUaa8+8uykE2SyNV2aoGjHlcOLJjS4e0q5lkE3lc8eCWtmoB+lR3+JkKaUOwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804560; c=relaxed/simple;
	bh=eCCFwv675o/3cQmMuraKwllZ+8HqmVG93dv6xF/q3dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjO2lE8RJZ0bsMlBWs5+B76YS4I4VJdQ7si6hyyW9m3Q8lCkC1nEVKgfgIET1ffLa7YBXKI+YV0ngJYJp+OMpw2GyTHOiXh9n3nDIPNjymUJoXq7HNb3ETb5RIroQBNCwwkRnLHbjGBdhPS7glb5D1CkgoAneRZXF9v/jSIYqIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuTUJ9xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iq7Tonz1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuTUJ9xw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iq7Tonz1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C9t28i1404744
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=; b=SuTUJ9xwGk7IcNAv
	dEJ6RWOFNIaqV2gmADy/taq4Qgx3R8BkOMLs559hEkxg0b+SqZLN2wDv+guo7q+1
	Yw3JY6kitqz0EQ6nC1+5rl5F59syw8mGqsS9IVdNh1wsOHn1o5cvHhBzGD0JGVyP
	7YEkzj03uEl2s+kazlbXbizou9rxnD98LQbjZ4TtfqgNjPzr0YCv9UAeAAWj5UKS
	7wkjuLFh9InHteW8miF08ls9RZgHP66N1tO2nOhpq4IUyXiYoDI//brvg5f1g5kh
	ZuOQckQiEykNwZp/np+yMU9ooLscIX0hnpCtlQN0CYrBmsIypS+2bQZccwCCZRbk
	+0Y+OA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0h1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:29:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc19d8e59so11221585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804557; x=1792409357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=;
        b=Iq7Tonz1++3akKazTR5396DnZpfrLWewjS83Kl2zChMlB5efq8O68x8Dgdzjgxo9Hv
         FJrFB+0SLqSh9TZFbWEhJY6lCzDqYcAL9MbYenGsN6cGHd0OAB4Q396mBR87j8kAFM6I
         VcdPT4xIcd11fLB/uQjjc2WbCWTUTvTxrR2n582P2qmDhnQT9/cMM+kVgES3ThdqLN7t
         7FBJbXwu4QkMrYLkImH1LFFmra7gv/iwCVuiJyiXhfHyXYOip7Riou8/HYqUGEeEj3L5
         DThhnoe6rIg4BAWWYb9DYsErZXr+owWGbvVayM/9GjcVtOjsgwmfcR49Od5b5BzY70fV
         QSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804557; x=1792409357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=;
        b=2XOlwpaZICUYUB6GrmlYB3JoZc8qJrkf59C6UwYdrDgMTg8/hE8GKJF+0HGfzeAGbI
         PqMydxn/LuiS2c9aUrVHCl/DVZ5xHIeZ8TCgAxFDPlw+1KeBhAIbRPoGrbH17OlzDfK3
         l/Fqc6zzdB5CpdkMZsIeWa2JStKicPDXpwleJRbI07mNryXLhKOGBVvVwtxOYqR7K1jo
         5cDd02Jm9zxrV2SGFghCa5rb/RF2u49z2ASuh0wnRvR25wByZBrsWutNk9ai/8JTQyhU
         zwAKbSUbDeqebOmybnH08PaIndPlSh/bp4HjQF1hLng/MSWQC4ugObWTXmTtcIaswZ+Q
         YEpg==
X-Forwarded-Encrypted: i=1; AKwUvBy7RAOsihGVJv6emH84yhkYRUQVfN/fiyu9I7HRAePzN5ioYVcnSokPFUhlRrpzXGLteu2tM8lWygv19ZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK63+m2SjH9nPhmNhcMI6lkhUJSOfBJkXwhqqWQHs+0NBPC3hzP
	yEEgRoyRuaxvKW+ENtc0OjMS3yzRPV8t3skr8epmformSjajOTd5VQrYPmA08s0chX9Ta2rJwPf
	vc1U7/OwoFYhXLBAwUcCcOhujQ24GFdb1a1R/qCyOnqYk05esq8VWHqE3PsQIN2sg9zuNE2rOcL
	Q=
X-Gm-Gg: AYBFou1vnYYXy+MgkTdlp9sn0YxQR2OouOKFWyhs/1omuSUinJIPsT+jQjZyeSlUWMu
	UZwspHyDUNmRK0fhYytF3U5dKMMrXfxP5eJjrQ6KvfO9Iwms+kli/SSDfI/wBkXtKBY2t69A1FU
	9YCI7AYi+BbijgVuo6ryiu08oAvJuxY7zreGUriHjvU2cNAx6hS3qzm8f9gZro6OZLXEiEJpQ9U
	6kxo4jii2lrHXv5VwQE7Q6oUgcUCG5olR/Fzq584kUpb4ickR6adQdaffVmqluqW5QNTy5xtuAl
	nPtNOj1s0nkjH9Jt/PWEYhb9J1BAAzv7rJ71oeDgKt0zLMQYJjzhcbpE6Jx/lKjM+LwtHQUzPco
	GThJAFS595s2z9z5Z8TRpLw==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1713164485a.3.1791804557031;
        Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1713160085a.3.1791804556519;
        Mon, 12 Oct 2026 04:29:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e01101sm4750943a12.35.2026.10.12.04.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:29:15 -0700 (PDT)
Message-ID: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX4TLGuBG0/4qQ
 MG+vwnRj+GK5TG78CbyTTc/xxPtcD+shY2TKBVrUBgJeZNpXIfrH+pcLEHMqaIvdUz66F6RRoEN
 DIJZNbHFT1yqZDZFJorDdo2ZT+JPOj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX40Teb8fHH6ln
 1iRP6pkDlQ3Pfus9hQcy7TlzfuD/8rAytT42UVZmdve8qocLMfxshr/DABdzdLMnm2MY+M4aos0
 p147jiyYZ0J4B08btIQJg5maTggGZVSaq1/rauFmujTmLa/2w29pAWDyikVcYJ9BcOhSdbYuEZu
 GLGZsETdYwI3pgJvyC8k7U5yO5U5T+ilgxvO6qRg+3WlpYwRtu4UgD++frrXE6ZN+BW4j7k4EQQ
 bmW2TXwW4ZOIWZP7ex9/lNRtbJEE8hb3ugcBWiJWMhhvs67Q8N4yXgTMeMMXOnN7ogKGCZbfmES
 28PVszuUeOqoGIidxfQIEzWv1aYRi4kA/KAGQOSjaBV1nDiSUl7WPH4KPitV1gXZTpa2dYl/vIK
 h+6uIe7kb3YELX6o2bn1ECexG7v0spzpeSQ3UvcUKE9rtRRFqVgY6uVk4pZK737yObwjQE7ZyBl
 aqsS4HgC3tS/x6DXqvw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accc48e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OrLOohl1hFq0FUu3FHgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IpMCr3dKUtY_A9bszVWdlIYl-ZmEPFEy
X-Proofpoint-GUID: IpMCr3dKUtY_A9bszVWdlIYl-ZmEPFEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.

[...]

> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{

[...]

> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)

these two and bcl_in/curr_thresh_read can be unified, then some
helpers can be collapsed inline as they become single-use

[...]

> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
> +
> +	return raw_val;
> +}

This is single-use and trivial, inline it into the call site

> +
> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
> +
> +	return raw_val;
> +}

Likewise

[...]

> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)

Do we expect userland to program these, or are the default limits
sensible?

[...]

> +	/*
> +	 * Map register value to battery configuration.
> +	 * As per hardware documentation:
> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)

Would it be hard to support?

[...]

> +	/* Check if battery detection is supported */
> +	if (desc->battery_config_field.reg == 0) {

This is slightly sketchy, but SPMI peripherals always have some ID
registers at address zero, so okay..

[...]

> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,pm7250b-bcl",
> +		.data = &pm7250b_data,
> +	}, {
> +		.compatible = "qcom,pm7550-bcl",
> +		.data = &pm8550_data,

Are they exactly identical? If so, please use a fallback compatible

Konrad
