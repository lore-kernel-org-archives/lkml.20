Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792694561;
	b=TyPsRjqJxSAfX5daNbAuzsdKHfCBpPAt8XxP/V9h8R5Kg1BJ9fR+3Waa22Akc9rYPQuz
	 08h600rmKUF+B8rHBcRbrUBB2qa3yVFsLQy6sytZOlgUtQoYDTr/3kaOBaS0upLv49iMK
	 mQ1cpHtH35BIo9csnGgxtjLggXfsctd5MnCOynnDVVqkedx5Z8V2oql6d9v49+41tE4Tt
	 89bnUPjBxY2Zv4DvrRL/5+ApqKQiM48yKO5cqoEzxYus+m1H0TB68qHH8zZmHH65+ZlAw
	 m+8qKXH1Dlbs1/9hbNHCsfSNZgOvaTj7w/HObsdyE7NybTp3G/NqkDoQWHxZ22djyvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IZ/uBrhQVS3DiMAnoAWQ1amBgCkO8xqm7sNIOjhR87M=;
	b=rgWpTvjDZ21577m0Y3Q9bXdx0+2F176r9rp93eapr2ABmkPmBcLJrMzjmpKESx0q5dry
	 EO0aJRvvg5aVg+czKHRIGyRytJVeZ2ecLK6YHIAfpahuESoScVgcA2K2SABKwmCy+MeuU
	 E+jllvGbFrExpigduM9TfDkGdPKiV23bIokevjmqQoW+xE3qt1Ob2XN31qRgkzwKj1h6J
	 tnY6/fXwC28WUdbLJDaCmpuiUn/KcMCs6itDc1r0nRYhPMR3Ava5C/LzPmBSFAS17qN0k
	 lDFBPFgGvM4nqOFeg1ux2+HYwnJy4zN9KsNEQqbH1XTr22dA+euUr6YpQyEt83EUoGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AjYjOo95;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00C606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B00C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AjYjOo95
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db33db4de9so10515ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792694560; cv=none;
        d=google.com; s=arc-20260327;
        b=lmX6qqyFzs08MKTkt2ZqN3X6me3Xce3DLsF8zDEb+l7GnSwEsUxEIglycvgerNvJD4
         /izqIvplzPZA/OZuTGrc9khlbqgT+B29SYm3VRqYo6fw+oS3UHyP1c+d5jdbpPY8rmPT
         bOJk28jmwoVn1EwrDwU9A8IjrImSYDSb9m/0VRqGXWR2fT/3wmblGAzamK+uxEFJpwD2
         GCPOL/8sNVj1DJK13q1wwrECr+sgYa1CCXrvffKyQnHDIh3KRKV7N+z0HA6BGJ6V9DA4
         fjP0NTVl4kthfMUis8KNPOVgcr3nyUlhJIQMbBZZ4uLHSKCxWoI0KQxOmsqWbv7jRSDC
         MVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZ/uBrhQVS3DiMAnoAWQ1amBgCkO8xqm7sNIOjhR87M=;
        fh=hsuSLqfOT4g8rX42QCSTzh7lF+s2PccNZK4eLd6D1PA=;
        b=TcAmJC/pRC2gzMyPk7C3QGA+WrIlO0u4IvyvrXbzjBA0ofh++Uk+Mnk2/Z/hWhZ8pD
         fzDq1bgnGlcuTE+UuvN/5GQKOj917dAWXH1InjLPn9lxvBRNDB0jRFlNxoAKGngTa+3m
         HDSd99JksU0m2E8PtxqmfExWkQTtmtiTTn0Mu/sg1uEP4GDgGnfDFi1/u32sMhnUx6xK
         FHPD5+TuIKmqgkStyc2t/4bqqYwUQMvnzAALIVJgqCRhQFN+O+xXksyRd0Z77SWnWNNk
         Z+q0wRZUj1wJHUEvA10wYnYWJmCbfOR7B1pPVQbT6nu6fB/OZzgUUbOgXYa5Tr6q7kB3
         3UWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792694560; x=1793299360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZ/uBrhQVS3DiMAnoAWQ1amBgCkO8xqm7sNIOjhR87M=;
        b=AjYjOo95jj9xl9uSAdDzx0lnWrtlNBZWVfl9eonPSAZ/h1lQzGvwFUWLmI5y9N7++6
         nFHrpq9j6kdMPdO23m1pe8o+I6ytXCHDxTlI75nRCMiXl8D9WwnwLSQoHBx/3gkP+eQ9
         Ub0l1IrPaRGKNw6Z76jwymKiHpDfTwUMY77wsCTYQut7XKep0Chvd9qwb3Ote/0nFNO+
         uD5SL9oRjLepnNBGR9QKeEhpLzGIFu22sRP0R0131eZyl8P6yi1s+z1RyKaxiSHEHR+w
         aaXEbbLI49NZveiQ+EXzb40nSZWe/kGH9H9Tv68s8wOUdG5ZeQ1DxPSxJRGSIijkeX6G
         P7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694560; x=1793299360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZ/uBrhQVS3DiMAnoAWQ1amBgCkO8xqm7sNIOjhR87M=;
        b=zL/RwZk2OYzu93+2avMNBR77HiNLQzX+EFZAYtAzUBZ1hEjSI+ZW7pKZ1uYBM0M/lW
         yt994ZqSx1s5PFWdJ1hfVNSHcY8Q4xkfy1Xje2jJQypshxDMyavtD+bdkaHN7gTN5fGp
         ipouE5noF3u2HU1Dg+UqP0D3DQ7cwgj3rnzumRFGE1cVy1euPk5v0WnE/oURSfvFlaen
         yxha3siblTeAwF93HN69mwN3rIkO+EotlsaL4FUUCPstBjmW1hLXlHwdghYFJTlphfWE
         i7kytjsMVFNrS8b/BrvE0d+z6hgXTrGjn8aJsOVWjGVEqtEjX6syahByXso60UlwnVyR
         jfWA==
X-Forwarded-Encrypted: i=1; AKwUvBxVHj9+yr+zER+pSAYeE9s2Za4lw97Lald4FCSOEfEhddE93C3gl3lWhsNZkAF+wIvqHmv59Yst2RRBvTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtlczoUPe1RsLNKJvinL9+x3pvJgaHRQsbr18ymyncQcQc1jul
	IH67D8wIVMsvUUniPIBbOAZcF6DqDHjI7anbkba/IGT3Bkqs+zo2NlxZVvAxpdIKhkMNSyBmg2m
	K8ZcmQWe78ICGhGXSdeIDiocW9m9RytC+pxy5OAt6
X-Gm-Gg: AYBFou3NbVLdDAfpCBkqPnEN/mu2zs6Yrkv6UcSOFEy/j+PbZGlFQrm8qWIil4lQ3OI
	rfSS7X5DzaXxazvtCvq/Z6FeVZ2Ry95o9hLsQiU2HWd4guvS/5DEOAOE6Vyl232p2wNV88W//Dr
	h6AXk7LD9gJan1NusVMinmb7c5EuWk6cpkq/0TdUY8fhA9qUBgR9tWGbaFSUyuaJfZeGd9jFijo
	J5AWlkT7/HgS/CmAbYch0M5xfgVYko6Z/snmvvoOZttbgkdvyrJCzWybzyw+qDvMOoRgQdEChgX
	thN88xdpPy05BysTOCU8NS3YQqsvkMgJNDizAPhhtTXflnyRGYQVH4PEfFnqzJA0HbiJEKTaBPw
	B1yQ7HjmRCTFmqhJUrQtJZg6AYmbBC1JReqVfiPY2d9BuIIcfxLoFn/0IM880GYlF8t3aYLulmR
	hPlMmHW1r4VrUHHshpaZWl7CTn0qAG5TlU+jN9J0leHbc=
X-Received: by 2002:a17:903:98f:b0:2e6:12af:5b04 with SMTP id
 d9443c01a7336-2ea7c74bcb0mr574065ad.0.1792694560033; Thu, 22 Oct 2026
 11:42:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com> <20261022015712.1297331-7-alexei.starovoitov@gmail.com>
In-Reply-To: <20261022015712.1297331-7-alexei.starovoitov@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 22 Oct 2026 20:42:03 +0200
X-Gm-Features: AclHuK-4emBvKnbiUXwxsP0RzswCumffVqYk-pDdBlhbp7tQ8eLavk3E__t9lUU
Message-ID: <CAG48ez28oYxMAxJaXnYtT_8xGReS6SLC5vURw4eStWpuPsSSdg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 6/9] uprobes: Don't sleep on mmap_lock with
 dup_mmap_sem held in dup_mmap()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, peterz@infradead.org, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, oleg@redhat.com, mhiramat@kernel.org, 
	jolsa@kernel.org, akpm@linux-foundation.org, liam@infradead.org, 
	ljs@kernel.org, surenb@google.com, david@kernel.org, vbabka@kernel.org, 
	hughd@google.com, kees@kernel.org, tglx@kernel.org, x86@kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:57=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> @@ -1713,8 +1713,22 @@ __latent_entropy int dup_mmap(struct mm_struct *mm=
, struct mm_struct *oldmm)
>         LIST_HEAD(uf);
>         VMA_ITERATOR(vmi, mm, 0);
>
> -       if (mmap_write_lock_killable(oldmm))
> -               return -EINTR;
> +       /*
> +        * Take mmap_lock of oldmm and dup_mmap_sem of uprobes.
> +        * Don't sleep on one of them while holding the other.
> +        */
> +       for (;;) {
> +               if (mmap_write_lock_killable(oldmm))
> +                       return -EINTR;
> +               if (uprobe_try_start_dup_mmap())
> +                       break;
> +               mmap_write_unlock(oldmm);
> +
> +               uprobe_start_dup_mmap();
> +               if (mmap_write_trylock(oldmm))
> +                       break;
> +               uprobe_end_dup_mmap();
> +       }

I guess in practice that probably works fine, though in theory this
locking pattern could potentially lead to livelock?

Like, if two threads T1/T2 both try to acquire the locks L1 and L2
with this pattern, you could get something like:

Thread 2: lock L1
Thread 2: trylock L2 [fails due to contention by a third thread]
Thread 2: unlock L1

Thread 1: lock L1
Thread 2: lock L2
Thread 1: trylock L2 fails
Thread 2: trylock L1 fails
Thread 1: unlock L1
Thread 2: unlock L2

Thread 1: lock L2
Thread 2: lock L1
Thread 1: trylock L1 fails
Thread 2: trylock L2 fails
Thread 1: unlock L2
Thread 2: unlock L1
... and so on

In practice, it's probably fine as long as SMP cores don't run in
perfect lockstep...
