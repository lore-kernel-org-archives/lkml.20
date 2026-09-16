Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED336D51B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562946; cv=none; b=WpFJT9MytaLdtAwn0RUON71++0mJEojJv7S7U5aa58ZuzledL2/K1YX4QUDNbC8z/vMjkBerFd2UOp9L8Z8bSTtrrNqzxoVqzLSIXQqnPUQTJv6y8jtdU8IDUfGMGfTSCVbjIDDb5KoR+Kf21T6pefXh0ihd3uMuIvJXkupU5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562946; c=relaxed/simple;
	bh=XDWCb4ckC9QO3PHnDil0UM01Z8cTM6kD0+bCjmJ22TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nqb5ind7DGUYCOkKtXCxVx8OZwWTBtAXPNJx8MC4nQCkayc3NqTcMKdlYQsxyZjEqKKprNhskOjFFUTPVhPe9Wp1qAxx7SsijUlXfbEmxjC3K2+23LgSycTIL9OpQi8LuoXbLIVA9i5Nac1+6CjczQy4r3TrH9tZUxtLQ7OSI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3jhGW3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3jhGW3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F0D1F00898
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789562942;
	bh=XDWCb4ckC9QO3PHnDil0UM01Z8cTM6kD0+bCjmJ22TY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f3jhGW3a1NAbItmB1xsfzgXiDAsVzXdEC9XxhJhqQ/zK0Jc9JV63IZY6skD8zfRm1
	 Wxm9LSctY6Io+l3MPyIZdugOp/5Kj2RfLQkbCjjnIip1schDg5ASJDBJzumibeyKNB
	 J/LQZysTYifOV1QqQ+3JzH2NBDPYDWldsqhwRiaOjW/J3DomfVlFVJzf4KkUThSBuH
	 lP19YAsckyQC/tkAIX/rjRUONQ0fR4sAK+J+1ce8Kuwgxfw+uJg0zMIIZ6conjRyNf
	 YrOjy7WfUdW1W5EyoKLFic9hnEHGlf4Pjsx3pIUSUTLz4p6ydOZ+tXrD806ILbxmnI
	 Xc4lBvWg0FIAg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so861059e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:49:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeJbNKyhPzFzucieAfilwHaCet5//1s3pmqB+YAN/IO8FKBuUucQFohaEphR0l1WX4o4Nak8BOFka3yPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nhpv+2RkQQdrWGA9iCCTWW4v96jHBUsc9W7S5m9UfgrGvrMz5O
	/pqmZzjfIs7kijaNO6AeG46CDqBPYI4+nZXO9FkjxI+F5eVMhVlHghDWlycXuxyII2Di0XmtQbQ
	+72s5D68e+VIt5fjqIvGGfgAFOJRNjq0=
X-Received: by 2002:a05:6512:2341:b0:5b2:a919:f9fb with SMTP id
 2adb3069b0e04-5b8b6655c91mr1363745e87.22.1789562941365; Wed, 16 Sep 2026
 05:49:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916114358.195465-1-arnd@kernel.org>
In-Reply-To: <20260916114358.195465-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 14:48:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkVbbzsxZ8u469g=XwVcOMsmjPP1c27skcnNqa3qB_pwQ@mail.gmail.com>
X-Gm-Features: AcwNN1VwdnDlWD_3jtgfRq2nA6TC7L88Cuyaa5EX7enCgQeRXmvek1aAryWPqP8
Message-ID: <CAD++jLkVbbzsxZ8u469g=XwVcOMsmjPP1c27skcnNqa3qB_pwQ@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix USB_EHCI_HCD dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:44=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When EHCI is a loadable module, the fotg210 HCD code cannot
> be built-in:
>
> s390-linux-ld: drivers/usb/fotg210/fotg210-hcd.o: in function `fotg210_hc=
d_reset':
> fotg210-hcd.c:(.text+0x102): undefined reference to `ehci_setup'
>
> Fix this using the same type of dependency that is already
> used for the USB host support.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh the usual Kconfig tripwire. Thanks Arnd!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
