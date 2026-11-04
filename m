Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809765;
	b=oUNv14jXaebFlP3JUluPWDlFdrKuqdMN92HfeiyeRHkMVbkaJ+CpS2MTHe77c+GZZ8/l
	 9jHYKeIeGUZrkFwplfK12pTEh9mslQc5gz/5qMZNJglZa4+RSR0eYiD5G0lcR/7hNd+wt
	 taQ0MiAIQDe/EZIJ1jrN9S/KktV1FmZTGWqAAUCxKebphdtAFF0+HMqheCXccM56Gj+z8
	 6hMbjBJpOiG8p4gLeEvA3ymvyWPQ3+BecG+lD/vL4wOpOFXDBzmGRDF9aBPnlH/wNmEb3
	 WB+B+FJZhDgPixlyJ/GnUxnPQZUps5bywAISZHUzVlTqZuu7V1Ay1xP4mTst4HxDj+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
	b=0MMrmQ5IA6AKzfGoZHXFt3U+VrzuuGldA3SIgsJXabGeueUTtfOwT1m7aD6zrEprqLux
	 Bmma7f9zQ+bDGZJiJ0IIuAFrfUZlrCVC/XAnZq4/FQBTVgAQuPnbJPNfJd7OlniLiTGnj
	 tkDAlMR7MiNxpQftI4p+vIJDQWwdIVYHSDwa7Vt3g3EwFMMe4t0PzLScS8eNhhapUb73h
	 KGpQQTcn3yFVs7JD+t1GkGKM+vZr+7BeSawmmRhBYw5pDJyUAJg/ON1y7cGyAe3oQ2QCx
	 05sNqvD77cz8D6W0KYijFcySCM5PlW3Stt/8R06KKu+Q9BKcGnjac7cNtGrJWo/vInA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xmf7N/QN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AB606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687AB606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xmf7N/QN
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679e6ab6471so1933731d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809764; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhUfGgsrOm9poZKMEi9DOcHA3EReS4LsT1uHE8wrXrlKB25qqUqxWrtdZwWZs1cmKJ
         vGCn7CXFLDkby1AqeRJoMUSPqzx63Rq1WueMLE4NgQ6MnAUKnwPEdD/V45ETb8LOom+p
         OiWgnXdUPpOSL/ATV6w2IFO2VAhAIwO02+tecylZ7oEbFy9t1pgtUMcrODGUShIgjUJl
         PHdVUdf7WkqFLPtNaUnBLrOeia1cI/R4QlV7recKR+DPz3yKPxPs0DUc2NXlsfr5g7oo
         IRuJn9poZ+Cc7nblyh+RZWHstInoNFgS6+5MjwK7YzQkK9Rj/2J9rsLO8Pb3m6uc+RQd
         4tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        fh=CqtWHg3DNlEPxXDnUmCU+g7j8WgQ+TlDFFcLBhAscMc=;
        b=Zg4CA+K/Pte/ehf6f9/5ij/p+mhfQjjagwb+ocsjb4FI9IVhl2TuvCVyxXxrQ49RKi
         HEr7tTSXn4/mLPGqyZEaO/HAsOoryewD1Yx841v73D4Oy/nbADJ2TTDc+Lni0+rjw3sV
         2q448VK6ZOjDfEGfMppzfDHV7O3HCpKoucaohagw53Yit4RNeGjfXClmAUAgy3zHBblh
         1kdHodq3tehtGThHd8X/aFRcYmNFdvZQzd7neZEuZDUwskQSMpWkxzW0gQjgCKIeBKDl
         RCxynHtnR0leGkzYXgSZ1CPgXHHj4jtBYye6Eez6Y3BClCokLXkeH1AoLoQqi4pGMqIN
         TTyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793809764; x=1794414564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        b=Xmf7N/QNySydGbaaWTzB/1f4sTZdzS7RdP9XGcWCCBOFbdQRU4HznnYmtkKZ1CyTR8
         D+vFJJ/OHWexlTTx53EgYhh5eWBrg+GZQqNMT/MybcqKpBGHG4G+FWhCfyNNdQ2kEnrL
         f516l+MSEZllz6IOaIqdMs1JKogYNj9BJlpNKACjeKUsZLWRmrsGHUY9xoAVP4BmBgJm
         cQZARxgVsJ8Cwx0aLm3CmM2P8MO9QRJvRiJ0r2DWxGjBd6kVsaWAfn0Kkmm3DF/Kdoqb
         vJpqfmtEhZSajtZCWzQ+6sfrbm4rrz2mBRncizv/wAZmHovHx62F1ClsH7IWEZUzH1/w
         Eh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809764; x=1794414564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        b=GqCWkyWuRBYPujYZM+WNl7UKAyheKhnlxgYgslcGU1iUbqAd3EY9vN8m1uJG7Txoqt
         pDiCxrXdHAY2YZ6ptc8P1nNYlabLGUhL1V8DgZyeFoDQAERKqbAil/SyUWKN4jXimfXB
         IlO/G+TZBqh0wTb245UDRGE7YR2ZU2dghsdsxNRrTTZ0SHyBIw15+qjvBAN+r3IY7S/3
         +OjCSBZfMswljANc48C8Ac9o+2SLMVzzVXzH6ceeKpuv9J7BILQA9cGSmtLk5c8ZwAXu
         01nEE/NVfy3YEI8GWZSIgvpcFrzlV/oGlB7brSpFaE+JwPCrwrOOgupD4p7DqPCsMYep
         /avQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCiSqgGCEURcfYo4aOh0gd/C1MmY0s0U1+B470XvrMS/dPtaOdDtjl0Nc+t632QfdRGRKFpRYjK9UZtA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bDtYpctn13ErwYL3ADrhXQLiCgDHj7fv2Slmu4eCcPmeF3i58
	ZWuD1UxQtR+3o7o8mHGZsl/MLWO/Bo20+vnyLJP+Lqd7aTFRsC2RLlvpeu6GuDXCj7BGokT5cN9
	Vc+6Jr20gOJu2A8CAPNse/TOjzu4AUg0=
X-Gm-Gg: AYBFou37e+rOvE/5KkYEHgoiBE9Vj6yzPuIsdcVOWdkW0HgpCXe0AEwvHEGaM620Fr0
	6AaLtzcCVvywlR0Q4niaNiKwL1ZXU2ijS2u3AkkO2GqV+qZMucONY3SYgZ0203BX2qA7WqKXCaa
	7SQ5P4jD8iFivfuw3qBtmc8ApJ5vj+GuxfDwLZATCeSsRYrxN8WFB9mbO/nJzFZjQbM/y/GjP9H
	nHV9J9mpjG0ycusq9xjB6jNws8R7/KCKwynxJkr1dsoRrnHWRkM7sCIq5WmkTqsZ5LSHVSzelLW
	JL9nxkqHQBbYRcVajk59caZh+pV/40z1fxb6VdeA7tSp/pEpwKZQbKx1E2t5d5ZZWNNwxHSD49Q
	l45cytvMXZTDzlxdhAN6AJ7vH0vctJGBfmiwXjI4aEpLq/+RXPnivYsaPKTmRBf7kDi3AhK4SHk
	fi88Dg53gyjEAkiV3hrxkQsXZL+F50jH+jqHjX9mtBTxuTZoH0MhgATNugkg==
X-Received: by 2002:a05:690e:80b:10b0:67c:18:cc8d with SMTP id
 956f58d0204a3-67c030026e0mr23243d50.0.1793809764215; Wed, 04 Nov 2026
 08:29:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104151601.70493-1-dev@deq.rocks> <20261104151601.70493-3-dev@deq.rocks>
 <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com> <20261104164647.5e9351cb@kait2en-mbp15-1>
In-Reply-To: <20261104164647.5e9351cb@kait2en-mbp15-1>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 11:29:11 -0500
X-Gm-Features: AclHuK8doVEFo6j2Fi68c-P_EfTM3lCyF-M5HVrIdSqvITfMTgBypxfl_seEBVY
Message-ID: <CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising
 report types
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	66ton99@gmail.com, josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, 
	Yossef Osman <Yossef.Osman@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Wed, Nov 4, 2026 at 10:46=E2=80=AFAM Andr=C3=A9 Eikmeyer <dev@deq.rocks>=
 wrote:
>
> On Wed, 4 Nov 2026 10:24:47 -0500
> Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:
>
> > I don't think I agree with this being cleaner then doing at
> > hci_event.though; not only is it more code but it also walks the
> > packet which is inefficient and may have security implications as
> > well.
>
> You are right, the driver should not parse the event a second time.
>
> What I would like to keep is limiting the mask to the controllers that
> set these bits, as hci_bcm4377 already does with
> HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY:
>
> - add HCI_QUIRK_FIXUP_LE_ADV_REPORT_TYPE
> - set it in hci_bcm on Apple machines and in hci_bcm4377
> - test the quirk in hci_le_adv_report_evt() instead of the
>   manufacturer, keeping the mask from 88397423671f
>
> That drops patch 2 and replaces the revert in patch 3. Would that work
> for you? Then I would send a v2 along these lines, with patch 1 and 4
> unchanged.

Yes that would work. That said, I don't think it is worth adding a
quirk for this. Masking the reserved bits shouldn't cause any side
effects afaik, well except if those bits are later adopted by
Bluetooth SIG. Then these controllers would become
non-compliant=E2=80=94though they already are, as the bits are reserved and
not in use. In that case we would probably require a quirk to avoid a
conflict. So, is that what you are trying to fix?


--=20
Luiz Augusto von Dentz
