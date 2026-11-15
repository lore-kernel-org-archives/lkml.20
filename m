Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794747403;
	b=0D9xH6zdB/LsZXhWt0KpbZqQccsaK5/rWZkW2WfTxB/CC33O5xTv/jbZcYm/Ck3ex+tI
	 JzVBVfngT7rgswDbe+dmQ8jLeBQKfJPAGAhxiyMtcLaR4eJgjd3Hc6Aoz8OJEyRdhRDnm
	 P4VholugXBj+t3r8jFb/GzDaHLsGq5HQdOx3BGhj/onPqJwYsRhxby09K+qAsSyTGlQKT
	 Jx8E7I+8N+yO/1EedVszsqwbZdNR98h4Fo9aGMMSN4lbH5delO/YajmV1PsQpb4MHK4xm
	 9NqxxuBwLOgyjpXY1yM6jh5LGWZjPtWODP8+m5khUlIKrsOiHfu5nGGJgR04vnqpwOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MPjxARwbhT7wpT+NldH9sgjHxyAG1kHYfbUx4elToaA=;
	b=zzDEDCSFaSSAhTQIfHmjcHyYjWDKDopE6OcHWox9HW1nmBau4Nh2Z73NJQnyRIGA7fWQ
	 rIA4QpRcPHE/ANuiFHLrGeAhXiYQeFzQfUVLWFIb7D9NOaAVTAe4n2HlXtRTDLNXtW/p+
	 aR6GCh/ek4vBK8AUND1jVwEgDRgSoo5xFKhW8rNz/XAm0rO3YggdTxO8lIHvP9iLzEq/d
	 dgd8hLVu7F1khRqd6xnvHH+zqAd3SAj9AdwbwTuwmwMdUgPXhfLILdEjARvcmTnqFFNKV
	 LDjlSxTm1fog3Pki4WhNL+g251S1LjD0NjfuqixH5AOO7SQBH17MKGEgfykHN4mywpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIHfnajk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA14606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA14606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIHfnajk
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so951163b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794747403; cv=none;
        d=google.com; s=arc-20260327;
        b=SBrClrAEtbpLlAUoD3L7dmL4l0nZ5zZy/bIZQHhatw/KBW8886FSTZPto+YcDWtQEp
         q2Svt6zlYH0PMGuJL1yHq937DnjZcyAL6xuAa5oBMJDDqKSckglt7+z2l4LmFInJYDLV
         ockpOAyuvfECdFCnkBmUdtRQ8FqD9nDLrHwflLPPaucrewRVfXeVMW6HRc/Q7CpX5fgn
         C4BiQ83k9lhVcyzEGbK1f4XyBUo5/x+85/oo71wU3UnXbZywcWzkaoM64lPP5wzY1Mid
         QxCdurERKCJgS5ivS4nN+Z0Mqq7+hmaMe91L55541Huyfi9gbw6XsXLPU7YEfiEHUE1D
         jG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPjxARwbhT7wpT+NldH9sgjHxyAG1kHYfbUx4elToaA=;
        fh=HiAqhSyMYcwHLN3BraxEeZSTIK6tftVBEPoLhn8GREY=;
        b=ORlqq9THvuPAvwWQpRFngyqlXVPUuskAPsa68EqMR6X5tcUESm7nZCLujDoY4XU2Ta
         Y97yxfoV8DDO3YzazoGrRU3Vd85CdGka86fawwymjXl3mfomqDIgCeNVb+ShG916qhg0
         +V2nKh/ZxVDUhmUBUENgJV8PSoAmbk25aqW85znEZJhuuQz/2xYEU/FSnSF6i5tuSij3
         BY+Ipx+Mbag7XCsNBxkg0q+WF70NU09r8lLsO1Vfm/z0KcP6ap3s/nFCDPgVSEuXu60S
         iPmg2AryGeZOvJh8/IJE2MGvchwaZoBsgv4cj6sk0zGaNafDk1CNq+o8GAIL8IR92gut
         Fx5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794747403; x=1795352203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPjxARwbhT7wpT+NldH9sgjHxyAG1kHYfbUx4elToaA=;
        b=JIHfnajkwoCboS1fv2TBBmAWt9SCje39C14bfMNUah71eWfYjaT87VKc6RlzVqcHPw
         eYNpcWQm+b6idCc1SH/a4OCC/q0vZO4Mw01QBK+p9yznmlJXA//tRL+czKQ0rBbgE6nY
         8lLjLIawO0THSZCW4cQcCUIkHNRLz8ZoFGkKG8OX8nVTvJ1hEsQMTsaxyGT9yTZgwQ0a
         b1hR37QqhrTzTJaCqoYWZrbdMRHK4IXMOTPeASsN5wT1OZNdM701u3sHqlTPtK+XyPi6
         OwbSXhYh00Riv7eXcfCttV6qZ+GcCwihBZe468YDDlk1+3TQvqglMyecLDGYh87L0XPq
         +ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794747403; x=1795352203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPjxARwbhT7wpT+NldH9sgjHxyAG1kHYfbUx4elToaA=;
        b=1NQnNFYuckPALl/42G6oEXhz++b64zf2q+k0xxJvArDtbZRIV+Efa+yf1ZKFMTvs85
         uSz4skuaOF3m1a0FA0mq2sDy7Lb8tScn0q6b2laOAWAp6SFG00KMxrqH3VTzwfv/YzxA
         qQu778v4+R3NcJ188srnQLhmIcItucWP6hONC2JD08buIuKtKDvxO6wU7KlGoPMV4s//
         y0+Ya44xGXGja2d0lBvy254NPqouhpa7yOdrBzy2zP/kVwCqA8GiycPMSUZSoEc5op3h
         Gc4q4kd/9QWblO0RyPTmV2wVklF5RjNh2WwJ3NnN098AMVBbIAD6jLtMQjtyfAQbRWh7
         QBeQ==
X-Forwarded-Encrypted: i=1; AL+hErHprYvD1gi5cTdakcakDFFuA5/4S8+ncBTRRFI1O51wiiGyxzqICnSFpPxSgrjSmQm1Cdr1mkxtq3z8oak=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ktvxemV7wdbgW0Mam+FvAyJ5Md/r1ypTW2BP7kbYlhMcHJdol
	lSVuOX/KTPVY5nI6R+0/S3gVu1/LvMc6C5E6KG3OZuPNX7Upq4/R0rJhsMpJfs1r4Lj8F9kVFTz
	SyXzbWdwSKDWTpSLrlKQUr2ErURgJx1I=
X-Gm-Gg: AYBFou1YoS7x/cNZ1636fFJ3GNwgdRujK3jtQPwiW2HVSDBiWqGQ0hCoS0hP6gfLf6F
	AlHzObMwpxRh4gA7vElpDTh31Lq39T5TrM7AK7XZ/PW/QZ1j1uFQhbW6c+NlJwXvHGOjltF6CaF
	ut8trg4ykHaxvXczyJ956W6iyF+a/9dCfemmnX7YgDJ18JHjKYHylMzg4xX75t7tIJFezCD7I2z
	qaA30iVbGGYgujmLnPDUbI1r0Vty9Lj2g4FXTK/9ICgx80SpwISzHfR7CHoRxvVw7HZMW5KfCsQ
	qjEyT6nOaEp984CxlF9Y3LGpLUkAv/BuUoiMFu7Q4Dh2Cg1KAbGcR7DgfZ8ipQQyq2d4McUuaHS
	ROviz5bIl8IxRoRAg0mQ7voMKGiQUhU6HvMOZl/74TUuRvu/SOaDJaaX7k71mBuouCA4UOA==
X-Received: by 2002:a05:6a00:8011:b0:881:1c64:6723 with SMTP id
 d2e1a72fcca58-8beb6f5c1f9mr6440205b3a.37.1794747402550; Sun, 15 Nov 2026
 04:56:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110151407.789960-1-nphamcs@gmail.com> <20261110151407.789960-3-nphamcs@gmail.com>
In-Reply-To: <20261110151407.789960-3-nphamcs@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 15 Nov 2026 20:56:02 +0800
X-Gm-Features: AclHuK_5SaXrB5pmLGWhXjUHDXsOmgc2bg3dysnge6viAM7H3emnkg8TzZhuZpQ
Message-ID: <CAMgjq7A9_KRxJEA1gLO8aEuUkbQ-Wh_N3gfTqRuX7A3_Ysh4Ag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm/swap: publish cluster tables after reacquiring
 allocator locks
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	david@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, ljs@kernel.org, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, willy@infradead.org, 
	brauner@kernel.org, linux-kernel@vger.kernel.org, chrisl@kernel.org, 
	shikemeng@huaweicloud.com, youngjun.park@lge.com, sashiko-bot@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:14=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> Under memory pressure, swap_cluster_populate() can publish a table
> while its locks are dropped for a sleeping allocation. A cached
> allocator can consume and free that table before the populating
> allocator resumes, leaving the resumed scan with a NULL table.
>
>     CPU0                           CPU1
>     alloc_swap_scan_list()
>       isolate_lock_cluster()
>         swap_cluster_populate()
>           drop local/global/ci locks
>           swap_cluster_alloc_table()
>             rcu_assign_pointer(ci->table, table)
>                                    folio_alloc_swap()
>                                      swap_alloc_fast()
>                                        alloc_swap_scan_cluster()
>                                          __swap_cluster_alloc_entries()
>                                      mem_cgroup_try_charge_swap()
>                                        return -ENOMEM
>                                      swap_cache_del_folio()
>                                        __swap_cache_del_folio()
>                                          __swap_cache_do_del_folio()
>                                            __swap_cluster_free_entries()
>                                              free_cluster()
>                                                __free_cluster()
>                                                  swap_cluster_free_table(=
)
>           reacquire local/global/ci locks
>           return ci
>       alloc_swap_scan_cluster()
>         cluster_scan_range()
>           __swap_table_get()  /* NULL table */
>
> Keep the count table, cgroup table and zero bitmap private until
> swap_cluster_alloc_table() restores all allocator locks. Install them
> under the cluster lock and retain it through the scan. Initial bad-slot
> setup takes only the cluster lock because the device is unpublished.
>
> The allocator releases its locks before the sleeping allocation. A
> reclaimer that dropped ci->lock earlier can then resume and put the
> cluster back on the free list. Abandon installation if the list state
> changes or a table appears, freeing only private allocations. Restore
> locks on allocation failure too, so the caller can return a still-isolate=
d
> cluster to its free list.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/sashiko-outbox-181084@kernel.org/
> Link: https://lore.kernel.org/all/sashiko-outbox-181086@kernel.org/
> Suggested-by: Kairui Song <ryncsn@gmail.com>
> Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  mm/swapfile.c | 106 +++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 74 insertions(+), 32 deletions(-)
>

Thanks for the fix!

> @@ -825,9 +862,13 @@ static int swap_cluster_setup_bad_slot(struct swap_i=
nfo_struct *si,
>
>         ci =3D cluster_info + idx;
>         /* Need to allocate swap table first for initial bad slot marking=
. */
> -       if (!ci->count && swap_cluster_alloc_table(ci, GFP_KERNEL))
> -               return -ENOMEM;
> -       spin_lock(&ci->lock);
> +       if (!ci->count) {
> +               ret =3D swap_cluster_alloc_table(NULL, ci, GFP_KERNEL, fa=
lse);
> +               if (ret)
> +                       goto out;
> +       } else {
> +               spin_lock(&ci->lock);
> +       }
>         /* Check for duplicated bad swap slots. */
>         if (__swap_table_xchg(ci, ci_off, SWP_TB_BAD) !=3D SWP_TB_NULL) {
>                 pr_warn("Duplicated bad slot offset %d\n", offset);
> @@ -835,6 +876,7 @@ static int swap_cluster_setup_bad_slot(struct swap_in=
fo_struct *si,
>         } else {
>                 ci->count++;
>         }
> +out:
>         spin_unlock(&ci->lock);
>
>         WARN_ON(ci->count > SWAPFILE_CLUSTER);
> --
> 2.53.0-Meta

Acked-by: Kairui Song <kasong@tencent.com>
