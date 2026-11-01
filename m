Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793500854;
	b=a0T144eTou/A5/I6hLzUqawx1jHtgFhzv6YAy1xirDhPBUEKiLTjOV8J0EFNjUKsIrbX
	 F0srQo/6JDKCg29w3410X5XBV2XEX71YmDxFC8+ltGilmaYtCS1n2joU4Q7dUdiciPgYl
	 ACqXq12L753IaQhPV5XH5kLbK+nsWnZ5etkbaQbDB8taVKrNgpWYMaFtM8AcXXyqbzfWs
	 MTjRa5qtIqMIoKf2wU8UCNjaoW4v8zCke0BLsRPaYs7ScLtxeGjD6VU/S4gYG9V/pI7lQ
	 NlB1SeBp0amhC9qW75hc2RIFtx5hJgKIP1fLjh5LYPn+5F6+mNWHFhNORa7ilJ+ShEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793500854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
	b=HNXhoBFgp99pNFsAQ+W6EzxBoy9oIPw/EtHj9S0GukpJ8AabJnrTa6sseL+zlm+1wkgJ
	 ibTJ/giPhdZMdK1VauTS9eLlkCLZT9cvlUbUM7KAG669YcdgjWxFayDW1ogVVWt3nMw1G
	 /XXN9S4pNDehpaJCJwEuXkvggyoU86HPKCzcidphlYnnD53azbNkSxgkDeuJmV/tVO+5/
	 oXoYn/pHa8d/XUDlyo8Kt+f4MUc+8mOyNNjKt53rtxf4HUrGVwfu/+elQHUtrKOnSbWgA
	 DOJMD4nGEW8ukRlbwYhvHWUbpZVPK9xsNhIFWSCKwpjoLmA7GPg1ZP4HVOISBAJrbpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdFFyetv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7197606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7197606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdFFyetv
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-679e6ab647dso894041d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793500853; cv=none;
        d=google.com; s=arc-20260327;
        b=pOD35f/aA0NsHYb/nrHAv45IXcYSbEo2s8lbfQCogHdIZuMFzpEZ1EdAocuot1KvNy
         Hv13MQPhZGGFSWnreY+A8gK/V5Zu6hdEvnf9833u1fCovam1JZRMqQ4zpczWV28OWmke
         Cxji21bY7cwV0kvfjhhqM9IqNsb7cnRlmtAaHAr8raz/rhqkuBLZcmNd4R/HYRtkF2v1
         j6Vr4OdodvZPvRTHyoff3hY1Wkh+cJwfTlPWgg1/NkgROC3QpkpAd1/gK6PtQBnAFulD
         dsYbL5TsLrRQQGmrY+4jhUb8D+zUXpBrqmkok96lhaK0TabR//RV57sLgthba4669LOn
         riLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        fh=eyyhwrLfXmBinYDraVIfrHgXqy1czkXZOJ74066mNdI=;
        b=Rf+3X5LZL56QP7LN+gyU27P0LU8CjsUnycOYBM2DDzLiHQUsmYdztJvJ87LACQJomn
         jy2bIP5x57ofcVu4pg2u0Kf+Ul319msJUoIBchH94QWhUpHjtB6UvB+fUikOuCGr0sBZ
         Ua2Sw96XuOiFwSA5zenVCMyT7N9XNjUQriKxBO6sR2GGEUKSyUsaawjDneNro9hJQUWv
         c5nuBS28Sg3GdZ4rz96hKvgKvc2U62btRtkbb8lGdQ/OMwKF2b7HSvXtC8hQG3ixA44s
         T2Xb9ZMSEt7Z6C3MLGNrh5FdnqZqsPZ9Lb2NoliVh92sp/Q6nSPzfBArAvi/LVwdQewt
         pVBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793500853; x=1794105653; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        b=BdFFyetvdnDEMnfGsoIWQiMtKPBtPDTFhUEhcQqmNX3fsNX9e+lwkasxGFsEy8ZtHU
         9bdAuna3av4LHkc1kFrP58sIUjq3UyEONkdZHf+un0JfQXRcqd66h5LeQmAjGv34E5NS
         eXJ0gDEAqh3L2m/g2OQ8ILmrL4vT3BBtev9ZRcsjIPT09N+qh+xo4JYhcbnWMzIER31K
         zM5D3VfhSCMVXG+Ak9S9qpIpfEkAuk/05B3Qlvzfg5ys1twUAl1fNw9iJ0MKWpYWYOux
         +OKkYhgTfBrml388WlM3d7x9nkOK9jjc1uFw1iMTWCosMy7KWl/aFChbt1Npo2dJrXJU
         ZO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793500853; x=1794105653;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        b=KnxTGcIQN4uTza2+liPbkJJ8dNzO//mvBZRgGhOk1ZRn4V7WPDcIootHgeG4xdUBCD
         YqLWkcpjShxcH1fmPcHpHMqjg16rjdEm+vMNAowLvvO81u+g/iyaOWyD/lvF9+K3MUMR
         8789Ec2Dt61hr8mNnvkSGSxqa6RClBCoNigQoQ2jxbHeBuOmu6K85V6hojQ2tkJeyVUa
         e8ZmnwHpfWLqRQaISqvqZivNbH4e7fXlgjprA42CF7MCTZIaNYTOjVSoA8XKUqKj0She
         j8a6rm6Wm8fWpytag3ARuyaHBhm1IV5qC/X/3/1yauuqWpxv0fKqT/la6HZUps1XmhcK
         HJSA==
X-Forwarded-Encrypted: i=1; AKwUvBzxR9bTuX52B4gK4T+1qUSv6MKOXDXWONO7Cwb8Y/1POVPyetp5G0hxrocTYMDEkUqtehTgADFdP5g8iC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sjCQVV9yKN6LNypqawn3mLOCc5BhLIx9qwfZGYjT/C6tjwZDj
	WsY7LdLpX07tWVvdsFQ8NCLFzi/RFQCdT1dyIEy6F6KxwLeb0VCJztPyBqQA8IUJ6+WUGhwTONA
	utGBSUy9zSXDHrVp4oiRUWH7BRJKga94=
X-Gm-Gg: AYBFou1DO7NCsroKEXm054hE9homKKFDL0sltG8Rk9w1CSH9PzthFxL9Md5Ws/s/5wg
	/+AOYOf50rDDaeo7jZ8UCKIWKbYommeGpxO6d/yGu5aqy/tvdDpB/GzPpTouC/VVrsbTuimyMHp
	BIqWD0DRE04Wij01nlynn8Mw5ku+6Nhx6tMqA8kW46asFEJTGqDtiRfrV8myxnM9rPE4UvPT/J4
	a+D3dsz+nUO9y9gA3dhEW8L1OHpWRG7S3UsQBURKzef6hBO9mFYJpoLBfSgAnSvsyu7l8TTAVnX
	qPa7LHE/EUZu5OQlV3jogI34T2mkTpa95kNRL6jzQ3H6o0aP/LOcmH+S1EWmUbTnr8zflAfsDQs
	vq/BMF19Pqj8xRU6it5YYOxcdZGxVFereIUQ=
X-Received: by 2002:a05:690c:6989:b0:8b0:ecb2:884b with SMTP id
 00721157ae682-8b2b6707c48mr49035517b3.26.1793500852565; Sat, 31 Oct 2026
 19:40:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 31 Oct 2026 21:40:52 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 31 Oct 2026 21:40:52 -0500
In-Reply-To: <2026103142-shorten-shindig-bedc@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh> <20261031152656.1422-1-xiex16070@gmail.com>
 <2026103142-shorten-shindig-bedc@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: akari Akaza <xiex16070@gmail.com>
Date: Sat, 31 Oct 2026 21:40:52 -0500
X-Gm-Features: AclHuK_3PZPlhb8eWBRsqZBFCzLH4zAeC2-QvNwLLojfXV5DV2NRjTLb-47rKFM
Message-ID: <CAJePJ2c8b400Q15=GrdDsJ=aF03g+ZwcTx8ZsJCDM5uHTH3k4Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush race
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, krzk@kernel.org, peter.griffin@linaro.org, 
	alim.akhtar@samsung.com, m.szyprowski@samsung.com, samarth.colleges@gmail.com, 
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thank you for your honest feedback.

To answer your question, I'm still a student learning Linux and how
the kernel works. I've always been deeply inspired by the generosity
and dedication of the open-source community, where so many developers
freely share their knowledge and work for the benefit of others.

That spirit made me want to try contributing something myself, even
though I still have a great deal to learn.

Looking back, I realize I was too hasty in submitting this patch
without having a proper environment to test it. I sincerely apologize
for my carelessness and for taking up the maintainers' time with
insufficiently tested work.

I have great respect for the rigorous standards of Linux kernel
development, and I understand why those standards are necessary. I
take your criticism seriously, and I appreciate you being direct with
me.

I'll work on obtaining a suitable Linux testing environment as soon as
I can, and I won't resubmit this patch until I can provide more
thorough and meaningful testing.

For now, I'd like to step back from this submission and focus on
learning and improving my testing practices.

Thank you again for your time and for the work you and the other
maintainers do for the Linux community.

Best regards,
tianci xie

On Sat, 31 Oct 2026 21:28:16 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Oct 31, 2026 at 11:26:55PM +0800, tianci xie wrote:
> > I do not have a Linux machine of my own. The x86_64 build above was run
> > on a rented Linux server, and the arm64 build was cross-compiled there
> > with a no-libc aarch64 toolchain; that is as far as I can take testing
> > without hardware. There is no Exynos or Apple board available to me, so
> > the model is what stands in for a runtime reproduction. If you would
> > rather have the flush modelled as a KUnit test in the tree, say so and I
> > will send that instead.
>
> Sorry, but stuff like this you are going to have to test on your own
> system. Why would you do linux kernel work without that?
>
> greg k-h
