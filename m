Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40914F0542;
	Wed, 16 Sep 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559048; cv=none; b=pa00CzegTOsgW3A9j2jfrrDVOvV+XpglL+IvKA+hWidSOUAw6m5QVDm/w0YxHerfl8one0NyRsGN+OtElFuOgS7rRGZJKwWkWPndGwsWTvdOhRMCYfyAnzGifFgfJdSvlO86hceZ7MvCpuR7riJA6KwWLUqxNxKMmT2JwYr74eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559048; c=relaxed/simple;
	bh=1qP4pmeZubOeoPvJBC9OO2x/NeRWI/yqNAT2NYBIljI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uOxO9WrzHAXq/BGdMTfhjHKMG6ekx+TrbT0XDH92vMF2/AVtedF8g9x+Qb/CN/0gcQeV7YfLT2/xJl8j7xb/M1/bSFjbZ/CnFF6eLiz+p4OFJGmDwiCbfBZkoMaKPpFgofHhopQ4wA0aAx8tNJyrsKN/9TxgHMQv3q7j02BbpRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XDHNRboR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b3gaU8MP; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XDHNRboR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b3gaU8MP"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8C6514001D5;
	Wed, 16 Sep 2026 07:43:56 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 07:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789559036;
	 x=1789645436; bh=AuK9Y+fDU2IDOZklY9+6SutmjPluEhmiIu2zW3AAOw4=; b=
	XDHNRboRbtp0qDy4NXf6fjRAvA9hxcG8i3k2n3MoqiF+aVVcQcfX7NmJLRH6VbTA
	kcEy+HTgd3M265uBX+qYktuF8v18zaBHNQdP5i15Rpt4DXIfR2rtc6pPYlL6g6AU
	4uIkTjHCz2txSXs9EguPs/ihdE9YEUr91WjS6T8ozcGRvWdSBjOqIqeQpkjLkTls
	Oigq2M3Uc2HhpkZ3zQwCor3rpJVbKrP0e7nVvW+dnm7vSgaTtxlUZOg3gpEAQWBy
	Nidjl6ibsvF6acS9bwGM2elhC67KRhyvRBpOOqABlKZOOt4BqE2g3PXctYM91ZjD
	dJrz86LDgLQU3MfwQE0hRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789559036; x=
	1789645436; bh=AuK9Y+fDU2IDOZklY9+6SutmjPluEhmiIu2zW3AAOw4=; b=b
	3gaU8MPDLyKXlJUiEZwCCVILYz1o/h+93Dj3Y+xSEEFC+A71Zg7sDh2DMF3hZ5vI
	Bsf7pdHeLSwMau2AMwYbv5z8KHUGqPFeI5/SHAxLDk/IKpUXeT4ljS3q36th4UXN
	r1exq8skNSDCu/tT/oYFmqkZwfPEAwXqKrBAwf9ASR7RXAeDBmWQ7R3geOY4YxnZ
	eu1xduk+g1cEASInOcXCOJ3kRBBHCGvbMprfouVzaB31JFU4sfaGX+rFtr2PejjG
	D5kNJbIrg2QmX2P7v2Zh654PMe+BIWoqY6P2YE12ynCAnBfTVJ6RwLeuh08mbMHO
	t85CgYJiX+2jo7i6bO7NA==
X-ME-Sender: <xms:-ICqauoBKF9zn0Fz1cbEH2-5qDFWGXc0sfkfXhPslFfkFsOKyBLlgg>
    <xme:-ICqanfgBwFq0sZf4joRWKvpFhjPcoCQiRgnNZJVyLovhcdqh2rWT9hEsARaWrAgE
    xtjXwTK80JUL8QMVWatP4_wLav4CX1iOoaWu7x9-kNJF7ay_XGt0mo>
X-ME-Proxy-Cause: dmFkZTEFgs3EvIoat5YbNa1kZa3NCit8Qxe+50zRjtg0FWUQ01Qwh8/ANAfCzJNWTKFNAy
    rd2mk0b438uRLQNcqcXuPWN7xXzzA2AFl5wSOVo49ep4/zuVfJ+4U0FY6k09Age8dXJ+s+
    NepBA3ixP1Bd3M5TIsIYdYLQ+J5GiEhkat/N4Khyg4k4KMnIt/yyfynNjtXHk80j8qMhh5
    /Dt0YCY242Q1Q0lksCGRIJqlkQHY5SHs3uTOdElLDfD41Ql8e/2oAGcRlt0U+7xSpb3mEC
    7xDqDcH4lMAhlM9K1ACTs1hHb3P3Azg1pkhd+U88v0LKQQeRqVo+0Lf5X5B/CWI6se8am6
    3PeoUcPZY4oOrvz3G4xJY2pgSyG1cC4hx4pJ5R2TygKj1bEZ0H/Ad+4QWzRm2fDrhX6FVe
    yQQN6UormkRCexmYx5TxzdYdgJGF/lO9TWlIEUa/0RtvWn3SU0s3ON+bmHxMy5WB5sZOxO
    GebnzJ72hx/DnScxEi/ixIOWWuJN8VobGsIHJgdHbmSiZ1pb+g7o+30YnM2ri2kzupamD+
    PEWDWC0PcMGc7zJvqBFOzBkYEhDOI4EhHjlugT7gGp/x1zSB5m/0z3FoWgWE/9FE6pW3Bd
    lcdhiuGCMw/+zdhQbEUlHgpyxhH2bVYVQlbg7koh2uTudeKUjiAgsJ36ulDQ
X-ME-Proxy: <xmx:-oCqalZp4112n6EKXVlqvK2rMByudP27I2BHW-NNZO4Ccj6lxSPnsA>
    <xmx:-oCqau_9cizRzruDSLYvaX0ZyAeSAQ-djwZoxFdzbbX1s0Qpn54tmA>
    <xmx:-oCqarmtjB41ETQRNFxgp5sRYIZKKGOKTYIxjDryY57zYr6r8KY9vQ>
    <xmx:-oCqajzjEggKgVNKc_gC5Ly8WYNJBG2aZm7SlmOGqmvUqTfWj775qw>
    <xmx:_ICqaiPVKU8AIaTw0GSf3rczbtbBpWztI1sdOlePtXn444BizA8pYaWU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C1E2032A0084; Wed, 16 Sep 2026 07:43:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AplTfTLsyLRV
Date: Wed, 16 Sep 2026 13:43:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Kees Cook" <kees@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Huacai Chen" <chenhuacai@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <75d05e40-789e-4cfe-a6f9-fc86af5864e0@app.fastmail.com>
In-Reply-To: 
 <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
References: <20260916082623.3972767-1-arnd@kernel.org>
 <CAD++jLnsKoXxK5mdNUqWT+ggn+7k4D6H0HZuCcLu4_pv6QFS1w@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix link error for CONFIG_USB=n
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026, at 11:45, Linus Walleij wrote:
> On Wed, Sep 16, 2026 at 10:26=E2=80=AFAM Arnd Bergmann <arnd@kernel.or=
g> wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Calling usb_hcd_platform_shutdown() is not possible if CONFIG_USB
>> is disabled:
>>
>> arm-linux-gnueabi-ld: drivers/usb/fotg210/fotg210-core.o: in function=
 `fotg210_shutdown':
>> fotg210-core.c:(.text+0x40): undefined reference to `usb_hcd_platform=
_shutdown'
>>
>> Move this call into the hcd file to ensure this is only used
>> when USB host mode is actually available.
>>
>> Fixes: 7dbc2e1ba8fd ("usb: fotg210: use the common EHCI core")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Good catch!
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Apparently you you already fixed this yourself in commit 600334ef2f29
("usb: fotg210: guard host shutdown in gadget-only builds") in today's
linux-next, so this one is no longer needed, the two patches are
equivalent.

I did run into an unrelated problem with fotg210 now, and I'll send a
patch for that.

    Arnd
