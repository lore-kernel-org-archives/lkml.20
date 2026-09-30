Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CAB4F96D3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779290; cv=pass; b=NN62a32YNa7hlXOW77LdVmmVv0iYUcXiYdpJzxA3+DN6vqUOiI9ibD2PTxbNwIDszC3WzMEAsdsb3pKZO4F0Bm1trAsFeHUttk9Snpx8BfCOrwsMEd84fwXNwTRVTJx0oSnKjbIAuYMhghuPJKHpX0a/gsugKJinEv8m2rznLN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779290; c=relaxed/simple;
	bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blHl08rF0iD5/3u709dT6qCi/+6zXA0Ud4MOJF7sapkdKoT6VNUZO0yVfciK7N+f4vg6VkjdGEeVfQLYNSeSfdVztzcPYyDIDulvJSHEbyu7VPmC0nqm8twx1lLi7W4zof6bLbOFtrgeTzFlqI3yitBP6Q9Q7zrorI2qXrbA0OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpFRu80c; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpFRu80c"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so204760eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779283; cv=none;
        d=google.com; s=arc-20260327;
        b=BBEvXbzev7i9/9t++GOmARivE2mZoyhiL4GZZVBfAMM4zaL4rwMN8Hulfs1vsuh4HD
         /xBJtKcFc3rmzbPS1sVR3DUlz2paRksypjbmO/d6ozKu9FN/f8/nFqvMUty2AF0iYuzE
         W3TXvj9pr7r2L9keJshQ0nDnVHdQ5x7hxQqQ3JXuiGgXoN+Xgcf9CoNO/V3nFomWFFxr
         dX0rshRicdtKVbNntqq3E3Ag2yOXGmbO1he6AXqyQUs+ubPI+Q1ea2/Zg77SAaAm/oGp
         TWeOqgav5kCgP9tmCe1FtRtACKLOzo/94lpAG6Vxrvhxmztj8ksBIxfgNyfsLJmdsSua
         Xqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        fh=9k5Ra2S6oqyWYB0zB6j1G1Q07smXw5fyX0rMdz6ptc4=;
        b=CINPVh2vPTdFmjTZtJOnxJ9swKyIfljWl5BL76FKIovdFts1vYYl2fo762XqxQuiXY
         0ryCBWUpOoAStAcBZXR4uaLVP63uAPmD2OmrdDvITO2m3mkp7W4cm4sbRr4WcvVMLjIo
         io7YlHAPu7axgAvUyhzN6hoFqHM5nuXMBbEeMzRkiVCsbvVLWuB0sfGV0GiEWhPkni6B
         mf4IzXQmTCxwsQKJeUUXE/W9IhpYmcZCyCG7vWNX+1jrCmXaxOnbY/jRrWoAOfy4tizP
         +IWPoV82dUPz3kYr6YdmGe//+xIh4Y3CNDxSX/fc/scMIifuXVivDbi9cnwVygiFY0p/
         hZmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779283; x=1791384083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        b=qpFRu80cziiqvyGeW8LNUP5vevcE3Jkzzo8yaPs/l57QvxDsbZ4u+IYcGgZn3Rme+F
         TnAe7X/WKwb0KAKFQh2iP7+2G21eS2Ab34Mfh71WJRRVzzpCrFxqyQmJGtZYIdvGrQ71
         19Ot334LvbHRH8bZ/lJxzcKgTVvzaQ8JUm7CL/lUr2C0Z3QMVILSvdJinWS/Xyl3eNhh
         2xF0zyCxAJwhwOOL/48I8OdgoVP4YuyEB2qNGQHiqcWZ9Hew6O1Uqe4i2UAQbfduvNVW
         wSHRJvwrs9UiSYn8RbwfzfO9u6OmSwWVXFQutYu6mXPaupo55D/C4Mm8K1BO27iKWP2R
         zzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779283; x=1791384083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        b=NXBe+hCr0PkZtcmyJcMloDmLGy8lKpQNXvyrPJnnyCMrVHnuZwhQYf+2uulbztOd1q
         kYx694mhcUWEaXszZhxBEuRqVqCaheXpE5c1PLts5SaV94guG/xRLRZbetp/ApUmEE7H
         cjnUnIdIlqphxFNKG67vroB2vdBhYUuPttP8kBp3F0W8/dIef3jl5sxgI672Qm6ct8Cr
         MJmGCRVLSyJ3EB176iTzd87D3DRq3VVOJdzCJxyrXaheQIGTaNlVcapWjTMbVwZO3o4S
         YAYV9c574g1dc71ZMq+cK+Lp5CLgt+PCchygttSi8SR21MyA+6f5R9WszXZd7XkrLxgF
         /eKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd1peiSQyoIkNkXHIebUx0KQfr67YhpCMZH8j1Z4SOAsPJK1Ck8CUIagtCzDtj4rvavZsjWFouEmSLhtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAonCLHzB35NM0MFGR61Vp3VaI3MJgEuyLenF2R2HG0xAbV2pC
	EoOQi5hZ8S95jIWJ777Nb1j27UrRlvKXfWOR/yzv3W5m4ENXwIb/BANEaVT0GgPYYbG2JhUCTcT
	U+AV5LH3qVpmJhxyONhfWh9guHlnzvpM=
X-Gm-Gg: AYBFou10WjVqTJcybbDi3Ug1V3vbBnzw7fp7SOhLCgYlJXv6L23MJpEKPeoLkNeV2GJ
	TWYXGfprbN8Tx7cKotxpRVkOLACvUxVAV5LFiJwweDn+3uEHYE0Wbtkb1MA5B6xXm4pfvT2R7Z0
	bvzn+z+a+za+FHHid6uZ7L37jnuAZ9lwzoJd0D/Eov/gjdj1Mp5q6mhJNcviOIgvtk5dHuka0jG
	T5qh/1kGOgeCja7EioK4hSnI2gH8hsDD9tkd82PaFLu9uqs5ivdoo7imefgiaUCEylDOY+rFlmS
	4bwqgWWW0aZZ84ndWaNeWWisO5XMAQvw7jkIurFtTQfTJzvuhG9aA3YAx4dlqDgERjuECyZ+FEv
	6T+9aLFQcvdrOElAQUA65/DK+UFtWOuVoSYTLMQ1abM7VtgcSr5oZhkaiyGI+XL0FbOss6EUiyY
	bxHMIbzyiqRR61b+1f22KlCkTZ7oPZVNoqvWdPHRJWZqo1Q8Ry/xGDEFqAjj7mYA==
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34cdbcd280emr3610200eec.2.1790779282558; Wed, 30 Sep 2026
 07:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 16:41:08 +0200
X-Gm-Features: AclHuK_ynM6whJXw6qHZ7KW0enKmjR2gXUpLMMaayW1XxJgbGhEQ4tEW6NDWhxM
Message-ID: <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:23=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].

I am glad it worked with `b4`! Hopefully no more Gmail issues :)

(Nit: in cases like this, I would suggest increasing tagging with
RESEND or maybe increasing the version to avoid the same subject line
in Lore and other clients.)

Cheers,
Miguel
