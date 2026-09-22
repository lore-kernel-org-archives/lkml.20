Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0D5540BF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090271; cv=none; b=ZDXUp+53t1SFhC1gqMiBcveGAFPLyOMDhSdawc5YdMlZ2sLSZ7qy7U6rRfyU3Rqmxqe90K39PbxyReFS6hpgavBMHPvn82CTDNswpQZqdcNf1kKurx816WWxOEpgArINOJdwlXa6thUgdkjmg4027vSnvaSTygpN78qKyDfnln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090271; c=relaxed/simple;
	bh=CGwfGX7tsRpqOKKJ0miq2JDg5a0dolCInmXOCA+qY6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRJ3k9bD76CQrtQcHhYcn0zJCM6uyHiXwW4mpyl8fx4FMzLcLfhiOZvxZlze3T5+29Oy8gN2fd2lwUcYdpC45iwhBDrNWwFMz1o6Nk4UFKJhNSjdF88v9C+K64UVpQCmSOmwygmIkJQRK2UyTALitCvacU5hWxJL8FyYCsPnUAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qgh7EGsP; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qgh7EGsP"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso2254629b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790090269; x=1790695069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHB9IxVUxavOjDPhu5rxEe8qPGJRa/948zvhQlxvPGI=;
        b=Qgh7EGsPfWl55YdLntFwdw033arm4nQ/stwnQJmQ1/IJ5v2WtiK/YoZAKc394DCLiF
         xwaAkhAkHgFHm2lPRSe/itOl8TXYrbOUQueGfcyvKIFNfOg6cqNN0wTH2qJJLU1a+7/7
         jq1W7npN463MH5j+P9Z6PTWC9iSqbPcMps/EPxwj1MGHMGAoIfoYF0jqY0GsnyKPHk8C
         lwI0XFztT4VPDOfIjWs6eVLkkSsZlsOwzZd09rNvuSZZr2jhSWSfw3OGMP6C15sasIXE
         tTmp0Nk8BDfCHzMXNmoflLqx5jKEO/A/PlNWhRZwaScWzXzHbzCM0M8jlm1y1xK6+fG7
         xRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090269; x=1790695069;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHB9IxVUxavOjDPhu5rxEe8qPGJRa/948zvhQlxvPGI=;
        b=HbYYNoV0QSX8D6T8+c0vPX1QuIgzVHClQpUuph6gXyFtseB98inxUumbRfN7kfJ6Vu
         QFte3EYplQD47Aa5XCqI2mluFpPNRi57S7ndr3f6xKu0rRe0W8P5wsfl8igeWOFlEzcS
         e3+1/hFON6TQgxw8ypuLmSYdCLNW2P6rqGbmu3MhycQE6ggHbeYpGVv94beV1Y+sxyiR
         Xr0y3iPO8dwiiAj/6lZSTLDcua/8qMt+lStcYkgYCRzNNLqBUWwI7POZyjTvMLNkh6ou
         UfEWPT6eJtK/Hs8b6+6D3CO0KNfmxbk8clIoRhPCCC9TI9M1+k5x0787yeN2cMgO5UMM
         weaA==
X-Forwarded-Encrypted: i=1; AKwUvBzraFnt09XOeZxLPayG+uYY4Ycva80L6AWt/Q0Od3wYW5BZn6MT3WwjuGDvG+9kyf2nwvfXlE6RWyf8D7I=@vger.kernel.org
X-Gm-Message-State: AFuF++lJboD4OfYT08VUiIZc9y28RG8J13KMeK1Lut241UmiYWboipG9
	921vNryFOO3N8GhvI8P4U6OyyszL7S37S54FosjTlHgKUr54ATrsR/wX
X-Gm-Gg: AYBFou2oXeAIQ6B1dG9vdZmAjq7M0dqYJI9Atk10aXdjrpnAL/dWlAOZvgT/aaeu529
	xNCv4Y9Msordd8fAIO/5YWUBvQM6EEUn1ov3SiRKsPgFA2VsZcAMQNLhNZD1ABy7wY3FDSQS5Wq
	UdH3dXpcsDzlAyD4JeOGKmXfseS4vfKqfvMGnEyWpzDDYnWbFCx5UOI6582tGj8A3CceLLJpLmg
	xKP3eULlrKio06hkFPC4S859X4J2mJbvs+l456UVVnI/4iVJ6X2mCZpoxQE0xG/o7+1LiuPjOuj
	6uaR+0iQoSW/Iicw200NMg6NbwlCiyP5d+I6KmQRH2yVS4+8qCxpYRc2HwvcD/ELZMJxG0tX6MH
	FfCampoSWq7S0AXkti8LyvdTVB5BXNkIaGYfiY5ibdRe681cDr/S7oQQvOD3uQFMcSi1b36sfa8
	RG2qWIoRTzeF2fmHUn5a6q7vfKvie0qH7r1IjUe1xUpIZUCV+IDuA2rkLiK5+5V8eA8XBojE58K
	nsQ5mz/IwmH1zJjWfqh1d53Xaxri7IUfpe/bJMXMQHt/w==
X-Received: by 2002:a05:6a00:1496:b0:878:37e1:aa76 with SMTP id d2e1a72fcca58-87c855f6437mr1731047b3a.56.1790090268489;
        Tue, 22 Sep 2026 08:17:48 -0700 (PDT)
Received: from SANGHOON.tail18dcf4.ts.net ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c332aca11sm1074819b3a.54.2026.09.22.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:17:47 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Sang-Hoon Choi <csh0052@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] tty: rpmsg: close port lookup-to-get race
Date: Wed, 23 Sep 2026 00:17:41 +0900
Message-ID: <20260923001647.1337001-1-csh0052@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092154-anger-sensually-aae8@gregkh>
References: <179000811428.1227592.8003229121862460039.idr-bug-84@gmail.com> <2026092154-anger-sensually-aae8@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

rpmsg_tty_install() obtains cport from tty_idr before taking a port
reference. rpmsg_tty_destruct_port() removes the entry under idr_lock
and frees cport. If channel removal drops the last reference between
idr_find() and tty_port_get(), the install path dereferences freed
memory.

The first-open path and channel removal can run concurrently. tty_mutex
serializes TTY initialization, but rpmsg_tty_remove() does not take that
mutex. tty_unregister_device() prevents later opens through cdev_del(),
but cdev_del() does not wait for an open which has already entered the
driver. Before rpmsg_tty_install() finishes, the port is not attached to
the new TTY, so tty_port_tty_hangup() does not close this interval.

RPMsg channel removal may be initiated asynchronously by the remote
processor or transport. In the test, the local process only needs
permission to open the TTY node; channel removal is initiated
independently.

I reproduced this with a UML kernel built with KASAN and a synthetic
RPMsg device using the real rpmsg_tty probe and remove paths. Test-only
synchronization forces removal after idr_find() and before
tty_port_get(). The opening process drops to UID 1000 and GID 1000 first.
The unpatched kernel reports:

  BUG: KASAN: slab-use-after-free in rpmsg_tty_install
  Read of size 4 ... by task init/23
  CPU: 0 UID: 1000 PID: 23

The allocation stack ends in rpmsg_tty_probe(). The free stack is
rpmsg_tty_remove() -> tty_port_put() -> rpmsg_tty_destruct_port(), and
the invalid read is in rpmsg_tty_install().

Take idr_lock across idr_find() and tty_port_get(). If the entry is gone
or its reference count has reached zero, fail the installation with
-ENODEV. With the same forced overlap, the UID 1000 open returns ENODEV
and KASAN stays quiet.

The test uses a synthetic transport and deliberately widens the race
window. It demonstrates the lifetime bug and an unprivileged opener, but
does not show that an unprivileged user can deliberately cause channel
removal on every RPMsg platform. I am therefore reporting this as a
normal lifetime bug.

Fixes: 7c0408d80579 ("tty: add rpmsg driver")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Link: https://lore.kernel.org/all/179000811428.1227592.8003229121862460039.idr-bug-84@gmail.com/
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Greg, thanks for the feedback. I went back and reproduced the race under
KASAN before preparing this patch. I can also provide the test-only
instrumentation and the complete KASAN log if useful.

 drivers/tty/rpmsg_tty.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
index c5fd6d9b3..b2765bae2 100644
--- a/drivers/tty/rpmsg_tty.c
+++ b/drivers/tty/rpmsg_tty.c
@@ -49,12 +49,19 @@ static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *p
 
 static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 {
-	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
-	struct tty_port *port;
+	struct rpmsg_tty_port *cport;
+	struct tty_port *port = NULL;
 
-	tty->driver_data = cport;
+	mutex_lock(&idr_lock);
+	cport = idr_find(&tty_idr, tty->index);
+	if (cport)
+		port = tty_port_get(&cport->port);
+	mutex_unlock(&idr_lock);
+
+	if (!port)
+		return -ENODEV;
 
-	port = tty_port_get(&cport->port);
+	tty->driver_data = cport;
 	return tty_port_install(port, driver, tty);
 }
 
-- 
2.43.0
