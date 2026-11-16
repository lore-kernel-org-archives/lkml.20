Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844963;
	b=b9Eh5nn0M0fhUtixCxHfMT4BvorXppGGIR120RZYlkR3ZEI+IrLzZhYfPoZyfrP5Hp0f
	 XmYtsuRYxWbhP2eAbbeM0veuk748L9YulNWLep7CfAGZLER7DVE4cC1GrcvWRkR7Xz1U+
	 Zv2g+lsyA6I7KQndgysaqlg6TWc+6pm8jWNNy96W1f96ysvtSAFSmR7pXHU7dk0PzimZA
	 IUYmeXs1WBNwxHSEU+JiPOcKIDVg3K7STdA3/1RJo/EE4kofButZT17D4034jYxKVgmpk
	 Pl7WVDLZOq3XAxPN1nfIhufV58kmIjDPMLh/2BWmwPeTtZ2HJkCgOO1uCyb0WQ9hooQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844963;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eHVdqjLRJFXA8mYzzzCbjI9ezA8PX6dZisux1DYYEa4=;
	b=HD5M+hPVJ5fZvmAnc/Bnrxcg8CxlqJwYNzG2WqAJ1i8i+SDnWgaVAG80KvAciDa6GllH
	 WbsC2iOtUbm7VgZueO+SYbD6ccRjK9ZKOVaYuy9QLb2c05YGRdG5e6k6aW3ZV7mtg9ZaC
	 Y/Vd/Omjd8f5WlIcSlXBxHRQSCNCglg1hPPG3+Y1IPoDQrUT8iCQNnMeVL7vlMYB7p2xz
	 yvf0v0tMjTt7MvWogUW2I+MvColTa2QQAFsdDPoU6GdcidAOqgPvBySbUJ/HeU71DoOGF
	 LLjQFo5Ej2VYonEPZWnEm+FJPzMGPZi/0cxDw//xW0vKiLuyzz7isBoUKykM4aW5j7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="lw/t/U5j";
	arc=none smtp.remote-ip=95.215.58.202
Received: from mta1.migadu.com (out-202.mta1.migadu.com [95.215.58.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E8606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08E8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lw/t/U5j
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=msxTvuarS4fZOZCtBj5HnfrJixuccUldSih4wvJ+0z8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794844960; v=1; x=1795449760;
 b=lw/t/U5jgUmt6tYTmdMlnfyyQurRVheCBzYlU28JshZLt7dxG5fQlX20w721DkuO2BxnVWuS
 Uo4WVJPROgwBbztNqlo1QCGZYgKXIqYhEBkV3jeHW2vEAdGwZ62eonT0ocLLgYTnJhv5N83p2NQ
 PkifSg8Y1v5qvBHNguy6OKhU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 76efade92409a56c;
	Mon, 16 Nov 2026 16:02:40 +0000
X-Mizu-Trace-ID: 76efade92409a56c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 17:02:39 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, Tzu-En Huang <tehuang@realtek.com>,
 Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_1/3=5D_wifi=3A_rtw88=3A_free_the_?=
 =?US-ASCII?Q?reserved_pages_of_an_interface_on_firmware_recovery?=
In-Reply-To: <20261116072014.1142494-2-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com> <20261116072014.1142494-2-mehmet.fide@gmail.com>
Message-ID: <5285DA11-651F-4286-A0FD-52A6051B3A88@linux.dev>
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

Thanks for the update. Three comments below.

On November 16, 2026 8:20:12 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> @@ -1800,8 +1800,10 @@ void rtw_fw_update_beacon_work(struct work_struct *work)
> +     if (!test_bit(RTW_FLAG_RESTARTING, rtwdev->flags)) {
> +             rtw_fw_download_rsvd_page(rtwdev);
> +             rtw_send_rsvd_page_h2c(rtwdev);
> +     }

Could a skipped TIM update be retried at reconfig_complete()? After
reconfig's last beacon download, sta_info_cleanup() can still expire a
buffered frame and queue this work. If it runs before the flag clears,
the beacon keeps the old TIM bit.

[ ... ]

> +     if (!test_bit(RTW_FLAG_RESTARTING, rtwdev->flags)) {

Also, if the last interface closes before restart work takes the wiphy
lock, open_count is zero and reconfig_complete() is skipped. The flag
survives normal reopening, so the worker still skips TIM updates.
Could that exit be covered too?

[ ... ]

> @@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
> +     rtw_remove_rsvd_page(rtwdev, rtwvif);

As far as I can see, rtw_core_stop() drops the driver mutex without
holding wiphy. A concurrent beacon change can then reach:

        ieee80211_change_beacon()
          rtw_ops_bss_info_changed()
            rtw_fw_download_rsvd_page()

The lists are already empty, and mac80211 restart has not begun yet.
This seems to leave a path to the empty reserved page warning.
Could the direct download path be covered too?

Best regards,
Luka Gejak
