Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D5A377ED7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070777; cv=none; b=OgwGgAz0tuDmd3tSs5YaY9kZCTPW1qC5NAVB1yBNua8PSr5PaI1PD5RSM8lL+s6xR2HuYNiM9eb55cGqsTyBik1IS4erdLNNvxVAJi8yoMNT4xt4I1mP1udgK47uXGPHQ9d2msIacGy+5/fYC8E6i+woMQAs2vdII7b0SfPkSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070777; c=relaxed/simple;
	bh=+FZf8w7gamtymKEs4poKhSyNIKqgP3DcWJ746AYEo3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFQxniQPexLgdjadWdrjrjjxwQ6Fr2Z09eIL+CAsw60IPPSZ07YFTFHBRkt18L8V2zkGPMz/9Oy9VfYgm31e7tuMuU8wxntZW2JSzT0p3MIP0DElPQ86WY99Y+hlsNAqXZWeuGmuZR0lndBIg20zus0jbJxH6ZKrDYozMhs/rnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcQUTQwm; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcQUTQwm"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso285045a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070775; x=1789675575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUgV2Sz6/P7makCPies8cUT1nvpwJR9dBUWK+1kW95Y=;
        b=EcQUTQwm+DBXd4lrjFG7SfE5drpB3UJ2MDzzmPMr4bNS537s1vCFZiaepIIPxbaULb
         i+W9FRhXNHgFQybiCBWUoA/x9axUI2ROn0GKEcEA+EANXyLKTdcLhEQQi6nwg8OJYcyp
         8pfxuR2pWg8wTG/HiEtzVYqYqF8q1nw2bqpSQad9etxpPI6k10x3UpbuG/I9yuYvwCrP
         NS/YGrc3iXk3C3YM2Oi0+jM2ECGoHeRA8hQTT87w/DuWk4nJ019AnHG92mYp+lUqoJ1C
         GKOwCgDVgjM1vkM3Gu8PsAjRgK3HVB6SwA+gDGQ0damr6NuKyWEmEl66oRDwgMdl1F1p
         eJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070775; x=1789675575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUgV2Sz6/P7makCPies8cUT1nvpwJR9dBUWK+1kW95Y=;
        b=mS645YiBFhC8dnm+HsCR+RBuna4CbBqMz9fG/1+mBOCdw6bn8bxNtYrcIN72VcvCZC
         gzFFrkMTvbkdkFG/FLtXhlWvGPC6LJnORl3/4oEv6h3F2ivSoBhlfB8U9mgE2b29H6re
         EU3CUfvE1MwhPFDY0IV+YxQSZrnio6Df67/XJmq7VFwrMGr9vQ7g2OH7tyC8xxhz8UVa
         xWqoLGn0ROxvtjgtAfsXVOvOfGDVlLY9P4bate/rzQA3eZSM9ejaSzbbGLeq6+QrK4uP
         y0Jas6dMiSS1EQCpE8luX0D5P/RRU7rk9NUnzgzPnjE3h7m4D1yHLHYhJxQcOhvyaM5i
         BUzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHFTZklPZpKGKY3n50Q6ORvOS0P9cDzbiyFCQXttKctDmi57DUCFW5KSULzeHQE6O/VuzXi4qd0onw5wY=@vger.kernel.org
X-Gm-Message-State: AFuF++l8o1+tQAgWmd34RBgJfxL5AgLU4uApv3UXOVGFzPRC/merkK61
	WIeOHkSkk/g4tWfW6Tqye0vYGmc3GCC84L+5yOSIuuJwsz1wF1bGFJVX
X-Gm-Gg: AYBFou31+UKx1D3WYy10VobMCDGITsWgB1nERCO2Zb/8GpxUGakXfYbDzflRooD6+Em
	OVd5XtjEav87CDAOqH0kjfMZ0vs2oOyZF6USNhVQIGauryyIWJx7Hp4QcUWfqGVAbHz2QwrpkJ0
	N9IP5wzI68HldggF9eFEYqkfApkn+ug6ZxXNVUgg9YxNtob1CvA5vWMFymsN1QK5fP4IChtH6X8
	W2czWwTyd+Su2xftg9YnhlyTgJm0sUG37AYuwoG1IskVsU/ZS+4mDaIT1L7IRsX7NaJNWEcCYRj
	nF3MNxiAJbgFlD+nTdijXufkg+D3Eqsjh3dgnyAoruLxMUcr9LJnE5WSeBb611GG6GuH+2ybY8Z
	TP+ExojwxCdr1y7zLGG7wZ7V8huqt8fje7HrjH7LjgHRDMOtlv+5nrrFPEywu+3sypNpkEDlHhP
	3unHwW6vU5+pDjohvLfI5yKf6XRWX/hiF9YwNPYKI9Fc//b0265omWTgeR+bzR2mVuiTZWRnk96
	8ulOcYt9co2gHaVLEDc+Qth4PhG1nN8/WkoZ05v9loKS9fnzZKnOz3Hkd+CS1D7Ew==
X-Received: by 2002:a05:6a21:138c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3dad295a03amr7441420637.27.1789070775028;
        Thu, 10 Sep 2026 13:06:15 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm466446eec.22.2026.09.10.13.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:06:14 -0700 (PDT)
Message-ID: <c808a589-56f8-4769-bdcc-4fbea87be6f3@gmail.com>
Date: Thu, 10 Sep 2026 13:06:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] HID: hid-oxp: reject invalid Gen2 RGB status values
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-5-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-5-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Do not replace the cached RGB state with a Gen2 status report whose enable,
> speed or hardware brightness fields are outside the supported ranges.
>
> Fixes: 252c4bf1d931 ("HID: hid-oxp: Add Second Generation RGB Control")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 86a559c..c3cfa95 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -415,6 +415,10 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   		return 0;
>   
>   	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
> +	if (rgb_rep->enabled > OXP_FEAT_ENABLED || rgb_rep->speed > 9 ||
> +	    rgb_rep->brightness > 4)
> +		return 0;
> +
>   	/* Ensure we save monocolor as the list value */
>   	drvdata.rgb_effect = rgb_rep->effect == OXP_EFFECT_MONO_TRUE ?
>   			     OXP_EFFECT_MONO_LIST :
I'm unable to test as my OneXPlayer F1 Pro is Gen 1
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
