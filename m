Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F148F85E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378752; cv=none; b=tIkC8xxoBPJCARLAtHWdxPbhxxumXx0GEsm5h0Lmm6nItLL1eYBc9nCnGysKpVGavCHNvSUxhBq0XeoHV3xkRUjAfF8o6CnqSiheXjK6UFlFHHCuUHu5RNQO7mu8NCaimNNMEWzdNEtAc+vn53B/Vdhhg282BhqKx1ga4RlCYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378752; c=relaxed/simple;
	bh=27aUD8Lgz+2jZ+9SaNYAWI0cjZRXFRyTIQilwFyHXGw=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Qc5jmyS4cXcwOi1HthCyiuwAlL8Z1FxPcb2ZrWTuFuvQtUtnmE9scnlgIK5vkJdEmNuOEBRJFUGugkSEy6ZJM54Rxwx9frSWs9F49SyKwJscPdd8k9iJXVjjGu/mSe07jvpNdhhX23zqQF3206HVpszEIgF0KtTJiNIl2kGCwm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EWGHUyit; arc=none smtp.client-ip=91.218.175.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EWGHUyit"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=27aUD8Lgz+2jZ+9SaNYAWI0cjZRXFRyTIQilwFyHXGw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791378740; v=1; x=1791983540;
 b=EWGHUyitrLvxGY+2OjVj/gkwLd5+edYpVhYekqpG/UTuoUHoZHqBEiEPYHmOHhxAAU/PXdkd
 XAw++FcIIrtuuDhZA1U/qccidCEHu8A0XrOXmWXMPQnoAXfvixFBheFWf1DtBN6XR/Aqq93y/jT
 1qi8Zre/o5tvNxRvAxNjptew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 112cc2b5104ee8a8;
	Wed, 07 Oct 2026 13:12:10 +0000
X-Mizu-Trace-ID: 112cc2b5104ee8a8
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 13:12:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <d2f64843fa25fe259109aa19b1592d82745e40b9@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: hal: fix a multi-line comment in
 hal_btcoex.c
To: "Cen Zhang" <cenzhang@linux.microsoft.com>, "Greg KH"
 <gregkh@linuxfoundation.org>
Cc: "Linus Probert" <linus.probert@gmail.com>, "Jennifer Guo"
 <guojy.bj@gmail.com>, "Khushal Chitturi" <khushalchitturi@gmail.com>,
 "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, "Moksh Panicker"
 <mokshpanicker.7@gmail.com>, "Andrei Khomenkov" <khomenkov@mailbox.org>,
 "Quentin Strydom" <qstrydom0@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
In-Reply-To: <20261007123221.60521-1-cenzhang@linux.microsoft.com>
References: <20261007123221.60521-1-cenzhang@linux.microsoft.com>

October 7, 2026 at 14:32, "Cen Zhang" <cenzhang@linux.microsoft.com> wrot=
e:


>=20
>=20From: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
>=20
>=20The comment in the BTC_GET_BL_WIFI_SCAN switch case of halbtcoutsrc_G=
et()
> has coding style issues.
>=20
>=20Fix them by placing the opening and closing comment delimiters on
> separate lines, and keeping each line within 80 columns.
>=20
>=20Signed-off-by: Cen Zhang (Microsoft) <cenzhang@linux.microsoft.com>
> ---
[...]

Hi Cen,

I'm just letting you know that this change is no longer needed as the
entire staging/rtl8723bs driver is being deprecated and removed.
Support for RTL8723BS has been ported to rtw88 (rtw-next) and a pull
request that will get it into wireless-next is being sent tomorrow.

Best regards,
Luka Gejak
