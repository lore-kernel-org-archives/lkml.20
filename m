Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794188702;
	b=atYZCNBYSMkKZbD6vz9H1i88v7wKGbcisB2iqWi07XtXu6F++b7HTuFxFS9bChq0lV6C
	 TLJGOawefGmjQ2SZNxuCROHERzvT6HJgQv7ivAFGxfgk1nii6+t9N6AkkPteFEOZ7HJxm
	 pOq0ArdToNJOmlsKa/4fH5L9iyFdn+0rxDdmQh7AE9wrAHw/GuzGrxj/VXLy8UWlBUBUk
	 +JndPz6W0xg2Byzv6WKytbX2GPjBLRCOLbFvK/OxCJ9GCsDMWk57adB13+2dDmZBHqoa7
	 uWw7l5NRsiS7NIq8my85ZXFaJAKntxiQ8nnT3z5g64a0tCniRPXd5oLAnvPZxAV/4Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794188702;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4mItYuat9G2EvtLzqP0BDGrCMfaF2naDoK7jgEQ7BqQ=;
	b=hN2hD+S8wSV1lY+brhbbdVZ5MAhVxA7d9KCHdzNU3aUfATjx7EeNvT0fnk9yCadyzoq6
	 LBA/0yiGQ0BbvA+0taXdkttls2Vka6HKejP2jZATLmfnshk8AcI4TSpiMi9CgFaouJ5Rb
	 NAlV32bgtv3x4LvgO2/vSqJirN6GYpdUNbBopySthv4kH9mqPo7Mia1oP4zE3A7mc8jL4
	 wIb9en+SajRJmlZS+6iUwX23ty82a/Yh7JCyJzi6xq7+2VrEkQp8N0kBfe+TRE7w1srJn
	 PaaCtQdIigcE67DxaSiPI4W9gSt5tNQwjYHKnDlp9Bcet9ikThzj3zLlhXgZ0j41Dxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=hMPI7QCz;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BBD606A322;
	Mon,  9 Nov 2026 01:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85BBD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=hMPI7QCz
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A91inxgF3877161, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794188689; bh=4mItYuat9G2EvtLzqP0BDGrCMfaF2naDoK7jgEQ7BqQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=hMPI7QCzSiZYgiEPeA0VlV6nJNZnPQsyssDzIZ5BNI027BYAmkJxfFDlQC5GV/yKI
	 LvqmCxZNbuqx2J5bibok4JWSnbeTr1f3CaDtJWwsX7ohaAlC9wId1jC34ynxkSA3gU
	 wKT/v27soow6nTHK5EzTEVln80RIGcHsba5X0krEvcdfFJv3N3metgrcyTAEdZ3KMG
	 eQsnEurJ4jH/pswRNgVtj2n/lUoqRsoMnOlN/pO/EzOpa103H9TYc5YZ59xPQqF12y
	 ssaOFOwRRRcVqlZLI14sY/TyLOCxeGWFSwBMYGVb9neaYf5E3XNnwgPFDvtYRvWg8/
	 5DcihLwyxAoKA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A91inxgF3877161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 09:44:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:44:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 09:44:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX
 aggregation
Thread-Topic: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX
 aggregation
Thread-Index: AQHda3lL9w2T8fKlSE2DNNuQSInmgLck79mg
Date: Mon, 9 Nov 2026 01:44:49 +0000
Message-ID: <e826d25ce74e4d839f2719509494c129@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-5-hjf3108@gmail.com>
In-Reply-To: <20261103095256.949327-5-hjf3108@gmail.com>
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

Ho Jie Feng <hjf3108@gmail.com> wrote:
> Allow RX aggregation of up to 48 pages of 128 bytes or 24 with two MACs.

You can describe a little bit how you build separate skb, especially
the last one.=20

>=20
> Test results (2.4 GHz):
>    before after
> TX 5.2    6.4
> RX 27.1   32.0
>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Acked-by is given, but some minor comments.

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

> +void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *s=
kb,
> +                             struct sk_buff_head *queue)
> +{
> +       struct rtl_priv *rtlpriv =3D rtl_priv(hw);
> +       unsigned int offset =3D 0, pkt_size;
> +       struct sk_buff *new_skb;
> +       __le32 *rxdesc;
> +
> +       while (skb->len - offset >=3D RTL_RX_DESC_SIZE) {
> +               rxdesc =3D (__le32 *)(skb->data + offset);
> +               pkt_size =3D RTL_RX_DESC_SIZE +
> +                          get_rx_desc_drv_info_size(rxdesc) *
> +                          RX_DRV_INFO_SIZE_UNIT +
> +                          get_rx_desc_shift(rxdesc) +
> +                          get_rx_desc_pkt_len(rxdesc);
> +
> +               if (get_rx_desc_pkt_len(rxdesc) =3D=3D 0 ||
> +                   pkt_size > skb->len - offset) {
> +                       rtl_dbg(rtlpriv, COMP_RECV, DBG_WARNING,
> +                               "bad frame at %u of %u, size %u\n",
> +                               offset, skb->len, pkt_size);
> +                       break;
> +               }
> +
> +               /* The last frame keeps the original skb. */
> +               if (ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN) >=3D skb->len -=
 offset) {
> +                       skb_pull(skb, offset);
> +                       skb_trim(skb, pkt_size);
> +                       __skb_queue_tail(queue, skb);
> +                       return;
> +               }
> +
> +               new_skb =3D dev_alloc_skb(pkt_size + RTL92DU_RX_HEADROOM)=
;

What is the purpose of RTL92DU_RX_HEADROOM ?

> +               if (!new_skb)
> +                       break;
> +               skb_reserve(new_skb, RTL92DU_RX_HEADROOM);
> +               skb_put_data(new_skb, rxdesc, pkt_size);
> +               __skb_queue_tail(queue, new_skb);
> +
> +               offset +=3D ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN);
> +       }
> +
> +       dev_kfree_skb_any(skb);
> +}
> +


