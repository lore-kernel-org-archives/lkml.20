Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188963955EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899349; cv=pass; b=aw71qkbUFzEfC09DTISLgadcjCOVONqIdtoj+b4swfeG/Wi6mHzQJcFG8Vlylfrn3lLSorrrs0c4YcwJO8iJht/nkWJ+ILKM3x2rvJDxfwWJdiQuA9vYAlgqgWOgWdo4bj5SENRcbBmVn75QtzONj2UupsR9U6V6snJNiiFRTB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899349; c=relaxed/simple;
	bh=5KKxHFt1utd2J5hTIaEt51KhNsCi8K6LQ6SAZ6t4QIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRIWQQ6m7//P93c2XYb3h+CWFPIEzB4UHWb0R0TRk7FwkqAoN3nBPWMlb6aXKDNNZmhYRwI5I9/b157IPQQjMN3QWXQaYMbL45jbWXC/eZmET+gO9AvjOWM9s4ixBf02LxfZstAB1OadyEBQsrIqzAEEC0AG4eyiuOS479JtlhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=g5pJ2PvB; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="g5pJ2PvB"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67694513f2fso2224112d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791899346; cv=none;
        d=google.com; s=arc-20260327;
        b=PtY/L7rXUC+wIsRTpSWB+nTWmKoo7L/ngjJphbJ+kBIZ8ah+sO7Nmffjo6hqkMruzw
         lL/PjB3LxEdEyLPfGfZ76lXR2sThowgjepbizr/EJX0iE6CSoxnr6JKklVATKscS+zl+
         QR60DB0FCOkL4eCIPBCbMZc6Efj24BvEaQBhB+QX3B8N5YiqziPN/wfrwOSKnUr+XMPJ
         /yH1yt383fR1GDgPj5K4QBPPxhAGte7y0XoKvrRaFMBU5XPetpU9aGP/ihX0Jhngd7+p
         JO8z+5QuJ8vRFGZnkQBPth2UUiSPDhnZj+43a0ScJA3VXmgPyqcO8QqWBJlFrug6K/Gz
         WIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8JC4TnkkkQJEykNKjL1ks28PzRDsA6E7qVy20XFBtGg=;
        fh=DBOwgToVaF90hrhyPp+RdVNl7fL5Vyy7owjee9ZFRK4=;
        b=jF/9v7vmtfWR4rJt7SKv3k8rzULz4IIww5l+aib1FI0Qez9jKekomWQjM+CluGYbeG
         pJv6Q1Yf7fj2k+dJg7PwE0Z6QkEABUgyIPMqUfjFEZQbK3Qr0FYRY7VumnEyP1XMwgAl
         qZEoPjC7ypUW9sYsyBSQVarh9yqdTlhmTYruGRQq9hliv8fBHfyD/drZNMFkVbGlZ4p1
         HZxEviXr7s47aaMGqcJ53Cc7sOGrcv/9v1YJf0aGw/7INvHHn2302gTkSK/t+4gJoaFM
         88wOv7d3l5CPi4lggjeGzxcxj3pEH48aS2uKJM3p34XIjJp/VTZAIvCRhMD4587Ol48q
         biXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1791899346; x=1792504146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JC4TnkkkQJEykNKjL1ks28PzRDsA6E7qVy20XFBtGg=;
        b=g5pJ2PvBpBgk3Mkwkil1KMhFvR35bYn03IajPqZCS5nLMlc+lNdus6kWwOGkSlkIkL
         /bh8i2+qlWjRd0B+ped23UN4i2Qov/ya+maIoMDqgIECUMsxoVeTgJusrhgiKCgwqRwX
         9Yn/cpSDLp3eKVL1Cmtg9+bVU8v+Xr+4sZGGzn5Po7aZ5yMhR4E69N45QJ+IJc9FLRtD
         CRQlTZCpIxheD/DuV/hEX4v9zU6M8bb0fsrBc+XfTjrNtKFPX1pMfSdJM1XBoGuxxDKX
         gPDL6mlb8Wp7E//L4niWydX3Do1v3EtA1sa/4nqr15EmkfXE8dO6EL+5h7b00FVnhO0p
         gxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899346; x=1792504146;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8JC4TnkkkQJEykNKjL1ks28PzRDsA6E7qVy20XFBtGg=;
        b=QGUSwqRKIpJ/dz259+jIx9rujzg26GNdN9wlMR/hVnB/LBxocn7CBJWhqQBzxf7slQ
         9J+OEsNmwpwGN7mwKh11P6nbCMzK4tXdDMuSmSHlzweKIh5npXZ4uC/+zj2u66Jo3h8T
         HLQ43/untENqVrewQBTJxGG/25FYQgNt54Un0ohtYqyJoL1iB8POVA2ryJ0JdhH4QmYI
         pZrP4x+jK6lPEF2D8n32r68exSugrKuXCpjWr1cPndDJkMqPWK/m2fsL0xe/QzazE8K7
         EfK4M/q49b9b/1S+kXJ6mJdc2+MOoTdPvMb+Zy1XVt1MSohpIcCtcyYMQHqkOdoXKNDJ
         Arqg==
X-Forwarded-Encrypted: i=1; AKwUvBxnv7lYAbGdnOHZW+bU444jwkGSlZWEEpveaaTtBBlOkyZRgt/bQiYDTzLTug9eNiA4bfRDMOwSdaej3Ks=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0iMebzWR7IBK19GfovczPoeFs7v5IpaqWXrb7r0lSsO9QFTx+
	7on7qJiNdhjaFdKfuUp8itYY8AxgdgTPCogq2vaawLuqzsIgvFWGfAhRH3bELcNwzvJa7ZPxnMV
	cOoRk2S05+yxN0H++FleUPqlVXWvjvdwV83ScF3Gz
X-Gm-Gg: AYBFou3LwVSmcnGQbA5Q7ux33nqpMewHeV4ZZKiPduMMpWAas/NMTe80LxsvYS+qkU+
	S1W1fjYXVImVJSBSP2B4Eg3CMSaL34kRgU0HWDfBcHGVsrgnCNzlfAq7DA1Vvs4I3vEmfz+/ezv
	UX8YfedBkn+hl87UCXXLVeYVOh9s7uJ6UbHereFHbhGUSMbhEIpNktJq0qgu1RdjSgPAs0oGLpr
	P3rB2PK27+KEm9SNNC91jqzP6ODwqOGClYXiz5ZegNKS84c116Z4lKC++6AF/K6aRjGUgVDedzL
	Mts4/tbFR2EGOa8wcbCmghPRxoszxJXFDaNKp2r6G9/sL9b7pri8LHDq3aek3U9ajYdoCD7QX05
	Bg+7n8izoPA0=
X-Received: by 2002:a05:690e:11c6:b0:677:d3fb:6b6f with SMTP id
 956f58d0204a3-679362fc5afmr3581571d50.116.1791899345622; Tue, 13 Oct 2026
 06:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783352430.git.sean@starlabs.systems> <7acac70a471452a6ccf23b7ccc557f3c3861e0ad.1783352430.git.sean@starlabs.systems>
 <20261005103011.03175826.michal.pecio@gmail.com> <CABtds-3t+ECCPeFShq__iNa9niRAge=WOED4cHtNZAFVw6kPzw@mail.gmail.com>
 <20261013142737.7b10a5b0.michal.pecio@gmail.com> <CABtds-0s8Co-qWk0xm=R1pdz3JyV_GyaiwYzgxS9g2tFwtHRzg@mail.gmail.com>
 <20261013143836.76ad7bf4.michal.pecio@gmail.com>
In-Reply-To: <20261013143836.76ad7bf4.michal.pecio@gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 13 Oct 2026 14:48:54 +0100
X-Gm-Features: AclHuK-MIJsRpvubJRFscXHmX4V8Uu_X8keb1uPXgNmjX7WNlocg-EqGPJtslF0
Message-ID: <CABtds-1kHYrA_RtTtUh0jmx7jC6=08vDce5pREWhtv_cxGAgAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: rtsx_usb: avoid USB I/O in runtime autosuspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricky Wu <ricky_wu@realtek.com>, 
	Lee Jones <lee@kernel.org>, Roger Tseng <rogerable@realtek.com>, 
	Dan Carpenter <error27@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> For the record, I have no issues with wakeup on insertion when the reader is suspend.

I do, but only on Meteor Lake

>  The problem is when it goes to suspend with a card already inserted and doesn't wake.

I can't replicate this at all; my "bunch" are all fine (glk through
arl, and cezanne through phoenix)

> Sounds like the proper condition is to ignore the card if and only if it failed to initialize and has not been swapped for a new one.

I agree; but that approach wasn't accepted.


On Tue, 13 Oct 2026 at 13:38, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Tue, 13 Oct 2026 13:31:26 +0100, Sean Rhodes wrote:
> > > I have a card reader with RTS5178 and a simple SD slot, no tray.
> >
> > Thanks, but what is that attached to? i.e. Arrow Lake
>
> A whole bunch of USB ports on various xHCI and one EHCI controller,
> none of it makes a difference. For the record, I have no issues with
> wakeup on insertion when the reader is suspend. The problem is when
> it goes to suspend with a card already inserted and doesn't wake.
