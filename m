Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.143.146.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581819;
	b=JtgKnfbiDVqcfbck4tYYP6M2mRK7AGeNkZSKKAJeVoLKGJ7dHogwpWg4N9VmVtNrpz8A
	 A8qdUTpm+hsG2T0NbhNyvImOd69CU2uh2JWXlD9rcuw+kv8yzsPCdFxL+pJElb49Sie/r
	 CsXr7R1uwsid3l/99+5MEoYC0navVi/UEJL+vclouTWcVbbjxfWndTUSKECZvMh8M4r4i
	 kYoxyNL7QrWFc2f221tfmuaYA7SDAFQz/JZwjuYqgC89V1RmOmvr0pc5NeVpSxwE3SvPK
	 dEfDi6xmT6NDWUzX++I2vatjgBuFwCkuj4IJ5rFRPEoy4rlD5Y/WWpIKNnyXwWajLmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581819;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=TR6OUDgv/AYeU+Y9kzpjd8XgXtxPnBaUiNmXSz3VrPY=;
	b=pVASDW26P9Eq9GBjCFeqxUfDDbAm4cetuG8aHrp4UivgazSgM6e0bBNeadFr1zRbU9Uv
	 gMOXq/eZnk1MQqgyZntEO4vTUcmuGahzfZA56PgF002dD2q5DGdc/CY/zQzmRB9pL3/kb
	 7fS2bq0RP3B6PWpSl9AbJKtSK8A2+IvZIr1E0XLqmwx/bdGG7aJYXAALwqAUN67ca9Ys0
	 qvc3KoyptR4IRWZmF+WWeaW+epLkR3QLhGAjeUMvbA4HiOypW7ulOPULi/mpCYS8/McRi
	 DE3HIesK5H9bbk1rE/FMZghcXtqducAU06pEyXaPPD3pmQ8M6ku+cuvDjecosx4+Y2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riabenko.com;
	spf=pass smtp.mailfrom=riabenko.com;
	dkim=pass header.d=riabenko.com header.i=@riabenko.com header.a=rsa-sha256 header.s=selector header.b=icLlwkPU;
	arc=none smtp.remote-ip=185.143.146.30
Received: from lab.riabenko.com (lab.riabenko.com [185.143.146.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FDB606A323;
	Fri, 13 Nov 2026 14:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FDB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riabenko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riabenko.com header.i=@riabenko.com header.a=rsa-sha256 header.s=selector header.b=icLlwkPU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TR6OUDgv/AYeU+Y9kzpjd8XgXtxPnBaUiNmXSz3VrPY=; b=icLlwkPUEVsACSTmGciMV+obki
	vaaK24xmY7p5HvT8ILweO2EX6mSs/DlDAtr5F1ykk/eP2V8IBKjEsht/DQfkgf1CJUE1Rr5vN8XCO
	FiDfHgms1a105kspPxSbOIQxnF6kTquS/URON8FfOfrqy0ewPulQT6Cyr3wIauTqn4KznQiKdk63f
	TnSxAim314uTC428opxr0amlpQM1i2bxWVq7BIGpbyglVh4qo8xQ0guSJg7QlK3EXlF/uRrfUa7Se
	r6nao+MBL+IMm5G3w5waLoMEPfXn/tWh/wrVSrqLFDdByPzFTVLNKCpzflnLjmQpedSU+rjmjrz7v
	SbY+zsBQ==;
Received: from desk.lan ([2a01:d0:333::831])
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <roman@riabenko.com>)
	id 003MDt-000000003EU-1G8y;
	Fri, 13 Nov 2026 16:56:46 +0200
Message-ID: <5bbdc5d6cb97148a8c03724c0921a5a403eea762.camel@riabenko.com>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
From: Roman Riabenko <roman@riabenko.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 16:56:45 +0200
In-Reply-To: <b37fa1dd-862f-48ac-98c9-4556c2bf3f94@lunn.ch>
References: <20260822052353.22881-1-roman@riabenko.com>
	 <b37fa1dd-862f-48ac-98c9-4556c2bf3f94@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello.

I would like to follow up on this patch.

It received a Reviewed-by by Andrew Lunn on 22 August.

=D0=A3 =D1=81=D0=B1, 2026-08-22 =D1=83 16:53 +0200, Andrew Lunn =D0=BF=D0=
=B8=D1=88=D0=B5:
>=20
> Nice, thanks for doing a proper analysis.
>=20
> > Signed-off-by: Roman Riabenko <roman@riabenko.com>
>=20
> =C2=A0 Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>=20

I do not see the patch in the sunxi/dt-for-7.5 branch or other
branches. The state of the patch in the patchwork is archived.

I would like to clarify whether there is anything that needs to be
addressed to get the patch through.

Thank you.

Roman
