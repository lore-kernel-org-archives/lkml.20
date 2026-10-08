Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3E3BFE3E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490729; cv=pass; b=IRfLwaCbfsvcMbAIqo+BbqWbWIV9oDBScGFC1auzxbJo6jc8//KR5/gkZumhXPs/A/aqZqUqODQUrSHBO/8W96uvO4CAqK357vgViperjz5agz2Qc12s3oRgKd8FMLQJuSenBa6EPTQNab2NyuzKi3WSlS1hU+uNtHcD0XEm3MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490729; c=relaxed/simple;
	bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGGcOeKdcd/nEvnpm7SdAn3HuQ2jiPG7wGeM7Kgrsive+0ISHHuM3Q4U1R+Ek8sl/Aoj6vKUr3dAoCshesRhPKsuTYJwLfQnW5kj76pSXUbno+7A8AZo2mX1/D2pgvGiV5nmbZnWmrugeidgAteJll5ljkQJtjSriY5h9kQH+Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bsMOcwg/; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bsMOcwg/"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c33cc572e6so1100604137.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791490727; cv=none;
        d=google.com; s=arc-20260327;
        b=PIptfNDVOa0wccxedglFxQWGWnCPZKoOr3UhmcYThaOnkCj0yhz42P1oe/gBhHZVtr
         vt9wVyk16YMJQvnj3rFOIwc+eNu8ZTi2OQEFfwMtRewFIC21GqktxnleamzIWQKejQhr
         7xaU2TRdZ0dJWdKYx+eo/w8VdzmUXg+fDh6zkyaCcviEoi8VcfsqVsFqyY7sQVJ0Uup9
         ahEZXKnh9/1oaC17KJFJqJaMFoWKXzz0fwUIBxx6qNJYN1C7+lCTHmDnILVTWztPMdRK
         +mZOwTDv9KVBBEsEPcqRlysbeRxTg+LhjsAJy1P5Zg0ksfcU4LmbUv/x1s8afr3CQ4rn
         dniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
        fh=2GIX/WcWbtKZjoOWB2yZfW849caSaZQlS0nmCT7GdxY=;
        b=Brx915+gZiSbCNhrQIZA5tKG+4+pFcp00gfryw9nSqZ0xUtvBd58RreHqPVSOCoWeA
         tdllpeq4binTfWP/oojH6LrZAfYGrorCv05Efgj1H1gxWGwMBGwoID01sNrOIx8SfoV2
         u54aLz5jJGcrSagWIQUSott9FWWbN8fbYLduqV+0nM0RI3YeW6MVYT1GsVebew0hIaHn
         kzKGHy53DrG5Zb4rrLL2accURd8SDcdLs07KAwFo7T1s5hFImF7VVII8xvfKgmOoUGvm
         FP0jK5v34TFoQrmzxSok5ydSszgmydx4xXf/JQqHxeQAfH5lJCca4B6YN3EGQy/L2DYL
         d33w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791490727; x=1792095527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
        b=bsMOcwg/TqjNJt6mzjEnBVD5MgjWrM9hZc4gXZhHxG9gOqG3TyxHRnOByo/h5uk28M
         alY3fz61t0vsyxmrvvaVfugea1e57DWLOXJEoZQTesMdB4UUYdpdtzyUIKYen6GqeGpH
         /a2acJnDF3aArwA5kbFD6hBSmnZukFnJN2PYLAZ73Fkjtq5h1nhGObzTJbeyPR54f28d
         qUZBDsoWsOmtmUOEUQKqSXmPgtktKv54yc3QVJAOiq0iM0LpBD1MD18YQH2MzchwgNIP
         4UsiuF00dP6YTxLhR683n5mjeJbimuZwqTyb+rL/yoXcqkmuqZrn2R5eRtHCdG15nAZx
         9w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791490727; x=1792095527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0YNlsqK8DlWZ011G3qdno2fBl/feavG0dTMz0RNBQs=;
        b=x2tTeBRotO9/I0wVS9dBYeeZbDlC4k1qdCessKp/x+XIVAfMKdz8nWC23dSm2zAYWy
         UcRBefJKtKV0jk49MML5R7dnTqbb3py2+R08ERCeLVvfSleV9In9U4JwFxrM7unruEGq
         hkKWGiK9f2M3A28Ly8qZEOgu4VNHEXsCeSLtJz8dcw3kfUhzsBr4fEioj5qh/lJ/ReIe
         tuG+vS+QoopIGk4jQNZoUFYsxYHsc9AqVJkyiS767NMHfGgAJmNyUBui3ZvoQ3YTXzU2
         O15euZwiajSvrVEosKQfUaNvHyNXRKxtRbzki6bEpaGjculjsvskmrY8J5lzOk5Liy+z
         9m0g==
X-Forwarded-Encrypted: i=1; AKwUvBxxGJS0i09B4fUb30Zq7HUI+UB/9Fqfzk2wcq8a0Khmw09zt4HxwSnYWQmExLiavTRCdDtIG3LCs1BgfW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt52/cbBBMhLTyybgT2VuKBMAYkchX4PCgON/pqteWAPA3Z9cZ
	FbBSy5DrX72i6wChUc6MbAJpw9XuFoJ514Ej+tsGonKEmi8hMh49R5fM3HEm8dTj74qAgCLe4aZ
	24tcUJr3GtoZbMj4LH60rJK6zEd7nO1Jz8mdcPI4=
X-Gm-Gg: AYBFou39aOY8+HGkPA/ZQmSBaKsiSbBX9q5NO2jlMtuLIeXIfZyw4Cm6GV52v7Za4W8
	Sbf4uG6NOLgUsTgVKjQ7zhPOAwKtN1tv6J+oAefEgi47CodSpShWygJlfZekE3oDpQMPf6BCF/J
	U41SuyTnRFVe+zSDg/z0ElJ6SzVcGq+tTZpPU9EmZej6HZxhwVjwDKUTWDKFXorVUO3m3mM/1N1
	TQYlTNcdhxjAG7li0ieNPLARx+/jExneLVe4Tgt+EgnfLxNCTCujs5OQGReq+j13uNeK/3lOUWF
	BSWlLb+qAyUW9x9z97XRMwNUYhs5FEDv2JR/Y3dNMXoDDnNTdYWEkILTRjHWfcID4p04fSu/rXm
	RE1OgEAuVBbn9zOntlasj
X-Received: by 2002:a05:6102:6b09:b0:7ba:b5ea:c4b8 with SMTP id
 ada2fe7eead31-7cb36a8c674mr1668137.1.1791490726658; Thu, 08 Oct 2026 13:18:46
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <asNuMzqz3G-gmIiD@google.com> <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
 <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com>
In-Reply-To: <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 8 Oct 2026 13:18:30 -0700
X-Gm-Features: AclHuK92jAkOpDGnAzk73p0KSvQJ46QvtFBZiCrror6Oc7PBOFNeUEbwDIK5rPw
Message-ID: <CAGG=3QXRPh=3rYyEHT0kTzDZ4omeHOjmN3OZGy=5hupday7jyg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Mon, Oct 5, 2026 at 12:26=E2=80=AFPM Bill Wendling <morbo@google.com> =
wrote:
>
> > I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
> > macros to prevent this. They're similar to `__NO_FORTIFY`.
> >
> > https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com/
>
> I see you are hashing this out with the right people, thanks for
> going the extra mile and fixing this properly!
>
Always! :-)

I'll ping this thread once we get the problem solved.

-bw
