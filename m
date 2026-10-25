Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792934680;
	b=L29XKapKMi4rcpXgM9yCkLugcfA9YyLEM36zJ0TlpF1JdP+/Cl3IoUXFck/4EqOq3ufO
	 OMosbelY977r21qXqn0Om5cJ4Td8pSea+hr97sEK2GaNf3jhaj8giqP0X0OU08XW/nr/1
	 vrGk1lJpFhDqoG+NF6WIP+IpqYNqyEjVeY0wz9eugQTKHinsZH/l5Dt8dxrQq8HdHswQh
	 gETY7qf4kKJhmdlHK6A2AVqVVCeBfAEViyXYF7HBULyOz9Gz47pGqsPZ+Uhnhs0g0cnGR
	 ulIza35v5Bsrnl10s3W/eVDr3Ac68W3ZKh90pHwMr9uX8jy7i+x/5dF37uIdwGf6z0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=w2bM2xm2q4lrEvIyhqBo35K6xZhsXu4Ai3jdew9TMdE=;
	b=VgcPLQfOt3lDqU1tBn4P8o1H2YfDy/0/xaYdXjZDguwZn6cIMTa2bltJk4xm7BoQ68GV
	 om2aQCTijkTL1EgZbi2Uh5eZeS8TtODUDR0PWVfhmnb3UIarVtd7nlmKNg4tNkOVRV5pi
	 /BCqydbXsP5xZsK11D7N42/q1YI5CjwFAB6dXRd+6S4H63q6Gr8/oE1reg8HMQzDCluWr
	 z1iZUhDPm38klBnSqyhyks7eXMxAdtsBUrzdqFjUtdNPFDnavDsrVyQ0ULXdMLazRJz7V
	 0cOx/tdXH5kZlRvp/hATzjGOxb870Mhe5SUB6ucJa9VZ8JJYq+lIr/HEvUfjW621Emw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l4jFs1bk;
	arc=none smtp.remote-ip=91.218.175.6
Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4A1606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4A1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l4jFs1bk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h/4/z+tmIDkpH6DwC/ZqN89159IIEXYmI4z+DZmkUU0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792934677; v=1; x=1793539477;
 b=l4jFs1bkmMmzETBEv46o1f92mBzsgsZVXzY4XEAdS5/HHeaqw9Hq4XhfbHpd++tWG1jNG3Un
 iOS+iM10ea3bgEC2xTSH6TmKwr3i+9OjF0it83MX25QU/JoCdg89CDbmqxHCSecylmOeAETns8m
 T31J57Y0WR66iITpps1mhX5k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d922a4a885a3ff3;
	Sun, 25 Oct 2026 13:24:36 +0000
X-Mizu-Trace-ID: 8d922a4a885a3ff3
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
Date: Sun, 25 Oct 2026 13:24:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <796598480d47c5bf474d11828769e864b8209558@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v8 2/3] wifi: rtw88: support channel switch in
 AP mode
To: "Mehmet Fide" <mehmet.fide@gmail.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>
Cc: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261021114543.4132776-3-mehmet.fide@gmail.com>
References: <20261021114543.4132776-1-mehmet.fide@gmail.com>
 <20261021114543.4132776-3-mehmet.fide@gmail.com>

Hi Mehmet, Ping-Ke,

Sorry for late review, few comments below.

October 21, 2026 at 1:45 PM, "Mehmet Fide" <mehmet.fide@gmail.com> wrote:

>=20
>=20From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
>=20hostapd's CHAN_SWITCH is refused because the driver does not announce
> channel switch support, so an rtw88 AP can only change its channel by
> being torn down and started again.
>=20
>=20Declare WIPHY_FLAG_HAS_CHANNEL_SWITCH and implement
> channel_switch_beacon: the firmware repeats the beacon held in the
> first reserved page, so while a switch is announced the page is
> downloaded again every beacon interval to advance the countdown, and
> ieee80211_csa_finish() is called once it completes. IBSS shares the
> page and the work.
>=20
>=20The work is a delayed work of the device and csa_vif names the
> interface, both under the driver mutex. The countdown is cancelled when
> the AP stops, when the interface goes away, on WoWLAN suspend and in
> rtw_core_stop(); the BSS_CHANGED_BEACON replay after a hardware restart
> resumes it. The other page downloads during a countdown, the TIM update=
,
> the PG backup and the one on association, are skipped until the beacon
> after the switch, since every beacon fetch advances the countdown; the
> next download carries their changes. A scan is refused: it would take
> the AP off the channel its stations count down to.
>=20
>=20Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
> ---

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/ne=
t/wireless/realtek/rtw88/mac80211.c
> index 2a9b09fa76e7..182aecc76820 100644
> --- a/drivers/net/wireless/realtek/rtw88/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw88/mac80211.c

[ ... ]

> @@ -438,6 +443,11 @@ static void rtw_ops_bss_info_changed(struct ieee80=
211_hw *hw,
>               rtw_set_dtim_period(rtwdev, conf->dtim_period);
>               rtw_fw_download_rsvd_page(rtwdev);
>               rtw_send_rsvd_page_h2c(rtwdev);
> +             /* restart replay resumes it, a beacon without CSA ends i=
t */
> +             if (conf->csa_active)
> +                     rtw_fw_csa_start(rtwdev, vif);
> +             else
> +                     rtw_fw_csa_stop(rtwdev, vif);
>       }
>
>       if (changed & BSS_CHANGED_BEACON_ENABLED) {

What happens when an IBSS is left during its countdown and joined again?

ieee80211_ibss_disconnect() leaves csa_active set and reports no
BSS_CHANGED_BEACON, so only the idle path through rtw_core_stop() clears
csa_vif. The next join reports BSS_CHANGED_BEACON with csa_active still
set and this starts a new countdown. The new beacon has no counter, so
ieee80211_beacon_cntdwn_is_complete() never returns true. The page is the=
n
downloaded every beacon interval and scans return -EBUSY until the
interface goes down.

Would clearing csa_active in ieee80211_ibss_disconnect(), same way
ieee80211_stop_ap() does, be the right fix?

[ ... ]

> @@ -846,6 +869,7 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
>       int ret;
>
>       mutex_lock(&rtwdev->mutex);
> +     rtw_fw_csa_stop(rtwdev, rtwdev->csa_vif);
>       ret =3D rtw_wow_suspend(rtwdev, wowlan);
>       if (ret)
>               rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);

What restarts the countdown after a successful WoWLAN resume?

The 8822C registers rtw_iface_combs and a wowlan_stub, so an AP can be
counting down next to an associated station when the system suspends.
rtw_wow_vif_iter() only picks the station, so rtw_wow_suspend() succeeds
and mac80211 keeps the AP running with csa_active set.

rtw_ops_resume() then returns 0 and ieee80211_reconfig() skips the
replay:

        res =3D drv_resume(local);
        ...
        if (res =3D=3D 0)
                goto wake_up;

So no BSS_CHANGED_BEACON arrives, csa_vif stays NULL and
ieee80211_csa_finish() is never called. csa_active stays set on the AP,
so ieee80211_change_beacon() and any later channel switch return -EBUSY
until the AP is restarted. Also each TIM download fetches the beacon
again, since csa_vif no longer gates it, and keeps stepping the count.

Maybe rtw_ops_resume() could restart the countdown when the AP still has
csa_active set?

Best regards,
Luka Gejak
