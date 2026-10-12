Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C62BD09
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796677; cv=pass; b=M4xZbx+Xjlem03EOkaLKULIMrmNCE/qKnHiMzE+hUH2j6WBT5mz3suCnDR4mhH9RVMdZ7ZLsd4rLRa86QdTNyrtmwgaPhFVl1gW59FjkdogWRpeuU0I9LRQk01gDvTgMTBEEhEDKUdBNkWe1GWPpvfYiOBzifhzfldJda6mmYes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796677; c=relaxed/simple;
	bh=zE/xMc3+fkme8U686WImZo7kXykoV74MS3mBMZEs2EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2pumt7e2/Sg+DmGvWUd0QXy4uNNQtWmldeeq+WNtv5Acql0XqkOc9t1BG7N5BfxAPfwNTzT5ty8AZHKOxfizMqfY/Ks2n8G7KsZEnzY0HiPpv/kpQaz7CX67lMXe98FFh+qOnFGj2yGGOZK27fWeWicgwcVIAzMPnu+eSZezXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vPW450Z+; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vPW450Z+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db33db4de9so47985ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796675; cv=none;
        d=google.com; s=arc-20260327;
        b=sWCe5A66MbAyS9NU5je/C1SGKg0KopHp21+CmBLtjDhQA9pHwKyWNyT0trntM1fxf7
         aaMA9wpyghiOkleI9mkEWgze5Zh0aw49BE2ECFfxBBix8NgiD3YOxGH1u2gbXVrWBP2G
         LQLGk8fP/rXKspzWdwaHfb/QaKJHMFZFkNA+fmBWDAV9GlHyLybDtjhxs1QKBHVWr1JY
         YYvxXBxMVuhX762gJO0de1gsVkxIJjs74BcnxMXUSWquG/PdTTBGau5jENqL0O//Q+vQ
         2iDLpWfZG3cuZ0CegMCEmHmLcEfhPhpTI/eQTbOymwoOoyeketrO7sSwLiSSWb1uhuap
         6smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLXlg2Zl+SnMXYI2B0PTH2g6n6WahQOBn4X4k4dpYkc=;
        fh=6TCjaPtFtKv9Jq8pXVG2r2qKyianmAtZBHKY3mkVLYQ=;
        b=ETbQy74ad9PUdcSVo2MzIDV3YOeFqe2sR8Zse+LpXranXzcve33h7xhPPxoZQWvgpu
         wxboxXGnvhQZdAy+qan+yhIr0kqqFLGvqYrUUM5mDE9FqXJ1KpxrH+0jYFJle2rfJPcF
         29tD1DBwpYKZ+DpFFatuPAqa9tYrCsvxFd5sUXqaHplEQoV4roBD+ZevpBhrYLEx9o6z
         AP+5tG2lipNjQpPFAnMMPO+3CKlIqjd7xsbU+Nj0uIN16x9p6AbWYac97PNcYBsGj4xo
         w37hYyohVCMuSMZBAUf+fhy7dH4s/Z0JywBaS92viQG2wR7HFpqAwm6OcNBuwt4LxJ3/
         zy+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791796675; x=1792401475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLXlg2Zl+SnMXYI2B0PTH2g6n6WahQOBn4X4k4dpYkc=;
        b=vPW450Z+B9+CUnKihi+dAQJVTZ4Gu2pl1G0SHqsVLVKCWln8iNw1mnRTY4f8QS1Lti
         50RR7wNTALtUf/UuP8O/pqpGsad4hajb36UpJgJLsNMiT9MYa1ipABiPtpx6iYq38rDH
         C31I2MesMLr+ykMEDWlA5v3AQeSa8Kwl3NjoeOViFRSGTHCP4FVShbfIynTVr0wtMQh0
         13eJHl/YeVDCOiv6ZH6aBaWzqwIdLKpcY0dEKyEl6iZj4TxGOfESBh5NX4v6vuax+vS7
         v9BjviJ2SCfNxwGbzY3QV0jjK7iPG3tMYTNCLnbUNRgT+Xg4+mrfd9g/+STd+/7wKmnS
         h5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796675; x=1792401475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLXlg2Zl+SnMXYI2B0PTH2g6n6WahQOBn4X4k4dpYkc=;
        b=eFRPj31w1VxRzAxhXIQrp0eOW8GiQDHXWvEqDEQ/9unKMCFr0cXYW14IdkRqQWrerM
         wkIjLCvfImrHogFqaCddbmhoSUoU/Nal5lKZv9P0HyvzAfqWvr4pXkO4zwsOfzzxWmRI
         jiYTnolUVQeVsQWQN1EMrujeZ+K22WNTwBdCvz3wkpu+m016aMgFlGfqenbXR/skCnBC
         ATYgfXmLrZf10mjVlQBMFocEIxDt/Hdq2jJsMTlG9p+ZO+OpSRD4ptRyFzXgg6gn8FPh
         LvK2KuzUL+xIoLGYAPOId0XAbGSNH2Yfs0WKMIfkTq0CDbYyHKaLjO4tLg4uG+vB9knJ
         Llcw==
X-Forwarded-Encrypted: i=1; AKwUvBy9GKvlRirEfqcY8Y00E/iEB8NzmGB5afGbSAns9vU5v9S2xSKxWEevMt3OHUOM/zpQIg/X4BZjXxHFmf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7Kcg7REtV2ZdaCFt5Ov+HvNuiu3dAfdXMXgyEPiFmPdtqnuU6
	jKVw7VA13Y5PyEk5iMrF+cWT86b4tL5T2LOayAzJZ4dB18QVmDJ4bkxFNI4FnvdSzREJHcMsNb7
	+T4prkzF2wFJTmWBEUxsFZP3zyLOZd/2ZQBnfnwCq
X-Gm-Gg: AYBFou2LBjaw3taAeykc82Ku363NX4c56f5nZIqyUAkcRxlXrnfWgcT8iBcMc3aaAsj
	CKnlPOlPBsoKuiinNg5Mrr3t7YzXqnVH14oQDX19zmxkt03B6fA2bP61FRAvXwzpNahu7AejTIe
	F8yVhHCqodFij204bbSC+YXWrY4GnQi4/RlHINTgCaOgSxC+uJzx2RbTWr+0P8SblX0fVlDASeF
	yKB/OMd217L6qTjM6Ds1CFEQFfoQ2OOdQ8IDgWgVBNTTv7AdWlrmaHQpDIeYHEciNU/DBDpEoKx
	lZNFssPGkZyiGxQWZY41b3Nq2AYCZSyKkA7nGlUZPUTJ3RDzEe47u74j
X-Received: by 2002:a17:902:cf0e:b0:2e6:f400:5655 with SMTP id
 d9443c01a7336-2e87b9c037fmr5398945ad.3.1791796674314; Mon, 12 Oct 2026
 02:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009050556.2817978-1-namjain@linux.microsoft.com>
 <MN2PR02MB6863FBC36CE4F1D6419F0E8BD4922@MN2PR02MB6863.namprd02.prod.outlook.com>
 <04d88297-1732-4761-ae82-d68c441a7156@linux.microsoft.com>
 <3f4a11ea-bbc0-4dc5-9720-3447346739cf@linux.microsoft.com>
 <CAMOZA0Ljw-DueDP3WvmtYe4x9Y_fNaptAo+3Hv8xzYHOZi9vbQ@mail.gmail.com>
 <CAMOZA0KJoS4GFrKmaGa7+qMCNktTUg-YpkzX_EoA2KfAW3iN_g@mail.gmail.com> <53b199f9-56f6-4b44-93a5-be6437fd3fc4@linux.microsoft.com>
In-Reply-To: <53b199f9-56f6-4b44-93a5-be6437fd3fc4@linux.microsoft.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 12 Oct 2026 11:17:16 +0200
X-Gm-Features: AclHuK8b7Ekjps9gFjWxZLvZacLyDyhJhw6UHMDi-KXrVX-gzw676mEw94bJiKQ
Message-ID: <CAMOZA0JrxakyxxYPu72hk-jWQpW33-0BGFkZX-n_3D+28eDuGA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] nvme-pci: yield completions under scheduler pressure
To: Naman Jain <namjain@linux.microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, changfengnan@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:19=E2=80=AFAM Naman Jain <namjain@linux.microsof=
t.com> wrote:
>
>
>
> On 10/9/2026 8:28 PM, Luigi Rizzo wrote:
> > On Fri, Oct 9, 2026 at 1:27=E2=80=AFPM Luigi Rizzo <lrizzo@google.com> =
wrote:
> >>
> >> On Fri, Oct 9, 2026 at 12:17=E2=80=AFPM Naman Jain <namjain@linux.micr=
osoft.com> wrote:
> >>>
> >>>
> >>>
> >>> On 10/9/2026 12:21 PM, Naman Jain wrote:
> >>>>
> >>>>
> >>>> On 10/9/2026 11:24 AM, Michael Kelley wrote:
> >>>>> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, Octo=
ber
> >>>>> 8, 2026 10:06 PM
> >>>>>>
> >>>>>> On systems with several fast NVMe controllers, completion interrup=
ts can
> >>>>>> keep returning to the same CPUs faster than scheduled work can run=
. Each
> >>>>>> handler may drain only a small number of completions, but the comb=
ined
> >>>>>> interrupt stream can still prevent scheduler and watchdog progress=
.
> >>>>>
> >>>>> See this recent proposal [1] that sounds like it is addressing the
> >>>>> same or a
> >>>>> similar issue. And there is this [2] more global approach. It's
> >>>>> worthwhile to read
> >>>>> through the discussion on both threads. I haven't done a detailed
> >>>>> comparison
> >>>>> of either vs. your proposal.
> >>>>>
> >>>>> Michael
> >>>>>
> >>>>> [1] https://lore.kernel.org/linux-nvme/20260818033846.53790-1-
> >>>>> changfengnan@bytedance.com/
> >>>>> [2] https://lore.kernel.org/lkml/20260819124341.4185621-1-
> >>>>> lrizzo@google.com/
> >>>>>
> >>>>
> >>>>
> >>>> Thanks for sharing these Michael. I'll check more on these, and try =
it out.
> >>>>
> >>>> Regards,
> >>>> Naman
> >>>
> >>> ++ authors of these two series, for awareness and if there is some
> >>> configuration in their patches I should be trying to fix these lockup
> >>> issues.
> >>
>
> Hi Luigi,
> Thanks for looking into it.
...
> GSIM was creating gaps for individual sources, but the other NVMe
> sources sharing that CPU were filling most of them.
>
> I traced irq_handler_entry/irq_handler_exit with trace-cmd for the four
> NVMe queue vectors routed to CPU0. The test used GSIM fixed at 10 us
> with all 56 data-NVMe I/O vectors opted in.
>
> Without timer push, I recorded 37,218 NVMe handler invocations in three
> seconds. The median handler duration was about 2 us, but the median gap
> between NVMe handlers was only 4 us. The p99 gap was 872 us.

(medians are not a good metric in an environment where there might be
a lot of idle runs because a previous, delayed run already consumed all CQs=
.
You may want to look at the full distribution, I expect to see a step at so=
me
point, the exact percentile depends on how many queues share the same CPU)

Just a clarification, the pattern I expect on CPU0 is something like this
NVME0 NVME1 NVME2 NVME3 TIMER_PUSH NVME0 ...
what is "mediam gap between handlers", is it the time between NVME0 and
the next NVME0, or between any two NVMEx and NVMEy ?

> With timer push enabled, the same three-second CPU0 trace contained only
> 531 NVMe handler invocations, and the median gap increased from 4 us to
> 517 us. This confirms your diagnosis, adding one delay per additional
> source restores a real CPU-wide gap.
>
> The full QD256 workload then completed without a soft lockup or kernel
> taint. There was a significant cost, though. The delayed completions
> accumulated into much larger CQ batches:
>
>    - median NVMe handler duration increased from 2 us to 3.1 ms
>    - p99 handler duration increased from 106 us to 7.1 ms
>
> For comparison on the same workload:
>
>    fixed 10-us GSIM + timer push: 1.906M IOPS
>    adaptive GSIM + timer push:    1.712M IOPS
>    threaded NVMe IRQs:            3.165M IOPS
>    NVMe IRQ-poll fallback:        4.986M IOPS
>
> So the timer-push idea does prevent the lockup, and the trace confirms
> the multi-source gap issue. On this NVMe topology, however, delaying all
> sources creates very large completion batches, and the NVMe handler
> still drains each batch without a bound in hardirq context. That causes
> the large throughput and tail-latency cost above.

Yes, without touching the nvme handler to limit the number
of entries processed in each run, there is only so much
a generic solution like GSIM can do.
This definitely warrants some NVME-specific changes
such as those proposed by Fengnan, and they are in line
with what NAPI already does by using a bounded batch
and rescheduling the handler.

I am a bit surprised by your numbers regarding the differences with
and without timer push, so I would like to understand
the numbers better.
(As an aside, 10us is really a bit too short for GSIM delay, because
almost 50% of the time gets eaten by the context switching.
At least for an initial assessment I would start testing with a fixed 30-50=
us)

Can you clarify the following, specifically for the "full QD256 workload"
- how many vectors are sharing one interrupt CPU (the previous test says 4)=
,
  and how many interrupt CPUs are used in total ?
- From my experience (different environments), I have measured
  < 1 queue - 1 interrupt CPU - 1 user thread > saturating at 400-600KIOPS
  (I don't remember whether the bottleneck is the user or interrupt CPU).
  At those rates, 256 outstanding entries may take some 500us to be process=
ed.
  so it seems strange that the median NVME handler (per queue?) takes 3ms.
- these times will be scaled down if each drive uses many queues so the
  average throughput per queue will be lower, and such to keep the total
  rate for each interrupt CPU below its 400K cap.

My expectations is something along these lines:
- the outstanding CQ queue cannot exceed QD ie 256 in your test
- worst case each handler should run at most some 500us
- four queues will create a total QD=3D1024 so the interrupt CPU
  will take at least 2ms to drain them

cheers
luigi
