Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2873B3894
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059401; cv=pass; b=dxf4sYAFNx3C23AK+I1mbUjPizCJpKcZcB+8utA7vC2Ff7T39hKg8kss0IT2oCTyjA/2QRQyd9QVAi//G/Hm6FiJDwkLKFck1cgAXF/uysB8gZN2Y5YywupduqgHy4LWQSlu6QOXwFPMLM5dtqgYsU3KtPxOopU9srwvGcFhVbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059401; c=relaxed/simple;
	bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5YTlcMcXlceNTfjjCLY9Bj+cNHsnjNWkfnv66UowjLg+m2UJpu6bdVjMtDvV+OMAuUo/jiQe9LWaRnkn62y4mSEPy299Nfuk6d7Ii8i9tb9bEIlW+3ySSdgRH20VtED+c50Bgk0GjIdbW2epyQKb4Uo8GSS7E6gyKw6OZ314A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxY3U167; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxY3U167"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1197599e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059397; cv=none;
        d=google.com; s=arc-20260327;
        b=MMvstu8VYtXKtj6mowOnVo3fQ6u6D8Rv47K2KuvaHe4QX0jirL3q034d42qvtqn2i1
         /14ix5aazvT00grTBWMMEIkUOmTkwW7OoveswhOS8vjarzFyAsoi4j53Yoxq6ztWGF6S
         2uHvC99qMiDe634QgmDyYD52h/8rM1qQFSjdACGo4psOrHbUutXkmMBw+Cu3gX0P4DXJ
         V4Nx1wgvrArgPHp4mYETzDHvw4yP6poNtNxB0DH+5AlVtfn7ucuNyHMyr5F8KwErQ1FJ
         JfPD8RVQd/xVDQi/hPNh0/FXCovnSNeSzkkwTqF6I4lkDhQWx/7pa9LxK4s0nvrfZVn7
         8fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        fh=tdwWKH40OqmjeBNaTZ6LDcxihuoh9/q9EubhwZWognk=;
        b=nb7qT4dPINfG1iGVQSkIk3klRuJ2biwnKUWxh7IHEnOPe6YqybGk4dLdSc0IDUnopj
         C+D4ncXFis2Xg96SVeZFao505HwcDhqPmzFwN9YRdusnTDC523WjU/sgaMJHYITZ+QQa
         d+sFeyuGQcUNY9M2UBZcYAGrH6EyG/PyvMkwfe2OwrE1jXYkdgdkIfJU2xdSQ78PEiHA
         ew+gta9U1SwOUYc5GI5CTbpTAX8oHgEsSDOf8mdvuws6TB/BDhKUVU+GGnA6NmHgWbmO
         SVTKPKS9qIaA2ADMWUovy7/6zJE5iZFmbe2w4K7u0F6Uk1s9qXMCOcx1wTLCKpuDRhTu
         sb8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059397; x=1789664197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        b=dxY3U167tw3Blu1zgBWr4m3yTDj1d9H2F5/4ohkb8wBPvrQpgpAbv3rClChx7vM2Mc
         IdFbrf/0iEw2qgxwX8h5mRZssd3hJ/cuG20fVRJ7L1CmBjkhl4YYfIuEJo7z7eCGipHO
         iPUFTrPRtE5lskd0wg8UUSCzZinHgPl5r9eOUCNDNifPykNivRGFet4vXBOyHRuDsmYK
         +7H+Vr5UYoPD8JGFg/Kr6C2qgIpsOqXR1/1agOe12a4ELBgePEB9aT1lazw9Y+OQqO1/
         GmQHcSOaHZ5VdJ75d05TDBx3BTttil1MALWHpQdKNh6rCUxAAWB+OZ6OJOUNeFFaqqxA
         o6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059397; x=1789664197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        b=Mwp3S3wCces4NHvrKirkDfxxUJ+VcBZpo9+7sIIh/2lu36LkOJQjWRDeU4t0eHZGKO
         yFNEBM37EHHo+GjS5Z26zHVmcY71CJrlyhOsMCN7KYUIJS8JlnQOQs0XzG+D3ZzNE1Y6
         rarXW7EnXsEEictr/c3+aR3wf/Mpa7NiqeC+j1jw1bVQr6FODCOAzaGqK2IofE5TCebf
         qqd32LvUbY0cTXa83pdRFMW5o+dHH8CPE2/C3L7HxQCNJBwAcGykflw2Loj5BZVUsQIZ
         oQkbQXMMSyp2L8rQbuqhq9JDTDSbwsimj4TqTqdE8FH+3fHfkOAcoz0Umb+peZ0JzUCc
         Z8zw==
X-Forwarded-Encrypted: i=1; AKwUvBy6Wyqh8YTvhcX4wnjsaeRtqsdpnEBA2k+QOZq6MEFcGIHuae3mxbQJqPrdY3nhBmQVgp352nHBuk5rtA4=@vger.kernel.org
X-Gm-Message-State: AFuF++kv2xEQNp7ShINniqri/tm+M2RaiERHef2mfT7UNwPAH1ofL3+1
	2cPBW+w8vqMEFfbd0kJBl0mApq71aoEkk4YuL2vGWho2wZ1w2jSaxhXYlXyr7CPAQQKqAKhcoBh
	ftHifB0x1WBOh1LJ+xFZ/1pjDLFKHQpM=
X-Gm-Gg: AYBFou1VNDYKS4bvO4M59FPbpwy31A0t0BJlyHXmhQD6Mf/JOkwYM2A1V6muchZG47W
	PGdhBQu1+8lJquy+Woh45/wPAZEHHTtJ/MaFI0BJBK/V8dkxEyzVUH+k9roe0oKSPuc/dcfXo48
	5MxdYsL4+aZUXVJ6Y04d0wViXBxi39lAVT4qJa+sti/uvZcfbdEFcvKgdyoPEM2zKMtCdSqRmCN
	qNsloxppd8KleJowp1dGzQJZNWwC9o0PFObrgX39X4wJEJRiTjiNI8uUjzfJeMEdnfo+FycdF30
	YbADqaMspqM/QCePXUkpAOwth8OSLJyelr1tZFD6jxSivCeAu//L5EDn9IkcsjCvqC157Kk0Le/
	c7u5qEemDzQ02qBY0wrhKoYxwwqAYRNVLqPl+beZLhWsu2hFh
X-Received: by 2002:a05:6512:a92:b0:5b6:1aee:95f7 with SMTP id
 2adb3069b0e04-5b89a37bf4cmr1102365e87.43.1789059396760; Thu, 10 Sep 2026
 09:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787502624.git.ahmadexp@gmail.com> <f04b85bbf71a09f372b1f248dbd2b1286a0ba903.1787502624.git.ahmadexp@gmail.com>
 <20260910123528.GA1051768@google.com>
In-Reply-To: <20260910123528.GA1051768@google.com>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Thu, 10 Sep 2026 09:56:25 -0700
X-Gm-Features: AcwNN1WQJyaMmPXUVD3vdCAdJhASvoUrxNU6PY-XwXiL3uKfg05bB7LcJcmHdc4
Message-ID: <CAOQiBWM_506kwk5Pg5HwBhHObtpWN2C0e+OducwfF6ER7ouh0g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] leds: is32fl3207: Add controller driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nam Tran <trannamatk@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Lee,

Thanks for the detailed review. I will address the cleanup points in v8:
remove the redundant led_cdev pointer, populate brightness directly in
the class device, use chip consistently, use loop-local indices, and
fix the wrapping, alignment, braces, and spacing. I will also name the
current-scaling factors and the two PWM bytes per channel, and explain
the output-disable fallback when the initial PWM latch fails.

I will drop the unsupported-property list for multicolor components.
The binding already disallows those properties on component nodes; I
will clarify that brightness, default state, and shutdown retention
belong to the group.

> Is it even architecturally possible to set brightness on a shutdown or
> disabled LED? That sounds like a bigger problem.

The guard is intended for system shutdown, rather than normal LED
unregistration. In the current LED tree, led_classdev_unregister() stops
software blinking and flushes set_brightness_work. The system shutdown
path does not call that function, and i2c_device_shutdown() calls the
driver's shutdown callback without draining LED brightness work.

A previously queued brightness callback can therefore run after our
shutdown callback. Both paths take the same controller mutex; setting
shutting_down under that lock prevents a later callback from writing
registers or changing the final retained state. This also matters when
some LEDs retain their state and the controller must remain enabled.

I will retain the guard and add a comment explaining that distinction.
This is based on inspection of the shutdown and LED-core paths, not a
hardware reproduction of the race.

Regards,
Ahmad
