Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5163A782B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791120675; cv=none; b=oIL4mZSW9nEcWEK4zu3qeBXhZVVPDSGepNljKeLtOQh8uRzGfs7xHRCcxre6k7rRhcdfmTw+caVXHB8yGXn4kX/Amb6qNDBpY3g3bi/W7utEGWqAIvD0LdxG97EEjMxrX86pGnAUyconEI+kV4VfMxr2B0u2ibcX7dePOha6fUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791120675; c=relaxed/simple;
	bh=gdUHvAs+0+edPxOmr+CBA01rMYa560iXpn2ajLw7oo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OecvTGWKcwaCeLnuAWlm9E7yfaB0zkaz9rWVS8C1l0Bbc4NY9r11YUcIqaWj3uM0z69Dd829ZJ7jSlyK51TdpzqRBrRbizzmwVDoxv9/yTReccAT8oG4bT97Ov6iyFKcbjk2em9GMCIfQESAH+chzgevxpR5Yt+rJn6c7Oa4ziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYjx71Oj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYjx71Oj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so9888155e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791120670; x=1791725470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TjzYk415GX+tlOXU39Vffp9IL4LGUlflceql1j+IiTM=;
        b=QYjx71Ojhc81YSGav5EwrFiJIu9IJlhFug6mw6coF9ls4I35139nsnz0WstVL316uk
         wv/lTyEyUhi7H7WeLrBt54Y08QiLwY2GI2Etr2xAEnFwq/SAVp+l5/LJ2aVaCabuJmZS
         A/6HMY6g0tyHLCxmW9mTkPuCGBq/iszUmsUAGRnIeQV0+C1NzEu9X/7O+aBPuRNRKN6N
         vC2DO/CbNQV3b5sIok3c8W9sXyqnCUtlJPH3BEuq6bjZwWZaPmFjLJQENMp3P3y8C/vc
         jHqgu7cJ/KPzaACApsjmN3kzlJlFtHGvhc6mAMCwQNOK2EhdUEF9vOR7YO0UVoQI9LoB
         imkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791120670; x=1791725470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjzYk415GX+tlOXU39Vffp9IL4LGUlflceql1j+IiTM=;
        b=lcd+jqIhB9MroAOM7dvHNufqPE79rp1I/cO4B4I1acYrTxQ5/U/d9TddwmjWHpiqSk
         f15578sKcPb6KjfUclejLnawD+VnCzvQENOoPT4Ngm/CAVjvqf1tAMSTyAqi3ThUR+pt
         4TRPcF1mT4Q2dRoMNa/r6edkKiK3GzVTV+gJKL5TdkUG4iGqCUcK8FxS/RGOcpErCcuT
         J4VqYfhl52N9MkLwXMPO44f9D4BPEP4aocaVJX/UE8wAV+wdM2+TCxW8Ow8fJ9tWok/P
         HHLVraui2MGmYipW7Ju5Z1Kp+QgvA/++QIJDcWlM4P+5Vh2nY/qNT/LbLyvpoH53Hx/e
         TAWQ==
X-Forwarded-Encrypted: i=1; AKwUvBykzW5kRadiHV1BzfQDzUA1ynHIbsCJbdrKOpicsNEEgzvrOrOTWnF+BuGmsTLTdnyhfeNk0GJ8uZhG7ME=@vger.kernel.org
X-Gm-Message-State: AFuF++kMfcpplDGbaeWrnCjIioOav+uEDpVOkSUPYIUkbPhMFr5YP7f/
	XO/uQazePEP/k+N5kpyBA6fQ2RmfmXmGRbs0WlTFTkR02FH3nYbt6ani
X-Gm-Gg: AYBFou2Nsvtl9ocGioKPp56gUQajMPEk7Xms1EC8rg7Qc49tUJCSyqVgqBeRfY0mvg3
	mktTRXaRc5lT6EdUJXrzyjzxClORDgFltcjxSEOuxA+esHltUbL7o7rXDcWzjtp4X4l7+osWCs9
	lptFcrNtjbcs75fp847MUWGASTAUM6vHHX531XnewvS7TaKg89+WfaXgkcXMKnxTh2iGQqQ6c1F
	YeR/MGY2+xhRlKt42WE/6/hrRekIwsEvyR/7bAreGeeD2X1oQ20i2obybCNy41W7aHknE+/mLe0
	nxkxDsWynfAmWcYQaT3KdhgfPD3NS14rD9SB7uS9sCMRUOjNETz8+9ZtLF3zjiYirPdNPwElPRp
	Geqyr7O8yKO4gkpj0+4WSvG61sJYbdgDBgqZeJMhEe7ugshdV2cstqUscs53TcTNPISVXj/xxAY
	yHLHFWYAMZKye254o3nTq5Hrv40o+Xvpcvu81WwxUpvlwQ0ywFvi6MVF0OEjba+wJt/wdUbYmZo
	LMLqeb5Jl7enX8iONXUnmJUC4fJu7euR5M=
X-Received: by 2002:a05:600c:154b:b0:4a1:7108:c2b6 with SMTP id 5b1f17b1804b1-4a17108c4camr18457395e9.31.1791120669538;
        Sun, 04 Oct 2026 06:31:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm267766175e9.0.2026.10.04.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:31:09 -0700 (PDT)
Date: Sun, 4 Oct 2026 14:31:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>, Christian Brauner
 <brauner@kernel.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Andrew
 Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <20261004143108.4b851713@pumpkin>
In-Reply-To: <asJRMhSXz5XhljNi@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
	<20261003182224.2171b574@pumpkin>
	<asIwpkNr9bF6gk6Q@redhat.com>
	<20261004125118.7de53b47@pumpkin>
	<asJRMhSXz5XhljNi@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Oct 2026 15:14:26 +0200
Oleg Nesterov <oleg@redhat.com> wrote:

> On 10/04, David Laight wrote:
> >
> > On Sun, 4 Oct 2026 12:55:34 +0200
> > Oleg Nesterov <oleg@redhat.com> wrote:
> >  
> > > Yep. That is why do_each_pid_task() needs tasklist_lock.
> > >
> > > This is the known fact, let me quote the part of my old email
> > > https://lore.kernel.org/all/20200512150936.GA28621@redhat.com/
> > >  
> > > 	> Currently the tasklist_lock is shared mainly in order to observe
> > > 	> the list atomically for the PRIO_PGRP and PRIO_USER cases, as
> > > 	> the actual lookups are already rcu-safe,  
> > >
> > > 	not really...
> > >
> > > 	do_each_pid_task(PIDTYPE_PGID) can race with change_pid(PIDTYPE_PGID)
> > > 	which moves the task from one hlist to another. Yes, it is safe in
> > > 	that task_struct can't go away. But still this is not right because
> > > 	do_each_pid_task() can scan the wrong (2nd) hlist.
> > >
> > > Somehow I thought this was documented, but it isn't. And this is not obvious.
> > > I think this deserves a comment above do_each_pid_task(), will send the patch.  
> >
> > I guess the rcu protection lets the task exit without holding the lock?
> > Is that really significant given the other things that happen during task exit.  
> 
> Sorry, I don't understand your question...

I was wondering if the (partial) rcu protection of these lists was worth
the trouble.
If the 'add code' all the readers and have to hold the lock then does that
leave anything other than task exit doing an rcu-delete.
I wouldn't have though acquiring the lock in the task exit code would
be noticeable.
Is there some other path where rcu protection is 'good enough'?
 
> 
> > Could do_each_pid_task() use hlist_nulls_for_each_entry_rcu() and rescan
> > if it got the wrong terminator.
> > Or does scanning twice cause grief as well.  
> 
> I don't think it can. Say, __kill_pgrp_info() is a "typical" user of
> do_each_pid_task(). What can it do if it detects that get_nulls_value()
> doesn't match after the main loop? The signal was already sent.

It would have to check each entry to ensure it was on the correct list.
(That probably doesn't need the 'nulls' variant.)
The problem is that the rescan will do things twice.
This is ok for a search, but probably not for sending a signal.

David

> 
> Oleg.
> 

