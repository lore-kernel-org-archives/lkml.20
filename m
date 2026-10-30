Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388777;
	b=rf7JQwxL0wgQtem5fWBDQWOYp4PrlrKJTGVOQOI1gt0oiEeelXNQjAEzv94LQiI4IsAV
	 MzfgoAz0GsjtyoKe96TRpyk7XEw0S6l1A6dxaz8HbGr3G/hEONigCUXp74r+pDWJ7AB4A
	 IcfPQded2vJ7JFoatb0RDNr5lc1r1eaZ/Gixwr0LnkbU9Mskq+9/RUTasgSEHTb8q5qCP
	 9kuuGPc87bALeN+jZWPNP8OifRfPc0iUUkLCphjmIcnkAHTkPinpl1z/K+JCE/vjKC/kf
	 bJm86jG5zMxBSo+IWuhNdiUcSy9BCIPo/80MZIGf+uEKOElndWj9ZA6yF6PuyFGOtLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388777;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=YS+grbdduDJikrXIuugP6G07Jny6hR3fuIP7acPZrdA=;
	b=G6V2A4DojdPluKPYuzJhllJ7zahM3IkekD7lAQEya7B622/wWoVssyMUEukG+IXw4TyJ
	 inud4huWBmvdJGZuBqoku9l06TqA2Q/WGFqJ/agL6ozcJqXSn2+83aQEd3eour1SN97cU
	 CBKt7MKggAyi5yTSxvJMm1BNMjumkgz/6DPLzqp1/s016yurrJL3D2fWba/eRrCd0Get1
	 cvgD0IypTb8g/i4h23R9PMYsO+62ZhPeVbHll03BNAwlxbfcRhX37f1+WmHAVgMN70Wm3
	 g+0NdzcCE3cSdRAeKB1WEGZhqD+ZU/JVhNaTW2aagej/XCEqSYFlK53KK+cPSjtUjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cghhF8hM;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257AC60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257AC60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cghhF8hM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YS+grbdduDJikrXIuugP6G07Jny6hR3fuIP7acPZrdA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793388774; v=1; x=1793993574;
 b=cghhF8hMmRjLAAk7DNKxswok4ZN3ruvaTkv0YwhfSmulghc5JBSvjfjigwDtiqOPvLfOSTjr
 Cddjnt9rhOqRrjplFUFxkuULJH1JhJmyOnliKm+ytzZDQGOzuAkT2vNLjMy4HTkdR3YxqKoKWab
 DrLOFeWJQmOwCskJEHO0LsSM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2266e724e659835c;
	Fri, 30 Oct 2026 19:32:53 +0000
X-Mizu-Trace-ID: 2266e724e659835c
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 19:32:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <bfef11e436435bc10bd398897adbc15518969e2d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v3] wifi: rtw88: usb: don't report the
 aggregation buffer as a frame
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>, "Kalle
 Valo" <kvalo@kernel.org>, "neo_jou" <neo_jou@realtek.com>, "Hans Ulli
 Kroll" <linux@ulli-kroll.de>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030165451.365591-1-hjf3108@gmail.com>
References: <20261030165451.365591-1-hjf3108@gmail.com>

October 30, 2026 at 5:54 PM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

>=20
>=20When rtw_usb_tx_agg_skb() has more than one frame queued, it copies t=
hem
> into a new buffer. That buffer was also handed to mac80211, as one
> additional TX completion.
>=20
>=20Report TX status only for the original frames, and free the aggregate
> buffer without passing it to mac80211.
>=20
>=20Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
