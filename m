Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95D3BED5C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898463; cv=pass; b=ZytG25TPnMSb2v3SR0utSC54FwiE4FvtvtkIYfSvCHyDjYOJBoVCJU2YDbNk5SFdWP98n+CyEEzGKOqErGV0IGJp8vuuB2JUSn0TG9yrTKw6ovoDhNmIcgW7+3s2lx+Ofb01R0liXFi8I0ziVXxz9pH2qnbmp+w9gpRfWy/xF80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898463; c=relaxed/simple;
	bh=sqoZ94TDKxhKMtEaQYtpm/PK1e8YOo1KiBgbrVI0YPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLB8jRIGkA9chXtNVG6ViOa5MyTby/tUkmKgXnQreEiAL6KegywYNcJ8EGlqFtez5p+cJY9KpTWVLjyo9V7HO8BD46+2mNbUby323J3zITJLKag5X7r5FywSvVFreO0KrRUuEomwBVjYAXK6kRykIoCaeJpXoIX9wW7urz/MVd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIJJh/k4; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIJJh/k4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d319b84213so574405ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787898461; cv=none;
        d=google.com; s=arc-20260327;
        b=gcfv3vRw4hmR8iFR66f9RN0uNWVw3v/9fv+eD5c65ketG7XTB1m5ZMvY34fh+HBPLs
         K3mUkztLtnzKFKlYSCfaOMpnMaYthFdBogwsZozLlhF2nxkWkkFmeNMxGHVGFr/WQEhy
         RTJxUz0CZs3mKsrbZoSYUn8fcxqDk8Z1hho/8BywMZjnTeLvGvY6mL/o7VZ3QXYCU6zs
         dpNbsi3ba4tFCySuIWr0OpS6xpRdSX3WDu2lRaBo8ARXvGM3hEXSAzh3/Xgi5Z9GdGMV
         hKWKEJW8mf6cIUP6TjMrK2V6mLeHTzorNx04+d9OYTZGXaipfjV8PYtJWZAHw+BBR/wc
         dG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        fh=MeYn1uBpLCrusrale556cNdTt+I57oDpIqYmRgKLNIE=;
        b=MAzHYfxNWfauuiT9poAEbZlCP5gP67MgUYLYHKBhmg0Qmo0iZYOd1PIb9uyE89Ebv9
         NPEfadA8uTCWCo65Y650yL5tLfT2UeMQDef5Uxi0uV+Dgg/yHV278JItEIm7aAv7pl6i
         13N3tCJBQ63BFJEBbb65lkiNSOkC8UPVRnj2PMv7DF1AXK68Gltv4PhpR2CwtwPgxZfc
         NEOtO8VCQSThoudTKjS1FrwleNCUJXtucZtD5E88QhElCB7N/uDfC+JqhrJjOXDHaUHt
         /ce1vP/lInZm7Zt2dARapigY7Z3UmxvEhOjAXgc82RPeDV7KKwHZ3UOEQSE84unWw9r5
         ahhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787898461; x=1788503261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        b=qIJJh/k4UmjPVgvS0qlsnxPn1Iah9n+eN8J5ne7xQd153XWI82luu2TmbsVIBM+zaa
         Rgr8RDBtWiRHXEUUzvS+k9ej6h3lMpthIvsjK7Gy0WyrGGYekzZ9QjVDmrLcBSPSr6iY
         +GCfPpwSvnfL+9rp4ysxZSAdQJ2mC/xVPc7wZu3iTkQYTjOr0eh9ExVqP0c6rmui/sud
         Gj6jGOAiCzfWCNts4z1OyaEgp2WjA4iw7dJ0TLxoi28gOo0BYZpnRnx0SZ+CDPHi3wfS
         IK9ZX2BN554w0l1UTY1ol6/0f5wrptyJjUN9+2Kn37O9cKOfOtACvmdkHkMDJTzNd8V4
         k2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787898461; x=1788503261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        b=Tg5uhbxJIs3uKCexByvm9RqlxIs1bhYCXFJz2Of8GU+1rkwYbUIDEtzUlp3ZVKbu3K
         9uo4KEDV5bC34zAfU+nLm2MRWcM763rw2jijyoMiF6tH69eYay+4iQWxl5uGB2axehO1
         mqpAyub5W45Ke19HOqaY+J9UUJTugj8JvqAHmzR1uzIGDUKlQEW2gT3Jgo/ln0l9B3V2
         Uq2bybCWfyBFUIuEn3xzrmWL2kc6ndoiJaTCcQBjwSyEgvj6AxlInPtntOU0Di+gGrDc
         /OT2eJnX0+Il6do1endMcHwti2t7qVdKwpU/xQp0G+8YHJDUbbEXlUbORSUT7Ivc1MNC
         WWZg==
X-Forwarded-Encrypted: i=1; AHgh+RpmlsnCCUFaQU//TAXm0CCasIm8UozD4sWAk+Atp9DHq8J66aq2aD/t2U6/zgd8m/Ci4orw5dEjb6a0d7A=@vger.kernel.org
X-Gm-Message-State: AFuF++lDb6EKf2JK1OzVa05jBj4+qAMfv2/HQIR0ArXL4+LisKAAuAI7
	OYlzcDvGEFxfUiqg/WJKupJiYMMlPLHCK1OtjpSBDE6pq3d/OUzpKiswf3E7eYvuampFL3U2Ua3
	B03cxLQsUsYiyAYYsZl2p/miogmamy28=
X-Gm-Gg: AR+sD13vPR2ocTYMXCNvQ2nEJ96UnsB2l/FmYmDC/zPtSSACDLj8ApphnRVGdwAp3ra
	y8rK9ILLJ9fWAejr3qwTqmqvQJy6SL+oHpyavV0QP2q4cXhTzZxGnl5TUiuon0DYZybDjhBmm/C
	YW/ohhtP3bs75ETRCsqOj6D3K+Vu7EF1q2LBZsuXdiJZs8FRxeCAtxj0PhRQskIAstaxsAU1w3M
	oODrG0MKxzu91VjubZtsSaVhotioq/IL2c8UeCyVCh11CrJdudMtUnZt0NzfkCaMcIyCYPA58ZO
	PEcF9pCeN038XCHZ37tZiTvhZl2B1a3fQsF31Z3oVDDyMtzTg3ErJk1UzasdToBP9TezzUEUrsc
	Mb/o1h6oxfM9TKSEEGdUJ4rFExDsISN53TgWndMwuQ00xEaMlZFe+BJ05yBM/h06maZzSxUo=
X-Received: by 2002:a17:902:e742:b0:2d7:d12:552f with SMTP id
 d9443c01a7336-2d74ce2e25dmr42511675ad.0.1787898461636; Thu, 27 Aug 2026
 23:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-7-bc74c77d0214@nvidia.com>
 <DL0BIY2CGYQ3.TY18JERIWOUK@nvidia.com> <DL0BR314U4Q3.PMFAV27Q6EM8@nvidia.com> <DL0C0HAK8CKB.PES9IOYFNA9D@nvidia.com>
In-Reply-To: <DL0C0HAK8CKB.PES9IOYFNA9D@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:27:28 +0200
X-Gm-Features: AcwNN1XEykTRjxOk-JWsfu04X-RzlIeD5qnkPfp1CbxkCq_OEMkQfZ4p6INdjp4
Message-ID: <CANiq72nunnWs7+-fwJTvqYQn5J-0bbNq_O4LBkua5GymX1vN0g@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] rust: sizes: implement SizeConstants for Alignment
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:36=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The custom is generally to have `Link:` follow tags like `Suggested-by`
> or `Fixes`, but I guess it is also ok to keep them as general context
> when nothing matches.

Yeah, normally one provides a Link tag after e.g. Suggested-by or
Reported-by, but the Link tag is more general, i.e. it is meant to
provide context in general.

What I suggest is using a reference like [1] from somewhere in the
text to the link, so that it is clear what is the context being added
for:

  Link: https://... [1]

But sometimes that doesn't make too much sense, and so it is fine to
have the Link: tag on its own too.

By the way, the commit message also has a "code span" in a new line --
I would suggest indenting it and removing the backticks:

    Alignment::new::<8>()

Cheers,
Miguel
