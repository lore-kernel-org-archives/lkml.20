Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2CE3AF660
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946950; cv=none; b=suyenplJlsyJmMNiD5OmDqmrpgNQ9qvRUfyFSv6gmEpBk9G44ozRerZwfUbPcA7GP0OyEW9P+O/mh7UEA2XRt8rl8tt2UOjfiRY+N7UlOG3AMnAy7Il5b+9xjaPSKGw0yV+0SAUr1vZchp/mwlr83xiS0AZdc0Ibe/hQOVTVba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946950; c=relaxed/simple;
	bh=jRpghryDrodxMmh/XcCri4nhZAOYGtdVkCars6Z2guU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwS1db2XD+83znpIBL+tJkQ1NDVFWDL0IWqQWv+nMx6KwXEZs4cvsVWAlU0jdOg6GEqwb+BE0jGSrSO4QouorTJ2qhgKoX1PThw4Gp7V5q5XZxKyDSNgMXAKlknx3k7quKn3fCO1CFBd/4CK1BiqfLm9j0DPUhBqaOV68zQEvIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=iUWnW1P4; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=iUWnW1P4; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="iUWnW1P4";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="iUWnW1P4"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 9878FA1BD9;
	Fri, 28 Aug 2026 21:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787946946; bh=jRpghryDrodxMmh/XcCri4nhZAOYGtdVkCars6Z2guU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUWnW1P4R73IFQSqDtOUayCIVMcQ4ow6vmtcaUSs2dhIEPVj40WUYKGv/ish2nUVy
	 /HvDWs4Pic0WpJzMXkwWvZyIo/XOZrgOU2L2wKPvADAdM6Ngv2MNkZ5eVYFTsyBepi
	 HmCTwVucjDIjcG8HytYY0BIlQm+vq14+9BEP9mYZpLLvIR3QCU15S8+aqp9ZWmAKSi
	 s/ngCtpVt3nf8IzgMRiHaFdwaAZr0atu3Qp2Snq7BBE8ANAokHGDHgBSQ90vBW9N/o
	 OGXXHGL3mHfE8UaMZiH6H21JRfYNltFLAOu/QYzvIqwEA0yQog4cPfE47ei7PlKOWS
	 SMJRO/8B3CRZw==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcZ8Qw80vcVv; Fri, 28 Aug 2026 21:55:46 +0200 (CEST)
Received: from end (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr [83.192.199.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1C649A0657;
	Fri, 28 Aug 2026 21:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787946946; bh=jRpghryDrodxMmh/XcCri4nhZAOYGtdVkCars6Z2guU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUWnW1P4R73IFQSqDtOUayCIVMcQ4ow6vmtcaUSs2dhIEPVj40WUYKGv/ish2nUVy
	 /HvDWs4Pic0WpJzMXkwWvZyIo/XOZrgOU2L2wKPvADAdM6Ngv2MNkZ5eVYFTsyBepi
	 HmCTwVucjDIjcG8HytYY0BIlQm+vq14+9BEP9mYZpLLvIR3QCU15S8+aqp9ZWmAKSi
	 s/ngCtpVt3nf8IzgMRiHaFdwaAZr0atu3Qp2Snq7BBE8ANAokHGDHgBSQ90vBW9N/o
	 OGXXHGL3mHfE8UaMZiH6H21JRfYNltFLAOu/QYzvIqwEA0yQog4cPfE47ei7PlKOWS
	 SMJRO/8B3CRZw==
Received: from samy by end with local (Exim 4.100-RC3)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1x02fx-00000007dXJ-0mFh;
	Fri, 28 Aug 2026 21:55:45 +0200
Date: Fri, 28 Aug 2026 21:55:45 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: co <co+e5693071d903b832@bugs.sh>
Cc: speakup@linux-speakup.org, William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>, Petr Mladek <pmladek@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Oleg Nesterov <oleg@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Song Liu <song@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/tty: NULL pointer dereference in paste_selection()
Message-ID: <apHnwT7aG3Uy4oyC@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	co <co+e5693071d903b832@bugs.sh>, speakup@linux-speakup.org,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>, Petr Mladek <pmladek@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Oleg Nesterov <oleg@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Song Liu <song@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
	linux-kernel@vger.kernel.org
References: <sQDn678D0YppKseC8dIUC0I6uKmzsrOVtoN1@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sQDn678D0YppKseC8dIUC0I6uKmzsrOVtoN1@bugs.sh>
Organization: I am not organized

Hello,

Thanks for the notice, this is indeed a small timing window between
switching VT and pasting text. In practice only root can trigger this,
so this is not a security issue, but I will add a NULL check to avoid
it.

With regards,
Samuel

co, le jeu. 27 août 2026 12:42:57 +0000, a ecrit:
> We found a bug reachable in:
> 
>     path    drivers/tty/vt/selection.c` (fault site), `drivers/accessibility/speakup/main.c` + `drivers/accessibility/speakup
>     crash   NULL pointer dereference in paste_selection()
>     commit  f5098b6bae76 ("Linux 7.2-rc5")
> 
> Config, environment, the sanitizer report and a C reproducer follow.
> 
> == Notes ===============================================================
>     If you patch the bug based on our artifacts, a tag would be
>     appreciated:
> 
> Reported-by: co+e5693071d903b832@bugs.sh
> 
>     Everything in this mail is validated by the reproducer below.
> 
>     We also hold an LLM-generated root-cause analysis and a candidate
>     patch. The patch passes an A/B test: the same reproducer panics the
>     unpatched kernel and runs clean on the patched one. Neither has had
>     human review, so both still require validation before you send or
>     apply them. Available on:
> 
>         patch.diff  https://bugs.sh/b/e5693071d903b832/patch.diff
>         report.md   https://bugs.sh/b/e5693071d903b832/report.md
> 
>     This is an open science project. The code and the full set of PoCs
>     are not public at this moment, as we intend to disclose our findings
>     in an ethical way.
> 
>     Happy to test patches. Complaints and suggestions about our work
>     are welcome at:
> 
>         cedalion@bugs.sh
> 
> == Environment =========================================================
>     Reproduced on  f5098b6bae76 ("Linux 7.2-rc5")
>     VM setup       https://bugs.sh/b/e5693071d903b832/run.sh
>     config         https://bugs.sh/b/e5693071d903b832/config.gz
>     poc            https://bugs.sh/b/e5693071d903b832/repro.c
> 
> == Sanitizer Report ====================================================
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000044: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
> CPU: 1 UID: 0 PID: 49 Comm: kworker/1:1 Not tainted 7.2.0-rc5 #10 PREEMPTLAZY
> Workqueue: events __speakup_paste_selection
> RIP: 0010:paste_selection (drivers/tty/vt/selection.c:393)
> Call Trace:
> __speakup_paste_selection (drivers/accessibility/speakup/selection.c:112)
> process_one_work (kernel/workqueue.c:3322)
> worker_thread (kernel/workqueue.c:3405 kernel/workqueue.c:3486)
> kthread (kernel/kthread.c:436)
> ret_from_fork (arch/x86/kernel/process.c:158)
> ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> Kernel panic - not syncing: Fatal exception
> 
> 
> ---
> The report format is based on syzbot bug report.
> 
> This report is generated by a bot. It may contain errors.
> See https://github.com/n132/cedalion for more information.
> 
> For any issue with this report, reach out to cedalion@bugs.sh
> 
> If the report is already addressed, let us know by replying with:
> #co fix: <commit hash>
> 
> If the report is a duplicate of another one, reply with:
> #co dup: <lore link>
> 
> If you want to undo deduplication, reply with:
> #co undup
> 
> 

-- 
Samuel
<c> hiri, le cri ici, c des marrants
<c> j'ai un rep ".uglyhackdirectorywithoutacls" ds mon home
 -+- #ens-mim en stage -+-
