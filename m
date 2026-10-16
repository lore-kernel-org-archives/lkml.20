Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D43F44C1;
	Fri, 16 Oct 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134138; cv=none; b=fWWGmLCslL/HlZvaPuw4wnhmgT8TC6/HsmZCd5d5tfw+W+5QEVhn4eFImzVE8HayT2MnNEVPfs6gJqCX2zJtImYelX7hI9UZ87SXRec4NFH22Z4/7pP44xcW0W8Y7EB6cJpoUI8poAtmsuI8nZdSvTsylIn0KU8i8A99lPwoa74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134138; c=relaxed/simple;
	bh=SVhPplxo03MGqwTnrdXxtyIz97+ivSdsIhDd2C5raA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fj8CAoR8fmnLFvqQpjUXTeZzsiOEY1fFg87IYrYm3FX50hDBKtiir4TXkxZEK/azIAViSI0bGF4BiSoY6xztXKviqIiv7EL6LpbLCdXM+Kq1/SvEbQ17NouUiTP7AN3J7+fNxSA+vsdfkAiQNGgjWTquadIGUezh/o7ujoPT15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OD40j7Oe; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OD40j7Oe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792134129; x=1792393329;
	bh=SVhPplxo03MGqwTnrdXxtyIz97+ivSdsIhDd2C5raA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OD40j7Oe47w/HaNj2X55wE2IOf7xix47Wj0xYp3/n0/EVzhkc7emjXH63rBRHhk9D
	 7Or1bh1v6HRIDTUi8ppydm9gpq6R0kozXhbChWKoE5j6lQKT/wAX8bl79gU+YhBFZq
	 8Bqy885QxhOQI3Tm1E0Wp73D/bipSlk6u00O4RPtWcx4RYrWF3QQMKT8f9Y5GNlz0x
	 y9yA12nQnzMpJlhI+/1e7F6jLDyz71ebBLNbgdimxgRofDQOjq6vhYn7LwmRbt8IUl
	 v3DcUnp22AV0owqdbOZQp1c/ysgM/NB0FGgim1uiX+WOFEcFW5yvrwXjF0VGCXXLL/
	 6MrTZuhM0PhFg==
Date: Fri, 16 Oct 2026 07:02:05 +0000
To: George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Peter Marshall <pm@petermarshall.ca>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: fix VD55G0 streaming below 900 Mbps
Message-ID: <20261016070158.43624-1-lsa.uz@pm.me>
In-Reply-To: <20261016-vd55g0-sp11-fix-v1-1-eb14bd80d8f8@gmail.com>
References: <20261016-vd55g0-sp11-fix-v1-1-eb14bd80d8f8@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: aa5f439dac80abb781352c4a70dd20a282f89b25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

A data point from the Intel model, which has the same sensor: revision
0x1111, firmware patch 2.11, and 0x0329 reads 0x01 after power-on there
too. My vd55g0 driver writes ISL_ENABLE =3D 0 once per power-on, in
software standby right after boot, together with the clock and output
settings, and with LINE_LENGTH 1200 the sensor then streams Y8 and Y10 in
every mode. So here, writing 0 there does not stop the output by
itself. vd55g1 writes it at every stream start instead, which may be the
difference.

Thank you for offering to test my driver on the Snapdragon model. I will
Cc you when it is posted.

Sergey

