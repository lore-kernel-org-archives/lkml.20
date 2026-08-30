Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02638D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788052133; cv=none; b=XpCAIOM+2cW7EyRnCmGvzNxUlboA4zIQDp/odoTtsmOjMq0HYQW7cSYU4OVEBgluMca+YIu7JYKdazWV/9gPFP8I0eNvDJ4wsErxDDducI90pwi02CwXHKrlx10xEKYBM4jW02qOYjhb+QoT8kjTIR+OZrxdzEgyx915e3VWtG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788052133; c=relaxed/simple;
	bh=DZzcjJc9sLyv3Y9LU9lZskwia54d44A48WITPmc1pDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/GU2IGuK8AE46w/wr6g1DWpqLlD6kK8XIUZxbueF9gV2lZvKvbRISVw0t3npYWngJ6jSdh0SyZo5uiygiSbQ3tDZQbqdfu6SsHPaY9KajOmuVdIxmqfKykc8ECuz6+1yuo+MOt0g+yst2swAlIn8UP3DCCAtGt/TJK0+Oddd2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ru84dXoX; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ru84dXoX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DZzcjJc9sLyv3Y9LU9lZskwia54d44A48WITPmc1pDE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788052129; v=1; x=1788656929;
 b=ru84dXoXQJC1LffezUNzlcNZAPYSfKk0C2GZAbLdIw/8JlZJRhuB7IFUrV+ttKGPxYlKq7sV
 9KPrVPMmPRuF4UJ9bveBnAwBSEJbumQ2QqB4m4MNCeOiGj6Camm6cXlh7m81R0KZJe8wkvlNwsa
 DThChZT0+Fz8N+CREim+qwTQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 38fa7b8430628112;
	Sun, 30 Aug 2026 01:08:48 +0000
X-Mizu-Trace-ID: 38fa7b8430628112
X-Migadu-Flow: FLOW_OUT
Date: Sat, 29 Aug 2026 18:08:47 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, hughd@google.com
Subject: Re: [syzbot] [mm?] WARNING in __mod_zone_page_state
Message-ID: <apOAF5CPFWUUH9du@linux.dev>
References: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com>
 <apNjw0HRyr1Oj7q4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apNjw0HRyr1Oj7q4@linux.dev>

+hugh

On Sat, Aug 29, 2026 at 04:03:35PM -0700, Shakeel Butt wrote:
> On Sat, Aug 29, 2026 at 10:52:26AM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10286d79580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> > dashboard link: https://syzkaller.appspot.com/bug?extid=cd2073ee6d958a8d0fcd
> > compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cf7625580000
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com
> > 
> > smpboot: CPU 1 is now offline
> > ------------[ cut here ]------------
> > IS_ENABLED(CONFIG_PREEMPT_COUNT) && __lockdep_enabled && (preempt_count() == 0 && this_cpu_read(hardirqs_enabled))
> > WARNING: mm/vmstat.c:361 at __mod_zone_page_state+0x96/0x190 mm/vmstat.c:361, CPU#2: syz-executor412/6040
> > Modules linked in:
> > CPU: 2 UID: 0 PID: 6040 Comm: syz-executor412 Not tainted syzkaller #0 PREEMPT(full) 
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > RIP: 0010:__mod_zone_page_state+0x96/0x190 mm/vmstat.c:361
> > Code: d0 00 00 00 8b 05 3e 44 ea 0e 85 c0 74 1f 65 8b 05 87 e0 2e 12 65 0b 05 d0 99 2e 12 75 0f 65 8b 05 d3 db 2e 12 85 c0 74 04 90 <0f> 0b 90 48 c7 c7 c0 e7 ff 8b e8 3b b3 6d 09 65 48 0f be 5d 00 48
> > RSP: 0018:ffffc9000627f8e0 EFLAGS: 00010202
> > RAX: 0000000000000001 RBX: 0000000000000000 RCX: 1ffffffff2287150
> > RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88807ffd79b8
> > RBP: ffffffff9489f448 R08: 0000000000000001 R09: 0000000000000000
> > R10: 0000000000000001 R11: 0000000000000000 R12: ffffffffffffffff
> > R13: 0000000000000008 R14: ffff88807ffd7940 R15: ffffffff9489f440
> > FS:  00005555785ce400(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00005608d531ffb8 CR3: 000000002cb7c000 CR4: 0000000000352ef0
> > Call Trace:
> >  <TASK>
> >  __zone_stat_mod_folio include/linux/vmstat.h:410 [inline]
> >  __munlock_folio mm/mlock.c:144 [inline]
> >  mlock_folio_batch+0xf97/0x36e0 mm/mlock.c:204
> >  mlock_drain_remote+0xe5/0x140 mm/mlock.c:230
> 
> So, we are calling stat update functions which requires preemption disabled
> (because they access per cpu data) an offlined CPU which is fine but we have
> warning that preemption is not disabled.
> 
> Let see if syzbot comes up with a reproducer. We can just simply take the local
> locks like neighboring functions or something else.

After looking deeper and it seems like __munlock_folio is the only one which
have a code path where lru lock with irq disabled is not done before call
__zone_stat_mod_folio. I think we can easily fix __munlock_folio without
acquiring local_locks here.

Something like below. I will run some tests before proposing a formal patch.

diff --git a/mm/mlock.c b/mm/mlock.c
index efa6716e4dfb..9ab8042671f1 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -141,11 +141,20 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
 
 munlock:
 	if (folio_test_clear_mlocked(folio)) {
-		__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
+		enum vm_event_item item;
+
 		if (isolated || !folio_test_unevictable(folio))
-			__count_vm_events(UNEVICTABLE_PGMUNLOCKED, nr_pages);
+			item = UNEVICTABLE_PGMUNLOCKED;
 		else
-			__count_vm_events(UNEVICTABLE_PGSTRANDED, nr_pages);
+			item = UNEVICTABLE_PGSTRANDED;
+
+		if (isolated) {
+			__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
+			__count_vm_events(item, nr_pages);
+		} else {
+			zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
+			count_vm_events(item, nr_pages);
+		}
 	}
 
 	/* folio_evictable() has to be checked *after* clearing Mlocked */
