Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557251;
	b=13vWMFjCIGPe7KwPziWdZ/6jhl11uThu1LDnVHPqFVvpMVJTM9UnCNRqjOg9TvLWqgHo
	 JXXe9fdCSyy+ksqtKmXpKqBVau909QcmPav+t2+c6Yk/iooiMiN123G23ms4i25/1hdL1
	 +mt9B+a6KJwUwFkG7pGw2PIvcAUs/L+51qacVVnt5kp78Fi2Ck7cwzB0eAKNTM27LzrKR
	 pUzPXAmcAlsjxzeFqaZye449eWWj5fKHkUFnteGjgOelCxpMdPRWD/XUsvp6GvI2hvu2n
	 0i6au2aAjxWI8YRRw1UH948KEg9QE/9oDA4x44vGcCrd4pgyfYJ9msC26hNRYBAn2eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557251;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=L93Szpy7ojIC6OmBpDCFktptXKBBBLc4Lf3ST+R8Sfw=;
	b=MGtMtNRHzYSyTrQkOPwN+XxRgRDVWxrpnewL8RMBcr3C+c43QUgs89uXliY2VMCDHUEw
	 3Bh8ahM6ZczrDcaOyRqMgi0eoxntE1GCUumSruwaCQl7zR2qnmUD3vp9ZRMZMIkonwot+
	 ZZT7DTvAozZuHTr+dkQ8bhwCDBfYMQKRJYXb8hgnLzHBvbmwD8we3eWMNPi1mw04fieAB
	 54oIR1nb3dFl7dQcccDX+ajqQfelMJAPS9yokpVrcyRulO1+UaVe6vqjkXCmbEH/PAYuJ
	 5YBGlsE0GY7/ZD3c33l0meM8FNz3hlDy+5ITuyAk48/K35hJ7KmuFZwwrn0cv1zbuqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cimzRT0P;
	arc=none smtp.remote-ip=91.218.175.221
Received: from mta0.migadu.com (out-221.mta0.migadu.com [91.218.175.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F36606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F36606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cimzRT0P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1/JNFg7kBz20daibv9M8Yasjxn1FTUtYmNAmUGPc2w0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557249; v=1; x=1795162049;
 b=cimzRT0Pr5YS/d2wYtKPvAuLeQuEn8K9TD/w5TCOCcgX3fofugdGZJmNHao/FB7pDUcmdPwZ
 Y/SGGCEZxf0WDV2+0x6EqE6jye4zq6fTGHXIjag0IAPFlAwQOLXJpx1bQ5s+pste6EQlGQzLsla
 cvW0yc0D9dwbFbLjfoPmMpEg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1832e1d07d37b0fd;
	Fri, 13 Nov 2026 08:07:29 +0000
X-Mizu-Trace-ID: 1832e1d07d37b0fd
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:07:23 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com> <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev> <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com>
Message-ID: <85E23B83-4D3E-4270-B5A5-B835235093A0@linux.dev>
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

On November 13, 2026 9:01:47 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Fri, 13 Nov 2026 at 15:46, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Jie Feng,
>>
>> Thanks for the new version. A question and a comment below.
>>
>> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng
><hjf3108@gmail.com>
>> wrote:
>>
>> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c
>b/drivers/net/wireless/realtek/rtw88/main.c
>> > index e243738809..fe93c93b1a 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/main.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
>>
>> [ ... ]
>>
>> > @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev
>*rtwdev,
>> >                      0;
>> >       if (rtwdev->hal.rf_path_num > 1)
>> >               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
>> > -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
>> > -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
>> > -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
>> > -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
>> > +     if (rtw_bf_support && chip->bfer_su_max_num) {
>> > +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
>> > +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
>> > +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
>> > +     }
>> > +     if (rtw_bf_support && chip->bfer_mu_max_num)
>> > +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
>>
>> In v2 this was its own patch, 3/7 "correctly expose beamformee
>> capabilities", after Bitterblue asked on v1 for it to be split out. Was
>> folding it back in here intended? I couldn't find it in the v3
>changelog.
>Sorry, looks like I used the wrong commit on my local tree, will resend as
>a v4.
>Please ignore this v3.
>

Can you address all comments I have send, as they will most likely apply
to v4 as well?

>> I can see a reason for it. Without this part, an AP that is also a MU
>> beamformer makes rtw_bf_assoc() take the MU branch and return at
>> bfer_mu_max_num, so the new config_bfee code would never run for it. If
>> that is why, maybe mention it in the changelog, and in the commit
>message
>> too, since this is core code and the support_bf check now hides the
>> beamformee caps on every chip when beamforming is turned off.
>>
>> [ ... ]
>>
>> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > index 55f1d3d324..5d58dff4fc 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
>> >       .phy_calibration        = rtw8812a_phy_calibration,
>> >       .cck_pd_set             = rtw_phy_cck_pd_set,
>> >       .pwr_track              = rtw8812a_pwr_track,
>> > -     .config_bfee            = NULL,
>> > +     .config_bfee            = rtw88xxa_bf_config_bfee,
>> >       .set_gid_table          = NULL,
>> >       .cfg_csi_rate           = NULL,
>>
>> As far as I can see, 8812a, 8821a and 8814a are now the first chips that
>> can become a SU beamformee without a cfg_csi_rate op. Once
>rtw_bf_assoc()
>> has set bfee.role, the watchdog goes through
>>
>>         rtw_vif_watch_dog_iter()
>>           rtw_dynamic_csi_rate()
>>
>> and there new_csi_rate_idx is only written by that op:
>>
>>         u8 new_csi_rate_idx;
>>         ...
>>         rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
>>                               bf_info->cur_csi_rpt_rate,
>>                               fix_rate_enable, &new_csi_rate_idx);
>>
>>         if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
>>                 bf_info->cur_csi_rpt_rate = new_csi_rate_idx;
>>
>> So if I read it right, it compares and stores an uninitialized value
>> there. cur_csi_rpt_rate has no other user on these chips, so it seems
>> harmless for now, but I think KMSAN would report it. Maybe
>> rtw_dynamic_csi_rate() could return early when the chip has no
>> cfg_csi_rate op?
>>
>> Best regards,
>> Luka Gejak
>
