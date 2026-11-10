Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294911;
	b=mmV79QQDCN/1n/hIo1fJFM0Xd9dX/zPnSLAwk18vL8hCu0S/HaR/rslS/4P9LBp45EtI
	 6YebpbxEjX/gzUU8A0GGTwD6Z1Mg78CDFhj+m+WhaubFXMolON3INVlqraSJNCPyAUckQ
	 KhMl2W2aT+ha8NY+n0owPzqnsyi0KAkgNuS/OGh7AgDLz/LLPgQF5y8b9nto0ZQleuTl0
	 Vsqecz0GGV8Ees4QUc/7++u8+UImKYvzX9w65FeMM4wgXh9KtH5Ya9sYU+l5/JVYNnj8f
	 fWueOsCSPUthsyS2dMYbOMoD2ATt0Tv98xgZIOrGXpaMMf4QaryzivkEEJnLR1W1s+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294911;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Type:Date:
	 Message-Id:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Transfer-Encoding;
	bh=BR31hFYX7ugXl+k+lRcU21WmDOzclg21QUBA2b36L8s=;
	b=DQNA2RTETxW48vOGiG+Zt6GUs7yHbIVSgdoM3ldd2GwSgdb1lbwWVJdiqaYpj6CUNOyH
	 KONj3bFUlMZbG7jvkHOEQsePFckM4KbbvRY6qEu8duRn60PeAnsB0QSuCnePWEUvhZV6K
	 RjqZTz46aQTBCDrxw9jCXX4diPJdTBzZ13SmhXyCwGnrK6yBN8WJszj1QzQeYUuPGHaFu
	 uCC9iubKGdjCsVQt9olrUbw4/avCrg6iL7To7Z4AmSVx1q3Gyo2cQlKObqFxuWkKh8h4k
	 +65QqZCJ9rexwORFSwZLRSnxXYSvdShkNloLS6A1/UdyVAMjv0OtoobXzMFNU2lnn7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kgb4WmZj;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EEF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EEF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kgb4WmZj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BR31hFYX7ugXl+k+lRcU21WmDOzclg21QUBA2b36L8s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794294907; v=1; x=1794899707;
 b=Kgb4WmZjdmAGtqwtzQ7jOlrdMXpEHi1d/zoJqJQzm077xrm+YJDPsnElpgZN47jDw2giBKQj
 wkjaFtUqYvxgLeFQrM8M6XhFY+voRqq5RKxJ3CkofpXah4stRHJnAifvJaPM59s1Dj9X0/rfLBO
 qBR1WLY630R52GSCCGFTskL0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c22059331bb8cc3a;
	Tue, 10 Nov 2026 07:15:05 +0000
X-Mizu-Trace-ID: c22059331bb8cc3a
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Nov 2026 07:15:00 +0000
Message-Id: <DMRCGHS3V729.FIU61TS3JYWD@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Thomas Gleixner" <tglx@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Radu Rendec" <radu@rendec.net>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Anup Patel"
 <apatel@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] irqchip/riscv-aplic: Process pending affinity changes
 on EOI
In-Reply-To: <87pkweuxbe.ffs@fw13>
References: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
 <87pkweuxbe.ffs@fw13>
Content-Transfer-Encoding: 8bit

--af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 09 Nov 2026 11:13:41 +0100, Thomas Gleixner wrote:
> On Wed, Nov 04 2026 at 14:21, Troy Mitchell wrote:
> > IMSIC rejects an affinity change with -EBUSY while a previous vector
> > move is still in flight, and the IRQ core then records the new mask
> > as pending. The change is meant to be applied by irq_move_irq() in
> > the IMSIC irq_ack callback, but APLIC MSI interrupts are handled by
> > handle_fasteoi_irq(), which does not call irq_ack.
>
> Which is a bug when the interrupt is edge type.
>
> Edge type interrupts are fire and forget from the device point of
> view. So you want handle_edge_irq() for them, which issues the ack()
> _before_ the handler is invoked. Otherwise you can lose interrupts.
Right, I can reproduce the lost edge here. v2 will use handle_edge_irq()
for edge sources and handle_fasteoi_ack_irq() for level sources.

--=20
Troy Mitchell

--af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iI4EABYKADYWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavLEdBgcdHJveS5taXRj
aGVsbEBsaW51eC5kZXYACgkQmAnvgPkzNC+MxgEAvXKrxdr5nWdz6rjiKdD+6t/x
HGW/Hn2FtzS5PQRn8sEBAJUrJYMPaqwzzMOhG7+quaURlSe0tHDC6E6pCQw95GUD
=VXTx
-----END PGP SIGNATURE-----

--af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50--
