Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A16217D6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485884; cv=none; b=hYsln+JuboHbZWirgjeaFh3NEm/X+FU6G6UC7aCJI0NU+9YugwOhSWF7ZKSkikeCZpP7+M3Nppgtbm2wSOHe+nRp3nnWk4muxmGDyI7If9NVKMBUNozc9Y6oUGXACGTH3mTWmg1f9tgd0wsgfy7Tqz8/23L6Y0tNRv43e2F7d8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485884; c=relaxed/simple;
	bh=1khus6Txz/WHyEV8lDS4TN54FptECd/u9MXjKaVsKWc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=i+wvBW/kUIv31BV/UCI9YXnyYVIhFrQ7AVkIyqNb646kIE4hLpvu841uU33JxK5kZe05Am+Aw6a3rN5Y6DyffAXkAJS4A7EQqP7r/nXa9y+1cPlenwGILCCaSEe34uM+QhyGQ5yDLchL0986O0GRL1VXxNXLyfbW6cSVWPYA2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSGzunjy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSGzunjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC261F000E9;
	Fri,  4 Sep 2026 01:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788485883;
	bh=2QgYtI+OXpLEnlSqwZkWid2ba+zR00iyTlg1HGdnmDU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=DSGzunjyd4QB+bw/8DYrwq6mxe6LTIKjqBhmedGlRLMusLgqInZDQYdeZXmooovrh
	 eU7b5iZNY+MIfnlfBgbRUAeMnpFg0idzTGaUOJ+ILaOw8DJaHv9bSzUe50VscwyF3/
	 8/IIVAgflt2LIu5eEGCgxArwsXUixaIsRbQuXK48/3MsrctBGuDY3HVCsfPRtOXkju
	 A2mmpEuXnmKnPvZUApCY/HoTZAJTSvuUqns6TTYrV+/VqIaXIm4vd2gsqG72EhOe2n
	 lfXqOTiycsrIgWAGOECBskcKE8i8HxKBjahgc+qcoTXm0bRiD8iQMqe9kH+pp+78G3
	 I3vccmeBwlpEw==
Date: Thu, 03 Sep 2026 18:38:02 -0700
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [GIT PULL] hardening fix for v7.3-rc2
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72=7msFj95ZYf5u5MfODci3J__KRxYEjZRL5Jj4gVyssLQ@mail.gmail.com>
References: <202609020931.48FF902461@keescook> <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com> <202609021647.3F67F66B@keescook> <CANiq72=7msFj95ZYf5u5MfODci3J__KRxYEjZRL5Jj4gVyssLQ@mail.gmail.com>
Message-ID: <153F0BB6-98A2-4F53-BE82-16385BF01760@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 3, 2026 4:02:57 PM PDT, Miguel Ojeda <miguel=2Eojeda=2Esandon=
is@gmail=2Ecom> wrote:
>On Thu, Sep 3, 2026 at 1:49=E2=80=AFAM Kees Cook <kees@kernel=2Eorg> wrot=
e:
>>
>> I have a fix for it with Rust, and it'll be in -next after -rc2 is out=
=2E
>> We still have real-world users that depend on randstruct, so I'd like t=
o
>> continue to make breakage visible via all*config builds, etc=2E
>
>Do you mean the ones we discussed in the past like e=2Eg=2E my
>
>  https://lore=2Ekernel=2Eorg/rust-for-linux/20260323130224=2E165738-1-oj=
eda@kernel=2Eorg/
>
>or your
>
>  https://lore=2Ekernel=2Eorg/rust-for-linux/202512092319=2EECBB8613@kees=
cook/

Yes, this latter one=2E I was going to send it after rc2 and we could let =
it bake for the whole dev cycle=2E

-Kees

--=20
Kees Cook
