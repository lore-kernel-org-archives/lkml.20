Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275F4A8FFC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364385; cv=none; b=sgFUt9IsqesIkd5piRnY6UdwigqQEjLqP0kBE2jvuUAM4EEj3Ee/x1XHEvxCv8GsXu6dSOvqFNN4d2HVlE67jMWNfIsR0dWhFOkwsI4rAtRttKw8FgNpHs6yFcDPYE7Wrbu2EHAE7BfHW9MZ6XoryfDzd8BSzBuu4d8Yvirn+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364385; c=relaxed/simple;
	bh=6MAfs2y3VwcdK/z+jm64GnqxD/YmkCOafRbcTEg6efA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsiOiG4dvolyMsE3CusBUXJL/Bd20Sxr91r4AkrTiRd4bvxGN4yI98+jJ+xi8SJjl3ALpovXyM42xsQDJuGZGrQfat/0rK3q4iGU8z+ulMu82VK568lmMFCr9f0Nn6mGBjHG3apTHv+sEkVcyk9l8oAWFVEelK+sfIPK9KfBEc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXdUqObA; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXdUqObA"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1066801a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364383; x=1788969183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJjiilOnreU5ZYIm7PKJOLTqjb9QBJthxd9KEc/39Ok=;
        b=QXdUqObAQnbwD82KnPUo4idzS0caVDHlIgTB84x9LSrlVr+R1vLtf0PC82WsSjdh13
         RPRefYMQcbSU2p6Lk4S1uka9yx3xYncZrrl7fEc8XpoXgG95b79bWPXVqTumPv3a4agy
         wQynb25MroQs0KTXGndcwJdjOdD2SQIfaoUuUzA3OyahKKlGTIEfYv6wlb9uevh3fXRG
         MlqIFofZhgCXM5W/A8PUjfwGN9VcLnbATFGnqEXZvYRwoF4eEmKIQ2vETswvraAs2IF+
         OQgRpuPVEiARWHk1gkxG63U1NHRQkD945PzbCrlozTmgG++IT/xalqhY0iWPUkgeghyQ
         05Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364383; x=1788969183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJjiilOnreU5ZYIm7PKJOLTqjb9QBJthxd9KEc/39Ok=;
        b=gU6zYhZCNx7vknjCvixm9tUvu7WGw4oCxFyX9IuqCCvUqbhkvNXCXTDdg/yQtkoHC/
         MUqAUaYQs7/hoVbxTtGU1rwAj632xRZAdk9veTDaTYtWe8np0Xm3witbI1N5W3VEamvj
         Bw9fhEzFdtuAynitnMmHhHsLGUkyGew0AJn0GZaMDS4eFs64NGMuNrx4a/MbO458Xegv
         s42fy6iIhGKNjhsWJSTQApOw/W61tuEoQpgB1dVcdDAhRz3KbO6XINtTzE6F7aH3UR1w
         gfPtpo7QhAMOpezNToubz+9G1SwNc0t+kin8u3A8X3ogtDW/zCiQiHuMBXZfV0P3BPKm
         9MuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcul13tbG0YAPwcA9W1MEOvopXorDFqwGQrHBA4CEtn+d7m5+VrN5SUuOWM7rx3235rhIVgRIXP3qAfxs=@vger.kernel.org
X-Gm-Message-State: AFuF++nvho5DqwXyFbWJ7BznRZVpNUNTaA13L+ROFeyfrs5VZ60UH4nU
	xdBew5FM+gK4y94xiW6nbsveQI10cXaBZ5MiUtbfJ39b5bLs/FNhX+I6
X-Gm-Gg: AYBFou0WAeyLqCdw1mxd1tmWpkE+eFlkAFD77T9uL0NGdlFeWAAfLyN0KOGC5ctymeM
	/HQTU83xCAiMsI9ZZ2Cqymfi7MQpFvzxC/MUznTgYFVmmhLQwYM6YTFzRTBHa6H/JieZS6P1hD5
	IYq1WTkF3nwJWJMcHXU01BYaqH3CLmNBhfq06NTagHuVwKzFTr3ZwXNzv7zX1XcNXWAAPgY0f/X
	fybVLO/VcM/+vaabt/E0IdaJgRbK1N8n0Z9H0ZBUmeCyOel7Xn4fIYLI0x7se/UTf77ZsRbF+mj
	v9pqGz8e6WocZrXXA43GMlqd9mJtbq4tvRemCUxuGZxOKW3vmBTv7BtmIPPcQthUvhFBgZx84Q/
	DWQ0umOUq3kzpBeq4lkU3qG4nn5F/QVHBBT69yMz3SkJCFCLx5pz5oDwYpbPrPMkmFUunjFdeM7
	m5SRGnJczs+DE1XeZWLNNC4vRPG/Ux4SllAI8JCLzXHowvcEZinzmpTeGjZzVP/m57Spc+R8QH0
	GWAl5tk5XP4fh36lANL
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr8965073a91.1.1788364382919;
        Wed, 02 Sep 2026 08:53:02 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1448esm1683187a91.4.2026.09.02.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:53:02 -0700 (PDT)
Sender: Weiming Shi <thebestswings@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Ahern <dsahern@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net v2 0/1] net/sched: defer qdisc freeing after failed creation
Date: Wed,  2 Sep 2026 23:52:30 +0800
Message-ID: <20260902155231.2149915-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the qdisc failed-creation lifetime fix posted by Kyle Zeng
and David Lee [1].  The public reproducer is available in a follow-up
message [2].

When clsact binds a populated shared ingress block, ->init() can publish
an embedded mini_Qdisc before qdisc_create() completes.  A later invalid
TCA_RATE makes estimator setup fail.  The unwind removes the published
pointer but frees the containing qdisc synchronously while tc_run() can
still hold it.

The fix itself is unchanged: failed qdiscs are retired through RCU.

With the public reproducer from [2], the vulnerable kernel reports a
KASAN UAF in tc_run(), with the free in qdisc_create().  The same test
completes without a KASAN report on v2.

Changes in v2:
- inline qdisc_free() into qdisc_free_cb()
- use qdisc_free_rcu() for normal and failed-construction teardown
- retain Fixes: 51ab2994c387 as requested
- credit the earlier security-list reporter

[1] https://lore.kernel.org/netdev/20260805102505.740806-1-david.lee@trailofbits.com/
[2] https://lore.kernel.org/netdev/CAC_etQFk%3DtGLvbHPmQwOyrYWgRtDru3dSw4T7sZ-9hvVMy_J-g@mail.gmail.com/

Weiming Shi (1):
  net/sched: defer qdisc freeing after failed creation

 include/net/sch_generic.h |  2 +-
 net/sched/sch_api.c       |  2 +-
 net/sched/sch_generic.c   | 20 ++++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)
