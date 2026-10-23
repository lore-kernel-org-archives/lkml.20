Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723571;
	b=W9Oip8fgfXVCc4YMggWrx8CL9tl9ku4YfOj8trKruaw/rOfH12YmmWCE0q09Q/X3cdFl
	 DSY7QmqU0gMZTGYOxjX2dphEKP59cL78AySk6t2C5N0+176I9LpLgckILmqNsE8/UU4IQ
	 r82qbl+CZauZwC5lGanjBh8fmueDBf6X1SDaV4Qz+ZQ7wkM9QHXg59VDr6/UHedJQ57wA
	 QXv+mI6oHXkDcYC1mCaKeIe/e7xoKM8Ok96bwGIoNgMYmfoYdUGAfzZ2KVeqZf5RGTXly
	 Hw/LEDldjKshTr6KuCDn8v902IeScTz1BDj30rcDtXeoISaMpzzExZiM4rouXx9JT/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:User-Agent:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mGUfrpqa7ac/D5Wmgm/8ihIk1+3KDCXaORkJwBefv0o=;
	b=z3LvT/emjiiqEkNrFZb/KxrebKRgeIAZGghTSH1my89OPbwqnh24e6HJaVaEjkK/hEb0
	 Q82ZIu8iIFFHXQpOPVT/K6a2C55/k6+d4E9q3Mt6Z3u0xpyR4A6W3U+ePJW8+AATqcVFm
	 0H4XXA7lCg8E9YvD1NUXwsgV1F0F3zBchXdovbBN9iyXEwqlJRaBndYBFT0da1Q3mDrOk
	 GUJnHP8FkUlgvhSv3gtY2Pnk4POhZ6WEfdS6e6cxCoqSw9K0bbS9HwPdA9inUl01pyU2J
	 GPFLqz8u4jXv7QJUiCU9WKj2resNaiKGafIyYCqHw3ZSf52ePgg05x5rmQfLQ+nWc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IsR+U4oz;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF04606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF04606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IsR+U4oz
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso188467b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792723571; x=1793328371; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGUfrpqa7ac/D5Wmgm/8ihIk1+3KDCXaORkJwBefv0o=;
        b=IsR+U4ozEETrc6IVhw5uiSbwZPvHZGmrn7BdVFcItcu3VIOuk9t/hO78xz9bvBoWpz
         1xjLb5Jc5FkOPfnPpoh9LVZ+Vl2ysNAXi4IFD8VMCCrMwXE2tEui4Jkv+Zf2u7Su1oVY
         w/YXm/nfF19/1VmliNgWFhwPaWTZXJAtCLm57Gtk3cuTLsuMjvWorsZl7dvmGVDPDYsa
         mMehMv6a8zqSXXXwj24QN2zoQsF6N5irZhxWacoaGvzUyGDm8aoynlPQ8bKtZdOU8zOW
         EFf8OL34o9DxqGqZsGwR+jhkiMprk1U2IbR9A3gohsYbgsojxE6TWcFOajW6JgRgNq1F
         AbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723571; x=1793328371;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGUfrpqa7ac/D5Wmgm/8ihIk1+3KDCXaORkJwBefv0o=;
        b=cCstqsTe6325zDuLyEoL0NURP4ZVPQkL24riqrekq8X97KAxtUuKA7hhQjcRMwHMwj
         s/L7qlZ46hEyl548BEZ+rz+B3SE7dER9Fr3zanHa00xywHSWZ/KcYUsAXqZWWrsG/hv3
         XkmUGqFKQt8R82BB9v5gFRWEtdj3e9A141GU4Ki1lIuOY99OsIj8j+Aa/Q4e3g+QbngD
         YbOJStReP15PX5xOLK/b70V0mRKdj+nmQtKhesNlmkc5jBEnDCJCObhx1M58H/bK1FOr
         QBnYnrvIanXHtB4MHg6VqhtPfXLnQ57TMRIHg5jzhlW3jID+xmvHNpnn06ky1t/KE26s
         cKjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwggFuvW1h4KK7rTTn0GqxsHOIwq5Ld0P9VaV6U0JrIDhwxcfL+1nM/JjYHUyAV1lV1prhQ8xMvIKElcbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISYkixYb0LI6ElA1wEAtbxvTdjQHA51UhcWJRCqPQzrxVsCgn9
	rSaFdQ1a8Cy8hvboyzin+52zw1sTWoyTlXzYeYndnB3hBQIC5FRs0eR+rQdUCqFM8RI2Nz5/YpJ
	OvOZCN6+RkA==
X-Received: from pfdc25.prod.google.com ([2002:aa7:8c19:0:b0:89d:3267:4348])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3c88:b0:89e:a122:fa28
 with SMTP id d2e1a72fcca58-8a2c5e36a4amr856365b3a.12.1792723570386; Thu, 22
 Oct 2026 19:46:10 -0700 (PDT)
Date: Fri, 23 Oct 2026 02:46:09 +0000
In-Reply-To: <fa32d01cf66a6ca9818425f33bed0c96@kernel.org> (Tejun Heo's
 message of "Thu, 22 Oct 2026 14:19:01 -1000")
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022155352.1293020-1-wfelipe@google.com> <20261022155352.1293020-3-wfelipe@google.com>
 <atpzgIOeEecUN9Qu@slm.duckdns.org> <p973mrs5tkuc.fsf@wfelipe-west1.c.googlers.com>
 <fa32d01cf66a6ca9818425f33bed0c96@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Message-ID: <p973h5idt9qm.fsf@wfelipe-west1.c.googlers.com>
Subject: Re: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun, thanks for the quick feedback!

Tejun Heo <tj@kernel.org> writes:

> Hello, Wilson.
>
> On Thu, Oct 22, 2026 at 10:46:19PM +0000, Wilson Felipe Pereira wrote:
>> Why not drgn? For continuous monitoring, running drgn on every machine,
>> with vmlinux debuginfo, and memory footprint from Python/drgn, while
>> having CONFIG_PROC_KCORE available, it adds up. Having a simple file
>> interface, it can be read from an existing monitoring collector.
>>
>> Why debugfs? If sysfs is picked, not all queues are in
>> /sys/bus/workqueue/devices/. Using debugfs, a single file can include
>> all queues. If you have a suggestion, I'm open to change this series.
>
> I'm usually really skeptical when people suggest debugfs as a solution.
> If you need continuous monitoring and drgn is too heavy, this is trivial
> to do with BPF. The following bpftrace script prints the per-workqueue
> stats and needs only BTF, no DWARF debuginfo, /proc/kcore or Python:
>
>   BEGIN
>   {
>       printf("%-24s %10s %10s %12s %6s %6s %6s\n", "workqueue", "started",
>              "completed", "cpu_time_us", "active", "cmw", "mayday");
>
>       $whead = (uint64)kaddr("workqueues");
>       $wpos = (uint64)((struct list_head *)$whead)->next;
>       for ($i : 0..4096) {
>           if ($wpos == $whead) {
>               break;
>           }
>           $wq = (struct workqueue_struct *)($wpos - offsetof(struct workqueue_struct, list));
>           $started = (uint64)0; $completed = (uint64)0; $cpu = (uint64)0;
>           $cmw = (uint64)0; $mayday = (uint64)0; $active = 0;
>
>           $phead = (uint64)$wq + offsetof(struct workqueue_struct, pwqs);
>           $ppos = (uint64)((struct list_head *)$phead)->next;
>           for ($j : 0..8192) {
>               if ($ppos == $phead) {
>                   break;
>               }
>               $pwq = (struct pool_workqueue *)($ppos - offsetof(struct pool_workqueue, pwqs_node));
>               $started += $pwq->stats[PWQ_STAT_STARTED];
>               $completed += $pwq->stats[PWQ_STAT_COMPLETED];
>               $cpu += $pwq->stats[PWQ_STAT_CPU_TIME];
>               $cmw += $pwq->stats[PWQ_STAT_CM_WAKEUP];
>               $mayday += $pwq->stats[PWQ_STAT_MAYDAY];
>               $active += $pwq->nr_active;
>               $ppos = (uint64)((struct list_head *)$ppos)->next;
>           }
>
>           printf("%-24s %10lu %10lu %12lu %6d %6lu %6lu\n", $wq->name, $started,
>                  $completed, $cpu, $active, $cmw, $mayday);
>           $wpos = (uint64)((struct list_head *)$wpos)->next;
>       }
>       exit();
>   }
>

That's fair, I thought it could be useful to have a file interface
exposing these stats, but BPF/BTF is simple enough as well.

If you still think the other two patches make sense to you, I can send a
v2 without patch 2.

Thanks.
