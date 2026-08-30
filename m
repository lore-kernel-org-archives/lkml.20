Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917D25B0AA
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060378; cv=none; b=n8FuGo+MyLEcxZ6CKQyus1uz144A1XPrpon+6qluzOqxNOwuMPGNKKG2D2oCK6cK/4YZtLLKsiwKFuVRXadaxDUFZVpTcRDkiCjjIEzS9TuRx96WJm5FBaawmRt1nTDb1noeF873rPns+O/6DixhIzBQJDE6NrGZX4aBa1UJcXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060378; c=relaxed/simple;
	bh=/NmAwV4HAkiSqadapHNThh4D4jygEQHMxtGudzTwcQI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lpTTRdh/wuPI+AjxqFL+11SNhlW861ZZMj7f/Vk3ow9hpuwmIOSef2Qp6gQqBseK0Ryp+/jAUF1UWhnVkvykVoFINi1qHMlS3EyPTAp0NkHcZdeaZsrPsaC54ef9LHgYsb6tkqh0yz2JipOHXgiCl4pYC85LrYwdUdIz6Cc/wcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z2mt7GXn; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z2mt7GXn"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-861feb6d61bso4198567b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788060376; x=1788665176; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWu2JtKNi0WS3R6GCsF0Zx1kqelEWLcREP8bu09AzsM=;
        b=Z2mt7GXnMT/VXopQEuG5WK8Qaj/8b5lnOHVqEjPBfhj1dy/dCE3pQf3B18Uoo4w+Pj
         AwRvDPKiu9mU2E2JRqUFYKK507nyS3LUe+ph2770FKTj1M3uuoUtSDJWrtEB36D0Wy7G
         uP1hvE7nRF0Q6LHLI7CQq4KH6CHAWqJmAdnYcJMpPyvJ5tWOyltEetPoDc8cJx1j/OH8
         GIt4VPLNobtubeYiR80WzGK4PWRPbefaL2KEk9PSmdga6AUonR4Cj7wvFuK/pMYHjz5s
         qDAhG3jyFQFre+2frm+Z+FMvgGE+M2BjLKsSnhCiVu2Fsb/2xjyywZxcMbd30mOFg8NW
         Ng8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788060376; x=1788665176;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWu2JtKNi0WS3R6GCsF0Zx1kqelEWLcREP8bu09AzsM=;
        b=D/gZTSo2boXr/WYMNYQu8HfeEhMMCQibrz1MCGIHXQ9LIp7CTF9AwZ4at/Q1W/kATj
         qwKdHhmBhg+04M6pp+fYtP9ePoB8NfBv1ckFBv7BcRUJ18wbvA1uQnudZgd5MrsdU4q/
         MkRKP3WIOySHTS3hJjdAhhc8TSafh9Z66QeXJOdp8vCMbHjDBmXvbsAWVwpwGFFAyTdr
         iv2bZkzZPEdaLKBTae6W7kwTSb+DuEt+EKre/qGOMShyBlwUcf5YJ7qNFTMe2tsXKWjM
         EcdGYWHiCoqlS7Vgq1QFgC79/FreNPeiEG7gXI07i+2qybNoWymPDBBjt3u1k5cpfXIJ
         jY0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYofO6PjpiZ8E1wWKILtnYWIeF5M2e/wDe5B7/XV/WbATCROv/ikN9FVbG7ijA+mupmvxM1BAG7mJtbp0=@vger.kernel.org
X-Gm-Message-State: AFuF++nhkNKmVhr9iHEqb15SJi5j50t5Q2kKWxQJo+6fuysxw9//d8PZ
	asSrLK5xSZu9LE5zuH+QZVLO1IGhZK5LFl8uzzQQWc+UeTTxwdSc/FV1VYLkfDGpLQ==
X-Gm-Gg: AYBFou3PIfd73fOnBVRK9YLYsWMh9Ghd/wpFXGzHChrELNPz1bPVf4H8Cp78QWsZDAT
	JeixyrjJ4hpKHTOxgZUw2+NCxP87YznMCIPH2DohRJ2HG0JHwwRlv6tEjP0gX9lf6ysOYDnDRlv
	KW4+S0ET2zFU7JDeVyqe/lSig1Igd/g1+4NPhKXOaWO16xZbxL9mGcAgJ41sEvkFclCv4QnYjjQ
	ldMa1meVcX56WbOilwAH29k1UnqcebUjbwZfLTGc/M/s1dJGpLni7dJHDBt2a7QWT0RrFwE4VUL
	SW/yRrwffgg45TW+iWCRpRqEnJcg39x5wmJrSy9REOgklakhHcPMGreh518BcwSBUEwCbrdv8n4
	0LBB5c/b6BFRt7v2eL+o4g/flGfy4QmO6bdFiV/7eSjeQCRUCYYwm8MLkA+y+MwRe/isCykzmTd
	n2un/fCu+TdKTSGJdIIt8uo1BSQ+Sxwjx2J1FwIhyUT+kfReg8gDPfygof0pzHceM/LIE+ra5t6
	NFjDt9V//wNB3XUxd4ylqWVX4iZNzpinDUQAcvFDqcG4IvO
X-Received: by 2002:a05:690c:a749:b0:81f:3800:606 with SMTP id 00721157ae682-85d6cfc3b20mr58413507b3.16.1788060375097;
        Sat, 29 Aug 2026 20:26:15 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8646265eb15sm1501207b3.25.2026.08.29.20.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:26:14 -0700 (PDT)
Date: Sat, 29 Aug 2026 20:26:02 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    syzkaller-bugs@googlegroups.com, hughd@google.com
Subject: Re: [syzbot] [mm?] WARNING in __mod_zone_page_state
In-Reply-To: <apOAF5CPFWUUH9du@linux.dev>
Message-ID: <a2288e73-5001-2104-1e7a-2b383e7edd61@google.com>
References: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com> <apNjw0HRyr1Oj7q4@linux.dev> <apOAF5CPFWUUH9du@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Aug 2026, Shakeel Butt wrote:

> +hugh
> 
> On Sat, Aug 29, 2026 at 04:03:35PM -0700, Shakeel Butt wrote:
> > On Sat, Aug 29, 2026 at 10:52:26AM -0700, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=10286d79580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=cd2073ee6d958a8d0fcd
> > > compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cf7625580000
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com
> > > 
> > > smpboot: CPU 1 is now offline
> > > ------------[ cut here ]------------
> > > IS_ENABLED(CONFIG_PREEMPT_COUNT) && __lockdep_enabled && (preempt_count() == 0 && this_cpu_read(hardirqs_enabled))
> > > WARNING: mm/vmstat.c:361 at __mod_zone_page_state+0x96/0x190 mm/vmstat.c:361, CPU#2: syz-executor412/6040
> > > Modules linked in:
> > > CPU: 2 UID: 0 PID: 6040 Comm: syz-executor412 Not tainted syzkaller #0 PREEMPT(full) 
> > > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > > RIP: 0010:__mod_zone_page_state+0x96/0x190 mm/vmstat.c:361
> > > Code: d0 00 00 00 8b 05 3e 44 ea 0e 85 c0 74 1f 65 8b 05 87 e0 2e 12 65 0b 05 d0 99 2e 12 75 0f 65 8b 05 d3 db 2e 12 85 c0 74 04 90 <0f> 0b 90 48 c7 c7 c0 e7 ff 8b e8 3b b3 6d 09 65 48 0f be 5d 00 48
> > > RSP: 0018:ffffc9000627f8e0 EFLAGS: 00010202
> > > RAX: 0000000000000001 RBX: 0000000000000000 RCX: 1ffffffff2287150
> > > RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88807ffd79b8
> > > RBP: ffffffff9489f448 R08: 0000000000000001 R09: 0000000000000000
> > > R10: 0000000000000001 R11: 0000000000000000 R12: ffffffffffffffff
> > > R13: 0000000000000008 R14: ffff88807ffd7940 R15: ffffffff9489f440
> > > FS:  00005555785ce400(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00005608d531ffb8 CR3: 000000002cb7c000 CR4: 0000000000352ef0
> > > Call Trace:
> > >  <TASK>
> > >  __zone_stat_mod_folio include/linux/vmstat.h:410 [inline]
> > >  __munlock_folio mm/mlock.c:144 [inline]
> > >  mlock_folio_batch+0xf97/0x36e0 mm/mlock.c:204
> > >  mlock_drain_remote+0xe5/0x140 mm/mlock.c:230
> > 
> > So, we are calling stat update functions which requires preemption disabled
> > (because they access per cpu data) an offlined CPU which is fine but we have
> > warning that preemption is not disabled.
> > 
> > Let see if syzbot comes up with a reproducer. We can just simply take the local
> > locks like neighboring functions or something else.
> 
> After looking deeper and it seems like __munlock_folio is the only one which
> have a code path where lru lock with irq disabled is not done before call
> __zone_stat_mod_folio. I think we can easily fix __munlock_folio without
> acquiring local_locks here.
> 
> Something like below. I will run some tests before proposing a formal patch.

Thanks for looking into this, Shakeel, but I don't think complicating
__munlock_folio() is at all the right fix. This is peculiar to the use
by mlock_drain_remote(), isn't it? Which is not taking the usual local_lock
because the CPU is going offline. I would say, just take the local_lock in
mlock_drain_remote(), but (I haven't read the history) for all I know,
there may be PREEMPT_RT reasons why that would be completely wrong.

Hugh

> 
> diff --git a/mm/mlock.c b/mm/mlock.c
> index efa6716e4dfb..9ab8042671f1 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -141,11 +141,20 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
>  
>  munlock:
>  	if (folio_test_clear_mlocked(folio)) {
> -		__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
> +		enum vm_event_item item;
> +
>  		if (isolated || !folio_test_unevictable(folio))
> -			__count_vm_events(UNEVICTABLE_PGMUNLOCKED, nr_pages);
> +			item = UNEVICTABLE_PGMUNLOCKED;
>  		else
> -			__count_vm_events(UNEVICTABLE_PGSTRANDED, nr_pages);
> +			item = UNEVICTABLE_PGSTRANDED;
> +
> +		if (isolated) {
> +			__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
> +			__count_vm_events(item, nr_pages);
> +		} else {
> +			zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
> +			count_vm_events(item, nr_pages);
> +		}
>  	}
>  
>  	/* folio_evictable() has to be checked *after* clearing Mlocked */
