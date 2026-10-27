Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793101878;
	b=Ot+Z6ZwgGmN8d71U5zGybFWJpFrXMMuM65MC7Nompne6YVZUJ3Kz/fkZhmaqJKFklRjv
	 UQYlv1dehGS/BFcVOMAZXXjG/Kkrs8c3ibWa39/+/bpHy9MTo/9KGdeYmxfieSHZOAdua
	 OmOzbGeXDVa6A8PMz6u3w4B9xJP84G5x3pOtACuWjwi5et5CH0yLAcOSt93UFsffDS/fG
	 ZfssaNLi+cRJL7KVdl1ojDB5PWaQXOS1jGddu5UBj3loZnxR04x/3wsv7ecH7DnlMkNn5
	 MG5RpF/sBy4dKWlXeZILS9LulwXCa2YnZ4mux+8TNjuwsyGvu/yKSDGnWR5+txl/PRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bUmrBECpx6IYHNhYlc5fazHVSIOYBwywuUSfjizohv8=;
	b=GZk1LW71XFHuwZajrTXBFpCl1SLRsLYJRtmEq0YMAA9UXPO6RIsKxrS7OSkUp7Qk4IfO
	 9rqckBjOGcZktBue5BqOYVP7jjVBAf0OrsuuWuOIUSIbbR6cSj011KTB1/U1h3ArlBAx7
	 gsh9dnWhp+BELAnLKEgFQFFrllyNtQ/6u1etGPWEuL0c8Dz0IxcWGX9Qc4cqvEu4LvQV3
	 kto78LoWvmeL0avEjlfww28UpT+Arn5z7hGhZnknk5ad9ZPUujgn7dKFrfaA3M6GF3n0g
	 bCGa9TXJexRhYg3KCsZgQCSQbJtmDLwiqkyj1fjNeGuRo9S59INtvibq7o4jBAI66qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JQ6r7idL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B16606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B16606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JQ6r7idL
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05b210703so1619307b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101877; cv=none;
        d=google.com; s=arc-20260327;
        b=qLezGiWLqtd3V8KfL4xaI0h2i9/ibqpoJj0KmE0SmtO5URp+D1DYxqiRzsgbMQXSma
         6Jr51yVgZOYuxn6Hdej5CKBIO8U7Chz+gp0QdGHYodK6IDqH/TryyX1BLWNVggCILDZN
         mCqXqV0uyIEzPOxClfyDRrDICgrM9fPuz66XiVWNGucVfbNAZfkJtYy3xg2ouICGT55P
         NmHLEIYPjomSOYZzXtjKjVwAet7VXRN2CakKqffQcvy4b+WJymkJCIvwWwkaIrxzI1bw
         R7hlQcTYXQ8V9mjm7aNY272Ny5zRqnePv9u6eKwaBXaZ5OeY5IxYsK+8rBy6jaVbmsqA
         ie/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUmrBECpx6IYHNhYlc5fazHVSIOYBwywuUSfjizohv8=;
        fh=5KHSqIlQErRTELVbjd1Zl62U+Av5N8KFZUDwlquojSg=;
        b=AEohmrog508vcmDdUrGjD6Fm8IE1tfT/BvIgQ1LBIpDZwbCvnygiwkl5kay0vZu343
         sN8AL34mZxJTIEFKTVimKZcuQ496AjX1b7FfcU4gLYi9wE5OlnnIlX+8MKx7j0RXlP7t
         LyNINKMBj1apHqf9NF9wwM9bWEH76gWjaPwFGJt6DppisYi3Us7AG5miVssS6zpTm2Vx
         y991UNl0DOGh8TaHUGjlzEVCAl1Dap01lRwUYAvlmAklNEa+JZ3scKQ8OLKcs5Bm/s+/
         2M44qx033J/m7gKwRjrTQRBksEyzdzim0L9cYwBHc/l30Aukn2Lw6VQRSEMem3J3Yo/1
         atzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101877; x=1793706677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUmrBECpx6IYHNhYlc5fazHVSIOYBwywuUSfjizohv8=;
        b=JQ6r7idLn9Z50qkJMn09+UDiGQzmbW9+4RZq4mzsCoUk9Xbc3yFQvizx+Un6PkNLWO
         kGqnSyBPImUxRi2caWb9IpN8Q1SmVPssMpllOWku5yHR0s32vfXh1STFUlr+qUeUiq2a
         akdnnxd98YS38qFxDWGFalP4HIpfOZxqhXVyHRwfzrGzh55mNfVFxSb0+/jPxGu9FSao
         Y0UzeJa153BZCE5p7Xgln+2HLlYI6CfP6Pze1/2vIfsuPORRFWfS3UFR2NPa78zjGzkV
         JxDGws6lWrvo9FFLJxJRTHNbGi7/mPFmBACeN7Z2SyB+I5TMgmhTd2416HzwOSRHU1sa
         C46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101877; x=1793706677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUmrBECpx6IYHNhYlc5fazHVSIOYBwywuUSfjizohv8=;
        b=pGdGfeOYCJGP0oNRU9FJP2qDbalDmIJEHFzVUi7WE16WdcY5gJQJrecLGe9km+QOM+
         C+vb4epLc5UF5iATVVSH1hPsT+XR5qjY4xJk0TJkc5xh9n8YNusf60ipbx7EPlM1+joI
         +wf45gdoYJ96REzQmn9yoBX+pn0EinJgEYTgRjJfzzJdwUcMUf/Ezse/XbNYKxLCADzQ
         Td7IAPKG0n5HLNWl0O729EW3zAxr7azl8D/NMm+SqvEMJWpwjYvl/2OLHiUL743aT7dx
         J1N8ejFt9hsYFSmwrneVJFEpetjucZj+mvZq8ztGIMVKudIRd0phTM3TyE80OTrcZloN
         742g==
X-Forwarded-Encrypted: i=1; AKwUvByxmsQmKX7pTYHeKOiYARw13SpJETDclf0223F32F2/+xJ4TXsCLV+6YwxCqCCQ8HbtBhwJa9xlseefCaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7hA+NvgeRieYbVAhEhP7ikR0WKRz7ijHyR1h9eNwNepkAAkjv
	YVrYwRJebFo662yp6VuMROG0tXaxTwFmInBhv0GorKurjUSW4AhNfsVKadcRlr7xD6KsgfugLGO
	A3rvmPyuxdyNWiKUnuVKYqQpUVXpzwaM=
X-Gm-Gg: AYBFou1qZpXQC3qmf5KVPmQjY1ukCEmuJSz4oGbymvkDOmCzzhogtWMz6c3pBXKG3Ud
	khbP8V5xe/ihd25EuHXsKckaw7FDT0dSflczzHnvnBMWXawL/0mzk17/e0d8hsyuXNIiYnZYT4T
	FKIz7ajkxsCf/GVdZe7hXAxoAQVbOVexP8rxwaovMhnI28CpcN4Bu7CNgb61F7yymrhzy12e9v4
	gWfFpLu52GHr2PzCfBryab4rTogfKMkacy3qE93IpWEaiOaBh9qGnIZevjeATAN23U8u6CZnIgv
	/raHkefezU7SfaUwAQWfvKc5JcXtrYQtJ5CnFOCu4wUlFARxFlCYQS/KvgvPdHA9CRdkfzzN6WU
	/+S8lTCAtcLoaSgcxrtrfM1D3zNy5ltPkww9hsj2dZsKjwyG9igyjCFxRVIzm/ghWX/e8gA==
X-Received: by 2002:a05:6a00:3a1c:b0:8a2:753f:678c with SMTP id
 d2e1a72fcca58-8a367a36c76mr7405483b3a.16.1793101876780; Tue, 27 Oct 2026
 04:51:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ar2YlFYjYUZ49ZA5@chrisdown.name> <at9kJwdGkHPsWwgG@chrisdown.name>
In-Reply-To: <at9kJwdGkHPsWwgG@chrisdown.name>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 27 Oct 2026 19:50:37 +0800
X-Gm-Features: AclHuK9w3cu477cLAvN2jZ5u1J4X0qRFiJaPiVLgSpXQ2zVF3SsFLR12fIJNRmM
Message-ID: <CAMgjq7BG-hM84bS4yRs1Bpo8=vhq1yoJPxkNpkvUhX7xCit5Pw@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Make swapoff interruptible when unusing mms/shmem
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Vineeth Pillai <vineeth@bitbyteword.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Kelley Nielsen <kelleynnn@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 10:35=E2=80=AFPM Chris Down <chris@chrisdown.name> =
wrote:
>
> try_to_unuse() only checks for a pending signal between mms, and
> shmem_unuse() doesn't check at all. That means that once swapoff gets to
> a process or a shmem file with a lot swapped out, nothing can interrupt
> it until every last page of it has been read back in.
>
> Just as one example of where this can concretely show up, freezing tasks
> for suspend or hibernation has to wait for swapoff to notice the
> freezer's fake signal, and gives up after freeze_timeout_msecs (20
> seconds by default).
>
> Here's a facetious example where one swaps out 2GiB of one process to a
> swap file on ext4, starts swapoff, and half a second later tries to
> freeze with pm_test=3Dfreezer. Writing to /sys/power/state then fails wit=
h
> EBUSY and this in dmesg:
>
>     Freezing user space processes failed after 20.003 seconds (1 tasks re=
fusing to freeze, wq_busy=3D0):
>     task:swapoff         state:D stack:0     pid:3175  tgid:3175  ppid:29=
55   task_flags:0x400100 flags:0x00000419
>     Call trace:
>      [...]
>      io_schedule+0x44/0x70
>      folio_wait_bit_common+0x1ec/0x3d0
>      __folio_lock+0x24/0x40
>      unuse_pte_range+0x2d0/0x348
>      unuse_vma+0x158/0x248
>      unuse_mm+0xfc/0x150
>      try_to_unuse+0x104/0x3f8
>      __do_sys_swapoff+0x220/0x5d8
>      [...]
>
> The same goes for anything else that wants swapoff to stop, like an
> admin hitting ^C in a panic, of course.
>
> Prior to commit b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> try_to_unuse() was driven by find_next_to_unuse() which checks for a
> signal before every entry, so let's restore that behaviour.
>
> Just as an example of the improvements, here's how long freezing takes
> in the same test while swapoff is happening on my computer:
>
>                       before                  after
>     400MiB anon       8.925s                  0.028s
>     400MiB shmem      1.639s                  0.003s
>     2GiB anon         failed after 20.003s    0.011s
>
> Fixes: b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> Cc: stable@vger.kernel.org
> Acked-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
> Changes in v2:
> - Return -ERESTARTSYS at both new signal checks and at the existing
>   try_to_unuse() signal exit (Baolin).
> - Request stable backporting with Cc: stable@vger.kernel.org (Andrew).
>
>  mm/shmem.c    | 4 ++++
>  mm/swapfile.c | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index fadf23f9e21e..13e0786436cd 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1742,6 +1742,10 @@ static int shmem_unuse_inode(struct inode *inode, =
unsigned int type)
>                 if (ret < 0)
>                         break;
>
> +               if (signal_pending(current)) {
> +                       ret =3D -ERESTARTSYS;
> +                       break;
> +               }
>                 start =3D indices[folio_batch_count(&fbatch) - 1];
>         } while (true);
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 254ce86fa923..0f72a5b23a3a 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2689,6 +2689,8 @@ static inline int unuse_pmd_range(struct vm_area_st=
ruct *vma, pud_t *pud,
>         pmd =3D pmd_offset(pud, addr);
>         do {
>                 cond_resched();
> +               if (signal_pending(current))
> +                       return -ERESTARTSYS;
>                 next =3D pmd_addr_end(addr, end);
>                 ret =3D unuse_pte_range(vma, pmd, addr, next, type);
>                 if (ret)
> @@ -2922,7 +2924,7 @@ static int try_to_unuse(unsigned int type)
>         if (swap_usage_in_pages(si)) {
>                 if (!signal_pending(current))
>                         goto retry;
> -               return -EINTR;
> +               return -ERESTARTSYS;
>         }

Reviewed-by: Kairui Song <kasong@tencent.com>
