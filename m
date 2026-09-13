Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966B38CFE8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343198; cv=none; b=EtnrmP4xx/zpWpn4UF7o++Zz6GwYn7gGdWRQCbAUduLmpHi2O0b0DgK8xpa8gF+hF/RtIRMkf/BuK/UcKkMHhLE1H4/nrTD22kkrW3IG2ITFlFfxyRWMdK0p8gmGeMHxUiu6jMY+M5hO6fvIcguj4IdYc6LGs7rh5LL+RDMqVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343198; c=relaxed/simple;
	bh=Qn9lIkgmGdmg09kU+H9Bzm5YtdGfa5a/RA3U99GBCpk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=TDPtb0D0tQHSUyDVDjDwtGoHY+dDy2j2OGaRmUQ0HSneLBVvPcAjlHrL54pcZyd/ldqfYPmsLfZgoOqA2L42/dz/Z5ysFhXyXSIcF2N1sKnLQwj0lTl88RSqv+Mdd3J8ZUmkQU9+6qLi0F153OUHKrxrwYqRU5KxrNQhVdx8144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b352d9062fso3483818eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343196; x=1789947996;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cjOiu+m9w1SzNUGZg72zZnORRd0gFlaMH0tXwn0wV5g=;
        b=EVp0jpScH77+dFouiCEad2ADV/B+SdsASwfHzbrzOMT0FxwnI3EToz5ncbT/KDJy81
         Z/qQzkMUmUAG9kFN5HsFqPd1d/1k/ZY5g7UxajoJbgX1J1rUdbOkTGBAZhf2TSx0dV8h
         re+mEdRRoKolF16plGFCJ93AaUMSjjdq2oOJUWxyxsViiHBsPNr3SOZSwlyaf8cJWafF
         z9W/H/rSV2rZaeVbqhm1p3aGwuha3hm21SyV+eN5+IFzewZ3UK9RiHrDUuC/ZYfbybsR
         1HA5lnWsoB/2/eCHLG1HcUFj2XoknluYEqw5F8xTU8RucPZC1mC3X0IFR5f6LtcT59Ji
         BOvQ==
X-Forwarded-Encrypted: i=1; AKwUvBy483/F/EGzRvPOIC/xYa6hkmrJFUirTVkaVyRgO0uBxqj3X82+BqpB4A7/Z3v12x3nqms473d+rfH/Bt8=@vger.kernel.org
X-Gm-Message-State: AFuF++mUQEQbLTDOBKHrHY0ejr2LuaSSuVXf/TkLe9l1AtSLLcde5OuI
	2RDRe1Df7rN84TmUfjLywRHxjznutb7cMc602L+sz+jqllZEPSnBBgW7zjlWTzclyIBFwC+ZWHV
	ye60IM8qorDmhurgZSrOiiWwR6U8i7ix78OT7J8AyvTY5E23Wnrt+Ol+xR48=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e842:0:b0:6bd:e592:2c66 with SMTP id
 006d021491bc7-6c544cac0demr5509eaf.46.1789343196358; Sun, 13 Sep 2026
 16:46:36 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:46:36 -0700
In-Reply-To: <20260913234627.465492-1-aadityakansal390@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa735dc.3aa11909.1a03b8.0004.GAE@google.com>
Subject: Re: [PATCH] md: add max_disks bound check in older version
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: aadityakansal390@gmail.com
Cc: aadityakansal390@gmail.com, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 680b34a63cb3..f5fce41637f1 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -1693,6 +1693,12 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
>  			desc_nr = rdev2->raid_disk;
>  		else
>  			desc_nr = next_spare++;
> +
> +		if (desc_nr >= MD_SB_DISKS) {
> +			pr_warn("md: raid_disks = %d exceeds max_disks = %d for version 0.90\n",
> +					desc_nr, MD_SB_DISKS);
> +			continue;
> +		}
>  		rdev2->desc_nr = desc_nr;
>  		d = &sb->disks[rdev2->desc_nr];
>  		nr_disks++;
> @@ -1722,7 +1728,7 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
>  			d->state |= (1<<MD_DISK_FAILFAST);
>  	}
>  	/* now set the "removed" and "faulty" bits on any missing devices */
> -	for (i=0 ; i < mddev->raid_disks ; i++) {
> +	for (i = 0; i < mddev->raid_disks && i < MD_SB_DISKS; i++) {
>  		mdp_disk_t *d = &sb->disks[i];
>  		if (d->state == 0 && d->number == 0) {
>  			d->number = i;
> --
> 2.55.0
>
