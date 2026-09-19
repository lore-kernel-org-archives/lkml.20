Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AEA1FD4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815646; cv=none; b=sovjKIMPMeqXBNFnmUhqYiOXyxH0+IRFsZmPCDyE/r9YGeeuPX5OsRPrqU50MS5QlGUvyuveguP7U08u0hLBfXJkO4sank0ibeKxAaELAj9U1nUtZWf+WxrZkUf6kJpfSFwm65Hdvvjm1KEYVfD/H7JdVyG19KzBcwBM/kdsUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815646; c=relaxed/simple;
	bh=DNkK5lxW6BJbRZck3d0se7pQehLyw7oBHWT8qVoDdjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiK3pa4fJJ6yLkiJIQoTzgoVc30BFiwmeGHZ+A4O1J/TpT3tfpXGfz08VX10fkzfee91/yXjQbKSQqywTIxqwxBS33CJpdfCQ3tGaPMZMzEs0tfbxAc/tH+O89K15oGBrrEO/dN8OPM8hXCWypvjjWFOQcmSRFbCOcKKOjoYKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwHE7XCn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwHE7XCn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2451775b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815644; x=1790420444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4U+Su5olDyDmLov0j40b3fkb86q795927TVcmkINSU=;
        b=ZwHE7XCnq54HF54WBmMZaXKDfyMw/6yWcMFOp3rSxeDNWf6XnTxH7J7nHPlXcexy48
         ZmxhAzAkqIsZxXQz5ZzqpV9PafeyIjXYwviE5h1MvgybDrF4A5s6M6gz0fd/RNDOKTda
         s9dGPronhhDP9OgI4L3GesHHWJV8mRPyMlGv36UhuVIDdXTSjXjEEVpuIpxmZFPWNTmr
         ElBhTjnBzDROgwsZGfuOt1V/0rfwqoQOXdLd2Sjqarz996uSIPqhE89Pyjbdl9gNfu1M
         GIUNXDJ54chBQsBWxq8zBbG8c06ncjT3jut4f3BdlQNSr41F4VKcOshg9pEKZtGWVntZ
         K6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815644; x=1790420444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4U+Su5olDyDmLov0j40b3fkb86q795927TVcmkINSU=;
        b=bpPg4HwdfxOC4VqCLfAdkzdHDP18DjNUitrlxm5lRljt+woxDUIZSfiEXaedG6Ptcn
         CypU4ZuH8ZlPdH3MMfNakjI7toSNvtm3mWuT2R7mOvZxVFn1BYV4mYSTJE4Iohr+i6fX
         9mVJnO5gCvzSvjh0IaG5Ca8YmlUKRpx2QrGYBrdq++NhE+OK8oZ8gXB7sC9g+GvexSB8
         h9Ix3eGiY5y6LsJ9vI/o0xvKiXn8wXtU6M1zrZQCJ8++RJqnGtu+PLLQz/ZnSqkrjGwB
         DtnaBlKHqkwaOmak3Di5xUlLPZP4pfIhT4+jOxhEVNAV+RrQ6bLIj+HF2PQ8ARCMaZld
         7nSA==
X-Forwarded-Encrypted: i=1; AKwUvBxF0pbtb615FlCh6feErHYn4+VyoLdacgpJtTF/H4qisrJPKlB9NZcHQsCVKWrJ/xrPp4HA5FUeKKbUyfs=@vger.kernel.org
X-Gm-Message-State: AFuF++mJPRAX/u4XqDt/z+3rvR3P9iEqWqd/kZ+GAeh+Gqy3egZNmjFG
	d5LB8fucnRLKcN2g02fPezhXEVmmtl4rX6dZfj4us6m6MfEW/KFsdknd
X-Gm-Gg: AYBFou282yyevLDHxeJ2KyWndRidLjokFb3TKXY3fJ292liSl/RzcXDf7GOKePR4mY/
	ag626wnG/LCjNCGruaKxVz547QNASK/om6TpU62B24EZfSeU720P7WP2GE9DJYpO1QmFgjYjSw3
	iR1drrNt3ItlhajAg9aVhGSUwa5OmDY3n57WbiXF9SlPU7rnIIXKDP+IRjs7RDKY7nfv7bnF89W
	xP18vZ4FB4Omt47sIh0fY96ZJ1j6ivVq1P2sxrk1/p2YuPmCed8Q83GI9ifIhLMSRYYA4y4rQv/
	6pZo0o7HvBpSFR7Y/yRGuNOBXqmnjHUnwAHQzTCKFiBvZnOhPDQdI9sxWMJjMeevOUFejRTMtNm
	anKjTf0tkUlcWfZ1hZ48dJCoJ2Jwd4sPBUWH46dKImvxLbDFoJ7E4hlb2HQ9ahI6CcGRCc1pA3M
	Hbt+flUv9e5VKUp3K3lYSOy7iP8fHmJGXB/LszrCFtVe3Z5kq9DrDmxCIiu7XfMbtqdPLglJucJ
	0kNt/sFC+nh1bI7F/To1bAoRBi3NcUtLs9yF6JMyGieo7ILw07OcWzfqcXTYWtZII93CXVcAOLL
	t+s5DKyPpg==
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr4827302b3a.37.1789815643955;
        Sat, 19 Sep 2026 04:00:43 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae7d71sm938073b3a.2.2026.09.19.04.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:00:43 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	johan@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] vt: selection: Fix unsigned underflow and slab-out-of-bounds read in paste_selection()
Date: Sat, 19 Sep 2026 11:00:41 +0000
Message-ID: <20260919110041.3763078-1-benquike@gmail.com>
In-Reply-To: <aq5hK-fxgPUCe4cr@hovoldconsulting.com>
References: <aq5hK-fxgPUCe4cr@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In paste_selection(), the loop copies min_t(unsigned int,
vc_sel.buf_len - pasted,tty->receive_room) bytes per iteration into
tty_ldisc_receive_buf() and increments pasted += count.

Because the selection mutex (vc_sel.lock) is dropped inside the loop
Whenever the line discipline buffer fills up and paste_selection()
sleeps on tty->write_wait, a concurrent TIOCLINUX (TIOCL_SETSEL) ioctl
can replace vc_sel.buffer with a shorter selection and reduce
vc_sel.buf_len below pasted.

When paste_selection() resumes, vc_sel.buf_len - pasted underflows as an
unsigned integer to a large positive value, causing
tty_ldisc_receive_buf(ld, vc_sel.buffer + pasted, NULL, count) to read
up to 4094 bytes out-of-bounds past the newly allocated vc_sel.buffer.

Fix this by terminating the loop when pasted >= vc_sel.buf_len.

Kernel stack trace (Linux 7.3.0-rc3):
 ==================================================================
 BUG: KASAN: slab-out-of-bounds in n_tty_receive_buf_common+0xa01/0x1650
 Read of size 4094 at addr ffff888101c58010 by task kworker/u17:1/65
 Workqueue: events_unbound flush_to_ldisc
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  kasan_check_range+0x11c/0x200
  __asan_memcpy+0x29/0x70
  n_tty_receive_buf_common+0xa01/0x1650
  tty_ldisc_receive_buf+0x66/0x110
  tty_port_default_receive_buf+0x6b/0xb0
  flush_to_ldisc+0x1b4/0x410
  process_one_work+0x6ff/0x1110
  worker_thread+0x4a8/0xb70
  kthread+0x307/0x3e0
  ret_from_fork+0x3ed/0x680
  </TASK>
 ==================================================================

Fixes: e8c75a30a23c ("vt: selection, push sel_lock up")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v3: Correct the Fixes: tag. v2 cited 2f89e2299c58, which does not exist
in mainline; the commit that moved the sel_lock acquire/release pair and
created the window where the lock is dropped inside the paste loop is
e8c75a30a23c. Thanks to Johan Hovold for catching this.

Note that git blame on the two lines being changed points at
9256d09f1da1 ("vt: selection, create struct from console selection
globals"), but that commit only renames sel_buffer/sel_buffer_lth to
vc_sel.buffer/vc_sel.buf_len and leaves the locking untouched, so
e8c75a30a23c is the correct tag.

v2: Resend via git send-email with intact tab formatting and the
Assisted-by: LLM tag.

 drivers/tty/vt/selection.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index 13f4e48b4..f1a3bc5b5 100644
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -434,8 +434,8 @@ int paste_selection(struct tty_struct *tty)
 			bps = NULL;
 		}
 
-		count = vc_sel.buf_len - pasted;
-		if (count) {
+		if (vc_sel.buf_len > pasted) {
+			count = vc_sel.buf_len - pasted;
 			pasted += tty_ldisc_receive_buf(ld, vc_sel.buffer + pasted,
 							NULL, count);
 			if (vc_sel.buf_len > pasted)
-- 
2.55.0.1082.g2b9226bbc0-goog

