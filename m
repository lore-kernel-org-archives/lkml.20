Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FC4FD276
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491361; cv=pass; b=lDoTRWz62Fm+LtX8POd05UmCQ78mCjszc1O7vs1er3mMyX3DJyFMK0zkBYVN42O2jJ5KDYygaV989Ckhb45lGpgAggWDXYeDZMx1K58UfcxDg6mlJHX2RZqnNUY25ndMqwSVJLCJiKIkI2yJ77ubX19yU1xMlx7XHjjN23pOoyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491361; c=relaxed/simple;
	bh=7axkb603a82UmmO6yoTtFA4rswXUCvwHcAJzJKwVvkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcUHzYQgd+J5oXMQGMkbxgLpnsQ5aRIHts9uYXw7qHcS0OH4JI1T+ml4VaBOf8b6Du2fgLk3UpPNhYHFsyZ8VvVU5migHlBt9tArumA5AIA+U8X3hxpPi/dB/phqPxjfYlfYKhvRmXi/OaOMUzTx3JIEml3YTem+fDoRLJn5fRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubWwUgjm; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubWwUgjm"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1109177137.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791491358; cv=none;
        d=google.com; s=arc-20260327;
        b=qXmqWP5mvtUyEUpggP1ZUAHMG9RtLe8McvDM70Xv4tvL4QCNmkCoLJb5rXl0/732Os
         LPQdFRJ1L3dR3T5qHcGCyiiRUuZYrj0CqimudFFGcrUEdHsmkIvOY85mDmsNIM77bg46
         O/6JpKtw/JehPKiyaHYA+k2Owlg43Teoj3vBsdJiQvOt8d1JBFKcolxAhZLY4KWWeH2B
         zFUxk9RLrAwqqUIBu1HmJQpmii9t9RCXjZ/dQfRHFPevc4DFHtL83Ft+FQ1X0dDL5zA2
         LIES/auLC2XH9xNZsg6wWaUWpcwUS6SdRVtF3rZoOinu38eQ/ugOfuxa+rKUC/aW5A/U
         YpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEYO+uBmenzQsAKFWdFIK9tsQp7aIojLDDws7AJPz68=;
        fh=be8l56kjBrYwUWWscYWq5Zu2kraQ/SsYCH76TMpscPI=;
        b=U6z71/ACfotMmSdt9/qErYVM6EgdwPviR+53M21ucNuirx2SKxTqClQvyeGktS8dey
         Y33Pkk/UNaFBamcgc/g5fnpTmt3kS+eygET15ws3EwRLfsNY3PD6VH1abU3ARHfrLiE6
         xd/uxG7EzwK+1j+o9XCJ4PS8LWmfxfpTJnU35Ng94wCdxBmvcAWP3idAah16g9NXqZrA
         p+Fepkj9ZUt3K1wJi5D55IihAzmI5M/aECETVkSCErfn06Y4fEtiHMx7HWq8TH3DLhzM
         Ki7+F6WhhK/LkBpaeMp9BJcO4MAWZnF0XCn+iyv17a/pYXRsqIvzdnXrH/4BjK9w3P2a
         tfiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791491358; x=1792096158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEYO+uBmenzQsAKFWdFIK9tsQp7aIojLDDws7AJPz68=;
        b=ubWwUgjmshpVIK6Kd3t6ndTPrLEDo6MEt7V1pvLj9dwg8zXctxTW8JArssRsunkw6S
         xRQV28sQWWsWjyqCvNJgq00uaXZCpeNW2UPyMhizeI45hBjNf8+OdfnjrFEUHHsIsWEt
         kXKaANlAscFQyZJt/88s/38XmOg8OpefiqIyfl3tTTpUdXF7ETTL+VrryhLUGUmr6v80
         V02Szye8l8s01Mw8d0L4wEc19Yiu5g/Z9eI6u2hPD8wRoU7DnhQJemDR660TngsrEers
         yVkIMQv6cdk3byciZkVBxiYpU+7EluwC5QBzyUcADrU8AnkmUOGplwXVlRimgpik6PVy
         kUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791491358; x=1792096158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEYO+uBmenzQsAKFWdFIK9tsQp7aIojLDDws7AJPz68=;
        b=CY27DGJVCyK0MzJqkwgEyo2IcxcC3GLULpWJR59W51cz1nTZVd5Nnd0SWkGlm29kTY
         m8rvsHNHS4FD7EiXzqKhsLYHH9png3CUEmGBknltYCRumAVS6UHI6v6qiuPmYD8SAB7U
         nQyN6S11YAYIMUpdoUh5x8dBGQH68NHJcSGU4xuFH1A4YUGeCHU48zHI+x48OJQofBIZ
         sGqZL5r71uDL3T1+CwX094j8hKT1kgodUXdGxPiKFaJghrlKZM6u2CZ2/9vmqerZxxOI
         SSzwpW3QuT5KG39fM5WUtej1zke67jEYfJzAUVmL9o5FLErXosrOWjIzCab8NoRrGG/J
         BwFA==
X-Forwarded-Encrypted: i=1; AKwUvBwLxFw07biwx7qetU3xhkV9vxd0adnrpVszJ8lCH82ocFKmyXe9Jzy+TfjayP12M0nLk4Q1yUqM85XAK3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa4JXERKi0JxBb0T/yzmW9aOVjBrlBRUXW04+lgh19UhXa1Wm3
	+ytWq3jD0dyXSCZfx/HbdTuAVT6/tYMlDf4zJENCslg0qotZKgbhuFDqSm79HMDzevhpjouYsUR
	qeIm8qJSV4Ln+DJRFWcezzXidNOYh9aSvUEUlFkg=
X-Gm-Gg: AYBFou2hPJ57srkm7m7lVGIZtdDcY5/1Y+KUMk3AgsEv1hXeNo23cy6ayBm50Y/dhiY
	Nm+qL88fs17T16xF150nJpA+pOoelfUPc8kIb0FjOETUwWelx/qTYlqmMZVtjKKDJNOwlN5pvhb
	NxojuTJGtnothBtaluPRzIIJxmElITIIUtZZHqM4EJA7kzJETbUWFFggtNZpmmsFNKwM/d/aroU
	Y6dZU6KvH0Wznrv4zvHY5HlRF4gvr+/12lPjcP3x9/qh90lFmeuZyiJfXvbAOYDT/sqY6mHgwtr
	hAKdpB5UIYVxDz+Il0Kaexho99UMh1JrXPBZ4YFtwDhd6sb6S2PQwVkt1St8Mfmjl0G6enQCkIW
	jDDliFMzOWKZPpu9OrqzaJoC1spNInEs=
X-Received: by 2002:a05:6102:22c2:b0:7ca:7226:b414 with SMTP id
 ada2fe7eead31-7cab8948919mr912611137.19.1791491357086; Thu, 08 Oct 2026
 13:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261006094358.2948476-1-morbo@google.com>
 <202610060642.7C4125F@keescook> <20261007090915.GA1504630@ax162>
 <CAGG=3QXPAa-i4r3Vv6-q25A6EvsxGb5RDLn02z1=a5zo7W-7Vw@mail.gmail.com>
 <20261007093641.GA1527653@ax162> <bc2e2ae7-02e7-4148-8ad2-ab3c1af3dd7a@app.fastmail.com>
 <20261008161724.GA459@ax162> <eb644465-0c41-431c-85a3-f7eb6bd86cf3@app.fastmail.com>
In-Reply-To: <eb644465-0c41-431c-85a3-f7eb6bd86cf3@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 8 Oct 2026 13:29:00 -0700
X-Gm-Features: AclHuK-6rPfWZEe_Z-sw2qrJwskK3Nn8JlizxagKQ-WxeGZ-k4tgZG1nsqTiy3s
Message-ID: <CAGG=3QUvZ8k1qjT8jjo1Rft0omyQYAcRUWExKvJw7CGD5B7XeQ@mail.gmail.com>
Subject: Re: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:41=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> On Thu, 8 Oct 2026, at 18:17, Nathan Chancellor wrote:
> > On Thu, Oct 08, 2026 at 04:50:44PM +0200, Ard Biesheuvel wrote:
> >> On Wed, 7 Oct 2026, at 11:36, Nathan Chancellor wrote:
> >> > On Wed, Oct 07, 2026 at 02:32:45AM -0700, Bill Wendling wrote:
> >> >> Ard,
> >> >>
> >> >> What's the reason why x86 doesn't need the KBUILD_CFLAGS flags? Is
> >> >> there something that breaks things?
> >> >
> >> > I think it is mostly historical. See Kees's series to address it:
> >> >
> >> >   https://lore.kernel.org/20261006204210.i.137-kees@kernel.org/
> >> >
> >>
> >> I've queued that up now in the EFI tree.
> >>
> >> Do we still need this patch then?
> >
> > I don't think so, since the efistub should now get
> > '-fexperimental-late-parse-attributes' from the main KBUILD_CFLAGS,
> > which is what prompted this patch in the first place:
> >
> >
> > https://lore.kernel.org/CAGG=3D3QWCmQ+LVvn2dtjEauj5WFwvx=3Dpvg4Q6man_A2=
imdjRe7A@mail.gmail.com/
> >
> > As I mentioned up thread and to Kees in person, we should still conside=
r
> > adding '-fexperimental-late-parse-attributes' into CC_FLAGS_DIALECT to
> > cover other areas that may see __counted_by_ptr use but it is probably
> > not as high priority.
> >
>
> Excellent.

What Nathan said about needing this patch. Once Kees's stuff is
integrated, all should be well and never break again. (very J/K) :-D

-bw
