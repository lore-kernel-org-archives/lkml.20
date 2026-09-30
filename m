Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2494CEE7D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772125; cv=pass; b=SxDT5SEuY3gMepsrK5M/k8OGgt4n6ADQ2xbn7bwo4fEDB/FTl/r7SlZ+iZ6R15L+1/r7iVeDckQioE4owaoTUVIpQyewHCkv80+RmHP/9vYaoXQ92HCasroCpd9cMvR1r5gBTFjw3k9BaJL6wte/b34nr+/ogY/dZ7y/fpb+BX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772125; c=relaxed/simple;
	bh=lpwNY4ItQsPakLJK9TLOtGMCwGHdO/fJFXSgDZpfELQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTMceOV/8hmvAtXjVaS9WHYlaxaB/DilzCLukRdIuKObUu24J1lloXvcsUoSI/kjbW8Hf0dsOFGwBYYJehNuqAEPzAfWwqgrjFTZHAHUoLVdTaialQOb3nE4jUL17pKK0MQGnKT4qU/MTagt+urTVm51IC/mXlfeiT02z2sk1kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U426iPhc; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U426iPhc"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso749992eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790772110; cv=none;
        d=google.com; s=arc-20260327;
        b=C7+A99AVzau/ZytZNTkALl2SXrKhznsaDDNcfef1rJY2Xa8CEZ+qZVHYv6+JbuUnPw
         NEZ9heeZOVAKs2A9v4WaZzeFZQ6roAq65hQRHL8HbTY4ekq2Jjik1yth5zJ7WH2CSDKZ
         q0M8tETGdPQa1aWIAc8iO7FVw9oc16sVxMXPWWwAG+Hy5qc2iLeMrNhGXa1I8Tmn169P
         q18OsDHHGjPjT14jR+zW38xQ/g8Niw/Bzi6b1XPLfOAhDQYVHw9WrynRKM4pFCn+smm4
         0+nPYEdtY29l4/s2LGjiEEEeQD9DHY+Q8UrseNheSLGwNiG9ljfN362saYDirPSkr27v
         8HmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VQhR2B4f6Hpo8/6oGqxTMWg9JuHEuKmXAqVeCtqT38=;
        fh=USocxvy97HdjrCsP4dv7VAUth9wvC7kBgIjS6exrtto=;
        b=rMYnHoyl4dunkRqMgjumBK0eJq8suZIynydAfA4Vswe7dkXVKqskklD2T4fBifNKIX
         TKECYvm1Nw+dOBFf+NK9aemIqRkkSpBbk/KH8Fr1DxkdPkM4XsLwZBqylAtT6yk+hNT1
         Z5LXNDTegSSovQV6FYkK4EbLb8GfTLo8mniIAAdoRR9y0xdAZeuxFLTSvDN+CV0Ik8HR
         A9sYJMdBeBhKj8KJOjOZd0npSoa6LUQNVMwPn5X6Ug4kcpb0ai/O7P10wlM8HmWm9nDi
         J7A4jmCWvC00QDk7usGEYLOPD4j/khdQvPGMhs9PHem583ODvwj8n/wxdnYCr4oud2LM
         c9xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790772110; x=1791376910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VQhR2B4f6Hpo8/6oGqxTMWg9JuHEuKmXAqVeCtqT38=;
        b=U426iPhcrN2XT1iN7BsoNyu+aGBD0sZo1H+pg8OYc+nhwGxGr7jmbqtieRrifXxNIS
         vuTGjWOI5Ixp1Hp1uGpTndWFJC/eN/NT669OTevWDi8J7JmY+8Z36FNuNdaUuuV8owC3
         pxqXbZtVADbYqiIZreosGKDQ5tUSO0LSEaQdYitiw1TOrhv8UjwRkp3S+e2Uix6dcbFm
         Sc94XC5w2Ka0SO/oeVqs/F0VAMa0cv3ZrL75c7K7fNwG4WAWZ2BQUHxpGkLaArKHXLhn
         AnMmpIcAnrEtoUqStbSoM8uev5oLpR2rzRL24WezD0pK/LIcbRPCcoJaFCg8IUrSgdPE
         PKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772110; x=1791376910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VQhR2B4f6Hpo8/6oGqxTMWg9JuHEuKmXAqVeCtqT38=;
        b=P48QqQfItc5PdRmUq0cXZUUbQqjjM6iFuNL/egGv849A0DLD8pYaBbJiZ9tYIyfOgA
         AHg/OpnA9HYUUSmo8wQZaelPJvZOEgSV3uB8KHZ1lbEKkOaOFWux9EPu7/gtlvuH5Gln
         oz0eSolHsoevOmPO9PP77hHQ3f7vHI/wduNVmQla8iB1JpcuKmtOlcfmRhaV7T9Fdf3E
         ygpxfKGmVUsyAYphLMY4uI1GsVDMdhWGHytMElSmqKAgh9uRDZgHQPC6G7lhKHkrYpeL
         57w/JRa9cYKBok2oLbrYcf8YWlJc6FSgL8mjAEnqMhAUHaLQcfY4xVmy48LkhRfoBiPd
         tW8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzup3DORYaF8XuM9Vlkewna/FXib5DTjESYi0xBUbJMeJ1cDYbMEQ4ulg8dR36r6+iO7pJCwc+hkZccEoE=@vger.kernel.org
X-Gm-Message-State: AFuF++m+mPTjuRx86heVTZ2WTm1LzHfb0G6t4wowVEF4CoHcnvRaqrGg
	TyZ7T02JG85RtZdg6h3+crz2FE3/ErsNC3ncd6FQyqmqquPgSTPpT3Q5BG7wGSzG+T384UFPr9v
	0WgLB18aknwxbvSd4R9mZy9AHLvE+7HqAMnF1
X-Gm-Gg: AYBFou0cPwZ7lI0rPhGxdQ+gttNtkaXYEAsR9EIhuAw2n/9BBawiIQNge1KPsIijjGD
	gclXz+Cl3Z334aEQq/y8jY+Va0zwwBUKyzJjIRx4vZxtJiwJciw0fEzgpsGEf02u2XlXEC5otkF
	8DFLiATJ6RhmhahxFpHpslyx0UYMtiMMPJbS7mYaXVHfTMFHBcBBJjmZ6pexBfSS7VJesCr58lM
	Eobkmpwqg4E0I5NyrjoWpoOtaNm+bNrsSw+/2PzvCbCZduFpAz/J19pS/WMIIqqg3VMTUDureV1
	l4G4aeTm/7oqYm97KAEuYKYqW5rC2nT4+Lsi+CUJ2yTMDxjMLgpF2eRXcgRT7YJNJIMgOg6rZVM
	9xUQMXbQuMaaWfqteD7SyWDFY0nbxQuMtDruqRAe9J8hw3lzaiLUWuAZ/+C8/BZODfkFUeIsJnW
	ZT6nb5jwJjtQRFFtKp4NycfmlMvXvUL9TItynOSzgdoHZZ9iVakSw=
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34cdbecb18fmr2552081eec.2.1790772109954; Wed, 30 Sep 2026
 05:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com> <CANiq72nHOinPTuJ7NLP=X5tLN76uxzz0k5t4tTcU+pz_JOCPHw@mail.gmail.com>
In-Reply-To: <CANiq72nHOinPTuJ7NLP=X5tLN76uxzz0k5t4tTcU+pz_JOCPHw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 14:41:36 +0200
X-Gm-Features: AclHuK_6PgeLG6BwdoZVcsa0OSKE70B150iJ6uNX8SMscLbiFAZtE32a1FCHYWM
Message-ID: <CANiq72=bTO5qsQWqfpgm29eJ8vufBrBg=uU0vV+fpunNsVk7mA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:39=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 13, 2026 at 8:30=E2=80=AFPM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added a number of
> > overrides to the rust bindings helper as the change performed in the co=
mmit
> > caused the rust binder to not be able to automatically determine values=
 of
> > VMA flags.
> >
> > However a typo was introduced leaving VM_MAYSHARE to be incorrectly
> > interpreted as VM_MAYEXEC in rust code. This patch fixes the typo.
> >
> > Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> > Reported-by: Chris Mason <clm@meta.com>
> > Closes: https://lore.kernel.org/all/20260113185142.254821-1-clm@meta.co=
m/
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Applied to `rust-next` since it doesn't seem urgent, thanks.
>
>     [ Reworded to improve title and to fix typo. - Miguel ]
>
> We also have a similar typo in the `bindgen` flags -- just sent a
> patch to go on top of this one:
>
>   https://lore.kernel.org/rust-for-linux/20260930123645.302318-1-ojeda@ke=
rnel.org/

Cc'ing the new (kernel.org) addresses of Chris and Lorenzo since I got a bo=
unce.

Cheers,
Miguel
