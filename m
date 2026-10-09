Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE3E4C650B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545323; cv=pass; b=kuViNtXH0l/t2k+H86TLFNSODcUZaV4EAlbvpAUf62UW4DB+edsrj1dojbnEhi2rgjJAJH4/jD7TARE3/pJANGfOYzZTg0HPSGFkUpk9t1ROQ0m3alDlOJ7jfgnIqv1G2y9dTtV9f6dtjxZiPjDAZ0Dq2/uZpQOhn/CVSwEFK+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545323; c=relaxed/simple;
	bh=u/p/0JZR2McKImKLOvzu+CckfUo7KtjVVtwmdCUEiC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNz7Cw440Rui3T398fzJqC1ZGg3BE7n0WuqHPlReag0BJmM9tQWVj18K8BR6aY4GBHN7dWE4+fWLQ/E9zW1nGeAEqEryXZn+CNRpiHcZ4E4rN5uPLdGYkMw6Cc9NxbP/UWDyJ6SKWyF8rqtDnaAS/y6rFLnbfooazjxQGJM3MFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L2N7QDnJ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L2N7QDnJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db33db4de9so51735ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545314; cv=none;
        d=google.com; s=arc-20260327;
        b=YSfIxqpUMq8FDCC/mb/EjvdirBYO7NOLwFGb/0HDkuoXsxk2P7AiQXR1Jj/29Wx5VB
         aMs/+vfoMMfXsEpyalevv9nFMqZFBqWyO13in7TDpQ5m5UV07zLCe8ScDTakr6bs6O63
         NoFPyC3zvV02DLZL0yoZvD3JCRAI1O2p612ZtbxmwyvJSHO2SCxQfOpZL2GcY8fjKwp1
         aWbrxFgEpmgPfox0zDbA0V1ciVmLpxsfkzuYbLgpft/xY+zlcc/VnjMCZ+CDKEg4WQzJ
         +vMYyvI6W9eS7RTkZx0Rr7rjlLkEw2IucMLQT40uj7/cFM3O9kUcWeTgM2FuBbBN7yCr
         Jzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sO6+wgHmizERNlE89bUfmYnUemgnXAS4GsjCPxo/9Xs=;
        fh=7Cxz/pojLkAwx3YuiHmZQPUXQi7Uq58mSr4c2/LeQd4=;
        b=XIF7LbuUGop8p7C8VP8zHSLS5hlj/mILMydu3aERNyaoewhBoFNitTvpbYY/3ARg+c
         9EYc04E2T98nZJOlC3PIRRwVDPcMV1TIlNOzTrpsc+oe+ztlS4lVmYfpLo3I6t7TmZVs
         1msUBC24dIGpwQ4cklpbNypU+zzFenhz40DjfKrnFtOVa0R2+cy52NlAmd9GQyd9pCaN
         LlXrqzZAZ5v7HR8Sv6iob03xN5QTfyiwuGXtdOj/1e5yQCj58W78V3EiJTjzW/K+bkFR
         4sIHvr36hj8JPiRGJBuNLA1qktdmH1IJevPJ1gzT/mO3YM1gfwXrYF4bHoPTb+3z8X1i
         pHiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791545314; x=1792150114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sO6+wgHmizERNlE89bUfmYnUemgnXAS4GsjCPxo/9Xs=;
        b=L2N7QDnJYrFNMi+8d+0I4LI9ztIVzwn6PaFld7M5tQ0fqdH2TgxjX59T+MYFDSvxt+
         0xCcx6FUUVVgv2y0kBy+MFDB6BtHftX5shgHocDqGcC8PJO7shfbz4la2Jk9plGr1xvV
         Hh+A05nL4R3vWvc0ns6B+Vk7K40FGiYnbGPcF4UGHTi7HjTIYRe0z2jz+GSQeMHHaBtZ
         W9D+mpx+m7YPpZp8gfujes0+y390NjXOaZLFo5lsk/g0WaxUX/gFAXshvEjmuSA797x+
         nblRVBD1/yz5IRvXaJ3D+YcFOseAEQpnKo2NwwGy1XPcLogqLx1SxZHS0kPocaGdZ+YQ
         +VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545314; x=1792150114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sO6+wgHmizERNlE89bUfmYnUemgnXAS4GsjCPxo/9Xs=;
        b=SSID1BQ7aPZAhOjXtPSKKnNTHrak2SeKe9gTQ0mAwkWwyd9Xuoe+8X0X86MH9XLlRU
         6iDdNmgCoX92si3/7tqVa1SNdR45V/OFjK8CtWThVBseV6uHjjfTemNWZTfsUDCe0VCB
         3Mp2FUcdS0oryWGQW0RKaK/UM79ZoutQAG6P8Jsyb/xTqibITZqR1K0IMQ6RBPMLp4xv
         vydls4gV3HZgjf1oAv1deqaA8MhlWGEyiBbKBKHWksPhswXm66lVuCoJuRm57l3pooh6
         0c/kyjrfBK2vqPld/hD7WDV5IP7dh/yB6gU3Th2vHVxhc+tcPWVrZiuzLLXAsS2YTqhb
         Ereg==
X-Forwarded-Encrypted: i=1; AKwUvBzPKXSxZ0nEREMZniDvjxKkcSETprPqc/2pWCjSvt5lVmrmiAFtBb0Qs+Roe11KGCaMR9hEZnp3xVY+J/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/HBy3gXqu1r7mBwAbzkY3WamehTII4KlaYNpnzkRS7ExOq0Ri
	fjILzmXKO4tExzGCnB/OEwg0rlcNNkFJPl87NSBBL4VOpFJoZT7Mwr4TTxCkw4QJCrb9YOiNPrQ
	jvhl5XS3IEyTcD5yXp6m4BNtTZhlHm1EZ5a2KAqgE
X-Gm-Gg: AYBFou1P7hnXaIFSFb55uFoAKnCkqH3MwyV0b4/GnfKWJJIdS5bMKj4SD1On9jVSI58
	j+d1jUBDfD6MneDTmhi3HlojzAyBNUGVJZGIHMZDhGK1OC1votRQO+5gQmWIj5XtOc7UCHhvRyi
	roXRr4FL+iFpXTFiaH8Bp3OAbITWceQtHKP/T3jtb11QMEX3Ac9QhZeNMo9XZCh9/kt+VyM6vKP
	v82xx5nuOZPhuaZA/MoRLa/GRBWSSsQ/XxqGa6ZC3pcnAABUwoxQ77reiE1vjB8kcdYPdlQG/wE
	Plq6LL3aVm5UP/QFEXkXuDLAcooqCOnizPoR7scnQuhCqIz4buLpwK4k
X-Received: by 2002:a17:902:f70b:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2e83db4bc44mr3303955ad.2.1791545313585; Fri, 09 Oct 2026
 04:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009050556.2817978-1-namjain@linux.microsoft.com>
 <MN2PR02MB6863FBC36CE4F1D6419F0E8BD4922@MN2PR02MB6863.namprd02.prod.outlook.com>
 <04d88297-1732-4761-ae82-d68c441a7156@linux.microsoft.com> <3f4a11ea-bbc0-4dc5-9720-3447346739cf@linux.microsoft.com>
In-Reply-To: <3f4a11ea-bbc0-4dc5-9720-3447346739cf@linux.microsoft.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 9 Oct 2026 13:27:57 +0200
X-Gm-Features: AclHuK9lXMeYD06lb7uudSY49mGzzzPnQZe8BJ1Av8Eu26jyJ3pnC-vn0cZ5MeA
Message-ID: <CAMOZA0Ljw-DueDP3WvmtYe4x9Y_fNaptAo+3Hv8xzYHOZi9vbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] nvme-pci: yield completions under scheduler pressure
To: Naman Jain <namjain@linux.microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, changfengnan@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 12:17=E2=80=AFPM Naman Jain <namjain@linux.microsoft=
.com> wrote:
>
>
>
> On 10/9/2026 12:21 PM, Naman Jain wrote:
> >
> >
> > On 10/9/2026 11:24 AM, Michael Kelley wrote:
> >> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, October
> >> 8, 2026 10:06 PM
> >>>
> >>> On systems with several fast NVMe controllers, completion interrupts =
can
> >>> keep returning to the same CPUs faster than scheduled work can run. E=
ach
> >>> handler may drain only a small number of completions, but the combine=
d
> >>> interrupt stream can still prevent scheduler and watchdog progress.
> >>
> >> See this recent proposal [1] that sounds like it is addressing the
> >> same or a
> >> similar issue. And there is this [2] more global approach. It's
> >> worthwhile to read
> >> through the discussion on both threads. I haven't done a detailed
> >> comparison
> >> of either vs. your proposal.
> >>
> >> Michael
> >>
> >> [1] https://lore.kernel.org/linux-nvme/20260818033846.53790-1-
> >> changfengnan@bytedance.com/
> >> [2] https://lore.kernel.org/lkml/20260819124341.4185621-1-
> >> lrizzo@google.com/
> >>
> >
> >
> > Thanks for sharing these Michael. I'll check more on these, and try it =
out.
> >
> > Regards,
> > Naman
>
> ++ authors of these two series, for awareness and if there is some
> configuration in their patches I should be trying to fix these lockup
> issues.

I see your thorough analysis below, thanks for the details.
Is there any reason why you used nvme.use_threaded_interrupts=3D0 ?

Setting to 1 moves the work to a kernel thread and seems to be the
best way to prevent too much work in the hardirq and the soft lockup.

I am surprised that GSIM fails to prevent the soft lockup, though:
under high load the sequence of events (starting from unmoderated)
should be the following:

1. HW sends MSIx interrupt, not blocked by anything
2. SW calls handle_fasteoi_irq() --> handle_irq_event() --> ... -->
action->handler() which starts processing
3. HW possibly sends another MSIx interrupt
4. SW handle_irq_event() completes
5. SW irq_start_moderation() starts the timer, __disable_irq() and
sets IRQD_IRQ_INPROGRESS | IRQD_MODERATED
6. if #3 happened, or another HW interrupt comes before the timer expires:
  SW handle_fasteoi_irq() finds IRQD_IRQ_INPROGRESS | IRQD_MODERATED both s=
et,
  and does not call handle_irq_event(), postponing the call
7. when the timer expires, the pending interrupt is reinjected.

The above suggests that we should see some pauses between runs of
action->handler(),
at least for a single queue per CPU.

Do you have any way to look with perf and bpftrace at the CPU
processing interrupts,
to see what keeps it busy (the pause between 6 and 7 should keep it
well below 100%)
and try to verify whether the calls to hndle_irq_event() are actually space=
d
as the sequence above describes?

Having multiple interrupts on the same CPU mean that the gap
between interrupts for one can be used by others, and that may
definitely make the CPU 100% busy in hardirq.

Again to address these cases, nvme.use_threaded_interrupts=3D1 would
greatly reduce the time spent in hardirq, moving the bulk of the work to so=
ftirq
hence at least becoming interruptible.

cheers
luigi
