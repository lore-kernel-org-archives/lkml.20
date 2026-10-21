Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586141;
	b=fCg8GlYCGYJfmslW2Eru60rQMJEZB3sIMEm4+ql0MQQtKMedcitypODs/nhKqQhfjsl5
	 u4fZmHykIsaMbqx0OOQGxhXl0AmiAlrlLw+jKln4RpX4NMMVyOyHlC11525wN/hI9eEGp
	 nyjiWb3IcQDsUFJEjrmfzuNKSwimHMwn8rFHWKmSwjywsgEeTiYBOh3Iz1aa4NoMWGHxq
	 VngXRgYeZGSoakYCNZw86XVQJ6geVrQ+yCFsrS2dJxx/Hogu/FuSCSi3QLLIA37WCDB4g
	 2himZ1FQuNtuOZKg0BCZtEnT/kiHFtUpwCDmjX/XBMJU1K1tRLEbuYI62zUVq59+I4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586141;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=mZhXxF+en7TSzDNChj0YyY8mvJcnCccOQkxv7KHn/SI=;
	b=r3iCiCKWrtkR62WuS4lnH9h7ZCk3GaM5QrrbSm/i1slKlb9ebql8i+OZZSSIUf9qdKG+
	 9QDmN3cGtD1+xVkgxXVPzECFZf1DiI2lUtXjApQkOmfRr8QeM2iUbz+WTdG86Uhmvnw96
	 MW8ZehEa3FGUM67DA7NdWFZOTyrXTgFiUZTtvdXzy76N68WLNXqt4qrSPJ0mFJTr7FIdD
	 XCu0shoaOJBqjbX7AxIIbUMcG2Z42U4bmEn31Uvwh3yvE17CKLUeir5fyzGZ/j+ctXVSZ
	 qA8KqtHX+N30e1aHTz5A2DU9BARY2IWDV2H9DSzp0c4+Zzx6tGaad5mbVxHMI2A5Y1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="hAvz/X7+";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C840606ABE9
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C840606ABE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=hAvz/X7+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mZhXxF+en7TSzDNChj0YyY8mvJcnCccOQkxv7KHn/SI=; b=hAvz/X7+dgdTH0JGQIY2rAmVZB
	gSiLmsVxT+kWSrg9UvJuOAYq6iCqcD+6hzbNfCNbjJYehUS8unyuyYEGUz0ax6SO4NAJxZjrlOw1G
	bbyI1h0ptkSgxv6S5xgGdw3xkfDYVWF+n+Ey3FkTINp3NRdZQOVvHMg6Fmlrc3sKWZsBpZNRE6ZoZ
	cfCxQhfzhaTyO2wCZv2CHSMRcXd8pmK9IQXrFtHeHKNLQtO8xW7MFQ6SDv7zcjKemgnnrOaSalio5
	HkV00/uApwM48sJ0RLT9ECGvqia2ieqtb5/t4BxmwBoknahhOulb7bQagFqim2rA2eny16JFi9uKv
	q1H42PgA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
Date: Wed, 21 Oct 2026 14:35:19 +0200
Message-ID: <6983266.4vTCxPXJkl@diego>
In-Reply-To: <20261021102155.609575-1-diederik@cknow-tech.com>
References: <20261021102155.609575-1-diederik@cknow-tech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 21. Oktober 2026, 12:21:20 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Diederik de Haas:
> The devm_request_threaded_irq() function already automatically logs
> detailed error messages on failure since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> So remove the now-redundant driver-specific dev_err() calls.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




