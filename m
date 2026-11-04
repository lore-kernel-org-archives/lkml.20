Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793854;
	b=Jiky/3ar6mgw/6eFzGGJpOVsSMSnEBjwmm6CZPKNW9BCvExiUof2ttfkBU55jcaDaoUB
	 xXO2VYAwZCxrcfjg3i59JSDRv63hhygtdJrBoZFmpAAv2BSSp/caSESmAo7pfyBzsv2A/
	 vSlTQxje3boq6D4wwIHakYsnYI2sQr8oWL8mSoZR4KqzDMILT3dbEx5dIXkpnpuKqDK+c
	 xDUUFQSDdT7YVpWE+/TFpmdAnJWiXU88LtoIrlNYe/I76X9D/5n1MjDuMiXZgTh+lzuWc
	 bYqXy+9m6p+7uPpy19Da9I1tiios5FRVx6SqYT+uLB1vaNoGNKZsS7NXMl6cDs61gEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793854;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=677oYktkfZNgmcjc+8sUJ4wlu2SRiEBON5qQ96zG5xM=;
	b=1c4aewuaR5Mv8al2SIa6YhXsAQGARh/Yq3UNbmZaKM/NLcX7BGcU87O6qYZJHrbTAqS2
	 LjrCUP7lWfvLDiHiQKq9RacsASjoS2u9n1/C+jfBiYIuudCH+hGnquhEwWBDlWuhUZq8k
	 N/uRmvRMlZLFzLwJiD/977YYeTTJZTb5nc9GRAo+misv6blUllXhwjpP+xGdDTTtK+E+m
	 dfSotp3aFLLX+g3mM73Qj7vgn1Kd8oRxbZ9vdhYjq4hs0vKVl9aWpY5r+wotmBrMpCage
	 e6NVnkQekpUJZnbCuzruK+XjTaa/dgvTbwF1uiPFjRApBVvdk/hrHZaCNdnMFBV/4AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=EnCWrJEu;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6333606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6333606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=EnCWrJEu
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id C60CFD3370;
	Wed,  4 Nov 2026 14:04:10 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro C60CFD3370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1793793851;
	bh=677oYktkfZNgmcjc+8sUJ4wlu2SRiEBON5qQ96zG5xM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EnCWrJEuV7yY2RKH3qNTtrR9scnXQii8x3o+DtZDmejZ6O2GeJAGgGt3KtoHS/eAb
	 ZRyt1bvBjc1uvWj2C7XODlo9xz5y8ygI8mum106/3PaySTmo65t/mqD2QHu8Z03ygU
	 +BB00X608rUn4q/+JOWOoFpl7bjPSEMJ3B821ZdtLoAQCdrtjjNTk9Yr7pNoR7FW/Y
	 wGVHbGfZdSt4buvzU1IgkqOaQANl26d2vqJFRuaYW/pOut2ecsgr66Z7upyzXU+/I3
	 uhGttXmmSli9d1JI2yvarFSAubm9oPayvqIWQrW+IFhs1NcyR6r0bwc9vRCubza0t8
	 qzOHDTLcaUMJw==
Message-ID: <d73d1e9a851e3adf270924c3b18db0f85defdbdf.camel@rendec.net>
Subject: Re: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI
 allocation
From: Radu Rendec <radu@rendec.net>
To: "Farber, Eliav" <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
  Antoine Tenart <atenart@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 04 Nov 2026 07:04:09 -0500
In-Reply-To: <BY3PR18MB47221A1FD4F6674E206DDEF1C6632@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260923083703.38974-1-farbere@amazon.com>
		 <20260923083703.38974-5-farbere@amazon.com>
	 <d413238a3c5533572013d1fb27142345aabdd101.camel@rendec.net>
	 <BY3PR18MB47221A1FD4F6674E206DDEF1C6632@BY3PR18MB4722.namprd18.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-10-24 at 19:33 +0000, Farber, Eliav wrote:
> On Sat, 2026-10-24 at 14:47 -0400, Radu Rendec wrote:
> > On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> > > Add log messages to help follow the driver flow when debugging: an
> > > info message on successful initialisation, and debug messages on the
> > > MSI interrupt allocation and free paths.
>=20
> [...]
>=20
> > > +=C2=A0=C2=A0=C2=A0 pr_info("initialized successfully, spi %d to %d\n=
",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
riv->spi_first, priv->spi_first + priv->num_spis - 1);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0 retain_and_null_ptr(priv);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 retain_and_null_ptr(msi_map);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> >=20
> > Not that this matters in reality (because all these numbers are "small"=
)
> > but for the sake of correctness: all the variables you added messages
> > for are unsigned, so you should use %u on them.
>=20
> Thanks for the review. Fixed in v2: all the new messages use %u.

You're welcome. Thanks for fixing it and sorry for the late reply!

> > Since you're cleaning up this driver, you may want to look at the other
> > prints. For example, the existing pr_debug() in alpine_msix_init() has
> > the same problem.
>=20
> Fixed in a separate patch in v2, which also corrects the wording of that
> message. The other prints in the driver are pr_err() calls without any
> arguments, so nothing else needed changing.

Sounds good, thanks!

--=20
Radu
