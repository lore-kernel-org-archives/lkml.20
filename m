Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE214F649B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792500; cv=none; b=rlQ6YoQRI/sNf3/sGCFnC+JcKMOeJy8JqNbLnR0FKzfomtey+6MCb6HxvUWrDShs4P7vCR0ErjkVuH84JfUZBh/9r2j0gzagi7sN9j99dCnd7CNNiITpPj0xitmtB+eG7btlzZB+POMukjeztUOVwSLx7+pwYCzyzyDa5Zs+G3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792500; c=relaxed/simple;
	bh=E0L90Z8k7uiNby0Rmgil4xEwTSX+gJc1C3iKm4pcpes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfvL9WZ9oJoS374veP5tL3/Hc+tkqxM1h0kTzeKf7hwXBO/q40i8Ga1Qs27VEZx+0waGr9WiScQP2pjVNWFf1NTr8DR+hYUhNsGtkBt5z6EDlPd2IRIv1piehcq+SiFDkWn13KGjOuzdC1L/efjoLYTYdVYOtTAsWuLYEqWfz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso2061341241.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792497; x=1789397297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=417Vq4voeTSrz4Uh3qUJbU6StigGvlQmE4Y64hf9ijE=;
        b=Jw2YNWu4oQDc25u5k9HOsa7Nunr2iBKqaLRJx/WsJP4/6llVZ4QqBGNL1g+NweadfR
         FfMoahTdqDEs4esbImLH7YgtV+Gt3+FMZa7gWlBRVexd7f4OsxZBNghjm24C3qykls66
         G9OmeYrbGGlMww/+hjekkyLayRqZ/VKSATtGa4qj3BrMaoXkG1WcaoERv+bgPOLBn3HV
         NC1sKnObqq0FFAejpoVcTA7SLTkf4KWsFDwpSfz78ZWelcX/rg59qYPH3l7rgm9KgMZ1
         4tRCx5tmKKlux8FD3Dc5Dz/c3f1XxkNzi0W3IZXb6fSAMBJ+yvbrHBG32rRgHwjiXIgh
         9WNA==
X-Forwarded-Encrypted: i=1; AKwUvBxZEDDZE8MJO6sVf+gEwzo5BwLNSaX7QJ2FUKmm0sLsGVABLetGapOhMRMXQkgvgszZNE2bBbcqok2FBWM=@vger.kernel.org
X-Gm-Message-State: AFuF++mDpg/L38V4LNZqkLPwQb1vrfkgU2/cGiCXBAyVbZr2ZJw0KMeZ
	9mArrTVAq+LCZBCrZL5Wk8C0cnjh+nbLu8UkVYfznOlCmQ2fyz4e+sqnfegwYLyI
X-Gm-Gg: AYBFou2mdJnpGc2418Fm+JNxvJmD3YgdTwLcg6qQfwI6R9Tc3mZCnelUuq1wodWmWKf
	r3xeBsRfcclY26EwHt8z0x6zn54CK9P5zwMTNSLBLXl9rPO8K1SHKqY0SicUqLowb8dSixuLBRo
	ZjYbDmDbikaDvjx/ekeRC5VoQTAP2p5rUr7aUCtxpjJejGXpkkCeLbnKF3+mdxD1mgBgGT1E0xc
	iHFjAlkHWI3eyQfWB6hF3t70EwegDlHv8kmV8Qz3o6Gcnm7FpVzNtYbT8k+1sM4vTXZ26qQCExY
	S1bkdWqfXlH6+/jWwjIgHJezraNP9FTqQiDiajdBMXFsWiQV/TYCPNFZX4sQJHTuh7VsNCuRzws
	BPXIbb9wr3+nKE61wl0JWr1SgXILFTDbLiaB9ONOKymyQcW8q5Z+btZO7gCT1m/n2Q0K1wGnDod
	9/jZ95WQ6LAgj9r1jMZGoEeV1Xdehm0Rqn0gwgX5ahOsWNB2EVaxf6Brlf2ZpA58WqRM14B5lg8
	YhfLuxkW16K4XI4rUmC1xM6TA==
X-Received: by 2002:a05:6102:3e10:b0:781:1ac:8232 with SMTP id ada2fe7eead31-78a4a87907emr10618554137.5.1788792497091;
        Mon, 07 Sep 2026 07:48:17 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee1c0cdsm7457228241.8.2026.09.07.07.48.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:48:16 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-783fffcfb96so2800138137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDrXG4Sfj35VjJAASp6BkpCCQrCGY29wZCdC69de6lthGfDbiN8Fy6raPreAQ06qjKkOecs3xc7KAc+o8=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr10514501137.3.1788792491716; Mon, 07 Sep 2026
 07:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com> <ap7CaVj82BJZgjf6@hovoldconsulting.com>
In-Reply-To: <ap7CaVj82BJZgjf6@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 16:48:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
X-Gm-Features: AcwNN1XKT5JMOm2wspHuB0_T9Xeh0iYlXl0ZBuZdAHt4KZH-NPNXF5M72vmaKSg
Message-ID: <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>
Cc: Jakov Novak <jakovnovak30@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	Ulf Hansson <ulfh@kernel.org>, Guangshuo Li <lgs201920130244@gmail.com>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 7 Sept 2026 at 15:55, Johan Hovold <johan@kernel.org> wrote:
> On Mon, Sep 07, 2026 at 02:17:45PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 17 Aug 2026 at 10:13, Johan Hovold <johan@kernel.org> wrote:
> > > On Sun, Aug 16, 2026 at 05:38:09PM +0200, Jakov Novak wrote:
> > > >  Currently, the function vub300_inactivity_timer_expired, which gets
> > > >  called in a softirq context, calls a sleeping function in the following
> > > >  call chain:
> > > >
> > > >  vub300_inactivity_timer_expired -> kref_put -> vub300_delete ->
> > > >  mmc_free_host -> cancel_delayed_work_sync -> __cancel_work_sync ->
> > > >  might_sleep -> BUG
> > > >
> > > >  Fix this by replacing kref_put(&vub300->kref, vub300_delete) with
> > > >  vub300_queue_dead_work(vub300), which does the same thing, but in a
> > > >  workqueue context.
> > > >
> > > > Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
> > >
> > > This isn't the commit that introduced the issue. The blocking call in
> > > mmc_free_host() was added by commit 1036f69e2513 ("mmc: core: Cancel
> > > delayed work before releasing host") in 2023.
> > >
> > > I didn't look at this in any detail, but having that call in
> > > mmc_free_host() (e.g. rather than in mmc_remove_host()) looks wrong so
> > > perhaps the fix really lies in MMC core.
> >
> > mmc_remove_host() can only be called after a sucessful probe, while
> > commit 1036f69e2513 fixed an issue where the last probe step failed
> > with -EPROBE_DEFER.
>
> Sure, but should you be scheduling rescan work before all resources have
> been set up and the host has been registered?

I would like to defer that question to the TMIO experts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
