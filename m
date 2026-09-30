Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0641E7C2E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756444; cv=none; b=WID2Fa6a01+o/fXnRQ1lxUXCG7t29RX6gnjruFchg2/psBAMYVDnnWPuYk35tKGiA1jNqwlMBA8F67hBh9zaWMqOmbNNLg01W/e70OMk0a74NViSYEsdvdV/C0V8xolkugToqNzl7r/d3LvEit2TrjgxKRfYTsmuzuG3hSdsJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756444; c=relaxed/simple;
	bh=KU9Z0TjmzxCF+W0n/98xulJpSCDAFmErT5cGAGyYdd4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=j44rorAVIVyAD+NeJkQf57NsyvEzTcSB6FNngYb8ccFbImVhWzu8wSgpMk35sF8ZSEP+2UtO8X/24SgVx650Q3AIltgFWyCl/CaY3jTfizNv6Tr/beY4E4Ev+oUwpybdt+EmeTTRxtcI+iPaKUZ+c7z9wUiHw1JWhkv4TMier3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mzbIB6pl; arc=none smtp.client-ip=95.215.58.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mzbIB6pl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KU9Z0TjmzxCF+W0n/98xulJpSCDAFmErT5cGAGyYdd4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790756439; v=1; x=1791361239;
 b=mzbIB6pl5fZEG+BU6CK3LudKO5iP9Hhbg/tTfy3SwTZYeGY2kSyXUNFIhl0/Dqc1dfYxRLxe
 JykKkmyIXYIdNRbH0JTy2D9NQtreDE8sGQJ4jzeTcWtpdCuiC1ENV0h3mTn8osjrMcZMRwrZGNt
 gDT5/g+7HBFYGMjcsBqO1Kzg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5e7aaa5e6462d98;
	Wed, 30 Sep 2026 08:20:32 +0000
X-Mizu-Trace-ID: b5e7aaa5e6462d98
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 08:20:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <6aa5303bd95549de53c37dbeafe544ce886a4183@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v4 3/6] wifi: rtw88: 8723b: add the RTL8723B chip driver
To: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael
 Straube" <straube.linux@gmail.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, luka.gejak@linux.dev
In-Reply-To: <a1ef423d-519d-47bb-be6c-d413a8421943@gmail.com>
References: <20260923213557.186205-1-luka.gejak@linux.dev>
 <20260923213557.186205-4-luka.gejak@linux.dev>
 <6ad11268-9f09-4618-8b44-ab0744cf0a52@gmail.com>
 <845297728a153af0edb5404d88e59cc4ebe4d4cf@linux.dev>
 <a1ef423d-519d-47bb-be6c-d413a8421943@gmail.com>

September 29, 2026 at 13:28, "Bitterblue Smith" <rtl8821cerfe2@gmail.com =
mailto:rtl8821cerfe2@gmail.com?to=3D%22Bitterblue%20Smith%22%20%3Crtl8821=
cerfe2%40gmail.com%3E > wrote:

>=20
>=20On 29/09/2026 13:10, Luka Gejak wrote:
>=20
>>=20
>> 	static void rtw8723b_lck(struct rtw_dev *rtwdev)
>> 	{
>> 		...
>> 		rtw_write_rf(rtwdev, RF_PATH_A, 0xb0, RFREG_MASK, 0xdfbe0);
>> 		rtw_write_rf(rtwdev, RF_PATH_A, RF_CFGCH, MASK12BITS, lc_cal | BIT_L=
CK);
>> 		...
>> 		rtw_write_rf(rtwdev, RF_PATH_A, 0xb0, RFREG_MASK, 0xdffe0);
>> 	}
>
> Why drop this function? You don't know what RF_SYN_PFD is for.
> Maybe it's required every time it does LC calibration?

That is rtw8723b_lck(). You are right about the pair, and I had it
backwards. The vendor writes it inside the calibration itself, in
_phy_lc_calibrate_8723b(), which is what halrf_lck_trigger() calls for
this chip, at init and from the power tracking: 0xDFBE0 on RF reg 0xB0
before the LCK trigger and 0xDFFE0 after it. rtw8723x_lck() does not
touch 0xB0, so every calibration after the first one ran with the LDO
off.

The pair is back, and it is the whole function now:

	static void rtw8723b_lck(struct rtw_dev *rtwdev)
	{
		rtw_write_rf(rtwdev, RF_PATH_A, RF_SYN_PFD, RFREG_MASK, 0xdfbe0);

		rtw8723x_lck(rtwdev);

		rtw_write_rf(rtwdev, RF_PATH_A, RF_SYN_PFD, RFREG_MASK, 0xdffe0);
	}

The RF_MODE standby pair stays gone, it only runs in the continuous TX
branch of the vendor. On the card RF_SYN_PFD reads 0xdfbe0 at the LCK
now and 0xdffe0 before, and the LCK completes in both cases.

>> 	rtw8723b_reassert_rx_path(rtwdev);
>>
>> 	if (rtw_is_8723bs(rtwdev)) {
>> 		...
>> 		rtw_write_rf(rtwdev, RF_PATH_A, RF_WLINT, RFREG_MASK,
>> 			           0x0780);
>> 	}
>
> So the driver doesn't work if you delete this part?

It does, and I removed it, both the helper and the block. Its own record
is against it too: four of the five registers it checks already held
the value it was about to write, and the RF_WLINT write it depends on
did not take effect at the time. The stall it was added for was the
firmware dropping unicast management frames, so it can safely go out.

>> 	iqk:
>> 	if (do_iqk)
>> 		rtw8723b_phy_calibration(rtwdev);
>
> Different chips can have different needs...

You are right, and the vendor says it outright. Its power tracking
excludes this chip from the IQK rerun, and the LCK just above it is not
excluded, so the chip now redoes the LCK on a drift and leaves the IQK
alone. I forced iqk_threshold to 1 to exercise it: the LCK ran, no IQK,
link stayed up.

>> 	/* REG_CSRATIO does not exist on this chip generation. */
>> 	.cck_pd_set		=3D NULL,
>
> A better idea: move rtw88xxa_phy_cck_pd_set() to phy.c and don't depend
> on rtw88_88xxa. That can be a separate patch, of course.

Done, and it took the other two calls with it. It is
rtw_phy_cck_pd_set() in phy.c now, and the adaptive control and EDCA
init are rtw_mac_init_* in mac.c, so RTW88_8723B no longer selects
RTW88_88XXA. rtw88_8723b.ko depends on rtw88_core and rtw88_8723x only,
the same two modules as rtw8723d and rtw8703b, and the patch is the
first of the series.

Best regards,
Luka Gejak
