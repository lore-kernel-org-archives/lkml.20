Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B3C4B149E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443496; cv=pass; b=BrPcfAJEXYZCZFO6JRz+nnAFHcfSdce3f/zji4t6d/jztx0ofpHJODRQA8R8vZMnygewuurT/gb5C3W5/ax4DBgbdwGSprFZckP2MZH6sJP14yuCvK3COENKreZjWR33sBaQNBrycmMBBAg9tgHZBYf6KZR35Qif/psouwqvFLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443496; c=relaxed/simple;
	bh=CnepmmzELbEjghYI6j0ZociAv62uiRsm0df/ajYLGG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYG3PA8K/FTChYI4Ab27j1HB6UFiTizlwR86GypdZFLgvTpmgdB95tYYhJOg6mZWmX+JCkDXLSBQQP8tnk4mZEeXpDqOc99j3XYBx9F5qCAI7IT3tIRXSaENLVlrMeY171vmro4EFUdN8ZH6UFyfGZwfaqWeiTOfo6xdKvPokPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihCbHIw4; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihCbHIw4"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a68ab90eb8so983090a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788443481; cv=none;
        d=google.com; s=arc-20260327;
        b=KPhoII2v0l9ozieWgW8Xw7AoS/GFAf6btfsKtJnL6dnQirH7aPPJbUAHthdF55d06b
         e8pObi3szfVvCAia7ssCqsPY3ozKac540MSaepFAWuhUUVzhlT/1Sw+ZnZxbgGC1aWJy
         xt56H/4PJZ4xbib2QJYbnb318h0NC59WKaymYKBBQNhNo4/eFqGtQWEnlu6hYW3mlz16
         pZRR1MlnAOGYVT+ceDQ4BJRCqb9JrGU9KBVxPh/zyeyvTNFutAHMe/Bfyg3+4L62dnZ+
         ah64Pony16SL+o5oDd+XyH8HGZOPQ9+W4kxke3RhOPAPeJ0hXUAZOB/FhFc7NQVM9JRY
         JzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MoZRNEtYIWDS0IurH9QV+UfQGtgGdZsOItW/ktopJYY=;
        fh=7IMFXiofcBB/IJ0/LKi2LMzFytqlsnQDXTZLX4e7syo=;
        b=B5HLYaYK9fKWwl7+mjViSZRuT+IBXVbLVdRq/k11Es1gaS71GhpYBSKbtD0Hnku7jf
         K/rMePWiXJZef1RjAXDXpFZobeUGrM+k06owaJQiblO+1SRrZBXbuZIEG3pxKhyLi3zA
         Rvn0VENqW3I+VJWeb5yNGq+xVvk+qTfx5+ET5M0/lNsAPLB/Nrie5IkVPmsO8j3tkma7
         mZ/pvmpr6H2io7ytsloT9y3i7T0wSVmwFRL/G3v4Vz8f7EMjl+M8JOpAhxQoQmmYVT5z
         GXjjzg7MoITE59Bmee4UQF8WdTZw4OVvixaaC5+V6UyYA//QYKlh95Ynj7FUu4arvH0s
         LwXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788443481; x=1789048281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoZRNEtYIWDS0IurH9QV+UfQGtgGdZsOItW/ktopJYY=;
        b=ihCbHIw41Cpllq2Pdrh1AybFP3rOn56Vt67U8mhzTSoyolGHCYUbHv4mgyX8LmDPp9
         GC4gmUyplFlmhdyahxu/XXLRq9TvT2kSymhB2d5I/2p/IRx+Cl8Rh7zhYqb96ArMB/lU
         PdG1cKmWln3Q/5xkUbxma5JpP6W+HwsDBHnHFUu1DUnqSwi4iUbF/5I+O6UOVcFuOKf+
         MFLQDWDtmc7GNngbWlRYEWQEoLrHzfhKG6m6RCH8taLlZ5LlMPJn4Dp5n2DauRFZ0K9N
         KGYuaFgYVfvF+/HYsdNOQS7LNfQqm7OfBudQDfyV7vMdB56z6HaKIWFqFGWwVy9tYJjM
         4h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443481; x=1789048281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoZRNEtYIWDS0IurH9QV+UfQGtgGdZsOItW/ktopJYY=;
        b=GBKP3ECn0xw33Hrwa3nVwwj0EVw9Hf7E+2cBMSHEzEFBzljxsrVvuVa429KBHHnGuK
         4Athsueo+klhiHF7nZYNmPo/iiO98hSWRlfwHxfHQeP3vorNx5C9A8PyC7+w31WcKmtf
         47HV6PwMu8/6o2+DX1hLq9sNfsoXle6tAOWAKsFD/G8JBjpfz1hYeU5n59WfjjyYI4FU
         4vhAXg5WPzg3+GER+UKcdsUEgcxup/4saqx0UWxM/M7ckDDZSkZZmBaeZx89IsnTt9Vo
         Xw5juG35CBwJhu74Iynk1JY9MG5avgfpARr5p5DjzJ3pJ7UuBEyBRz5Vvda4LHq/4sqw
         FGDw==
X-Forwarded-Encrypted: i=1; AKwUvByBahjqgksDPAEREEcEFfiiR8fOXfmxwLFEI0qsr1RYXgM5ZPkj/S7HgVH7mtOil2V5toFJ7ORGEymxZSk=@vger.kernel.org
X-Gm-Message-State: AFuF++mNy4Sdp1nRczGs4wC0H7S/bSYZdaRN5iXCBjQNFszC4udxpWKh
	ct6+MXj3Kjz0UfaEyqLHzCgKzvdOGCgwqKJjABD3B3gkGNYuccjVO51VmcGYvfFE0KIaNCqnpyC
	ibZUqPhozroZWN6N2y9andEzE1r6evSo=
X-Gm-Gg: AYBFou0MhjSUkEgAKblfhTlInrqPtcnyQIs8tA+Wpi4BuFnzESj1vVoy+pyzVM5O9wF
	140mbCRV+N6vLcAsFnlIa3GCvXzEfOeoJ/kTi+BXkBEnGgEDaNGBMZ3KUVhU4hmheH6FmJkSUpd
	VY7Ld0HO5G3SNQwQ+Kma9ldGa+AeAO1bMdOOmSaR/nbPS/vNt/5c5WlV1A8fLSFGmrrbNJz9d+6
	4ctuJornVA4R1dKT1T8dRc2/NA2PgCy5tYgPrzmokaNrYylphB41m8KFTtbuETlhbO4rOYfK+4p
	LtnPcMypWs8fHMibdoH5XWHvrIC3I0D3aeiGaDXVI/6QtRqUciRny4M0
X-Received: by 2002:a05:6402:4615:b0:6a5:f814:2278 with SMTP id
 4fb4d7f45d1cf-6a7e551f77bmr22171a12.2.1788443481155; Thu, 03 Sep 2026
 06:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903132636.1113789-1-cui.tao@linux.dev>
In-Reply-To: <20260903132636.1113789-1-cui.tao@linux.dev>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 3 Sep 2026 15:51:09 +0200
X-Gm-Features: AcwNN1XLPOGjY6GkGn_VD8RO3WKWNti90NMjrqMlxwQvVF-i2CTvjSe5-uBDR5U
Message-ID: <CAOQ4uxg6_0wnzBmA+-rZeADBTKwLsWFdEM5ZVGa6YvWX6mAGXA@mail.gmail.com>
Subject: Re: [PATCH v2] overlayfs.rst: clarify the scope of file locks taken
 through the overlay
To: Tao Cui <cui.tao@linux.dev>
Cc: linux-unionfs@vger.kernel.org, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brauner@kernel.org, jlayton@kernel.org, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 3:26=E2=80=AFPM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> File locks and leases taken on files through the overlay mount are
> only meaningful between tasks that access the files through the same
> overlay mount; they do not conflict with anything that changes the
> underlying filesystems directly.  Add a short note to "Changes to
> underlying filesystems" stating this scope.
>
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
> Changes since v1:
> - minimal note within "Changes to underlying filesystems" instead of a
>   separate section, per review (Amir Goldstein)
> ---
>  Documentation/filesystems/overlayfs.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/file=
systems/overlayfs.rst
> index 16c35b491dad..11af5bc73e32 100644
> --- a/Documentation/filesystems/overlayfs.rst
> +++ b/Documentation/filesystems/overlayfs.rst
> @@ -671,6 +671,15 @@ filesystem are not allowed.  If the underlying files=
ystem is changed,
>  the behavior of the overlay is undefined, though it will not result in
>  a crash or deadlock.
>
> +Note that file locks and leases taken on files through the overlay
> +mount only provide mutual exclusion between tasks that access the
> +files through the same overlay mount, and a lease taken through the
> +overlay is broken by opens through that overlay.  They do not
> +conflict with locks taken on the same files by anything that changes
> +the underlying filesystems directly, so file locking cannot be relied
> +on for mutual exclusion between overlay users and such direct
> +changes.
> +
>  Offline changes, when the overlay is not mounted, are allowed to the
>  upper tree.  Offline changes to the lower tree are only allowed if the
>  "metacopy", "index", "xino" and "redirect_dir" features
> --
> 2.43.0
>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

I'd like to wait for Miklos to comment before merging this.

Thanks,
Amir.
