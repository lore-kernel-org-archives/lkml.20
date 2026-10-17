Received: from mail-qk2-f0.google.com (mail-qk2-f0.google.com [74.125.230.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E13A5430
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792265208; cv=none; b=F/eVUtYN++iRrW+lbOWXj5/K7j+GR5MzzMivIwJFgyskNhsaaAGKyHf03ZH5Lvc34PtsUlHKfyf4+zluSGEvG/VWqfaGN46dkD7LQqfsYE5s4B8QWsGzEI6sxOLK7GLPIlAiK/2NAxKk84fH+G+PIAWNdPs8fNUtkNFgQHqiDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792265208; c=relaxed/simple;
	bh=0OJKu0//rXTQ5IjipRP9nhEDDza+d92k3Gj6AjLjKZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ibj+CVHkfeA4KKRQTn8KXUchuvMDjQ4BpusVpYqO9ZuFoc2Kh9POXeC74UIlY2GPPSkqNX+yJLc2upLJ/DcmE46XmNQKWTwy7rEaPIwy5UvdNiMbJ4yct88l8OOiU+eIu2SSRXsWLAU4iLTILsHVx/QTZr/NFHpsDStJbmmpicY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxdMKXUJ; arc=none smtp.client-ip=74.125.230.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxdMKXUJ"
Received: by mail-qk2-f0.google.com with SMTP id af79cd13be357-93e5da88874so31226085a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792265205; x=1792870005; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0y9+d29ww3KClrDVHBCic81sblNW2TUSZKqSM5Fl2c=;
        b=fxdMKXUJZl0TH5ZxolG4VU6Sktt/cDCGjhG4wDZOXATHNiX4A492nYqugR02gImohm
         72OkjURJjcVVN/0el3AZhHduX7dTxah/7lWxyG3VjqGeoG3Z5r+CoHoWJBXZ758xP6eQ
         2BB8gF83d0Og+JEg7icu6ycfvaRWvZQx934CWHQj4s7D6WATUROpgJbHhGTnLeZC6351
         wL+OrQPM2DdXERp26GIjAF2mwAH0bLgSZDyp2kD7Rfa4goTXm5BB7NC+oNj8hRbiA4ob
         lqBqnUgZN6H/gUin0Avk2zITTQ8NKV6Eqk3i8E/KQFjL3wuBDnkNOKaxO/xcnK6iXhqp
         x6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792265205; x=1792870005;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0y9+d29ww3KClrDVHBCic81sblNW2TUSZKqSM5Fl2c=;
        b=nrsiTzBqR0JDyTbIh5m5wQgy8FxXgRNnSDoCTXx2FLnJ7gB6DN9C/5qu4BV2HNYOjq
         2G6J03PWo2LTQNt72igBXxSvRWik5CFTPF7CWglxkX/SIqKSkIYyDT6CRussNe0XZp+A
         vQztKtQaPnM1HJ2MQ+MGTW+lo9cLxzvFAsv3aEFy2JT/hzjaC+YE1a5xxn0cj3WfcksQ
         lA1qPdimTDo2o7awomRXtMNFevIv1sx5F5eKZ3FEkail0PjcL4FO6+f6NRZ25J0135O2
         r7+//EC7lYEQgFnt4DiTgMdGTZHE+pYgVeZmGmj+hhO//JYVFPskrBabUUneocnVto71
         qRCg==
X-Forwarded-Encrypted: i=1; AKwUvBzPFx1CXObQAIv2sUeI4V6gG8joJgb1fazYi88ez6bKkXjfaOcGZ2JKdGVGiwBnVdGKDeBFtn534PVtXd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZdbmmiC7tAI4l5OTHosEOL+JzI8CDccyFpB9OX51SkkvVegyG
	bonNOhGk6oix8ba4ZRqhG2usn2stgzMxqQ8ya2agWsXySHAHqTpv1+SKrhmIIaWyQj4=
X-Gm-Gg: AYBFou3Cz7YTBT0yp7KH7FqUWtGzWmQYNHVCL+yYrRudgFSMQsizV2xddWw0Xpsr+W7
	DL2lV5jQB+/QSwhJ7XEIEyHhXTC/w6sqYK0BrjscvIkjiBpn1JvAjKWyaNov/xv3Q+v3IR/8Qi3
	5NAoLu9QBjbJO5k9urG09JMohVFlvtlwY5VLDP1w8PLtcsMuGdbdw5VEKCTzDgoxLTMB07rXLis
	betH3xBMdGUYUop6B1tM0A0ZNOKek3svqhcFzs+xIuchDqbO3AC02YmcHJQKuQ8rqPYxqw0NkoT
	jG/tNBGr7cRnFbuIPXtxsQ0mJ85I8JA1f1rOa52ZSbSiR7aGgbunpFlO6sxJZ973NPzZjvLe95X
	8NzJ518yFSudeviK4UIIMH3BbZgCbhzs85cPK40EdbpC2KyyGsvcCbWDPJMCgZwN3kqG9MZ4R/k
	u/31YzpujSKqPeUIpaiZ0ImBpQ9scyXUmTeWnGP0wz0mgsaW6wLn3RW5Wj8z8miM63F9ldb7qVa
	TQXwWM=
X-Received: by 2002:a05:620a:8812:b0:93e:b7cc:67bb with SMTP id af79cd13be357-93f29d6ffd1mr559823685a.54.1792265205360;
        Sat, 17 Oct 2026 12:26:45 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f29c5ae3fsm308636885a.40.2026.10.17.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:26:45 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pidfs: don't report autoreaped tasks readable before
 exit info exists
Date: Sat, 17 Oct 2026 15:23:10 -0400
Message-ID: <179226499044.847.6888435030853836469@gmail.com>
In-Reply-To: <20261017054356.7874-1-hooyan2024@gmail.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Oleg,

thanks, and sorry for the unclear report.  You are right that the early
wakeup is not specific to CLONE_AUTOREAP: exit_notify() always calls
do_notify_pidfd() for an exiting non-delay_group_leader, so pollers are
woken and pidfd_poll() returns EPOLLIN as soon as exit_state is set.

What I observed is the window between that first wakeup and
release_task() -> pidfs_exit() publishing PIDFS_ATTR_BIT_EXIT: poll()
returns EPOLLIN to userspace at that point (it does not wait for the
later wake_up_all() after the unhash), so a parent that follows the
"poll and then PIDFD_GET_INFO" sequence from the series description can
read a mask without PIDFD_INFO_EXIT.  The second wakeup only helps
pollers that are still asleep when it happens.

Test-case details, as requested:

- clone3(CLONE_PIDFD | CLONE_AUTOREAP, exit_signal = 0, pidfd = &pidfd)
- mode 0: the child creates one thread which exits after 500us and then
  exits itself with 42; mode 1: the child exits immediately
- parent: poll(pidfd, POLLIN, 5000), then
  ioctl(pidfd, PIDFD_GET_INFO, {.mask = PIDFD_INFO_EXIT}) and counts
  results whose mask lacks PIDFD_INFO_EXIT
- x86_64 mainline 58161ead29e5 (v7.3-rc7), defconfig + KASAN + DEBUG_INFO
  + DEBUG_KMEMLEAK, QEMU, 2G:
    mode 0, SMP 2: 18/300
    mode 0, SMP 1: 78/300
    mode 1, SMP 2:  8/300
- the in-tree pidfd_autoreap_test global.autoreap_multithreaded case
  fails the same way: its poll() gets POLLIN and PIDFD_GET_INFO returns
  mask 0x7 (PID|CREDS|CGROUPID) without EXIT.

Your POLLHUP remark resolves it: PIDFD_INFO_EXIT is published before the
task linkage is removed, so POLLHUP is the right condition to wait for.
I changed the autoreap tests to pfd.events = POLLHUP and to check
POLLHUP in revents; on the *unpatched* kernel they now pass ten
consecutive runs (19/19 each), and a POLLHUP variant of the reproducer
gets 300/300 with PIDFD_INFO_EXIT.  So the kernel behaves as designed
and the tests were wrong.

I will withdraw the kernel patch and send a selftests-only v2.  Do you
think the CLONE_AUTOREAP cover letter or some KAPI comment should also
say explicitly that POLLHUP, not POLLIN, guarantees that
PIDFD_INFO_EXIT is available?  The "poll the pidfd and retrieve the exit
status via PIDFD_GET_INFO" wording is what led me there.

Thanks,
fujo
