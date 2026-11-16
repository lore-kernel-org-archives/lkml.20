Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795288;
	b=FyD+OMt7ZxAXchwmlhr5h92bmsu+6jGlSIqa10EECUWVaezBjycv7Mto+foaIHrWYE+v
	 zof2nTvK9CE783rUDvo2X0Hea65QD3J6x5bR4/VQJQuSEPeZs2TtmaBjZ2UY1ZmS93YTA
	 pEryd1Vomea1hGzZw9PswXZUi/FuQ/qNxxbUrGHACPokp7cpOJ0dGT3XRNmIMfpjdpGWD
	 P+iz/JUfK3TehRtg1Q1yt5OJf2Q9XjAlRvXSL6GcsGB2vaTvBXaU/0Y+wkCDhgoBrL7LS
	 Kpe9sOqah8JUI8doEVm1LPgO+piUpTGALdBFPSsBQFjl/yZPX/iMGWgVFWaBHPtFFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795288;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=864FAA6YweKAzn6YTHxoTvwaGejxMEO7rBi0aHeqezk=;
	b=YfLlAC1CtBtj9L5T3E7gUrO1Blyo60u5S/waPQdWxF3xI5Uk+854194UGWJZUNJhp0+e
	 HuNga6uls1qnE+aDgfsowouW6Yh1/b4P+icK4SsOoSSUpq/rfez9rdicop5X546bdQ7In
	 /3i+nj4TwyyrT+sv7w1kOmNLsIX0NdrljEUawkIjYovefpvbTHMmEeOIGil8UWnBdZXp9
	 5ikTaotoH2/ipb03AeaikEl6jnaF2RRA1S8REtsXkdy/kpVchuoWlpq548i0iTM7rHak9
	 pzfxcs78u1Mn9A1jyaKRzABbhsjkDwcGtpEvp9wuSdamcyq43O1fOhxcye6FooIRYqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SK14jKxO;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44040606A31C;
	Mon, 16 Nov 2026 02:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44040606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SK14jKxO
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG2Eb5mA2947241, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794795278; bh=864FAA6YweKAzn6YTHxoTvwaGejxMEO7rBi0aHeqezk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SK14jKxORCRku2AGcmZrmv+TAOgrXa1dxENsD4EfAlPNud2Ff40IfOUkf6SZ6sD/J
	 cy7X4WHGa2yCG4wUtr/TOZcmcmouLg13zI4lPQ+Xhdx+hO9qajiCe6gX7rzeucFqJB
	 hlJpFB6tkkHkURjs5MiZAr608mdcsgVt2YyeG5k5g8QAvcEmaZEsa1zw3gMtnvpc0d
	 +b1Aj/GR/eaZG62jso7rrA2uJWJzuDAZ/XOYduy6Bsnf//V0z/KjLVXt0ijhgCkERk
	 BtlBcC5mFpjRgDSFe8hgfje2hkOZQ3C9i+aAHKEDDNcoRooPfJu5l4ai0Y/wki7dcv
	 3DbaPG5Coq5VA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG2Eb5mA2947241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 10:14:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 10:14:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 10:14:36 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 07/10] wifi: rtw89: send injected control
 frames through the management path
Thread-Topic: [PATCH rtw-next v5 07/10] wifi: rtw89: send injected control
 frames through the management path
Thread-Index: AQHdc8qmfuHwz0gXRk62fz2izryq2bcv9R/Q
Date: Mon, 16 Nov 2026 02:14:36 +0000
Message-ID: <0a32e2d1a6d745a88f1a814c5bf145cc@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-8-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-8-owner@ph4ntom-rev.uz>
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
> rtw89_core_get_tx_type() classifies every frame that is neither a
> management nor a null-data frame as data. Injected control frames
> such as a 10-byte ACK or 16-byte RTS therefore go through
> rtw89_core_tx_update_data_info(), which derives a TID and data queue
> from skb->priority and enables AMPDU/QoS related descriptor fields
> that make no sense for them.

Original design is only to send urgent packets via MGMT queue, and
I think no control frame sent vi driver. Instead, firmware/hardware
will sent them.

Did you encounter real problem if CTS/RST goes via AC queue?
I just don't want much conditions in data path.

>=20
> Classify injected non-data frames as management frames. Frames
> generated by mac80211 itself, such as BlockAckReq, are not affected.

Did you actually see driver sends control frames generated by mac80211?
If so, when and how?

>=20
> In addition, rtw89_core_tx_update_desc_info() reads hdr->seq_ctrl at
> offset 22 for every frame. Control frames have no sequence control
> field and are shorter than 24 bytes, so only read hdr->seq_ctrl from
> non-control frames whose linear header is long enough to carry it.

I think all control frames have no sequence control, just fill seq=3D0
for them?

>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 54605f7..7003c24 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -637,12 +637,21 @@ static enum rtw89_core_tx_type
>  rtw89_core_get_tx_type(struct rtw89_dev *rtwdev,
>                        struct sk_buff *skb)
>  {
> +       struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(skb);
>         struct ieee80211_hdr *hdr =3D (void *)skb->data;
>         __le16 fc =3D hdr->frame_control;
>=20
>         if (ieee80211_is_mgmt(fc) || ieee80211_is_any_nullfunc(fc))
>                 return RTW89_CORE_TX_TYPE_MGMT;
>=20
> +       /* Injected control frames have no QoS/TID and no data payload, s=
o
> +        * send them through the management path. Control frames built by
> +        * mac80211 itself (e.g. BlockAckReq) keep using the data path.
> +        */

The code self-explain it is injection, no need comment.

But I still wonder this is required? Any problem without this?

> +       if (unlikely(info->flags & IEEE80211_TX_CTL_INJECTED) &&
> +           !ieee80211_is_data(fc))
> +               return RTW89_CORE_TX_TYPE_MGMT;
> +
>         return RTW89_CORE_TX_TYPE_DATA;
>  }
>=20
> @@ -1299,7 +1308,7 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rt=
wdev,
>         enum btc_pkt_type pkt_type;
>         bool upd_wlan_hdr =3D false;
>         bool is_bmc;
> -       u16 seq;
> +       u16 seq =3D 0;
>=20
>         desc_info->pkt_size =3D skb->len;
>=20
> @@ -1315,7 +1324,10 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *r=
twdev,
>         else if (tx_req->vif)
>                 desc_info->mlo =3D ieee80211_vif_is_mld(tx_req->vif);
>=20
> -       seq =3D (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
> +       /* control frames (e.g. 10-byte ACK/CTS) have no sequence control=
 */
> +       if (!ieee80211_is_ctl(hdr->frame_control) &&
> +           skb_headlen(skb) >=3D sizeof(struct ieee80211_hdr_3addr))
> +               seq =3D (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ)=
 >> 4;

If my thought is correct, here can just

	if (ieee80211_is_ctl(hdr->frame_control))
		seq =3D 0;
	else
		seq =3D (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;

>         addr_cam =3D rtw89_get_addr_cam_of(tx_req->rtwvif_link,
>                                          tx_req->rtwsta_link);
>         if (addr_cam->valid && desc_info->mlo)
> --
> 2.56.0.windows.4
>=20

