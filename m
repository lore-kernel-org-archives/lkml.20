Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB31230C606
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383767; cv=none; b=hZXzkgOnJRdPnChNCSrygPGK8dpyG4qIKIgwbso/pLBHIWpBKdmw9B//9CphbVBRWYLESvrKzV0M0MfB0E2BJnOlrx1OXP4IAv6fNDYHGqlK+UaK25WjuF0dBsIdlWr1m1KglwOK3I0fwN4DJg8R7gYgbTZVtVTTk6oTPhfft84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383767; c=relaxed/simple;
	bh=5y/ZJifa2iYhp1fa/YbHbuyJkaVFG1V1JiH/IvCgnms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFdDN5A6SwBkgUAkKFu/4q0uFp1nVg+NNrMs3qKzAvZja3rrplqYcZIj4b1xhR1wfDUVuK/A8uOianJ25auhhFkAcODClYBe555Io3aWVq3amKQF+YO+We8FcVDuOQTAfmh6ZmTqGhlIC1yAjJLbFgUe06ZEgYt6tg6f3iJ5g90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gP1tsOHY; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gP1tsOHY"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2740610a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788383755; x=1788988555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VULb9kS6gikSL4PV+t0LAPIQva7ggs1lcENE0RmVzBM=;
        b=gP1tsOHYWwzIT0yxB+0gC1xLo/tgYBpP2Eb7ILMTad/IxmGNnJJwrY0lno+LUteQUq
         MLdKVzGJsy5X0tK59VSPjOVAPQIZGoE0qQcSIwVpS07+NNSzI6uvinEDuTj0WKJ+Knev
         maZ5CveA8ifXf6bIAxs54eax6Vp4CAJOHb3/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788383755; x=1788988555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VULb9kS6gikSL4PV+t0LAPIQva7ggs1lcENE0RmVzBM=;
        b=plU3n8dmPnx5xe1XYgmn/GzalTm5Q7ASMkOHqcLUdWBS8x5ia+MBdIkx7L+EK88gG3
         mwXnA9mBh1minq/2DKqGrkRjSb1KPw+diUGJvZ8VANVVVZYChS70/pz4U7Wpna68Atpc
         25fuqEH7t5fZh/dGp/0rqsEM+C+/Of1ERQTb5SU3xDecSx7ooVT5tnTI74+ZuNA2+3Ea
         4w/pzYQYcou3dt170wh3VQwIoPL4jMiuby0Krg2BRt3mpVStKWXnuxoELy2mn2Ydsc0a
         OotX1s0wGAbJG7HysEkK2JrEDYfGU2NHr8fIPOHi5SrMxTLWbgzFqa9zmYJXxgevQxgw
         YwzA==
X-Forwarded-Encrypted: i=1; AKwUvBzRzjEZG8j8IfF8BQYoEkwQFtRgbb+VF2flbpOfS4/emJNGVp5snDrrY/qtbR00A+8NPJu1tzT/vhKNC+c=@vger.kernel.org
X-Gm-Message-State: AFuF++ktGv78tDr/Bvi8LWuQnhbp8U+n/46K1rpIutXFrnGtJJf+27um
	tJQjzh01XJVHLh8kWL7OnKT3qQRpgjvN06vjl8YdlyczJMX4++rlScL4aLayG/sJJvEMv8FBeBY
	aQyLRzA==
X-Gm-Gg: AYBFou3zqz7zXc8cBjCUhDrDCHV32misC+7fEiH8jdmPfvLGMsbgsFizxGtCKaVK0ha
	uLiFhWUK+KHZD1nPBV/mTEVLaTDqc7zMpXvxSfveOoXmQzaIAPxNFy3r2qidiyLWhNPBOv8KtGq
	nGAMg6rolN+QLsXUAcB0ApAPL59Sr3oaowCfyL+jXztINTkz0WxuKLPn6tbevkn+/bOP1CNaWrc
	91sGmOdwaa0rY3Vri+zL2UoEcFOCNz5QNNzXPG23tWgyfv9NRG1PybHvzdnX8juzGzVXKfAY1lR
	Jbm5Fp7AkgxtOEWduzMtpifI43fJ9YTidEtzKPc+zX7KuCALIFxSJaaBOt0MPfHB9iHJouaNPLY
	PBPNnutOAP4p590P4tiPNTTA8RQNMaTtbAYSfj80PHkwAXCaTyksgt4i7cKfxJxkhl6bxxNpLx+
	GKbnx2ZWMQeFeJKhPBPRy7ZyY8dEsf03vOHG9bHJ3Q0LHs3YbvrigSQzhjYHOs11kxfXioDKDoV
	o9DyXZsCmwlKykAqqDNAqIrS3Q=
X-Received: by 2002:a05:6402:50cb:b0:6a1:f8ad:6c0c with SMTP id 4fb4d7f45d1cf-6a682ad3f87mr4182838a12.16.1788383754719;
        Wed, 02 Sep 2026 14:15:54 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4171b25sm12212766b.14.2026.09.02.14.15.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 14:15:54 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so865125f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:15:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwk7qrFf5V/giDeGvt1xcwIjJLYlq7TZR2NZF73x5lU9v6UcmZ3/Kkuz4VOY6ryOcotHfxDlGMN3n+nTHo=@vger.kernel.org
X-Received: by 2002:a05:6000:2481:b0:484:3310:710b with SMTP id
 ffacd0b85a97d-484913bf064mr12406216f8f.23.1788383752177; Wed, 02 Sep 2026
 14:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821170648.3097673-1-mrungta@google.com> <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
In-Reply-To: <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Sep 2026 14:15:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
X-Gm-Features: AcwNN1VtZgFm4leH2DwT1nxdxS0xJOsopCt5xMdhkxv_e6dk6esNzniFp1LfiZU
Message-ID: <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Add DPM watchdog to late/early/noirq phases
To: Mayank Rungta <mrungta@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 21, 2026 at 3:37=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Aug 21, 2026 at 10:06=E2=80=AFAM Mayank Rungta <mrungta@google.co=
m> wrote:
> >
> > Extend the DPM watchdog to wrap device_suspend_late, device_suspend_noi=
rq,
> > device_resume_early, and device_resume_noirq callbacks. If a driver han=
gs
> > during these transitions, the watchdog will fire and dump a stack trace
> > to help identify the offending driver.
> >
> > To prevent false-positive timeouts, the watchdog is set only after
> > waiting for subordinate (during suspend) and superior (during resume)
> > devices.
> >
> > Signed-off-by: Mayank Rungta <mrungta@google.com>
> > ---
> > Testing:
> > - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel wi=
th
> >   DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
> >   backported).
> >
> >  drivers/base/power/main.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
>
> I reviewed this patch for Mayank before he sent it. It seems correct /
> useful to me, so I'm happy with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Since I reviewed this patch, someone pointed out to me that we should
probably also add the DPM watchdog to the "prepare" / "complete"
stages too. I know those stages are used less-often, but it still
seems like the DPM watchdog would be relevant there. Unless Rafael
chimes in and says he disagrees or that he dislikes this patch in
general, maybe you could post a v2 patch that adds that?

Thanks!

-Doug
