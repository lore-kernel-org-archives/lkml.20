Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1EE4EA39C;
	Fri,  4 Sep 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534679; cv=none; b=hJWDSJHz2iTWMyzQ+YtfSgn0XWYq4rshpRhkLF8Bw/BrebDHTkyQ5ffl8JUROsPsmnBN39agwk9ZjmJzWOggwqzULPXVttm02ItLFQHyeDUcBhndPlDsyTF7Wa7BwVGpr7WpWLhQUIuPqTLcDxRSBc/wvX0PcSXzMYCrjIls1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534679; c=relaxed/simple;
	bh=1BmHvGQLYZI+8mQ/4U5MBn9Dm6Gp3QoBS0UZAfGx3jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYLDM1+k8A7eWjVHPRXA1HQquITt7D2bAtHjxe6fi5szXP7T/x6O67rr+ivBJpWc4naVvyvFzMfme+dNx9TXsLrTbDAebZgcKhybELy8oMfrgm9cwL79IGJurTTFdi1a9Bpdp/CFDp1cF+NHiYcjA1ERO4H2w016afrrpkx4Q84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=benIKmJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="benIKmJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA2F1F00A3D;
	Fri,  4 Sep 2026 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534678;
	bh=1BmHvGQLYZI+8mQ/4U5MBn9Dm6Gp3QoBS0UZAfGx3jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=benIKmJIWnDDg6vX7aZDzRoBEOvJt1wnfhWV5a7jv2XxrapXFCIqfd0cSarZ/VMLR
	 elnKEsDjgdryY8go11rGmHzWV6p5xSjabWHJGkuXHN/Qu9O6HKGIQdKqGDumkInQw+
	 qoYh/ZYtSk9hT089MzlTtNwSjaWe+5ZpR+ecz/Nstsepe8MGuABRGLEtIecxzJ3GyF
	 tRB/96Agw8WaEzpqDa71GxxuLhWKKVNmYTLNysrK3Y6+ccX9uZBt7W6QF0s8qB4yjA
	 EBSR20Zc6bXoob6uuoJ3F/HScYhcEHdtQvwV3z6t3g/F/8FINhR+Qi4Pw5oyWpeTBw
	 QlNoKZdOhDcVw==
Date: Fri, 4 Sep 2026 16:11:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: npu: rockchip: allow DVFS and thermal
 properties
Message-ID: <20260904-delouse-silicon-e9b6286b7e1f@spud>
References: <20260904130858.27803-1-royalnet026@gmail.com>
 <20260904130858.27803-3-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bUE3pkSw6P9WMgiV"
Content-Disposition: inline
In-Reply-To: <20260904130858.27803-3-royalnet026@gmail.com>

--bUE3pkSw6P9WMgiV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bUE3pkSw6P9WMgiV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprfkAAKCRB4tDGHoIJi
0mLxAP4/WUj+Dtl3eGbLZM89xW8dZJDvW1nzmTMWTbHfgdnpGQEAy5Ei1DSvANlI
Gzz2Nn+fBRATNnmyqLIPXMe+R23uxwQ=
=SdkI
-----END PGP SIGNATURE-----

--bUE3pkSw6P9WMgiV--
