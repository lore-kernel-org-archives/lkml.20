Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986448;
	b=NsQHxee2xgiKcMq1K0F8hWTYYhbaAuQCbUHp1JopkTmIJiqxMfuE6YfC19fliKy9yr4E
	 mrQc51UIBDJWFzXNInQWjSbCjEzvzTnPENzs/lw1lhIGNAyE3I/CWKexH99Whday9Oo8X
	 kUrlCca+41pJiw4zOS7gY/h6b8JpJ3lvu7hitZDQUEgVy4fzgQ0/eUYIPgp6rePGyEZGN
	 Ll7yXbN7yfB3YetOY4FWG10t+1nhMDCTElo9/Yg+WwiHdkcjhTHznlHKUqzibFFETyPjb
	 AWahuWuT2+p1o+Ei6qzQTqMluUFG4Avdj+9C9L1KDmef5vIICOeM5oqDTHBtaKD8Ldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986448;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=Y5a4KiBell1gJdJ+ZzYl70VI+o+NWiB0NJYxZVZEGa8=;
	b=zTMOPuA0ODIzQqZiAZQ2Lsd3qImkQx2SP1X8qXCifCaOAL8ijkm/upsJd4q14SDGAbdL
	 wW+XEkV+xPrrXdP0pa1FNAJCsvmxUpiRU7iWGv+5klcy3LSfpirNTjPdaco4RnIIaE5Co
	 gTbSRlJtwOFCeJIgaD6NG/y6+9VWcnC6+hOhzFqzBPeBSNro5UbjVDbdh1eDWhlahI4Ef
	 U58vfW6oZ8dNto9sHdO3PhS/GzzGt0A2h2fHRPE2BGcGxkMjw343IS/ckBI+vtywNjCYG
	 /aBJAxR13lGM2gAhMcTQiBmzp/MD74Vdz1ob55U+wPDf4BNW8zNQPgHVMGmCu39NxeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XfEPwt3c;
	arc=none smtp.remote-ip=95.215.58.45
Received: from mta1.migadu.com (out-45.mta1.migadu.com [95.215.58.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D5606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XfEPwt3c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kOYWcf6tw9j/rKVpkt2X+0pBUiv6W/BN2LI41RapGXw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793986444; v=1; x=1794591244;
 b=XfEPwt3c4PvSotfKM9uds1T2eoLMRts6xVctuwwFDWiJGYVcI3z9mXlmF0pfM1bZ+scYaXj1
 3X8nJcfE9AcdXvZ7dQOZpGDczQINyxqQtmai8rC8ZuBicNVBrgkMl8AGQcZVz2zrp+No1zEgya3
 jDN4VY7XTRhqRDRNYe28uW1U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06be76154d12f8e4;
	Fri, 06 Nov 2026 17:34:04 +0000
X-Mizu-Trace-ID: 06be76154d12f8e4
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
Date: Fri, 06 Nov 2026 17:34:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 6/7] wifi: rtw88: 88xxa: adapt channel
 sensing to receiver gain
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org, "Bitterblue Smith"
 <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261031070950.425176-7-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-7-hjf3108@gmail.com>

Hi Jie Feng and Bitterblue,

Thanks for fixing the scan latency. A few comments below.

> diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wir=
eless/realtek/rtw88/phy.c
> index 69998c0d7c1f851bb30d2702233d62e14b305bf0..7a04aec9a045f1e308a4c5d=
331c900e013996bd5 100644
> --- a/drivers/net/wireless/realtek/rtw88/phy.c
> +++ b/drivers/net/wireless/realtek/rtw88/phy.c
> @@ -377,6 +377,10 @@ void rtw_phy_dig_set_max_coverage(struct rtw_dev *=
rtwdev)
>               DIG_CVRG_MIN);
>
>       rtw_phy_dig_write(rtwdev, DIG_CVRG_MIN);
> +
> +     /* EDCCA thresholds can be relative to the IGI */
> +     if (!rtw_fw_feature_check(&rtwdev->fw, FW_FEATURE_ADAPTIVITY))
> +             rtw_phy_adaptivity(rtwdev);
>  }

This and the call in rtw_phy_dig_reset() also reach
rtw8822b_adaptivity() and rtw8822c_adaptivity() when the firmware
doesn't handle adaptivity. They use igi_history[0], so as far as I can
see they just write the same thresholds again, but since this is core
code it would be good to mention it in the commit message.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/ne=
t/wireless/realtek/rtw88/rtw88xxa.c
> index 851d198f76f3b10d5ba77c7e07e4be9d7fd54e4b..ee72380757721dab7dc409a=
abc24b2b825969465 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c

[ ... ]

> +#define EDCCA_LB_START_88XXA         (EDCCA_L2H_H2L_DIFF - 30)
> +#define EDCCA_LB_RETRY_88XXA         (EDCCA_LB_START_88XXA + 18)

Maybe a short comment on where the 18 comes from. As far as I can see it
is the vendor condition for searching a second time (IGI upper bound of
0x26 or lower), worked out for an initial L2H of -17.

[ ... ]

> +     rtw_write32(rtwdev, REG_DBGSEL, 0);
> +     for (i =3D 0; i < 3 &&
> +          rtw_read32(rtwdev, REG_DBGRPT) & BIT_DBG_CCA_BUSY; i++)
> +             usleep_range(3000, 3500);

The register read in the loop condition is a bit hard to follow. Maybe
read_poll_timeout() would read easier, like efuse.c uses it:

        read_poll_timeout(rtw_read32, val, !(val & BIT_DBG_CCA_BUSY),
                          3000, 9000, false, rtwdev, REG_DBGRPT);

[ ... ]

> +void rtw88xxa_adaptivity_init(struct rtw_dev *rtwdev)
> +{
> +     struct rtw_dm_info *dm_info =3D &rtwdev->dm_info;
> +     u32 dbgsel =3D rtw_read32(rtwdev, REG_DBGSEL);
> +     s8 l2h;
> +
> +     rtw_write32_clr(rtwdev, REG_TX_PTCL_CTRL, BIT_DIS_EDCCA);

Bitterblue reported on that "firmware failed to leave lps state" shows
up a lot more often with this patch and stops when EDCCA is disabled,
and you replied that it only prints a line in dmesg. On rtw-next it is
more than a message now. Since dc16902cad9c ("wifi: rtw88: ps: Trigger
firmware recovery when failing to leave LPS state"), rtw_fw_leave_lps_che=
ck()=20
goes=20on to a firmware recovery after the warning:

        rtw_warn(rtwdev, "firmware failed to leave lps state\n");
        rtw_fw_dump_dbg_info(rtwdev);
        rtw_fw_recovery(rtwdev);

So a failed leave now ends in a firmware recovery, with a "firmware
crash, start reset and recover" WARN and ieee80211_restart_hw(). With
power saving on, rtw_watch_dog_work() calls rtw_leave_lps() every 2
seconds before the dynamic mechanisms, so I think this needs to be
solved before the patch can go in.

About a longer timeout, according to the comment in
__rtw_fw_leave_lps_check_reg() the firmware restores REG_TCR once the AP
has acked its null frame, so I think it would mostly hide the problem.
Leaving this patch out of v3 and sending it again once the cause is
known sounds fine to me, then the rest of the series doesn't have to
wait.

Bitterblue, did you turn EDCCA off through the edcca_enable debugfs file?
With this patch that only switches to RTW_EDCCA_NORMAL, and
rtw88xxa_adaptivity() then keeps EDCCA on with the higher normal
thresholds. If that is what made it stop, it would point at the
thresholds used in adaptivity mode (ETSI and JP regions) rather than at
EDCCA itself.

Jie Feng, maybe comparing the IGI in the hardware when the leave fails
with the IGI the thresholds were computed from would show more.

[ ... ]

> +     /* igi_history[0] keeps the pre-scan IGI while scanning */
> +     u8 igi =3D rtw_read32_mask(rtwdev, REG_RXIGI_A, 0x7f);

The comment sits on a line that doesn't use igi_history[0], so it reads
a bit confusing. Maybe something like "read the IGI in use,
igi_history[0] still holds the old value while scanning".

Best regards,
Luka Gejak
