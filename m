Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451580;
	b=cln1+dAGCF1BYNXkhxj7vmM+UamSfBTUZ0lJ9Uiz8wVjLkKWFwxLLuLnZcp9K15udIiY
	 97CFeYgezai+mZAwqz8RTMXhlbNeOrNL0AeHbGJYz8yymdJ/W8EiDn43uLJc/VXRlVqhc
	 luIap5+f7f01E5Pp3ir9oumJyX49MvOQ7PgCuTCcbcNaJPg2uZ7XiarBBfU9kMfAAxus+
	 OHSlvU+M3IKlcWLK7kyMoR2Ws/+TWvvAV8s2MUAopehCd7MLe+iko+SjQT9ugfIBaIXLc
	 8pdSKer75vYtbp9k4SyotUGRXlticGNvVcrwmkHfcqkNJxyUA4aq/2SwqsBVwRb3g8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E6pC1VlRSPSlepfs7PAc3cMIyzIAHqWlOCjLI+YEnyg=;
	b=SrvELEj5HMyc0uonUgA2ry9BklO7sAGhKyRERblkPvuPZ8tF9g5eF7pchht+pGACyBUi
	 ew2MSZYUi5F4tJHR7hyPhXO3E4T4CsYdfC2uA0qunXs5CUxs2cC2YZISlocbYUIqNAF0c
	 xGORWWbURAuPxBebL888d1JS8r3X67Yld8FOm+LyfWWS1Fdt62uXQRlRbHuNiJvPuhDeH
	 Pne8C1tQyQoyHwUzYRrea3Wpr3nEXllpqTLnTfX1xe+KSlNct3cPGxvJuKiPuEDxLs/zg
	 nNRmP2D9kJwZHA1nIALhRnzfs1Ui6QdUbamu72u1ciK96+tRgtbLBt0KmeEARGvaPQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qspMwDss;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D5606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170D5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qspMwDss
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1446815eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451579; x=1793056379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6pC1VlRSPSlepfs7PAc3cMIyzIAHqWlOCjLI+YEnyg=;
        b=qspMwDssAv/zwBC1skQrq3003yD1llhsgFZZLWzZMJwgz42rXiu0piCqIx88HwsZP3
         CnUwNb1Zjj89kt0/LfX04koZTyv0cL7RdRe70B2cKhPGWTZJzf+nkG4SSJbWphcgC2MI
         BYBPVASIWQ2ykdqgHa0lVOwNnFchFSFZ3fb74K3X/I0ZrNhwggXsAqWzcEIC+nYvb52J
         W9UgMD/OfKMpIHPGEdQQI2mFnw616AGqSdz0oukqRBT4diouSby9pD+8AZb26HoyZof+
         71TpAxANW3G+a5YeQC53TTPp//Vr2yVX+gFdNOfXVM26bigrleoLrTw89uATgcPhoRYV
         45Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451579; x=1793056379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6pC1VlRSPSlepfs7PAc3cMIyzIAHqWlOCjLI+YEnyg=;
        b=DYrpDiKWk9QH9iRC+6iSpqF+D5daRWb2Y+ogcPTYvu4fqL20cs3ajyqXsL2UNscutO
         1eX+zhTvD/n1t2vcZH1YS4vUzYpFIHbfjLCAsL6K+B+6oZ7ODf92Tb+Y7U490kQi1kH6
         YatrABLJ+slXk4ptN2qVX9TQ8Xot7JiKVrdRpDnh5Q01jaX8h+3w/2p62qEQbJwPfWrl
         EexZAvT0+6hi4fLbSoAJGiw5WM7xUP7+q0K/kEezuWyY24/93eRLXMg0oSI4nTDCdOTX
         np/Z6ymdi/086905HHghlaZvDIhsgtceRXUZKTBza9DQKn3vtCuTKN0Ic7MPlZb3Mpc9
         zjBA==
X-Forwarded-Encrypted: i=1; AKwUvByGaTw3CqR6ORvzweh/dVYhDP/ROo1X4r07DM2tkJs4YZQphYN8TkQsJZLjyPNgLIHv3yhTnfZW9ea6fOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Ih9yBB4mGi5rpUW+AOH4S/jg3PGc1/cFFMjsT5c1rHiIfs7k
	FSWozB62uhT3ksgD4vxd2k50IzAMa07sZ1LO7HHuX69mGCEIrRMAShyS
X-Gm-Gg: AYBFou0FUo4zqm2StT1nNLkXNbSwKs0rjfbehmAugxIhY+Jw2hh81e7U88XK5jPmOqm
	5bTe16g2yekBeP1W8leQslfrruJMXE1yUkCZhJCq61S/hVde2oPo4ZAowNshPt0cjNqkaZUrjjx
	DYtP+hEYb/exGJuy9xTH1DoDq5PCb3ranVAyovz7PcRzrjlvMzPUWWnT/4Tm62xmsG1e1zkR+sj
	fM6TJDHZ2lrmz7/9s3Rus5Oz7WVlT4rp9VrT8tjyBB6xWFNih/AgABT6iQYCQ7/xiYvhi3vEkor
	KzgWXIEH+lVKyaUCthNLnvCxXoaFBBl3qmMY7ANpFSSj1Xg4wIgnOnEoeEYZVnru60MWLHSRH4b
	gKFHYAmanAihjxmaW5fEzqBWFg/YlixodYhLFZo8nWLTs+MY6Dxc7EttB9MIpHNztTQqKtLjJw7
	1XhyTOCmfKXuQpATJut5Mq5p1fTM9wKavZkfRd+Il4u9cWuPC3+KiWd6IGckg05nMHWrPudjetT
	y/HwWMhpAVAfKNTqIwBfiGwcfzKgXj994VeMX7PUBz0doTBtUH1NW8fAf5gOgzh6bVmyUHM/eCP
	xjoOztmbru8JJdO33EVHQqpRVw==
X-Received: by 2002:a05:7301:4206:b0:359:2edc:e1d8 with SMTP id 5a478bee46e88-3619e540c55mr13367577eec.5.1792451579062;
        Mon, 19 Oct 2026 16:12:59 -0700 (PDT)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm38144903eec.17.2026.10.19.16.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:12:57 -0700 (PDT)
From: Austin Schuh <austin.linux@gmail.com>
To: axboe@kernel.dk
Cc: peterz@infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Austin Schuh <austin.linux@gmail.com>
Subject: [PATCH] io_uring/futex: return a wait's data to the cache when it fails to arm
Date: Mon, 19 Oct 2026 16:12:43 -0700
Message-ID: <20261019231243.802569-1-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_futex_wait() takes its io_futex_data from ctx->futex_cache, and a
completed wait gives it back in io_futex_complete().  A wait that fails
to arm kfree()s it instead.

The usual failure is -EAGAIN from futex_wait_setup(): the futex word no
longer holds the expected value.  That is routine for a waiter that
re-arms with the value it last read, since the word changes whenever
there is something to wake for.  Each such failure takes an object out
of the cache for good, so the cache drains and from then on waits
allocate.

The cache exists so that arming a wait doesn't have to go to the slab
allocator, and that matters most to the waiters that re-arm the most:
event loops, often real-time ones.  A kmalloc() or kfree() that misses
the per-CPU slab takes the node's list_lock, shared with every other
user of that kmalloc size on the system, and may go on to the page
allocator.

On PREEMPT_RT list_lock is a sleeping lock.  A real-time task that
finds it held waits for the holder, which may be any task on any CPU,
to get to run and release it.  Priority inheritance boosts the holder
only up to the waiter's priority, so the waiter still sits behind
whatever outranks that on the holder's CPU, such as threaded interrupt
handlers.  Re-arming a futex wait should not depend on any of that.

Put the data back in the cache on that path too, while the submit lock
still protects it.

In an event loop re-arming one IORING_OP_FUTEX_WAIT per message under
load, 0.39 arms per message failed with -EAGAIN, and io_futex_wait() did
0.39 kmalloc()s and kfree()s per message.  With this change, 100,000
waits that all fail with -EAGAIN do one kmalloc() in total.

Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Assisted-by: LLM
Signed-off-by: Austin Schuh <austin.linux@gmail.com>
---

Notes:
    Based on for-7.4/io_uring (5b01d5955ac2).  Built for arm64 with
    PREEMPT_RT, W=1, no new warnings.  The numbers are from an equivalent
    change on 6.18.39-rt on a Jetson Orin Nano, counting kmem:kmalloc/kfree
    by call site with bpftrace while a test loops on IORING_OP_FUTEX_WAIT
    with a value the futex word doesn't hold.  Happy to turn that into
    a liburing test if it's useful.

 io_uring/futex.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 9203998654ff..9e4e63ee7bc1 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -353,12 +353,16 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 	}
 
 done_unlock:
+	if (ifd) {
+		/* As in io_futex_complete(), or failed arms would drain it. */
+		io_cache_free(&ctx->futex_cache, ifd);
+		io_req_async_data_clear(req, 0);
+	}
 	io_ring_submit_unlock(ctx, issue_flags);
 done:
 	if (ret < 0)
 		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
-	io_req_async_data_free(req);
 	return IOU_COMPLETE;
 }
 

base-commit: 5b01d5955ac206e38097f777eff6ab2a8b948c41
-- 
2.47.3

