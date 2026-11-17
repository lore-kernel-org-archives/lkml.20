Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882299;
	b=O+8yTDMNut8uVdrVtr9nWAyZkDR86eDr7K9ulMFt9/z1Sz0IPS/LdH9yF+D9PX7VpAIo
	 v0+T3is7CuPNIqC8ih3yeknXGCVWTkjfj0Uikr4DZErQjxd9mKZyn+Te/+eB45XmuJWt1
	 mZKPbvG/1+Q11sNeo0MQf1XKYM6xb36jy7o5fMTZXd9cWVDyMAPZ2eLWWEAi7U9B7jT5H
	 D+sCiDkKPNxfPWs3Iia3QN0XHH0j9wk/hzL3YWQ6Cj44laodBhlp7uIkJ4uM8EcvEBwKc
	 FgAPkl86C5QV/DUeDtcDnMG2wDgmEfCk+59cPvRK3P/hTxClLWgyRekjoW+JakfzBbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882299;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YDqpCHTn0q6DhFz2Cdh099yCCFfP57cBHjlzhDZo968=;
	b=oI2Gqcz8W+uSra55H5m1YRFvBaWhOw1G/DsQoQgk1Oa0HwCjfYF1oLSTyH5OEKGM1jaO
	 AyvjO+fBKzX4y9KvYV/EyOr3UPTNp2XjJuXwoWWr36bEdoaQZbsk0EaWuMgrVsXwnkDTY
	 yM0nmBsDAtC7bGznrSdZM28+bc9w12CPqbXdd2jTrpYFjAyh/hlxbZX5InFtMvTxuE3qS
	 k79SF/B7+R9uLZJwzBfnzXhNwY42fK3jx3ocIG702j4F/3TTcAcceOKQOsXf/Gu3J1DTn
	 cc434nhLO6J/i01CdK+fbPNw+zxaMX+9bPdfhi83c2TM6EtZJuMbPwY+mg/7frcTyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ZTZkJXzq;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20789606A31C;
	Tue, 17 Nov 2026 02:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20789606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ZTZkJXzq
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH2Ot2wA3982620, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794882295; bh=YDqpCHTn0q6DhFz2Cdh099yCCFfP57cBHjlzhDZo968=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ZTZkJXzqS0NCemb6nA8DX1q9CgqL+26kB4ikCHNaYO52CgIfZZWNs89TtHIBlFbFr
	 doYpca5pq2zIQG0hL+oFX5dbwAGxzecLpsGpaLvWQ9UIbwwbcSfhKMjFnEdk5UxIx3
	 5DDf0xgBc2PNKs6TZem+CQbssJrm/BOG5AtkBHJS3GaUKt/MqdIDul02EoyyoaaGGM
	 FTKDhGcPEVRMQBN8HhhuE8fBCUKDUGIS/NinjTA2Z2Kf09r1erLMeMV5eXMj4OtXcX
	 0TDzJcy3vMNoQy/zZktzyo65YUQlyg7Ai744SjpATVoMsVuyjV2+S2s8PYk55qFtek
	 HytXrA0pkz1qw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH2Ot2wA3982620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 10:24:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:24:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:24:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 10:24:54 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rishik Yechuri <epicrishik@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rishik Yechuri
	<rishik.yechuri.code@gmail.com>
Subject: RE: [PATCH rtw-next 2/6] wifi: rtlwifi: use struct ieee80211_hdr for
 the reserved page headers
Thread-Topic: [PATCH rtw-next 2/6] wifi: rtlwifi: use struct ieee80211_hdr for
 the reserved page headers
Thread-Index: AQHdcUN+W/T/Kxmk/02kkkSArehDercxkm8A
Date: Tue, 17 Nov 2026 02:24:54 +0000
Message-ID: <75f8e871e5be4b568ada3f6e4f88e662@realtek.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
 <20261110184409.42205-3-rishik.yechuri.code@gmail.com>
In-Reply-To: <20261110184409.42205-3-rishik.yechuri.code@gmail.com>
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

Rishik Yechuri <epicrishik@gmail.com> wrote:
> The reserved page builders also patch the addresses of the beacon, null
> data, probe response, QoS null data, BT QoS null data and ARP response
> templates with SET_80211_HDR_ADDRESS1(), SET_80211_HDR_ADDRESS2() and
> SET_80211_HDR_ADDRESS3() from base.h. These add a hard coded byte
> offset to a u8 pointer and copy the six bytes one at a time through
> the CP_MACADDR() macro in wifi.h.
>=20
> struct ieee80211_hdr from <linux/ieee80211.h> has the addr1, addr2 and
> addr3 members at the same offsets.=20

No need this sentence. It is obvious.=20
Please reword commit messages generated by LLM across whole patchset.

> Point at each template with that
> struct and copy the addresses with ether_addr_copy() on the members.
> Then remove the three macros, CP_MACADDR() and the FRAME_OFFSET_*
> constants, which have no other users.
>=20
> No functional change intended.
>=20
> Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
> Assisted-by: Claude:claude-fable-5-1

[...]

> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> index cda9388388ab..da9ef7cab2fb 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
> @@ -544,18 +544,18 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw =
*hw, bool b_dl_finished)
>         bool rtstatus;
>         u8 u1rsvdpageloc[5] =3D { 0 };
>         bool b_dlok =3D false;
> -       u8 *beacon;
> +       struct ieee80211_hdr *beacon;
>         struct ieee80211_pspoll *p_pspoll;
> -       u8 *nullfunc;
> -       u8 *p_probersp;
> +       struct ieee80211_hdr *nullfunc;
> +       struct ieee80211_hdr *p_probersp;

reverse x'mas tree


