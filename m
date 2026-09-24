Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F48F2E5429;
	Thu, 24 Sep 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269012; cv=none; b=GeGmrcSGQH/V8Wnf5BFMIPDwxPXgXnA+ZZPMyHQkhn/nm2va3ke35cTi9+gZUeO13Oi2HmELVHKCbnKohJ3ErCuq+HDuA/4JHNefBlvB0sC1JWv6b9Ugcag8DYmQIUk8GAMxuX5mlUr3llRmPxBK5ldLw4cL5xB1wktk4eL0Lh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269012; c=relaxed/simple;
	bh=z+0bitBpDapIruVyf5owmh9htDpLyrMlmjPJblWlHFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBtgvA+TzDIzU/mjk/Ynmf6TRvxY4V2Hhbw7WWBcBIoqAZ8L9gEkjfzuob8VH48Ak1QTNmyGs4vDs0/QAihi5/qFESm68xx3GQtN8DUC/hatHNACWJ2vjaDopPsS7Tjxq7s49xYQjc64cW4Ue4zsaCDNqdYEYqnjVx91rjIaCOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zg5BDtNZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zg5BDtNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BEA1F000FF;
	Thu, 24 Sep 2026 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269011;
	bh=z+0bitBpDapIruVyf5owmh9htDpLyrMlmjPJblWlHFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zg5BDtNZBgD2OxPdvQpKpA+A767a6BkQoCQPeQug6TXEzo0YAJSVhhRnAC5zsiE1m
	 KYYK2oGw5JuTVmmt5uY8gFGnD2W6nMdjvn5DPrYMzPDDIE4ojCvJvgU/WD1SLL5Le6
	 ZiFr0HCJj0aGz8u2Svwbm3WyzKlUUwMn03QnVWw8sT0Ap2Mae03MT6w9A/Mjr7Syvt
	 65gro03NbZwXRCOFrvB3AOGCLKtzRHYkSyYCoHd2KTB24U1WiIAEHLbxrXgDljXiul
	 Il7lw8snPjPNT6FhMZ58Ud5+sij8GFe1YgXBguilNusCffo5tEV479+h15nCkIe15Z
	 CjEmcR2faPuvw==
Date: Thu, 24 Sep 2026 17:56:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
	Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: ite,it8851: Add IT527x and
 IT885x series support
Message-ID: <20260924-spring-siren-c56717144e8d@spud>
References: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
 <20260924-ucsi-itepd-it527x-v3-1-a7392aa087f5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gl4nmSmijPuxfq/N"
Content-Disposition: inline
In-Reply-To: <20260924-ucsi-itepd-it527x-v3-1-a7392aa087f5@ite.com.tw>

--Gl4nmSmijPuxfq/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Gl4nmSmijPuxfq/N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVWTgAKCRB4tDGHoIJi
0ss0AQCU1jvOjMQ0QuH+3PuYoSGSUay5Un63474cy0HoOCCxrgD/bz7tQIHV/r8r
LFMvqsgTK78G9nTlnJJAu2rWn0FHLQY=
=1xKi
-----END PGP SIGNATURE-----

--Gl4nmSmijPuxfq/N--
