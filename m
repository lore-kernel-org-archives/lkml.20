Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B43CB56D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163220; cv=none; b=fsypjp4pou95bqvEUjU176qYbdsvnP1ylCV6ZpS8c0W6vdrgYHBxToRqlevt9EXWgDW+27LB+LmfHkINXjVct0PANb42iGAkU1YVG4RONAqgP1QRJI56homrUSiJCpym4eGgalUYcBrmVqK5eevsXzS4+2JIHxGbxe2gUpB600E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163220; c=relaxed/simple;
	bh=ZGzJd83BAGjp2cT7TwaBLsmXWFTNbze0BK2Zfeclrok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg8fyXtViqO3BSbyKEKA0UxpoRw4+yCyrKagSc6thvjWfEmpxa7LV2R1UlPBUu+DLFZSIYKDhH28+3mPxFEP8W0+NI7jtftIpPcK1EZJDM6whhrSq6Ck5UFQbXD9hN6K7UcSTBLV96UMgMMpHcj0ITvbmGgedW066OA9KAyfAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk7w2p99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zk7w2p99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C408C1F00A3E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788163219;
	bh=ULeEqtlOWfhTY3DrPTSE+Wp5uaJoZujCu6a+kI8cVj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zk7w2p99/mZBnqFjSLarLEjWOOOBgEqqURig2DPtwdStDAMiFy8UL6nXLUMzVc7AV
	 jGmgcM1VtfOrBF4idjqDdWTyoJLDISDBJOzY1SGd4+5lS81nF1MmPGlE4GHHirbjB4
	 zCJFNVaTTDFrtKKcKPofUqPPEgLXJ55N0c0AsA3VHuklL2IV3JEYA/dUYzJtUPBGmD
	 CHdWtGiwI76fU5hathNBPSkmfU5nz6Jd0jRMcc953B1jQXADMKMdTdNBvLQ+3r6Ns9
	 MLXCK83YxmbjyyYrZrl8lZs+V3gXRM9XfWLrIuu5fKdMtEAdw1jZzf6CvnzUJNIFpT
	 ryuwZPeeZRopA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4aa47bc97so2515004e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxSgTYuaiEJT07zzcQNY4VVN96XvMf7873kk5FYk4QVMNMUMG8K66ZML0fZ0Q9eQXGxE9MHz/NDqvskka8=@vger.kernel.org
X-Gm-Message-State: AFuF++m5jR4W+XvYd1Hi/f/dgW6T8A5e8Z1NuCiEyi1Kegg/iD5Yd3Cs
	SXRM4AoArkObA3K2PHyPvjjYrzMqnjLrobjFj+KCkQNtuHkN8GZyXa1QXKiklj/yNR+ORw7BUXJ
	xSocDSF5sS3UN2Jiqq9Hw++WOghcwPLg=
X-Received: by 2002:a05:6512:10cd:b0:5ae:bba5:aee8 with SMTP id
 2adb3069b0e04-5b5e6b0b37dmr7480095e87.24.1788163218511; Mon, 31 Aug 2026
 01:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
 <20260831-gemini-usb-fotg2-v1-1-8a8ee12c4b32@kernel.org> <fef8be63-ab17-475a-a77a-4dc874d1a704@rowland.harvard.edu>
In-Reply-To: <fef8be63-ab17-475a-a77a-4dc874d1a704@rowland.harvard.edu>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 10:00:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkAmnmmQSN=jvcdkna8Bm1CZQkfN1yTAPGGMcCROqUSJQ@mail.gmail.com>
X-Gm-Features: AcwNN1U8zrlOhVBSjBzSBDLJoAvR6uqOqWolnu1rJQ3dFN_Vs5QGLXi4txoZams
Message-ID: <CAD++jLkAmnmmQSN=jvcdkna8Bm1CZQkfN1yTAPGGMcCROqUSJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: ehci: support controllers with non-standard registers
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Daniel Palmer <daniel@thingy.jp>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:15=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
> On Mon, Aug 31, 2026 at 12:24:19AM +0200, Linus Walleij wrote:
> > The Faraday FOTG210 EHCI implementation moves PORTSC, omits
> > CONFIGFLAG and USBMODE, and needs controller-specific speed and reset
> > handling. Add
> > per-controller hooks for those variations while preserving the standard
> > register path for existing drivers.
> >
> > Also allow a controller to reject full/low-speed isochronous transfers
> > when its integrated transaction translator cannot schedule siTDs.
> >
> > Assisted-by: LLM
>
> Which LLM?  Or is that the actual name?

The new kernel policy is to just say "LLM"
Documentation/process/coding-assistants.rst
commit 816d9992d9ed434ec52cfbd63080d518e535a41b
"coding-assistants: simplify attribution"

...but it is GPT 5.6!

> This is a pretty unwieldy patch, which makes it a little difficult to
> review.  Can you split it into, say, three parts?  Such as: one for
> the port status register change, one for the port reset and speed change,
> and one for everything else?

Of course, no problem.

Yours,
Linus Walleij
