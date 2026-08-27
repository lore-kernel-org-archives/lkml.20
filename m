Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19943B71A3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817844; cv=none; b=mlxPeF9GBfEkb4IhV+FsBJTt2elktR8yKpjdG/4A/R7A7zaTyV3wmfrCaxQzqBLk/xT0GnphEg92AlI+SALt+GaO/R5COn1o53MIJs/c8sR2LBo7DeW14yMnW4d8XWsRswBf62I3ZiwNPZ0vf9lowTHkQEpQpC8o0UXcC4kTYqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817844; c=relaxed/simple;
	bh=U/ne7Vwwm2Ro/nLxCJERZgLvcNmToul/jna6xFYVc9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik3HjCYzL7MkMJg6oHxSSEbTFurOK0ujn3aTkyEEoiCOWFC4aW61/kOaac2EjMpRJytazKg5Zzt9crfNMSqBET92miO3+eB7zA65lKpeRYZI1eUp4kjAmTP/4q7jmD3eNNCOGvZb7/OYUqcrMVRCUIUNKGBg37SofC61KQrtujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7831116a5c0so580167137.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817842; x=1788422642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+4TYQIc8vilwDiP+Ul5HZNoyTczk462mX/2B8GmUsH4=;
        b=gV1iwHWdw/kX5UKcxc9HAkcFs8cJNE67VzPGgMJDNvQDA/+Z26Lu8MjmzRfBkK6d0Y
         wKhgQndIQfH/iEQVxdOmq80PlKLoVEpFiH8jE2UJvL5SRCxgs6+H4ilJs2PFbm5DNbjp
         L2d6sElFEGB4UdkToxhAk8p6oM5+MhUT9LI5pF5SDVAI3PZzd+9KhoCIxjVZIfrKGu7W
         IQuw9Z9a8AxpDhiWrN781dsTXhuCRw31Z7ABkGQ9ROPNohxX8Jcb+/w2M8dXbc877oPO
         f/jBkkxZ3IYpLr9wXS5g7Xnk5nqAZrg/htbaKzgVcHy5mfOf3LYw3enm+D7FmpdGqF0B
         SDww==
X-Forwarded-Encrypted: i=1; AHgh+Rp0UFGEDEhJxA0j9VkV+uyOXDUIVC7tQoNHRl2udzSUaLNLiZLaFQhJ8pJSclru2rh9MPXrnzyR05NgC3I=@vger.kernel.org
X-Gm-Message-State: AFuF++mIzqpGEYg5Gfduo2HS6UlClQxLrlrN962hxJkZFiEL9f8wi3TA
	mcnSDwYBO7MbsIE1C+NHyVkb+I5vE1tDYPJu336QKT+R1KXxL+TEqM+5bmJRILja
X-Gm-Gg: AR+sD11fZ07hfvYGQ6R7TI/kV4V//BGzwG/F09vKf2Cu4m54CyVf59r/BmIBPNY+rto
	lj66sORm6+C2kziuOxhQEyhplww4yMUxN5oEAcdo+tBL+zjpnr680mBKQCMknwfoOBoM2w5/kX4
	PcEfs+NUg7SeGWk6JCnVfUb6eElgmminUMk67XQH5z0znKGvLl6ACvJ15GyI4JV/F4ZWGVlCaOt
	EP2it4mrY+HmlibTMHtXnhJSRQicNkig6JLRZKaMTUweQRPnscqAcODfi5t1daWpgsD1VgTvbJz
	Jb4wQKmJWCKvYkcwDU4jzfYJU9GbmAgvn2qSeRzW+Z/EluQ/rbPFUAx0o/HrZYEiEBH9o8sXR7Y
	z+cu0A6VNX7Q4syKHSfBYagZXwBJa3GndVCBVMAcnW91qRY2NrCDW1MuN+gD40miYToFnZ2aNra
	Ch8QmwJ/9SwCpbBHjqkVMnlygRVXdVsCAShXq54AE1zNEO+uNfuzV1TsASKEdztazbHrLm552Yb
	1iFGvIdBh61pw5TpJXyJb0NyA==
X-Received: by 2002:a05:6102:442a:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-782bfbda8eamr4112012137.1.1787817836602;
        Thu, 27 Aug 2026 01:03:56 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97ccc0f4963sm2290667241.12.2026.08.27.01.03.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:03:56 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-77bf892b496so562340137.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrswRx5GRGZATxLMTystNdj27+bfPC59rQPB+UcjyjQls7iwrWjL9YuSRd7MQdg1n/awTBYeL0MLgtpC/M=@vger.kernel.org
X-Received: by 2002:a05:6102:148e:b0:77f:7df:c9ef with SMTP id
 ada2fe7eead31-782bcc38b76mr4507464137.0.1787817831291; Thu, 27 Aug 2026
 01:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827002812.2457475-1-lijun01@kylinos.cn>
In-Reply-To: <20260827002812.2457475-1-lijun01@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 10:03:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJjDbybtNqGRc79Apg3wO_gzQ7gTMJQ210gSLZKiGv=g@mail.gmail.com>
X-Gm-Features: AcwNN1VpKrqUcM21IPgkBoxzGueO-C9AhoHe2t_EeOEVtQHjMlc6iArvc3aDs94
Message-ID: <CAMuHMdUJjDbybtNqGRc79Apg3wO_gzQ7gTMJQ210gSLZKiGv=g@mail.gmail.com>
Subject: Re: [PATCH v6] auxdisplay: arm-charlcd: Use DEFINE_SIMPLE_DEV_PM_OPS
 for power management
To: Li Jun <lijun01@kylinos.cn>
Cc: andy@kernel.org, fourier.thomas@gmail.com, bhelgaas@google.com, 
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 02:28, Li Jun <lijun01@kylinos.cn> wrote:
> Replace the manually defined dev_pm_ops structure with the
> DEFINE_SIMPLE_DEV_PM_OPS macro to simplify the power management
> code, pm_sleep_ptr() to safely drop the references without
> triggering compiler warnings. This macro automatically handles
> CONFIG_PM_SLEEP configuration and generates freeze/thaw/poweroff/restore
> callbacks, reducing boilerplate code.
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
>
> ---
> Changes:
> -Replace SIMPLE_DEV_PM_OPS() in v1 v2 with DEFINE_SIMPLE_DEV_PM_OPS() for pm.
> -Corrected grammar errors in v1 v3 comment.
> -Add a description of pm_sleep_ptr() in v5.
> -Add pm_sleep_ptr(&charlcd_pm_ops) for charlcd_driver.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
