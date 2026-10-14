Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD855D89C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996274; cv=pass; b=n0DkOlYpJaV/+6gQsDKl9x3cvfQyoFKtYWG/JIa3fXIpHUl9ig53ybdcoX4e6St3FLJnyg7cLgDzemNheBDZk6PMn6BY0firLyt+hmwUNJ3Br97QmT4xrapQpFkmbvLKW02daCUP0ZvauN0sjswslh26jqseYuvMpwVsoI0IRdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996274; c=relaxed/simple;
	bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBDomy56JEj/XYTvkoab6gapc5MTyaHl2+H8UD3EJi86JVzxmOxNMAUYGAqrBlhaj30CNaDYcwv2RTJXSJE0j/11xITf9XmsZsVBOMZF1hmkMXXe2gK+rBg7mZFjGrFZ5uOnb0ZICl+iJIdITfWrG8xtxYaLB3vwPEmisJSk0LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG5LMeCX; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG5LMeCX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c522572bfso548263eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996272; cv=none;
        d=google.com; s=arc-20260327;
        b=T49kZ3g/9Igv7pmV98l67moSEjYhs6RqhgOtl1ZVzoi3cRnbq84JY+WcXC1qItNQkH
         jNW1MlRbasjlXqM9/HcwpurXsF1ps9+8R7P8O/X/m2oVVp4Qj6ldmvjcCGJRJnr/orSg
         jOonxQdgwlO2cvHeekM8SgdwLEx+QBVyn183F9WQDPyOrUsfXTbBfQp67O18ae67tTD8
         AGjmZ7XdbP6aNsxjSD7rVY1Bm24Uy1zkD0sKSfMLKL89d6ZuxuSnQl8dWvf4FQjtXXAd
         eLdc/FafHbdz/DGSWmlb0JGasD46BHnztmQMSux4e+56f7MNvVVU21aAvQW65WsEF3eA
         Gkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        fh=ChHXaU0JK1N2nUuoOyGLfpeoAJBYvZHK9QtLYaUkywM=;
        b=VQV02QjFSNybOErV6GgrDXCL7RFkJmzUX9cQX0ETVefa0Od3XboUa9Uevdkvba1YlY
         tiKxADRUlg8P/JgM2yVXICf9JkCysGlLYpRHT0ltOv0eLbIdvrzH/BHjW8qKoTep+W3O
         sVEs9Dzwi/29CBydqdQqGiHoCBHYGGWdwBf35KyFK9GnebX70X35xyn1N+PyPMAAvSA8
         QMdU/MLcsYQOesoLSipATPRzc9lPLy/i9adwCVXU1qkc2zj4EL/Vt/eFE+CYgrsS2lnR
         QZLZHHcXEZJgqXFIPo2ORMjfsNHeqbJmAAsZw0WqqwtFb8r58nQoGSGZINiCgh0yv3tq
         kQGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996272; x=1792601072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=dG5LMeCXSiSbpubk/BTMkvWJ2dvIK7jFfkGhSVKuiPvEccVQI9eRP/pY4aiG8kSDk8
         sybScDEKYa9pUjoob3fVfnbNdFtdkBXsSjpfjP+bPyBK5Chd00x6HJJ7X+HteLAY7JfU
         o4429zXiiE7e1UOccLBxgzcZh+G/nI2B8bjb9YKWi7iAEGL16Iblz9B6MpdkbUl3G+Fk
         3lPFokI++jDRZ0Cwvj1/64bOOygK5BR8VGYFxRHD7siF53FrkARVocKqUOcShcj0hkn2
         gYiKlI7ykCQvFk94TVoBL/XLbOsKN6gefpMbeBOS/eufSnZP21bV5ckiClL1WUdGnm6v
         +u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996272; x=1792601072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=cOUd7fYgW1qacTcb9Vy7ulOMpVpW1XnBvLlBemYQIXEQVKiJ3dvPUNVbYtW2L034pX
         vwosSf1N92Yahvk/j361PFMNt1qYnvAIdQ4uM025hKZVrjx/enfS15fulayEU1qF58nX
         qkw6sEvhE2/zgCzgQEEZYDqZmxaI4lm7hdUf/disAe2A+pUfzsb3dL4pco6kai6xNTPX
         7FzRADKibGf9L3tpJ6LxiA3WU091Gbsa6nGgPJUxdxeavCKtqpRXE7qy3BTR6EwCmIxx
         aQrANLI9E4kpF1CDGQmEA6nkSKjQ4Stwcq3XlABAJ7nwg7CjzHdigvBZ3qR03MVHrK7+
         wCdw==
X-Forwarded-Encrypted: i=1; AKwUvByrfWysKny/VFB+GJEEVoAPVmGD01bt9a99nhn+TrJlpqr6PgUGIgX5wYnwqqRQY2/4k1szQFfDUkvXYE4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9FNGZ2uzO6DS2PBsvdYNizhTlgsYdVKR4LKNHu4MCLetoGYmc
	5GUJ0Na3iIIAHzE0wr1rzf6i83eFgXQ25gkhE6VLBqY2LtJmMcfUT+XG9hdV94Bi4w/ZTNqiEyk
	XRTgNdALpSjQvE9XokJZ1JGgV6LNVqZ8=
X-Gm-Gg: AYBFou0RMGsPWjp9B1eoOl645OoIQPcfwdvqIC/9HEP2ZdJ1nvuNlLE2R/dmZ+Zoe4i
	pPJlg176oCHiHpsJdPwHbsQKkyH/U68p6d3RN6MsSmQ46uuN4OkMTku+6pAj5/trbNq4prf6rS9
	ci/mhGgsNowoC1i1ECITWDgVou58tsWmmKPxygmCt4tcN+kCdEJwreXuYinqeWpoh6Bk1Nfc2Os
	jzQsigzdCTuNmOfozZNqk/AIpyME4fNMt6AkKgc587gbjJZ2nTfyc/zGNdb4wz4FeqYGM5j2UpY
	KIcXfrdS5paJu3Sg3vdn7RBzzQ6xkiVqyMsRgyC2YJT5vvTgaqDQc3+CKBY/I0Yff3s1/SENw7n
	otWOMXUzHov5zLEmqOKgUDbnStz3QgPS0yLOOGFgIuKGPUFzKc8YYshj4+RkgZ8/1/gNO7ap75t
	mTpwa1qb/mfyqmkIw0MAgAFMAi1mVt1eUprYlUDcZPlnrJiUe3DTA=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr28158500eec.1.1791996271702; Wed, 14 Oct 2026
 09:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 18:44:18 +0200
X-Gm-Features: AclHuK_d31yoge0njHjovdIQh7JfJY6W-PLjzMLBq14NjY-schAqigzEJUAQwG8
Message-ID: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

Of course, please feel free to pick it up (with the small tweak I
requested) if you have a user.

And if you don't pick the user, I could still pick the first patch up
through the compiler attributes tree if you and other folks want to
use it after -rc1.

Greg: adding the attribute itself should be safe and would unblock
others that may want to "protect" themselves, without having to wait
for every potential user to get fixed (but of course I agree they
should get fixed -- we should not forget about them, if that is your
concern).

Cheers,
Miguel
