Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792811389;
	b=CQeC1zRLAvw8Ujwm0FBMstgxzfvRJ85Xj+oLzSjtiYxmFjwbosEiM5RWsqd3oMtqGlJF
	 GE79WcEqIuQp7h97fg85qqO2niJKOkSxNxDfNjJ4Gxp/E4PcluwQ0ZR/xvX2ClpCCNh5r
	 qX5Tjme2M32DcsouKLUR+sN8LQtlnIJhPltqw7Iq/fYHx+WI6IQtgjdh/Il016XdMMItg
	 MqnnGRXUQolHERD/eO6K+tVwA9tZbYK3rCiuPGsch8x3xc2YFObWlMlAP+mH890o5KSBU
	 MRYaSC0cqvcwwiwQYIwsEdh+huSgOOy0uNaeOImlBK2fMz3ixC75qRyZjN96iI+OnEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792811389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QAHjtGgvZD7WoKmqPHPbo9DGm91Bfbu1kj0a9bwrkN4=;
	b=dWk8GYmo1hBNVxSSTbYwKl2oGZ11GNrKqSphbq8QRimmPzAj0vfDqaHcTe+SJF9U8ySv
	 Mw+aLyxu3m8KY2iqlEfOkrsP6/FMrzAvH42LIcXI39lQNLM3MDrPmGW2iDRPeU66WxYmC
	 B1Nwvg0FJ3mf8du1DNaixyEHlqwY61k1iz9Wjpz+EZOD3U5MBWo+FP1/3TGOrhAT8jHaH
	 F2wNv+ORNMxGaVZ005Ty8at38BOwnRdvr1r60qSUiv5b2saz5LTxdnMxX2eqTyS5f5tmm
	 uxfCvVdsygTH/L9FYyX0yac9jElWh8h0xXca8m9QawvrbxILeWZMc1dt9WmYZbV2U/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=D1dKBVzp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1279606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1279606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=D1dKBVzp
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso5511a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792811387; cv=none;
        d=google.com; s=arc-20260327;
        b=qkdHP9EMjtKkVrbfHTGYBdxx8w84jD/4b+ocZfY2stULNxLM0rqBL2r1fK6s7nyTUj
         kL/Px5qdDIbgc3HOOkoexH4fZFOjhvOkbVdGMVs36iJo4rvWnD3KAit7jBYlIPjPG5bJ
         eMSv6Ou0eKZ6MznDh67O9qPsQFTuJFXd4sj3Ha/jeaSdz8D6BV93N95DCZQ309qAH7Me
         TTer0SsDhv5eV0wVG2WirB35UXR5rgBZFTX9bWwSE1Zq6T4Ut7OhJmM9WzLUVS68V+fm
         ABvAlqQfVqcvbxaYCZVnhwL8jh6FAl8yvKNb6kXuukK0W/INTbUZGhf/zfN4AMVgq2xP
         8tOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAHjtGgvZD7WoKmqPHPbo9DGm91Bfbu1kj0a9bwrkN4=;
        fh=E0opJTiE8hx8sfNZYBNg/aQ2Nk8lbAW7rh02L3wvqkc=;
        b=BeL6l97BwFLnOo4Z7CT1PY9bsEXHic7Dy7xngUtdoVX6gyzFG5V927zN5d2LklLOx7
         UuGVncDkikG1Lw4KXP9RNow1I9vkR3iwAhPJR0NXE4YrCD8GUK/44xL8Jdz4h8zqKv6O
         eYysqoff2T6s35XuK03DWT7Zu4nKIBqFBDraSrgSx951QX4EStV+hRq1PaH7kqWCzPE6
         2bbzTPlhENVNz2+FVjM81yXPLW+FnbDBZkyloeIR+lh/ZEbWpynVJCxtD1ArpG/3RPlF
         oAbbgKjwuYoWpivJG+tB1OL+HKLT+gQOdH9qU3PJtq9h7/HS08F7CM0UHH+5m6Ox2TCn
         Oh/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792811387; x=1793416187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QAHjtGgvZD7WoKmqPHPbo9DGm91Bfbu1kj0a9bwrkN4=;
        b=D1dKBVzp++9wVowGSloOqH010pt3WuspzRAXv0p+JqeKzXDzZ1vdOuAVEu7kbpTZrI
         itRhuxwdXB6CpgZBt0YKhFwN3Rm0U3jd9XnTNK3cpDVYpBaUzIlMZ6O63tOEnpPHqjL0
         dlBHf7IAXn9Czt0Uj9NFwhhQotp/ju2HX7cvQ11NyHptV5qJAZjjxK1KaS6UVVobeQ/0
         IG5VHjVlee0LyVSv/OHWKR3BgWNQTfjH67bqFZbygn31p7ZHDdju43AL4TKUfW1O/f1e
         s49K7va/gQ+uye/ky+HN5skgrKgIJ03aw72hboJH2A/WABVFufHt9gfysaP8xS7xLHKc
         iueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792811387; x=1793416187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAHjtGgvZD7WoKmqPHPbo9DGm91Bfbu1kj0a9bwrkN4=;
        b=c0JdeJyM5lCISOkEE3p5vgGPvgUHcBVPC/Jd738N+NRmoyFEF4pqRbgN5CFJFtXmqO
         0C8Ly3n2FkqVWnfqa9aRGtVMW6rmvuoEuZItsfkGw6DqTkX06pG19X5Pj79Don02UIO4
         qz/S3uW038oEXEn6/n1H6BROczMazPrEsEJeDUQgxuQtiTNGAKleZGCwgN1PC1vZR8BH
         NIVyeDVasXVzRYuId5kE+AH+1G68UNRZZyfeb3Y10NuSjgHQDENtgM1K/UrPuGfcJBqS
         ENc8PoXOKrBtOLraD23YbnHit9dJBkP14P+MxvVnFvlkIIp76+VsIgq31kq1V8p/aaEQ
         wfZg==
X-Forwarded-Encrypted: i=1; AKwUvBw6d1CHiuAwk2PqzBLeWGl3OsasINJpHowkuRtRJoF2b0Yy5AaS/cYDNEt1IZEHV9Z+jeZjuNRkWilisjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSun7ei7opTahtV6e9disUB3/LqTrvDJs89RSIU8cVpLQsGMT7
	IEd+vl6M9MGTb0ZQNE4nMuCo4lQOR7BevjDzua6lrP/NHgpVNxPXXKlDYxaDJCBIV6EbB0otH/c
	SWEhroilaUolArqPdxI98KDM6stqE5PU8vjF3XqzG
X-Gm-Gg: AYBFou03cxwhcflRWhVH3FU8FMVzL3uvc/Rb10WJ9DO2uUqa9zc0hF/VdNvU2k4S16P
	flp1rdVHzccrGvSXVdY1XztRg1jCzSG7mUPY5BQi1Uk+5QSyxVMwr0ozPs7mxQXuF5isktM84ej
	kH5izIF33UfqG8FTlufyMSgVNH/vro1Ta0djz6SXyoq5xI4qnPEDXjRh76KluDq0tBackodLrnz
	pHSpta2hmxVXk+Zang2CSPILnNJatb864XZeP8l1r8hzUVoW35AMYij9wu+zvdofb31l7CM8vmR
	1cvApmoUN8DvC9ypExDf6KQVOg554i9DYMfMIKxYu2tAHRIz7eYU5GGIlD1FbbvC+bmCNDdiRxc
	bJeIDJNK47HMbo5YquNWvCnfSMUO4D/DIN5SR
X-Received: by 2002:a05:6402:4244:20b0:6b3:87d4:d849 with SMTP id
 4fb4d7f45d1cf-6b445742acbmr18769a12.10.1792811386607; Fri, 23 Oct 2026
 20:09:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024030401.852598-1-almasrymina@google.com> <179281111897.3327.1602182931669010390@kernel.org>
In-Reply-To: <179281111897.3327.1602182931669010390@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 20:09:34 -0700
X-Gm-Features: AclHuK9aQ9mPKuc8syQv-nOHKlvMhCXRxy7Cv7t39JmN3yJsSBB9ExnYbakGgzg
Message-ID: <CAHS8izN1uwKZm1iyQ6kg2=81aYTPw5jQm8hxvvsHVtPnZ3yzMA@mail.gmail.com>
Subject: Re: [PATCH net] idpf: free the skb on TX DMA mapping errors
To: netdev-bot+sinfo@kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naman Gulati <namangulati@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This was found while we're working on an unrelated feature that
involved dma mapping/unmapping, and noticed this isolated fix for
unrolling dma-unmapping. It was tested on IDPF indeed.

--=20
Thanks,
Mina

On Fri, Oct 23, 2026 at 8:05=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.



--=20
Thanks,
Mina
