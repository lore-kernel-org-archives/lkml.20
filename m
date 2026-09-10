Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E093554488A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059747; cv=none; b=owE2ip/2tS/2Aw2tWaeSlkn72xCyQ9cHll6117L75P7fwV5ZbqNvwthxLgEOZXujX/J0LPZ8DvWCklpwRibFsD3stynab+vSddIwTQuueBhDBfxm4pvvgu6euclBTzMXeRkvmIGfAEVWeoanonYtlTO8UjJLnNwJHk9o4Ow7SSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059747; c=relaxed/simple;
	bh=Sq+3ZPDvtDiwDZEiPtzE5bg4NQcIOhzYCUKUumcK7+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3+u6PiOG74TSQFkuDvX5Vu0VhRYbqpO+LK+TycHHysnQ5dHk9W3ygTU+/G01dSyz7QceoTyWchJD4kHqVrO218t2wVEkmLER9oasKMEEhm++CMhydLXNUv9D21JkEZ/HdoZ/hMnoN95tX1LXc6gaCIxklqqJQgdeS+oUdlp1qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FewE3Tzc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FewE3Tzc"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2941f7229dso1462466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789059735; x=1789664535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+7YvFjPPo9k/FqxxQZH7F6PYUlcKWqkhxEgYotuD+A=;
        b=FewE3TzcVbRnYLM4SXtZVBHC/EVbfw0GLQGCRxsRB4s9negJ79ko682/XZkqJVg+/V
         XSaVx6Aeeffivd8U1HOprR2RpqC2uUx2l89KH7N+iH9U8MKrqio3+A1gcL9Q/IbArk78
         nh9Bt8wOqNsguvcwfseNIzHdh3NERUfmKQlYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059735; x=1789664535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+7YvFjPPo9k/FqxxQZH7F6PYUlcKWqkhxEgYotuD+A=;
        b=lUJkpE35xfPKHX2oNETlThhDzCtFduqUqW4xHbCc7+BTB6Kf7SyX/JauV6P9yjutCy
         vbXVMioJO2wiWTHSgoqVP+o620kvJrGtsoWXI7Tm1t74Zaq1PFb1Mr5wzIr9Id7DphGn
         IbjqC10qDImRJXH88KAI8b+KrNlExSQ1XTkwLzGmh90UiURvZQCggFWBjrWrSDLEyX6N
         E0yUTKBmlVq19357/cuVbAdC5jIDHvzsVTwlVAba0vnk8m+P/SzpwE0+c1frcGZKAclU
         u9GmMRZt4+P1mYZQ7ymFRcak96xcseXnh8azYEzqNFk8HoK8eEh+eNgBZOosvyrjQcCj
         1VBg==
X-Forwarded-Encrypted: i=1; AKwUvBzMIr82mrgXSV9UEmGT9fK41ejzWp7aTSUoiTsKZO58wIfW/BemBvs//TMsszFVP5/oHNWAcjavzkdHZRk=@vger.kernel.org
X-Gm-Message-State: AFuF++l6LUngJRWHUahEps+yz3wjsQJLcTaaS6+AX66XuhOmF9CTimrG
	iY9o314DRQS+b0owfQTUjhZjmGBmD6PCeOKMkLDkLxgsDXlkbaMYJwUlZNzmjsxHQl3ZiduD73/
	wQxQ2zw==
X-Gm-Gg: AYBFou3fQyV/lMhyQTGrAQHBxR+RQpDZGPAIwtD6Xf6hXkr6xFUFaX5JJxiWfcGV0IV
	Ixq9BWjV/4FilEAyiCQeZX44D3yJhUpmSetginYmFuyBQHufPB/7H5PSPALkVR7LStcwmuXmLJt
	iJzGvXMjK+WQ/hSJzgIeMITp+8cep6GzLLr9FKLK1sraa3vNMr3BhtHyOXKLaVO33siVuKMY7x4
	BZDh+eLwWMb48K+E4ATwHnDQmg0bUXPwUimfq02nrEG3rMuID+4E90zz4rDMf23Vepo3qnoDMNS
	F8h8aKbeEfvti0N5UJkm8WzbacWvZwL/0ju6c+0UfReJbbnTYwfmIV0QB8v6RMPxf/VuYnrMbTg
	zeXVppenVdvEsbXOjMIRbQBm1XkILG5R83kh9kUD+ke2I5dUnCBu6ocZs83Q0U4YJgytNkeTrHA
	CGQUAGrXompz+va9DCs18zJ7ujdk/3qo/bABtRmiUdBeiYyN6RFr6x+teO3BMe7LYEmqsvQR2PD
	/P1dnMhUDQIzFnZGAscaMDbDRFJLwpAbhp4dA==
X-Received: by 2002:a17:907:c313:b0:c29:4fcb:2886 with SMTP id a640c23a62f3a-c294fcb2cc1mr186320766b.39.1789059735433;
        Thu, 10 Sep 2026 10:02:15 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c294682fcfbsm144709466b.16.2026.09.10.10.01.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 10:01:59 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so612915e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5v6SWhDM2fPYqYW3qEniX7YfQt1RiYq6kBgPUOk5D91omKGC4p4AygNnrYxCBeCh4Zk/B5e+pElNHJe4=@vger.kernel.org
X-Received: by 2002:a05:6000:658:b0:484:4817:85db with SMTP id
 ffacd0b85a97d-485872b5c09mr38411439f8f.14.1789059713626; Thu, 10 Sep 2026
 10:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909224818.2177311-1-mrungta@google.com>
In-Reply-To: <20260909224818.2177311-1-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Sep 2026 10:01:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFBmq3kniULxcXNsKgY-Zrb82JfaX5uRWVewQi_tJyJw@mail.gmail.com>
X-Gm-Features: AcwNN1Xl_nzhNtJWsI6953UZiPelgeSEkWzryufpn6N_ETw7Yj-N-KcRVJNqhak
Message-ID: <CAD=FV=WFBmq3kniULxcXNsKgY-Zrb82JfaX5uRWVewQi_tJyJw@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: Add DPM watchdog to prepare/late/early/noirq/complete
 phases
To: Mayank Rungta <mrungta@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 9, 2026 at 3:48=E2=80=AFPM Mayank Rungta <mrungta@google.com> w=
rote:
>
> Extend the DPM watchdog to wrap device_prepare, device_suspend_late,
> device_suspend_noirq, device_resume_noirq, device_resume_early, and
> device_complete callbacks. If a driver hangs during these transitions,
> the watchdog will fire and dump a stack trace to help identify the
> offending driver.
>
> To prevent false-positive timeouts, the watchdog is set only after
> waiting for subordinate (during suspend) and superior (during resume)
> devices. With this change, DPM watchdog coverage is extended across all
> phases of system sleep transitions.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
> v2:
>  - Extend DPM watchdog to device_prepare and device_complete callbacks.
>  - Update commit subject and description to reflect coverage across all
>    system sleep phases.
> v1:
>  - Initial version adding DPM watchdog to late/early/noirq phases.
>
> Testing:
>  - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel wit=
h
>    DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
>    backported).
>  - Verified hang simulation in device_prepare and device_complete
>    triggers DPM watchdog panic and stack trace as expected.
>
>  drivers/base/power/main.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)

Thanks! I guess you dropped my (and Tzung-Bi's) Reviewed-by tags
because of the minor changes between v1 and v2? They look right to me,
so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
