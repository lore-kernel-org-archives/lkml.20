Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A049A3D7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890494; cv=pass; b=RW4W6xXAcOhn2EgYQeB1k+RUvNJlV4VFXa8wcp1p/gfF+zN1/SL2jYKHYhnCTedc3cEPzosL2/gpXnqaDjCppcHZ8nsGREsUN8NjAgf/cq5Fm0euAMEfaX5Qp1Ou7k8vl5ZRVQ0xbeOPKIJINctx9QY/lmPk3waQ6i0eeYRaD6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890494; c=relaxed/simple;
	bh=rdwGVEdXEG3ZY8Su3OawS9xDm33FV4ikXG9LG9RAMwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwUEq96aklpRyOYyJj4vdSZrAAi3DNmNTRh3IFiT3Z3kR3G6mqp6nfe9JQwRRKbL8awHzK87KOGA+jU0mug1jLITzBobmCgvF5WGSrtmikrQdTrplgUSYJqAe/t7kjwrzfs3uiFOoIAs1GREzMvn9yjClza0pEKcevUpWz30FIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=f3gET3cB; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="f3gET3cB"
ARC-Seal: i=1; a=rsa-sha256; t=1790890471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EbKuzb52YVqERGRFJkrQaBnSvOMgmiko/rjly+R/Sk2zQ5x9E6DpEpqcZls9uZq5u3MTJjinb83h20FZpckl6zsv8TjjHaxrsd4Okso0q+tbfOQWfjDlV7lGtx2P4W+r9LPiX8AAGN1poFT8QwpdDPg9zcKmEAuQ1kiT7J4HDVo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790890471; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4EQaDthGXG//tsvqp7HRqH9/THSqJf0NMZqmFez268g=; 
	b=aKYzI4kbX3mQfbzB4hrGMMsln1laSCIO8OQDAy9GTS84j743hJAU5YMt5C9DKux/xHu26VzbIw92TS1sIKCZoY/Eg2+C+pUGZj+BcoiUjvvKqe6vbLE7GCYecNv6MMyrjqLY7jUOUA4d2HZ+GL9m2yhHC4EWFziDPMTA/LjD5EE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790890471;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=4EQaDthGXG//tsvqp7HRqH9/THSqJf0NMZqmFez268g=;
	b=f3gET3cB025CNa0Qgg4+m5wT2IfXkKP98VLGUYb+hjHCTUEuxOTaxs3Z6TfjfFMB
	ew9xpGX+JeZ7DysneYao4jyddWLacnylzMsjMnilRZlw23s81qVggPegL+0+2CLkFHb
	PDFHb09nVf55UtRUbcmG63qdvTdMqWU9KtN1JdeA=
Received: by smtp.zohomail.com with SMTPS id 1790890469129854.6980276600326;
	Thu, 1 Oct 2026 14:34:29 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 860C5180944; Thu, 01 Oct 2026 23:34:25 +0200 (CEST)
Date: Thu, 1 Oct 2026 23:34:25 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH v2 0/4] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Message-ID: <ar7QuTetvpLltrDT@venus>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzbu3rdhu6gbb2rv"
Content-Disposition: inline
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.865.66
X-ZohoMailClient: External


--hzbu3rdhu6gbb2rv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
MIME-Version: 1.0

Hi,

On Thu, Oct 01, 2026 at 03:12:38PM +0200, Sebastian Reichel wrote:
> This was noticed on RK3588 EVB1 when resuming from system suspend. This
> is technically a fix, but its unclear when the bug was introduced and
> system suspend is broken on RK3588 for quite a while and not just due
> to this problem. So I think this fix can be merged the normal way via
> linux-next.
>
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-cl=
ock-fix-v1-1-f7d59c31b908@collabora.com
> - Move suspend exit code from rockchip_usb2phy_power_on into a
>   separate patch and reuse it in the clock prepare function;
>   move is done in a separate patch
> - Updated commit messages with proper rationale
> - Added one more patch dropping useless assignment
>   of rport->suspended directly after calling
>   rockchip_usb2phy_power_on/off
> - Add one more patch unifying and simplifying the debug
>   messages for phy init/power_on/power_off/exit

I was too fast sending this out. While it fixes the problem on
RK3588 EVB1 (used for testing this series), I just noticed it seems
to introduce a new SError in DWC3 on RK3576 boards during boot. This
is quite unexpected. I will investigate after LPC/OSSEU. For now
please ignore this series.

Sorry for the noise.

Greetings,

-- Sebastian

>=20
> ---
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-phy@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Igor Paunovic <royalnet026@gmail.com>
> Cc: kernel@collabora.com
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> ---
> Sebastian Reichel (4):
>       phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
>       phy: rockchip: inno-usb2: drop duplicated update of rport->suspended
>       phy: rockchip: inno-usb2: move suspend handling into new function
>       phy: rockchip: inno-usb2: move suspend handling into clock prepare/=
unprepare for RK3588/RK3576
>=20
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 85 +++++++++++++++++++--=
------
>  1 file changed, 59 insertions(+), 26 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
>=20
> Best regards,
> -- =20
> Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
>=20

--hzbu3rdhu6gbb2rv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq+0doACgkQ2O7X88g7
+pqJ1Q/8D2Tm0nol7ppugtLlv6+/sdwq4bM5fAAPKW0jJ1tKChQ0rtF/DSXa8GR7
RbOLivmAi3u6osu+nV//YEB9FjnLaGZa2TEtUKCDB3EV6tuDMV3RnpVFMlxvQAvc
5YeS7oJaIf2OX/SErBlk86vhgMumSZAyB9UHMlNUhJB64WhLTfBMBpWGnqha7gmC
CaajrdlNNXFOn5mDJ/dV1EeH448pLXjdKfqFUAJ0K1jBfv2VHQOishuCHJblHhEV
GFseURltjpuPhBT3BrwW0d2D7Il/hNUgrGFbPv65HUc+lOMy6+O5TeARpeGmqj5f
gn5FEJaPgohvSSs40+FJ6kzHnzJSTrGgG8FBtJRTllSs/v8o12vApJBYzkTzVSGT
XP6xHWVepj8OOdoPpIH+8nWHg61O5lb2JPXrfCOHar8Mv+pDILTvepuiZhdwjrtD
NnAECNdunKHNVx3u32HsLVLm1O+9lR8DgPhYkktVKwVaz74fK0mjcp9jueiT8Mqb
cnV1GUtqVvRZHIDSirNElBcbo5neaEq5G3faKjvj7+gT4eS2gX6qiBrigkSGglbQ
58p/U+ELroD8RMPHtj0kr9wQYH8sHLU/0jVEbd/WecM0OEOVttxwwN+3Ee8uuDZ/
wFPK7EvIMK1ADW+xnlG24liyZCvOdHE4QBhpsCmuh9ob6CnjJzk=
=4Wvh
-----END PGP SIGNATURE-----

--hzbu3rdhu6gbb2rv--
