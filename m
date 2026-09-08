Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715859221B;
	Tue,  8 Sep 2026 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889103; cv=none; b=sF/cBKq1np15koOqsLGTjRMFZBtT2f+/Q9HenjChlIgAZM93TRmLsw2G6X2HjeCqNKKgju0+nw9q3jVc1XH984H6DyM+5g88FhGVf0FtsDOj3MUdLLzYBvwpy33GBPTenl2c84lBcgR6Lh+dgyVdWNLDbp1/iGE31QKOFqlZJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889103; c=relaxed/simple;
	bh=bRgy5T5W0KgX9F3ZoSCoTIxqZG0nVr7jNUHrMLEYcTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNB2Db0LODCJs3atAwvFHHVbS7IdoUI1tdtQw3PNmW762x7DDniEeNVMCJSgHMffBVfPMlbsNrnEs8/FM9w71LTcWy4fFhfRYpOpBfpGMrp4m7s8Aryf61UVTx145f4uYb8pxkzbZUX1pgQK4yciGiOKVdq9Kp8YTTVYPonTV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0D5TMVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0D5TMVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846811F00A3A;
	Tue,  8 Sep 2026 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889102;
	bh=bRgy5T5W0KgX9F3ZoSCoTIxqZG0nVr7jNUHrMLEYcTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0D5TMVJUI/WmvzLp2e5LwnkMtTWgZOz8iM5MPle+B4Up1HqvZP7HNUsxhhWcKwTp
	 Tfycp7+59W81EZjVQzGR2mm1kd3yaHVSfx4Ag8qr1Rxwy+a8JwVYLvspdE0hmke1Pp
	 Z0xCoYhlquwl9/iKu9a/GzyGaeYRUjkb0LklS51FcwNj8LFg/mx/wSSa6QGk8cIIgx
	 ww1D9t5P/lsrlUSIMpndJOikA6Lvs6E5iLUaCcGtkKDGfn/Qi2CcP+EXz4mkHmo9Vv
	 QEKfcYKOIccEF3+7zaAGEx6QS+f8XgwJvJjzbo5yla7P6kSnsO9JrOhAIQGz2qz3yQ
	 fLsuPJsVxeIvg==
Date: Tue, 8 Sep 2026 18:38:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
Message-ID: <20260908-lecturer-cornfield-7f701982730e@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-3-7931e5bc86ad@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oQWXLwoO16ML7jtG"
Content-Disposition: inline
In-Reply-To: <20260909-k3-aclint-v2-3-7931e5bc86ad@pigmoral.tech>

--oQWXLwoO16ML7jtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oQWXLwoO16ML7jtG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBICAAKCRB4tDGHoIJi
0kpXAQC8OSH/32amtCuarJmBKD0X8OJRlr68eC9OrTz06njAQQEAlLoifckm/Qo1
oLzjk0p89N1TMPLXBX4B9xUQMRXRpAM=
=Zs39
-----END PGP SIGNATURE-----

--oQWXLwoO16ML7jtG--
