Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B747CC78;
	Wed,  7 Oct 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369098; cv=none; b=RThCUjkds99TX2bhsyRLLOzwtQgVoYubTNwFDzCWdmSkMmyXRtQ4yFSrAlhlrFJEElmaQ/1RwO7z24/sKD2yyWggRgx1ibH+LJEQf721G6buTZdzEp/S90ipbhf+Rd65R3Ut6Z8jwHqO32fxP2SjTTBM5USAIJunuiPpzf7u8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369098; c=relaxed/simple;
	bh=LaO5Zs4d4atTAT2UDV6xKoyjncskIWOkJkBAM8uLJc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ny18gBwVa/Mw1LNUg8SotteNYxvGu8lAjlEaVaf5VVRB9QJdrn7XkhrN+OyPw05hQAj3edjburyzYKGSR9BpJdkY95uggKWG8MdOLlHXFCQOsYCbYC5jpJm7pv4ryVn2brSvzdz2m2FEd+4WTivkLoXRKcdRdLQ2RKyRju/JoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdqGkznX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdqGkznX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652691F0089E;
	Wed,  7 Oct 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369076;
	bh=LaO5Zs4d4atTAT2UDV6xKoyjncskIWOkJkBAM8uLJc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TdqGkznXRcQQx1XKgP/KhyLdm4eqis/kjnwz1UENPW/yWEspjGywrBe73q2GJMpuh
	 ajblUTDDB5nt106AuAJ2d413CDH038nvXgUQZrlN9qbnibsrpeiczXP6PmgfPIQ6Gj
	 riXt/jsGG4nCsGoLKeLp4ZpTOHo2w4rI/KBOO5GaCvwTQno1p1/VBnJSMrViywCJct
	 3FzHASw6//n7Z3dEVDTh5hnDFXbvlIj8K7FNaCxXEmDFc3IG8PvwgiOt6AoIOTiP2D
	 CuGQ2H312JguHQ0kiQI+uDS5zftoPhHTrJL8SOiLewWpQ25Td38JdTK7Q2RncaG80s
	 GWqQRb2mL5C3w==
Date: Wed, 7 Oct 2026 11:31:11 +0100
From: Conor Dooley <conor@kernel.org>
To: genevieve.chan@altera.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: altera: add Agilex SoCDK
 multi-QSPI board
Message-ID: <20261007-ecf42114798b5d90efe5e38f@squawk>
References: <20261006025418.31931-1-genevieve.chan@altera.com>
 <20261006025418.31931-2-genevieve.chan@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KaMXF/CbO57lLl7A"
Content-Disposition: inline
In-Reply-To: <20261006025418.31931-2-genevieve.chan@altera.com>

--KaMXF/CbO57lLl7A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KaMXF/CbO57lLl7A
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYfbwAKCRB4tDGHoIJi
0j+0AQCZjhLxHRMIbrfTRu6Q38BHI1Hq+gnGSeEZ/rxSYhS/pAD/XF5ZNfVhAdtq
pr96mq/mEPnu6MAV8bds5Cv/EjG9Twk=
=s5Uz
-----END PGP SIGNATURE-----

--KaMXF/CbO57lLl7A--
