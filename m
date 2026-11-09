Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247135;
	b=AgHhdqWB9gVokJHNNHGx2ct6lPiNmHK7wiruX1WUb2tpv+JZ0H8zTPRWwyOE7+UcAhXc
	 044Ai3OBKCb2kHznAkLnjzXSQ360eFFY729S3R7SG/y+I+84+tijGLrcLSrZ4Jz+owrYW
	 nhDA5Uhoj8ulO74yI8wLwnVgzSSqkk2YL9QrLR7wup/kw0f70d069LJQatMJsFEeNBOtN
	 hJtDtVgtKgiHgT/t/ALJkRxVJqvAdmwJfTgw/Cpb3tlojeM4nMfgAkPTx/jDQmhsRhopH
	 4kjStGWdFfmAjM+0BTGH1mQZdlnOuCyVdQoL6Q2fcTj3goppr5xOV22qhGZKm2zNLEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247135;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type;
	bh=Y+fgjkU6Ch+Nq/fZNg56d1mNXfquwFsBnARd47tdQs4=;
	b=NwNdyjKOCTtodNe+Ddiqhko6k7OsTO5oWN8xwPxg7JZ9cvlA3el12Pr9el6EyyCoLhJb
	 wTmePSSWof85Onn7r4kvURBH72SYD1SOsH+CirPhb5XprYcS70CR5WpvAxOdgjH+f4txy
	 ahwRqCiC0522/9McAYkKGipP1iv0WqT1EEtXt3aFrjoTFaJSp0ZP2iGHMlAIOmVLwQPXQ
	 CLhEJzguGj728Xfqvix77ZscygbEYD4FzBaKzpHtu3p1VVRcHHrNBEoC5U7MuWqomR8Mq
	 L78WcHPqX9pYYniMs0GMCpTUYQHnGQ/BVm5QVquSrY1RPVGWdaTa6q+9UlI9Wt2zyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=httpd.dev;
	spf=pass smtp.mailfrom=httpd.dev;
	dkim=pass header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=Ig9gk3fE;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFA606A331;
	Mon,  9 Nov 2026 17:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BFA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=Ig9gk3fE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1794247132; x=1794506332;
	bh=Y+fgjkU6Ch+Nq/fZNg56d1mNXfquwFsBnARd47tdQs4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ig9gk3fEV0CNVvGVb5u+nYFqV+z3CCvrhKU9G4xv0jp7E9bhyEwRabwD+E0VRiFtp
	 S6E4fFD4XfwQgdeLyWX3/0uEAbTBH2TfKGOM1Kgwjf2Frbo71JDUYA2MReCVfFp8zd
	 XWqEBghgUUSi6fkMz+IJW3Oz7sOboSmJ19g20cPKz6HrnV4tl8AYEzZAbzgCBU62hf
	 FDVyGQvr/vkueBH1l4K6xV4VXs6bf0Ixr3qFVCadyyti4lWmWZRyzhY4f6n0ikiMk2
	 cOi011ff4mbxGUADhwZFbjfWGHezML/iEi1lnGFgLNVejiXqp2WJBa64+Go34nJvKf
	 vvkmFfshPvhbg==
Date: Mon, 09 Nov 2026 17:58:47 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Angel J <iamanaws@httpd.dev>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
Message-ID: <5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev>
In-Reply-To: <87wlqtukxh.wl-tiwai@suse.de>
References: <20261103150336.507675-1-iamanaws@httpd.dev> <87wlqtukxh.wl-tiwai@suse.de>
Feedback-ID: 163474212:user:proton
X-Pm-Message-ID: e7ce95f4ff7b34428871c11747fcf23dc5dad867
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------feda68883e02afcb08b56f23442a9709fbfedd7e94eca92a69b2698ecd229a21"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------feda68883e02afcb08b56f23442a9709fbfedd7e94eca92a69b2698ecd229a21
Content-Type: multipart/mixed;boundary=---------------------1063e13f09dfd5db6e016353888b598c

-----------------------1063e13f09dfd5db6e016353888b598c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Tuesday, November 3rd, 2026 at 23:15, Takashi Iwai <tiwai@suse.de> wrot=
e:
> The code change looks OK, but could you resubmit with a proper
> Signed-off-by tag with your full name (also From tag, too)?
> Signed-off-by is a legal requirement.

Hi Takashi,

Thanks for reviewing. My understanding is that the guidelines require
a known identity, without necessarily requiring disclosure of a full
name. I consistently use =E2=80=9CAngel J=E2=80=9D and this email address =
for kernel
contributions. My PCI fix, commit 8805840aad73, was merged with the same
author identity and Signed-off-by.

Is there an additional requirement for this submission that I=E2=80=99m mi=
ssing?

Thanks,
Angel J

-----------------------1063e13f09dfd5db6e016353888b598c--

--------feda68883e02afcb08b56f23442a9709fbfedd7e94eca92a69b2698ecd229a21
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmryCckJEBoBbwppzUxnRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdS8xGq20cmH0vl0FOE4nYbuCgqoDYSGCYfwO9L
p/QVHRYhBEAFf9htFyVnqZzmVhoBbwppzUxnAAAI0gEA/ZvroE/vomNwnnaV
+RUa09tAGOXW3NnsEaoXk5qsQasBAKAiFk+6QIySa1U22OP45Q0Gf7PT2vu5
ZYNsBWX4b5wA
=pusZ
-----END PGP SIGNATURE-----


--------feda68883e02afcb08b56f23442a9709fbfedd7e94eca92a69b2698ecd229a21--

