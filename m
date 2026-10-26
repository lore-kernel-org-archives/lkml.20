Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014850;
	b=osvOZeRhk7k+T6rFQ0HzrBv3X2a4k4eljyOXGFOF/sUtMfDqNY4Xt7VIJrQ5QcYyVZZj
	 kpPixsQtlSZtUNnyRHAYjko6vJC8FEViPTm0B1mt6xWiMnCWrNpBbLvTU16JcAX3louzL
	 3JkzHWdfaArnN1pIxkGIDSP+1a/H6LZQg1uqrtYiRoUMT7xDfpiBysgrkv+96MXHfG2g0
	 SJe8eBQwVPjOID1bJ3rNuK6NDZp9s5jBV/gzyDnQg1yxOQ0O62pqsAClGiX6pi6AjcceZ
	 2S77n2+ftfWkOFYjl+NhA4mb5Dz9AogiTvDORR0IBtznrW6EgZnIg/2frQnzHWJTx6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=qX4Sg3R1nkSqFGgYK5wNxJVnpfGKv+MxM4+gM01GXBo=;
	b=Bn5XnMg00M2y4fDPX8RwdTdhjZoxE75lEZgTZyNPqM7lgJHmvnQT0TxysWJUXOQVbS3X
	 HOoqtLF948eTTeI1ehIlUKwkymuZqMuJjgQ2YAx5H6+PpxLwgBccZ1+ibzY+05VPVTgAC
	 ZnR6dp0fVJ+Bdp9AgQW0D6Kaem+7H89zWyQWBJ3OxDHWdlRF2pCWEDaTTfedcH3+VJete
	 sm4IDLxw7EbsOI4BeJ+xzeK+6B8IuPpqwDzXRayyo2Id6bhI5PEy5bT4G5wAG7cUPaf0S
	 tJu244Ga7fmM+OQO20ZlgcBBjMNVXMfCfQ7/BzCE/PAuTTenlXjv+ZRrWuV/okI+T+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jDhPd+ff;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E761606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E761606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jDhPd+ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793014849; x=1824550849;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QCrBfYL2ew/XvubQXu1WHWV63HLKPad+FX6e7D+KUi8=;
  b=jDhPd+ffyAFQItqMp+EXpCkTZWqt4WVOKlMPQErtTrsAw2K1M+OWHJRC
   Bq8e+JOGmVIdngGO5xBPrsKX5ZgsXtZW9N7trzV9/bEhYEtsIkqT6FI+b
   +kBLCOwu6UObltPj12R075B0zA/S6Lhj4ucjFGOLAgmn8CLkWAbua8ROW
   XiT3NwLu4tStyrThXXoKMt6AVMg+BDbhZkevQG6jY6Qmn4pOb2LORvSdL
   jmN30uynoY0b0oWCtp7idu6zqDJhO/oZvvhlWNKF5OQUbmELuerL5LPMI
   2OBaxVBOogadlJxYMRtREQa7Qux/U/ktBghPoZGmAoW63Q2RIIJFGdpvu
   w==;
X-CSE-ConnectionGUID: 35a8h7M7Q+iN0xv5up2ZKQ==
X-CSE-MsgGUID: z/Da6nYcSsy3xUdPsjfLeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1552504"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1552504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:40:49 -0700
X-CSE-ConnectionGUID: M2LNJxRlT9mTEhcZgkyb9g==
X-CSE-MsgGUID: ebahKGvbQGqLdIm6xZtbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4325789"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:40:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 13:40:43 +0200 (EET)
To: Navon John Lukose <navonjohnlukose@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Lee Jones <lee@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, mfd@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mfd: intel-lpss: Set d3hot_delay to 0
In-Reply-To: <20261025193613.278610-1-navonjohnlukose@gmail.com>
Message-ID: <cc731b9b-3161-994a-764c-39654137629a@linux.intel.com>
References: <20261025193613.278610-1-navonjohnlukose@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-163579755-1793014843=:1162"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-163579755-1793014843=:1162
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 26 Oct 2026, Navon John Lukose wrote:

> Every runtime resume of an LPSS controller waits the default 10 ms
> d3hot_delay in pci_power_up() for the D3hot->D0 transition. Nothing
> misbehaves, but the wait adds latency. On Arrow Lake-H (Lenovo Yoga Pro 7
> 14IAH10) the touchpad's I2C controller autosuspends after 1 s idle, and
> the i2c-hid interrupt handler for the first report afterwards takes
> 12.6-14.4 ms.
>=20
> The PCI spec asks for those 10 ms, but Mika Westerberg pointed out that
> the LPSS controllers are not really PCI-connected devices, so the delay
> is likely not needed. intel-lpss-pci already clears d3cold_delay,
> quirk_remove_d3hot_delay() drops d3hot_delay on several older Intel
> chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
> mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
> same for the Intel I3C controllers.
>=20
> Set d3hot_delay to 0 as well. The handler above then takes 1.1-1.9 ms,
> with no I2C errors. Only Arrow Lake-H was tested.

The new text reads much better, thanks,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
>=20
> Notes:
>     Changes in v3:
>     - Describe the delay first, then why it is not needed (Ilpo).
>     - Give Mika's full name (Ilpo).
>     - Add Mika's Acked-by.
>    =20
>     Changes in v2:
>     - Drop RFC and add the review discussion to the changelog (Andy).
>    =20
>     v2: https://lore.kernel.org/r/20261022040453.45797-1-navonjohnlukose@=
gmail.com
>     RFC: https://lore.kernel.org/r/20261016114347.23633-1-navonjohnlukose=
@gmail.com
>=20
>  drivers/mfd/intel-lpss-pci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
> index 63a3fb58566..5672f033e5c 100644
> --- a/drivers/mfd/intel-lpss-pci.c
> +++ b/drivers/mfd/intel-lpss-pci.c
> @@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
>  =09=09info->quirks =3D quirk_pci_info->driver_data;
> =20
>  =09pdev->d3cold_delay =3D 0;
> +=09pdev->d3hot_delay =3D 0;
> =20
>  =09/* Probably it is enough to set this for iDMA capable devices only */
>  =09pci_set_master(pdev);
>=20
--8323328-163579755-1793014843=:1162--
