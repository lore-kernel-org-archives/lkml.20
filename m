Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4057D21C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070679; cv=none; b=G0+wFXMqLeu1hShKq2NWUu/+07BLSA/QyOK9AxmCTJSkgGUFIWHlKGODtEZ3WK61b7iHwan67KT2uz97m+jH+1SLme+ecu0X6FUXVyp2o/y+zWjCnjkpnMJ7sCvgJ6PGnSLMvWZkCQBIaS7HNgpARRKoWtDnPjbfGRlnn6LVkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070679; c=relaxed/simple;
	bh=E/u4JbeHNzAyqPkp0nbuRzJRPv2PPFHaZAvR6l/kWps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhMoZqxp4fSsj12vGOLCfrZHwJgVnyZkHDZUD21PV2Ne44DUgEEBPuKn1Dj5A89KrFlKmbK79zZydpZw7BDfnhOoYLW8kkwzwOQY8DdUhNvJp26PcD6noLHPcDuqnfw/+XItnbZrti8iynJDj7W5wR8VQIgQO5TcDXk9c5iBwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwF2gGz6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwF2gGz6"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso274019a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070677; x=1789675477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glhIiPms7olMgwg+mn5dw0hW61m6sgEWq22CFgDOSsk=;
        b=BwF2gGz6vc3TgDUAjUhap/8LsAe6ipxAXeVIC6sjNwjF0L6Bvyy+KyoVCoSXugncY/
         VOf9qZEX1L+9YIe9j4q8+kMpGhpTwZKOIi11vhG30Qt4NnhlBwId65QZMr8qjlMZW9Dh
         quZpalr3AQw/4MFy83XkWV8K+evQQRwyofbQrG3dN2G5dOu7RmaOTapllvDIXfLIv4Do
         4am42PtlLgBQ506u+tzWhJAewY0YKqkPzYGXbI0csh+0/vXphLRnioazmjKHOrqu0WHm
         HofAVHC20lo7GIIiAXc3cdTgRgcrUmSbUc678CNH8H0u5a/9eUbtyNcO9Gd5WrDu8AO0
         dADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070677; x=1789675477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glhIiPms7olMgwg+mn5dw0hW61m6sgEWq22CFgDOSsk=;
        b=XicReaAYTtdslr5JrcbfKdrWGw1QT2ArzbsWKKV0CiqLwVRGvVy0Ek6WhCgJ6Jkoud
         fFOuaBk3bNb5W4/oIVMFnmymd/qkFEh2IlhpHWvlcCiqhjp6dmo04xmVdU2yDKdX97w6
         jBFV2MsoRSkBNq4K3oeck89okiX8PFXvdJM0X1lDUWl3Hblh5NccVapcW7A3DRCxUOv3
         PM771xHsGP9Yh9lGe7x9C8Gre/nqT38DTCVlHYe0ezE/gZ1FCKxQORnkaLl/VgA0Id3K
         lrIZd3dYqbsQ+Yx3dLwkux9tPUzQa4EMJ/bbEckxw53HZZrYUpapWaGAJRy3PhP8cyNB
         CKPg==
X-Forwarded-Encrypted: i=1; AKwUvBy63Rwhel1eNALHRffmhATU+z6ZyJ/Qmt8t87UEjHVOHS1nOFToptJeoPVkpA6mIFmDvc+6FsQmkG5dY6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n8+KifnF48yObWG+xwHKNUslyUlw0xrLrJ8ZjdKdzDSAdQSk+M
	37aeUYewOzBI6S9EL/DvzG+MkXr8hUjMwClrWIeNpoYGf5FuIGr1Bdjw
X-Gm-Gg: AYBFou1XcHHMcQTPwto5xV0aazV/ooyrjWTJBFRjblVfl5zUcGYOiuFJ4fUD3EE8Msy
	WZSdCXDAMbY+F2AZ5oUsNjLbeazy48ATlJLDxjlt5j7QALCwL6vmHE2jgQLJyZJBUcV10O79puP
	OI6IvhH30P/cklrCffXPzTxNAQjmYw7TjkjP1714DSkHp8qc2jasZiq1WEo9xtmnUEc8OBHWx6k
	yQdrChnEccIi7U9WMRVzLdCjrjW5L1dg6D0x5neLzGyBf+2d11gqMg5MHXi/ltUVoeOecndnZEN
	ZEGJNqT9bUuP+JFiocaZuzy5MSbxwDoa6Uwm6AMsDu2w1Yv/zPmwml8AfCLRernwYae5t+tSccz
	SdT3nmAxSYE0Y51VbLd0T32ADRJi6YOby48qecGGO/ah+YghIiaZbFfoHkwWHs3PJ1TCwb/4e8X
	7TaL5SNEedDPE2GyalPbYOZ2FQUol6uTwLiRfu7TlKDRhe79APZvEUZgX6fowgipptkljbStvfm
	PvzvAuG4icXdz4cUfMbOBymSXthT6BCWPa3iJrONU7sANhf2r0KGEFkdhTHnSqZlA==
X-Received: by 2002:a05:6a21:3292:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3daed3b7f4cmr782259637.21.1789070676939;
        Thu, 10 Sep 2026 13:04:36 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm929478c88.6.2026.09.10.13.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:04:36 -0700 (PDT)
Message-ID: <76dc89d9-86ab-46f3-b26e-f01b550000f1@gmail.com>
Date: Thu, 10 Sep 2026 13:04:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] HID: hid-oxp: validate input report lengths before
 decoding
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-3-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-3-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Check the short Gen2 status header before reading its command, and require
> a complete RGB status report before reading either generation's fields.
> Use the supplied input length for the debug dump as well, so a short
> report cannot cause an out-of-bounds read while logging.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 3f2be80..0c895bd 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -23,6 +23,7 @@
>   #include "hid-ids.h"
>   
>   #define OXP_PACKET_SIZE 64
> +#define OXP_STATUS_HEADER_SIZE 6
>   
>   #define GEN1_MESSAGE_ID	0xff
>   #define GEN2_MESSAGE_ID	0x3f
> @@ -318,6 +319,9 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
>   	struct led_classdev_mc *led_mc = drvdata.led_mc;
>   	struct oxp_gen_1_rgb_report *rgb_rep;
>   
> +	if (size < sizeof(*rgb_rep))
> +		return 0;
> +
>   	if (data[1] != OXP_FID_GEN1_RGB_REPLY)
>   		return 0;
>   
> @@ -391,6 +395,9 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   	struct led_classdev_mc *led_mc = drvdata.led_mc;
>   	struct oxp_gen_2_rgb_report *rgb_rep;
>   
> +	if (size < OXP_STATUS_HEADER_SIZE)
> +		return 0;
> +
>   	if (data[0] != OXP_FID_GEN2_STATUS_EVENT)
>   		return 0;
>   
> @@ -404,6 +411,8 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   
>   	if (data[3] != OXP_GET_PROPERTY)
>   		return 0;
> +	if (size < sizeof(*rgb_rep))
> +		return 0;
>   
>   	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
>   	/* Ensure we save monocolor as the list value */
> @@ -435,7 +444,7 @@ static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
>   {
>   	u16 up = get_usage_page(hdev);
>   
> -	dev_dbg(&hdev->dev, "raw event data: [%*ph]\n", OXP_PACKET_SIZE, data);
> +	dev_dbg(&hdev->dev, "raw event data: [%*ph]\n", size, data);
>   
>   	switch (up) {
>   	case GEN1_USAGE_PAGE:


Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

