Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FD93644DE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788728720; cv=pass; b=sGB/XmZ5Cn1EZPCgmpbzzTb5XWF8WgcTG63N9tgBfVlmJ0uBjb311kadEAckBt0DeuBWGNRkV84bKKg5Q5hvvD65RWJ1UjlNeh3OMc/PrlF013sKnYVVU3Xmjif4DJM3XpTwkkqti0OD60DdUdT/7/iKUGSvLAxl9b9IVnMAdiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788728720; c=relaxed/simple;
	bh=JJHf59cfk5vlCc69M8wtJL/JSKMeYLZOpA3NNCHe4hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMAG81tTEYVwfrYq/QTG4dCTjhICP+vLmdDFOSlUEopUBDbLJPRY+IPWfU0+UOSmTe4u0jaYplEPHfCrKWDW5D+200FE7bpkm0BwJPrIsS8kBdbYLAaVB4bGcAlGMcR1D2dwC1/14YSKpPwKyFRMdE5yLTttFsdwuRN7t8fHek8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyN7SpfW; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyN7SpfW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2274918e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788728717; cv=none;
        d=google.com; s=arc-20260327;
        b=Yi2IMqK3BUMaHP1sll4KeWiKKetnZNkXN9LBpNCa0fmrkKSJse5iVH0qLJGE1/30ed
         NZ8G54wSmD1eJrignyjTQm/q6GgXIYtqlWtmc2Iem5kSmBV9l4mOfIGUgGfN3Ae6fPxW
         KU1gG5VMpnPIPGGawUWykB+tJanBeoPNZ6NuDYVIvI6QeLhzuvm2FxtP/feWhCiTIJGg
         8auZk0U6IExbYg80WOnK2+E1qnbZnNgGtJm3txlQyWdJXGaBUjhijBMDuXJdg24YRmCT
         HuvgdGLiGYgRa0h7nQsZJMINxXuem7i+Z9dEqEwM1EjF9mtE176tgv39+eyfa0h99mI0
         rJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JJHf59cfk5vlCc69M8wtJL/JSKMeYLZOpA3NNCHe4hY=;
        fh=0A7cMexv/iwcY5pNjiO6fYP1WkYRwPKv4LJzdLmsyR4=;
        b=B6ddz+r0t0gX8Awc4nYUmMMm3Dx5VB+jC8ShjJY/7zcZfua1qTj6h2ANkf8G3s758B
         KyIwaWzgO+z6RqGAMmwxPB5afycHSZsycdf1QqOR64PsXBNdNiWxNMtHsUCnNgEihKyR
         1xaM7k5fixcV130QvPkba2PucEDIrIWIcsNhvF8WURvz0TkWJawI8RnMsWze0SiE7grl
         r+xbH5OrsJyIfBPNNW71L/p7L3zIPMI9LFGWTd8657ac/IpQId+LbDq5s7PaCkScQOZb
         vQwZm/1PdGYcWVjMFJ+pwKbEd6Jc6NiHliEyUkRhqoj9keNloKkzMSxGqSbwRNAxwFl3
         UPYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788728717; x=1789333517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JJHf59cfk5vlCc69M8wtJL/JSKMeYLZOpA3NNCHe4hY=;
        b=FyN7SpfW9h3+bE2nMZiuDWVATRRrWw3/o7h5822dQC2S3YC7H3gT0ScGmPKfXg4yDk
         CaIdJpQjp0WSxNbBK3PGHqq+lPLKx1tuFLRBLygSG2zcmBZbCgslicizB6T9NbrOOkaV
         bHWzywyN0MVfVPpbUWY34SWVmIAybed+z/i2nrTH1dfkEWICKZlxlp4/LIU6dIC1RlK5
         1WSZsogR2O6PaDzz5lwuJcpaRye91gfExnp5+Tbk4WGCVZQwKzQWGh9keHJZx42NNwZR
         ofShlcFPM+3JiJifM4YbIeZSupAI3ZDEjAl0wxAtnWO3J4Az8KQewbUNmefOppOkF63A
         YK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788728717; x=1789333517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJHf59cfk5vlCc69M8wtJL/JSKMeYLZOpA3NNCHe4hY=;
        b=d5+Wk195RqOT/qH+EjumEtMuOqDLgslTUc1e8oNX77XUb2huU5+Mhc6/aSCYzb7iZa
         8/wEiRma5ajUkymUIeR0GXj7RdinFZll+hIFXPV6nBmwB5s4SKiwzpkgpB9b9oBddW4V
         Os3463RO22iPbD2Fxv8v5FwAH1Lz/AMOPKAX0z7a9knHVD/FTLBxzbMIcTEyTIqsftUd
         cKOUkzMUN7Iq+LTa9wBNk4L6zMKi0Ky4iTegKDDwm/3t8b8L9SMyGe7tNjhdq4b7KwwA
         2EqHrqoRVWFMg7pkzYivEHYkeGGQsFMRGJvPSpS9djNV/grIJ946MBEdhUTHYcxvor2Y
         Q+Tg==
X-Forwarded-Encrypted: i=1; AKwUvBw6lxk0So2Pn9cXYewqj0+nCOg7Wh49k0QHZ/sWi1MBwMqlHHnpqolXb/ITajdzCHBDzpi4l3AT4bvZUbI=@vger.kernel.org
X-Gm-Message-State: AFuF++lljX4vZqCBGHfc3eLHzrY1R1XfSEsG2lcHAVRIukD87KN39euA
	rMTzZyRiPAdJltx1E/XZLC7VgzeuqCPvOWa9lKXeCyP6oRKR1n7ocS8A+J0zOtbipSTtKJVQuQJ
	Cq/Qi3Yn1CdqRgojdITjM4mFklMMyKFk=
X-Gm-Gg: AYBFou3VkYsVZoACCoS4BND3Z5PNWvUWvdkXuBIhDg1KrUrHcta/9rfdsUWvGO0hjF8
	53k14vT0dfRlFXtkuTMk9JswpwVZv2hcSwVSFT5EEkfdKB3LLBsKWXIpy8zT9MCCAc0khAt9EYq
	0KK1YVyH5XrETOLF2F8KKrKQ9VYzoBv9TXh2RczP/D8K6DUQ9fM7fH0hG+VOYLhhfnZzU3iZLTX
	riwvGvPt17sYlS9cjfJAUiKiUfrrzGtXj+ZKa5keZHPV1SJ8CzOkjaHIJFHJtJlAHVgtmzrLBas
	Uv7gp3ehOCeirNYqfq9zpeAPSIdfHLwJSbszL8PEjHENXGCi9moWI/gk7JTnARFTyo0HKcSWZkI
	1tqA=
X-Received: by 2002:a05:6512:2521:b0:5b4:9fba:dc6c with SMTP id
 2adb3069b0e04-5b616f09015mr2983243e87.15.1788728716688; Sun, 06 Sep 2026
 14:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-perf-gtk2-v7-0-1ece839fbca0@gmail.com> <CAADnVQLrga+tx0QCUkviGHqbk9Q6a7bmk3oAe51ZrLhQgRaw5Q@mail.gmail.com>
In-Reply-To: <CAADnVQLrga+tx0QCUkviGHqbk9Q6a7bmk3oAe51ZrLhQgRaw5Q@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 6 Sep 2026 17:05:04 -0400
X-Gm-Features: AcwNN1VfE32-AxkuqqKFXwQZBnRH9Q5ktj20CyevInVOMud57lXIeFkz6ak6xcc
Message-ID: <CAEdQ38EMGjp5RbvZn_RStu1=OOS3H+VT8xHFdnEaVC+dof7Thw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf tools: port UI from GTK2 to GTK4
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, LKML <linux-kernel@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 4:59=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Sep 6, 2026 at 1:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > GTK2 is long dead upstream and increasingly hard to keep building on
> > current distros. This series ports perf's GTK-based report browser to
> > GTK4 and fixes it up so it's actually loadable at runtime after the
> > port.
> >
> > Patch 1 does the mechanical port (build system, widget API changes),
> > including the leftover-GTK2-call and signal-handling fixes that were a
> > separate patch 3 in v4. Patch 2 fixes a runtime issue found after the
> > port that prevented the browser from loading. Patch 3 fixes two stack
> > buffer overflows in the hierarchy view that predate the port.
> >
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > ---
> > Changes in v7:
>
> Matt, please stop the spam.
> Wait for humans to reply before respinning.
> 7 revisions in one day is way too much.

My apologies. I figured it would actually save humans time if I went
ahead and addressed all the sashiko-generated feedback. Dunno.

Is there a way to get feedback from sashiko without mailing the public list=
?
