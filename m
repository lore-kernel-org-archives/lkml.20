Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846641;
	b=vcQ6MW17XoyZiGBx7oFalboSCuR/sTFagwt9EvaWRwy43Yxi898T9buQMYq9YxhS3QS7
	 wEQ4VOi0Rpitz/QC/kDsdMfMINAuyFLtaXhNaB0iOIIGrJpQI6DhctHAvwfRVZMfs7vpu
	 +ftG2jLx+YbhCip0Al4W6N10b4VqE1QfLzJHRtwxv59zRgpQDY0B2Y6gWu4psYn8gVG7M
	 K4TTG7fC9bR+GqQtwdX5K6wc12f5S72KSTIgbkxpGCKQv6xyMMhClD+WvERyRdR5FbrYs
	 PED7M2SC9dUfX5PeB3ewbU+ehysFELNU0VfQ/ri7FZpdjuX5PU7TZ1Y8ZwEUCArdT7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846641;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=he+saMp+oTnLRVJ1Jhhn3AtOVPA3/Sk2xJndKLc0VBs=;
	b=1LWNHj/KhTgk8xAdMMfEhR8tyWvU1chD/AzHcWm6zaiknBHhgJVl2PJNvVOCcZhO2xqG
	 pWKv6byIWy8RxViysy33CEPPGTmJE0Fs0IjaC6/lAgpnQH8HcxtjJz6vBgumxEoH7yo4E
	 ZrCzRfKEQ4iPbfTHat69dQnsDY4FiK9MAHxdeg/X9JJnI8q7iWEZ93MTxMWad0Y5uMcTA
	 ELPO9nRg0EjR0htY2php1DwJBH2VvJAH3On6Z6J+NA0JuK7F5CpAokHX+JnwhU0CjYmUE
	 Cy6fxeDeh+1bNjb2dpH0YHNDsdyLx0zYzCwfQKLCoyVOUQOh3Cd0CBufms+QKc39qsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C08AbvoO;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A989C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C08AbvoO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/TmlOBmRF0Q2L4IdY2HJibxaU1MOpwjcuMv+N7kBxPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794846638; v=1; x=1795451438;
 b=C08AbvoOdH/lcIRlEFaUVEUl5r+ocRuxANKCpa0wPAi2avIa2z/i5qedFZvxNmvjeGV40J0j
 5jNyFJuJWirRTH2Wc2xMHbMFG9trvPFM247+NcF/DsQa0v0Kh8GdWdgaT6tITzqoqE1XW64EpOV
 txBP53eOHzWnXzIahywrdmRY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 709ba1d64c3d008f;
	Mon, 16 Nov 2026 16:30:31 +0000
X-Mizu-Trace-ID: 709ba1d64c3d008f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 17:30:30 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Leonard Lausen <leonard@lausen.nl>, Ping-Ke Shih <pkshih@realtek.com>
CC: leonard@lausen.nl, Shawn Lin <shawn.lin@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-wireless@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_1/2=5D_wifi=3A_rtw88=3A_8822c=3A?=
 =?US-ASCII?Q?_filter_hardware-handled_control_frames_on_SDIO?=
In-Reply-To: <20261116100804.425592-4-leonard@lausen.nl>
References: <20261116100804.425592-2-leonard@lausen.nl> <20261116100804.425592-4-leonard@lausen.nl>
Message-ID: <86B705FE-9271-4721-BF04-4777D8D130BC@linux.dev>
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

Hi Leonard,

Thanks for the update. One comment below.

On November 16, 2026 11:08:03 AM GMT+01:00, Leonard Lausen
<leonard@lausen.nl> wrote:

> @@ -2096,6 +2096,16 @@ static int rtw8822c_mac_init(struct rtw_dev *rtwdev)

[ ... ]

>       rtwdev->hal.rxfltmap1 = WLAN_RX_FILTER1;
> +     if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_SDIO) {
> +             /*
> +              * Hardware handles these frames; retain BAR and PS-Poll for
> +              * mac80211. FIF_CONTROL restores all subtypes for monitors.
> +              */
> +             rtwdev->hal.rxfltmap1 &= ~(BIT_RXFLTMAP1_BACK |
> +                                        BIT_RXFLTMAP1_RTS |
> +                                        BIT_RXFLTMAP1_CTS |
> +                                        BIT_RXFLTMAP1_ACK);
> +     }
>       rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1);

[ ... ]

As far as I can see, later writes of this default can disable these frames
while a monitor still requests them.

For example, with an unassociated interface in IPS, bringing up a monitor
first calls ieee80211_configure_filter(). The following
ieee80211_recalc_idle() leaves IPS and runs rtw8822c_mac_init(), which
writes the reduced map again. A hardware restart or resume with an
existing monitor seems to have the same problem.

mac80211 keeps local->filter_flags, so FIF_CONTROL can still be set in
*new_flags but clear in changed_flags. Then rtw_ops_configure_filter()
skips restoring 0xffff.

There also seems to be a way to lose it while the radio stays on.
Associating a managed interface with an MU beamformer calls:

        rtw_bf_enable_bfee_mu()
                rtw_bf_cfg_sounding()

Both functions write hal.rxfltmap1 back to REG_RXFLTMAP1, replacing the
monitor's 0xffff with the reduced map. Before this patch those writes
left the four subtypes enabled.

Could we preserve the active FIF_CONTROL setting in the common filter
code and use it for MAC initialization and the writes in bf.c too?

Best regards,
Luka Gejak
