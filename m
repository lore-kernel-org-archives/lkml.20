Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317785;
	b=s+M0He/snJ/ZHRDBGRkpln7yqIpvoSlLz4hgBluA7YgtkI2gmMlCkrd+KxiBe2Q3uxFf
	 lmvfyGYE+uoJQ3YFVYsBygL1r0NHlo8LYrx2mUOyNvf/zgV1NyZ0vYKDenxNzccy8clQ2
	 JtKCiaLPBhiTVZ+2HjgUBPAmDtMOwwUCqGSVY0cw/NiNgAtMsBjZXLRJZUyKWXQE4CzG3
	 yrvEKRJIDMdBTpIh7iqL2JLE+6mACQfRqxSATtJ4JtiyyreE5kijKkrRR9YOxrse7jmXt
	 /bD14C6XR3xA+n7FfRYGBtsueekRAhWcZIlssecxXaO1/MvXgl3VkBCDjTigZpvu3Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317785;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type;
	bh=LP5DUahL5hEGeUCAmx9TodRjN6W7SnWiOWsPXfAnq20=;
	b=xSJvN8maPnaEOOdJn3QnZeT2959QSnCHG/vgpJn8j8c2L6XGO7UFwU03WjxzDOvlQDVR
	 /8TmktakUl2RXDBZQ4nrvI7bLwonEvUOvPrOHpD2sil0+bn6krYf0zFTivRao/SX7+i5g
	 yzWLKSfjAyOtB2JHY/t38Gn/1o/92nNvxKzmx9RB6EqEdCz0+B/KQCXtUnTtxUtDjxqIS
	 h0z4EsrI1ktnNIpG0deE5HrPJ7UZUyIqsUWIf0hgYPm4edjJcHdvJrU47VO4AiIAM0xNt
	 12Ul3gEDneqWidyoy5kKh66J/rGDHVmcy5Ev/YCQ+ej6CDeV67IxRL6L/u6wxGluxkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=httpd.dev;
	spf=pass smtp.mailfrom=httpd.dev;
	dkim=pass header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=SuuMi19m;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDB606A74C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BDB606A74C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=SuuMi19m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1794317782; x=1794576982;
	bh=LP5DUahL5hEGeUCAmx9TodRjN6W7SnWiOWsPXfAnq20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SuuMi19mExpWvO7BEz/aPH6x1ZAuQZOPnnFssHLJi59zQMy9ErfM7KW2cA/mxdO7V
	 HsgN8s4EggKFypJWKQsCJVt1rgZUv9hz0IZCYkTtPQziufTx3PDtCoc+YFMrsUaHNI
	 0wM6ciO+ndLzNyOaC630hNyOgXkd0vOulXxUGO4iWQpeh51AI9qXCB/8jgAt6mNTX/
	 zHj6xAXKxjXdNAJQtpav9BlS+uQ6ZoI58DFhEz0P5el5X8M78KvCWtKRNQ+Qu06iid
	 J+YcacGnyHksCtAa+ftIWkM2Uq0M1I6YyPrI1Aag81HncLcN6XfLV14r1cImGvnDj+
	 lJwrvriMpiy3Q==
Date: Tue, 10 Nov 2026 13:36:18 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Angel J <iamanaws@httpd.dev>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
Message-ID: <57Kgu-Pdq28OE2JHZjO7YEuS6RCOZLFiDoZO8uqMUieYwA58mHOkRbbZADWKNQsocsNCzH1GkU4pSEhpi-l3mZenIkWdjdNsOHVlbAxGsXQ=@httpd.dev>
In-Reply-To: <877bilusui.wl-tiwai@suse.de>
References: <20261103150336.507675-1-iamanaws@httpd.dev> <87wlqtukxh.wl-tiwai@suse.de> <5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev> <877bilusui.wl-tiwai@suse.de>
Feedback-ID: 163474212:user:proton
X-Pm-Message-ID: d2ae0ac7342a2d4a561fe2c0c999f1679f4bb8c7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d
Content-Type: multipart/mixed;boundary=---------------------a59ac8069a939afc0c30510d3cf1c046

-----------------------a59ac8069a939afc0c30510d3cf1c046
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Monday, November 9th, 2026 at 22:02, Takashi Iwai <tiwai@suse.de> wrote=
:
> On Mon, 09 Nov 2026 18:58:47 +0100,
> Angel J wrote:
> > Thanks for reviewing. My understanding is that the guidelines require
> > a known identity, without necessarily requiring disclosure of a full
> > name. I consistently use =E2=80=9CAngel J=E2=80=9D and this email addr=
ess for kernel
> > contributions. My PCI fix, commit 8805840aad73, was merged with the sa=
me
> > author identity and Signed-off-by.
>
> Is your identity really already widely known in the kernel community?
> I see only one recent commit in the past, and I can't see it's really
> "known".

Hi Takashi,

No, I'm a new contributor and not widely known, and a full name would
not change that. I don't read "known identity" as requiring it, though.
Documentation/process/submitting-patches.rst asks for "a known identity
(sorry, no anonymous contributions.)", which I understand as excluding
anonymous contributions rather than requiring a full name.

"Angel J" is the name I use consistently for my public work, and I can
be reached at this address.

Let me know if you read the guideline differently.

Thanks,
Angel J

-----------------------a59ac8069a939afc0c30510d3cf1c046--

--------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrzHcEJEBoBbwppzUxnRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmf0dLddnTK8HGBE4Npk/vY90vg40LeKPLdPciT8
AJ0pHxYhBEAFf9htFyVnqZzmVhoBbwppzUxnAACQiAD/bOvZ2DvPjy/t0gvI
+drzxU829S+5ui2U3m1AmudLRu4BANNsNJnQDb3oMeOJVnlaW+kL4GErTZ7V
WvJmyhZJ4LAO
=O1tT
-----END PGP SIGNATURE-----


--------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d--

