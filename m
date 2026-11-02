Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587296;
	b=kBVniYmXVlWfV28NAjLrAL8ek6GKHGdnUS9ds/UhGJF2P9ELbUSqF2Xchje4EoAFOiLF
	 r2UxmLKaYwdNsNrYv+1oHJCJx48C2A0trY71QzCF4J+FrHEjFqE5u4tm7cz+ysntMFmfn
	 2CovoZT1NEDY6slSsbu9DWPbL5r7rl5jNQmMdhq9G9wDVTRIdE9Dhdp2DEnw1k5/nSFeq
	 wblPJjq9qJFiMutjuBV2gymR/HCvEpVHn3ySxiG5QrgIewWQvfjZ3DG/uOOD3NWyAY4TI
	 eeIVMfOo3JkuEu+4+ecHAhHAinMEKZFz+WmJozvcnAknBnkKTd9aDAXqHsU4rfqTwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QbhFQokJp/Y955PQiirwQtIB6mysvJutrczdaAmitHw=;
	b=UI0uOF5yuH/21pONDYFnMXjWC1W7CQe/SYvGwD0bTAXnOm8BP5wQPvRx92A2gfJw+7QR
	 kB4JUCdpRcBowY0O4lL/EKzLmTowRWmaMNMLAUexjkZQFS/GS59RyxoXkS0EV9D9ZE6F3
	 xZVgJKy8/pIPRmGa6Dd9DCR5vwZcq9TWL+8qRCr4LR6Mg67F1i+DBxuSbETv2DuqAj9ad
	 CCaGQkCqJWfq/O/bTjJnwniuJWpncjXLoXhHd+7aiy4+CLu6chN4r9VS8aNB9hZI9bwBs
	 6FDas2+Oj73NBW1P2UVsGsGqEtt829M1ufq0Phg3cIeIqaf31wZOqzklrVX87tQvMxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z16Qu/jd";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31460606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31460606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z16Qu/jd
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so3052528c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587295; x=1794192095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbhFQokJp/Y955PQiirwQtIB6mysvJutrczdaAmitHw=;
        b=z16Qu/jdVpAEr+XhL2BNwfSCVrMizOZEfLK4aIETePlR80WRw3x/jvMpaXXNQJ5m7C
         IR5suVYw6Bjajb0JAuJioak6P8TTmevmngknrACE3GuW+tClRQ6pG5aHkJX9ChUNSKgt
         WScI+vWMeoIsKjW4xkBL1s8kOetlHS3gnHZWMP6at7At+hJ8MOI+ZkYvSnxD7dWJgtR9
         qjeX0WZKRoBDc1R+UH8ZYp68/aVDrQmZusHyRqECMNYYQUJ0uVH3kN0nh7aKaEbOEkVG
         tljYLKX6ITzc7LfKlERGQLKGw8BGzmwYOofjy4o7hwnP9xbZYvkT6kYyZuCvxl8+a0FN
         8FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587295; x=1794192095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbhFQokJp/Y955PQiirwQtIB6mysvJutrczdaAmitHw=;
        b=TOmrXFQieT73nP8L9PyHXesMkvkfYlUmJJXRxffnJq87I1GU0afXd/d8QhG9vW4yJX
         60EiaaqkNu3f+4lA3KsAzabROVVR9MoN/dq/Oar+I6yLoslatQ2IyDRR9J3NvbMbwV+L
         hvABNhJnHqja9BPWyXaa491FhixnhZnpH7aza/XfvUzY6a9Q8hWiNJxztcoCnw69yghZ
         +yZ4Cmwdj0WTEJkf9bb1G01SdVpBJNNKf+rO0Okkk6NHx1GTTdFjZ74Vwi7AGJRM5/uv
         1Pj6tINMvtdrH8LFgZUYhGOmv2jOWB/DTOk8VVlcdb1Wo8chRjk58k7sv/vBaMtxPxSI
         Bwrw==
X-Forwarded-Encrypted: i=1; AKwUvBwlvzIbZCdqJ/pIWFZCyBKFUHMYsPSFz9ZtATXfp0tEeKEdazRoigVeAMQeLFLljovnUY2XL/4wB9Zlu7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMQwWGgaSjiX9TGnKgr6VvZfCHR5zG0eLASKmvaPNe2zPjydkc
	rwBn3OWhzB6V/1L8dHvHM2Hh5ygEvDQuubwcC810T1vIO0K+T5AnECYP
X-Gm-Gg: AYBFou0/IU2fsGMLHRApd/wV2Trs+iR934AtWLHty5EePl0HPtEGb9waOlbsnH6rIqH
	tGz9L0yVyEZcFZFJFtef+SNyZMOTiyFQlA8W4D3kIQc5Fdpi5H4ma/dBFphYpmd9AUl9NDtxo/C
	LO2gLhvIvIcWawXbBtfdp+6ITvspgYTw1Pxj6bi/Awxr9f5ohTMqy1rtxSPL//zbX0KuBW3ewC1
	yfnoFB5ecPP2NBg4evWAnIo45TczaUlBYrSXasskTzO2XH9yi9YIbtjkXEPpgtd7Fy6hTNVmcsO
	jVP/ri7tWY/KKpGCp+h+sPDsZAql2tfv6/qvWqnqTPnHBs8cMkG8FL/Y9/kITfiMK/LNitCqziC
	1MJpjk4p+WNrfaFA/JO2uUkPpuvLycnPd+E+eYQ5f8oG6p30oVikNS3nCYNo4LcbsBTwCNZpvss
	hKmUWRZ/1MowwtiP2eHQ32Yh5FjjwmP3cOeys9PAocqdDqfByDYrxqRRJRjd5bNbl847mBNoO+A
	ESOV1nigpFN7NF5W9YBgkgPrbR3qLcJfTySlFkTEUSWJFw0RKL1SFQUeV8C7zkdVkJpF5c6LF1s
	qmekLGzy7sPHUjAc8AMX65Yl/a4kFbmqw6I6Yqu1+MmzsA==
X-Received: by 2002:a05:7022:1602:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1ac5d88c579mr17549874c88.20.1793587294543;
        Sun, 01 Nov 2026 18:41:34 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm38514927c88.6.2026.11.01.18.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:41:34 -0800 (PST)
Message-ID: <d9b0d35b-a8e8-4ffb-b2c4-a659ff7e941c@gmail.com>
Date: Sun, 1 Nov 2026 18:41:33 -0800
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
Subject: Re: [PATCH 4/4] platform/x86/amd/hsmp: Add
 pwr_current_active_freq_limit_source_raw
To: Erwan Velu <erwanaliasr1@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-5-erwanaliasr1@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261007125908.321186-5-erwanaliasr1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 05:59, Erwan Velu wrote:

> From: Erwan Velu <e.velu@criteo.com>
>
> pwr_current_active_freq_limit_source reports the active frequency limit
> sources as a list of names, one per line, which metrics exporters have
> to parse and map back to a value.
>
> Add pwr_current_active_freq_limit_source_raw, reporting the same source
> bitmask as a single hexadecimal value. Exporters only need a plain
> integer conversion, and its interpretation can be centralized in the
> monitoring stack, e.g. with Grafana value mappings, instead of being
> decoded on each server.
>
> The bit assignment is defined by the HSMP specification and is stable:
> new limit sources are only appended, existing bits never change meaning.
> A given value therefore has a single interpretation, whatever the
> platform or kernel version it comes from.
>
> Assisted-by: claude-opus-5-5
> Signed-off-by: Erwan Velu <e.velu@criteo.com>


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   Documentation/arch/x86/amd_hsmp.rst   |  4 ++++
>   drivers/platform/x86/amd/hsmp/sysfs.c | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+)
>
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 954e938eea3d..66dbf506db05 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -109,6 +109,10 @@ Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
>     in MHz.
>   * pwr_current_active_freq_limit_source: Source of current active frequency
>     limit.
> +* pwr_current_active_freq_limit_source_raw: Source of current active
> +  frequency limit, as a hexadecimal bitmask. Bits 0 to 7 are, in order:
> +  cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability Limit,
> +  APML Agent, HSMP Agent.
>   
>   ACPI device object format
>   =========================
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index e9e91b640b2a..fa1cf8dc3b6f 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -274,6 +274,21 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
>   	return len;
>   }
>   
> +static ssize_t hsmp_freq_limit_source_raw_show(struct device *dev,
> +					       struct device_attribute *attr, char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "0x%04lx\n", FIELD_GET(FREQ_SRC_IND_MASK, data));
> +}
> +
>   static const struct bin_attribute  hsmp_metric_tbl_attr = {
>   	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
>   	.read = hsmp_metric_tbl_acpi_read,
> @@ -307,6 +322,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
>   	      hsmp_freq_limit_show, 0444);
>   HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>   	      hsmp_freq_limit_source_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source_raw, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_raw_show, 0444);
>   
>   static struct attribute *hsmp_dev_attr_list[] = {
>   	&hattr_c0_residency_input.dattr.attr,
> @@ -323,6 +340,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>   	&hattr_clk_fmin.dattr.attr,
>   	&hattr_pwr_current_active_freq_limit.dattr.attr,
>   	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit_source_raw.dattr.attr,
>   	NULL
>   };
>   
