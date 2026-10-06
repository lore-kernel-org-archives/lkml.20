Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0CE3B1EFC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270906; cv=pass; b=fRGtGiGEFSaImTb3CSrwN5XHSiVEgzgCtqXauqNnx8vURG+FLbEIoxw/rzQ5F/lf2TA4YBdgM7Vc4Jgu0EafbRZtTU0jdxOJhTEUfk/CrAYf4VABnJYZFfkhtcu+ooR24Xzj+0E2HDWLPwkcXp6jMnaVOuTi2gSOA7SnMOjvrzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270906; c=relaxed/simple;
	bh=4ATp6PMQr7SBUWePCIQTDnn323iSU6dbR7/g0U4/YnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WuhsU+zCTtX5wDUBIJmIlDU3Voqdobyxo6RPucKn5sj421DEgV6+/08qtoGhn98sYW567wdgJ6MBN3Av+ioy2jwr9hGm2LgIrMNa3YDD6yxnUGMpMXRYXFM3q8FLTw0g+myv08d6P9rtHDqbjNC1Gt7b+V4eAzk7m+/ZRnQ++Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9rr3JLQ; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9rr3JLQ"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-988f270d308so1827218241.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791270904; cv=none;
        d=google.com; s=arc-20260327;
        b=PTfocZ8a58dW5sJesfUFUFTmkfCgIk64VO+w3Xr22503Xbqf7soXCpAGmce6fD0QPf
         /LhqvZ/NRo/EJ/vdNbeydzXC/uwkkRTRykz/CNnBl+y6xuPt3gwiARe3GrERc/KoWuTP
         3ftnSA+V9VwCIxHqHFwlaoJkiTJ0UkSMjV9gL7k2MEwyFLQvgZTmui1e6VQ474vEJPUP
         A6/k545FTzu7Oy5/iyBDtoKtAIr2ggCWY1HbT/sVVMlTfZ8FP6TN03o0IezcaKM9S4Py
         xYFGsRREquVoUGVcRKG36+ZyRGC/LfksK6AIIii07hmeYN2/jYAHW3ho89j6oIv0fxza
         A+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=;
        fh=JvOjGOPsjTU49HbmVEqfJxrmjCL/y/MMheS2HjRituc=;
        b=FZDlhyNKHUyZEn43gF/jzp/kGo8hB9LlQVaIAJ88WS/5c1kRqouSg2caBAkq/NvEL+
         aWtoayzUf6Kd9TFqKoE9D9zk4DnOA1bs13lK1iuYxzKETPstT7nwRpqEHUs3vV3Ku1NF
         LuCdWMSEBXPBndiZH+ppGhn9qYG2GIehAyvH59wzRR1bd3oGHzlvJQZAWurP2lspzgFS
         ieYwprymZnhReuQVQqt/eBxjzyG5Sp1TDHUtZe9fui0VH4Scjd0A5ZmVPnrH1tVuo++w
         AwfFyE8YH5iAE9lIWe9RqntVM5+RrBBoAREd861oNVKuflioWI1DugmaInG89S3uWoAE
         C9Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791270904; x=1791875704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=;
        b=p9rr3JLQaB0LlW22YlT5bqdnG+AuIALV481fmmCazJZJ17j4DMV3sXJC2XTNynF5IM
         Ha+Hu4qJfVOPgkwlEQEB2UMppwDLtCtDPLBz/PqVgIGpQTTftK1g6uWzgtmzrgCkwDqY
         zWSFyJjqbx5PVZBOdGQWV0DU/iJPwz9bNWFpTDeTw549cg674dv7opvzT05wdewh81vg
         pd5Q7059cYTYmPHvwT6OZbxxrEgo0qtVweGg3tPwhtPc+rMLyOM9E0jbBaooc52KiMFA
         lPYKBTrMSXhFQtVd2vilxWMRiyhV53k9/iBrbJASoh9n2Q2VX8G4EfNPqORPwsFoi7YN
         fPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270904; x=1791875704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=;
        b=XD51Y1v3fMlYRfs8puvyfp+8flZ719YqQCqwFXtbzA7glY6KzN/OsljunSKNEtUe4g
         nHZxIa4WrkkEfkVVLXvDGUi8UsMCHzuj2liXs34LwHtWMxvJtz4EtlO+5a8uUEMuOUF9
         EOdmhNGMPKiFHXYi+z3B5HIM7eP2w772swrBpaIqTy9D5pxTdRVXsU40bN+U8DzDlWP2
         Va2E6gM6WivgqussRAFJ5JeP99uFWLXA+ZQBq4JfbuuR2bu0qvFUsaxREL2pHaC3J6qM
         DIAc0UMxnT/lQxY/bWnAOo5MPMRj3aaZR+XJDr5GNIiy6kn4UWGXfNIYHSNXovHpXJ08
         nb9w==
X-Forwarded-Encrypted: i=1; AKwUvBwuqUrRjKjkzk7inDrHpchtxItLCoImteM5vQNAbFuhMzEJQ6zJOiB+cUIrUZF4bQYj+fPTvrGWy0UpQ3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYINlDwvLQM/wyvJ8ubkemUIIJnlGbHgEKW0Z26U3ZDLFcSfcV2w
	qhOG0OEIg1cqidrXKRxL6qi6pKT02PvehYDezArFB2PY2EY2DBz8ggLcaQncjHPKY1eIRoydBwU
	gnL1DDbmIpeyWNjClnX+JlgXK5xu46s8=
X-Gm-Gg: AYBFou0xlPLp9CBWc9VnIfOYk/OHiB4QrRgggeApv9l070Vf/eF38+IXy+zT3vkaBpq
	YCFMdAAnMpbg65u+joeDE9sNVE6SXyrim5oBPPZTGrcb1E8HSvS+aCcO7iMXSsjw57ZI1i84KYh
	MjhYPCkmx59uhsEw4RmpA+n21SiKhe0Go2u3gEUddw6KYcZBrzmjfkT6Yf+M5pe0tcjx3EJD7xO
	X/My0n+1j9yfkp2YPsMMmQJSVFvCKGGyit+VDYB3TO+sDCOz4ufUs8W7lmHE5sKdDjJ4+U20uyv
	IRaI7gdtiw8eas5cu2F/RqdvuJCTtLSEaCGt06/9FWNqNBgp7sBQNYiDA9ZeyDkNyBXAjCDp12e
	5EtR6XPwJs1brfQIo36iOeLBIIT5V5QmNLXjqcWD/sADqSzGI/L20yG5Y76pdZEdfrqobCb6Vic
	u9ft9gPa6doryjj4/OgHUYohQlWQRRtqbh0pxeV5UQ8QWE
X-Received: by 2002:a05:6102:a53:b0:7a7:198b:674b with SMTP id
 ada2fe7eead31-7c2460fb1demr3329504137.32.1791270903847; Tue, 06 Oct 2026
 00:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com> <179127056620.2231598.8882282421523696709@kernel.org>
In-Reply-To: <179127056620.2231598.8882282421523696709@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Oct 2026 01:14:52 -0600
X-Gm-Features: AclHuK9NHnAoxqio4ND9YA1CPQjIIsifiUFyiINUer63TXcvYLe57-mIcc0zYw8
Message-ID: <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:09=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while reviewing the error paths for the stmmac
MTU/resume recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

It was reproduced in QEMU by injecting a safety IRQ request failure.
The unwind reported "Trying to free already-free IRQ" and left the
WoL handler registered.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The affected path was tested in QEMU with mocked MAC/DMA hardware,
not on physical hardware with separate WoL and safety IRQs.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
