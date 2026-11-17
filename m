Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898040;
	b=rJZdzRfQZCndbyaP+KVBUeX7336r8rr6EH1B4A9zCY9GmyG/9YoGFFNZ3lGjgmBxghz7
	 YpZNYu4OZ8nvpAOJ7VxW5GoPEZkWd7DlKvsbWty7vi9Y4XMIsCtwvJOuz/aufqs0XHm9p
	 8wOTPeAPBMJ8r0NGtI25UMVRZfU15O9b+RE4jyRjW8tPR+YN8barrC3ATrPeprpAu7mRy
	 8vMUufnzSZ26kfT8z1QhlBZhOTxQwxKMi5sGBUpW+SZb6Pb3MYv6NKQvj6IJ1aptdqk3o
	 4AyYOxGGgfNmb6N6RykgkTnEX2qHhzUTVVTdT6k3c2x53nN6drxBxNGJ9q9Jum+lmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898040;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=SjZwdUi2+vzTJt0BlsrxtW3jkOsZOF8BiKcLDHHuUIc=;
	b=EnwUWAbFOejVJ6NOPMzTJ9dXDdvPF+zplZms2G3AmiA4wjizOau3cjZLWF+hLMv862ip
	 Uozvsp6ykmOdXERln/fuv460M7Htc9xrIU5LZM1QIrWDuEp9OVHWTUrWAYxASJm1qD/QP
	 v/87dQ/Y8OJk68dG1JsmgYRJJFH5gyOTjudwLIGmSxfaU4tie2MEvXJDjrb2gjvnHrPbV
	 clORzj3vj69ppn+qGBhTEStrCKw2wNB1Z4MJ6gSc2gjGfgZ8reMIOY6Zaz3rKlZywMMGn
	 N3k+RW0D0iBP+xXqDrr+jABEq2QpxIO3Jk7aJXyYSztpDcK7qpb70siwKoBhCt2nVJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=S1VHbQy8;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B52606A31C;
	Tue, 17 Nov 2026 06:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=S1VHbQy8
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH6kqRpB4193591, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794898012; bh=SjZwdUi2+vzTJt0BlsrxtW3jkOsZOF8BiKcLDHHuUIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=S1VHbQy8oc1dmBalnZfKDEnCXLtGJlR0QjzZ9b6kboVk2D9FVfWALAEupk4hZx2dL
	 CNk3tPxPPxFiAMjAVeJ1sYrHeNqkxg3eZo62k9W319ArdMFAoMtK6M6Bs1WmzX/6MZ
	 Yqx28/FuxqfHTZBPtGQieaYnidiYmHiCkocmawTw2HpaG8k/K4FtFOr6I/Z+e0BxpG
	 R6RuXE/JQ7U75CFesDwl95p8V4cCYsGseEneB8zJkqemn1cUtaNHwdUjsBuLF7ms1G
	 KW84vczfIngd9iALFow+QHgq60jepLGrwT5Fk2so3+vhNXxKJ+fnmBO3MjagNINgXf
	 OgW1ApgyNqwpQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH6kqRpB4193591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:46:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:46:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:46:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 14:46:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Bitterblue Smith
	<rtl8821cerfe2@gmail.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, "Kalle
 Valo" <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, "Brian
 Norris" <briannorris@chromium.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next] wifi: rtw88: program the beacon interval
Thread-Topic: [PATCH rtw-next] wifi: rtw88: program the beacon interval
Thread-Index: AQHddZr0NDMPrqbT90uPvoV0GErFnbcx0uXw
Date: Tue, 17 Nov 2026 06:46:52 +0000
Message-ID: <3bd4a36de66948618d80e2e6d138aefb@realtek.com>
References: <20261116072022.1142783-1-mehmet.fide@gmail.com>
In-Reply-To: <20261116072022.1142783-1-mehmet.fide@gmail.com>
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

Mehmet Fide <mehmet.fide@gmail.com> wrote:=20
> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c
> b/drivers/net/wireless/realtek/rtw88/mac80211.c
> index 5e40cf06a9e3..5f411df5586e 100644
> --- a/drivers/net/wireless/realtek/rtw88/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
> @@ -432,6 +432,10 @@ static void rtw_ops_bss_info_changed(struct ieee8021=
1_hw *hw,
>         if (changed & BSS_CHANGED_BEACON_INT) {
>                 if (ieee80211_vif_type_p2p(vif) =3D=3D NL80211_IFTYPE_STA=
TION)
>                         coex_stat->wl_beacon_interval =3D conf->beacon_in=
t;
> +               else if (vif->type !=3D NL80211_IFTYPE_STATION &&

Please white list of vif.=20

As commit message, here should be vif->type =3D=3D NL80211_IFTYPE_AP.
The rtw88 can also support NL80211_IFTYPE_ADHOC, so you can add it as well
if you want.=20

> +                        rtwvif->port =3D=3D RTW_PORT_0)
> +                       rtw_write16(rtwdev, REG_MBSSID_BCN_SPACE,
> +                                   conf->beacon_int);
>         }
>=20
>         if (changed & BSS_CHANGED_BEACON) {


