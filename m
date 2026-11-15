Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714506;
	b=QfMCoDsE3NqhYIO3sFiubyzgSZpjUzaW1WdU1kgTj0LVpM8Oneb8vAHyIctzx4lX2QjT
	 hPh6/WheB1Fz15+3KyCj8Madc+HtscgP1ZhdTI+eNJvb3jSjzTMiGUG1xkGPhiv+zIgZD
	 0ikB7eqcuqvPJ7D23/Vtz2bFIPfUBj2xJbtc1aywSZiiHA4LCTmMtWR1Q156n2zlCBW3I
	 VKe/P0YUqcVXkQ1+iVL+TnYFn3EfKrTZLdoo13PFnmqIMY993VMrX61ad+XrFzI9EmsEk
	 Oh4VXRdyNIqI0c38FxLRv347e9Oty/nG1XY7LbNTuj7dIat91u3mVgNwuMgHeNjbOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714506;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=a/Mrfr4ISwwE9/cPnl/X6Xi1B/jwM+RLsIX+oM4Qzjc=;
	b=Mos2me8Y5HllfEN3XWzLtNVlLmV1nGxW2/dUt7UssaCJ7dEY36Qe8k8Tl51fKEvP9vhN
	 644j/QYXcekrXm9unv1xiKXpop/Zv5XT4cxj9UWBTUfvMUPJ7RBUnpoXmuTEhnym/eApr
	 MkzJYe0oMz8ggLSMlgHQHo4zGpc1NHEWRZX1QBgVWKToZIUDsDQlEsgtURbKq3bPafOlS
	 7f0QUeyb7y+JUFh/7PXZ8HIe5QyXx+GA3pcsayeRNYQsPUk4TDBMh9+QeNR5foy4/3Fd8
	 7YAymxEWIzC7K9H6e9xczPOv9v3daEbHEsYKeLbN+itKtgg/BiJ263SUTyHy7BxWx7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="DMWxL86/";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F3606A323;
	Sun, 15 Nov 2026 03:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DMWxL86/
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF3mJyN52156102, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794714499; bh=a/Mrfr4ISwwE9/cPnl/X6Xi1B/jwM+RLsIX+oM4Qzjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=DMWxL86/94db//Neq/bk6gekZVNCA/9YKOUkLSpgD4D0iIXCC9yW8tqLb6DxSRK79
	 5OfspxacqKZFwKXCcNy5MWe0ouFuCMLcZ1mOTDkW/PzEVirguGXVx6XHEGftw2Hk0W
	 h7H6zVmD8B85ZZ9ZRCIDQRrSWXb3wsrtMm9vCStAZyShOUbur8RigPanrWj29SZeEz
	 ZePCOCcNYVq4YRGC5/9q89GS8dAbJY6kJvb6RmKPH0VAdqhIwKvZ21Z788RLmpbpyN
	 NR4mCiYMLYbm5Yt54z0a0kMERgm+qVqVzvtzcgaDoHgh2oQg35jsEL4Zr8GD4qy3mY
	 m4jDFTnwnLAGA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF3mJyN52156102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 11:48:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:48:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 11:48:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter
 configuration for monitor mode
Thread-Topic: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter
 configuration for monitor mode
Thread-Index: AQHdc8pMdgCLaTs82ESX+TiwL0Qf/bcufleg
Date: Sun, 15 Nov 2026 03:48:19 +0000
Message-ID: <0a6a486d052e43c0adfb7fc6445b2026@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-4-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-4-owner@ph4ntom-rev.uz>
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
> When entering monitor mode or enabling FIF_OTHER_BSS,
> rtw89_ops_configure_filter() updates B_AX_SNIFFER_MODE or clears
> B_AX_A_A1_MATCH in hal.rx_fltr, but leaves hardware target-address,
> multicast, address CAM, beacon check, and UID drop masks active unless
> specific FIF_* flags happen to toggle:

Please describe your purpose. For example, describe which kind of=20
packets you want to capture, but current settings misbehavior. Then,
I can ask internally to know if you patch is necessary or not.

>=20
> - B_AX_A_UC_CAM_MATCH and B_AX_A_BC_CAM_MATCH are only cleared when
>   FIF_PROBE_REQ changes, dropping unicast and broadcast frames from
>   arbitrary BSSs without a CAM entry in hardware.
> - B_AX_A_MC is only cleared when FIF_ALLMULTI is set, and
>   B_AX_A_MC_LIST_CAM_MATCH is never cleared, dropping multicast frames
>   when a monitor socket is opened without IFF_PROMISC.
> - B_AX_UID_FILTER_MASK is initialized in DEFAULT_AX_RX_FLTR and
>   DEFAULT_BE_RX_FLTR via mac->default_rx_fltr and is never cleared by
>   any FIF_* flag.
> - B_AX_A_A1_MATCH, B_AX_A_BC, and B_AX_A_BCN_CHK_EN must stay cleared
>   whenever B_AX_SNIFFER_MODE or FIF_OTHER_BSS is active, including
>   after rtw89_hw_scan_complete_cb(), rtw89_roc_end(), or MAC reinit
>   writes rtwdev->hal.rx_fltr back to R_AX_RX_FLTR_OPT /
>   R_BE_RX_FLTR_OPT.
> - FIF_CONTROL and FIF_PSPOLL are masked out of *new_flags even though
>   rx_fltr_init_ax() and rx_fltr_init_be() already forward control
>   frames to the host via R_AX_CTRL_FLTR / R_BE_CTRL_FLTR.
>=20
> Retain FIF_CONTROL and FIF_PSPOLL in *new_flags, record FIF_OTHER_BSS
> in hal.rx_fltr_other_bss so active monitor interfaces with
> MONITOR_FLAG_OTHER_BSS (and concurrent passive monitors) receive
> arbitrary-BSS frames without setting B_AX_SNIFFER_MODE, and add
> rtw89_mac_refine_rx_fltr() to clear the drop masks without mutating
> baseline rtwdev->hal.rx_fltr across mode transitions. The bit positions
> in R_AX_RX_FLTR_OPT and R_BE_RX_FLTR_OPT are identical.

Can you reword commit message generated by LLM? Just point the key
point. Reading lots of stuff spends my time.

>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.h     |  1 +
>  drivers/net/wireless/realtek/rtw89/mac.c      |  3 ++-
>  drivers/net/wireless/realtek/rtw89/mac.h      | 16 ++++++++++++++++
>  drivers/net/wireless/realtek/rtw89/mac80211.c |  5 ++++-
>  drivers/net/wireless/realtek/rtw89/mac_be.c   |  3 ++-
>  5 files changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wire=
less/realtek/rtw89/core.h
> index 7f84ee5..7be8810 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.h
> +++ b/drivers/net/wireless/realtek/rtw89/core.h
> @@ -6499,6 +6499,7 @@ struct rtw89_hal {
>         u8 cv;
>         u8 cid; /* enum rtw89_core_chip_cid */
>         u8 acv;
> +       bool rx_fltr_other_bss;
>         u16 aid; /* enum rtw89_core_chip_aid */
>         u32 antenna_tx;
>         u32 antenna_rx;
> diff --git a/drivers/net/wireless/realtek/rtw89/mac.c b/drivers/net/wirel=
ess/realtek/rtw89/mac.c
> index 41796bf..06fb263 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac.c
> @@ -2681,6 +2681,7 @@ void rtw89_mac_set_rx_fltr(struct rtw89_dev *rtwdev=
, u8 mac_idx, u32 rx_fltr)
>         u32 reg;
>         u32 val;
>=20
> +       rx_fltr =3D rtw89_mac_refine_rx_fltr(rtwdev, rx_fltr);
>         reg =3D rtw89_mac_reg_by_idx(rtwdev, mac->rx_fltr, mac_idx);
>=20
>         val =3D rtw89_read32(rtwdev, reg);
> @@ -2706,7 +2707,7 @@ static int rx_fltr_init_ax(struct rtw89_dev *rtwdev=
, u8 mac_idx)
>                 if (ret)
>                         return ret;
>         }
> -       mac_ftlr =3D rtwdev->hal.rx_fltr;
> +       mac_ftlr =3D rtw89_mac_refine_rx_fltr(rtwdev, rtwdev->hal.rx_fltr=
);
>         plcp_ftlr =3D B_AX_CCK_CRC_CHK | B_AX_CCK_SIG_CHK |
>                     B_AX_LSIG_PARITY_CHK_EN | B_AX_SIGA_CRC_CHK |
>                     B_AX_VHT_SU_SIGB_CRC_CHK | B_AX_VHT_MU_SIGB_CRC_CHK |
> diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wirel=
ess/realtek/rtw89/mac.h
> index db42e33..b4a7cb7 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac.h
> +++ b/drivers/net/wireless/realtek/rtw89/mac.h
> @@ -1494,6 +1494,22 @@ void rtw89_mac_set_edcca_mode_bands(struct rtw89_d=
ev *rtwdev, bool normal)
>         rtw89_mac_set_edcca_mode(rtwdev, RTW89_MAC_1, normal);
>  }
>=20
> +static inline u32 rtw89_mac_refine_rx_fltr(struct rtw89_dev *rtwdev,
> +                                          u32 rx_fltr)
> +{
> +       if ((rx_fltr & B_AX_SNIFFER_MODE) || rtwdev->hal.rx_fltr_other_bs=
s)

Can we just do additional in rtw89_ops_configure_filter() under the
condition
   rtwdev->hw->conf.flags & IEEE80211_CONF_MONITOR
?

> +               rx_fltr &=3D ~(B_AX_A_A1_MATCH |
> +                            B_AX_A_BC |
> +                            B_AX_A_MC |
> +                            B_AX_A_UC_CAM_MATCH |
> +                            B_AX_A_BC_CAM_MATCH |
> +                            B_AX_A_MC_LIST_CAM_MATCH |
> +                            B_AX_A_BCN_CHK_EN |
> +                            B_AX_UID_FILTER_MASK);
> +
> +       return rx_fltr;
> +}
> +
>  void rtw89_mac_set_rx_fltr(struct rtw89_dev *rtwdev, u8 mac_idx, u32 rx_=
fltr);
>  void rtw89_mac_update_rts_threshold(struct rtw89_dev *rtwdev);
>  void rtw89_mac_flush_txq(struct rtw89_dev *rtwdev, u32 queues, bool drop=
);
> diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c
> b/drivers/net/wireless/realtek/rtw89/mac80211.c
> index 5a12639..2a3adf0 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
> @@ -335,7 +335,10 @@ static void rtw89_ops_configure_filter(struct ieee80=
211_hw *hw,
>         rtw89_leave_ps_mode(rtwdev);
>=20
>         *new_flags &=3D FIF_ALLMULTI | FIF_OTHER_BSS | FIF_FCSFAIL |
> -                     FIF_BCN_PRBRESP_PROMISC | FIF_PROBE_REQ;
> +                     FIF_BCN_PRBRESP_PROMISC | FIF_PROBE_REQ |
> +                     FIF_CONTROL | FIF_PSPOLL;
> +
> +       rtwdev->hal.rx_fltr_other_bss =3D !!(*new_flags & FIF_OTHER_BSS);
>=20
>         if (changed_flags & FIF_ALLMULTI) {
>                 if (*new_flags & FIF_ALLMULTI)
> diff --git a/drivers/net/wireless/realtek/rtw89/mac_be.c
> b/drivers/net/wireless/realtek/rtw89/mac_be.c
> index fa35caf..7147679 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac_be.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac_be.c
> @@ -1328,7 +1328,8 @@ static int rx_fltr_init_be(struct rtw89_dev *rtwdev=
, u8 mac_idx)
>         rtw89_mac_typ_fltr_opt_be(rtwdev, RTW89_DATA, RTW89_FWD_TO_HOST, =
mac_idx);
>=20
>         reg =3D rtw89_mac_reg_by_idx(rtwdev, R_BE_RX_FLTR_OPT, mac_idx);
> -       rtw89_write32(rtwdev, reg, rtwdev->hal.rx_fltr);
> +       rtw89_write32(rtwdev, reg,
> +                     rtw89_mac_refine_rx_fltr(rtwdev, rtwdev->hal.rx_flt=
r));

This is just initial state. I suppose rtw89_ops_configure_filter() can chan=
ge
to proper setting by *new_flags passed from mac80211.

>=20
>         reg =3D rtw89_mac_reg_by_idx(rtwdev, R_BE_PLCP_HDR_FLTR, mac_idx)=
;
>         val =3D B_BE_HE_SIGB_CRC_CHK | B_BE_VHT_MU_SIGB_CRC_CHK |
> --
> 2.56.0.windows.4
>=20

