Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792737949;
	b=xDIo/eNLuJ+JYYUww9agadUhZPglvKBvUE1707NTW24+KxbRtsjkNqwzfCM19swx64bU
	 j12pjwiQtKPPwnw/oNWLYTCYUhb3Qh5eXhhoKVt16aobuD15CHZ6/D2hJmynHXBnujaTs
	 g9eMYPGvWGOz1qQhNQ4BRpTQ9dvRQxBBxCxh2hGt5/oH7nCR8gX/fS/ziLQxkk3gjpZz0
	 oGqB5vo8EWwlu1+smP66uTq+wMGT5CXeNAcOGri4HdInQvJxGZjzeyu3bEIYqb6HrW6DY
	 PiG9rreIiXtoksMA2BMXqLJ+EH27aW1CXTVPyopYJP3WaHvCYerTH7IgsjZqceoY9Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FyjePWnXgax6OFbSvXTcbJZr2gSepbjX0Gme0sCUEPM=;
	b=WB/WhEpwxSh6HFec6H6VwOsAAIfYmB0Ha/YpTjl9tkorRFAmnzx+/MbrqKZRoX/Xa6qQ
	 aG0nZ34egwTZ+h0grQjhcMLBwNTfV+VksNqf4t3bR3kXrcVfjabHBXVKIlaiwMj1EdnJa
	 mkFbc+KQjb43b6CUCgZDa6iFSrZ2ZYUn2b8z2F70uvqaYrvsQQLjck/tYMLToumQ5bXA2
	 fJLnQ1kuPd1rhAAzppeq563nEs/A40HfqUxHVWmOt33cQ+scxG+cg0LleA4t83YO7OLaz
	 s1WSWGmKBJ907oiCNPT2pUr1v+eeCrQUb8nJ7dxRNrGa/g+KWJfdAUfLK0fMYHyxm7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=bkIYOIoM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B8606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A9B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=bkIYOIoM
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53dbe9b8d6eso343763b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792737947; cv=none;
        d=google.com; s=arc-20260327;
        b=I6Qb66YGB3LRT4Wpfg0q/Wjqw+/TLAVZWAeG2Gd2xrrZkpJ0gSdeNACq/hJRQJCwyw
         99I3+QMyl5l/G6WcUipNXeBlmXRQdcOi2JZGtmflazowM7jAwRftGxLc4j5OOIcqoZsA
         4yaYjjq1Xti4em5fnh5/A6k3LOdYuFTDE89UooVjns6iQacIQTCgYdfX4VFQJZEisYXb
         +147zKrE7Tdm2KVeJL669njVOl2Mp5pW7QjCN6M10U2PmAREgSdNg5wUhVbX6UugUe2s
         Jh6fR2rCTX8pmAo8RdQNKcbVT8OCLPI7PhNxOd2YNv6HkNYRwYHNXjyxoWvXgjHszhow
         LLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FyjePWnXgax6OFbSvXTcbJZr2gSepbjX0Gme0sCUEPM=;
        fh=mgKJq4g1FrUgz1PZU1kHsMQwWkKK8EOXTm8pum7IAP4=;
        b=DMCGulcqtI396xo1xl0TxSLzlecHQt1TtDDj7TlRRd8k+eS43vF4hjB9jfYVEAGJbH
         9EIdDXUu8MUuOiX+6GLuw0Oudjlxzi7TYke17Gp1fAM5zXTtxRmFbJB9th9oT8q3u33j
         qes3nmXw/uYH/KwYWLz8vy96OCOgQF79JBuHi8KU8DiC3AQue8qb9Y3gzfT1JRdvZdUd
         g+fKCzg4DFDC6DrQjpuI7MCKNumV32jnd9FAjnpzw5RqbVlO21wM5Lug6cBN6vET8NIg
         D4YNCvNh/lc+4ret98AuDRYFwX4rto9M2dXWZeqL0r82wDQEtl+hXUexTCWeAkqE/sv5
         b4YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792737947; x=1793342747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyjePWnXgax6OFbSvXTcbJZr2gSepbjX0Gme0sCUEPM=;
        b=bkIYOIoMfPmpd3n+D1UkC9IwK504UKDOOGNZCNoIR/RSKzFSZESGnVf3lUBs5Mrj+X
         dl/Li8Vds3ZGl0JcRXQJV8vK3YzpjIzZIwPPxUsIiWwjVS8XnmuylmfXnGnljCibFoBr
         UGswKyl/DAumKyEgMCSO8zKMEqfLYpMhWROMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737947; x=1793342747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyjePWnXgax6OFbSvXTcbJZr2gSepbjX0Gme0sCUEPM=;
        b=b3K3MgCErxCWMYKppo1NFIv0DGwNtQR0367h3y60zklKXepDYtl3j5u3yxUNmMbsq3
         dQ823d2UlI8zPOvtu1z9Yu/KtgdESaarEFNmep9X/4N3p7dmJU2sDTxMjw/er1UhZkkr
         /d4kGeYxGDH+ovucAu79ZJFa10PTUWimHzMaAvS58FeiA1lg67we7DQZ0D8lZClbJ13T
         kVZ/3Nl2yE3vXTKXpETa88x31ctBrR8eG9B+EN/tdMKyatoUg26BwrEY7dNHcLTt7R23
         d8f7FVF7iKC0ksEyiakRgIaGWka1vpOJkar2OEuwo75O3E0o7p0uyFh61nuur/YT91bn
         qr8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIfwxC7Hne/d1mht2B2pvS1nkejQDa2iwgT4Tp1NxufZBnxYuwtjedA91rY9Lc6tW25c8fPiRgHsCQ7zY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZrupvvq0D2r3elF00B55j32svUvMnPDwDvdra3s4vaT+u+9u3
	NK4u3Ec9mFoRXbFr+s+Fcg+atCA22Xq0mwQw4MuK6WYgLsIUebkQS9d7GwOnCZNigMMYPlgHr31
	eVTRnAabQn9quflvzrARKUwyd3VqTFceQQ87zWKOPyQ==
X-Gm-Gg: AYBFou14irmlQl16E7t+AN7x+kXaXBOyhR+dbYWZYDpYKsR6ZiQ29RpiCIAduxq10FO
	a5om2+V0cBbXX4d/cz5XUTxyQN/ZfLr32tWb2jJKpRLhS8lF+BEi5iEdlYIJuZIhQcwB2bVShTA
	Fc6Ag7zNtP6axcnvC6BI19l0kX6oGMN+g/gjT6To5qahvywxftUs0xbm0gzSPu6NH77Ztdl6qoV
	BsZto8EZ8Hl4ZE8Ctv/Ng/Hq/NS2LFuiCK2AoM4yVhwW6FTf27w0V+FowEUsdm8qeYMvB1I2p2L
	ae4ySz54Tp4vAcezuLUFKq1QHAWjySV+7qXsQrVrRAFOIyxk+u8gyLdQczh2fhibXaFvgHjO0sJ
	zsyWJ3E332TVxQ3B4/kYHxOp/asRMSW7CRQq+62TyRhZq9ECElKGKcpHqnXXQL/bzOwjZQwL0Nc
	dwBuEoCLOdyIxN
X-Received: by 2002:a05:6808:124a:b0:4b2:8d83:436e with SMTP id
 5614622812f47-557e8dce9f7mr2356991b6e.8.1792737947323; Thu, 22 Oct 2026
 23:45:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <asjrq9g8EoUGepcH@pathway.suse.cz> <as3UxRboBZYY3oCH@ashevche-desk.local>
 <as3VC2TmhcRXg0Xj@ashevche-desk.local> <atYw6G8V1gP-ksTM@pathway.suse.cz>
In-Reply-To: <atYw6G8V1gP-ksTM@pathway.suse.cz>
From: Chris Hoy Poy <choypoy@linuxfoundation.org>
Date: Fri, 23 Oct 2026 14:45:36 +0800
X-Gm-Features: AclHuK_VJ6yl5yodUBBjUyvdPb9njmOquuZ4BFrHD0ZyJ9GTo9hnbc7JYeJwBOg
Message-ID: <CAKkv+gw1MiOQQ1jywejHuX6u+SMLMGBr=dbzTZTpaBDmQU-Jdw@mail.gmail.com>
Subject: Re: Create printk@lists.linux.dev
To: Petr Mladek <pmladek@suse.com>
Cc: helpdesk@kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Apologies for the delays on this mailing list - it was dependant on
the migration to the new listserv infrastructure. As announced earlier
this week, that migration is complete and new lists are being
provisioned.

The printk@lists.linux.dev mailing list is now operational:

address: printk@lists.linux.dev
archives: https://lore.kernel.org/printk/

with the owners as specified:

Owners     : pmladek@suse.com, john.ogness@linutronix.de,
andy@kernel.org, rostedt@goodmis.org

Any queries or issues, please reach out to helpdesk@kernel.org

cheers

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)

On Mon, Oct 19, 2026 at 11:52=E2=80=AFPM Petr Mladek <pmladek@suse.com> wro=
te:
>
> Hi, helpdesk,
>
> gently ping.
>
> On Tue 2026-10-13 09:51:55, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2026 at 09:50:50AM +0300, Andy Shevchenko wrote:
> > > On Fri, Oct 09, 2026 at 03:27:07PM +0200, Petr Mladek wrote:
> > > > Address    : printk@lists.linux.dev
> > > > Description: Linux printk and kernel string formatting development
> > > > Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.sh=
evchenko@linux.intel.com, rostedt@goodmis.org
> > > > Allow HTML : N
> > > > Archives   : Y
> > > >
> > > > Reasons for the list and additional info:
> > > >
> > > > Honestly, the main motivation is to allow sending Sashiko review
> > > > for changes in PRINTK and VSPRINTF subsystems as a reply to
> > > > the mailing list.
> > > >
> > > > I have discussed this with John at Plumbers conference. We both
> > > > agree that Sashiko review is useful and often has to be addressed.
> > > > It is much easier to reply a mail than searching for the review
> > > > via the WebUI, copy/paste it to a mail, and comment on it.
> > > >
> > > > In addition, there are several people interested into printk and
> > > > string formatting code. The mailing list would make it easier to ge=
t
> > > > all interested people notified about new patches and problems
> > > > in this area.
> > > >
> > > > That said, printk and string formatting are related only to some
> > > > degree. The printk() code is more about tricks how to store
> > > > the messages and show them in various context. While the string
> > > > formatting is about tricky buffer manipulation and helpers for
> > > > generating a human readable output of various data structures.
> > > >
> > > > There is only partial overlap of people interested into these
> > > > two areas. Each group might deserve its own mailing list. But
> > > > I would start simple with a common mailing list. We could always
> > > > add another one when needed.
> > >
> > > Fine by me. Should I do anything, or will I be subscribed automatical=
ly
> > > (as an owner)?
> >
> > Ah, and it's better to have my andy@kernel.org address.
>
> I hope that anyone from helpdesk will actually create the mailing list ;-=
)
>
> Or I wonder if I did something wrong.
>
> Best Regards,
> Petr
>
