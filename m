Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BBD3BCD2F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342649; cv=none; b=F7MiJP0UKL5VzlkSr7Ck62WluNIWrJL3P7b2lGgbFviZNaQ14ywRtibbfkXg/cn/MOh55xxpRWWv/eDNL7RW/4tHIFNzemEBQNhBexnllhKjU83MMYWqSv+ncltZnduIzNdYcCv58syxydeMoPhh07sQ4GgHGOrdcGyw3fLDZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342649; c=relaxed/simple;
	bh=YpUP09OyVbTkYiDq4W7DT4ucZTXStfn0jkAGCtMQPyc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=OCXOUwErvGX56/C7kwQzrFlRAKgkD8if6m8JRunkPclAfOonp+f0GqrrdWUMiRcdyd6oFhpMs2MSP1818G0A+XaUIVf2yhhLlTuQXTJu69qfSZmrvZZQnMzDd1DNr379DCnLNDkR2+jWblF20dXi7N7pJ7qRodEXulK/QaCKWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8052a85c6a0so2525352a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342645; x=1789947445;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=np8KSvSuHAU9TGAQM2uGFye4XuOKuIWYRdmGyDZ0FT0=;
        b=VDXpa5E9gF5uiPJ4SYqwRJrxp1Nuf0dykQvm+DsQG2U6pS1TXwSlsiqNP0i6E3+Bkl
         pWXWHylH7bfCCoMmrCRyrcbbaZkDc6bgIP0G4OzgZTib4wZ+lWxV2KxbiEVLkSQKa0N7
         Z2imHkzkuFxLbZMJn7VJB6pcIpbiUQrvdD58tQmmNPu6p3OW6HpZa6mwoGOKZifbSbRp
         9HcPbZ3Rcuz5sCb6w42g5RYfhl+FGz/5xwJE1HeUBCF9n70yeMcXoWeIexOBF9AhW89N
         l7VzgUCuWP/W03r4M+ooqKrKK298AZ5A3Z+Kqk4bRa/Uyabt6Cf8q3z/F5oj9p9hxsWa
         9q8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTJGH91FS1btvz4zTVMR5OPiHslX1LAKZfR0rlRGyuUx9GgOYDy7BMKB7FchtAd9LuTsWjGfBI73ybQ9w=@vger.kernel.org
X-Gm-Message-State: AFuF++nMAOfM7I42McHjGF0tKlUn2iKHPd7jG8+uNNVuzj9cvACyf1y2
	MetYjRaYRyOWzTkKGJNYfv7truAeF1iVlqRy51+zvTR9sSurgns+nkAq7yupl4msCpCyAfb1/2N
	pDa2Zjarwp3xAujK1LV2s2sUIiDLEjPQFjsqhIwGzRwtbzriV9TGrdqw11jU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca1:b0:6b1:535a:eb8 with SMTP id
 006d021491bc7-6c53fd884f9mr14268eaf.2.1789342645581; Sun, 13 Sep 2026
 16:37:25 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:37:25 -0700
In-Reply-To: <20260913233717.464321-1-aadityakansal390@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa733b5.f81106d8.2ab401.0039.GAE@google.com>
Subject: Re: [PATCH] md: add max_disks bound check in older version
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: aadityakansal390@gmail.com
Cc: aadityakansal390@gmail.com, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
> syzbot reported array-index-out-of-bounds in super_90_sync()
>     UBSAN: array-index-out-of-bounds in drivers/md/md.c:1697:17
>     index 124 is out of range for type 'mdp_disk_t [27]'
>     CPU: 1 UID: 0 PID: 10197 Comm: syz.3.1362 Tainted: G    L
>     syzkaller #0 PREEMPT(full)
>     Tainted: [L]=SOFTLOCKUP
>     Hardware name: Google Google Compute Engine/Google Compute Engine,
>     BIOS Google 08/05/2026
>     Call Trace:
>      <TASK>
>      __dump_stack lib/dump_stack.c:94 [inline]
>      dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>      ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
>      __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
>      super_90_sync+0x1eed/0x1ff0 drivers/md/md.c:1697
>  ...
>
> super_90_sync() exists for older version 0.90, which supports up to 27
> maximum disks (MD_SB_DISKS). This function doesn't contain any bound checks for
> raid disks. The repro wrote higher value (124) in raid_disks sysfs attribute
> to trigger this bug.
>
> Add bound checks in super_90_sync() to prevent index-out-of-bounds error. This
> bound check hardens super_90_sync() function, such that it can catch max disk
> index-out-of-bounds coming from any path, including raid_disks
> attribute.
>
> Signed-off-by: Aaditya Kansal <aadityakansal390@gmail.com>
> ---
>  drivers/md/md.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
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
