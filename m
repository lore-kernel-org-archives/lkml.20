Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192299;
	b=hCJ8CWHV3GrScErIGrJliyxH3tQY2qVJyruc3nAN5zOX0FvHcYj+G5ndJG03T/TD2IE+
	 6pN72RP+Fc3qR2xA3EzIWn3m2f+trqJCgUxldsNZcepFb/uakcqPoOzzphrUVR5cN+wQ3
	 BG5qQX6+T3SX4O73I3Us6Y6NqtrrPGyRZ4lllIXfdezFcQIVoZgv9suZRuhvOFpX9aRNd
	 6TugCDOglUyVkjxgVrEmItLVdt/672jxSIuH6ee7FFxBFF8CLNR+U747NhyY0gzut2o2b
	 HDDwgQKuA+Nqh0/M98+RKgX4x6td9LtTYAA0cEdRgvPwIIFMvpEmrXGMdVqnb/xUH5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
	b=o/UyB5v5vgrQ/PngSkSuw4aqXUN4bMxAxcKUbGVJGC9XnO0hoc9lA/pvbr7IVSku3Jm4
	 Ygxpc5my5nVD7XMDqPkJrOqM0JKuZUPvjPoI7yhUqCXjgXVQzx3rDFDcX9m35fFpPW728
	 4O5EXYDo3iZLlO6vHskN3ET7eu1vwWt6N3Lww1a3kYGoCu9wOKdkUKbFFsFFTXu91tvrk
	 lKVcRhCo7NEk7/zC0tWGb9R2Osv9dbj23gJYQfV1g2KmNeNdBK6u2OApuL+p6O+okwqYJ
	 xbQTVP/vvOKVagNfZci4lvm52UcseHD92BwvWVoBRBXYOxzQjeZDe7jY2z1q48ZJXuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ja9zjxov;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2746606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2746606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ja9zjxov
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso215153eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192297; cv=none;
        d=google.com; s=arc-20260327;
        b=Omhs4VMvCAJ7RbiWTh+nZW2J/+pbk7HnwWVqqSTVyBB91TzWW3VkIDYeX3E+ozTKsB
         X7VWnNPeNGMv3g7QrM2ZHk2esTz0PhiBoeV8mNFsaE7iDtgnJHk/7dp5bABYv72dHSDt
         RgFv2JrEVHSfSfzTFnUlH3KhrzKWSLrerraOp7h2QtPNwaQHF3b+kr7zExYxP2Q/BmZk
         9p0R8qFR71JDigNTA8JwTxmB/OATauMBZyJDUlRuePzAf0EnRPF7QhHeuNXgcowEKdPe
         6cJV0EBACc9pHEUTCOPz049axbfjhVxf14ZuJrA47r23p9o2veL1ei4mwjH60VP1aA/g
         bQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
        fh=sTEXq3fN0DW0flFBH1R1vPF0jTVkA8vlPPW5czXJByE=;
        b=rrLrvGa6slYYFjQdVQcYjr2JghisvBaumSQEEm3gbHFnkIlaSQa5Q0YvKjTspTlrY7
         o9ksYrIwUTiwcGfaMlPJmJlb1u/nkvSlyHsZzflpRyPPAJrk66NW3hj+yXRVmzpLBhzV
         ATE293S3I5C5qs+N2mSL9UsRG97aeiYNV3iAYWFbfoRBZNOBK9uHrVdgvVwW9/BBqEfz
         p58vXFZn0T0qrj8DzSwz2Aqt9XgbnzWI3vEYRAO2E2OBfdzcyWJfT5qMWhl28ipmDo1e
         gGcv5GNoOio4LHey7G7w9KLrUnUy4jyLyGI5cXYiFh4PhEB4Pzvr1OMgy2CUeWUHGHJg
         uA6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192297; x=1794797097; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
        b=Ja9zjxov9lnZx50vVsHsgBa709LcSze4diLb+Xvc96qVi5N4M6dIdkmOP7wFrRAOJR
         jPRnS6BnA57LI0n4/AzyFmcieHVK91lKhr0GJaLL3RF9nJTETLaopDX50azV2Bm02c4s
         1giBZzLW+X2neWi1poGDe3F4sucnxFRYaRvp8yHqpb3PTyhxnsBN66mMwcefq7n3RfCL
         OlFC0pHeav0oaOvJfc3aU+41YUwNlymNKk8eFzA5Xu8UhJQugssHHFg8RihQdYSPBZTn
         mqRdUZoLkjqKOmIjIsikona5sEPTI5Lkm2R14y/vscEJEplAMZwkVc0V1Pe6jUItclA3
         wfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192297; x=1794797097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
        b=Fu9doIooZ8tG+86/T+NU/82CSiERHuTqAHGlUva5wP23zhu4jSTbGTvQ0denIKU46D
         hUJdyfsXDunN/8vu23/Csk/TM4HmONfXrGkRV0PWxhLpN4whG0S8SUCtKxbUtQK5F915
         zlG1yFyZ81mX+kNADe1xswq8vg6NAva8j/Iu9YYFhZccxcD10EvjGgXPucn7rm0tdNs3
         Bvq8WfSDrZw2fMiOQjP0AtfSCFaNPkAEeMMXTcGWTAaS3xJzJNq5G/VjhfJ02vuWvhAm
         d56c4/sFX8/qJZFB0UcaT7zRpotEXhIp7sU3fAfX02fkkgJRPHI/rRILsbWti9DDsdUo
         f27w==
X-Forwarded-Encrypted: i=1; AL+hErE+wg2LB5VpHDM6IIDDL5wjABNwID9tPCZaW3gr4exGDMvO2leHJ3zSz4+JPODUy/VZr35sdgoY++gwU/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ViauJFnKCG70VI6UNd5rneFRZBPGPvKRds7ncUJefLvfpBb6
	tgvO0X7cpy6+L3eHSSEACNIgZ/4gcJPEAkRa666mFq3RCoJG7ruC9YkfjCEaj7ri6zUhQWBKxe5
	+GY92xH+vIocdqay6B7mdR+2NmgZdZo4=
X-Gm-Gg: AYBFou1TNopofEQw3Ohmkq8X57RfFpEvwx0eHqO1QUkxIVLc2nKoYYmmMKmCFTO203Z
	cEaywzZ6kGN5MlG6ablZV1CUw23HH1ix9zre8AGWj7TCdQpuX2mfeieWVRHtzYr2fhWfQFASF+D
	abvY1Gk4bpwR63lv2389cxfUi9CkADS3HfqaMnRmPmC+P3myyDHpfyygI0s/Ugn48lOdfx2K4ce
	n0uXXJpkFvLicJcqQv6+UxEElLPeZFJATdm40K+LOdC+cPNYRb6+TJwBZhUCTHXJlx5TWdASlng
	1hu9ksZ1jYoS+hgSBE76WNsk1ejgFUoy8t7tucpVVIGt2yRlgVCfhUC1Y6qeb20YGghwGBQ8PDP
	OmKB7PFFnh5uMQG6P6Zm2i5VAoY7Ys+JKRx4f42AAbkcSAVVX1pJPVpcIB8tPmSzPz1Ku
X-Received: by 2002:a05:6820:5711:20b0:702:efc4:807d with SMTP id
 006d021491bc7-7170f2f48c0mr963288eaf.49.1794192297616; Sun, 08 Nov 2026
 18:44:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-6-hjf3108@gmail.com>
 <8fbf3fbba7d94b55b7510a57ff376e8d@realtek.com>
In-Reply-To: <8fbf3fbba7d94b55b7510a57ff376e8d@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 09:44:21 +0700
X-Gm-Features: AclHuK8bKOtdBlghNCWobQHbMdIwtiOlN7hof4nDKn4NvNui8UWphWLdfR8rlFs
Message-ID: <CABOQOSWLNQC3SHj1AUEQ8SmUAig-8xHGm=GO6w8EN-nSzy-7=Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware
 use all rates
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:56, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > The rate mask is chosen based on rssi_level, however rssi_level
> > is always 0,
>
> Should we fix it ?
The vendor driver for rtl8192du also doesn't do the rssi_level update
It is not compiled due to the #if 0
https://github.com/lwfinger/rtl8192du/blob/master/hal/rtl8192d_dm.c#L2624
Therefore, I'm not sure if it is okay to port it over.

> > since:
> > - for rtl8192de, call to rtl92d_dm_refresh_rate_adaptive_mask is
> >   commented out and function is not implemented
> > - for rtl8192du, it is also not called.
> >
> > This makes the branch always choose less than optimal allowed MCS rates.
> > Enable all the rates.
> >
> > Test results (2.4 GHz):
> >    before after
> > TX 6.4    12.6
>
> How about the rate before/after? I think the highest rate will be similar
> or the same?
Highest rate will be similar, but I saw it using more intermediate rates.

> > RX 32.0   39.1
>
> You change many rate masks for different wireless modes, so please provide
> more experiments. Especially you need tests for a clean & noisy environments.
So this patch by itself is more of an RFC, and I might drop it in v2
if it changes
behaviour too much in different circumstances.

> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../wireless/realtek/rtlwifi/rtl8192d/hw_common.c    | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > index cfefbe86380fbc..0c921c049b5178 100644
> > --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > @@ -903,7 +903,7 @@ static void rtl92d_update_hal_rate_mask(struct ieee80211_hw *hw,
> >                 else if (rssi_level == 2)
> >                         ratr_bitmap &= 0x00000ff0;
> >                 else
> > -                       ratr_bitmap &= 0x00000ff5;
> > +                       ratr_bitmap &= 0x00000fff;
>
> This mask means all 12 OFDM rates. I guess original design wants to select
> higher rate quickly.
> ...
> For N mode, it wants to jump to MCS rate quickly I guess.
That makes sense, I will leave it out for v2.

> >                 } else {
> >                         if (rtlphy->rf_type == RF_1T2R ||
> >                             rtlphy->rf_type == RF_1T1R) {
>
> [...]
>
>
