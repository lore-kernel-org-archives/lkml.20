Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161418;
	b=3gC5x4PaKQl/6YChyVIkQ6Vjz7Fy4/hkamCafzVBHY1PQqC73I4xDEkQcrVbLg94JD69
	 gvYge1S0+LfbHDraPcUxwKiSe3xm1Xe5pwbIYGEAyrZLPE6/SIpjO8y9zZF2GaFcFcP3r
	 zU86ZTQOXMg8kT4epDSBUzysqtIsVOm30KFoL1t/jnf2kTCSUbk+ls5ACW7miJx+jJy5P
	 Jk58/rFS6hdyNKSWxMa7lCegD4EsahSl0AL2aGPcoE0X5dyT9LFUr8n9qhDHIHfrjraLB
	 qysfc9g6fBm6FCcldn2KPv6hhDDoFibOD3m+FBu4Y1ZBlWdAjm2i8XuXeM+k9ix6OlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
	b=Vb78hQY3LHCmpeSQkFY0hu4UylNEYBP9vTYI+1wk5o8UzLLib0X9dP1+XyKZKaNyuOGk
	 1jSUGy7Q2AOhWgc4bP0mozCGRx2BmCAZh6xxyotfPSnE8VU6ay7Pj8TsCcE8lb6OpfbeL
	 IjVm46fn2lTpwz4JGHL9ruvy+BtTkfL67+9vM0kypOrI4uVHMpu+nbIGeR0qqUdf/N8hc
	 YbcdObn/g4X11tYE2kmIOv63JbQuc9CU1KynHba3CdvhyBM586Kadr0SU/ZduFpwPXHXC
	 O/D1j1BT2W2OCmJ8EpeFXVot+56tu832jWu1CtG9GSKGGrTdooIDEkGbyG2oyAFLZ1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwWvNAIG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1378606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1378606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwWvNAIG
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6e560e00a86so113277eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161416; cv=none;
        d=google.com; s=arc-20260327;
        b=rVjmX00nLUSnBcvoj+LVzqVPayDKsHkddE6e7rPN6vVPr/fBn7ZbpfRwGFlBZPW/80
         PxDqGJnLdQL3bskh6YcS+PogwgAFg5T4fDkVdLhlzWmmYHGorCClUgzlAhQTRbxTJWit
         dFA0EABxj6e8xeVg0r4bwSOMrxfDYgURD5HQFX9F7YOGtWScgfSbYM5GfCUOsdbZcwr6
         J+k+UwS8mlxyyxGiG5PPw3jKUjAapeUpyWpWktAwOdoML9upoNwwg39oWBers9ozuZuq
         p5/gWPTfAm//LUMDZa4D27vmx6ImjOgHUr+8QQeuwM9kaHZYfH4H/Ls4ItZieGXkrXWU
         ZDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
        fh=aUf9TIJOCURfPB5Ct2rerEcZW4RVcAqvewy+V9v2QUk=;
        b=G79cWZzEmUKpcB1POJRMQQ33qGTTUL1pu2qbIQ2aeByHrcfQgYOqFiHGJKLl1mTjKI
         QrDpa9rS5tSwQLHtwZJQHkX9VHIclgZcHkZ8EF0LtbAqQSucxitOIofZy00PB5+1qQLh
         piYbOqGrShis7IS+szcNBKubL96i8ZqUvPAd8nqXSUuZxxsUOpFQJEhIDky4rbmgY1sQ
         MIh1Eh04MGfLx0zo6SiEYR6TlX70GzPVnzcZicgvRCxUXz4C/4y1Zc+VQojy7Fx0WMRd
         X3MVhQxMPKmU31QJIXxTzXPL6cnW88EnewNriuf0lVBmTqa8Ilys2nuHh5L08+vtBg8d
         3vBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161416; x=1794766216; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
        b=mwWvNAIGocK+R0mIUWgJrnkHMoAVEZkFD4rxUbnqbAhBM65ubX6L3JugHm/2hx6BT3
         TU/pe0ifcFVP/S6x14Li1u9FBQgPBLCZeRXabyOWtFHdNrEi9dFQcNR8AQj17ME70Mep
         FEH1W2yfItAUNWDTFCwUp95Umjci1t0ZrpX6fj/eCfzhQAFmjFiOkhXSSa2p+I1MFEPM
         inf+m42qS57sX42APJeHArzdfmhMi5gHKNM1LqhdZoD06yRaxNVsEfAdQLe8XZwvQg4F
         p8tru1eyrNodtmFfWle9ttkqNcpPNRVTKMonZpTkjDcYUS1xFdrsOZ4214IZkS4/lKnS
         gIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161416; x=1794766216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
        b=NvsjdOuvVe/6GV8CNy4WM+yg35BnBGMk1/mPZsctY8hrBJjIkl/uUJGqwuJB6DM95I
         7zEPCc/zdMxeur0NtQIcwC6Kw6uF7arbUHERsgBX3K7j0TpZqxcnraXZIj7MBpHCsTEr
         UwvZgrrQqVACUJsJMVIXDc7FoxBTD2vcMrESSf4qfpS8a0jiaPvdoYQwTyxoGVu5WWhz
         I3h3Qhaj5loq33lOjTMWqRNzx3F4Fhm3gfYf7Xj2wVF2fX/iLKFJUUyROxt9DqVExbe+
         ywFm5Pj/aXXAOuo06yypYoiN+aDy+S0Jl5y2jhAvCe0/mv+ufZvfh9/H/xsYlY5XI+Yx
         n2iQ==
X-Forwarded-Encrypted: i=1; AL+hErHGjIODUqKNAcQcVXcWmDr6wM4sfur5CvnC0vk90GIDb++TgPPA/UBH0M9VJ5iNR0IQDaNM4aHLAcFF2qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lqOVD3LmW97DBgpBG1efK8F7fTQaqAntKJZ5K+vvHB/Tz/1MS
	e04jkAPfMrH4L+tWlAciOYO1AxBSWmOeCv+O9u9QoLDZZvzooEZCDkdiDLk2UfnQTF7fqfWqO1G
	j7aean7P4yEmDM8IRjjpf4qaHMKKOk8E=
X-Gm-Gg: AYBFou3kILXapL7kDyLTLzl2Uc0kJ79IKqloXDlrYUax6Y8rT8YRyQpVa7MAgjB6J+Y
	5/PERcg+watgdb6tc6SSgNOll3VsbLnqmVono2Dtm5ppighqefICiWcf1X9+LAXzYvMtoMfNaEf
	nzAGLBT1FC0g2YigZZuUCO8TgRChktQU9/Eo5SNdoZ1S3ZSob7xMQeWy5lLgOOErh8ueC4z8xMa
	6BJ037nqrswRwua7IYOi2bQsuui52S1mm1WLw63KvOdmbBlcLS+p0+A6alNsS8jhuvuEB9yYT67
	gqAdoLipybSjtfqsqjfzBi/uDPu1mgyye9ZAmFaYL0OZBaL1Wgdf5taGc8R+Zv7rf5PH2AECMwT
	Xf5TwmbOkauTb9YKStBjILyFjtHEhXvZ1leobO6h6fSvv7zcmnN/pVPuE6RnXJYQBONWd
X-Received: by 2002:a05:6820:151a:b0:70b:960c:53d2 with SMTP id
 006d021491bc7-7170f1cefa6mr953045eaf.1.1794161416544; Sun, 08 Nov 2026
 10:10:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031070950.425176-1-hjf3108@gmail.com> <20261031070950.425176-8-hjf3108@gmail.com>
 <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev>
In-Reply-To: <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:09:40 +0700
X-Gm-Features: AclHuK_deMRBZS9b4i96HTqAJICAKUrHkmh4JZIXs4UzcR6GIwTXgavBQn1K-mo
Message-ID: <CABOQOSXFXW4bVmnKpE25U_q+ru2Y+NZQGPsBnhTVGuWH4WBkPw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 7/7] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 00:35, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Two small comments below.
>
> October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> > index f7391f6aa3039c7ba4d88249d968a5f1763ea866..f597edec290f64fda1c457812b240515360dc387 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> > @@ -49,6 +49,13 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
> >  {
> >  }
> >
> > +static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
> > +{
> > +     factor = min_t(u8, factor, IEEE80211_HT_MAX_AMPDU_64K);
>
> For a VHT peer rtw_set_ampdu_factor() passes the VHT exponent here, so
> IEEE80211_VHT_MAX_AMPDU_64K would match the 8812a version. It is the
> same value, so this is only about readability.
>
> > +
> > +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH, (8192 << factor) - 1);
> > +}
>
> This is the same as rtw8812a_set_ampdu_factor() apart from the limit.
> Maybe a single rtw88xxa_set_ampdu_factor() that picks the limit by chip
> id, like rtw88xxa_set_crystal_cap() in patch 5 does for the mask?
I feel that this one would not deduplicate much code and defeats the point of a
per chip set_ampdu_factor callback anyway.

> Best regards,
> Luka Gejak
