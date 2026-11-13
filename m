Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557572;
	b=wElsdXHFDZb3GkY9YuY68SPDE62GzGRqsPsxFJdQmCLuOMlEXhMWbufvPvE4gvF/X7Hm
	 6fkpun0gOfn/UU/NKC9mwfuiUrxOAe6MZw93Qc/33vMwAKioqZsOLCUhqt3ChWQhP+9+A
	 Ls1Yofb0EQ/m13FsobR1YCbxz5bFVtLGZd7ByW94wJ76jApKizAhVl7EBKxjW2HNikk+a
	 b44gz9pX/ZYnmsuuGYgVT5TUbARfZQrTSPs7G+6GBIRdzg1rRR8Z8km55Xodu7hLr5fiO
	 uefz0B4bvRFnTJCYpL2LsIC9Lrbp4t4t7mR5fVwOkaDt5G2W4k16Pfxp9JaobCthA1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
	b=rNYZTWTrn50CK0QZWvT3HQVUZLcuDhXi6ah/NVEYoqVyxV5Qv/NxZoH/j5Yccnx3tjGA
	 dARmFXSNLn38YFcc0Tb9N5h0ozFbbAk1f5LvVAzY4XzZtl4IHZ5IEVDm6/G++gudep3hK
	 rbcRAUX43g9tvwkiu2R6+AcXIqFOHDhiPbGA1HyIyfXOLSAG4LgKQIn6104ErU9ppmL72
	 h9EF46IksmAVViXPzAc/ivbpGZg4YVtsppbhdyIUe+iSvX0H6gIPZkfH9Qs3k0R5Dv0Hu
	 Gxjw8+ejwMCEMLfXj7MDDj42DE50DgR5QoI/gRsdPBm/BYqcMylPD5eqIAU/uWcVcRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXhSTd6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD28606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD28606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXhSTd6n
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de1fd5f572so203080eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557571; cv=none;
        d=google.com; s=arc-20260327;
        b=cOjld7z6Aj2d1k4n4/xIuxycmlOkO5Uzb82a9Qh+5TJ7OPVgbbHc6oEBE2HHPj2HAj
         JWKcrlGKolPwzuA5+uFNvSx51WVICFqk0wHe7rC3pA1yQhxpKWpE8Lqr4wa79SrPp5wJ
         vDZXswMxnLBd6roVCuVmokrZ8Y5KP+TUVHiJ1BMeTmp+X0lZiaWRi+SIoQXX4PcT8uZg
         HHVttLDs+yidNvW8QqZLW8LZtrEVoJftX9ZvZB8tVVZ0BNxKp2svRmwayVvLRNYdhvzN
         hBAoMUAbpQLjlewS4YPQ9BjaEw8w7M7/H8Fkw3WhaqzLtq/h3pPLeR4+UsNf61tZS8qG
         nG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
        fh=K9l9PubNhtt9OiPOqOzYskPK21S1b/jCTgi2DkvYLR0=;
        b=Cr8nksh9iaFLJqdhkml/93Bax5C0ZjeWuG+HIc1psZX9GAzbXhVGnBj+yBAJTKzyaq
         mcwGYVXcGqcwOQTYfpCFOWED/CXR/P8yWR4v4v3AuBgcfoc9OximfVldfFpqXi+TOg4R
         X65qCgAH8QRQKMjk3baBh6+h+KzZj8xdAM+rMeai7Yrf1fgI8knOABxJLka1ElTpOeL+
         7ZY23PdamK+p+r/zhOgeHk7Y8QS2U480lM8lwK2ESu4EHk6mceD1O/hYsM4o46xKCkyj
         UBy6wSGhPgDXxWf2EEbCfiyAkTreVyHfHIO7kO6ceVv4jPH9zeiVVs4uwhH8xxUY5jXJ
         qa9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557571; x=1795162371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
        b=AXhSTd6nftg6zWVJ9fo3q8eYZ4G3S4KS2l4zxMiB7uKk+5Y/IJ/q2IEe49wQoR3JkP
         pz4jG+AUT6R5bR0sQue3zMfIVGVjRregCCDygUWZQTjLYmt33xkMhXvcKZW88FPZbu7a
         1D5ciMNplSGl2ldSO37BNPgb4dnPqWf2WR3SyY9oyFrIXR7xK3Vd/mlxW8SxOQr5ZUGv
         MV82OoXdrBCGAA+aVWsBctSwNbyjjP4r+yyC1lFlA680HzPltfkoi6x35taetsBlayFu
         hpC5bynJtv9d4g6Gml6mxOEzgIAI6tH2Kz2Dy41PU3o7G1HTd6abZ6R372pmQ/1R2Ocl
         raWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557571; x=1795162371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
        b=Ueex76OMulL4xpKqFzuKJnEjUl3wluEf5OLhL8hobvAHQSEkJNZbqTUcBVWoXBQV8m
         Kw1kyJufQ1dS0JcRASoVERTqbtjzgPyN9svpeRknogOk/RV4Sgdoqm3e5BY/dm5HmEOp
         uQ8QxAyH9GxCdKW2AL39yxElxamc4C6TCMJ46zSZHLbINegPdEjqU6qzqaQCFZhyWieQ
         HXJKHkyuypQyauZZzSs0Gzdi+TNCKsFsJAMzZbrYAQ34XIPM5Bc7DhgRBGZDnwOhUsSN
         YqMB95G9r6z5p+iFedyunbcJAaGRyTe6IPxz+lDfaDSQRi2D3ImlnTtGLYA1IWZ0fhGT
         ngRw==
X-Forwarded-Encrypted: i=1; AL+hErHJaoFx6zUZYQ8xli/UUQ4z8dJMT4E6UrSTgj/K7isCc1iMglVdb/fcbkmnXrgQLs7bBh5yT3S9E0iS5jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GdAcOIbSgFdd8huQFf6LstCA3bWsabwz1PuczJFhNR+ROXDiE
	Sumx2cePIDlf9W4gt+gKaVzkoUrB9bvApAPeZDx+eewVyGhy+aM8nFGCH2By+vYbo14DzwquzWH
	qpEBD5j2845GQSpIfKkNSX5j3P7w6CEw=
X-Gm-Gg: AYBFou3iqc7f7B+6QeVs/Qv231XV47YWxirgDaAenQa534Nscksp1E9HOxURuZUx8s5
	iE5cEBFEx61Z2oD1dv2yMfRTt/gRbpbYyHsjFWx5hLsmwfxwGHPhqCHHk5s7ZKTjTg4i6Fcm2Dx
	tzpBCB771RMtirye5AdMXKDO5H4rzMWN/BHO8BXnAH/GjjE39DZNvhqIg0CZzdyDuKOY7jfLIue
	t0S44YIjf9hHRc2esAfeVm/AKEQzxZPc8EbMAUJX9j2RADLTXXWKSSFF9aXW9BszcciPO8Yywa6
	Mvgt7hiusMSzxF7K7lg+fuSrMVjK7V8JQSTLR6ICj0W8vD6/ghB0m0FrLd8eTfNcMDYbhXjJwrI
	LHpbUqIa/zhQD719hUnGRw9joj+z4NdmnrHSSPTv/CVjeoStT2Y1T64zzvk5zIScSxbpz2aKInC
	a51y8VmxSG+xpSTNX5ALa+cMsecpawMR/OaYi5Jqp5b2ohYgtcfwQtSw==
X-Received: by 2002:a05:6820:1626:b0:70b:af3d:2b2b with SMTP id
 006d021491bc7-71ab520b2ffmr975571eaf.67.1794557570842; Fri, 13 Nov 2026
 00:12:50 -0800 (PST)
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
 <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev> <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com>
 <85E23B83-4D3E-4270-B5A5-B835235093A0@linux.dev>
In-Reply-To: <85E23B83-4D3E-4270-B5A5-B835235093A0@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:12:13 +0800
X-Gm-Features: AclHuK8IkWODjhJeiKO05zNzg8ptkfLX6Y2XM_QUwiS0tVaj33IW_KAZbd5Fkn4
Message-ID: <CABOQOSX5B4zjORY0JZrt93899Af9V=YBFy7d5537efAQEtQgYA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:07, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> On November 13, 2026 9:01:47 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
> wrote:
> >On Fri, 13 Nov 2026 at 15:46, Luka Gejak <luka.gejak@linux.dev> wrote:
> >>
> >> Hi Jie Feng,
> >>
> >> Thanks for the new version. A question and a comment below.
> >>
> >> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng
> ><hjf3108@gmail.com>
> >> wrote:
> >>
> >> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c
> >b/drivers/net/wireless/realtek/rtw88/main.c
> >> > index e243738809..fe93c93b1a 100644
> >> > --- a/drivers/net/wireless/realtek/rtw88/main.c
> >> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
> >>
> >> [ ... ]
> >>
> >> > @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev
> >*rtwdev,
> >> >                      0;
> >> >       if (rtwdev->hal.rf_path_num > 1)
> >> >               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
> >> > -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> >> > -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> >> > -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
> >> > -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> >> > +     if (rtw_bf_support && chip->bfer_su_max_num) {
> >> > +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> >> > +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
> >> > +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
> >> > +     }
> >> > +     if (rtw_bf_support && chip->bfer_mu_max_num)
> >> > +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
> >>
> >> In v2 this was its own patch, 3/7 "correctly expose beamformee
> >> capabilities", after Bitterblue asked on v1 for it to be split out. Was
> >> folding it back in here intended? I couldn't find it in the v3
> >changelog.
> >Sorry, looks like I used the wrong commit on my local tree, will resend as
> >a v4.
> >Please ignore this v3.
> >
>
> Can you address all comments I have send, as they will most likely apply
> to v4 as well?
Yes v4 will address both the csi and cfo comments. I will send it out
after figuring
out the correct fix.

> >> I can see a reason for it. Without this part, an AP that is also a MU
> >> beamformer makes rtw_bf_assoc() take the MU branch and return at
> >> bfer_mu_max_num, so the new config_bfee code would never run for it. If
> >> that is why, maybe mention it in the changelog, and in the commit
> >message
> >> too, since this is core code and the support_bf check now hides the
> >> beamformee caps on every chip when beamforming is turned off.
> >>
> >> [ ... ]
> >>
> >> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >> > index 55f1d3d324..5d58dff4fc 100644
> >> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >> > @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
> >> >       .phy_calibration        = rtw8812a_phy_calibration,
> >> >       .cck_pd_set             = rtw_phy_cck_pd_set,
> >> >       .pwr_track              = rtw8812a_pwr_track,
> >> > -     .config_bfee            = NULL,
> >> > +     .config_bfee            = rtw88xxa_bf_config_bfee,
> >> >       .set_gid_table          = NULL,
> >> >       .cfg_csi_rate           = NULL,
> >>
> >> As far as I can see, 8812a, 8821a and 8814a are now the first chips that
> >> can become a SU beamformee without a cfg_csi_rate op. Once
> >rtw_bf_assoc()
> >> has set bfee.role, the watchdog goes through
> >>
> >>         rtw_vif_watch_dog_iter()
> >>           rtw_dynamic_csi_rate()
> >>
> >> and there new_csi_rate_idx is only written by that op:
> >>
> >>         u8 new_csi_rate_idx;
> >>         ...
> >>         rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
> >>                               bf_info->cur_csi_rpt_rate,
> >>                               fix_rate_enable, &new_csi_rate_idx);
> >>
> >>         if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
> >>                 bf_info->cur_csi_rpt_rate = new_csi_rate_idx;
> >>
> >> So if I read it right, it compares and stores an uninitialized value
> >> there. cur_csi_rpt_rate has no other user on these chips, so it seems
> >> harmless for now, but I think KMSAN would report it. Maybe
> >> rtw_dynamic_csi_rate() could return early when the chip has no
> >> cfg_csi_rate op?
This looks correct, will put in v4.

Another alternative would be to do:
u8 new_csi_rate_idx = bf_info->cur_csi_rpt_rate
and the != will never pass.

> >> Best regards,
> >> Luka Gejak
> >
