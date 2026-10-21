Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588908;
	b=SGqWd+tT8rKpAfBKsVv9W7Otri0CfT7vtOldmIOKNT+OQ0+dqW+cZ0jrzA55t4v8Z0vW
	 QFsP7htHIXlps67qlLYqhb5zcvRKBww4RdlPgjW+A3y8/kuZxAD7uLJwIGOCGF3WEz92y
	 dttX11Xdk9pzY/U2Dn758No2oyhz7lRtep713Z09Lcgn7HnfuQD0Br2igYdfwUsw95EOX
	 d6T8Zwqse6e4aCJNT3XbTfdAZkwwNJzWmrz2D067gW2Z/uWJ9xKkIP8BZQnULH38fYuOO
	 sojUgDez9MQY59xGk8af2YOcGBXFzXSI/uUmYaJOvFQqcCF96x8O0f8G1HDXNUW5BGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588908;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=TXc2rXrjRxoGSP5yLA3diE1tbm1o5gWYHfKbRjkqKFk=;
	b=PSIQ6nRZHKSn5Asc07jaEZOyKVae6KfCkzXVaKRH4M1/zJdhSnNgNXKYKTRWv1r9LIpU
	 ir54jy7oSyJj0HqtyED/rqsJf+rULRFqbW2TYml1rfB/hY0doHZgQHAngG1BqDEnT/f1B
	 +fTe1i2Qo91Mslh9gD9LyV7gbYhShSuCWyY+FrA79N+auaua3YZS+Ujit+HpkSpGO/Kr0
	 zLsmbEg04e53vMwKPlafFe60btAv1iLcIwpYVsOYuSK0O/kdTW6d2N2y9Y2LkcDLWk7Cj
	 rnbkNPwHcSXx9w9baF2iOt6BcPKMdeMR0gsJYr+j6QRQbnNWXjbEk+LyinWSP3bgoYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=HsV140Sj;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=HsV140Sj
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id CC335A0552;
	Wed, 21 Oct 2026 13:21:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 8DF0F60010;
	Wed, 21 Oct 2026 13:21:37 +0000 (UTC)
Date: Wed, 21 Oct 2026 09:21:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <jstultz@google.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>,
 Qais Yousef <qyousef@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>, Wei
 Wang <wvw@google.com>, Patrick Bellasi <patrick.bellasi@arm.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021092136.249e2d19@gandalf.local.home>
In-Reply-To: <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
	<20261020152933.16989549@gandalf.local.home>
	<20261021113806.GE2823843@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 8DF0F60010
X-Stat-Signature: cwgt4qnynqhhybyfsmosfbaiunbhe47x
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+y/j5BtLKD8SFbWaEeCEsM0dPa/oNh72g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=TXc2rXrjRxoGSP5yLA3diE1tbm1o5gWYHfKbRjkqKFk=; b=HsV140SjSkk/hkmRzAHyugsVoR+8Hk4v+jI1hT23J7ltW89J7yXl1Hki2QUWHrlCUabgId8P8HeHLQWFAblM8l+pcHMa7q3zqzTqnmgcBLZgXVYx6/b2PCL99tC9S/2BxMlzjWqQBa1BL11+9f6QfhtvOJOYT4LW2QqjWvc04y0=
X-HE-Tag: 1792588897-727226
X-HE-Meta: U2FsdGVkX1/BvUeOtMisHrFHzccE3MkhCiFMIHHqNW1zA3LlzmkKfXVY8mEKuU28PJMthpY5Khh9vIHkignR+48jDom/mGUw1HZ8/Me+9y18dFMA5FV/2T5QIL+Aw8lnen9UCwGDCagbKvIGbPxeYA899hczUhn7buuTfCACikDAG+jb5L1aGS3xqdLodB8KFzLYCZ7sPrrLcTNzTQ//C3RviPtKwmBTPFWbtx6VVrIsHqO3E78XEwwL15SWnhPW0GFt/nwoXFQzeSgd4y09DNvHONbUMGawmYGonmJL94Zbdm9fWfCLZSQorRzvVakFLkX3oyMCRCqLFprUFLKBG5Z/aIWdwofeyTk3eWhq2VdM9UF7PHzK0B08peteoHw60o/7LQgSUmhTU9kWbaG9aw==

On Wed, 21 Oct 2026 13:38:06 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Oct 20, 2026 at 03:29:33PM -0400, Steven Rostedt wrote:
> > On Tue, 20 Oct 2026 11:53:47 -0700
> > John Stultz <jstultz@google.com> wrote:
> >   
> > > Maybe should the jump_label_update() logic be using something like
> > > stop_machine? Or should there still be a conditional on key->enabled
> > > in the unlikely case to make the behavior consistent? Or is there just
> > > something about the uclamp usage that is off?  
> > 
> > There's never been any guarantee that all call sites would update
> > atomically. The first user of jump labels was tracepoints and I really do
> > not want stop machine involved with them.
> > 
> > Perhaps we could add an api like static_key_enable_atomic() and
> > static_key_disable_atomic() that would go through a stop_machine() and
> > update everything that way for those locations that need an atomic view of
> > the updated jump labels.  
> 
> Argh, no, we do not want people to 'accidentally' add stop_machine()
> usage, which we then have to spend tons of time on removing again.

OK, sure. I was a bit skeptical of that approach too.

> 
> And yeah, its always been the case that jump_labels (and static_branch)
> updates are non-atomic. Most of them are init time, and don't care.
> 
> Now, I'm sure we've ran into this particular problem before, and it
> always requires care.
> 
> Also note that a simple global boolean has the exact same problem.
> Adding runtime conditionals isn't going to fix this.

Another idea for "atomic static branch" is to have two static branches at
each location. One that switches to a "check this variable and do a normal
test and branch" and "we are now in sync and can use the original static
branch".

Something like:

	if (static_branch_unlikely(&foo_use_variable.key)) {
		return static_key_enabled(&foo->key);
	} else {
		if (static_branch_unlikely(&foo->key))
			return true;
		else
			return false;
	}

And then in between updates of foo, the foo_use_variable gets set making
all the branches use the key, which will be updated "atomically" (maybe
some memory barriers needs to be added). After the updates of all the
static keys are complete, the foo_use_variable gets unset.

The non-atomic portion of "foo_use_variable" is OK because the foo->key
will match whatever the static_branch version it has.

The end result avoids the test and branch but will have two nop/jmp pairs.

-- Steve

