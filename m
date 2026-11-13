Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552886;
	b=CQ/v/Nym2UWTn2iif/oJK8L7sDPHHrsTTxKd5qPXBO/kJkqNQEDlBYq5qhYoBegU2Tj8
	 4Xo8RalwKVE55ND4+yJoekw0VneawQxMrgx+vk/VHoyxG6kyMtU5wah4htCCUby7J+WOq
	 FIYb1p1vfydoedM7FbuY4JBkTYnLfPwre7SvgVmPp/YJQL+4SrKIqPHwNpDRKFvML575I
	 Fmd5/yBN2gTEdOnx8R9hTfv51faHW/fuC67fCl7R6kxAtF23CkPPH5juWqNnw9azz1Bil
	 dOjnd9W2SCPGLyKSSV51n9yhpTJqNk6YJfLOhjb2T/Rl6u9IP6V6mGV9kRLmNlgXprA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552886;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R2fhwLvHTy1x0CH3Us+GlmFnqE7m+FoayPcluGQhNk4=;
	b=CQvQ0hBUjIdvrQ9hHIFuhTn4maiKwMsr35R1Y1J4BPnrwhKkuJDTYEaDWcaw/39DbuRn
	 Ygv4goFV/bXCGiE+VdyTbFqQbjN+7wgAgVYeOVe8xJPddN3iYekRyQI7R2KFBaFbiOIL1
	 9qQHkzTNdYEsewwucOLf+y6KtPt7APVMQmTHw3UpD/3Gs9H0ziiaFHSJcVfVOdhQ47XqD
	 W/HtTU6Z2Wj2geBmB7ro6ghziLvN43y7EK6azeMqJnNl9qc02F471LmBG9/czXlZgFaE5
	 Iw6a9ZfSsl4xVkzkCdMXpVQACYlX8/MD1NCqG85ZY3JZzAjfZHdXQxPRQRPUuBAOFWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d9VC2BA2;
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E4E606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E4E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d9VC2BA2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OsS3qsQqkiRhs5vCMH87Zrs/o6a3Yg7xoB13t5bDoD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794552883; v=1; x=1795157683;
 b=d9VC2BA2Ksc1SYEexOYvI9NbFfuD/9nfwxBBhF+mNKQLkVqU2gSStA4WlHVhf7nFXBFWwzuQ
 k8O0A56dcZDb5ubBDi3UcyHv21/DbmvNbaUQeZUNTUH+JRuPAXf4sMhzwxy7hGyqKV5Q4kdf7rD
 KDsPmJq7QnuxL04lT2fjBqUw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6a10e7b9b8e81ff;
	Fri, 13 Nov 2026 06:54:43 +0000
X-Mizu-Trace-ID: f6a10e7b9b8e81ff
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 07:54:40 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Mehmet Fide <mehmet.fide@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_1/3=5D_wifi=3A_rtw88=3A_free_the_re?=
 =?US-ASCII?Q?served_pages_of_an_interface_on_firmware_recovery?=
In-Reply-To: <20261111213239.569224-2-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com> <20261111213239.569224-2-mehmet.fide@gmail.com>
Message-ID: <7DDD0FC3-AD89-4819-8058-15DFDA7E5D6D@linux.dev>
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

Thanks for sending these. One comment below.

On November 11, 2026 10:32:37 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index f7708ad17b6f..adc54b063382 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
>       rtw_bf_disassoc(rtwdev, vif, NULL);
>       rtw_vif_assoc_changed(rtwvif, NULL);
>       rtw_txq_cleanup(rtwdev, vif->txq);
> +     rtw_remove_rsvd_page(rtwdev, rtwvif);

As far as I can see, update_beacon_work can still run after this reset
and before ieee80211_reconfig() adds the interfaces again.
rtw_core_stop() cancels it from rtw_enter_ips(), but rtw_ops_set_tim()
can queue it again right after, for example when a frame for a dozing
station gets buffered. ieee80211_restart_work() then flushes
local->workqueue before it calls ieee80211_reconfig().

So if I read it right, with an AP interface (ap_active stays set) the
work now finds every per vif list empty and runs into this in
__rtw_build_rsvd_page_from_vifs():

        rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
                                            struct rtw_rsvd_page, build_list);
        if (!rsvd_pkt) {
                WARN(1, "Should not have an empty reserved page\n");
                return -EINVAL;
        }

Before this patch it built the page from the stale entries and did not
warn. Maybe rtw_fw_update_beacon_work() could skip the download while
RTW_FLAG_RESTARTING is set? The reconfig downloads the beacon again for
BSS_CHANGED_BEACON anyway.

Best regards,
Luka Gejak
