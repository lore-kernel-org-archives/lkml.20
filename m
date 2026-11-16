Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798026;
	b=CKaGysUJ4dj2n4bccaRQqcVUoqLTrxX/ST7Jt4LdpLmxWCRkrCyZlQZMtkbNDdf2m+g1
	 465udpHG2n5LXTJhMNJgYGWzLxXo4OHRmRtrX66XtHoj0Q0n10EQvuD6p77fK7b8B45a2
	 AyYGtq/G0BQgp90MqSJo3ydKz1mGN0EYJCeOp34O4u1CPAduGrdU7ikk1bvltwuX22RYt
	 Uh2FIv5URCmj4t0eAykAIzSxHnaKhCBtkWfTh6FC0iWUlBarBYyJD0d9gEODsmS2WeQpb
	 yCCSZGhgXtlVR191uFWN7SycQYziSzTnXWoFVuYgf7NQfGmM81CbyLSdZ2WCIm5xJ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798026;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OJq+NoU9z85sOsy2AIfVpakEqi16h5aVjBNylrJZYBs=;
	b=Z0ACXMgtpuRGbwOFk/k8Ub0+4ln27uO5dDpUFoArqAuVc0zn7C7cyrcL7wVXYQyHpok+
	 AFXFpT09laiIxVnmWbgJhKvdoJvgSk2EdsNNL0Ym4NzOY9dXcirE1o4j4uKuHY7iG0Qja
	 via27mV5cAnJWHOHtGLscfRuwklzP9CdIdH87jQoNl5qOEHL2tZY1yKqoAFJv76i26NlK
	 MT3Hwpj2MyxRm2L/8mbDYNFYK9qMl/7ffsfxlbNTB9Y+tQucNwzXNcum9SPUNTv0JnXke
	 2DPqsAOS0uiKy00u6Hbx+YG7rrSqBIo0QdMoAY0Hv9FlQD1kF5KSNLhllBeXODL2otQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aHu5UEaS;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64BD606A321;
	Mon, 16 Nov 2026 03:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aHu5UEaS
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG30C5D02999701, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794798012; bh=OJq+NoU9z85sOsy2AIfVpakEqi16h5aVjBNylrJZYBs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=aHu5UEaSm4cxvLyatXtCwRsAHDEWR9kzC7MkWKjaGYJLUvGQTePWwgiBTEV7auQss
	 dBHdgtCQF/+rKJh81uRMNKWIlBCe2ahRsNgQDJqeKjLU6TtmNLul2LcXazjSJ80C57
	 oRpnaCZa8E2Imp47tHrRyighKZyECKkB8nTYiziErYrWjJscGEDTuIcNmTCyipnoua
	 0EMPnXBQuNBQPZ9FphIIBgpfTBcQI6y6+CRIsX0qgKJyXKEHIsNxoBLiTmynmnLhuh
	 lxod10V+p5m4/WiRZ6Pzv46LePgyPaS327FgSSkVinvVQjfAGTP4qdkNpcqTvLJ9IG
	 E7VYOOa2SsGhg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG30C5D02999701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 11:00:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 11:00:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 11:00:10 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 09/10] wifi: rtw89: honor ASSIGN_SEQ, retries,
 and NO_ACK for injected frames
Thread-Topic: [PATCH rtw-next v5 09/10] wifi: rtw89: honor ASSIGN_SEQ,
 retries, and NO_ACK for injected frames
Thread-Index: AQHdc9EKoDHkogFGDkeY+qoS8pIb/Lcv+2WA
Date: Mon, 16 Nov 2026 03:00:10 +0000
Message-ID: <a56a85ff19dc4bd29cb3c81cb7e0c77a@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-10-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-10-owner@ph4ntom-rev.uz>
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
> For injected frames, rtw89_core_tx_update_injection() only applies
> the radiotap rate and leaves several TX descriptor and completion
> settings mismatched with the radiotap flags:
>=20
> - The management path sets hw_ssn_sel/hw_seq_mode (and MLO links set
>   upd_wlan_hdr), overwriting user-supplied sequence numbers when
>   IEEE80211_TX_CTL_ASSIGN_SEQ is not set, and leaving hw_seq_mode
>   enabled even on injected control frames that have no seq_ctrl field.
>   Conversely, injected data frames leave hw_seq_mode unset when
>   ASSIGN_SEQ is requested on a monitor interface.
> - Unicast frames unconditionally set RTS_EN =3D 1 and HW_RTS_EN =3D 1 in
>   txwd_info4. On normal traffic HW_RTS_EN =3D 1 gates RTS on the MAC
>   length/duration threshold (4080B / 2816us), whereas for injected
>   frames RTS_EN must follow IEEE80211_TX_RC_USE_RTS_CTS with
>   HW_RTS_EN =3D 0 so short frames requesting RTS/CTS actually emit RTS.

No need to describe driver behavior.=20

> - IEEE80211_TX_CTL_NO_ACK (e.g. IEEE80211_RADIOTAP_F_TX_NOACK) neither
>   sets BE_TXD_BODY6_NO_ACK on Wi-Fi 7 descriptors nor bounds retries,
>   causing unacknowledged frames to be retransmitted up to the retry
>   limit. Note that Wi-Fi 6 TXWD v0 chips (RTL8852A/B, RTL8851B) have
>   no dedicated per-packet NO_ACK descriptor bit and rely on
>   tx_cnt_lmt =3D 1 to suppress retransmissions; when that single attempt
>   completes with RTW89_TX_RETRY_LIMIT, suppress false tx_retry_lmt
>   accounting in rtw89_pci_tx_status() and set
>   IEEE80211_TX_STAT_NOACK_TRANSMITTED in rtw89_tx_rpt_tx_status() too.
> - hw->max_rate_tries is left at the mac80211 default (4), truncating
>   IEEE80211_RADIOTAP_DATA_RETRIES, and info->control.rates[0].count is
>   ignored when a radiotap rate is specified.
> - Positive radiotap HT/VHT/legacy rate indices are added to the table
>   base without clamping to the chip's valid MCS or legacy rate bounds.
>=20
> Configure hardware sequence assignment according to
> IEEE80211_TX_CTL_ASSIGN_SEQ (and never on control frames), drive
> rts_en and hw_rts_en for radiotap RTS/CTS, advertise
> RTW89_TX_DATA_CNT_LMT_MAX (63) in hw->max_rate_tries, honor
> rates[0].count and NO_ACK descriptor/status semantics, and clamp
> positive radiotap rate indices to valid hardware ranges.
>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c | 63 ++++++++++++++++++-----
>  drivers/net/wireless/realtek/rtw89/core.h |  4 ++
>  drivers/net/wireless/realtek/rtw89/mac.h  |  2 +
>  drivers/net/wireless/realtek/rtw89/pci.c  |  3 +-
>  4 files changed, 58 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 84c12c6..7d174d2 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -1252,12 +1252,43 @@ static void rtw89_core_tx_update_injection(struct=
 rtw89_dev *rtwdev,
>         const struct rtw89_hw_rate_def *hw_rate =3D &rtw89_hw_rate[rtwdev=
->chip->chip_gen];
>         enum mac80211_rate_control_flags flags =3D info->control.rates[0]=
.flags;
>         struct rtw89_tx_desc_info *desc_info =3D &tx_req->desc_info;
> +       struct ieee80211_hdr *hdr =3D (void *)tx_req->skb->data;
>         const struct rtw89_chan *chan;
>         s8 idx =3D info->control.rates[0].idx;
> -       u8 nss, mcs;
> +       u8 nss, mcs, max_mcs;
>=20
>         desc_info->use_rate =3D true;
>         desc_info->dis_data_fb =3D true;
> +       desc_info->hw_rts_en =3D false;
> +       desc_info->rts_en =3D (flags & IEEE80211_TX_RC_USE_RTS_CTS) &&
> +                           !desc_info->is_bmc &&
> +                           !(info->flags & IEEE80211_TX_CTL_NO_ACK);
> +
> +       /* Control frames have no seq_ctrl field; otherwise keep the
> +        * sequence number supplied by user space unless ASSIGN_SEQ is se=
t.
> +        */
> +       if (!(info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ) ||
> +           ieee80211_is_ctl(hdr->frame_control)) {
> +               desc_info->upd_wlan_hdr =3D false;

Does it need to update this?

> +               desc_info->hw_ssn_sel =3D 0;
> +               desc_info->hw_seq_mode =3D 0;
> +       } else {
> +               desc_info->hw_ssn_sel =3D RTW89_MGMT_HW_SSN_SEL;
> +               desc_info->hw_seq_mode =3D RTW89_MGMT_HW_SEQ_MODE;

This is only for MGMT frames. If you inject QoS data frames, the sequence
number should count per TID. But for injection it seems not build BA seesio=
n
, so this is harmless.


> +       }
> +
> +       /* Suppress hardware retransmissions (and ACK waiting on BE) for =
NO_ACK;
> +        * otherwise honor explicit radiotap retry limits when a rate is =
set.
> +        */

First line of block comment should be empty.=20

But this comment is not necessary. The code explains itself.

> +       if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
> +               desc_info->no_ack =3D true;
> +               desc_info->tx_cnt_lmt_en =3D true;
> +               desc_info->tx_cnt_lmt =3D 1;
> +       } else if (info->control.rates[0].count) {
> +               desc_info->tx_cnt_lmt_en =3D true;
> +               desc_info->tx_cnt_lmt =3D umin(info->control.rates[0].cou=
nt,
> +                                            RTW89_TX_DATA_CNT_LMT_MAX);

You have set=20
   hw->max_rate_tries =3D RTW89_TX_DATA_CNT_LMT_MAX;

Is it still necessary to have umin()?


> +       }
>=20
>         /* No rate was given in the radiotap header. Management frames
>          * already carry the rate from rtw89_core_tx_update_mgmt_info(), =
so
> @@ -1283,16 +1314,20 @@ static void rtw89_core_tx_update_injection(struct=
 rtw89_dev *rtwdev,
>                 desc_info->gi_ltf =3D 1;
>=20
>         if (flags & IEEE80211_TX_RC_VHT_MCS) {
> +               max_mcs =3D rtwdev->chip->chip_gen =3D=3D RTW89_CHIP_BE ?=
 11 : 9;

I think the maximum standard VHT MCS rate is 9. Just use 9 inline.

>                 nss =3D umin(idx >> 4, ARRAY_SIZE(hw_rate->vht) - 1);
> -               mcs =3D idx & 0xf;
> +               mcs =3D umin(idx & 0xf, max_mcs);
>                 desc_info->data_rate =3D hw_rate->vht[nss] + mcs;
>         } else if (flags & IEEE80211_TX_RC_MCS) {
> -               desc_info->data_rate =3D hw_rate->ht + idx;
> +               desc_info->data_rate =3D hw_rate->ht + umin(idx, 31);
>         } else {
>                 chan =3D rtw89_chan_get(rtwdev, tx_req->rtwvif_link->chan=
ctx_idx);
> -
> -               desc_info->data_rate =3D idx + (chan->band_type =3D=3D RT=
W89_BAND_2G ?
> -                                             RTW89_HW_RATE_CCK1 : RTW89_=
HW_RATE_OFDM6);
> +               if (chan->band_type =3D=3D RTW89_BAND_2G)
> +                       desc_info->data_rate =3D RTW89_HW_RATE_CCK1 +
> +                                              umin(idx, 11);
> +               else
> +                       desc_info->data_rate =3D RTW89_HW_RATE_OFDM6 +
> +                                              umin(idx, 7);
>         }
>  }
>=20

[...]


> diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wirel=
ess/realtek/rtw89/pci.c
> index 6d19e75..6c4d6c0 100644
> --- a/drivers/net/wireless/realtek/rtw89/pci.c
> +++ b/drivers/net/wireless/realtek/rtw89/pci.c
> @@ -475,7 +475,8 @@ static void rtw89_pci_tx_status(struct rtw89_dev *rtw=
dev,
>         if (tx_status =3D=3D RTW89_TX_DONE) {
>                 info->flags |=3D IEEE80211_TX_STAT_ACK;
>                 tx_ring->tx_acked++;
> -       } else {
> +       } else if (!(info->flags & IEEE80211_TX_CTL_NO_ACK) ||
> +                  tx_status !=3D RTW89_TX_RETRY_LIMIT) {

Will it be a problem without this change?
This branch is only to sum internal counters of the driver.=20

>                 if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS)
>                         rtw89_debug(rtwdev, RTW89_DBG_FW,
>                                     "failed to TX of status %x\n", tx_sta=
tus);
> --
> 2.56.0.windows.4

