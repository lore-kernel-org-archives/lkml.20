Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202C7511218
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796827; cv=none; b=TdESEyTbebicSepFaUtj4IN9JDDs5RkWqxyigmDFmeHi6dCqU+hm+bR9zd2nbum2pJEOtC/11oSocLFmdz2YJCAKzesMWvAJGqCUOcF+/fxFBIQchp9TBHfIKtHgL9Z0U8HRmly5kbrU0jNP9tBAshn5wqTXOiUSFEm8Iz9j8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796827; c=relaxed/simple;
	bh=Dch8THlzxL/TlYuzoctANHBz/Q4IfInjyKSS7boNz7w=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=LjHIip5mPXH45RJ5CIFA6ecVFlDe4Or/YZfcgFxl4NJKKpH9BHoGOZJ6ew7bjwS4dRipckLRzYt0RVCoNKskx359LezbQB40GJWmaTCgikV0d4jKpdjgtEwg+GxHaAH3ML3AtWj0lGdbc3L7ySUXaaHPw+vRWaAPL9VwKSE6+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w445/3Gz; arc=none smtp.client-ip=91.218.175.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w445/3Gz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dch8THlzxL/TlYuzoctANHBz/Q4IfInjyKSS7boNz7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788796822; v=1; x=1789401622;
 b=w445/3GzVmQvwagqH+HaUBonQvkJwFFI5xdqfTy/HxVkIUDQneZUC1spFAPR42O5ZO/esray
 i+smZQ7Nkqs4JXR6G9xHdhSERB0kNWe9ToyabX7A1Dk10+Sy9o83NsWOg5jk9X8HP0mLdXo9UkZ
 nvPK7e+QXvtWKHbtKN+n9OAg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab6003ae17168fc7;
	Mon, 07 Sep 2026 16:00:12 +0000
X-Mizu-Trace-ID: ab6003ae17168fc7
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 16:00:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <0f2ad51e4486aa048cefea748332f833fa7ec57d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: fix protected RX frame validation in
 decrypt path
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <fb7186bc58696dc2117139adef454d674c705ef7@linux.dev>
References: <f718ce8ebdf9fced440fb47bc921026bd24ca879@linux.dev>
 <2026081946-trolling-handrail-ecac@gregkh>
 <fb7186bc58696dc2117139adef454d674c705ef7@linux.dev>

August 19, 2026 at 11:11 PM, "Tianchu Chen" <tianchu.chen@linux.dev mailt=
o:tianchu.chen@linux.dev?to=3D%22Tianchu%20Chen%22%20%3Ctianchu.chen%40li=
nux.dev%3E > wrote:


>=20
>=20August 19, 2026 at 10:45 PM, "Greg KH" <gregkh@linuxfoundation.org ma=
ilto:gregkh@linuxfoundation.org?to=3D%22Greg%20KH%22%20%3Cgregkh%40linuxf=
oundation.org%3E > wrote:
>=20
>=20>=20
>=20> On Wed, Aug 19, 2026 at 02:22:47PM +0000, Tianchu Chen wrote:
> >=20=20
>=20>=20=20
>=20>  From: Tianchu Chen <flynnnchen@tencent.com>
> >=20=20
>=20>  The RX software decrypt path mishandles crafted protected frames f=
rom a
> >  malicious AP in two ways:
> >=20=20
>=20>  1) decryptor() never checks that a protected frame is long enough =
to
> >  hold the 802.11 header plus the per-cipher trailer(IV, ICV/MIC).
> >=20=20
>=20>  Implementations like rtw_wep_decrypt() and rtw_aes_decrypt() all c=
ompute
> >  length =3D hdr.len - hdrlen - iv_len. and a shorter frame underflows=
 the=20
>=20>  unsigned subtraction, turning into OOB reads/writes.
> >=20=20
>=20>  Reject such frames in decryptor() before touching the IV.
> >=20=20
>=20>  2) validate_80211w_mgmt() uses the skb before checking whether
> >  decryptor() returned NULL. On decrypt failure the skb has been freed
> >  before being used.
> >=20=20
>=20>  Bail out immediately when decryptor() fails.
> >=20=20
>=20>  Discovered by Atuin - Automated Vulnerability Discovery Engine.
> >=20=20
>=20>  Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> >  Cc: stable@vger.kernel.org
> >  Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> >=20=20
>=20>  No assisted-by: line?
> >=20=20
>=20>  And you have read this:
> >  https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh
> >  right?
> >=20
>=20Thanks for pointing out, I have not read this before.
>=20
>=20Assisted-by: kimi-code:kimi-k3
>=20
>=20>=20
>=20> So did you test this on the real hardware?
> >=20
>=20Unfortunately I have no real hardware.
>

Hi Greg,

A while ago I had no access to real hardware with this chip, so I was not=
 able
to actually reproduce and verify the bug.

That has changed: I recently picked up a board with an RTL8723BS from the
second-hand market. I can now confirm that the bug can be triggered by on=
-air
Wi-Fi packets from a bogus AP.

The v2 patch with test report has been sent:

https://lore.kernel.org/linux-staging/7848fcb635963ddb8474924ed71fdd687b5=
d6ec7@linux.dev/

Hopefully this time it is good enough to be merged into staging.

Since this driver is built into distros like Ubuntu/debian by default, an=
d
there are presumably quite a few people actually using it, I believe
fixing this bug is necessary.

Best regards,

Tianchu
