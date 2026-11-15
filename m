Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715238;
	b=zouYdHoCORyPWqLxB8GCMdH6CXBUYfoLhU2YTg+Quegb3L51QnWu/cFQ9rHkkN6i0fFr
	 CqmWPi3Bxdcexy+kVre5a5QqBF+wdmFZFSFebu73FfuYBBuLzr7x4PJWK4zBQ0Ngm7Vg3
	 /plImAQJHJ8DsrZgHEiMBNiGnj+ndnlcZiN9BulIabdilAjwW+3Jj+yTY86pYrnBRq0Fj
	 q1UHH2aDvGWW89bQFLpugNKUUccuoupYyRbjwse5ITWQbJfgYDgaQb+FNRIV3ydHZKsXx
	 8KYxA1Q9nmzWTBgN9oECqBSFQYP04Nivllg/niwpZVoBMfgyuro84W9PA3ax/M6V9pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715238;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=sr4TE+zBIeg6HV1l24H9m0OXY5tB60cmXmFjwzmKetM=;
	b=bd9WGBWKNeXUMjqV1ypsJIESN1IHIDYUaIAJa2pNJm2Dqp4RTwMwPyxcBWQGnDy283/S
	 EdTbgj/rpLYSsccXZEX6cf8LSk2NvH2jIs1Xjb99J9JhjhYv7zV8sjQIPG2i7Tv+a/Ulh
	 rHuYSUPTZveLCAcTO4xb3OIa2vvoPqhEqIOm680+3vyvdXpArTfq4OWUUKbSv6wp1bDUJ
	 4tzd3/B5UA/W7kpEm5hCdviDL2n0Tq+jdqD6WOEghjYXK7SDnpKwriYk4Y/epe82RK9cq
	 p7DywF4JWtJf3cLOJSaYiUeNVYxiI4F6pU64aGart36Nnfh08K4o6eTSJ0yn509u/rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vHkXu2gF;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6DF606A327;
	Sun, 15 Nov 2026 04:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6DF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vHkXu2gF
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF40SHd82160052, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794715228; bh=sr4TE+zBIeg6HV1l24H9m0OXY5tB60cmXmFjwzmKetM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vHkXu2gFyVV2tp6ySwRp4sm+rWSX3n45Rk3iiL0h4hwNaTtSgMhVKPKoF1bu1VOvG
	 aB/x/07W+ZQok3EzXrEeiDJSNhIyLcY0aYn3R07Q1aqhd88G9BzGotEHYbnWpzUYij
	 azUMcN/p3QoeGbtDEoco+zB6kuqqnMJAusnJqi87pXXwqFON4PxOznxGDTjXGgOwXT
	 B6Z8sJcY2IkzK/1F8owZ5gZeM9jTXxjT+J28p1Q5KDzUK72gojjuX13uorOrpQwPqB
	 U2kDKLAGpcVipdf9zk8wyuEdJG+xTHfFisqNR7WQ7c9Tk9dUin9pbrBWzul5IPY7Nx
	 vWhqNq/0s2fjg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF40SHd82160052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 12:00:28 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 12:00:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 12:00:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 12:00:28 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 04/10] wifi: rtw89: protect
 pure_monitor_mode_vif with RCU
Thread-Topic: [PATCH rtw-next v5 04/10] wifi: rtw89: protect
 pure_monitor_mode_vif with RCU
Thread-Index: AQHdc8pjc1EkrMM5Z0STupfIgg6D0rcugZUA
Date: Sun, 15 Nov 2026 04:00:28 +0000
Message-ID: <ac552fa2a85d421eb5828f85366162f3@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-5-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-5-owner@ph4ntom-rev.uz>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> A following patch reads rtwdev->pure_monitor_mode_vif from
> rtw89_ops_tx(), which runs without the wiphy lock, while interface
> add/remove updates the pointer under the wiphy lock.

Did you actually have rtwdev->pure_monitor_mode_vif for the case
vif =3D=3D NULL?

For wlan0 + mon0 concurrency, there is no monitor vif, no?

>=20
> Annotate pure_monitor_mode_vif with __rcu, convert existing readers to
> rcu_access_pointer() and rcu_dereference_protected(), and recompute
> the pointer via rtw89_recalc_pure_monitor_vif() and
> rtw89_set_pure_monitor_vif().
>=20
> Whereas mac80211 only creates local->monitor_sdata while no other
> interface is open, a monitor interface opened with MONITOR_FLAG_ACTIVE
> is passed directly to drv_add_interface() even alongside an active
> station or AP interface. Walking rtwdev->rtwvifs_list ensures
> pure_monitor_mode_vif is published if and only if a single monitor
> interface is the sole active driver vif, and unpublishes it with
> synchronize_rcu() before its link, port, and MAC ID are released.
>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>

[..]

> @@ -241,8 +282,7 @@ static int rtw89_ops_add_interface(struct ieee80211_h=
w *hw,
>         if (ret)
>                 goto unset_link;
>=20
> -       rtwdev->pure_monitor_mode_vif =3D vif->type =3D=3D NL80211_IFTYPE=
_MONITOR ?
> -                                       rtwvif : NULL;
> +       rtw89_recalc_pure_monitor_vif(rtwdev, NULL, true);

I don't see the difference from this change. For virtual monitor mode, ther=
e
is one monitor vif at most.

>         rtw89_recalc_lps(rtwdev);
>         return 0;
>=20


