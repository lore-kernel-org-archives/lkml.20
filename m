Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794539634;
	b=1eAyRsVFU78zoE54IK5kRnsxllKa5QwbPgprWp26OH7vfplYBo7aWuoEfRC9+jP3TXDz
	 F74WH0g2i+C8g6G1Dqr3hl7zVfa5ukYRkysQGjelQ5iVpAn+ezLFleEVm3Pgpr/p/VzZs
	 MvmQ2GVe+kv/NSGykmpSq2U1CPzEOiQQh+/XysaZ/33ghgmOjKCrqjZ7cViWZoCbqLTAm
	 09n3LvxDZaWH+k1rYVysSTW/GQ8hQEMriuPEDVjlxUGFEzFtNsDZvmE6ux3VTw/YnV+aX
	 D8GDpXUXZqtn3LrekQXWFx/wrPG3XoJTijyDClJwE0ToDJ+HxyrBRw+hKkZnTk+VRCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g7cNQ/YZaMN6lII1BbBbVlNBX/05rEUMzyowuYGYqyg=;
	b=thETaL4ttr/WbamcszI6VH4kAKQbKzpyHQ/EDPAtBYKU4CJU0NsQjthTtEBBhaynni8e
	 qhs9iR26BXy6q009tY6Kl50GeZ8fw3h540tgxOXEEHIwoJQSlm5wQzg/WHEL47dtBZ02q
	 vf/u+K2jX86i2d7HWTU2jA3n83xHHGQQwCQRY4ERf0dR88zSAO5uNdU1xdxD9BeI+y0Wr
	 HbqFNflWbngJGMcPX+nHN3tHDCI/r/UPPWYHsZcdL4WOWTvBNvY8SwiXNwK5pHMQTwZWV
	 P120rNDgozAJw4oscy/rcKn/LdLwHFesjqMBCJ5VSfe+jyDOlNV/4GOOBilA4BAUDZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gn1p5K4Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A2606A897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588A2606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gn1p5K4Z
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-54492d8a988so108371cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794539633; cv=none;
        d=google.com; s=arc-20260327;
        b=hsDJKNlgsh/1BjQ/LO3HdvmjtcfDrmzXN/OizEyjGaqCjqdn+havp/DAhawFFQcZ9O
         ooagf9koPDcJ1dRGPWUpJlvvrWVQ0xhT7oRN9YmrtpBtCt/fqH299Gpw6wNijsdXondg
         6s6A2xZ/0XfL2WxaDbUs+ItFbI4J1Fv+nXfp+Ud8sLjwleA7c6Q3jkGxaXRUEaYdJ2gK
         F1lDFkQdTJU1QgqagRpEP+Cjm4Ic8VdNplpksamlXCJke+jGUsyvoyF9HwDsZIEyUGn/
         luMStpuud56TsX8azycFscKpjn5eHWA68mQPN7ov4U2+T6CftsA9mw63/vMP6GkgynXw
         0ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7cNQ/YZaMN6lII1BbBbVlNBX/05rEUMzyowuYGYqyg=;
        fh=1nBUdhhLCfF/jUdMtXJdyfrlrUT/IHdr5WPvdfeceyM=;
        b=sA+U8C5qhaN0hpxYxpSjp7IFDG1fwHf5P/5DDZuZLg5ceHZSIj/Wp7yuzZAKgxAOW0
         BZi7zu0z/bYHPYwjGAAkl3hbLOdy7Mx6BkAfRwcTI60zQ5yd3AiJppwDqduYiReHiEwb
         J0OouEGz88XtmUtTojJLiDW9O5zXYg2aacgFWxH6LnWP7L7JhyEsDCf9YKelVu83j/To
         DCNlzYLWYqEjp0QSC3WeTgZ13j9g7M+pr9TAFT4YHeXCmh/fUKTG2/LEp7cuELswG+es
         tuZ97/iJfnENR087+hVO63qtvnK2sBHdJgBzMuKdnQ9gUxpQUnRXz6BDgudqstAa3kwv
         Y/BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794539633; x=1795144433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7cNQ/YZaMN6lII1BbBbVlNBX/05rEUMzyowuYGYqyg=;
        b=Gn1p5K4ZjybcWZBBKpsNTTSMgs7PxThRDQfgQEfOEVCmj7rjZFMzxAyOe12eAn4uRy
         dMB9G9gZQ0yO0ShT2+nyOe6zrVZujsiRrbUllZvwPV7O+RF/4MId0urSV/LT9gT3mHjY
         kLpBRrCyqVlxHFhV0E3x9lLST1kLZfkZsIejcuAauq5tMd5zHWrReaUkau/X1RRY9DA6
         PKUF0AEL4thaLL3OZt3e0NbmplaTq9DeHHNQK8UJAG2x3Y7y5DznRwOqQhsONw+VCwI7
         ikEJgTUyMv/+KxVnwlMkl71pe4votoT4iaoRlUtpc46QRz2lwPYxW80LgGKgvwXqL5um
         B00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794539633; x=1795144433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7cNQ/YZaMN6lII1BbBbVlNBX/05rEUMzyowuYGYqyg=;
        b=GNsrmKwO4lcpf7xlAeFaqAqlsH22KERc7J9IEMjRc6svxVTbOYT51ZM5h0nZuFXvVv
         tyu75mFbSFfCD0sbNDjsKmhUSpEnDLADfI866k1PJD9CPPZ4mr18VF4iKAEXebGiHh0z
         /VWrPnGI41HYrYlfw+fknqFRdzYLNKyq5KoKnhx/6U6AXaZZVmIT8ES8qpZ6xaVbm/a+
         GHhd1IWkNr/Dl+/eCz8i0Fl7T08VJKhpte9qfOOkLLWXSr0LxzbJHDPOpGPS42WKGc2M
         abg+RO/TwnuFgFWo7ZvlbNO44CP6NW/QNsLNqbsKwFYBER4GRC9l6T698rP5qcebkT1N
         NMfA==
X-Forwarded-Encrypted: i=1; AL+hErFBv7yMU0NTGQeRTRgTksajZqHkj60rKtpBg696CnYb8QcsKIxq2ANFM3XbUh2B9pF0C+xQ9AgR/0zegYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I2kufFKlgkR8T4rj75GdTb+e7Ak0UiJVxWG5AkLonOCsGCkBI
	xcagfPIatwMF/pfcMeBqOePJhzm4yX2k8udJgWxwZoa47sDvsGkBDvXI3f04nhuyevMgyiSCd8F
	MWcqZm7J4jNnfMV2sSA8GRPNxyCIaEbWnlzsuPBZY
X-Gm-Gg: AYBFou0M8cc9Sjv7AOujv6lSICaXlgj73dOS44A2vDhbyOHz76c+d/BRj+PvzEx2WFP
	w9Hk2PSnUWmpChjZZKCL6zMSm7xX0cMLV7bkpjXG0EaSDY788fO1x6bnP5I6N8hv5p3rVrTNLE9
	G46W0VyVQV6ep8QXXdp8NtViPylX6WRy3jd/jqM6KnLZr/jEYR0rckpWRxnm7aXrjrncIIzLL2A
	eqV413L17ADhqa6Cv4FDjQZ2MDTgJC0e7El/mWwq4aAjn+Q4qtq0cZsdvsGpkeh63MLcnaVo6gq
	wwd52dlCr8QU8yfoV/mznVML2isj5DjBKWAPJszr6Y+BZ3m9lfbjEWcMM3X5IjeGVgUL9kBxeUA
	LljlzieD3DBK2EZQmxcwRYS87D/AYVRaCDN5JSdpYnLZ5IeMo944/e5ZJUSrWqbf1nTbju9Q=
X-Received: by 2002:a05:622a:4c06:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-55b32ae7d17mr2934621cf.14.1794539632682; Thu, 12 Nov 2026
 19:13:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112140101.647-1-adrianhuang0701@gmail.com> <20261112183727.68afda9533aff699eea12cdd@linux-foundation.org>
In-Reply-To: <20261112183727.68afda9533aff699eea12cdd@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 19:13:40 -0800
X-Gm-Features: AclHuK-5_bVJBffNEkLm33nopZ4Y4fegU-viRnI-qvcSPbYgKaZRfYUy-9POop4
Message-ID: <CAJuCfpEqQQb1_UkWH50tgbdVz9KZ2anfCGWsvvoYFsnC_KHcjg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 1/1] fs/proc/task_mmu: advance seq_file
 position on interrupted VMA lookup
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:37=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 12 Nov 2026 22:01:01 +0800 "Adrian Huang (Lenovo)" <adrianhuang07=
01@gmail.com> wrote:
>
> > Commit 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under
> > per-vma lock") introduced the possibility of returning -EINTR
> > from proc_get_vma() when the VMA lookup is interrupted.
>
> OK, but what's causing the interruption?
>
> > When this happens in m_next(), proc_get_vma() returns an error
> > pointer without updating the position index. Consequently,
> > seq_read_iter() reports:
> >
> >   seq_file: buggy .next function m_next did not update position index
> >
> > The above buggy message is reproduced by the following command:
> >
> >   # stress-ng --vma 0 -t 60
>
> afaict "stress-ng -t" can send SIGALRM, but mmap_read_lock_killable()
> only responds to fatal signals.
>
> So please clarify: exactly what is causing this to happen?

Also I don't think stress-ng --vma 0 -t 60 command reads maps, smaps
or smaps_rollup files by itself but I might be mistaken. It would be
nice to get more details on how this gets reproduced.

>
>
