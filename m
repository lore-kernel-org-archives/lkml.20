Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200123;
	b=v4i0DzOH5wMkPRre+ODDLPIq2KWLo6nlWKR2tRYpq1/v6k9TcfilDG1nnt8cu85zrxMM
	 Nv0XsT2oBaxoU+MuPzYf0oZsL8bfXRmDqHPoEDj2M8pSNr5t1du8Gle5xbRRkL/7jVZH2
	 fqiVHSrkbObirBqeH/WPj+o1+FkWDLjP3YX0VzXV2vGXIPwsFhCBgKAjIvxy4VMxBcP6+
	 U08N90PxfAcgyhWF5Ki6r7oIeeqL1WYCXZ+2SSFNrbnpJMlbKtnBfYxlzmdheeiAftIPE
	 rnxDwyeMW778KP/s8VwV5f1dVZymUNtrdcWSceRZYI630JIl3rhTJKhxwxyfRtinIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200123;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f+utZNztUFm3Rn3ZzYrFgnqBmTUIBP33ChAxBtdiHVY=;
	b=m/rcXOzraATJMKNBE15wuzYNZqwTlUJWuYTRkjibu+SftQF+/zhGWBqvsHYxsaMLpCkB
	 5x/qs2GEOMyZeCmByqjXMGT0oV/KQHswJYrRrIkVWQxFEFCAEsUcHdDE+8VfK99xsTgdz
	 6w0i2FfXJlGIz0MWCd57HyMkIG5CCQwkc2MFLv1ZK1ZTJ6I39q7UEkDcJew0/WpvWC/5z
	 kD0b/OG9/5DoG5+faDYLuLvok3+WfeNzkTYPnYOncajIb86alpZSOE5rdcaPmsL6lgAxC
	 I5Rn6NWd/WFv3nnNAmMTlbEbi08Gx7cqkNKP9NUbaKq6oKqJJ4rWmDadiJ5xaeW4UQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiM6kCn9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiM6kCn9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9A51F01828
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200122;
	bh=f+utZNztUFm3Rn3ZzYrFgnqBmTUIBP33ChAxBtdiHVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DiM6kCn9Y22vzyXFy2QS6pJg3bLaey+6Puf/Kho2mz5wf/qZdkuiCWJ/cUl4oNDch
	 me0A8HXd5n1iL5M2WN0aw/CBwFTCHGRWO6eGfsjh8VNYn8MWgmh+TjUXpgXWeyoQA2
	 EOUUPURUr8/GKf5LgnzyO99DY6Uez/KaVTtVPkppL90vgVMaCUlLN7pf5KUFghKGKm
	 xmx+7wG80EqXHLRO9NBEfIKDhzDxkiVi0YjOdJENzA1bkuQZUhWxht3bGnFXQLdXBe
	 tcf7QzMt7blCXsiDK265j3z88BjZaLr92jGMz3HKMs+KhJ8ccazFZ2SGwHNQSMmF9I
	 V7xeP6OYe8MPg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4d648aacso1026660e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:08:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+Hlv3gYqLLugg6OEdtMqJyTLyGXb1qpHTvgtV6MeY5VyyKFz+i60WXXDePB7ww8tKb/PCQXGxL3f9pxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGg6iwGSAdypXwCta57z+sk1EPx94N0CCxsVgjCmgBwdWkQw4M
	9bOieENj4Z8S8biU2MGUIHTY18o8CfzJUy1FRknqhxfbse2eO5BHcvlEGQeGu7lQqbftbT5tk0b
	nX7QVgUohoFkMeSUd9mfwlGcVrb4nQ/o=
X-Received: by 2002:a05:6512:1256:b0:5bc:cc46:1849 with SMTP id
 2adb3069b0e04-5bfcadada46mr1050026e87.54.1793200120943; Wed, 28 Oct 2026
 08:08:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAD6ZPytCGim57_DthuUhM2cnqG9iCJw+yP=5v5btQ4cE7JBteA@mail.gmail.com>
In-Reply-To: <CAD6ZPytCGim57_DthuUhM2cnqG9iCJw+yP=5v5btQ4cE7JBteA@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 28 Oct 2026 16:08:28 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gXB-kPAJWsQnULqUST7OecSUtO2q9U9C23dhFU-kcG5A@mail.gmail.com>
X-Gm-Features: AclHuK9WvgHG02iNdySaKkGfqXBZr2CMxyMPox_yox0mcoLMBkHnaWgZHhzhPpA
Message-ID: <CAJZ5v0gXB-kPAJWsQnULqUST7OecSUtO2q9U9C23dhFU-kcG5A@mail.gmail.com>
Subject: Re: Unknown NMI after resume from hibernation: restore kernel leaves
 the NMI watchdog counter running on CPU 0
To: Sergei <fistboom@gmail.com>
Cc: rafael@kernel.org, akpm@linux-foundation.org, pavel@kernel.org, 
	TonyWWang-oc@zhaoxin.com, peterz@infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 3:23=E2=80=AFAM Sergei <fistboom@gmail.com> wrote:
>
> Hi,
>
> I'm hitting the problem Tony reported in July 2024 [1] on an AMD laptop,
> and as far as I can tell it's still there in current mainline, so here's
> another data point.
>
> After almost every resume from hibernation I get exactly one
>
>   Uhhuh. NMI received for unknown reason 2c on CPU 0.
>   Dazed and confused, but trying to continue
>
> somewhere between 1 and ~130 seconds after "hibernation exit". It shows
> up after 25 of the last 28 hibernation cycles, always on CPU 0, and never
> after suspend-to-RAM.
>
> Machine: Huawei NBLL-WXX9, AMD Ryzen 5 4500U (Renoir, family 0x17),
> BIOS 1.07. Seen on 7.2.3 and reproduced on 7.3-rc1 (both Manjaro builds;
> the only taint is U, from ryzenadj writing to PCI config space). TLP is
> installed and sets kernel.nmi_watchdog=3D0 at runtime (that's its default=
);
> the kernel command line doesn't touch the watchdog, so it is on at boot.
>
> It's the same sequence as in [1]: the restore kernel boots with the NMI
> watchdog enabled, programs the perf counter on every CPU, takes the APs
> down and jumps into the image.

So the restore kernel shouldn't do that.  It should disable the
watchdog before jumping into the image exactly because it doesn't know
whether or not the watchdog is enabled in the image kernel.

> The image kernel has the watchdog off, so
> nothing owns the counter that is still running on CPU 0. When it
> overflows, perf_event_nmi_handler() finds no active events and the NMI
> ends up as unknown. After the wrap the counter just keeps counting from
> zero, which is why there is only one NMI per resume.
>
> Reading the PMU MSRs right after a resume on 7.3-rc1 shows it directly:
>
>   CPU0:    PERF_CTL0 =3D 0x530076  PERF_CTR0 =3D 0xfffe53fa3a48  (EN, INT=
)
>   CPU1..5: PERF_CTL0 =3D 0x130076  PERF_CTR0 =3D 0xfffa...-0xfffe...  (IN=
T only)
>
> Event 0x76 with the counters sitting at about -(watchdog_thresh * cpu_khz=
)
> (23.7e9 here) is the watchdog's setup. CPU0 had about 7.2e9 cycles left,
> and the unknown NMI came 69 seconds after "hibernation exit".
>
> Booting with nmi_watchdog=3D0, so the restore kernel doesn't arm it eithe=
r,
> makes it go away: after a hibernation cycle every PERF_CTLn is 0 on all
> CPUs and no NMI shows up.
>
> I don't see anything in the resume path that stops the hardlockup
> detector before swsusp_arch_resume() (resume_target_kernel() only touches
> the softlockup watchdog), and the two patches from [1] never got a reply.
> Laptops running TLP probably all see this, since turning the NMI watchdog
> off is TLP's default.
>
> Is the direction Pavel suggested back then (suspend/resume hooks in the
> watchdog code) still the preferred one, or should the restore kernel just
> stop the hardlockup detector before jumping into the image?

It should do this IMV.

> I'm happy to test patches.

Added to the todo list, but no promises on the time frame.

> [1] https://lkml.iu.edu/hypermail/linux/kernel/2407.3/01199.html
