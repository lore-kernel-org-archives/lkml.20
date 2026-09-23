Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD551DF980
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199328; cv=none; b=o53r8aPzfl6PHnFvb4g3LvXqvC+zPwXvts6zFkQsMiOEShc2mwVRPE1Pat6tTdJ8Wu8YdgGEpdHob1UIPTVp9aKhKbPsOW6noQIFxnB0Yos5k+c7SNRc94IsDDh2OoxJe264+eSKpvORVN0GyHqsC8VRa8zfPZGwyw/zYMV+2IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199328; c=relaxed/simple;
	bh=jqeMkgYyOF8JpI07HwnDNMhbhl8UITBxMI2F9pBLPZo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M/tRsb7mxhEJpshwwcvJbPHsAIyWADgONVfae+WYd5bE8d+ZQCsIZTSn8BBEFvBpkdZ8eShzD4KgVGbx5i0+Y/siV7rWpEoaYq+9xHOq1JWHKOqxtjWWSBGPFhZ2B8tQLfjK2LNGPT0HeI5ix95tyNkwANw/ZSfyk2so4VO7EUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4be498aca30so1630623b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199325; x=1790804125;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+cqgdQMwR3rxzZ32nkFrDMzjEeuu6Xb4rdm1HBfgGs=;
        b=Urt2swIjFP+7jXuplkbdg0iBE+qJEHc5j1O96Mwki8SNiGowsDGACz0GmMMcN3vN8A
         UAnJzk7/5ydmdR6iwpe5OBPas77OOn12UW040tMBzKrcWyb+i94t6EZtdS7p2/HxXejH
         z293lgJ5hQzhJop7hZ+SboSrWBYT41IsBPEQ+gGBCTdkxBgMsOHwZvDVPrM8aDUl1AbU
         kB0URe0e9jAhCNdc7Wll1SRBrILfTvRxF0V4nF+6Ns9mObeqZHdpr8Wv4XwsMPxFrD7+
         C9/lxzWgWDwtNdpbo6H1hiIxn0h1lYw7uDw8m6H4yUQI3+qMTldv8EZ1leeolaDV272H
         XyBw==
X-Gm-Message-State: AFuF++mNDmybvZxudMzSThwVesPgFTF4jNQhOz251EWLpfdp355PYG6m
	ctjB9AMWIyyveT51slLZg9LOf1XwUWq6Z34D1+YqUfIHvmGHr4kYSHjygLZ4Gcjh2igmhbDqYYq
	keBIZKrnX8aCqxwR9/7YnLrYGXaM4n/ePtNjPX8wN7cvpZ18c+QCjaBjbUIE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1998:b0:4d6:9252:48ca with SMTP id
 5614622812f47-4d72b746020mr658776b6e.54.1790199325600; Wed, 23 Sep 2026
 14:35:25 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:35:25 -0700
In-Reply-To: <6a778cfb.9c11d2ce.289b96.00b7.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab4461d.e9f5c185.9abc8.0004.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [block?] WARNING in blk_mq_free_tag_set
From: syzbot <syzbot+02b37e31e64ea5cb6d29@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] WARNING in blk_mq_free_tag_set
Author: raghunathpalla.0209@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f0100363d8c3

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index ed204b3f4b84..9fa0987c203b 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -701,10 +701,13 @@ void cleanup_srcu_struct(struct srcu_struct *ssp)
 	for_each_possible_cpu(cpu) {
 		struct srcu_data *sdp = per_cpu_ptr(ssp->sda, cpu);
 
-		// Call srcu_barrier() before this cleanup_srcu_struct()
-		// to avoid triggering this WARN_ON().
-		if (WARN_ON(timer_delete_sync(&sdp->delay_work) &&
-			    rcu_segcblist_n_cbs(&sdp->srcu_cblist)) &&
+		// Deleting a pending delay timer that still has callbacks
+		// behind it is not an error: queueing the work here and
+		// flushing it below invokes them.  A caller that really did
+		// forget srcu_barrier() is caught by the WARN_ON() after the
+		// flush.
+		if (timer_delete_sync(&sdp->delay_work) &&
+		    rcu_segcblist_n_cbs(&sdp->srcu_cblist) &&
 		    rcu_cpu_beenfullyonline(sdp->cpu))
 			queue_work_on(sdp->cpu, rcu_gp_wq, &sdp->work);
 		flush_work(&sdp->work);
