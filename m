Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2877F3EC81B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417732; cv=pass; b=UWaCxMtEc8KB+EHYVBY/dmd+NIPl6LVbFPAM1TBpuyJSM9QDvBjgUAZAgoCsD5qh7/fSL1RrF1HLq5Ft8LrtuanJF4wdnYArntxo49lT8LTd/bbiZczDnmQFegUCYCeCR/7m/1WY75sh+8MMNWyKfZt5ns4rae+Qe5pl4mGNwuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417732; c=relaxed/simple;
	bh=lSN9DCChFA6DayRL8sMHWIHXXI+CEjHXAXVy1PgIcFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZQKRyFBFBplYjVKRrF2bKiOkJ3ThoRFvaMzilV/tJMCaq3riv4rzdECMjB6mABxH8JH2wsxaWQ3a6l8BpQcEElfQ9Ki5b6HmG30pp6FJw732gF3EtZsZcTI+0HCX2OyYBQROXz9QoCiesOQTYzsswQMcfXFuKJ4k9R1nmjY3o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XK071OJP; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XK071OJP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843e397f74so851652f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788417723; cv=none;
        d=google.com; s=arc-20260327;
        b=TqLxJ/A/Vle+oat8YvRuPHcoODMAs7Zl/NAjAhbug/RSVRhV+GC0FhK+ssyiCbA3ov
         OIEmmlzMNm83RY/Umqrwj1VZdQnEmxm9pBfIZXgKfw4d9VKz6IooGJRVo8oGj9KnBJqe
         QCGbj40NptfEKtNrklcUmiW+kLRPbjhPZgKtTFLGWxyS+Q/uXm8rQ3iqBo93WIwVmU/H
         lI5rTuB1tcpKjij92hty52vqvGbzjNAgN8cyBb3s4uE9EW6/+eGWSGeGilLu5lVYZXoy
         ljxlO8s2kdC9PSp9LtVjh+64M+JwnpKcPnzz/Jv8RBw6J5pX/dTXiCjIs/ADEvRwRmkU
         ivqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uZUB6wYVZBAtgUBstmC68loIx9lctfrU/baEzEgmg7Y=;
        fh=howd40b+9ogmS/YADw5nbeTFipgTHHqflWy756G1prI=;
        b=mWI5EBAl0PpUKNPaDyMEPJVs+OKEGn0UycgJDbOGDSOXyXh4R4LJW1bRsGF6fo2nHG
         d5bMBlqFNKWy9xVA5gpKmQ0QYzpGl+eXCiufMUPrG2GDdPU27YnWEQI+fcecpG/xCVxs
         3JBZ+rCSYFUcBp8jhrhatcxE9AKUXmFqO4W1RcET2vhjWo6i9ZH2RYKdRf5YJJ1Z7D2g
         T5+RNlTBNUfmhiXili5iwhUJjwBW7F/8VCaLHmapK59Oh+0wIboGLzBsJiqLNZ+WfcM6
         pL+sRNn7C11gZ/pY+nPAt2//zwbe73PQUP2IaYdcygZvgWB/Nm+DeOXKU5oL/nL5Y0/P
         dw6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788417723; x=1789022523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uZUB6wYVZBAtgUBstmC68loIx9lctfrU/baEzEgmg7Y=;
        b=XK071OJPUrrtgbin42/Ou/qMA48uDqKVIACShU/7s8UXLNOWoJbLAZ6riSuFciQR7K
         4bgEohqxDjefY/+c2qh4swBucvMu4sepfLxwC7r7EIyJsDQtn8Bn1W2MAV5zJkSI7Kam
         6nmKFq41qtK2/TiIaqXV6W6r2tPSRZZZXuWXMiereHOZgcGO7BLARAodpO3mBmAZWYTU
         uiVkfoIPH/XopjxzDZAuEzm7W9Pp6FIvTgdfwN9NDceGV8SsweUDeLlQzC7oNED7gdI5
         rUgYG3M2ypET9Ucw25hkIbuOXzQMmGhZNfUQzawioA7VzJGUp9l0SGx9wltrQcqa48DW
         /wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417723; x=1789022523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZUB6wYVZBAtgUBstmC68loIx9lctfrU/baEzEgmg7Y=;
        b=GeJPaeuvrouYFLuLTbM2jauK8Yy36HVMXUwyOi+qhOL42uyFerP0WD9HdQDkCXWOSE
         66AWAMuJVgYOOHvDUaDRVpH1Xnhj743kkQnB9Hu2wEaETZ/lRmaPUH5rg9gBuIW8wNdO
         sDH2bInTsH7tf8CbibZL+cRsyL6jw3MqxPGtgjlHhaVGAqiFSZeMY4TqpCnL2gy6pe19
         H4zqH+uKH8K5mUco5CKUf/lKYpipmbfVO8VdT1Th4oqH5lnWTweS+lzLtqMTxo2L4vbm
         S0SywLNatJcfI3RKCDY0TQRUAGCMYwiBlNKv0JlmoBEHCytct9Bf5RmkBpVOscMfvwuP
         rZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBydlZWYE3Nvhsut5sgKPftqJUuu61v/32eXtWLdkhhgvhIv2bWnsZWLTMCaU9LxdG4e0w12dCfKhivhkoI=@vger.kernel.org
X-Gm-Message-State: AFuF++nSHSfNHM2a9eR9SieCNFaCo0D8WooMQnS8NzielAmCWMAkUFp/
	5YIydNPuoHv1D6+C7Z6yrP2uP3ax9Om9UFQtmsSuD4hBrc5cOVmvWY2sH+efFR74Su0071CSmBl
	ksy1RO4wu8XOi94zrXiAcxTnUZot2waE7yrrdr4ycQw==
X-Gm-Gg: AYBFou1WON8aQ9Ph0h1qx7q3hjLhAJFATlg9OTlOHT/RTbTA+lDvP4fnPceOa+YD37G
	4W0RWMwGJIShU30gJHwjs5y6od2vip8qBhHwUR8ueIAgukU+C7L8gnDA+6WmdmHVQ5mMZYgIxl+
	UQwrUfMzsVpWyPHcQp5vFjH3j9jfFpHRuxVUaD7kvx4idicAT0P4e95j0/TMzf/DJCqm++/G80r
	9l8Nzn04kM6Z57kiiw6B49brc+BjxHhQ4E156dypYWx1k5LkzwaApifhGDbk3gmY6I6446TLBBg
	gNFqaa71krk5//Yd+cJAZOqSKqUH5DIH47nTCZjDM53NE7rE1lpMohPCneh+Dit0FLuMv1QkhYa
	yxKk4zCFpDEs5Arjy7YqnNBhfVGwbjoZR8B1X1iSJmw==
X-Received: by 2002:a5d:5f08:0:b0:484:410d:c9fe with SMTP id
 ffacd0b85a97d-48582438e6bmr1968122f8f.11.1788417723160; Wed, 02 Sep 2026
 23:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903062317.3928665-1-neelx@suse.com> <20260903062317.3928665-4-neelx@suse.com>
 <a9179480-4f99-407d-b381-5c97a1e85a2d@suse.com>
In-Reply-To: <a9179480-4f99-407d-b381-5c97a1e85a2d@suse.com>
From: Daniel Vacek <neelx@suse.com>
Date: Thu, 3 Sep 2026 08:41:52 +0200
X-Gm-Features: AcwNN1Wt0wO7i1klrQ3rnYjIPw7u1pzqx77dpuCO57Km4vvM2geVwIMsZ8iYoZ4
Message-ID: <CAPjX3FfnE+X-6r58eMGF17VP+oJ3c2bRvcc67EKrZvGmU52Dvg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] btrfs: promote async checksumming out of EXPERIMENTAL
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sept 2026 at 08:34, Qu Wenruo <wqu@suse.com> wrote:
> =E5=9C=A8 2026/9/3 15:53, Daniel Vacek =E5=86=99=E9=81=93:
> > There was no issue with this feature since it's introduction in
> > dd57c78aec398 ("btrfs: introduce btrfs_bio::async_csum").
> > No need for hiding it.
> >
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
>
> Oh, I was doing this already, and it turns out that we have a lot of
> things to cleanup:
>
> ---
>   fs/btrfs/bio.c       | 136 +------------------------------------------
>   fs/btrfs/disk-io.c   |  20 +------
>   fs/btrfs/file-item.c |   6 +-
>   fs/btrfs/file-item.h |   2 +-
>   fs/btrfs/fs.h        |  10 ----
>   fs/btrfs/super.c     |   1 -
>   6 files changed, 4 insertions(+), 171 deletions(-)
>
> The main missing part is the should_async_write() now always return
> false (you missed that EXPERIMENTAL flag there).
>
> Then it means the whole async submission part is no longer required,
> resulting the above code removal.

Ah, ok. Then drop this one.

--nX

> Thanks,
> Qu
>
>
> > ---
> >
> > v2: Introduced this change.
> > ---
> >   fs/btrfs/bio.c | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
> > index 771b7d598aee..db426ee6e587 100644
> > --- a/fs/btrfs/bio.c
> > +++ b/fs/btrfs/bio.c
> > @@ -569,11 +569,7 @@ static int btrfs_bio_csum(struct btrfs_bio *bbio)
> >   {
> >       if (bbio->bio.bi_opf & REQ_META)
> >               return btree_csum_one_bio(bbio);
> > -#ifdef CONFIG_BTRFS_EXPERIMENTAL
> >       return btrfs_csum_one_bio(bbio, true);
> > -#else
> > -     return btrfs_csum_one_bio(bbio, false);
> > -#endif
> >   }
> >
> >   /*
>
