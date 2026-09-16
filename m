Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D57260565
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562883; cv=none; b=LdOX9cwcXD6w2wxUZPP3kebJfowAF7vMicKLZEfm2Guya8J98waCJVHqVVua4AkeRh/iWDVPpgN82Y6WDmOueYfTzIZDDR8dVntpwAFYfwEgBMXoQHrNADiylgdelg22Ek4IS1C4dsLNrzotoc+miuhAW0gI+DkTzyRQBaYTI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562883; c=relaxed/simple;
	bh=pF4Z1nahF4n/bVVB8LrpLu/J89R98KhciUBy0FswVAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DwNXrT81XjqmPvGiNqif/R9E3BHga5wGnyPz+PwAvkkTkanwRmDET9LUsieyad0orRfoWy4QpucteiD8cfeNnt/GzNEykzBN7ZVHuVITxxB8SawIO52QyorthltVpIFIEuf1/RtIochcj0kxsHXQJGEa1BPR6QytxX57acF+YR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO6rWiGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO6rWiGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9DA1F00898
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789562881;
	bh=pF4Z1nahF4n/bVVB8LrpLu/J89R98KhciUBy0FswVAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HO6rWiGGoXUibLEdm0OOC501JdPqHz9pjVMIvP1Hv3gNzqI0q7iSY7AElJfXzykw+
	 rVScEEKhjlljY34PeC1lUtZprDNsl3HiZBmuGiHvmpzdSkRy9ZVh3ZDFQTfG1alN2N
	 xbEIHh+VuqPerDqB3jgKj/fnECw/hq7CEHiyt8nw4AiM5ExrAEUVwyFKDFWPfa/1kG
	 HiYZxv5UpP1mfjc8K03rAtfLRzLV4q3KsvvMYpR3r/ZrRaCoYP9hijnDXIfSzpIKSh
	 6sNEn/Nqb9s8CNrjBncUADA8oOr9m69OpVPG3pXz7/JmS+pqe0GfQSLmICihyOQTdt
	 gEXmOUb9GjRvg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1118518e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:48:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzIa2XRlHETXsNVmlgSazWSkBlWnxeldLavqIwzUoIig0x6LiM9ZZpsN+gMG5vfcrPqYLVKpOHmeN/LRVc=@vger.kernel.org
X-Gm-Message-State: AFuF++kemP/jHDs9Q0lFFnPKmxwpLGW5skYRr5EDm0nv3pKaJEQZzxM8
	AwGbMI2d9Qe4BSoW7T2/qaYrvEIYYEzEOgy0wERKFNfw+u3r+NrZ0Tws1mcIPsLCNHsIB2amJgH
	rJ2XUCv+Not7nSS8hWKrudqOQpUGurSQ=
X-Received: by 2002:a05:6512:3f22:b0:5b8:23ef:34db with SMTP id
 2adb3069b0e04-5b8b65ffbf7mr664198e87.6.1789562880080; Wed, 16 Sep 2026
 05:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916082623.3972767-1-arnd@kernel.org> <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
 <75d05e40-789e-4cfe-a6f9-fc86af5864e0@app.fastmail.com>
In-Reply-To: <75d05e40-789e-4cfe-a6f9-fc86af5864e0@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 14:47:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=NqTsZWDyZe=KvFVjtBAHXDyQ-+yXikA8tdxrubBRmiA@mail.gmail.com>
X-Gm-Features: AcwNN1XTVr7ctQab3bIfjuljjC9Jfq_rcYJ1ca5CFvzWyBtotnMTV1R6-o5sCQU
Message-ID: <CAD++jL=NqTsZWDyZe=KvFVjtBAHXDyQ-+yXikA8tdxrubBRmiA@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix link error for CONFIG_USB=n
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:44=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Sep 16, 2026, at 11:45, Linus Walleij wrote:
> > On Wed, Sep 16, 2026 at 10:26=E2=80=AFAM Arnd Bergmann <arnd@kernel.org=
> wrote:
> >
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Calling usb_hcd_platform_shutdown() is not possible if CONFIG_USB
> >> is disabled:
> >>
> >> arm-linux-gnueabi-ld: drivers/usb/fotg210/fotg210-core.o: in function =
`fotg210_shutdown':
> >> fotg210-core.c:(.text+0x40): undefined reference to `usb_hcd_platform_=
shutdown'
> >>
> >> Move this call into the hcd file to ensure this is only used
> >> when USB host mode is actually available.
> >>
> >> Fixes: 7dbc2e1ba8fd ("usb: fotg210: use the common EHCI core")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Good catch!
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Apparently you you already fixed this yourself in commit 600334ef2f29
> ("usb: fotg210: guard host shutdown in gadget-only builds") in today's
> linux-next, so this one is no longer needed, the two patches are
> equivalent.

Haha the solution was so different that I didn't understand it was
the same problem :D

Yours,
Linus Walleij
