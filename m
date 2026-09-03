Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633A4E13E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454205; cv=pass; b=eLgr30Pl+kjiAfz1PnBHb6DBBi5chsxZdDIpI4fjUlMNuoc+lDSv8E+zUoTE/rtNvc1jupZSzSCpPE33NTFX9OCE1xjqpkzKsEMg1FyFn1nlCZsKI8DAOii8d098g2PPK2MrVtCy9ANjWYrjsz8DMO54dWQGREszace+cqydDnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454205; c=relaxed/simple;
	bh=fIzJ2UzV1e1OhGgyxGwDuKbdIbdlV23EY1glTplhvE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX+50fpjyGdX2HBe0xVwvgsSdVGwg03VL0mN01xbuT4jWBH8rWOqFqKpWuPyuBVV+OAOK+ZI77xcGjyVwIqUkNkcIQLUOT1oD7ISBPSow38HuWn5grBdhUQXdD3iMr6Zm7ZcbTYHP6gVVmuJVlhUjMgZcRP0gBqQXsVqPwcr1W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=d5xJJ/s+; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="d5xJJ/s+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8534d507f59so10609b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788454203; cv=none;
        d=google.com; s=arc-20260327;
        b=kc8QY9VS0qkww0SxpxIZOyqIwbLKaI31BLjYblr8eBAWESLPv0cTmCUoOteWl4Sbqb
         UoqECpDzGeOoZ4QEqorgGJbhmca5PmpCGeKCgY5brPouhZFUsPb2w3jQRwi3p6kVPkvp
         +fCUpgPkwYJ7LqOeFXJBrbZHWpMfPQqewWjQseLB61jf/MFIZh1sscBJs1aW7nGbFZ06
         4NSOP3NfYr7YjSu46vOHmoSH9QuugrXA+AW+Wo24YvWRlFpaTDyIWONb+1rfCbpJdNl/
         KwU9E9mrKICJ51VK9cNuNbocZYtHmN8A5xg2gVYw14/mZ07CNcB3ZvRZi+PfH6I8/f3U
         Za3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2HQUVihfuH1EnVw3l99N8g3U4J8AO1suXuMcFxz4nu8=;
        fh=Ggxz9Um5aEANRIso93ZGmbUcKonhV29jn+W0dlTAsXo=;
        b=WpRykglEhnKntrlq8oUuLnBsuMp9Zc8KRYrKMBFLY2+jigQ0Snymdy/BX/3z0akpDV
         0QzggjjgJVaxKd0luz1dywRtxEm/hPdgcFYOCMhHCFhfCZkviJUF6jXlrzJ9Mvgsn9Cf
         tDRH2NuPbhKcaUQfuZa1dt1F6PcdGexv665lfpIisCYLayP4Hv31xRMgsT4UQrYvIePc
         cshXyoiK0+jMpemFwp6U1c/RkmDO2FaUtGnH0BrByacP56unLsubJZwv4fNqngqZdlaM
         e3vuZ2nGvBcayC9MjYc3qiDPoR7p7CDhXrX8N3UJU0PMQM8jAAV5bVG16CxT67ErfqHV
         J9LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788454203; x=1789059003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HQUVihfuH1EnVw3l99N8g3U4J8AO1suXuMcFxz4nu8=;
        b=d5xJJ/s+bZ8G7cWlXDwnUBOPPL8SWcKkAjBqVEKf0k4KhYK9bAhQNuAshxxnm3oSNG
         sSZ4BQmTBFCPFBAeebo/pK8zvQFpLzMgiimZ4O9PknbACOpudWvxED6ArnkbLWKw8FCh
         +IBn3NHozxUwW8bvALGbsYnVz1LRE9zhT2AlS4w7wxnhBYzsac9vsY+tSgEsjkK4BN7v
         MXWO3o4iMN4FJRYFXQqzayhQtzEFTv0XDbT/1HorIgjNqEk6eafAYALYShPQhbYda1wn
         9T5654dscRfI8x4p3yFivJORk2SiIhsZpI7yhJq97hcCgl1rk25k4IAw3xdR7g9Vfd2w
         XMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454203; x=1789059003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HQUVihfuH1EnVw3l99N8g3U4J8AO1suXuMcFxz4nu8=;
        b=NOaBP/nR7Y3ugp/rzvSG9eaV9xW8jc7Fu+VK+hFAbIpehzzdQISJ7+6oo6uvQz5BzM
         qEYCnmG9P/P2v9iksh0No4IkpvPZ3wirkllz5mJjB8pDXvYzMhjsoSKXh8PdGHZsD4wG
         twFn++JzHEGPoeUEe8Xk+uyfh4q2BTPsCZq4CCt5iyDTTx4thdF0Wo+Cx6YFpmZJKEme
         t3A0UK+xZwFPzV/2Dv/vsR+pGyyb48fsPEYRMT/buUefbVs6hcyAyP74pROvcGjMDppP
         KM+DlSSEv7QIW1VH5W/2XSaMMKzNouG7iW5b/6THmpOsra9f9BzwG/IhbqttT2OoNQgl
         aB8g==
X-Forwarded-Encrypted: i=1; AKwUvBz153li10ppPZ2gpKwUsa30AFfwr0krLgVzS/fwoC/S8dLwwkqsQqyYabcnuDF/VKEoEVgQcjqG1Nt1nsg=@vger.kernel.org
X-Gm-Message-State: AFuF++lXjsl4X31nmZ0fqxVeo0bVZDsORybIJbu7hexXNlBkNdnA8DAd
	yKgshvZo8pS1xIzwUYYcNgvW2XKb+q5bJJiuHxw8L1LDuVxuUI64rgf7jZajQDbkymv8PtKllg/
	h285AagGfjS1eOv9Gebw/OLRPN/I8gBE214vdWZCU
X-Gm-Gg: AYBFou3+WJV8AURQg67uyd/mxM/v5rilYek6YY0d3Ona47Cgcie/O8QGjseqYtoz9pF
	GeTWsr2UGQtsMWl7x4BHjJbzc2UI2RDYpFwiSU8zygL1X1i8rwFl8kRBBvgZpigYxnsmivPbWwp
	JrwccJBd/59T/684rR/oTbryyw4ypDPqkt4Hs5dGqnaZ/lp7vFFVhKuDe0mkCZqoYs+gzfsrRcv
	Cjr90vVLIozEABsH5DIcbIPzqMd+4/5Zg/ldY5uTvFefWK83A7yHTOWnGBRxLQacKFKOJpub63M
	ts17NXSQ14CDLBZ0KV/g07lVg3TSWMXj9cymbEXTdYAG
X-Received: by 2002:a05:6a00:4c96:b0:857:7337:5db8 with SMTP id
 d2e1a72fcca58-8616ae4e171mr356491b3a.22.1788454202717; Thu, 03 Sep 2026
 09:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903155615.516010-1-omosnacek@gmail.com>
In-Reply-To: <20260903155615.516010-1-omosnacek@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Sep 2026 12:49:48 -0400
X-Gm-Features: AcwNN1Vi1fFN8XgqNIFOZOP1XJFQC7hXS3V-fOBEGIFKC-xj0anHhARHzxX5Hmo
Message-ID: <CAHC9VhQSoWBfWrf97Ch3ZZJXkOvhbwNOGmq8rMxLFzq+a-CkQg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_MAINTAINERS=2C_mailmap=3A_update_email_addre?=
	=?UTF-8?Q?ss_for_Ondrej_Mosn=C3=A1=C4=8Dek?=
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:56=E2=80=AFAM Ondrej Mosn=C3=A1=C4=8Dek <omosnace=
k@gmail.com> wrote:
>
> I'm going to use my personal email for kernel contributions from now on.
> Update MAINTAINERS and .mailmap to reflect this.
>
> Also switch to use proper spelling with diacritics, since I normally use
> the full Unicode name with my personal email address. I'm leaving
> in-code occurences unchanged though, as that would be just unnecessary
> churn.
>
> Link: https://lore.kernel.org/lkml/CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VYpK=
8KuseMQS-9tNA@mail.gmail.com/
> Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> ---
>
> Hoping for this to get picked up via the SELinux tree, since the main
> change is in the SELinux MAINTAINERS entry.
>
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Of course, I'll take this via the SELinux tree.  Since I'm going to be
sending up a pull request to Linus soon with a v7.3-rcX fix, do you
have any objection to me sending this up with that fix, or would you
prefer this to wait for the next merge window?

> diff --git a/.mailmap b/.mailmap
> index 6803f3bd2865..0e672a60afdc 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -699,6 +699,7 @@ Oliver Hartkopp <socketcan@hartkopp.net> <oliver.hart=
kopp@volkswagen.de>
>  Oliver Hartkopp <socketcan@hartkopp.net> <oliver@hartkopp.net>
>  Oliver Upton <oupton@kernel.org> <oupton@google.com>
>  Oliver Upton <oupton@kernel.org> <oliver.upton@linux.dev>
> +Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com> <omosnace@redhat.com>
>  Ond=C5=99ej Jirman <megi@xff.cz> <megous@megous.com>
>  Oza Pawandeep <quic_poza@quicinc.com> <poza@codeaurora.org>
>  Pali Roh=C3=A1r <pali@kernel.org> <pali.rohar@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc320b373656..875d0baed8b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24772,7 +24772,7 @@ K:      \bsecurity_[a-z_0-9]\+\b
>  SELINUX SECURITY MODULE
>  M:     Paul Moore <paul@paul-moore.com>
>  M:     Stephen Smalley <stephen.smalley.work@gmail.com>
> -R:     Ondrej Mosnacek <omosnace@redhat.com>
> +R:     Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
>  L:     selinux@vger.kernel.org
>  S:     Supported
>  W:     https://github.com/SELinuxProject
> --
> 2.54.0

--=20
paul-moore.com
