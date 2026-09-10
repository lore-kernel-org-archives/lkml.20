Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51F1F507
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070727; cv=none; b=pZCGhXvfJGlMYqPcIwFjKadkmZqpAueK301Hpm9uWPNMj1OcAti75yg6Nylqemnx1HDdbd+UdhQyD/AjwNa4oZSt3OFBrkmjCU3jWkaIdJUDoqcOCFm5lsRdKCvJ0BObWQClbhiO6LbXBa5qF9bjN+Dkfn11g1GsgfWGPXAdOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070727; c=relaxed/simple;
	bh=z8rJXMmxlASWUbyFEAKP8P/3qFO3Ptq8mGN9eXy1jFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMrvaAPzIXz2B7dVXBA12KiqxrnM7lGUVIBeZwc5+oJ1x28AYRjV1D8uXvkW7bKHFd4R/+M7OtBiIovUhN6/EYVGDjR13vkpummSJNRbd1DnkiAqHFyl0WYWLCUBuFvkC8piNILMoHuPSojtldGTmg4wlEkjnXI0llUDLP0bj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuZodHjl; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuZodHjl"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caced6038eso2348755ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070723; x=1789675523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnuVxbiXCgrcJRB1M65AA3bcvT6F9ansgD+TG7v7Nac=;
        b=RuZodHjldCffGC11wbFFs73TxA4M6SBDNALATa5B00+aFFN91sAq6hIo6zO7+HhUiZ
         Y8Kn2x7W+9175QD/NQhM/w1NtEu3/ZrID25h6YaMfmSBSSJAb2phGEUEB8hqKMc9cIfj
         sj0NVMzDe12tVa8tG7RvMPycchfpwzfbJrzqvzwNVPRTEqyfGM++NXFC4rJ8CT1RON7l
         t/9UfbQ7Gh1FevLdkaq8sUwNLLy08UsTkvWoEYW8/tMQXihSrSTOWjiUvWW9cVJnSH4X
         RIV83H/nzjK4DZ7+ypOfbW1f87vkPlv0kUr1kFbiDHgZ515Vh/ItuehpCPL8oP4tbEwP
         wB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070723; x=1789675523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnuVxbiXCgrcJRB1M65AA3bcvT6F9ansgD+TG7v7Nac=;
        b=bVg/nlmQlvHR2qfrLiL0RLL43yi28cfAiJ5vucOjO9BpoGW5ZRvMpcaP4uRgeVKR2d
         NfQA6p+UPQNSpqHOOOmOlKgIr3Q+djt2ktwJd/vqd/WmUqn8AT7eRpjYIdbTapxEcv8y
         m8AN47ZgyOkYu2sON9zzH51U1+uNSkJGQiNUVokegJkdJh5aDKY3AFhIwo7LwiZG8QHj
         GjZ4IX4D7tJO56qnvh2sJi/wSW36/mltCJqXPKQ59Isi6jPvH1ZIri4MA9e1r6HKhcNm
         BQr/s94v+9O7KxZCo18vp7INmSC4ezT9ft4YTzk5Oc61jS0TM/UQQNBEWRMe2NflD+QY
         +R7g==
X-Forwarded-Encrypted: i=1; AKwUvBxHoQvOBjLtB5/0vOHXm8UgTjDofOj3nrrYs8raZ8BmiVG7oGWFiSgi1Bc5bV3+9hW5Hk3Ew7raV05TBpo=@vger.kernel.org
X-Gm-Message-State: AFuF++lWji6pmE+xj1SyldntHlFp1405si+jQ4OuvEJ+kvfWTRxYT2PX
	Q/q2+1N9mKJgroPmkq+SBGbMsWuv09oG3ejZay3JrZsJzZstNmJGiCZ2
X-Gm-Gg: AYBFou0FST5x/oUepdy+CvcVTvA4fsXqCVNRmFOEp5RGvpUVAwxBiGVty8oeD544zLX
	MZOyUmrbPvIlARbYYZ8b+W0OMF9MiY5hM90+Y5yey3xtsg3oQglbbzJm2YSzGIf2MONiV1QSrLV
	3m8yOPZiIqbHQLnTNc+hVBUQ4OqDzMP4199CDnRIWZPGf1Lzyf9SxfFNSx/enfh69yrOuZgZ1P9
	qFMxZxK+cOLpYoTn8IqElbNPCcqNPSRyE8138q+wBkdUKt49HA6RPTPxmSd55xZURzYT1SIVnAv
	vO/+IJM4LFjr5XtH3iKdCtjmtN7qXQq5nuXD7g0Gfdcwk2PrnGJJnj0d7c9W0BYe64x/JqWcxEc
	WUOZ6hOtGWEZhzc3rxkBByjNNE6zsmHzP4H+kh1TbN7wjwjfh0AXt4PjRFfkcpwtMzwt8dam6Op
	tR38gJvEdasda/KKBBawckvcC4T3LvqJSFGAlbudl9BWf19Z91vbnfl+68i8Ll+X5nUuQjnjDDD
	QR4vvaZTTF3aUSozSDENcJKlKwn0rPKNFhDBRMcZlNb7XY+MvcbneTFMYCw9UhcEA==
X-Received: by 2002:a17:902:e74d:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2dd0e8a1969mr66012825ad.2.1789070723090;
        Thu, 10 Sep 2026 13:05:23 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm409076eec.11.2026.09.10.13.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:05:22 -0700 (PDT)
Message-ID: <a781d941-90ff-452b-b2f6-c43134cc7b55@gmail.com>
Date: Thu, 10 Sep 2026 13:05:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] HID: hid-oxp: retain fractional brightness when
 reading RGB status
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-4-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-4-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Multiply the hardware brightness level by the LED brightness range before
> dividing by four. Dividing first reported every intermediate hardware
> level as zero instead of 25, 50 or 75 percent.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 0c895bd..86a559c 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -334,8 +334,8 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
>   	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
>   						 OXP_FEAT_ENABLED;
>   	drvdata.rgb_brightness = rgb_rep->brightness;
> -	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
> -				      led_mc->led_cdev.max_brightness;
> +	led_mc->led_cdev.brightness = rgb_rep->brightness *
> +				      led_mc->led_cdev.max_brightness / 4;
>   	/* If monocolor had less than 100% brightness on the previous boot,
>   	 * there will be no reliable way to determine the real intensity.
>   	 * Since intensity scaling is used with a hardware brightness set at max,
> @@ -423,8 +423,8 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
>   						 OXP_FEAT_ENABLED;
>   	drvdata.rgb_brightness = rgb_rep->brightness;
> -	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
> -				      led_mc->led_cdev.max_brightness;
> +	led_mc->led_cdev.brightness = rgb_rep->brightness *
> +				      led_mc->led_cdev.max_brightness / 4;
>   	/* If monocolor had less than 100% brightness on the previous boot,
>   	 * there will be no reliable way to determine the real intensity.
>   	 * Since intensity scaling is used with a hardware brightness set at max,

Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
