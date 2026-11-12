Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484006;
	b=W1yPE/D+tUon5d64FTSB+cf+L1vc8wco43niC8XRZFeZvE6qJiTxhwrd589X5vUQhhV1
	 hGzU661PmjjU0Tme1fCprsiis9iXuozn3kaw3uTwBZDFSq3OeOxBFM2GpA25Zuk3vFdup
	 92k+f+6Tk6EEiuc0qRJaJR86x7ID0fn6pJAsFWSfOap8N6XcmhE8fZGKa8cB2K5uymV9e
	 4F7PkKoXbquHU0pEH8ZVGfuErDkbz8sD3lbLyiQuphffDJ0yke5s3o/BLhwTk8GQXH9No
	 vEb73Y89xPZB/gkEW2vjjXlaPZGauGVE1fIM4xhY+vg2uMECTeUv3hwnuIkpEUkKGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484006;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=96B1aoUOIGHnE7djBvHarqc+Lm2Nf+DJ9a9DH1Eo88M=;
	b=AVes7mbEE4EmLZU6p+bzeu77QJy5n7tFZNcqs3jfPRwWbKRZ3oAVv8L+/Md7/Vtf59pA
	 5xojuggFI7KK55zeI/ehfKCCQIDIf5UYQbuMZvmAmXBMHUizvEOLQr31o09jJFal9d/64
	 RhPa7WjJL3uQOAEHYX1H4fGKq0q5OKrVf+/2tcRyMqja2UakVo4gnGtNE90nYbOU6Brnu
	 oA7+5EGZssv4rzgOcryQniYImLFdOkt1gGuKI4mljubLafDN/h4pTLWP8hedevGRmHHK7
	 b4jJnG7PJQWlQ1u6epfMXgviNUrtte7v5gy0Y8pZzJhexviPAjeOObls7O0XCz6rY4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sFwoYwPN;
	arc=none smtp.remote-ip=95.215.58.240
Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3971606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3971606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sFwoYwPN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZQ7JHupEs5ZJXUtjdROehyBc6MRz+EliNGYfLnFlSq8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794484002; v=1; x=1795088802;
 b=sFwoYwPNt0kv98ueZexib9aPjCHFphoSWzEa4k8En/s6G2anpQQQfvasGVJhJf/a3J6Dw8nz
 Gy+5RAWBPFppRLampuxNyodDK2SXZnxS39pZVGTCQCjgeFqnAt56nq8exznTB84w4jW8vITqOZB
 jPregJQYiDzyUaTvgZ2690vE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e426e4f5600eeba;
	Thu, 12 Nov 2026 11:46:42 +0000
X-Mizu-Trace-ID: 7e426e4f5600eeba
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 12:46:39 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v10_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <20261111121525.358041-3-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com> <20261111121525.358041-3-mehmet.fide@gmail.com>
Message-ID: <F9A94BCB-D3DD-4ACB-AEA5-118611FCBE08@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Mehmet,

Thanks for the v10, the rtw_core_stop() change looks good to me. I just
have one comment below.

On November 11, 2026 1:15:24 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
> index 5e40cf06a9e3..e6c9866fd599 100644
> --- a/drivers/net/wireless/realtek/rtw88/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw88/mac80211.c

[ ... ]

> @@ -438,6 +443,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
>               rtw_set_dtim_period(rtwdev, conf->dtim_period);
>               rtw_fw_download_rsvd_page(rtwdev);
>               rtw_send_rsvd_page_h2c(rtwdev);
> +             /* restart replay resumes it, a beacon without CSA ends it */
> +             if (conf->csa_active)
> +                     rtw_fw_csa_start(rtwdev, vif);
> +             else
> +                     rtw_fw_csa_stop(rtwdev, vif);
>       }

[ ... ]

> +static void rtw_ops_channel_switch_beacon(struct ieee80211_hw *hw,
> +                                       struct ieee80211_vif *vif,
> +                                       struct cfg80211_chan_def *chandef)
> +{
> +     struct rtw_dev *rtwdev = hw->priv;
> +
> +     mutex_lock(&rtwdev->mutex);
> +     rtw_fw_csa_start(rtwdev, vif);
> +     mutex_unlock(&rtwdev->mutex);
> +}

As far as I can see this op normally has nothing left to do.
__ieee80211_channel_switch() sets csa_active and sends the beacon change
before it calls the op:

        link_conf->csa_active = true;
        ...
        if (changed) {
                ieee80211_link_info_change_notify(sdata, link_data, changed);
                drv_channel_switch_beacon(sdata, &link_data->csa.chanreq.oper);
        }

For rtw88 changed is only set there when there is a CSA beacon, so it
always carries BSS_CHANGED_BEACON. The path above then starts every
countdown, not only the one after a restart, and in the normal flow
rtw_fw_csa_start() in the op returns early because csa_vif already
matches.

Maybe drop the op and say in the comment above that this path starts
the countdown? Or is it kept on purpose?

Best regards,
Luka Gejak
