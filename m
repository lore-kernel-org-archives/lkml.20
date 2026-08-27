Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB947472538
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857435; cv=none; b=TOCjIJ08qZFwEbo2888WTbif0w/xTNUmh23iVNym/AjlTvOiitWyn1nUgcmJvFwiBCKz5SAQ7S0j3eugA7ZxgghuGz3tPsq3r+FUj0zEyYojsUq9uG2ZfvyQk51hOO5vpdzPb4wWGmBymcZL6qI1JyGb2jBnchc6cjD3ZhuFjz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857435; c=relaxed/simple;
	bh=k2Uw8qJrHjs3d1NfbyklIGpILj7MlqGmzVT9iELvNUo=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=h4FY1vELD71fCdO+W4HzM0dpezBqktaGYmHhDrLQa4kPIXE1RZeKYCMUt4tlfVstIm08CCL5Vc8Pb+RfC0MT6AFNX3sTwnkFR/4qPxgL5ewpmFFl7T5KUFz5+N2MYzE90j7d/e80ciendkskGE3oGYm3+LBGzwXphlwaVEyiy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=JtWUBKlU; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="JtWUBKlU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=k2Uw8qJrHjs3d1NfbyklIGpILj7MlqGmzVT9iELvNUo=; b=JtWUBKlUV2tmwznTkfPMirG5I8
	eP1X8pGCu2G81DkxQY1HkNnt6q05eDEXaCnhlyaFeprV/bfx6VHRVhvzbYjJIt4ACdMdBdOPPSSV4
	DVkUiPiNb/ViI+G8HDnLNoKm3ehsa2ioKpO9Aavb8PpVbltw5zR0IcHFZs7LDdmj+u2I=;
Received: from in02.mta.xmission.com ([166.70.13.52]:49764)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1wzf52-00DRzS-5H; Thu, 27 Aug 2026 12:44:04 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:38014 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1wzf51-004pBe-7R; Thu, 27 Aug 2026 12:44:03 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>,  Frederic Weisbecker
 <frederic@kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  brauner@kernel.org,  peterz@infradead.org,  anna-maria@linutronix.de,
  linux-kernel@vger.kernel.org
In-Reply-To: <87se3zgb3m.ffs@fw13> (Thomas Gleixner's message of "Thu, 27 Aug
	2026 11:35:09 +0200")
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
	<aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
	<aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
	<ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
	<ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
	<ao8_NUo0ACPAA4QB@redhat.com>
	<87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
Date: Thu, 27 Aug 2026 13:43:57 -0500
Message-ID: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1wzf51-004pBe-7R;;;mid=<87mru7h09e.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX19pUxMgMmUZZAWnQV9y2toVpI+w6E1JhPs=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5017]
	*  0.5 XMGappySubj_01 Very gappy subject
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Thomas Gleixner <tglx@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 486 ms - load_scoreonly_sql: 0.06 (0.0%),
	signal_user_changed: 13 (2.7%), b_tie_ro: 11 (2.4%), parse: 1.02
	(0.2%), extract_message_metadata: 4.0 (0.8%), get_uri_detail_list:
	1.69 (0.3%), tests_pri_-2000: 3.5 (0.7%), tests_pri_-1000: 2.2 (0.5%),
	tests_pri_-950: 1.27 (0.3%), tests_pri_-900: 0.85 (0.2%),
	tests_pri_-90: 70 (14.5%), check_bayes: 68 (14.1%), b_tokenize: 11
	(2.2%), b_tok_get_all: 11 (2.2%), b_comp_prob: 4.7 (1.0%),
	b_tok_touch_all: 35 (7.2%), b_finish: 1.29 (0.3%), tests_pri_0: 370
	(76.1%), check_dkim_signature: 0.63 (0.1%), check_dkim_adsp: 6 (1.3%),
	poll_dns_idle: 3.3 (0.7%), tests_pri_10: 2.4 (0.5%), tests_pri_500: 9
	(1.8%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, anna-maria@linutronix.de, peterz@infradead.org, brauner@kernel.org, imv4bel@gmail.com, frederic@kernel.org, oleg@redhat.com, tglx@kernel.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Thomas Gleixner <tglx@kernel.org> writes:

> On Wed, Aug 26 2026 at 22:29, Eric W. Biederman wrote:
>> Could the posix timers cleanup be moved from __exit_signal in
>> release_task (which is really for cleanup for zombies but has
>> been historically abused because it was the only place that
>> knew when the whole group was dead), into somewhere in do_exit?
>>
>> Say near where hrtimers_cancel and exit_itimers are called.
>
> That's only for the group_dead case in do_exit().
>
> But a single task existing from a process needs to clean up
> task::pending, i.e. signals which are targeted at the exiting task.
>
> The safe and obvious place is to do that is _after_ setting
> task::sighand to NULL because that ensures that no new signal can be
> queued and nothing can touch task::pending anymore.

Not really.  Using release_task (which is what is called when a zombie
is reaped) for anything except cleaning up state that a zombie needs is
a bit of a misfeature.  Timers should not be active in a zombie.
Signals also should be deactivated long before then.


The obvious place to clean up task::pending i.e. signals is in
exit_signals().  

I expect if I read through the history again that I would find that
exit_signals() used to call flush_sigqueue, and that during the addition
of posix thread signal handling flush_sigqueue was moved into
__exit_signal in release_task because knowing if the entire thread group
is dead was not available during that part of 2.5.

We should honor PF_EXITING on a task and simply stop delivering
signals to it.  Today the code goes halfway there and does not
set sig-pending after PF_EXITING is set.

There is the goofy case that we need to be able to deliver signals
to the entire process through a zombie thread (in particular a zombie
thread group leader).  That goofy case unfortunately means that except
for signals to just the thread we have to deliver signals when
PF_EXITING is set.  That goofy case also unfortunately means that
sighand_struct needs to be retained past the point where signals
are delivered.

>> Then perhaps move the posix timer disabling before de_thread?
>
> That does not work because between that and de_thread() any thread of
> the thread group can create a new posix timer unless we prevent that
> somehow in timer_create().
>
> So in any case we need some mechanism in posixtimer related code to
> handle this situation gracefully.

Which is a completely reasonable reason to focus on that mechanism,
and leave the rest alone.


I suspect the current crop of bug finding may keep coming until all of
the weird corner cases in process cleanup, exec, and signal handling are
all sorted out.  So figuring out how to make the code make better sense
in the long run appears to be a good idea.

Eric
