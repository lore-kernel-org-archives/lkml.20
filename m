Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B219381B10;
	Sat,  3 Oct 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016083; cv=none; b=pyYKVBaixBli0HRImksP+J/pC91kQdcPsmrYgjvbdXA0W2LDoi458E9JxQB9cFsmDIgaaGG3W67txyTfvcUXqoyFTNBFAtzu0z2uxggsnyS134RT03In4AWbPmxyoVzpJFlOIN83Rrx3sV1hZwEJkwacDeHC5SY5d4ACv3DsdEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016083; c=relaxed/simple;
	bh=V5PpXmIzFly+1SKmGmwopKYT4H0LxbCqGoZMIBOvzAU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fImudXhBRcZr3/IMd0F6Mv9TZWlQnCUIpCKH4mNj04ikCHTfuIlB1cV/yxGVWEquFvKdyy/FNol6XD6rDp+Kq42ijW2M4wFBGL+6X3DcDfIYzGzzvw0VVjsdR1PflrDlYrTQFULiIaPwhMrBtmemjpmgRSnKEjAsSenqgfm6uco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Yz1yExq1; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Yz1yExq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791016075; x=1791275275;
	bh=V5PpXmIzFly+1SKmGmwopKYT4H0LxbCqGoZMIBOvzAU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yz1yExq1b18nKbwif0DkmqbZuweapUThBEuwv9NKRoePjueGZJP7dAexFb3Q1PMBh
	 G+DwMhpZP5egQvrD7Vz7y5hDSaUTo8dsdgbzErZWu9HajwWF6VCnBaWVmmpk32yWr2
	 n5Ts3jj1ADj4k2YT0id6Er4t9d2BN89rIMDBC/ifuWI0fAnf1bRBz/M512mj9e+TxY
	 oylUd9SGrZA8xzdebO4hkTtwpyvLz/UcTEaQ8YSyi1Qc3Memr5R1DksCSnBKmWB4YA
	 hactc3jODta1waztIDES4f6RP3cgwuKY//HDyKIkF5nT+dKgVB3a7xMSaCInDd+GxD
	 69IjbF1rSiTHg==
Date: Sat, 03 Oct 2026 08:27:50 +0000
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Message-ID: <vZJyKnkShwVybbiN3mfym3OcfIkVK6pFbKl2dy8_T73jLlWeuSL7bB1e9sHT1jzWncEidimkH3ywfRsOICjXRIx9Phb2BLELcOoOp0N0YgU=@proton.me>
In-Reply-To: <MA0P287MB21789760986BD3C1EE2A0486888A2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me> <20260924-upstream-s5k3t2-v3-2-a5c58dfcec29@proton.me> <MA0P287MB21789760986BD3C1EE2A0486888A2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: f1d44564f6e2d4598ff9e0c4be9c091fcd216e02
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Elgin,

Thanks for the review.

On Thu, Oct 01, 2026 at 06:41:29PM +0000, Elgin Perumbilly wrote:
> Remove the unwanted pointers if they are not referenced,
> as they unnecessarily consume memory.

pixel_rate is not used after it is created, so I'll drop it. link_freq
is used in set_fmt, so it stays.

> Curious why 0x6f12 and 0x602a is used repeatedly in sequence here,
> unlike in other drivers, Could you explain it.

This is how these Samsung sensors write to their internal memory.
0x6028 selects the page, 0x602a sets the address, and the words written
to 0x6f12 go to that address and the ones after it. s5k3m5 and s5kjn1
do the same.

The first long block writes 210 words to page 0x2000 at 0x3aec. They
decode as ARM Thumb code, so it looks like code for the sensor's own
CPU. s5k3m5 starts its burst_array_setting with the same six words.

> Could you explain what this register CCI_REG16(0x6028) actually does?

It is the page pointer for the access above. s5k3m5 and s5kjn1 write
the same value at the same point before streaming.

> It seems unusual to write the values to S5K3T2_REG_CHIP_ID (0x0000),
>
> The chip ID register is generally read-only.

s5k3m5 and s5kjn1 do the same two writes to 0x0000, with a different
first value, and mark them as setting the version. I don't have
documentation that says more than that.

I'll fix the rest in v4. It should be ready by Monday, or later if I
need to wait for Sakari's answer on the link frequency.

Armandas

