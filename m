Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA13BCD17
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281721; cv=none; b=M+qEjGDy3kC3O/i3bwj3S7gMiSSgMPJmMDwW0Uz2wQRKw7eRQH/R2kbWwLXO9NqJ5XqE0AFDIfyf+GSOoM3WgAMkL6zKXiJvQiFt5WKD2GWpB75AP8NjhHa5mNl782X5QJQF3NH/gAeDyHDwKIwD+5wpbDKf7NUJQJ+Q/l6sQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281721; c=relaxed/simple;
	bh=m3le0LRoIEqiKvYzrW3hqwYXLg+E5AHVO4iOgQS6Y7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFwI8V2CVwVKZl19NYCQPBcrbhHjIDWDlj+MCIxihJJw+bWihjYO2mMHX+YcbWo7Q2lrUJdJZsnZI/rDEFMBT0PQ68saPnmKEkhXWT/+a9uO8InW+kj4GoKgB1QJHO3kQmowm+mF6PLVJG4u12Nq4f/DuyQif1pnmR4eBwmbnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dhf+YsEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dhf+YsEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1937D1F000FF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281720;
	bh=m3le0LRoIEqiKvYzrW3hqwYXLg+E5AHVO4iOgQS6Y7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dhf+YsEln3vVB4wzsSmjgpeVi3x2X4baGjRWCX/BAuNnzlmOVkT2NGlj2QOR3PvvA
	 V6V5V41k8cFwlh+c2v6UMl0sjgu2TMkIgBP6FWD58e0qts+VqDsL0O1F69t6bGlyUu
	 9jMSAvsQ6HVZ6Gwx+5Gcp1PQJ29VVHipPF2fVWN47aFmnpR8oN5moipOdAgBVH0aYz
	 pAkx73sis9dtuJzAT0J36uXYFvHIHoZoNIlXZaJ0/ANLly980UoEhFcjRwBSlO9mGi
	 FmD7cfazHfwmG7LBsKlxDNuLM/pcf2CI2ww0Ai6FWGC9zzZj4i6+rSxT81uzqXRcID
	 q3oSmvuZ0Katg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba41ea31ccso317056e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzY1itO7TyRc8iPI7L/o1tEcgjjSghZbLf0DLz694bg1qY8uZ3E3Tq3URikvBSLEN7OIOLKdFEoVMSExAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Ls8PuIXjyXFBC139jejCZDi6P4sKibQMFz8XhVeJSBoZMeXr
	zJG65P4+SIa6jx3m05/X1oSBUsIOhiooujAbwABNs3WpXElzSfh5Uy4HneVLRIeT9o4NC3buGVb
	lPhg45ZqD0luW2We7ZnXgxivennWwgg4=
X-Received: by 2002:a05:6512:b94:b0:5bc:ca67:c338 with SMTP id
 2adb3069b0e04-5bccc6f0982mr427514e87.18.1791281718870; Tue, 06 Oct 2026
 03:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006055223.9299-1-kmehltretter@gmail.com>
In-Reply-To: <20261006055223.9299-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:15:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLmsvaNhEUM1e+zvk-s_r6s6h=b7dKn0k_kA3y=GVuBFfA@mail.gmail.com>
X-Gm-Features: AclHuK9Kpq7WO3g2iO3espGL5Ug3bTlQit7RXbcEmcKP4KcWJvOiVVHvmmiRJnQ
Message-ID: <CAD++jLmsvaNhEUM1e+zvk-s_r6s6h=b7dKn0k_kA3y=GVuBFfA@mail.gmail.com>
Subject: Re: [PATCH] ARM: mm: compare ARM926 cache range sizes as unsigned
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 7:53=E2=80=AFAM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:

> arm926_flush_user_cache_range() uses BGT to compare end - start
> with CACHE_DLIMIT. Sizes of 2 GiB or more are treated as negative
> and take the cache-line loop instead of the whole-cache path.
>
> Use BHI for an unsigned comparison, keeping the line-by-line path
> at exactly CACHE_DLIMIT.
>
> With the default 3G/1G split, unmapping an untouched 2 GiB
> PROT_NONE mapping flushes the range through tlb_start_vma().
> On a SAM9X75 Curiosity board, munmap() took about 1.3 seconds
> unpatched and 20 ms patched.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Ooops!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Make sure to put this into Russell's patch tracker!

Yours,
Linus Walleij
