Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816270;
	b=lDvquvgGvUWfL+cEjow+mC3gBSxSwONQ3EDE+AJQOml7lhEagBT6SqGEumIs5xhj65QC
	 Ag469ZAqVQ9giXUW1FHM7I3J8YxByE5OyhgTkahCUZUOnDnPeEhyIBpuLjPNaFaUzdZ0R
	 61orVrEqYTyqmABhOrN87Nuyngy8gqE5DAb3cMkP2KkQ1WjI5/uEOVlbwnGrbZ2GHxXv1
	 9OVtN/uvuKTuLhF/rkO6oGkz4CI1sifjM1tdnWPGnbnuKGDI0TqfitIA71qSrVyTTMhPE
	 R+cKsYh6GgzHPdgdvoxjDzuYyX8uz6UPm0Pd7nbahTujNxFfsWHNwe8Vlh6oD62ZAsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816270;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=G8pmM3gxjKjpm+02Wdq+NqXN+xecKR+TNl0hK4Vnze8=;
	b=z3EpqM4cFx7aOQI/IKWBZNHtDnn3cUiqeQs/e0fu8LuK4rOuplsjDJOQ2k3bvINDc1eA
	 n+3GQH2fARY7l8eViSEshBnfQhnQJFtMnJRdM8S1U2dcciD2qfAUsZO20deTNSBhBIJn6
	 4F6Vd4AaKTN2c0jfRJOd8nQnm0IxvGbfQAMB0O28HySBX6hYieUtMP06ls4n2QxG+WWom
	 EPszcNJE4neQ694zm2npZHTG65czg0w9ThWxFgVlVcBudDq00dfw+aPB4HCoszznl0G8E
	 RGHu0hQ7khbZo1IuOgRZcm+dDT1Se8O3nlm4tA7qCNqmoZStfEV46FWtT5jk6CyLhfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=pXTtTy5T;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C1606A32A;
	Mon, 16 Nov 2026 08:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754C1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=pXTtTy5T
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG84OtcC3236066, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794816264; bh=G8pmM3gxjKjpm+02Wdq+NqXN+xecKR+TNl0hK4Vnze8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=pXTtTy5TWoH2TW7Fnjx/86UrPVyEh6DzlAtzg5GSDrRLIJ4HwPXLqdisRtm2rMsII
	 raJdv2KgdZsBWp2l/zCnlpq/By1yD2Gt986viMDew6eEIj+P3UGClyHeL1YBo5pYcQ
	 /uUcigRuGXiL+cXD1JAVOk9vGfI/3M48mtuV1976w3oXC6HhJKuNQTrIFxx33rpwNB
	 GXmwW3JKyAvNrRZnyV9rSKjyhVwlGXC9AYL7teGMYa1/3yD3VmoTkVycBsKSrwIEps
	 GvbvbVJDDXQQOaVAH+WAgAn5EFyPn6i7L/TAOBWvli2VnRsVtQxav9tMXwrem7Spv0
	 dQTfEPXJ2lSHw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG84OtcC3236066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 16:04:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 16:04:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 16:04:22 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zhao Li <enderaoelyther@gmail.com>
CC: Bernie Huang <phhuang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: update PN state only from correctly
 decrypted frames
Thread-Topic: [PATCH] wifi: rtw89: update PN state only from correctly
 decrypted frames
Thread-Index: AQHddSbhzzSjuCVzmU+SpIqpEQhOrrcwVydA
Date: Mon, 16 Nov 2026 08:04:21 +0000
Message-ID: <9b6df144207a4427bc63959a064f6a22@realtek.com>
References: <20261115172754.35124-1-enderaoelyther@gmail.com>
In-Reply-To: <20261115172754.35124-1-enderaoelyther@gmail.com>
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

Zhao Li <enderaoelyther@gmail.com> wrote:
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 58ee5efc3b5e..a173253d51ff 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -3950,7 +3950,8 @@ static bool rtw89_core_skb_pn_valid(struct rtw89_de=
v *rtwdev,
>         if (!ieee80211_is_data_qos(hdr->frame_control))
>                 return true;
>=20
> -       if (!desc_info->hw_dec || !desc_info->addr1_match)
> +       if (!desc_info->hw_dec || desc_info->sw_dec || desc_info->icv_err=
 ||
> +           desc_info->crc32_err || !desc_info->addr1_match)

This patch is OK to me, but can you keep existing two conditions unchanged?
Just add three new conditions.=20

Or any reason you want move addr1_match to be the last one?

>                 return true;
>=20
>         guard(rcu)();
>=20
> base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
> --
> 2.56.1

