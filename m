Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795651;
	b=jCEXA3PxeFI3eQPSbymzJ2CP744NGEzOg7sqlzUktSHrJG7I5oGtgXewxGS0q8RTOTBy
	 wt5YUOe9/vlysJxfUuVe/HkyGhrSG3FDELqE4XWNDi7H9ORmVJmZLsRYo7nF9hqqvFVLo
	 Bv/wdp8+7qQ1lx2EYVzukvVyptQV6FVaGgk9D3KeK1vOw6vRtOgfC+NWEAw7kacsp6Vef
	 ZDtHrKzzC/FNoj+rhogCbP9toH44XoMg807L9CPoPqXitqIHeBJ/CSu32y4lPDeHzbS2s
	 5EAo1i+07UEsRWSyrd3zhEuwfs3+h0CYAwRoc8BqP9nI7r5OJMTtexjC33CwEwm3hgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795651;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Yu5wfLvEo2m1zglmmpHehCmVeDANNMLd7GBTNsOJmlM=;
	b=x2ZDkO4aeGI2it24W8VM0rZPuwY7CpaGtrkWXG0eC7fRx9F3K7/fDo/tUBLmrtmqXS1z
	 33leef4cTcfF1HVBmeClPG++zo35F7Ogng5rNkG3nM+gXohacgfJtTg4Jv8UXh2n93xPE
	 Qghg4cnBi5Tcd5OemhGtAg17i4MuVp/oPlPjEpkvdTBRD4pYcaphZVCVbrvKt2WPAAA+H
	 cwdEIK2wOaps3IYjxvE91tbQ5xabKSQHrd7z4hz/OEZWPN1qo2M8ErNOBVJCED5GqBRrH
	 vQFU4k1BYK4zVFbj2Ie1mjkCKNvWclvyHK7moEbbLQdKNlksoInFxNYOT1Vcr10QkPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=agWcaB13;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A4A606A31C;
	Mon, 16 Nov 2026 02:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=agWcaB13
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG2KilgE2951396, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794795644; bh=Yu5wfLvEo2m1zglmmpHehCmVeDANNMLd7GBTNsOJmlM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=agWcaB13HfB2wzwRPoxLZw63rCXhDuZpLyXvDZ5XQIQkCWC/PGArspMCTQRXyRrOo
	 d2TKGmW/VOnAZqY4iYG4Jtfw5z48EqGCirlZwLKn4/M4sQ7P4WUpg6t2/+Bzd/3kpZ
	 Vi1G5BHLCwdHalynNgNdDv3ydYFdsQvEzperSaZtvFZ6mB8Yh2yrR2SKTqyPD+pit6
	 LDSYGHp1aaRxCZIeh3/CBCHESQA5bcBqeJLhEb5dZy6FEGQVn7nCTKLwQT312b8AlG
	 W5y+rtej5puLVRtb8SSM4p+mtUfI/tQIdGTIOz6K/XpN3rjLN8mRbw/gyzeTIKCyom
	 NUy5wWtxXM+Eg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG2KilgE2951396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 10:20:44 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 10:20:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 10:20:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 10:20:40 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 08/10] wifi: rtw89: skip host-side TX hooks
 for injected frames
Thread-Topic: [PATCH rtw-next v5 08/10] wifi: rtw89: skip host-side TX hooks
 for injected frames
Thread-Index: AQHdc8qmn0XT5xN44UOv5dy82T3xC7cv+VDg
Date: Mon, 16 Nov 2026 02:20:40 +0000
Message-ID: <6d14ce5428da43378c19fa56c1755c6e@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-9-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-9-owner@ph4ntom-rev.uz>
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
> Several TX hooks assume frames that were built by the local network
> stack for an associated link:
>=20
> - rtw89_traffic_stats_accu() and rtw89_core_tx_btc_spec_pkt_notify()
>   inspect ip_hdr()/udp_hdr(). For frames injected on a monitor
>   interface the network header points into the 802.11 header, so
>   traffic statistics and BT-coexistence notifications are derived
>   from unrelated bytes.
> - rtw89_wow_parse_akm() records the AKM from (Re)Association Request
>   frames for WoWLAN, which an injected frame must not change.
> - rtw89_core_tx_update_he_qos_htc(), rtw89_core_tx_update_ampdu_info(),
>   and rtw89_core_txq_check_agg() mutate QoS/HTC headers, enable A-MPDU
>   aggregation, or start/stop BA sessions based on link state, while
>   injected frames are expected to be sent as supplied.

If these are harmless to inject in single one monitor interface.
I prefer not applying these changes.=20


