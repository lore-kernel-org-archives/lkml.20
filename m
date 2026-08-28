Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002035A397
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895784; cv=pass; b=Q2mOyqm52SCZzOJLe7DC1JRqgxYQ1Mpj5ZkcMi3Br8N3JHM1aqE2Dbchn/HOm/iLd7lg5zm6bS7LmUvjGIflb5vlMCyNb2IXCFNSyjt+v1zjlYFQ4rtnSXA4s4RtXamGCtf7Syzxdbtgub5zDiJOzd0wlt1MZFix/K4chZh0eTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895784; c=relaxed/simple;
	bh=wBxP4YbhlKCZA5smzchOnIzBLXWhALGSS58Lbit0obQ=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=s4btl6b62Yb3v+XsPPagAtExZcfiB1wdeouDuqasPdZWWdM4lKF3CCvFkq4yOlzT1oqHn3kUmmi23QosKbXfrmrqw3qJK08c4iv6I7nYNZV/Ji8VHALjRHlBHMPfcB2TypueOIaC2NpHo/MgDwEBWTfnis6mn8r1w/9h0OlqzlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=DbGunFKk; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="DbGunFKk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso609489a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895783; cv=none;
        d=google.com; s=arc-20260327;
        b=jtX9t8xreM4JRcqESXcLcz2Yx4NM3mCC8zuGTLagVeE9p6BMRC1LC251Ic/f5y0P/s
         LOpr8A7iZoYNDjdjDQyvJBPHq90aGBijbJ84IqNZAr9sGjRkfb6bVRp7b2FYOVb28FVN
         DOlPsESy2V/2Bd+3BVz9sIpGG/S4aJgS+dF8hpqOA6vKmXNDTbuJiLtRuIz9g0NZHa1x
         GvSXdXfVAmeBvZ3Svd/Xy+oSueuNGcTrY4xECbf97JA5Z9+OSDe/y1OCQiMPZzNWqXiJ
         iFRrGDPBGYZtWFhytxRIbmsMBEiKcuMQT8NEWSapStFUc79OlA0hAd+9xu1Der6ILW9r
         QnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=ymcSwDmaIrMigTTRllqGG5n7lpgRFCcfMNtdeB++vus=;
        fh=gOnAznRRe8ZH/n/eFd4vkKZAtQwkR2l8PyTmWvT19+M=;
        b=l3G2VJ+oS04AaYUfXYWU2S9JctLsT+/zug/MeeyuwNcvj0mQt6uyk4fxtLqwrsMbhp
         62PK//Lf+6oUVMwZ9kPTxhXMvzPuCQn3A7mZiAZCmnHnS5TvVks+OTr9Zxz1xP6tygo9
         0M0i+ZvaQq3B/L5QUTYKgYU/bjr6mZ/k4BkFmMnf4dZGqz35Iq1wgsrbK6P3HmajTTrH
         +iA4QkMoq+7dKsoxYD/Ok4kwxR/4sqHBZJoDOjrcPJl7gqt2UAPg70UZ7Zdn9LGdnOaD
         l+AuA/3icPTuO/bpv5EkQcN3KMP8He7UrmB+13V2/9vjQV8KnkHj/BEleMnqVjxrG5Qo
         YryQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895783; x=1788500583; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymcSwDmaIrMigTTRllqGG5n7lpgRFCcfMNtdeB++vus=;
        b=DbGunFKkbLMAP17Y7TdVSRMr8mnu9MPZKVSt922mkdNBXR/RRGCUS7VkD34L8HuVMk
         MNA0LcDOVo0krgDQBk5ecXyDr/AgE/MVTf3O13vHMWyiD8DTLAcbZS+Nnw7OnGlOm2wL
         w9rcHUq2X4SV2UxlwZNx1SieR1zbUdBiEvXUA08rsC9NCKbH+t4qUYy/sf2xoTQ+SWN2
         E2rQOOtk4zVJswtbhBE1owblP9iNh3Z0KumjFrLCLO+BzArw2nLz+1T0kWrRpyC41Fv6
         iqmyLEVPK8XiT1wibG0qHSVcFDH3dFYOOMtbeXk9L7Fo81J4mTitFSKVNN59VJm6waNQ
         /qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895783; x=1788500583;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ymcSwDmaIrMigTTRllqGG5n7lpgRFCcfMNtdeB++vus=;
        b=ZGaGUj1+YI8IpLcBuJ9osM6uCSyA4bSgIkerJH6SLdDbf96TW/ckZjNESEM/A2ojwj
         /AjY7oCHQgrqwtPRi/tK3FMmxLgfLIgtAVReVaitQgpsgkSoBr/AX1QeuGIObHWzPuMp
         gtQkTMTGJf2nM4bJ9vbcDQ5zo5nzmgML2FPCNW3QYcZ8KrBiJDnb/3k6PS+ZDQcG+NHD
         U0X51ZNx7neNNg51EdoVd1bUuuut8hOKloR5H5m1g4fqkwHJZxzkByhZm1X3hQDNw/8i
         Ew2nAPW6xSsPbY0qM2oq4d0dYm7unLYJcInYgwUmKKAr81CCrUWHwSMV+vZJvLmuPpdG
         xBNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZUqjCBaOqmxXfNhzM6eHbzGALSvNTwQf5lvPRQRci3tbC3Lt4Q9xQMNkAM+QqTBewkiv3XJeSg1Alv4E=@vger.kernel.org
X-Gm-Message-State: AFuF++l7kIozycZsFXQzyxxpvyVuL8gLCYdJyinktaOJAqTPrFn6bs5N
	l+GduIMX8WD6ijiUKci2mSiLvqSMMe1YbKVWbOqxmfIE9lcbLAzi4C8wz7CEAXfHzPeu6oeFUDd
	Pa6Y8owVy3DQQRaiYtNOuDyhdNyX88H/Tjht4Acwt
X-Gm-Gg: AR+sD12buqfG+mOF3TjBxd6DsITUQ5MBcZ5nKJLXHhR3fmLSN+/itfGJa2fLqgqDAwv
	yITf0wObkPgU7syRrL7F3oOmua3CGyP2W4tQacRMFaoX5Ol2t4blqelhJxSaH+Wo3tW6t3HDbcr
	SixPgMYNqGnuOSk50qibMkd7g0dhIlU7Ul2wMGd3TWBlJUU+pNXRXxfknN3NS563YLPI7sdGfRW
	H5nOQK83wx9CwobQ/6fnjNR6A35eB7qtADpwtK6UoCNY3bpTCFzQ+nw8FeE7Qcw0EVPJK5xp8sL
	JvQ+dRtHbZXDfgNIkz1GA1xywO2InC8LhwQ7yRZffHH0snW0sX+1BNBqJzTYV4h1lQOKZ1pnQbF
	BCv9mMnB7QGduDAFDzR0DCwZfYcOfHUyQ
X-Received: by 2002:a17:90b:530c:b0:381:1c96:829b with SMTP id
 98e67ed59e1d1-396d0d4c43amr9634249a91.3.1787895781568; Thu, 27 Aug 2026
 22:43:01 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:43:01 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:43:01 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:43:01 -0700
X-Gm-Features: AcwNN1Wp7GsXp8ne0pKDNCHjGi3GIZAVKBDWrEj4p0lfI9KYWd84e7KzkWViHJo
Message-ID: <CA+0ovChh3VjsKN1g+ZGjwwY2fGTpP7uD+aCCByLj5Qbymw=bfQ@mail.gmail.com>
Subject: [BUG] general protection fault in cpuset_cpus_allowed
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: falemi@asu.edu, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/166-general-protection-fault-in-cpuset-cpus-allowed/

  Oops: general protection fault, probably for non-canonical address
0xdffffc000000001d: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x00000000000000e8-0x00000000000000ef]
  RIP: 0010:bitmap_intersects include/linux/bitmap.h:440 [inline]
  RIP: 0010:cpumask_intersects include/linux/cpumask.h:822 [inline]
  RIP: 0010:guarantee_active_cpus kernel/cgroup/cpuset.c:481 [inline]
  RIP: 0010:__cpuset_cpus_allowed_locked kernel/cgroup/cpuset.c:4022 [inline]
  RIP: 0010:cpuset_cpus_allowed+0x14a/0x2f0 kernel/cgroup/cpuset.c:4071
  Call Trace:
   cpuset_cpus_allowed+0x14a/0x2f0 kernel/cgroup/cpuset.c:4071
   __sched_setaffinity+0x98/0x3c0 kernel/sched/syscalls.c:1149
   sched_setaffinity+0x341/0x4a0 kernel/sched/syscalls.c:1237
   __x64_sys_sched_setaffinity+0x106/0x170 kernel/sched/syscalls.c:1262

A second capture reaches the identical fault -- same address, same KASAN range,
same RIP -- through cpuset_fork <- cgroup_post_fork <- copy_process <-
kernel_clone <- clone3, with the crashing task being systemd at PID 1.

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
