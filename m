Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6F4052D8
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792352855; cv=pass; b=ApIIWlqaER7gu+50ljBmUo7YQMaaVpMGismztbqE88OByo3yhaVXs43JNR2ZvEZPBvQKpFZJ0zukDgA7c8Mqp8O7Cp9vH5cgUlK8jIArph5lPeT5Zh6/K4TQOP4O2AILGHr6ETE1dxwVT2TDeIItsyYTHScY5yOiOZVQw07Szm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792352855; c=relaxed/simple;
	bh=uSwsGj7z13o5NrJE21iC68UKNr7h5yOq6P5JpP5TNDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mdr4r3gDH8WctpclO447oyqSS5rlJOw43pgJFzbrqO6wkztrQ5QdaFz+8BMajXpzGvarQlcjeYWIocydDed9Ku14NVV8b+sI3XIs+IcU67N2QOxm+9ZJ7vYLuAhH1tD0UpOzsXnKHFgYaFortoKsKT9KyUDu/6TnC0e9O/itNJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=U61hr0Px; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="U61hr0Px"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9761758adso8915921fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792352851; cv=none;
        d=google.com; s=arc-20260327;
        b=NR8fezj3YIDAK+UT6yqjWq3bOPddXn/5221dwMgaxBZgXZb2dNAtWcf6E8Go1zeqYN
         yBjVUYL7bwT9vAsT10OA92HEqRQC5OyGMHCduP3wOhptycz7ZIRVAAbjZRtxUQAAMpLC
         Zr5ZdjRUr3NNzoSAMwyGBJf5lHu8VJfUKkAWZo4mjT0YrJFH3Qt5a3AIyRWoTCW643K2
         7b2wZlGx4NJTIjNj1Xl8LXApvWltvbnMmCkOVIV242DCbfR6mtjRvH8BWxcgZzHQjs/K
         fG3ekCssYnKy8kWkh4VR87cIhfwsReSsNb2ZGlpiScKPy7xz1/WakACeHmrkf72HWCxK
         qPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9PTaRCgfnWLejuxwMwgHezQmSpb/Q49pSzLQ94ksTk=;
        fh=xAzVHjZHCvArjl7lH43BR8R2+qQVqC0R580NndzgOWU=;
        b=RaRZbXPrFgn1lhip4MbwBbULLFQXIVO04NBcCYibQEskMjliVRpjg5EQQytiNz7lLd
         zxnZ1lqGucYyPpvh7sqYDRRQ2f8Gd3wMOyGB/syh/JFxbTBLsy5bpkpqDOJGLbgzU8HI
         RmIgrPWYt1DGxe9hI5bLzAo6PIBknfmwzKO8YR4xdXazqCZN12eeNclOYYb55OeATU4k
         GHBl8jNW8cfJ5SG/QSo+It2Ffpy66LqmEIRwNEiMGfeMwOo1qJsj5p/H4zwWhUf0T655
         k1xKtg87fk8q3UIlsCT9fl+8bfXXMx4QtJgSrBrvFZTUAOsfvNjpD2mAU/2vPzOWLJyA
         A/Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1792352851; x=1792957651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9PTaRCgfnWLejuxwMwgHezQmSpb/Q49pSzLQ94ksTk=;
        b=U61hr0PxGjsekFN/Peus8SSvsCkWL+X4cEShlWPsXJwFZsPSOlvUCsybYg9BgwgJRd
         4XnxIJgNM2UxnPRJ7LJ9ePNZaMA3S+v2khZQd28a3QJuiBcuUaNEpSAyegrHLGxeAQOF
         XWhhz9z4gvoj1jD71wUdmMg7TKUgBLlQEbfCfdSDreL0vc42Gwa+0w9MuT0mJeW9FjHk
         InbXbqmJqWqFBCaE7bhMzpyoImihsnstJokhn5vCptf2p7cb0uxL1CtKsrsoOoa51lXm
         tyklrtgAN7N7S853vG7iCSHElYqHLPGyLpCn9vrAZ76I1HHBL84qCv0LlLe1GVF1/qq2
         6Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792352851; x=1792957651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9PTaRCgfnWLejuxwMwgHezQmSpb/Q49pSzLQ94ksTk=;
        b=oSEaPb3gBoGPJ5pZb83vsLrFJJkG8y9QNgthg1PfMEUN4K0y3J+wZWjXqRTfVXvNag
         0Dwu/IrEaTLqbRrH+Mb7j5c8bwSXwiOUnrsKItWzgBU6I7NoBXaz8ovHbDrK+WqhKRYp
         vLF4pIKsnltuLEeUlCBODbk5zOgRX8dw14fz/uPxLL7Xy4qmd9abRMIiChUaJ5qpEjZl
         leksaNS4gZGM9FZczfeyv5mgscCmfWgrc+EnZnK555oCipwc3ITdNIDOnJwzK3m5Hrfv
         6fuetgNmNXX+m/S3ZGg7x67zuMEUpwoC4rGZ8GjqgFWlyV9fFn1aycZ+B9lYm8FWQCdF
         Cf5A==
X-Forwarded-Encrypted: i=1; AKwUvByNKoR+xG0RhwUZpGv6ASsOLf2hfJ8J3ydthC9cw9qEltDJCyYPg5/iJiz7ZCVXGQjbX+N9MqF41310qNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY0/TIZCWwYPAlnB3cwYermtp3E1j2k68pOPo+1idzCLTgJXsY
	fqEGRSt/U5xfjAFuVt43dLliRY2kE6yVYB4Q0hyRX+cNi3W4yXtfsV1bxITWAmwXf6+cZ8hEq8T
	yxk6btlCnAawGq3tTtItV68UsY14Kq5AwXyw5WiZU
X-Gm-Gg: AYBFou1rGy7CnUvq3Y/D2dAssHZRhZDI3J/L8+6vacDGDKQIm5sFGUEVKCxwoydjB1l
	/1yB+ir7OUDACIZLhbicDGKBQGbx6gGvVsOtd1qG5q4XgebjRBhiAui2g9ymgoADAn6k4O05Pzf
	XzuLBWMU2pHtLVVtMW/w/DGSUGpFm2IqJh0kiqnjQOUgnVvKj6pSbkIosED1gNdjy4KmS/BAz1t
	SK4eva7qtSCPJwzvoIdYO57rQ2P5BhKVQaGnUM6PGRuEjcin2UBg0LxUYtPuXh6NgjYvdSgU6T9
	9ONH4mLiu6H+LzLlnGLTnI9GwrmF4ucAggl32EpGEZF0Y6M+VVXB
X-Received: by 2002:a05:651c:3614:b0:3ab:1639:9a79 with SMTP id
 38308e7fff4ca-3ab292b7375mr9897881fa.15.1792352851051; Sun, 18 Oct 2026
 12:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792346472.git.jan.koester@gmx.net> <9c17a1f7f82b953e6f4d9e17f4ca19d5220d7f2b.1792346472.git.jan.koester@gmx.net>
In-Reply-To: <9c17a1f7f82b953e6f4d9e17f4ca19d5220d7f2b.1792346472.git.jan.koester@gmx.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 18 Oct 2026 12:47:19 -0700
X-Gm-Features: AclHuK_TjVvADO7YV_Of3nNvklGJn7yisT4mnRNh7189wUPwvl6Zlkl0ZNpg8pA
Message-ID: <CALCETrUjRpHSTBzO65uU-YaEj4espqnwDSaSLcXu653xJyooHg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/41] uidgid: let kuid_t and kgid_t hold a UUID or a GUID
To: Jan Koester <jan.koester@gmx.net>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jan Kara <jack@suse.cz>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, netdev@vger.kernel.org, 
	audit@vger.kernel.org, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 11:10=E2=80=AFAM Jan Koester <jan.koester@gmx.net> =
wrote:
>
> Make kuid_t and kgid_t (and vfsuid_t and vfsgid_t, which share their
> layout) tagged unions: a classic 32 bit id, an RFC 9562 UUID, or a
> Microsoft GUID. KID_LEGACY is 0, so zeroed memory still holds the root
> ids, and KUIDT_INIT()/KGIDT_INIT() keep building classic ids, so the
> bulk of the kernel needs no change. The member is renamed from val to
> legacy so the compiler finds code that peeks at it directly.
>
> Semantics of the new ids:
>
> - They are not in any uid_map or gid_map: they exist in the initial
>   user namespace only. kuid_has_mapping() is false for them in every
>   other namespace, so no capability in a child namespace gives
>   privilege over them, and from_kuid() and friends give -1 (the
>   overflow id when munged), exactly as for any other id without a
>   mapping. Anything that can only store or report a 32 bit id thereby
>   already treats them safely.

Why?

>
> - Idmapped mounts map classic ids; UUIDs and GUIDs pass through them
>   unchanged, as long as the filesystem itself is in the initial user
>   namespace.

Okay, so they pass through but don't work.  Sounds unfortunate.

> +/* Like kuid_t and kgid_t: a classic id, a UUID or a GUID */
>  typedef struct {
> -       uid_t val;
> +       u32 type;
> +       union {
> +               uid_t legacy;

Linux is Linux.  small numerical uids are not "legacy".

> +               uuid_t uuid;
> +               guid_t guid;

I'm at a complete loss.  Is guid is only unique on Earth but uuid
unique in the entire universe?  Even Microsoft admits that GUID and
UUID are two names for the same thing.

I realize that Microsoft colossally screwed up years ago with their
little endian uuid idea, and I sincerely hope that this is not some
endian thing.
