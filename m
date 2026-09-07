Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F5456DFB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775121; cv=pass; b=o+ot3HTtUcU1uY41EikjWhqreeU3bRomQzUBX9BPaSM2jUA6u1D1nJglh64YiL/a9pG77VGPeGN3j5xUap0boKOYTji6V/PflfraUNAT/fQjfeQVlRGP+VxGVFsft3oHwV0h0iI4bPLQfWpMjdRyTzuXwzKhb5p/bCTdOV8Ar9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775121; c=relaxed/simple;
	bh=vFc5gFFLnSdg3AHEZ9ahwwZhUTlpVkHewZfnMYHb78Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkXFs4pXpajoBekVkh1rHGx3WmsHf1sFJXVFs+pcvYxaoiBmeQ6t6PXnnuFQtIAGbDmk58KQaH29Ab9o68rJkFTE+kVsRw2sJ233uNDkjrw3qjHTV2OrrKjVak2XuMEeod7ukk+u3YYO8vKAQ/9c3tSvkPS7hi4O4j2CHL+2aTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eIe2kkLG; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eIe2kkLG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48436251906so3818678f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788775118; cv=none;
        d=google.com; s=arc-20260327;
        b=ofk4g9b1vihWmlTHcJEIZ/lk9yVB2kU4GOxzvLY+G4CaDliv0IocMGPKf1h1VKZOBe
         MBJX48dCts4YEEblOZT0p8etXjOl7aRDCP2RFsj8SdGeTY//Yaivm3wlBDZD3ONYEpn+
         p92XonCY4X9NkdGRk9T1Qz1a76XgiUk43ZPlrH3dB/BZtJn5eBeQsLIIjHvPZtdwsEpD
         YOVr5XL3HErpliUMSju463pC/Ak6j2e6fXqf9h8A7qCfIugMgd/YcEBteiAG5PGFHX8Y
         96f0SvdAaID/3YZ+PiorC/TqZlYY4CiOBMgEBgskU08dMEYFz2M8Fgf9LveeUMNTvkf6
         bZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IOR22vO2buc95ubW6uNPity+sc86JUX58sOwMSCA/sM=;
        fh=eaxAN9Oqc82DRmT7JxmDTzxGwpwEbSqPRHBnCkYKhrs=;
        b=G2GGCKlcAnaEPhaPpjn1Ud10okwMm0vwO76Z7LnQsBYjFuFZockvJKhwZ3W0SwuK2A
         mXWIobP8o29XAYuKDLY9X9seTmnz1aMNVvaI3J6Y7vDz9nxj3vRpraZrUBd+vcUSorS4
         zHzj22COuWB2G349IiXQc1caAxVVJrWugqxH33Hs8/q5nU0yPPwoYG8tKeqIW2YmDUN8
         jkaMInCmpsCB0U7VhW4S4pqQwwqUp84ROpN4m+OmDDFFJHFknsI+bW/gz60bB5TbRqBK
         grEutLBI4B3+C4hmdbpUc6n2HS240wDXPeTVDiO7osyDEEbcr7PKZPTQWuichsH1dP5g
         1RTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788775118; x=1789379918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOR22vO2buc95ubW6uNPity+sc86JUX58sOwMSCA/sM=;
        b=eIe2kkLGwC5S6RZiJ34kzVZEPTvciowqzfElkw7LPg3yeCwAWM5Szl5ppK2rh6PCkZ
         4VCdcHSc9blH5eorHCHmguejQyEYz7gRECoV8/4ySgz+hnKVGQMm/wkrbwQ73JfG0B1R
         gl0fCeZztgSMyPNIXiBRrUZi6uPb8tNKiZ79qvBiatUoBuPjMAKQ5N1pdoW6OXaIpKt0
         AUpaDc3A2Dy2KGHxS0u3b8sh3/Pw0opc/GkW+lRdeMqtC/J3jwXWbmHX80bPWoyGhIzD
         5Q0TH6Zwuov613iTytJetsCcDDcodmmTTj5DnNV12J+I5rdIc42d+YfT+DvqYy0RYMeK
         WFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775118; x=1789379918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IOR22vO2buc95ubW6uNPity+sc86JUX58sOwMSCA/sM=;
        b=pB4OYt/CvjyzSaeUNmXiw6Zxcc1uMVGRmrn5xY0SA0ZrKRht2yPUnR5ZAb0DJJK1mE
         Us22H8ZBlghuRRvky2L/n8JC2lIM4aPLrrOHLetCwPQOeVe0rj6mTe+PNQ2+AR63YXpf
         7oUr5vh6bbNhFXaIyX/dJCcRsn26SuGzujNp7DAhK5c0gVVzuIGP+ZHcmy0Nh2wP9b6v
         ospH8DYBWcmTXMVkPDcqmu1AYQU1HuxZ75ByHrM1tV1HWBtrFU+EktwLF9DsbTv5tkun
         BtCj0/IAXX1wuQOfIA3RweZROk7MyiyEh+7K6l3aTJKSLU2E/RiyhimOuViVucZH7Sxk
         rB9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhW+mm9JZ1YnhbZ8aR5HGMnVRgigUv0KxIRa1D03yfyi5bKphVaAt1t/096D6N2mBGQYIgX9y/aMHIvLM=@vger.kernel.org
X-Gm-Message-State: AFuF++k6CTiuoDVP3ZAp/8DaZOyHlDLOy1Fhxzsdooa0EO3c+yWa4p5+
	xw71YT6k0Ine6V8OLA7logNTmxMM+zNmwqKwHIDfALAFZ6GGISY0nQeoHq3yLKlMZf9EYXkfnZi
	AWNQAGiZTdaHWC0qitFM53+cLJQoeNUo1smSRDyd3NQ==
X-Gm-Gg: AYBFou1YslQsgzAEZUbTYDHS+t0yIJ2J9VRx8qb7OHKJDDZnrFWVVZsLwfLe6Dwii6r
	24Wd+VmoyEPZetlHV1UaNGwSAVDVm52kujHIk/AxE0PuLq1UNhAvPbXFNLr488mAp/9m3OXxNnF
	Jzshuurt8+fWn/byo7T5mIHwe3linGo9Feh3zCVSvm0bud266Gh2SWKmVe1jQjz5IFwkVbm0qMJ
	ZI4tOOLhnCcPco2/4CiAqnzASdT4YjCt9uftjzc/6gmbP9US6aKx3BbCC6J4ElUWsgHQaVzKuEJ
	Y08x9BI3q59JSeRQ7FbDaytOAj3fZbxxy6TM8M7I7sQwO4gZ8uTe15iT94gwkOHeu3fjQ04FCzm
	M0/D+OGjzYxK5It7F6A6fgZl+Vd5eJaSfOnYin7intg==
X-Received: by 2002:a05:6000:41d4:b0:484:3310:c4fc with SMTP id
 ffacd0b85a97d-48587090793mr45075973f8f.23.1788775118342; Mon, 07 Sep 2026
 02:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907044801.9088-1-hemanth.selam@gmail.com>
 <CAPjX3FfQ4X4Bd-1-_Q3h4azLM98vnJLfZ8TvduPK6zf=y==Z2g@mail.gmail.com> <20260907092247.GP9053@suse.cz>
In-Reply-To: <20260907092247.GP9053@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 7 Sep 2026 11:58:27 +0200
X-Gm-Features: AcwNN1WxUpd2kv3I_DLYS1Vwd5ZUE28k_Gsdkb8CO7N5z5kgblu69R3OgC2-Lkc
Message-ID: <CAPjX3FcQ4qELwCKdfvrP5F=tiDu9zLztfgF2JGoAuc=HoK_k_Q@mail.gmail.com>
Subject: Re: [PATCH v2] btrfs: fix typos and repeated words in comments
To: dsterba@suse.cz
Cc: Hemanth Selam <hemanth.selam@gmail.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:22, David Sterba <dsterba@suse.cz> wrote:
> On Mon, Sep 07, 2026 at 11:15:33AM +0200, Daniel Vacek wrote:
> > > --- a/fs/btrfs/raid56.c
> > > +++ b/fs/btrfs/raid56.c
> > > @@ -953,7 +953,7 @@ static void rbio_orig_end_io(struct btrfs_raid_bio *rbio, blk_status_t status)
> > >
> > >         /*
> > >          * Clear the data bitmap, as the rbio may be cached for later usage.
> > > -        * do this before before unlock_stripe() so there will be no new bio
> > > +        * do this before unlock_stripe() so there will be no new bio
> > >          * for this bio.
> >
> > The sentence should start with a capital. Perhaps it would also fit
> > into two lines?
>
> Reformatting whole lines makes the typos harder to spot, so it's fine to
> leave it like that and reformat at commit time eventually.

Right, I see. Sorry about the noise then.
