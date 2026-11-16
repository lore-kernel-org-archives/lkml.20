Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870995;
	b=XLABlb5GWUkEPpMmwewbRv1xJfu6mzRLh8I057/FD7/zb5WoixmbBtReffhtqDvKiCzn
	 ZoosEnb7u0mHDNqqy6WaYEHrH9vmu49APPy/Rh4RqyvuIluLwadSlHc3tGS2lafhpVWZB
	 1z0tttcWQzqzLyr2UsawGI4DwY5yr4xVaIxxTazfq8d+nN2mhntcY1fBMwZf1SA2Eq0Sw
	 sCr5M6zMmndZCvuG/8NnDFkBqQHju6opXVLkHF+A5N94OlgSSobM9qYA9iayGTyutcnmX
	 3PGjQ9IdOn82WiggHAI1Tpshwb2mI3JVIQ2+QQ97E7TiVGAQulnmcn+YPah2EW35Pyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
	b=kUOeEXkKRbazSB9z++GGZGdTONNiW2u/fjFVFbNZiq0WBiPwA5L5qWmY2pJ84u2feUCk
	 rw4s9F9P2HgRVQ3cOTei05F/V0jFbbVG/2SpGhNnlRE2DjtDok9FW9baYamavzO9X/AQJ
	 4SN7lnWvd6T/WCetmsaM+NHAskfgljvih9QnCn03pdHkpAvC6xkYfblgaKcrRWu8BT96n
	 A3twu1moemnpY6syIn8HxywZFaNa3KF0lKFynWaLsb6scOWW9+akx6+A9Gw4sNNLIzWsu
	 dBOZ+GMjCBOZ8tPBvgDW+kdNC1SEbNAUrZM+LJPKA0jBOkuY7c3eOUhOuTyODtP9vdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEJu6Vgq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8D606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B8D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEJu6Vgq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso16665415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870993; cv=none;
        d=google.com; s=arc-20260327;
        b=MvhiUyj1MnOSuiJ7WSSpJNAMOfuBJzcKwJps+qPila+pOxFUw/NUwy2i6kLiAMjbaN
         DSzfsEou7mjw7bI5JutBikOdilsNrFT9txBP2E0dc41M+rQbgOcNbWnUvIiiLdJyOQT8
         RKc8boRhbyGeHEF0TvPucc+JHDtDv8po4tBHRKSW27SOHzaGCJyfPk4qBUY3mMzdUt0d
         oaWt9p7wGKCH5IAFnBd0dYqT+EpYwsuBW5UhABtIcewn0UQRkrDqMJd3xPRCB+sNYUkl
         gLM6bVCYJ/x5NtNK/oMupVXhYkN+0xXznLty3MXImClOks6yn2Mafutf3GeY7+q+EvM5
         MOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
        fh=DgU/lxgyKemXLTXeC7EJKPZKuHZesMZK9oYWLwsUats=;
        b=OMCMb8DDnVcHWnyHRcLlnrUBGael1Uvvyw4sLEeQL3kPQldRa/sDQQ7xf1qTnGDyDG
         X66c26YLWCu+WDvin/pUYR1n9OqaEUw5ZCYeOVaqjyqibzCWF1J4GuDhATqr7KuYSAxT
         Nm6ibM4Ew5VpNDzfr7q5ZZPo6C5VLLXNoKJubIQTUeMpnGh46Y8UZwBqnCEZGx7mIXDe
         CCAF9DaPNwk0Bd9nUQY102pUkERuguS+hidwnzjDLVCYLy9NolbyYa0nFmSrYd2seG4m
         tamDb1AyBCS2AxsMrOVTewVmqpTVgMIJqRgc+wPVu6lYmOFFjHY8M/kqvVXgkehGMwaK
         ExFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870993; x=1795475793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
        b=XEJu6Vgq6a8m6xRDvNfiVqpbRzDn3rAhU/kis0zvNll3T2jFlFuwz84cvXfATuq0UT
         zfsdFxo8ypw/jilaF6CUL9GwsiXi5q+JO+E2HzoRpzHlQWY6jhkkgfh+kxJVK29dZP/v
         iGsGtC0vLmJTpgYos44CNVZlu/Qtl9kpnzt2iKaco0eY/yB1Kvv0hG9c4PX/WG8xEO6z
         63jSboaDqN1Mn32Ya0wbz2T3DlSma32ejWtuRnmI5SIC+y4LP8phhpmmBiSdMcEG4ZZV
         8UoxwrJG4h3vhGqnHtvp8cSUsPnw3XTnFyFCBjq46FS6stqN9+YMlkEwsRqBswMSgYYH
         npqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870993; x=1795475793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
        b=RXCzoB3nZPzKvgQK8GP4HoAtjke+LxkdjbxAh0Fs0x6smHhPdISEuE2YEvaTyAr2BT
         QhkZl52o3qWEpMJtZ0mmBdoV6lXuFmbPZP00t40XmzEb+9/nehqK2ClavF0nLRy9TvCU
         lx+YiVt1GUvmABTCLX7jK8ygrm/M6nLn1mi9Zo3x2wZmjUjf1CAt3BA7x9QdJWXz5W63
         PDgQd5Je+dINXoEpQrWYJ1JAQcBX49ZR7xY0x/+JTcyPxNPAyzRf/2Cw/EkHQJgrRhxK
         ExSVceG6vk5U356R9b+wdn1d4qghHMQbuMCZ1h5tqskr30psmlD0B0u3dmvdqvxQJDti
         QKEQ==
X-Forwarded-Encrypted: i=1; AL+hErE6bkyD1Qdx1zXYqVA0xQzv5ChHJTNHmmQOOy/VKWbSx3bSNm50fxw/MzQZS19etiaUb58I5i8WgrAfsYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nQs9pkpePsmFUey5+17v7TTb+qKYMieUBWzNNJzsDRg4ZsWnf
	Pmsfnba2RhN5AXNSiyWZ3saNtV2CxWY0mlmtQZOP0GTolrC4sHDDo7ziI6pquU2iOs4PFT8hS6z
	DWD2//HqnciysC+YVu5BRBoCnSxST8cydL4l97EA=
X-Gm-Gg: AYBFou1LU4imMjza7c4XYctoRVamS2SrK16OWFV+kr+k/YfMcH3ZCelLdpfq7IfaI9Y
	NopdOwnyf5BtFFm7qPYIFYWVDPPYgQ7bFE3zKUHyyuNaMUolz0y9skcgzyHB3qNstCBw/lb61nL
	YOxPnhyI35a8J3ZCb7kmLgjKobPjnpzPm+HTDUzizgnQ0432aoNUAvmZaQ8xTOKxwZcrps4GvjN
	4+0yq+cv6fDFPKteVNh919oOr7iPG3P+QC866pOAtYO3M8iy/egAtM+eX6/4VlJXIwtaxgyn2va
	Ho+rDweP3oTK8I2Ak0t937Q8yES/dDmcXe6HIDenwVbuYYdZLqAbgctI0kL89Coirl4FEfYnSQc
	0it1IOQ31GMxEwlQNF9jPP6Bn28ChIYPuzvuJCAIbyvZYhUDvmqOdhRERoQo6pckDduo742w8QM
	07pepNTjpVwHT6QEPW5FemiDqIIoM41eQu321B5KnxGIeQfs7gQPdirjDKcfnEOYhGJ098Snxao
	4A6cdA2+3ZYQqwv0sl7gMEMUgZiGqzgKSIZSga2Bh1gAB17RoPceQ==
X-Received: by 2002:a05:600c:4e8a:b0:4bb:6f77:1e35 with SMTP id
 5b1f17b1804b1-4bb6f771fe4mr107226275e9.21.1794870993011; Mon, 16 Nov 2026
 15:16:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-6-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-6-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 15:16:21 -0800
X-Gm-Features: Aa3M54qujtdf8fiCCJsTtiFZah3Fc_8gn2qGgDBUmxtzkkvPhblapjkovtVzCto
Message-ID: <CANDhNCoQteppE0ERWyz2LJ4PBLBKQymmzzbKwrxMwv1sAL4VPw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/8] sched/proxy: Clear blocked_donor when the
 donor stops donating
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> find_proxy_task() sets owner->blocked_donor to the task that donates to
> the owner. __mutex_unlock_slowpath() reads current->blocked_donor to
> hand the mutex to that task. The comment of the field says that it is
> set in schedule() and only stable under preempt_disable(). So the
> pointer is valid until the owner schedules again.
>
> But the donor can stop donating while the owner keeps running. It is
> woken, or a change of its scheduling class or of its affinity takes it
> off the runqueue. The owner keeps its blocked_donor until it schedules.
> Meanwhile the donor can run on another CPU and exit.
>
> This would be a use after free: __mutex_unlock_slowpath() would take
> the blocked_lock of a freed task. It was found by reading the code,
> and has not been reproduced. The owner must stay in the kernel without
> scheduling for as long as the donor needs to exit and be freed.
>
> Fix this by clearing rq->curr->blocked_donor when the task it points
> at is woken, or leaves the runqueue in sched_proxy_block_task() or
> move_queued_task(). The clear takes the blocked_lock of the running
> task, which the unlock path holds while it uses the pointer.
>
> Fixes: 1628b25248d0 ("sched: Add blocked_donor link to task for smarter m=
utex handoffs")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Again, I'll have to spend a bit more time looking at this one. I've
been looking at some task->blocked_donor lifetime concerns recently,
so I agree its definitely an issue.

The blocked_donor is used for mutex handoff, and whole-chain proxy
migration. The first only needs the curr->blocked_donor to be correct
and never traverses further back down the chain, where as the second
is used to migrate the entire current chain. Since the while-chain
proxy migration happens in __schedule()->find_proxy_task() where the
blocked_donor is set, it seems like clearing the blocked_donors as we
enqueue them for migration is a good idea (and cheap since we're
already iterating down the chain), and I've got a patch I'm working on
for this already.

This patch's approach of of checking and clearing curr->blocked_donor,
a task wakeup sounds reasonable, since it would prevent the mutex
handoff from potentially reaching for a task that's exited.  Using
proxy_needs_return() should ensure we catch tasks in the donor chain
on wakeup.  My only worry is that the wakeup and clearing might trip
while a proxy-chain is being migrated (and we don't want unexpected
writes breaking the chain), but I think we're ok because we hold the
rq lock as we walk blocked_donor and create the whole chain migration
list, and we shouldn't need blocked_donor after that. So, I think it
seems ok.

That said, Its not immediately obvious to me why clearing on
move_queued_task() is needed? Mostly because: why would a proxy
blocked task be migrated before wakeup? If a proxy-blocked task were
migrated away, __schedule() would just proxy migrate it back to the
current lock owner's rq.

thanks
-john
