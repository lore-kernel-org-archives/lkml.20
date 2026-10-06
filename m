Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A9233920
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261343; cv=pass; b=SsAYAPTzpcfuvrGGICFPbw8iA3AQCZey/plw5VkRICau8mvyFZbSlKj56Rif9XBu6TCHVjDcufSTMoJ5IygAtj0GINSs7h2FbB1Mn1eVgiIoeZ0oaE4DGymcALbs4EVQnEKHi/a+/5eG0rESVjdGSvu3dLLJUq7DSsf3YWAHjeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261343; c=relaxed/simple;
	bh=ikcCgtkLCv2+6FCT8NFz7Sepc4WRT9n+r6/7HxB/YnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2tpC0G+5QG9NhCDwveBZb+WEE3tK0DDxUNNA2XNLjvkFoU+5vH4kR0yEH/W57WtjQtXJ6U9F14o9dGrR6zN+OgIVk3XYow/8E+REQ8IUVgbNL4zl4heikSEZ/3QL3wUvGNzy7xNk7mZTVbL8ujb195RNwkacKxQpWIONqWox10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rv42wXaR; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rv42wXaR"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-988d2fdcdc4so1609131241.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261340; cv=none;
        d=google.com; s=arc-20260327;
        b=EbCsVNXqJwXatuFueqFR009T5bBz5wdY/MgB1CrLGtITGsUVzaIG7vd5rVm19yyshK
         dAgsHmYMTHWxubDG8QlkqYYUec0wP4+CIGbqFvOhzHK3AM7fJixBiaafuWoh1NhajGDS
         9ezZ1c2nrONo3c2NmwvBET1DKrFb0i25Ld3hXHQevHW4jrIZdBfTCCql4fpp6NVpNHHe
         0gY+mfZWEbGXdO1BxjTKclJnAk33erbwCKNMScxkJxT9Q3g7d+Su+dR1AFWa5vWbAFHr
         Me49raq5kQbQ7Sb62mYSVooIipaIIDWFXxfXqLyIHgz2w5SKwNabfwvwYWl9Z0oB3jSi
         ViPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=;
        fh=BfvPQ2yspvcNLY1BBmq/NLopkaxA7Fj6ILV8q72QNVk=;
        b=NDQXYi3C4ZO94/wU7kSHR2muaiQL4MK+kwK14Ru/ifvXoPlx/YXMHUyhjoCo54R0R2
         4jGSS0iIBytotZcfeeVaIH1fJhGaZbJ57EtFXYS8aLV7V9eo2Fwf8UM3pX6yg+Ab7aXE
         /4CLe2szz0ITmmXF7GrvSSBrpIKhf/acVywUJqlr/0vsmoLQs3oPDYOYJCrrchoEehk9
         KYHnI3SGcy6v7PubSoJErVTjQA7yTHNE/M0ly2DRjt0utEfNH0lNxro69b0MIL0vR3bA
         0IamGePS8GcjYLr0eqGnit9+zRHUBi2JPTynpZ4kf4rPNMKNR6Mali6c4H2j0OCJ+qML
         2dUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261340; x=1791866140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=;
        b=rv42wXaRFbgb7ybmEwyzlySiOIhbEEWnt2BFA2yqH4Mld1e+qPxdVw5RJ6qnY8+yq3
         wt8q3OtBXX6TBN1COS0ctQ58Sn7sFhfAKX17cTngqrOtVScljP0zb9GDhmhcrPQofq6A
         oJT5Qxr79I9/mCbGESSj9REGJvzO+wmRIjIRaSoIuRRlQKzLDFsMjVD4iAhA2XO8gqU5
         1UjFlUYE7v9N6teCfKXatSJy78dBkLvrGIte1Vq3P5+EF0rYm8G2n5azXby0W5pBKKdi
         mEendfnZuUZy2dHe/l80jEe+lGOAQFps6Fzk72kgZS59WoOaP8IrIsxoJTWPKA14KfaW
         tlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261340; x=1791866140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMq9dXA5XsGxNSHE0kH6VYFgrogckOSvLKdxRS+D8OM=;
        b=LcQja9VPikvEcMDsvkyWrPz2PZPzDcXDaF7YmgZvuX1nmOfxdUka1zfm8WK+0SgAdj
         LJrn8ODsvUi2Pi8k6k09rF7/tuGdGypuYhPm5Lrr5x8wxC327hgLaOMJkEh+G9BiCP3r
         6yjgU2sR58bDJPcfBgdkbXehWUGLEvPBYSUG3kxrz5PdMgsI2n5OFvjS5gsR9hggN1Kn
         EwIC472ZZk36twBFJdQCYsODGzSErUHeUpIRyweSxxxfkZOe4WkLmqfJ/cV8WspY3VMI
         QAEbLVfqvdtA+8EqPr8tt+R3eSEGr0GCZJssW9uJIqGObMCDSnb15Q5KhrzCpP5Bl4Bw
         x+DA==
X-Forwarded-Encrypted: i=1; AKwUvBwbSI9Oj8jJGqrOd8IBCv07jCnXuh+me3VLdlaAaNlp1G+QTKcyUNVLbJJfrHNhoo+v67wlUAuXlKjOkiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5ar1bFdpygl2HQJp3eYDbNmKvBs97dGG9wGkIUs+3v+MSJW/7
	wdJfJmpPVcmbhcvwkadSClMTmYZPKe7l04lvsM/kIU5qQI22KZLJPMCrN0WMDgDFoW8AS5QZB9p
	DMdY3yAxqvdtw0NktUer2tCHCthhZk2s=
X-Gm-Gg: AYBFou1YuuJM9aNnli5V6P2kE7VpgitUh4ITZIBNuBCtYrZqS5uatei44K4mptYQ9Em
	ERKJahdFIRXQc5CIGYPbJIBRGb0S7wu8475UmkZT34bk6HdksgjfO6q0SBoqOSrm84oFhKmTyv5
	OIVihi+RdF2ggoTlRHtXPn60A+q5eoUPWHB6UUdSTXZBxCZ+2LGFuP3BhvfwbsNN2gRUuQgvHCZ
	K3w6vDKYBXP60rqlpFUEe+AsgJibE4DsVzevUX7iq6R9HrlrwPDYsbK9yutKhXqex3TVcW9wAlq
	8LU+w3CjZFASc2EWKqI5owN+8y7QasWyAMmRVPKhBOFRzTaUD5jqWahRk8NN0w8pAnedPk6kLnU
	iSb5QrB4wwwDKiELRLZHAazzxIeNJpXM4Qx1LH3VuAP7UrxaoQ+wmCU2BtPYVUSdoUtefHzi+Ow
	pp0InAhEdIiewdEZ/hO2w1KYp7+044a7wreDDlHtGPmqYCeg==
X-Received: by 2002:a67:c797:0:b0:7c3:b15:a982 with SMTP id
 ada2fe7eead31-7c30b15f25cmr1646552137.31.1791261340552; Mon, 05 Oct 2026
 21:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com> <179083074323.31693.13810000342248985832@kernel.org>
In-Reply-To: <179083074323.31693.13810000342248985832@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:35:29 -0600
X-Gm-Features: AclHuK_5yosJZXY-86dv_CDJAmAQ89oJW45GT0FAUDHPxv4gaBrZRXrpU3JuWvM
Message-ID: <CADvTj4r7KEO9KbGiMJTOKXRR4J_A0QMHUcpMeYaxnftzSbLtsA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: take ownership of saved RX state at poll entry
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:59=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found by source review of RX ownership and teardown while working on
the larger stmmac MTU/resume recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The stale ownership was reproduced in host tests of the RX code, not
as a physical-hardware use-after-free.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The changes were included in earlier integration testing on Allwinner
H616 hardware with sun8i EMAC1 and an AC300 PHY.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
