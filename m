Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B34E323A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774827; cv=none; b=YRpCOUtAHRdyz3PuBx5jDrIF4YBpujhc7wycOnXucBPFQgvLj64FvjEDx/wtM4A6dkwIDlYg0uWq98q7JIgkFhywcy0Dt/XTz8oeoJ0vLih9jhz58hMUj5EVxnFNbDZLjwl/2UG9bQn/W9dBelIwZE/S3KS2NsjkJEMxEdto4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774827; c=relaxed/simple;
	bh=OpSmVL4hqTjWvE1WR/oUH8A/JGaoOj3L6zfCJwDU9FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtDR+2toEmRxITadDkcdFFwtQpiVinmRZnJIxURZOHVH7bPw6dJDCzQGDTLjVR2lEMPQIhT6GNNB4YPyIxkjt79OdKzYJFbTXegEI0RdWoo0aRpUL1GXJmCm+Dg6H52IP5gbT8QFu3wcredNLbMDNrOSyuVM6UU0amuOSHPaWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He0p0C2G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He0p0C2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58E31F008A3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774822;
	bh=OpSmVL4hqTjWvE1WR/oUH8A/JGaoOj3L6zfCJwDU9FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=He0p0C2GEmvWcs3QascPblvBjga4iuGgh4pATvGNfHJPBwXoZSz5+rXqm1bNcaurk
	 jcIjD1SyLBjDKGPKdNFupFTAyobxtJ1EAWb2GHBrWexPkB56ZymrVpu1cd4m1O99Eq
	 zpK2vVJRlrhk9QKePv7sYZ5pWg1Wsd/MjD5VUryPztPWjE1xViUCmtDFViUhcBKI4d
	 JGPCyhndt1THNfsOJh4a/rteMDVrCWaWlaauLWUBKhSQacYHaRuG9cxGUxBwA61//a
	 t9nJk4bTk+OlpGxp4AykifQhcHs3nEtC6HDj+poWtdfMuPtgDvB2RDpheI0SLu/jKq
	 2w01hRV4BvDag==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba41be3417so259483e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7oZhQ+rvZ9mbJnzux2bVPdodADxuNuS0IFmdeIyHU7m8+kiABLMH2H/StzrUTgxv11EzQmQ5iSsR+czo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJsawvMK7RBW+ueQUAD509tVVUG22OsB7FMWxQp5tNBsLM/bup
	S0+Ufium5sm6t/mFGeMRuNSPaXqObsPK+mTDYpzMU41+Po4HhXM6RW1gjlwtS7wCZd+iXzuiR3E
	WLSr/qAv294SfxWiRfzGUc6aPD2gUov4=
X-Received: by 2002:a05:6512:3a8a:b0:5ba:36c4:c953 with SMTP id
 2adb3069b0e04-5ba402b8597mr589624e87.8.1790774821501; Wed, 30 Sep 2026
 06:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918072852.501420-1-wei.fang@oss.nxp.com> <20260918072852.501420-2-wei.fang@oss.nxp.com>
In-Reply-To: <20260918072852.501420-2-wei.fang@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:26:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnFo1yd2AXyu8XdZ5VV4RooXGP1xEXS9vtAsoSfwPKY=Q@mail.gmail.com>
X-Gm-Features: AclHuK-Cq3rn8OBffcZs3OkTTOIAYyYq7qYSn2XcIAzlvfiwp3W9Cp7NWkyTaAU
Message-ID: <CAD++jLnFo1yd2AXyu8XdZ5VV4RooXGP1xEXS9vtAsoSfwPKY=Q@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 1/8] ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi
 for 64-bit register access
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	richardcochran@gmail.com, linux@armlinux.org.uk, wei.fang@nxp.com, 
	imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 9:24=E2=80=AFAM <wei.fang@oss.nxp.com> wrote:

> From: Wei Fang <wei.fang@nxp.com>
>
> Replace the open-coded 64-bit register read/write sequences with
> ioread64_lo_hi() and iowrite64_lo_hi() helpers. Introduce two new macros
> netc_timer_rd64() and netc_timer_wr64() that wrap these helpers and use
> them throughout the driver. This reduces boilerplate and makes the intent
> of each operation clearer.
>
> The high-half register defines (NETC_TMR_*_H) are kept to document the
> register map; they are not used directly since netc_timer_rd/wr64()
> address the 64-bit register pair via the low-half offset, relying on the
> hardware layout where H is always at L + 4.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

That's neat.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
