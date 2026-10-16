Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CF3815F3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181331; cv=none; b=h9/XBBwKL32vDNvrYuBHUkxgDmjF+RBwZQzhxYXT+nk197eQMXzphw4U2JAfLAwqF68K6GemwFwCfudcHNUp0vSj7VQDjFtZe5zINWa70V2MRW8NgzFYWw2kQ5FVrfn/uHWPtYNqL7Npuwf+SwOsFFEj4WtROnouMdXOca9mMAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181331; c=relaxed/simple;
	bh=XUZGkG6NcUKSpmL3skQqQZZtcxMF/YmZw1d/4452TwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfD5wzwScs94oNt9XosUyXU1JpDVixk63Nk3mtB7YL0wNUcOk4Z9Izz1O42SVanQS0oV4k+TcYocYfPYSOmsz3/wXhuOlkJNHSK9Iw7dJ0HzRXHleGIUhKHLKUJeWAXmDy5E3mrzWsh1eth2po4g//Yh8PrFgB3TlthrulGiAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ0vFm6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZ0vFm6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F4D1F000CE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792181329;
	bh=XUZGkG6NcUKSpmL3skQqQZZtcxMF/YmZw1d/4452TwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bZ0vFm6ppQPiyObssLyNOg55HdQ2Ps8gZQA+n5QvsGt7uIqUQMNkgdNVkUobLwrd3
	 VUS5Z9vI6Hdc60ZwjCqHTCy1dYf/jhAQ7dfqfVuNmYM+UelierAa5oxU4Kp6uqti6r
	 F210KM//lVtAawzYBHWHadv3l9lnsrQkhGJSjROcHARSwJSgJ/sRieROVpYWjaljd4
	 C2eNXCTXI8XlOdNiaIfyzLiohBv79/t/NFLBkyBJAP/dpVjK8o7gQL4mtf36pHLBCU
	 yS9TvTeuLxtQGL6Bx3JUxNyxO4qVkiDz6a2MAYzchM++iswZkRdtsEfWtSjqr37ELC
	 5Cn/O2/Tgsmsw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso341196e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBN6SWg9wY3IIpCVmYXCg2+I35/uobNwEYtX9rp8/R/R7sDZWM7Ben335yvjVblcV+tbntUbvHj1r97aM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbpRmID9AMN9uiCfzQCK7e8MTmiP4nHqqpPV6Yfx+G0SmXrdyV
	OS2tnU16uYtHFETrsnqPpJRBVzntkYEZ2X+hw4/bZHts9c+F/pA4zzyxp2+4GSwg01zfCN7RL/N
	m2AwfLCwqBDix4kSgffSa8JTc0srD11A=
X-Received: by 2002:a05:6512:65c9:10b0:5be:50f5:9514 with SMTP id
 2adb3069b0e04-5be50f59560mr52120e87.9.1792181327687; Fri, 16 Oct 2026
 13:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com> <4a8fe6f9-bf6f-48b4-b4ce-d9a1d773dafe@yahoo.com>
In-Reply-To: <4a8fe6f9-bf6f-48b4-b4ce-d9a1d773dafe@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 22:08:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=q1OccsOoeDA+EuRqvngu-jUK60P3xQ-Rt_wKYz+ZO7g@mail.gmail.com>
X-Gm-Features: AclHuK-GY6A_rqsDCrnCUEbovna_932PAL0ABBL6EpyGpHuDVFvgc73ZJ19jwVc
Message-ID: <CAD++jL=q1OccsOoeDA+EuRqvngu-jUK60P3xQ-Rt_wKYz+ZO7g@mail.gmail.com>
Subject: Re: [PATCH net-next v6 6/9] net: dsa: realtek: rtl8365mb: use raw VID
 for PVID on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 3:06=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> Family D has no working VLAN member config (MC) table. Its PVID is a
> raw 12-bit VID in a per-port register at 0x0700 + port, whereas family C
> stores a 5-bit MC table index, two ports per register, at
> 0x0700 + (port >> 1).
>
> Running the family C code on family D therefore reads an MC table that
> does not exist, and writes an MC index into the VID register of port
> (port >> 1) instead of the one of the port being configured.
>
> Read the PVID straight from its register in
> rtl8365mb_vlan_port_get_pvid(), and make rtl8365mb_vlan_pvid_port_set()
> and rtl8365mb_vlan_pvid_port_clear() use direct-VID variants on family D
> that skip the MC table. They keep the family C frame filter handling and
> rollback on error.
>
> Also clear the family D PVID registers when the VLAN support is set up.
> Unlike on family C, where VLANMC index 0 is the neutral PVID, the
> register holds a raw VID, and after a reset it keeps its hardware (or
> EEPROM) default. Without clearing it an unconfigured port could report
> a stale PVID from rtl8365mb_vlan_port_get_pvid(), and
> rtl8365mb_port_vlan_filtering() would accept untagged frames into it.
>
> No functional change for family C.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Why did they remove that ... weird but it is as it is.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
