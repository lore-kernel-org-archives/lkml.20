Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587534;
	b=4VyND3Rd5KDfxDb39WpYz2biQhgiXbykOuk7nhZMbPXQO8P1ZuTVk4HsoneumZGLE++m
	 eBTRj5mTBHMeLeMZSFtb3Wn5RCJIEFsPNcDMvUhcFc+wk8KPgqjeRUWv9BNXFwouA+x9R
	 o1QRSxzF/iCfVgeZJekEmrqBKHeEOXv6ptJB9iEJ/6bh2iNJvWy+SinYfpFIGe3VYQYeP
	 NvKBVMqczKBtnNESKpUEG9LjuCOuYSmyRARb0fmBA/rRd23DLb0kezhKWeBGJIdUquBFv
	 wprkqhTuy0E6F/xC/3yBlcpdtDrD5PhVmJqQrrq6tIdwZGYL7Y/jRKz1ZuQvfsaRGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587534;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PNcT/5y2n6lEbOwIhnDRPuYyHAXovWjkBvNCMurPMiY=;
	b=UQ04yHguHwxgKstBVJ6Ihe/1ULPMNqUlvVSD2JM2cOUedUaxc85929D3QotQ9KfJLD2z
	 Qq173w0NbwtgbUVMDcStW/EI6nt5e1TXaKwGLDCsIXejS1jfCWOnKtS3enXmatq1uSmFy
	 4lD5FdyLpefQOWoFwu4b2zggNbvpcvF2LgDK3ITTLmYIiIaitNc92Vd7okL6qDq5yYsoa
	 Y3UHtYGqem+h1rPUU1zE2vSaFjQCn3dw47xNQW7YVLKFkq3TFOiLDQkE9jwMkhetyh5rT
	 ceSjZ7VoqVGeutVEnShPV3pRRFJGYR5kf5hvYtlqHOPyKww4hDDE6OkQDVU8rb5qUgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iG4ce+3F;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1EF606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iG4ce+3F
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lwWaUSrzqmUWWYePuSvSuPl4hpMxYnFKddQhLhmwfiY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794587532; v=1; x=1795192332;
 b=iG4ce+3FghKGXRu07m2qpS6JRz3LQRAH3mDN4cbT4DKPncHdTd7yOSxHOBO4Ll23k8Et2mB1
 0oV2a0DB7UWJfLmnM6h4MA/IZAficdKUAWDELcbMVMuNEeJad8CF9BhN99i2epIaXR3a4qpKb+8
 BXnrPnsyb9FbeeaERo/eRfOA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67f2414c01a569b6;
	Fri, 13 Nov 2026 16:32:11 +0000
X-Mizu-Trace-ID: 67f2414c01a569b6
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 17:32:06 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zong-Zhe Yang <kevin_yang@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_1/3=5D_wifi=3A_rtw88=3A_free_the_re?=
 =?US-ASCII?Q?served_pages_of_an_interface_on_firmware_recovery?=
In-Reply-To: <96da951407ab4c39b7e229ca365950eb@realtek.com>
References: <7DDD0FC3-AD89-4819-8058-15DFDA7E5D6D@linux.dev> <96da951407ab4c39b7e229ca365950eb@realtek.com>
Message-ID: <5FA04DA4-863E-46D3-A993-5F3C074ABC37@linux.dev>
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

On November 13, 2026 11:21:16 AM GMT+01:00, Zong-Zhe Yang
<kevin_yang@realtek.com> wrote:
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> 
>> On November 11, 2026 10:32:37 PM GMT+01:00, Mehmet Fide
>> <mehmet.fide@gmail.com> wrote:
>> 
>> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c
>> b/drivers/net/wireless/realtek/rtw88/main.c
>> > index f7708ad17b6f..adc54b063382 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/main.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
>> > @@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8
>*mac,
>> struct ieee80211_vif *vif)
>> >       rtw_bf_disassoc(rtwdev, vif, NULL);
>> >       rtw_vif_assoc_changed(rtwvif, NULL);
>> >       rtw_txq_cleanup(rtwdev, vif->txq);
>> > +     rtw_remove_rsvd_page(rtwdev, rtwvif);
>> 
>> As far as I can see, update_beacon_work can still run after this reset
>> and before ieee80211_reconfig() adds the interfaces again.
>> rtw_core_stop() cancels it from rtw_enter_ips(), but rtw_ops_set_tim()
>> can queue it again right after, for example when a frame for a dozing
>> station gets buffered. ieee80211_restart_work() then flushes
>> local->workqueue before it calls ieee80211_reconfig().
>> 
>> So if I read it right, with an AP interface (ap_active stays set) the
>> work now finds every per vif list empty and runs into this in
>> __rtw_build_rsvd_page_from_vifs():
>> 
>>         rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
>>                                             struct rtw_rsvd_page,
>> build_list);
>>         if (!rsvd_pkt) {
>>                 WARN(1, "Should not have an empty reserved page\n");
>>                 return -EINVAL;
>>         }
>> 
>> Before this patch it built the page from the stale entries and did not
>> warn. Maybe rtw_fw_update_beacon_work() could skip the download while
>> RTW_FLAG_RESTARTING is set? The reconfig downloads the beacon again for
>> BSS_CHANGED_BEACON anyway.
>> 
>
>How about adding a flag to indicate if this rtwvif has been init-ed or not
>?
>If init-ed and rtw_ops_add_interface() again, call rtw_remove_rsvd_page()
>first.
>

Thank you for your suggestion. I am fine with either approach, as outcome
is the same either way. So Mehmet, choose whatever you are more comfortable
doing.

Best regards,
Luka Gejak
