Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278181;
	b=EjXZe0MUluB+k3bOi1JxSudsIOrX7BASS4RK4/qsbrhq/9+jQfwfdEvseP7MGdlH0y9w
	 /hpOnMZR62dD9U/AfbW0OKCotrhsAIhx8mX0kv90R4PdXjohu6kBS6iHl7eNMpiJxV46o
	 z0afvpT0EfFLDZn/hCYchB267budd3qWLQy4kNxtYA7JG/53k8nIPMof2L/0s9ouqVuJO
	 UvEHgEw8M8C7ZuO+hkUD8tAGxEQDXPwjLw/MHPIDUsvYjKSfkWq7vWaqzRXw5jBcKizPV
	 KpTaPHJwczBj4dszpqptQlqbRC7nuPLyDBl4niCQFh+NVWUYj/GCcXxZswHIi2mUNfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I3vLkJZQD0rVpmgjfOcaWg93t6TdJv+fzjBvHDBOP/c=;
	b=e0YwVvltoakHR3P+noqt3u+Q89sUX41D6YUublD5/Ka5LHlDPhCOejrkjcwqFRzayo8L
	 +F1i9yvI+lbtbbemWveWz6/gdLtarEWq1t1bPlsy/EFAPqRQfmy1xuuI1J3cEmN2J/b6m
	 qMNsBhEnxWf3827EHrNRZo8WgWnQt2GnrEnwyMkiEkdKGlLYBvTaGZRym6Zvc+VVAPXkl
	 ilhHGrVCz1L01kCJUBzG5t4E3a23TJY239HJ3m27KW9Z4lXPWNXgAt5hbwY9avsiyMoBw
	 1upDdVa8OV5fF9v1GziA9S/OXXS8JVjAmpUtGcNZTQjbb2YECWOEa+Pm18pFkVE7H9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjnZ5oMH;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1108606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1108606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjnZ5oMH
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1100388c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278180; x=1794882980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I3vLkJZQD0rVpmgjfOcaWg93t6TdJv+fzjBvHDBOP/c=;
        b=NjnZ5oMHIPP1eMYOkel3mxmL4O+4lh4UavbGQ0x8iYv3OBu0P3R21QBlmc035MYJ1P
         ScvcDc5YjSV32zsFbIUqfQ5AE8OGXPY+J4TL24K272+Ea8f1dIUC6MYLiSpmQBaDrbYd
         IJ4pFpwrdAnQdyDk6q939qMuc3gTOsGyywSWTjysvOv8uFs1XcozEw6YiDdFnAzmODiQ
         YjEYCpl9izC3klbEchDFgsc3ppbyQrCnIra9jbB1uDPU6SieieVUVPoK/1f4uOnL8Uwm
         g68WbK8QP7kstdYvMDW+oFuODtfNDmYakQiS/8VXLuGgptyQxL1+3EGYzsgh3gBJP6I9
         kBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278180; x=1794882980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3vLkJZQD0rVpmgjfOcaWg93t6TdJv+fzjBvHDBOP/c=;
        b=KU9/ubHwEIrUDu5ZeC5tL+y0qwIWA4zl69QlXgvYYvHvoxtoO83GjdpEaNFGtI+DQj
         OfN+sSy3FOq3ZgdWN62AtumJ2/1UbS1wgbF5+8zg7VYHe5pxkGphZPXAaSDCNVZNq2jM
         pi7KmA3tEqFPnm7dy8b1r6wGIzAg8jFk8+FPMJIMV1WztLHTlIsSoAz0syWL5KXQOG6q
         FNTXGclish8wkck67SO5KQP7S6JMDjZkblDGIwj3qhk0IsobJq3a7RwGSR3UQcpCqWrV
         ufrN6xEpNTUoPv6HpRZmfaT2du3kiZO5hVK1p0nDQIs4g1IGDFVgXqiVybIvHVWF4iZU
         hFBQ==
X-Forwarded-Encrypted: i=1; AL+hErHnRGGvXpn5kg6YBhbv+IdCfLT66FC8eAUkdvPF5/cBMrJijoNWNY6doF7UiMnbbu76dbXo2EzUtdt/ybQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qoMLS8uZukvIxWqAW94JUISdxd8IKAIPFs/Rfz8johuEsq20I
	r3lW0joN9ZwW+4MXIr3Fj+pOerRIku09qXc4tnuWWpAd8fJgjGgH2ruC
X-Gm-Gg: AYBFou1D8oSM6/QrVdQc1i4a+ywGyH1q4U+XpdgwT8QqJx9DKuktCE7EYDWG2j4IyYt
	8yj3hVk7gkmw8STSWEDck8BJWsfQJbGHL/ZWp1CL5BQ8MXBF+1nKTQj9w3D4DOKIVc+BsiRNoS9
	QlS7lGCxiCVAyrQcUcfMW+ReG4f+rAYq8c59KpjReyhkSVuZQOQM1GkPxBcFEeBr65U0ILjR2rX
	A8LYH2knVl7jjkWMYdCXM8VTHgN3+QYJ8i2vY3t/y4/GklqSCSrO4ED8S+3vdjcZ8NS8ssY+iJo
	eTh8Rlc8KxPzNoZRXdNU9TwFjOHidhGr0JbM9AQXlIkGXZ5BuOkNv4f7154ucbnPbHXmlrQlBcq
	nUcMzZK5myUgWsovvvD0i2QGFlii1jhkcjvlH+bVb/+AoLg86KjcOCU2hdybCtqT6Sa0wkXWU8Z
	fa1QFvVJ9nD+dwuebnGXo7cXsDy5vstUQ5EipASXX9stcLKDCrx7x7Y6M8O+q0QHgjlQoVZB9A6
	gbesSOw+ykGFn/7w14XLfuU2Ejca42qwW2fcaLScFWlkOEjAXEI7ZimncQkBHpqdiRO09bmQ/DR
	1IzF+jsDxGCdBAbJnqPRbjB66sLBQEz7Qf/+4hXJUkmZMgAKQeV8eIQ5WjUDRTMvOOI9qw==
X-Received: by 2002:a05:7022:1717:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b3b5e6709fmr1555709c88.1.1794278179655;
        Mon, 09 Nov 2026 18:36:19 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:856b:460b:b522:14ec])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm3608596c88.7.2026.11.09.18.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:36:18 -0800 (PST)
Date: Mon, 9 Nov 2026 18:36:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yuan Yao <yaoyuan0329os@gmail.com>, Jingle Wu <jingle.wu@emc.com.tw>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Vishnu Sankar <vishnuocv@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avKBsi-E7IeUgsSY@google.com>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102130836.11863-2-yaoyuan0329os@gmail.com>

Hi Yuan,

On Mon, Nov 02, 2026 at 09:08:36PM +0800, Yuan Yao wrote:
> The new ELAN trackpoint variant id 7 is found on thinkpad
> X14 Gen1 laptop(Product Name: 21XMA006CD), it's now
> incorrectly probed as Generic or Logitech PS/2 mouse.
> 
> Add ELAN variant id 7 to match the TP_READ_ID command
> return value, probe the device as trackpoint correctly.
> 
> BEFORE:
> input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63
> 
> AFTER:
> psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware: 0xa1, buttons: 3/3
> input: TPPS/2 Elan_variant7 TrackPoint as /devices/platform/i8042/serio1/input/input65
> 
> Signed-off-by: Yuan Yao <yaoyuan0329os@gmail.com>
> ---
>  drivers/input/mouse/trackpoint.c | 2 ++
>  drivers/input/mouse/trackpoint.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> index 3bd8fdf56cd3..f46fc1665c96 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
>  	[TP_VARIANT_NXP]		= "NXP",
>  	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_Synaptics",
>  	[TP_VARIANT_SYNAPTICS]		= "Synaptics",
> +	[TP_VARIANT_ELAN_ID_7]		= "Elan_variant7"

I wonder if we really need to say "Elan_variant7" or if we should simply
say "Elan" here as well.

Jingle, is this your part? What is the difference from Elan trackpoint
reporting 0x03 as its variant? 

Thanks.

-- 
Dmitry
