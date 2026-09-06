Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424AC312803
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788658168; cv=none; b=lXSQKEeyr8OkEok9adjvvlGF62lMI5csAyQhJ7xMC/z4rSsGJ+hq1svB+AJTUM8CInb1DWmEijHP3oW5J/mNK5A93aoDrtrUJsQioeCFgtYrHklgGMjASypA8MYvqWajw1SRJdAX4GFtmT2d8brKg21V6XI1nnKVTTpcmhVtusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788658168; c=relaxed/simple;
	bh=Mc7C7vEd+geTmXBQsqBzXuNVgESWzoaEEie4c5Cym1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxI3kxwXE6Gh4v3oWp7l82he9/+frnVvcuvWt5OuAvrbBLIWVAAiy3nHDYxTNf4MRs9LWm7uapDvaqpZFJU4EZL/X0zMj+6pFBT7rjR4HTIG+HamB3nzNlDpu1NQWugav8McIWfk7915goHoNGm84GqN4cBEBkubd0yMfB7CNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=K24sJF7B; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="K24sJF7B"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6f9e2f681so25745685ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788658167; x=1789262967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fINQR5Ssvu+nKJR1KqypgzqxRtq2wGfTV7dTHptCiTk=;
        b=K24sJF7BLpo0/5mU99qywjOZgv+czAXJdCaWvSyI/oFqTMTFTY2b89FlBfPUsujla2
         UlCvbbpIkJY5lAQ+P/E7LhsIu0xx05ByhBr1Uo68aEr/lXr125LO449COz3X5l68jFiZ
         okB2+YZJiJKa9TCmlryH7+KyytviVGHanBzFyOGqno7p4eBS1T57vz84/R7UCqQm3T2h
         4wkNSelDRCb3YlH4EXVVgUQPkjTGWxJFxwnqq+Pvl8JsqLEMODUba2i1sh/NC6vsd/yH
         dhXsa6zBbRaAWEez+tk0ukeNMw/hoT24ZKEfkUVvU6kW7GrGh9Icew84DSLktxmD4pX8
         7s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788658167; x=1789262967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fINQR5Ssvu+nKJR1KqypgzqxRtq2wGfTV7dTHptCiTk=;
        b=UptSvxota4iULxUxF0PvDKRn8dlU2+ja7D7bHclPugnY+HwSJH79tLv5Y89wqsDEfh
         82HeIfbOSc9K4eR7nvwArO50vqJ7Yi2kmgxeo0CozTccIbfyrSwH1ppIX35MKvm3ZlWf
         PFT62B80v5d5w0DsfZGiVctLFxz/EdEVZTfbYgJrfQ0N3VDcYZwln55Ssr2K/1/bepKo
         PW+APc6nb/FR0oc+aZx0NR0zO4WdPajsfynk+eFYsdHr8UUWhFzlg+6FrMBtFAx7tENu
         LWECt4QqoQLnvPS9dGC9SRURqdRbkEV3oAP60Ou/hlbgUUcgGjFSGlLsQay4zUYS7aug
         aROg==
X-Forwarded-Encrypted: i=1; AKwUvBwnO3ULV8TxiA3XDV8WDpf7LSdPUFu0jdz19JKoZOM9dqeXX4/V72Ju8pKsUqPLzOmzMmyGz8pMEkGIG/I=@vger.kernel.org
X-Gm-Message-State: AFuF++mj6+hEZWLGrQNEiSWSzac0Q3H5A3q76hCyrgr6gf5/J36E16im
	nVU/jFGWKJ3J8pNr92SiJ5MrR7xdlp130BLWTPZhWpzKzy65ur4owiAm9j1Vh08WvQ==
X-Gm-Gg: AYBFou0qfjP3x1qogrxVjyy2Dj1X/uulec/LoaEoLg+Ed+mAULy/XzzbnL/F8q0B0vP
	HY7LqGe5yCtymmgZz4VZG7qsC27M4Kh82xa3X3RF8uQQeoTEqF0qSp/pcA27IMR667MkhD617hl
	1kdpb6L0AGG3JngLpl2YeSZTuTCjg+7juyMGtHBYzMJZYK27aOg+bFNEhIUwyEBrOyhlD82yUWY
	GkwA3otx6Zyy0PfFJQfxa7fVocJJMFTIu1IAMLVLDHm7cyortQA1crb0/gFq0UgLK8L5nOGlhSk
	77svZIhJ/qil7hAB92SPeAlxGClM1h+/vwvmOp/2R9TgFIvxqIPkCpew+vuU3SYXdE6vNwiSPXn
	fEkr0iuynQ9w2ylfRWM5V1wGnkaAMoOUeXvzarEWHzuKHhR83mOfI6Ru7RmhfM2xG0csTZ1v8fd
	UjltIXpKMYr+oet1GNm+63rpyEqcKSLRxAWEz7Nox3NWm0SQz2tE7ndiMYSfrBdNdAimO81HqJ2
	Wek+SWDF2Q+CK4GO980/PZex04AVmj7qN8=
X-Received: by 2002:a17:903:37c7:b0:2d1:134:b86e with SMTP id d9443c01a7336-2db122ed6femr226702135ad.2.1788658166513;
        Sat, 05 Sep 2026 18:29:26 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm17456853eec.19.2026.09.05.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 18:29:26 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v6 1/2] fuse: bound io-uring payload copies to the registered buffer size
Date: Sat,  5 Sep 2026 18:29:22 -0700
Message-ID: <20260906012924.1928316-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuse-io-uring copy paths do not check that the data they copy fits
in the ring entry's payload buffer.  fuse_uring_copy_from_ring() passes
the server-supplied payload_sz straight to fuse_copy_out_args(), and
fuse_uring_args_to_ring() copies the request in-args without comparing
them against the buffer.  Either can exhaust the imported iterator and
hit fuse_copy_fill()'s BUG_ON(!err).

An unprivileged user can trigger the request side by mounting a FUSE
filesystem that registers small payload buffers and then issuing a
setxattr() whose value exceeds them:

  kernel BUG at fs/fuse/dev.c:1064!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
  RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
  Call Trace:
   <TASK>
   fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
   fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
   fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c:1057)
   fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
   tctx_task_work_run (io_uring/tw.c:96)
   tctx_task_work (io_uring/tw.c:133)
   task_work_run (kernel/task_work.c:233)
   io_run_task_work (io_uring/tw.h:84)
   io_cqring_wait (io_uring/wait.c:278)
   __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
   do_syscall_64 (arch/x86/entry/syscall_64.c:61)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
   </TASK>

Bound both directions against ent->payload.iov_len, the length the
server registered, so an oversized reply is rejected with -EINVAL and an
oversized request with -E2BIG/-EIO, matching fuse_dev_do_read().

On a zero-copied request the last page-backed argument is handed to the
server as registered pages rather than copied into the payload buffer,
so exclude it from the request-side sum to avoid rejecting valid
zero-copy reads and writes.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v2: add: Cc stable and Reviewed-by tags
v3: propose the patch fixing another issue found by Bernd by Joanne suggested way
v4: no context change as v3; add Reviewed-by: Joanne Koong ...
v5: no change
v6: rebase on fuse.git#for-next.  The ring entry already keeps the payload
    iovec and imports it at iov_len, so only the two bounds checks are left.
    Skip the page-backed arg on a zero-copied request, it does not consume
    the payload buffer. 

 fs/fuse/dev_uring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..981b7c295e5e 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -775,6 +775,9 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
 	if (err)
 		return err;
 
+	if (ring_in_out.payload_sz > ent->payload.iov_len)
+		return -EINVAL;
+
 	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
 				    issue_flags);
 	if (err)
@@ -854,6 +857,7 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	int num_args = args->in_numargs;
 	int err;
 	struct iov_iter iter;
+	size_t copy_size;
 	struct fuse_uring_ent_in_out ent_in_out = {
 		.flags = 0,
 		.commit_id = req->in.h.unique,
@@ -887,6 +891,16 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 		num_args--;
 	}
 
+	copy_size = fuse_len_args(num_args, (struct fuse_arg *)in_args);
+	/* a zero-copied page arg does not consume the payload buffer */
+	if (cs.skip_folio_copy && args->in_pages && num_args)
+		copy_size -= in_args[num_args - 1].size;
+
+	if (copy_size > ent->payload.iov_len) {
+		fuse_copy_finish(&cs);
+		return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+	}
+
 	/* copy the payload */
 	err = fuse_copy_args(&cs, num_args, args->in_pages,
 			     (struct fuse_arg *)in_args, 0);
-- 
2.43.0

