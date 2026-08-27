Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D236897F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802789; cv=none; b=YlTFR/eODI+oQyUkRoijzxybCO2SyIynF0G3dY5Gb8QGfYsHd+8p7FVbYb4Dh2Ni+H6v9V785t4HHIXbTOC3PmTmAXKRleqg14c5lt/h6V4ay9YxJ2QQ1Ljge+N4MXPJi4kFmF1Kgh+dcZZWfNJvLh81wnAC7TXciC8sEeDWAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802789; c=relaxed/simple;
	bh=Sbvd8kTMYsXTYqaL0tXB2IjQ5gRdfuUudguhdWObp2E=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=Iyklceb0AegaEAsnwWaxYvnanMcVv3USmNwLzY6I/qTg6mJay6ww/81XEK6sPFmeVJR3mQpdQgW4pH8hoc2dFymcWOL45bO3mXDqo4S1x6T8FtMIEYNJ2GqmJgURX4S6EX+wvWfERAIvdkYcstwMXk3HEl3w9y+OpL74MSiS/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=cOh1qRKB; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="cOh1qRKB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Sbvd8kTMYsXTYqaL0tXB2IjQ5gRdfuUudguhdWObp2E=; b=cOh1qRKB1Re+N7f5YlDisRuyqZ
	wJ5fnZpZQVVqzOUphU+WJ3POxbli6YolFE/xENyqZl37NEJb+VnrepXUBhr7mmfklp5MdZ/Je5okZ
	TlMKnemOy8O/hj1bE3DWuQuojozTpSgda6oFivNA48CK6lWcIHED5EbtbX/L6gG/0DTs=;
Received: from in01.mta.xmission.com ([166.70.13.51]:52102)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1wzQoH-006iSd-MR; Wed, 26 Aug 2026 21:29:49 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:41050 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1wzQoG-002hvQ-Tt; Wed, 26 Aug 2026 21:29:49 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>,  Frederic Weisbecker
 <frederic@kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  brauner@kernel.org,  peterz@infradead.org,  anna-maria@linutronix.de,
  linux-kernel@vger.kernel.org
In-Reply-To: <ao8_NUo0ACPAA4QB@redhat.com> (Oleg Nesterov's message of "Wed,
	26 Aug 2026 21:32:05 +0200")
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
	<aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
	<aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
	<ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
	<ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
	<ao8_NUo0ACPAA4QB@redhat.com>
Date: Wed, 26 Aug 2026 22:29:42 -0500
Message-ID: <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1wzQoG-002hvQ-Tt;;;mid=<87ecfki6l5.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX19/5CokmWIysed0hbmY4RVOG5JDYLtprxU=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4998]
	*  0.5 XMGappySubj_01 Very gappy subject
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 307 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 11 (3.5%), b_tie_ro: 9 (3.0%), parse: 0.79 (0.3%),
	 extract_message_metadata: 2.8 (0.9%), get_uri_detail_list: 1.12
	(0.4%), tests_pri_-2000: 2.8 (0.9%), tests_pri_-1000: 1.99 (0.6%),
	tests_pri_-950: 0.89 (0.3%), tests_pri_-900: 0.69 (0.2%),
	tests_pri_-90: 53 (17.4%), check_bayes: 52 (17.0%), b_tokenize: 5
	(1.7%), b_tok_get_all: 7 (2.2%), b_comp_prob: 2.2 (0.7%),
	b_tok_touch_all: 34 (10.9%), b_finish: 1.10 (0.4%), tests_pri_0: 215
	(70.1%), check_dkim_signature: 0.43 (0.1%), check_dkim_adsp: 2.6
	(0.9%), poll_dns_idle: 1.03 (0.3%), tests_pri_10: 2.3 (0.8%),
	tests_pri_500: 9 (3.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, anna-maria@linutronix.de, peterz@infradead.org, brauner@kernel.org, imv4bel@gmail.com, frederic@kernel.org, tglx@kernel.org, oleg@redhat.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Oleg Nesterov <oleg@redhat.com> writes:

> Thomas,
>
> I am already sleeping, but let me ask anyway
>
> On 08/26, Thomas Gleixner wrote:
>>
>> On Wed, Aug 26 2026 at 11:36, Oleg Nesterov wrote:
>> >
>> > So. With this change release_task()->flush_sigqueue(&old_leader->pending)
>> > can still race with posixtimer_send_sigqueue(), but it will do nothing.
>> >
>> > But it also does "nothing" if tmr->sigq is already pending (!list_empty)
>> > so I am starting to think about the change below again...
>>
>> Sure, but that's an orthogonal optimization once we fixed the exec()
>> mess :)
>
> I am almost sure I missed something again. But I thought that this "optimization"
> can also fix the exec() mess we discuss in this thread?
>
> No?

I haven't been through all of this in detail lately but I have a thought
about cleaning up the exec "mess".

Could the posix timers cleanup be moved from __exit_signal in
release_task (which is really for cleanup for zombies but has
been historically abused because it was the only place that
knew when the whole group was dead), into somewhere in do_exit?

Say near where hrtimers_cancel and exit_itimers are called.

Then perhaps move the posix timer disabling before de_thread?

I think that would allow ignoring the whole exchange_tids
aspect of things because the timers would simply not be running.

I think that would make a good general cleanup as well as avoiding
the craziness of moving thread ids.

I think.

Am I missing something that keeps that from working?

Is that change simply too much to contemplate to sort out this
situation?

Eric

p.s.  I wish years ago I had the energy to get glibc to stop assuming on
a newly started process that thread-id == process_id.  Then this
exchanging of id's on tasks could have been completely removed from the
kernel.  Oh well.

