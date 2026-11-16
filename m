Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839093;
	b=IyfkK5ldrY0XvYnSJnP7lXwfLbWX2Vksao9x7+w0FvGVH5IdSG/opPvj4Jnm36xGtlFU
	 uquVGTMOt3N3wpOPouRzY/fd/huF/Fm56IkQXGfXuzL+9zpb/xnt6CSargIyown+eXcz9
	 20WoquGJZdFLFTVBv0oDCl6tckQ73AOOeuYYEE95r/64u9dSQT0epuKmv2G0V5nYDh7MX
	 U6gc4wJvoYRLa1sAKQqoSDlZbdzpKp+KPRIfvrjU9rEMe0ljsRtRXPBit7PxG6Grf9Zuj
	 h6BARCoASmuk7B4FVC6xUxwvT4VNY1Hkm8riDMRsNg1oxUtKBZZIi3doVq3bGYkhk5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839093;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vJ3DlDifoIuatDYKYU6JvmcHQkKHDpb4gyOMAXAUddU=;
	b=X9lnc3NHEl4I2iNfOQYjw26FTsfPAL1LQGYUSigT7FqtNLnWJBkqpuM2LFYSrk7iaj+9
	 gIdaovPLXZU5RATcEGkazopfpT5joFSM/IUqucC7G48lrCiHWPaFa4O6jcwjpkyOuGWSw
	 TG3zd6nFqzo/nC5hBs7MVnh59R9MuffQ+MACnDxasJp9U2mXj6TiRgSUtSR3KwrhskST4
	 h97AmccOg02IISygiYeUbuEJUbeF3lptFz3YkXZL2DjViwDYEhK5y+CHhNPW3wvnQi5fO
	 nc6MuntL9zYHnjVxmFquFz0BMaNosyr0BBB5FIdTHaa04dCiSL1u+oOUG5TMaGYb7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H7OQsukD;
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0453606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0453606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H7OQsukD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0sBoD4kUvGDlq9znUUfJmY1OltvGUdoIKcCEhtSzjx4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794839090; v=1; x=1795443890;
 b=H7OQsukD2iUnVYe9Ll9hbMbNtvLgT/l/LZtZ2ZOCPjS2NnyMUSLmFg7u7I1BbpKdr/SvzfD9
 T9YyP+kCt5hy+XMdK3/ahgLdU2YjEltc9LxKnuKKHdYzTgGyCKZw+hF1p/d3W8V2ojagL27WZ5M
 99lex8gST7+OaEbXVlP4RpVU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 315d481954b7f121;
	Mon, 16 Nov 2026 14:24:50 +0000
X-Mizu-Trace-ID: 315d481954b7f121
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 15:24:45 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v11_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <20261116071952.1142013-3-mehmet.fide@gmail.com>
References: <20261116071952.1142013-1-mehmet.fide@gmail.com> <20261116071952.1142013-3-mehmet.fide@gmail.com>
Message-ID: <59C03074-784F-41CE-A27D-EF3F30773D77@linux.dev>
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

Thanks for the v11. Three comments below.

On November 16, 2026 8:19:51 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c

[ ... ]

> +     if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
> +             ieee80211_beacon_update_cntdwn(vif, 0);
> +             rtw_fw_download_rsvd_page(rtwdev);
> +             rtw_send_rsvd_page_h2c(rtwdev);
> +             rtw_fw_csa_queue(rtwdev, vif);
> +     } else {
> +             ieee80211_csa_finish(vif, 0);
> +     }

As far as I can see, the template fetch writes the new count into
mac80211's beacon before the transfer can fail. If the allocation in
rtw_tx_write_data_rsvd_page_get() fails at count 1, the next work still
finds the countdown complete. With patch 3 and count 2, this can finish
the switch without any CSA beacon going out.

Could a failed download keep that count pending for a retry before
allowing completion?

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c

[ ... ]

> +     csa = rtw_fw_csa_stop(rtwdev, vif);

[ ... ]

> +     } else if (csa) {
> +             /* what the countdown held back */
> +             rtw_fw_download_rsvd_page(rtwdev);
> +             rtw_send_rsvd_page_h2c(rtwdev);
> +     }

I think ieee80211_stop_ap() can clear csa_active and the countdown work
can then clear csa_vif before stop_ap gets the driver mutex.
rtw_fw_csa_stop() returns false, so this refresh is skipped even with a
station left running. Any deferred station PG backup or association
download is then lost.

Maybe the refresh should not depend on csa_vif still being set? The
wiphy lock does not exclude the countdown work.

[ ... ]

> +     else
> +             rtw_iterate_vifs(rtwdev, rtw_ops_csa_resume_iter, rtwdev);

rtw_iterate_vifs() silently skips a vif if its GFP_ATOMIC entry
allocation fails. With an AP counting down next to an associated station
on the 8822C, skipping the AP leaves csa_active set and the work
cancelled. Resume returns 0, so mac80211 sends no beacon replay and the
countdown stays stuck. TIM downloads fetch a template and do not advance
it either.

Could the AP be found without allocating an entry?

Best regards,
Luka Gejak
