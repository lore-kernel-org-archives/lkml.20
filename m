Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931344;
	b=I0pij0vFMm4v3c2feP4hsBxhgPLl6SIMMPGJlvj20j0Sn0elDBdqt3XozCuymdwB41vf
	 ivpIkCy9u5AghWFlhsMI/fRxDeYUgMMb8YTL8UKbYEE9rVMqBhunIEyEaiCvG7l4J5sSy
	 /S+mlCNj0VVoSyP1kqh54hik9VrD8oNLceQvafvbecvDY61xns4BJ4VcoDar8jP7BKmD3
	 cLs+GV9r7aya5viqLASyHuzmUw+ZS5iFgHY5xepNxEiRh2EzQXW4bEkxv8D7S0jYpzSpQ
	 XvpsZHxgxiJ1pOWq0SjDBBpZ4gjhGKnBjTHFy3h6hjzVCv0nWQSdpwMcEZBqhNIy6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uKugVXcJh0MRzQIL6MmtXefuzIWu7Uf4heR2DCrTxd4=;
	b=vt+2QUZlPQFyr6nInvLsKgFuB2BdliK2n4NKEArbhHDU/bYQcWpB+6oJtsg2CZIU3dVB
	 8bCK1JAR+cGh0plCal8u4DLze7/K9ow6BvUd948+K9RVXfALqOixSznkJebTTj/Z7e4BK
	 WMEs1f45NTfyzqtYbEAf8VdKZ542Kzlk/wWZZT3giIkCyAK1aOKHOF5qqZZ3zoH/Fyb4A
	 pkTTYGWE91Xm4QOAMpUYFQW8HJJER3ScvaWc7xYUo7dU4LF3fo4BBKJGYwqBEcwV+MnON
	 VO+ZjuXo8nXceYgRNuUx+vm6UdDI+EpQiuvLiQjH8VtOZWDpPTGPKdhK6jJ7OTgDy6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D5mjb4Ip;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CEB606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D5mjb4Ip
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9255325e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792931342; x=1793536142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKugVXcJh0MRzQIL6MmtXefuzIWu7Uf4heR2DCrTxd4=;
        b=D5mjb4IpM8AC8A5Okq6ba66hR2VbrYbMsnkqjZipacvVi46QVJukQYf42Amb59yHX6
         XtrI0hVCVyxHR2uTNGSQNM0kvHvKIoKWteAY26thpKhp9J2iVlhKzPU+gPGDTqw3V1fW
         kFNuhDMTHcj9WXUOinDrA+HFYDU8gKHpurJr3n1ZCK+5pXMggcis7fU1tr4YJHmQCwJW
         gkYT7B9sThfijanRYoRqU8bTMEiEXcNRvTkRy/g3aSSXBqbdSMr5mF8LmmUdIrPKBQoJ
         hhriNSC+PJ8HF55UiVFwrHrAYknB1XZvUh4LjcQWdUoFkJyFj+Mbg/Ra/L/NX5QVp78F
         r4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931342; x=1793536142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKugVXcJh0MRzQIL6MmtXefuzIWu7Uf4heR2DCrTxd4=;
        b=Mbr3dvCH+yvyLwoyyHJAy9ascoebu+bBX2I+RrJ5yLHJirpmIq2icGoeI9l/N5qU6O
         rcXQmMA1PTWyrqNL2TNaURYhXYt4OGMur2GhCEtCseXmzNZtGFJllftdrNm+hmH+LmSx
         PgY06JhwBTGiLCjp6ism3Or752pRXmPbRZx144iuuKyMb3nBE+U8X105zJOw/+9pNyUo
         f/kgC9A3ObKXhOPPFttMYGGOvMz4wS9sNNWOsIXEBa2cXeaQWoCR6yFLQIwzGMKFNORJ
         41iM7iCI02e9iJnFXGZOaIOB2gtmG6199MapZXauIruQ/ruBnKNixgw/0fD9PNPuZ2HP
         cWpw==
X-Forwarded-Encrypted: i=1; AKwUvBxWNIcmy/xBMHPHpbTmfdrgfjB4rrUouAOn02wOrkgGuRvg22izdY/wflSYk131gIy44U2AFvEtSxYDisk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+/cOa5tCxWg1FQF3M7GwuAcyMfcPnWWVOk5npljmdIBy67COh
	xROQulSBk4/wIhBXxWWeegckA47f/aUL5rxxLdHvU60A6rcvV7GgKzRc
X-Gm-Gg: AYBFou26/WJ8sC+zZsv86iShNOOeA1ZKEm7PL8rVSzNRS01KXI0X7k7aIuI7ogFa2AA
	uyGPh9U5HCzn94RXAXfT6W5q1m17EliIP9iNgPRrRSq+sFlA5uszgEBkocSnRARdRohwn6V3UeU
	/tXAl4Xi7tUIth6JAZVwqrK1nyxXdMr2kzaPmVRV9shbSTc4miOfJL8QdJwMxn3HSxlvd/NyssH
	0wsnr/fK+u1NTTfuBqw+gdmQ61q8yns8TFTFfm9zLCl1gRDcz1vHEPvVfmTw3CqLKHBFAN7Zofb
	8lFPe4NcV8XYHZV3hb7kl+DRqkJ44DaZ0Q7C4VfxspIMOfomjFOyHMlILRG7ytjBNf8Ink2pvMN
	iMFiLkJmLS4ndP7XJbGKAdV4VHnbn/udIHAxtMLjROGpR20OiiEfimwP7ALowXFiIKE208O9Pp1
	3AUNUjCFsKwOE1TJneD7CIENU6eJjnZZEzSF3kVdqwBxX+hJQ+hagPmLjgcYLs9W/JNLeASXQW0
	I/VYyI4EigTE7fq76EXNBhl10td4PXOYVH7OEfS52Qsz1Yqrt8LWUqJH543
X-Received: by 2002:a05:600c:8012:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a35acbd1femr66248445e9.14.1792931341688;
        Sun, 25 Oct 2026 05:29:01 -0700 (PDT)
Received: from [10.80.0.99] ([151.95.52.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm120163895e9.14.2026.10.25.05.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 05:29:01 -0700 (PDT)
Message-ID: <6e029169-62e5-48da-91cc-8f653b2acbcc@gmail.com>
Date: Sun, 25 Oct 2026 13:29:00 +0100
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
Subject: Re: [PATCH] platform/x86: asus-wmi: Clamp keyboard backlight level
 from hotkeys
To: alex@bogusta.com, Denis Benato <denis.benato@linux.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016015117.32174-1-alex@bogusta.com>
 <f71595e8-8553-4e18-89a8-cca93cd65f56@linux.dev>
 <Lw2-T3d0vVWwlA_msvm_zjVUms821VDv_EKarQwaugY0E6UtkHDIuZ1a4UQgNeto_RnoB2xxxk43SWSepIWBSKdvKD36G1ss4G-TkuyZv4w=@bogusta.com>
Content-Language: en-US
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <Lw2-T3d0vVWwlA_msvm_zjVUms821VDv_EKarQwaugY0E6UtkHDIuZ1a4UQgNeto_RnoB2xxxk43SWSepIWBSKdvKD36G1ss4G-TkuyZv4w=@bogusta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/25/26 06:46, alex@bogusta.com wrote:
> Hi Denis, 
> thanks for the review!
>
> On Monday, October 19th, 2026 at 5:52 PM, Denis Benato <denis.benato@linux.dev> wrote:
>
>> Is the change of type really necessary? I think clamp_value does everything required already.
> Hi Denis, thanks for the reply,
>
> clamp_val() without the type change wouldn't fix the problem, as
> at level 0, led_value - 1 is an unsigned type and wraps around. clamp_val() then clamps this to 3, setting the leds to max
> brightness
>
>> Honestly I don't like the change of type... I would prefer something that prevents the
>> bad thing from happening without changing the type.
> My reasoning for int was consistency, as asus_hid_event() and
> do_kbd_led_set() already do this arithmetic as int, and the comment
> on enum led_brightness in leds.h describes it as obsolete.
>
> That said, if you prefer keeping the enum, one could avoid the
> wraparound instead with the call
>
> 	kbd_led_set_by_kbd(asus, led_value ? led_value - 1 : 0);
>
> and keep the clamp in kbd_led_set_by_kbd() for the upper bound.

I see where this is going: either math done on an enum or an int converted to an enum.

I personally like neither, but any of the two will do to get the issue solved, so... If you happen
to make another version please add a comment somewhere to outline it so nobody gets the idea of
making the code looks better at the expense of functionality. Either with that comment or not:

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Thanks,
> Alex

Best regards,
Denis Benato
