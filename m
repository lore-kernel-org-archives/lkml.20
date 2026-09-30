Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1223FE37A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757862; cv=none; b=qNpKXLoVJyYDPcnX466FHQQ4N3XFkrXVC9Hdjs7Kevvk2wvuEUPB292o4R0sEVA3qgR62QVjtoM9C16OKAz0B+lIe5H8ueOCPHSBgjlIPz6RKmpxPT1y9Bre0Oj8GTWpwfjeCOerYeEGGXG4XPRfJfmOL7ElLEa+P58U/b6h6xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757862; c=relaxed/simple;
	bh=n+W+jPGoYg2/hHnOKtH5i4OIFi7mz38e5TDOsBrfFcY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=X6lfYyoNcaFlr7SWj2o/+chRZKGFpeWjEzjMp3d8dn4nPzn4gVotgN9yo9Zm94BLC0Hwbo6w362dcDt9lPd5pF03PIHmknVVtm7wrnngyjwIBFUqR+YoJfZwdalxHVEUpIfNUe5xYgIhgSkBK0uPB8modzVrXrWqIx8ylt3fwzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iocvKYIL; arc=none smtp.client-ip=95.215.58.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iocvKYIL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n+W+jPGoYg2/hHnOKtH5i4OIFi7mz38e5TDOsBrfFcY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790757856; v=1; x=1791362656;
 b=iocvKYILZWE2PXJ7gMi1vdrqPvTu9txNCEQsKOV8C74A4vi3hVASQctBZczXF2txgBtS52pk
 qzV/Q2yKZnNZmhSWXw3Sg6t+xEEJxez6pk31U3CF8TTPa5XRfQg1rVup//PvSVhHwIFlkg6EXwq
 TIh5GzArVthF1bcAbuaWzL58=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f778752b4a353e56;
	Wed, 30 Sep 2026 08:44:16 +0000
X-Mizu-Trace-ID: f778752b4a353e56
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 08:44:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <0846c6b806603106e99346edfa1663efb08a7595@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v4 3/6] wifi: rtw88: 8723b: add the RTL8723B chip driver
To: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael
 Straube" <straube.linux@gmail.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, luka.gejak@linux.dev
In-Reply-To: <c5f27f7f-6536-4a22-87d8-4f5def76177c@gmail.com>
References: <20260923213557.186205-1-luka.gejak@linux.dev>
 <20260923213557.186205-4-luka.gejak@linux.dev>
 <6ad11268-9f09-4618-8b44-ab0744cf0a52@gmail.com>
 <a978a803-a641-4af4-b38b-f3c9b423ef63@gmail.com>
 <70785221599240049a8747750b6cf0369f8368d5@linux.dev>
 <c5f27f7f-6536-4a22-87d8-4f5def76177c@gmail.com>

September 29, 2026 at 13:28, "Bitterblue Smith" <rtl8821cerfe2@gmail.com =
mailto:rtl8821cerfe2@gmail.com?to=3D%22Bitterblue%20Smith%22%20%3Crtl8821=
cerfe2%40gmail.com%3E > wrote:


>=20
>=20On 29/09/2026 13:13, Luka Gejak wrote:
>=20
>=20>=20
>=20> September 27, 2026 at 19:29, "Bitterblue Smith" <rtl8821cerfe2@gmai=
l.com mailto:rtl8821cerfe2@gmail.com?to=3D%22Bitterblue%20Smith%22%20%3Cr=
tl8821cerfe2%40gmail.com%3E > wrote:
> >=20=20
>=20>=20=20
>=20>=20
>=20> >=20
>=20> > On 27/09/2026 18:21, Bitterblue Smith wrote:
> > >=20
>=20>  On 24/09/2026 00:35, Luka Gejak wrote:
> >=20
>=20>=20=20
>=20>  + if (rtw_hci_type(rtwdev) =3D=3D RTW_HCI_TYPE_SDIO) {
> >  + rtw_write16_set(rtwdev, REG_PWR_DATA,
> >  + BIT_EEPRPAD_RFE_CTRL_EN);
> >  +
> >  + /*
> >  + * rtw_mac_power_on() sets PAD mux bits this chip must not have;
> >  + * restore the SDIO PAD mux before RF and coex setup.
> >  + */
> >=20=20
>=20>=20
>=20> >=20
>=20> > By the way, rtw_mac_power_on() doesn't touch REG_PAD_CTRL1
> > >  for this chip.
> > >=20
>=20>=20=20
>=20>  It does, through rtw_mac_pre_system_cfg(), which rtw_mac_power_on(=
) calls
> >  at mac.c:382. At mac.c:111 that function reads REG_PAD_CTRL1, ORs in
> >  BIT_PAPE_WLBT_SEL and BIT_LNAON_WLBT_SEL and writes it back, for eve=
ry
> >  HCI type including SDIO. So the bits are set during power on and the=
 SDIO
> >  PAD mux has to have them cleared, which is what rtw8723b_sdio_restor=
e_pad_ctrl()
> >  does. The comment in rtw8723b_post_enable_flow() names that function=
 and the
> >  two bits now.
> >=20
>=20That code is not reachable with this chip.
>=20

My=20bad, I missed the wcpu check.

I removed the call and the comment.

Best regards,
Luka Gejak
