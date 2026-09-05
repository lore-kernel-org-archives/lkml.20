Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CADB38E8C9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616944; cv=none; b=NaKIIlImDZX8qg2JO0qyRlDq5TdJS79GeQnJihhzr34YUxZiHAgDfKGrELI4z1m7AYpKx7nYFzK2pgb1sgw7lbkLxWE633pk9HBZQPbW3k+o3qE7Cl/Y34CYf4h2sCCJR/XsJPLx+o9Kl30KyoqxhqHVuNNCdciJurNld2Ub1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616944; c=relaxed/simple;
	bh=QwgqemQ6kkGPbeLyLmP0AbZfwf8ojDJys5CRG/YYaS8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jK8sTWSFqyj1YkGRHhWqLVunf/ifurb44ZzAGXQX8MOsjhm/9UwUok3U3ZPEUl4J27mptZyvEcDA7tQVrcP5x56uhff30wcleSb2Cw0xCmflHCSbNde+gGqjKdz84cx7zqkf2FjTZzK9C6hk8AEPpO6k0QVC6CnetZ6iP/N+HrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=HT2FYBMn; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="HT2FYBMn"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 3A62DC2AEE;
	Sat,  5 Sep 2026 17:02:10 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 3A62DC2AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788616930;
	bh=LqeIVlUbmpcRaU7P29CqGIRWHizbkhq/AqRtl+ZbQkM=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=HT2FYBMn1Oa+4t1pU++m6uBY7PfvrsY8JgucygbJsVbhzaywW3YM53UWBiFBHCpiA
	 89SmGTWj9ZkbSpxJwMCXr42hVn9+EvKQuJKwD3K4OFqcSs0DOplleIPRvacw1RyDPG
	 vnStAw6Pz5C5Yhe4K9b3q06fLxLhreC5GZ37YOGsrYeUILNSLA/AmT/+lBiNwj/G1r
	 f08x/dGe2AcRShediKNhuoijo56x0Ef9DFwKKQp6pCdpum7i3Sub0kxgmKSdWfgQsf
	 deLkfKtLwWkfmx2xsRlTXy1EYaMN0aNOsFaD28sACS6fJwg/yK6bwTz1A2VDS/H1xx
	 UMaCoRtYAmhzQ==
Message-ID: <6716ab989d1b81beefe46f4fd807bd87172c8d65.camel@rendec.net>
Subject: Re: [PATCH 1/2] irqchip/pruss-intc: Use match data directly
From: Radu Rendec <radu@rendec.net>
To: Andrew Davis <afd@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org
Date: Sat, 05 Sep 2026 10:02:08 -0400
In-Reply-To: <20260903185220.2014861-1-afd@ti.com>
References: <20260903185220.2014861-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 13:52 -0500, Andrew Davis wrote:
> The match data is fetched before the instance data is available, but it i=
s
> not used until after. Skip the temporary variable and fetch the match dat=
a
> after it has a place to be stored.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> =C2=A0drivers/irqchip/irq-pruss-intc.c | 13 +++++--------
> =C2=A01 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss=
-intc.c
> index 81078d56f38dc..cc3a7c21c2904 100644
> --- a/drivers/irqchip/irq-pruss-intc.c
> +++ b/drivers/irqchip/irq-pruss-intc.c
> @@ -516,24 +516,21 @@ static const char * const irq_names[MAX_NUM_HOST_IR=
QS] =3D {
> =C2=A0
> =C2=A0static int pruss_intc_probe(struct platform_device *pdev)
> =C2=A0{
> -	const struct pruss_intc_match_data *data;
> =C2=A0	struct device *dev =3D &pdev->dev;
> =C2=A0	struct pruss_intc *intc;
> =C2=A0	struct pruss_host_irq_data *host_data;
> =C2=A0	int i, irq, ret;
> =C2=A0	u8 max_system_events, irqs_reserved =3D 0;
> =C2=A0
> -	data =3D of_device_get_match_data(dev);
> -	if (!data)
> -		return -ENODEV;
> -
> -	max_system_events =3D data->num_system_events;
> -
> =C2=A0	intc =3D devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
> =C2=A0	if (!intc)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	intc->soc_config =3D data;
> +	intc->soc_config =3D of_device_get_match_data(dev);
> +	if (!intc->soc_config)
> +		return -ENODEV;
> +	max_system_events =3D intc->soc_config->num_system_events;
> +
> =C2=A0	intc->dev =3D dev;
> =C2=A0	platform_set_drvdata(pdev, intc);
> =C2=A0

Reviewed-by: Radu Rendec <radu@rendec.net>
