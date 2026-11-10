Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327866;
	b=RNR2Jt9E/WJLHITIdt6yYNO//5Dtf74RP1/je5+eATFKNklmZXGNHo9yJinjg9kiVgDl
	 qoRAok0kVv4RLNmVQsfLOFPSWCEHs4CUFFmcf1L2TlJodQUK6Ur9EAtZWcXoCQGjaLPbx
	 Qa3S1OHdeHbd04K4eLM/bnVB/MqhslVKyBY7vxDdmbBIehMcaLmv84guRqkxFRGz6pMD+
	 Wp9qGqpsBpS7SznKlvj66IPdwUtvSKj/ao2Knr5tK47gnC9gtCD3eAgaNMF/XR6hWNagj
	 JxVSj59Anzbpc6rHx1EtrcK/md35blpy5JWfcX15GJeztfd8NTM8FEZF/TGGK15IZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327866;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type;
	bh=pDdTABx3T9L3A4M2IU0CHP8viN7CigwBznfT0Rkl8K0=;
	b=x2lgdz3PCqgBzCkCHbV+dWO4DAi9ptbj/7jpYDGJN7aIMT2a6EzbljbjbS5N4XT8m3sk
	 P+hwCK1Ram0uaF0zF6mPCp+Zhj+eCuHFai44QaX6GjNRzDRTNXqPXtZ273oOJoGQbIH9S
	 ncyWeao9CeAKUMZDMmMG4DqpU7ycHgAY8/lgWwuT9YRmpPk0gNHy8Qpmg4IgXeTs/UEj4
	 9tPL6a6Ntj0VRgtYP6gciw0oaCQIitbVl8h7TEwSk1MPsj8Sk4fd2kx3X2yDYUFUTnAgr
	 hcRqN0DlsP6l+vZdRn0ql+qoJMMD/tFUxPx9LkqVqOmx+r5oud7jduQIbmeHELkL6Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=httpd.dev;
	spf=pass smtp.mailfrom=httpd.dev;
	dkim=pass header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=WmtNBzXF;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331D60A5BC7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9331D60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=WmtNBzXF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1794327862; x=1794587062;
	bh=pDdTABx3T9L3A4M2IU0CHP8viN7CigwBznfT0Rkl8K0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WmtNBzXFZztRWX+7bSNvZSF8McXRQAR3FvqDpwehtjTzQuXoGHS0dMQpF6vNMkOSt
	 XIwBjSA0eLYxQQhB5xYsY1/DboPXxjhjn2sPMMJ1MoOt3bM7t6oXV/eTTxzyP6jbyw
	 nxrkqFiJE5c6EsZEGgN9hWmkBV8l/ZHt/yKRRVsvFTR8fYq7wUm1bXzeq8eg3msfHh
	 RRK8xZf3KvK44X3ZNDskvFqt2U2L8wQkcq5q365hldfef7+SklpeatOxAtwsBWoMKi
	 p/UoheIPCGrQ3fPXflu1m8IAu3fSKm62hkbLsiU0uBpdH2YA/+lMLHmKtlXljrT3kO
	 v9IonsNWWQVyQ==
Date: Tue, 10 Nov 2026 16:24:15 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Angel J <iamanaws@httpd.dev>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
Message-ID: <TDT6b_7cMUkRNo88Xj3i3Ji--f4WdAmawcBXuT3TmHzVrxy0Xhr6il-PPdh6dbodGGrapwWjGx1KWruC5fAjw0cV27lhGzJ0HRWJmLgfwrY=@httpd.dev>
In-Reply-To: <87bj7wvkpx.wl-tiwai@suse.de>
References: <20261103150336.507675-1-iamanaws@httpd.dev> <87wlqtukxh.wl-tiwai@suse.de> <5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev> <877bilusui.wl-tiwai@suse.de> <57Kgu-Pdq28OE2JHZjO7YEuS6RCOZLFiDoZO8uqMUieYwA58mHOkRbbZADWKNQsocsNCzH1GkU4pSEhpi-l3mZenIkWdjdNsOHVlbAxGsXQ=@httpd.dev> <87bj7wvkpx.wl-tiwai@suse.de>
Feedback-ID: 163474212:user:proton
X-Pm-Message-ID: 6a0eb3ba420884c476877f2c956daa61bc06efde
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------c1a5a18981a95f461b8163f6fef4387adfd31006cd16a00e8b527679dc6215c0"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------c1a5a18981a95f461b8163f6fef4387adfd31006cd16a00e8b527679dc6215c0
Content-Type: multipart/mixed;boundary=---------------------7aa714084f0becf8be45852e1bddebf3

-----------------------7aa714084f0becf8be45852e1bddebf3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Tuesday, November 10th, 2026 at ..., Takashi Iwai <tiwai@suse.de> wrote=
:
> Honestly speaking, the problem is that I don't know you, so I can't
> trust.  If you have been involved with the kernel development long
> enough, e.g. already appearing with "Angel J" in many threads or
> commits, then it could be a good sign that it's a trustable known
> identity.  But it doesn't look like that for now...

Hi Takashi,

That is fair, I am new to kernel development. Outside the kernel I am
an active open source contributor, mostly to NixOS, with over 100
merged changes in nixpkgs and contributions to other projects from
this account:

https://github.com/iamanaws

I am not comfortable publishing my full name in a public archive. If
the above is not enough, is there another way I could establish the
identity that would work for you?

Thanks,
Angel J

-----------------------7aa714084f0becf8be45852e1bddebf3--

--------c1a5a18981a95f461b8163f6fef4387adfd31006cd16a00e8b527679dc6215c0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrzRRoJEBoBbwppzUxnRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcFC9L4lcIpKc4ABRb6aOhLuLc0vTnBkN4Emt2Z
2n5TWRYhBEAFf9htFyVnqZzmVhoBbwppzUxnAADXgAEA6adpJ2RmoNQhEY4X
czYLXGU7qXwiZCPlKt+dA6+xBRUBAMXJ9MDM0rYC/7ABVX5F2XiPDweURXa9
N/3UBcY04CUH
=VYFg
-----END PGP SIGNATURE-----


--------c1a5a18981a95f461b8163f6fef4387adfd31006cd16a00e8b527679dc6215c0--

