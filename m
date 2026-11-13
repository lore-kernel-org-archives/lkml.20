Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556945;
	b=MFbeG/Il7wO9xxTq1WBL0dhkFF5NSKBM3MzL0fgcvvtQ2WCrHMfiveveYOUyr7Zv97PA
	 CN9Fos4xzC48x5b2tBOXtP+JvgKTXrlPpgujH9mRL75y0tReBkJr2KdK33OVRvp3Hd4ZL
	 rwu5Zt8/76cEf6QPXTKsG/unHLbIk5neQKNDLdDuIYd2l5aZ/y+bI2VKslwFPiRx/QrA6
	 9rHBUTPuP0gM94ZfJUy3SzDpAY7K47wbjs3Jhfq6j6miuIY/8yRV701BpnGGQMF+n8ie+
	 wbTPpHCjeBva+7TE7paIQ880VxhudgaS4WDk1MwuhdnM63ZLb2sQEQURolrSYR2c3SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
	b=DO5gi0Nrz1dyk1GvJDEnu45JN69f9Gn0K3Ugx6wc1mPK62ggOwKvKg2ZPQh7NME1qSI7
	 fILZ9Z9NZQvq2fFSMgyOw1RKtZjfCzicAUe2dlDG0Ne3OFUMiYmzdDda2MUp439xlX4ja
	 6VGk7/MTC1s3XyKPFmjT2SeevTpknZIBsH9JNNilimppAYAUcbtkKYF7F60iEtv7lDA8G
	 V1Uycuv3le+BmOWnTDMtbyNHEPV/kFaM/gJue+LihP1QeFNDDZ2FYDKNjBxaDLWcuZ/oB
	 SRwK4Ny1Kgx010W9CCcJdIP0NMU5r4abRnwNufVPW5+u0T9VeNW2ZAe3Ba7MZk/rPyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmVsy0qT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F58606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmVsy0qT
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716b58a4365so758368eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556943; cv=none;
        d=google.com; s=arc-20260327;
        b=Iywc6BZMtZp5YPJB6qlh5cqBL2HUfBNn16Os9bLe4rrkIJMwY0QePhbgV0qBgigZbF
         2tBrLmO9DhCk72SWOu2rEg9dTfHSR/pMU1wGCM0n/yEjSlyGHCI/81Rakv8GAF+vjW3x
         mxrRfscAhWrDO60mCacLcnilPY7i+k5hgyU0thAWLsBYCvcJB+AnsUzmSbaVx6hFtPg7
         T+7s5m7g1aKQmq24QQHXziiMz5TqyphJmcWSl8Rj4rQ7olY9Oyt0b66VAH9heJSuKkEg
         Y2y1cZKR4aqyQCMAtEJ7bp8d+uZPJETCXLZrv3HnjoXFEsJSyqPlhQiePYGuQ248z2yS
         F5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
        fh=Z+weGbnT//tNMUt/YoN0tVV8X6d3QnvAWGShoMu0/dA=;
        b=ox6/sQoJsKqPLuAR/wG6d3Npm9qpjE3OZAkhsRjoVFcV++fr+za/z0uYHGZjgnMseU
         eP9Am3DC8b5jy2Wnh8TzVnqCD5shgqqsCMLtNdl9UPhrSHn2iupIYMAB/0ZSi94jX/uC
         b9hrUcuuvsqb3YyTPSKgdS4ztWrZ92RA+jmEyF0gk298v8r5OurcVjfKnlNT2nQ1nn0j
         QbILWlxQmQskLF1tCeyHw0iAtuap9yDQHjMT1JAWRXElZ8RDZSkGZ5wtF2LrsDv4UjPD
         xwkGLnoutwnpnJ/7/pOaojWmi9O3miNdxaf/2JycEcc54U+G/Wvdvdwx1aq2ginC+crR
         zeCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556943; x=1795161743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
        b=RmVsy0qTPdwYUhT/BPsMO15wGkbJRmkO6ydjPv+CctkUsQqIEcS1XM5zBKWz9NBb/H
         wdfaVwyGakRqAbAgNkd+VpkZpqPk9mkz3oRMS+9cKJCMOvzK9myHT0+OTjHARsEqORzF
         hxmqfNrYk17WRfuFnWQJNMY99bltpKRMn0VilyaUEENoCPonQSJ1ATzIpzNAO689zA7w
         O1KAs5wm8+umGRyi+tCYysYAwUcpqSoVq0Uelmi0cUydUCTLHRIUeJirsOdwlsM/Vfph
         RXxp6SNNER9vkGTSYoJkiZt81bk0o4Ci0dLvQ7dXR00jWwP8cwhLsDYkbO4lxZ6ihe77
         dfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556943; x=1795161743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
        b=Uayh7j7aiD5qW4ERdAA9YkVDyCVR47YTZ339DqOZTQN+A6KOxfmWPUfnOBOhAli5Q4
         MLXmmgrMaT2JE+CR4jUWYK0iRnSMC/JHL10DQRMHzHTNFXDyGeTfx32CYeES/1GUfOTP
         hGmY0513wkJ4dbLCfVreOmsCfBv0PQzf4o+1aTIGp5C/4pwgUwkZM+Zndgpm19kW1/5N
         3BfBKacCzoJuAKFkLJBd5UBEkpAEuE+U1cZl62RolzBNVJtyR9YLl/YQsN/3608olqI8
         moMRt+f41inzgdv0c6l4Ji3imeugSwZ9tTmxwlTsUF3QmmK2iHlTQBbcG2KYgIw518kC
         wyQw==
X-Forwarded-Encrypted: i=1; AL+hErHEClPamVus1+gmvqkQqL7iSdc5wVWFEOBFMKjpOzXkgu6hEmP1sBlXhsRicn/VpcnXdr326qGrsEP0XX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DVZlKrR29OqYXXO9FSa6UWChzlRaeOOqRyrm982R5mRt5vDK+
	id01sTv7X7sBTnmMr+z3eZvDO1x4r1g+cdhqdj46D2Jh62AF17lW4MjybUj5KIauMcckJ+IzrZj
	QXf4h7nh/2D3OeP9QKYzb5FMhy//hzSV+vkJUOKY=
X-Gm-Gg: AYBFou1lNTdlogCXrI+Uw/roQ1YYmMunz9dainm6LeGFlgciVfgHvxo5Hx7CL29X88R
	bhk4tvihkL6V5/SDjOBGCrlvNCYFWzlsHNuoUk/e0saaauu7V8kUzVRuIItl6lrQw+H0L8pChcb
	DARsyQdDfJ7M9xBAV87DpCj5KzDjPUQW5cxPM07DLdo7WYVuWN8vmJ1MPE2BibFhLQgbc2rBRzF
	KO+25Pv8V9eE8vxO4qVymenYfnMHuuWvosudO+Pk1P2QR3NtRuWy3OUHTEx77N+buq2HZg6Qs0f
	S0jdb1Mh9/k7i4G7t368GpKBPz22faKVqR1JAmizANIwIO5vpGNQSGt19r6zL6CAdWtzg8qQKQm
	ztNQPPWJr0Oco2LzYKXa+TZnNPXuLjCQ4Kz1bn9jBlzW78lCdg1wRDj9rnmnfdTK/WT3u4UFRMK
	Z5YUmMgWT1kq+xKBq/V7I4ZPaN9r4VoCMP
X-Received: by 2002:a05:6820:1c8c:b0:713:e433:7e6d with SMTP id
 006d021491bc7-71ab4f44671mr1076601eaf.36.1794556943434; Fri, 13 Nov 2026
 00:02:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
 <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev>
In-Reply-To: <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:01:47 +0800
X-Gm-Features: AclHuK-fjDJAVn06x_jUIuJlL-ttRqKElTJSe4FX02KJdGNbRcV68FJ7UkiEH3A
Message-ID: <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 15:46, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the new version. A question and a comment below.
>
> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> > index e243738809..fe93c93b1a 100644
> > --- a/drivers/net/wireless/realtek/rtw88/main.c
> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
>
> [ ... ]
>
> > @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
> >                      0;
> >       if (rtwdev->hal.rf_path_num > 1)
> >               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
> > -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> > -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> > -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
> > -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> > +     if (rtw_bf_support && chip->bfer_su_max_num) {
> > +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> > +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
> > +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
> > +     }
> > +     if (rtw_bf_support && chip->bfer_mu_max_num)
> > +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
>
> In v2 this was its own patch, 3/7 "correctly expose beamformee
> capabilities", after Bitterblue asked on v1 for it to be split out. Was
> folding it back in here intended? I couldn't find it in the v3 changelog.
Sorry, looks like I used the wrong commit on my local tree, will resend as a v4.
Please ignore this v3.

> I can see a reason for it. Without this part, an AP that is also a MU
> beamformer makes rtw_bf_assoc() take the MU branch and return at
> bfer_mu_max_num, so the new config_bfee code would never run for it. If
> that is why, maybe mention it in the changelog, and in the commit message
> too, since this is core code and the support_bf check now hides the
> beamformee caps on every chip when beamforming is turned off.
>
> [ ... ]
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > index 55f1d3d324..5d58dff4fc 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
> >       .phy_calibration        = rtw8812a_phy_calibration,
> >       .cck_pd_set             = rtw_phy_cck_pd_set,
> >       .pwr_track              = rtw8812a_pwr_track,
> > -     .config_bfee            = NULL,
> > +     .config_bfee            = rtw88xxa_bf_config_bfee,
> >       .set_gid_table          = NULL,
> >       .cfg_csi_rate           = NULL,
>
> As far as I can see, 8812a, 8821a and 8814a are now the first chips that
> can become a SU beamformee without a cfg_csi_rate op. Once rtw_bf_assoc()
> has set bfee.role, the watchdog goes through
>
>         rtw_vif_watch_dog_iter()
>           rtw_dynamic_csi_rate()
>
> and there new_csi_rate_idx is only written by that op:
>
>         u8 new_csi_rate_idx;
>         ...
>         rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
>                               bf_info->cur_csi_rpt_rate,
>                               fix_rate_enable, &new_csi_rate_idx);
>
>         if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
>                 bf_info->cur_csi_rpt_rate = new_csi_rate_idx;
>
> So if I read it right, it compares and stores an uninitialized value
> there. cur_csi_rpt_rate has no other user on these chips, so it seems
> harmless for now, but I think KMSAN would report it. Maybe
> rtw_dynamic_csi_rate() could return early when the chip has no
> cfg_csi_rate op?
>
> Best regards,
> Luka Gejak
