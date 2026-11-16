Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815266;
	b=EQI+TExe49QpVJYJnd7hpZY9z/vh+twOVnZWSkildDOKDkwcl4KaljQVaZlRnn7L54Kf
	 Z+lD2u2Y6cZ9HF8WWAJ8/OV8xWvqAKun/MVRXn7dBDm7QIq6qjTSiWl3nh2lkITwy7lpI
	 R8nGBmJx+jq6td9QKXUTuh8600IcX0oOojqHJwLCgzW1l3HilTh2rGpJO1h4Mxh5iH80u
	 sltEPqtXvd9HV4tmI7QqomRElD08LmksI/vQWgFJvBL+oGYjxCtFbyS6to7jcwTz/Kb49
	 GER5hwsEfPkAPGSG0uViw/Yh58jOEHy9JbxebCizquc7BTnHJSZDAKvfDgCdcjn5ccQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815266;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L5lYApGjKPqMrWsyMrRgAHHRvopm83QOmd4lVVfjjUc=;
	b=j25B/QESCAvLcI9rEEMJneO82/JNkJUSJFCzOWQ198Iv+bFkU76ynCh+UJBiRgNrpRIp
	 /p8R9mRPNzpFHBTgGkvGRzFMFY7m3yOhprjQ1m2T2RSe/43H8zTBFGQFUxFdSQbVdMHSL
	 DPcLuZ9r7r87ZA4i6/HyZOiW1bH77A1lYFLgOtxL3omuk4Y8MB1gc3TTCggHWwe5MRCNN
	 vgsnqIZjZLn0OSJN0ArdusvbaaPJFggq9OUCH7DHBzvEmXehjvG3kBq7JG0qyo1dRL2HZ
	 fjj3BwJaMyIzYoREHRpwpZjJ7Tqnh8Or5J5Gj1QxVnqpD4goYpZiZVNVtAv7RulxOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxlMV0OZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxlMV0OZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A571F000C5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815266;
	bh=L5lYApGjKPqMrWsyMrRgAHHRvopm83QOmd4lVVfjjUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gxlMV0OZX/KvUEidAvZnU4WOmQLnazSER3rpxnedcoROUu5FE/w9DgHZkuXDMPN5c
	 ff6zZpe+1k0Krj8w/IEK1Y7nRQ6ECZ9AaqwWJl2cIOpcAfgz/0o5RrCG2FiINsOnUY
	 D/JsEvtGkl/ly/95IIhkJw2wwZGxCHTKaN9GW4vIkUT+XF6YOy0YZ0ZbK4YernjEfq
	 InkdrdKclgZrL722DtaxRHCdolN5QZOeRe+Fhms0iuY7cFcxcbssLGiuX4oDVfwCNU
	 CQjebZ1yTEowqVgeyAbd1Tw4UIT8U6PmOQLyaZ7FB0KFRNydlvvkQLHpx4qXJsRXAS
	 ET4k1fLSURGlQ==
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so785136137.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:47:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEvdLd+WxROLY+AjiTv8MBmtZlsLAf1mlWMPUXZkvHzy+PMfzIBP1E670/n47EoVIkQ0xLqsi+raPMXRKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8blZzK/mBWxR9Al8p7iMfPD5DUSawdHj/AQMN7YvZDsqY8UaJQ
	PDbmBFAJn6B2h83+HbSUX1h6y1nCArAAKPano6hurxvX+IyVDQXBL856ExzQy8kWN7aszTMC4lp
	En5zJHfzwnsnqPrXkGgg9y91hTgDhej0=
X-Received: by 2002:a05:6102:6f06:b0:7d2:7266:2c8f with SMTP id
 ada2fe7eead31-7d64d7f2269mr2150167137.23.1794815265800; Sun, 15 Nov 2026
 23:47:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116061158.333826-1-hui.zhu@linux.dev> <b6449fe5-a697-4fa4-8985-fff2e0b0ed76@linux.alibaba.com>
In-Reply-To: <b6449fe5-a697-4fa4-8985-fff2e0b0ed76@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 16 Nov 2026 15:47:33 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ztHS-6HmEFZzzua7MnnJuoK1DHr3_4uEwD+SZGN9NuAw@mail.gmail.com>
X-Gm-Features: Aa3M54oaeNsr3g1DbmW6duiSC8_BFTUsMZ61-jbI6EoY4IzgGR53A8wPlm9__vw
Message-ID: <CAGsJ_4ztHS-6HmEFZzzua7MnnJuoK1DHr3_4uEwD+SZGN9NuAw@mail.gmail.com>
Subject: Re: [PATCH v3] mm/mglru: use a smaller batch in fill/drain_evictable()
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:29=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 11/16/26 2:11 PM, Hui Zhu wrote:
> > From: Hui Zhu <zhuhui@kylinos.cn>
> >
> > lru_gen_change_state() migrates folios in batches of up to
> > MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> > keeps local interrupts off for up to about a millisecond, and CPUs
> > contending for the same lru_lock spin with interrupts disabled for
> > that long.
> >
> > The caller already drops the lock and reschedules between batches,
> > and the restart protocol does not depend on the batch size: both
> > functions make monotone progress, so a smaller batch only shortens
> > the irq-off section.  Use MIN_LRU_BATCH (64) instead, bounding it to
> > about 15us.  This is a cold path that runs once per kill-switch
> > toggle; the extra unlock/resched/relock round trips cost a few
> > percent of wall time on an otherwise idle machine.
> >
> > Same change as commit 6e9be217a3ce ("mm/mglru: use a smaller batch
> > for reclaim") made for try_to_shrink_lruvec().
> >
> > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > ---
>
> I'm fine if the small change can fix your issue in this cold path. Let's
> also see others' input. Feel free to add:
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

+1

This is a rarely used code path, and we may eventually remove it
entirely. So let's avoid over-engineering it.

Reviewed-by: Barry Song <baohua@kernel.org>
