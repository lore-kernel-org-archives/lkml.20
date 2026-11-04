Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761052;
	b=SfLeaycTheMGEkf4l4rhyZDBm4ololFnoJ/ujFx9JLEcwRfB1it+8aKlhxTTkphRb9Oz
	 rMXwAK0rZOLgQR8vPfn22oBCvdx2309TRFlHdD99etbS51vdn7SAWomKmsP4z4C9SzvNd
	 o5BUDJyhqbxw+3UQPEE5Mjenucp0Mol5H7+tPDOQB6ce70eVD57KLJzX/IeobDKCDc0zR
	 5M80p+oMcbdobf+BFk6To4DLc/6Kb/Ft7nTClcS4Lj9SfFdidpkUldx1JEXvO2zaYUbGj
	 6FNVk9tTm0eGXROIIp59SqbBoAqc4jrhPL/APi3Zxg+a+TscKNc/JCbblCY/2XxPUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761052;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type;
	bh=n+hYKtXYSjfXxp3XBT79Gp8/IwQLW8chrV+xSdRgSm8=;
	b=L2vtL89HqsNj7vk3QH/gizXu2eKCAAqrbajpxbvIhlcIdv6WS2NQTsNZdPjB+JsaLjB8
	 e00tsY6Bq0Ia8DHJIcguxDrR1P2ZMASYdjtCZAezj40YQcG58RX1QAUIeyiu+yPbzMtEk
	 VDKiQvlj12HfvKAz0cWLRDk47B0QOcXOzsh7N8tFfyzUVn/Z71VWNwiASuinOMHg23Pvg
	 o/3plfqAAu0GObgwYdFAkxVK6KB+IkPzzPEND5k/DArnc/bnFz7Sd+uNUhYJi4f1vJYIA
	 SFbBEdSZ6NCznSouQCcZ/CubJ6eakIIJMXzQvgJO94iVKQ4yN1DfFTR4W2d5l8Z12Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=runtimeverification.com;
	spf=pass smtp.mailfrom=runtimeverification.com;
	dkim=pass header.d=runtimeverification.com header.i=@runtimeverification.com header.a=rsa-sha256 header.s=protonmail header.b=jCjcnBpU;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B325F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runtimeverification.com header.i=@runtimeverification.com header.a=rsa-sha256 header.s=protonmail header.b=jCjcnBpU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1793761048; x=1794020248;
	bh=n+hYKtXYSjfXxp3XBT79Gp8/IwQLW8chrV+xSdRgSm8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jCjcnBpUeOVeVGw59pYp/qioNQXGnxLzN0YwcU4rHxH+g62pY2W0/rK72lqp1lpId
	 skebtWefJZi5ulIx8OTGZcWjk6lbNX5E+DMoBPY5x8SqCijuy3GNG5eWEGYIDUL3r1
	 TbjA8+/x/2NUqiDCHlEYGLnEOAi2i96lz56UZblaiZsq4O1K7+wc5mnMFVy88GJ/G+
	 7LPd+Nti3MiQ11fs8lX7oM1GvrRzF/CPUpSUM573/tcBM8kklpotyuQf+HpEOO9bah
	 mRwH2p1Y2tCAItF6i4qTfywYI9Pg5n+HgfgSRFab+dn69O8q1fEamc2Cq2O+fVvv0g
	 4f11fNfGyayrQ==
Date: Wed, 04 Nov 2026 02:57:19 +0000
To: James Morris <jmorris@namei.org>
From: Natalie Klaus <natalie.klaus@runtimeverification.com>
Cc: Christian Brauner <brauner@kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com, gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org, willy@infradead.org, paulmck@kernel.org, corinnt@google.com, stewart@linuxfoundation.org, linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, tytso@mit.edu, keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr, "aklaus.code@gmail.com" <aklaus.code@gmail.com>, "palina@runtimeverification.com" <palina@runtimeverification.com>
Subject: Re: Kernel formal methods mailing list?
Message-ID: <9YSGLlcFbkzUCvt-LBQkhT8BI5Y4v8yNQC4bkTK2zxwm5W-gnkX4rL0SRvQrb1bvGNY-dACfKyk3_vwJE_arlXZaXDK1cYdF95SFQNGJASw=@runtimeverification.com>
In-Reply-To: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
Feedback-ID: 202241500:user:proton
X-Pm-Message-ID: 204e5987e599fa885aa1b1918339f8a4f8c0de4c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------c5235008b61c7347ac5e6db568dfec6e21d0ad9cb5b4dcab80dc092ac1ac4970"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------c5235008b61c7347ac5e6db568dfec6e21d0ad9cb5b4dcab80dc092ac1ac4970
Content-Type: multipart/mixed;boundary=---------------------bc90e10ed30151a7d5a88cdb7510edfa

-----------------------bc90e10ed30151a7d5a88cdb7510edfa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi James,

Adding Palina Tolmach (CTO, Runtime Verification) and Andrey Klaus
to Cc.

Great idea, +1 for the mailing list.

We have a prototype deterministic (non-LLM) C to Lean 4 translator
aimed at low-level C, with the Linux kernel as the main target,
including threads and mutexes. Andrey Klaus is working on it. The
generated Lean stays close to the source and is executable. Coverage
of real-world C is still limited. Proving the translation equivalent
to the C source should be possible, but is a separate research effort.

We also use a C -> Rust -> Aeneas -> Lean 4 path, checked against the
C by differential fuzzing. We tried it on UVC [1], Binder [2] and the
userns ID mapping [3]; the last one produced the uid_map range patch
Christian applied. On the io_uring cBPF filter validator [4] it found
a CONNECT filter bypass, fixed in aa5d5f8e5023 [5].

Looking forward to the list.

[1] https://github.com/runtimeverification/kernel-c-to-rust-spike
    https://runtimeverification.com/blog/hardening-linux-c-code-a-rewrite-=
and-verify-loop
[2] https://github.com/runtimeverification/kernel-rust-verification-spike
[3] https://github.com/runtimeverification/linux-isolation-spike
[4] https://github.com/runtimeverification/linux-cbpf-spike
[5] https://lore.kernel.org/io-uring/20261009133807.730724-1-natalie.klaus=
@runtimeverification.com/
[6] https://github.com/runtimeverification/kernel-rust-coverage-map
[7] https://arxiv.org/abs/2605.30106 (AIMACS / CAV 2026)

Natasha

-----------------------bc90e10ed30151a7d5a88cdb7510edfa--

--------c5235008b61c7347ac5e6db568dfec6e21d0ad9cb5b4dcab80dc092ac1ac4970
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrqnwAJENPUo8p5WGNmRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcme4avFYwWg39IlmtXCO59wfELW5hHC+wvg0S4Ne
hmx5GRYhBOCRWztRAyANJCJf9NPUo8p5WGNmAAAzZwD/eoXHVVw7dkvcWOGQ
kGLRYZwfA6bqKzl4UadZjLNDxwYA/AtcrKzU6G0ITE9YBFaKCRuhCy2iB6sn
wveQTDGLM7QD
=aPfw
-----END PGP SIGNATURE-----


--------c5235008b61c7347ac5e6db568dfec6e21d0ad9cb5b4dcab80dc092ac1ac4970--

