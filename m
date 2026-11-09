Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794230417;
	b=0szkaDd0oKgwIptlKjzRbcqQSSVrA6fdQjRsqMstjqEDq4gT8bQnNPcd9B+xOkGz0oke
	 EH3mCxZWuX8oJ4/wwornPCioMzk4N/dRtXz0Ev4VLjEy/oDK1twzl2WtB1+3Ykr1YNOu6
	 GFeXL4BR0+YNzbxjfnCMWRxQtchLWa/IdUY8mcjAN7wsfbDSh5I6NMwxmjeZQQb7yOjKR
	 hWhx81msqPNy7vJuoPGgqslapSgxEc8PS/+3U1bgegnlVxgLBSUFQHjNhSzIiEYCM6fa/
	 nkc7VUdBXX7HjLwltJCDg6vbmlvtA+9pIO8kcGeep+NKeApBJS3SiWliTpBn6ROwJmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UDTkSzUwLzFQs/a0iCm6oZ/O+FBwGE7JDSj+khhpJDU=;
	b=FTjHgk1UsCZqGYB5VEjt7p1QOwdPN0OSh5pQod2DHHDVkJfekgFWZo4hyEAp6yBiG/XK
	 PjbVrKfsrcjq2Yyeg5wk5/BKk9vaa1X8PrDBU08Avv7YC2t9bmwG1dLjKBxbQrPzjo0df
	 fxUxHY8zcCxVgKcKS210zGDth0rCM2u9tBAreBWARXqXpTBiPT/fsfbLsf2W+zUL05Cuh
	 tuB70fGwdDkVG3UnXZXCKy432zp0qal55WBB5x84Wo4EiRfEPVyZoyl5vnLFdKRUArUUf
	 eqOjX2qVnypQtAK8AX5UDeKPVS5c6DmOLzVKG/hFoeUtsa6w2h7hwOimRv78QAMkr7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLxGNGpP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADCD606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADCD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLxGNGpP
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6ceebaso547857eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:20:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794230416; cv=none;
        d=google.com; s=arc-20260327;
        b=I4AURjpscsjkoGhDv97P5wY22nlLv4aHjybTqMgAcHDsN6aOGjAKEFSQYFnTnoRTkD
         pjrBAYKLbXpBzdevCMAH5FGUeCL++gB3lgDQEaXvYOGaFvwxuam/0Hm7v9/NsIHyc7sv
         OnGWX7jKvCMMHB6su8vBOD2+Jqf+lF41M2bgOuZved7mSIE/med6NpQThDFnIgagl7Sc
         b1vYBrQ/ZUcEhDEGl7VemhW673aLC7sMpUPyHtvLmV8bL7/pbixMZ41wVFqRdDSyr/Bc
         gf/JXzAO60oo2dQnmdDEKFwvWSEBLey3O5Qssp5X8wEBBAdyUHNozx+uDD7wsMmsE/8T
         2zJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDTkSzUwLzFQs/a0iCm6oZ/O+FBwGE7JDSj+khhpJDU=;
        fh=S0ptHGSCOcQHVDSa+5O+lH8Baqw+B3nwDzo+ZwsbOTw=;
        b=rYT4j8n5/hwjcsKDv5Egil3kEam12sGCwBnAKf07KSiLXXyIEWuJx8W+CL0z6jYQd9
         1EnZi95z3hESfjzEFX5XV+keJme6xn215W6V2pawEX7hC3Pvj6siVuMdCSAiaXZTm9Kp
         q0qvDCmmBM/RZyWJq+cHyEglD3cdNIM48UrYRDmUVk4HzyKOsIkCSjR17e70g5RtVTe9
         V9rW+e+pMqCLxw8ysq+ecWlWzb91CGBPhC33pYb9wUh9wHp4zNeqHAZilyfetn7FMep1
         ERdBsV6xJjeMNWc6vzB54y5yQKKUYppifAm3Y+TfdF9oAuSAwmTHyxlQziIH0jYA3ija
         iSCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230416; x=1794835216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDTkSzUwLzFQs/a0iCm6oZ/O+FBwGE7JDSj+khhpJDU=;
        b=aLxGNGpPz7vi3teblpm+I2AfA590c3WIyfayRA1rII4iK90UIkkSHpxxbcm5vgFioL
         8yV/+jeGQRbjA2tBOdnOruU+tZDJ9HGvlDvOemYYltVgOu5SMcP5f26gUJwwEjTxWgrL
         zQs84NfrkXuZhtiVt4z6ZU79YwRjK7NPcIelfGbvMV0jEaQa5BDQA1f35M3hUSMqfwUz
         IbgyrNCqsBY1ehnZalyW61lnRK7sUOm3L4gF+KxapVpXUf7XcOlu/MaukAhoZC5e8f9T
         8iGOc0dK8z4+wa2XFRN8WskJQfgjlZ+ikf1h3UPgA1xEzeSqx7x7RxPhSoScvG8iRGTv
         Ypmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230416; x=1794835216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDTkSzUwLzFQs/a0iCm6oZ/O+FBwGE7JDSj+khhpJDU=;
        b=a4Zu8RJZCL6NlEE4wcrGlgOuYF6LSGnRAZtoY5PLTtTffwhHkk4PLrl0iTLR7qaQLf
         p/vtsLRR4/peHYMJ5IYKyUloSrcH0JM/InB6swcKftTh+RWjMuDujlpwTNy+i7uY7W0M
         OdLsP3X5N/1RXz2F9qFHG9DEFCaIsXMAKnwvt9ura0OHRHi/uYj6x+K8IGnjI9SrU7dN
         b2CgqVahPsrkG8K4B+k2+tgs2qI3LfQg0CxoRfcN1S79hWGGzWmkhr5Lqr938dKZbxL9
         ynracp3iGUzVnsaT/OtSm300LVboBzcfdH2dJrtcq7ZzeRbtP93WFT7QkOjeaz6MC6qJ
         JhpQ==
X-Forwarded-Encrypted: i=1; AL+hErF66mDDYAeDkbXHJd3uBhNop2zzI5Z7cf5jcYOKhKxI/W9zf8zdxb00e0uKKmbatYdqpuDGwrBAlgOjXfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ejWK8m/xkYF1VarnC1va4+3ndqgGMwHSIWfbQvE+P7+idPc9f
	jJ0X9BdqvRtYGlFjh9VZci9vl8N3VICUwIQVYUNrrepWI+qGyGSnzzPGZtT3P9AJEw5JahGFUaQ
	20nT3ObviD23Ay6xzR5kIi8DV/YkjswE=
X-Gm-Gg: AYBFou0d2jKnd6cj4SPDyCVmTethnUITLo3qStnm0PLDdveR7VV6ghyA8IwDllzaBaS
	zaT7TF83UVMrX3VeKRbyJbkRniUJ7CGh2NOGw+zpbNiUymYuBkVoWz3q4qiXSyP16sh7mWEO8EW
	A6qk1R7NtMBq0j2JY87sMuv8TmZUW8b9/E7BjjMKebxJTZCisYvCpSLBGRhzSpzRUQKDG94sJmn
	qob5v1RA3hXVVVwOI6FgZbhz8pGGK0bDW9zaMf0srO2ZxhUTeqE7v3n64SPV55vZJepMJwN90Vs
	zA+MmbW7XuP4DRdKemz3h2bYprl02JdVSleRJIgZzQdgcuj+Z8wscnkytFFH3YX2icyqOytygsw
	BJnMyKc11L0UfiDej9IBWHomWkMMMpsiAcIda
X-Received: by 2002:a05:6820:1608:b0:716:bade:c86f with SMTP id
 006d021491bc7-7170f2ff8eamr1939236eaf.83.1794230415731; Mon, 09 Nov 2026
 05:20:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>
In-Reply-To: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Nov 2026 08:20:04 -0500
X-Gm-Features: AclHuK8lXrzy2xtGahHxAQxCvMu-1us1fvn8CBCTLMU0GJlBYkK0cAz5B5Kvhww
Message-ID: <CABb+yY2W68cnotPk85YyBGsnB3Mj7vLZmdH3xLo6Q5D6tbXjrQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Only reset txdone_method to POLL if controller
 supports polling
To: Douglas Anderson <dianders@chromium.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 6:43=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> In mbox_controller_register(), a mailbox controller's default
> txdone_method is initialized to MBOX_TXDONE_BY_IRQ if mbox->txdone_irq
> is set, MBOX_TXDONE_BY_POLL if mbox->txdone_poll is set, or
> MBOX_TXDONE_BY_ACK if neither is set. Only controllers with
> mbox->txdone_poll set initialize mbox->poll_hrt and require
> mbox->ops->last_tx_done to be implemented.
>
> When a client with cl->knows_txdone =3D true binds to a channel whose
> controller uses MBOX_TXDONE_BY_POLL, __mbox_bind_client() overrides
> chan->txdone_method to MBOX_TXDONE_BY_ACK. Commit 33cd7123ac0b
> ("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
> attempted to restore chan->txdone_method to MBOX_TXDONE_BY_POLL when
> the channel is released, but did so unconditionally whenever
> chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK:
>
>   if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
>           chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
>
> For controllers whose native txdone_method is MBOX_TXDONE_BY_ACK
> (!txdone_irq && !txdone_poll), releasing a channel (or failing in the
> controller's startup() callback) corrupts chan->txdone_method to
> MBOX_TXDONE_BY_POLL even though the controller does not support
> polling and has not initialized poll_hrt or ops->last_tx_done.
>
> Check chan->mbox->txdone_poll before resetting chan->txdone_method to
> MBOX_TXDONE_BY_POLL in mbox_clean_and_put_channel().
>
> Fixes: 33cd7123ac0b ("mailbox: reset txdone_method TXDONE_BY_POLL if clie=
nt knows_txdone")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Found by code inspection and only compile-tested.
>
>  drivers/mailbox/mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index efacd24a085d..cfc49cfb057c 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -343,7 +343,7 @@ static void mbox_clean_and_put_channel(struct mbox_ch=
an *chan)
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->cl =3D NULL;
>                 chan->active_req =3D MBOX_NO_MSG;
> -               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK && chan=
->mbox->txdone_poll)
>                         chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
>         }
>
Applied to rc-fixes branch.
Thanks,
Jassi
