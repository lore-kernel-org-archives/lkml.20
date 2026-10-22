Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696838;
	b=I7hozP37uPyOeSXdQ+o7NGx2l+xs8EjNU90sK3yr5fQhqMI0toQIFlSCGnEk0e3Whfuo
	 9zO1nPJJSO0xLbQ6ALtDHgDMKV1eLFK+BkVxXe15kLqbg+giBWf1Mh8EI2q/N06kIaJfn
	 1fLQazLZcjax5w83kaS7WT+ScTYJZ8BgYN+wlQ0h30PziKVSLNEPO8uDac18hY0asrXNi
	 zhmaI6ehuefVxHTw0nfdFKWPEbCxQjN16sNvurLukmOflD+pINw6S8sqOVa79BB6s0BEH
	 qfqAnUhXpGD0APi0m2zdbRDQApa1tUEjlNGbp8acNf1Fi5g7x3XEJzRfAcV8KelSr3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9sXkOvf7AxrvAAH1/YNkURKgzHX7Y0lOYp7pZGB9twE=;
	b=X7jRVGFAiSGNi7RRCHAG9lwKBpuvc39OcN0WuqidrM0xZVjZFk+5C8tMvuToTE3Hz9Ma
	 B9rnhmBOmLUFaVmIRaIZSgCkOSxX7LjEx/0J8mfzcxZQkbeNSoJ9qJfB4CAqHC5JAqO/P
	 kh3DLofGIbGlHcOXed6qPNLVx0J9cHGe0JWYP18IBjTHwF/iq+cASweoJmSpKBZmGnAs1
	 VbxibZMKaQmDAmvvABa6z7rQ2Pxc8Z3d1KYaywslEmCdNKGfS56zq12yVlOh04UbpX8Xz
	 2wizF+kusnrMIhKSHFew47nxX3phbtMD3IRIRxq5SubFUORtDuuCysCy/7OsqYwpAhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhEpnE+1;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A73606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhEpnE+1
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2acc1e170cso23449666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696837; x=1793301637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sXkOvf7AxrvAAH1/YNkURKgzHX7Y0lOYp7pZGB9twE=;
        b=RhEpnE+1jUnYlqv7JiGI+cVLv0LAbRqOGEjDHl+SzzNNqELp3BCGQMTTtkgrVV3sGl
         EFu4BCg+awMIqSrV39O77g2wInCTCrcBhkIjy0jDRVtvvIGkUBfHrA9RQ60mPXoMgadW
         ++gt39oScXT2O6apkAxfTnmB9uKAJWi5IC2NaVHRKSqz2CXsM2nyCcjU0TwiFPHwe6MH
         y0T2ETNBajdsd7ISMCyCFyNHHC18XZ+r+d1l9jE2k2ZkiJXu2/Jr2MsniWUCdPbIRci1
         QZ6s/cvamcXw/xg/Dc28xFpzsZr0b3ZAVkTclEmnqNGmro07X6tHoGCdMbjrYQ9HIXQl
         JTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696837; x=1793301637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sXkOvf7AxrvAAH1/YNkURKgzHX7Y0lOYp7pZGB9twE=;
        b=cAy525ew78m1oMGLyrPJM8fn/kvDy5GXq82ipc2RW4nCTMXZ51RExQpXOoq0VfnIri
         JW+lvfW/b6MUYMJMLwlqjTHWjj4+JBtnY3D3BiirKDHUlwQFR+j7gw/ZQ4Emd5aqh6SS
         dAWAiPMoCHW1k5RD2IBpFshLbdtfgOpCPM0H9mpkBOJlLhwSSqWlf/7mrxZwDsOuWnuY
         IJS71z3olw2aeHm21D7y+dWo7ytxDnRNcxNupQbs464ZmJ2CNNsY2FcBTmAQIzVcLwhr
         6Rji8NGsG2CjwdfZnaYjTCV4T01PqYFm7kWWLVu/U7h6MnvlZDPNXDef5dswt59nc1UN
         GvXA==
X-Forwarded-Encrypted: i=1; AKwUvBwu4lQrZtkJB97W2qeydEAXc/zMzi3FphfRiSckya+U64MURLTAz1uRwTmOCJJO7g0LcCeJP59uRq7yiwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNEYw/44eO7/070H0gB0+hrVreh2CfM7JrblbeMe0dc8AXPG9V
	hAHRl/jqp4FyCK37VwagU10ryg88yguIdzRQ7OqIIBg3yJF5oz7t70Jj
X-Gm-Gg: AYBFou0FlwkF+8IpiVVTdIDID6n+IOFM1828CyEIou0iWHcWDtq1/2QHdLckpzX5MvR
	h/GqRxqucAWl+wp+3PLZXQrHnBqTeU8+Wc9GLcZa1T44uNIU1VKxfRFIuJqAmiFcNThMznluP7m
	X7TRG50VWUona+B1d+xFeMPa4Ci3DxzHcvkbxMyCs8lOkrDDkgdmZ4xYTCgz4vBXZxoTcakbv7S
	1VE43bHCq9Cmp/AAbk2YxuIQps4oT1z0/HwgPGWDZmqO6nuha2VS9/OBXpZSgd1LiZIQbv01A0a
	3Wsapls5Gs/K4qRAZYuINOasaJgg1FRsnkxWAIQ0E4dc3VG0otm4B4GTg+vkDlPHbbUvAieGB3S
	0aLf57YqA0C0aqevDr3C3o4bbkVq5jUEVwy/DzXkUYytTuSrcZUFUdSrONqpLXmgmlOlyM36ocV
	dABbp5E0JIbaWXAn2gWIaybmoK5UwH2HJcIRTDOCjVlakcPAQ7bNUIVmrDYxCbovR+qccIn0pQB
	E12g+mD/+vd1JMR4RWh1r64t3vXVN/rR3NGZApfd846eGHllbvkPXT+1XrCMubFaoE=
X-Received: by 2002:a17:907:db15:b0:c3f:4d1:8cd7 with SMTP id a640c23a62f3a-c46a92afc93mr21950366b.25.1792696836432;
        Thu, 22 Oct 2026 12:20:36 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cadf1esm20266066b.53.2026.10.22.12.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 12:20:35 -0700 (PDT)
Message-ID: <e44c1fc2-802e-4cd6-8359-a315bda970e6@gmail.com>
Date: Thu, 22 Oct 2026 21:20:34 +0200
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
Subject: Re: [PATCH 14/21] leds: flash: Avoid divide-by-zero in
 led_clamp_align()
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Dmitry Antipov <dmantipov@yandex.ru>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261021123406.3163547-1-lee@kernel.org>
 <20261021123406.3163547-15-lee@kernel.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261021123406.3163547-15-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 10/21/26 2:32 PM, Lee Jones wrote:
> If a flash LED driver leaves a setting's step size as zero, writing to
> the corresponding sysfs attribute invokes led_clamp_align() and triggers
> an integer division by zero when aligning the offset to s->step.
> 
> Clamp s->val to [s->min, s->max] and return early when s->step is zero.
> 
> Fixes: 7aea8389a77a ("leds: Add LED Flash class extension to the LED subsystem")
> Closes: https://sashiko.dev/#/bug/linux-9d06d7fe-310b-4aee-8b16-0fb49550c287
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/leds/led-class-flash.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 181dfd49c6ad..16b3b6b9365b 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -375,6 +375,11 @@ static void led_clamp_align(struct led_flash_setting *s)
>   {
>   	u32 v, offset;
>   
> +	if (!s->step) {
> +		s->val = clamp(s->val, s->min, s->max);
> +		return;
> +	}
> +
>   	v = s->val + s->step / 2;
>   	v = clamp(v, s->min, s->max);
>   	offset = v - s->min;


Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

