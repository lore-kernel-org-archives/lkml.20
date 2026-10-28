Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160236;
	b=iNjY4MED58uzfZoB/zusvtckLfCT5ED5+q2S5icls0HEXveJ0mCKMLmpnHyC/iB71l7t
	 pdPT+LTXYKBnFVlhdCTEKeI1bQGUeZITFjf9ZL5vpuuFIOpuaOL2aVtuJFBUxrEw1K/PS
	 Y6MhQD9Pne4pgpW+ehiH2CHChrqcZuTqOTg+T8sW2c1yhtJtLkGZ1slngJ0LiOkyGxxQx
	 MNQmmRlKVQqCNGjXmVlk72TzSMztUel0Q0Z900a4/C60WcDMqqKxPbRJtHbLIjL2JzvK5
	 5WtGDMyRTewKb/ypeKpzHo2Z6hFscE8pPN8+9Pgdk3UhQUQgEHL6N4J/LyR0LaZjwmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9LLguDpNiVBNTA+rUvQkRbaretslcjtR874A6eMULAU=;
	b=sDByoPe0TvN8TdhwldZv+LvWpgrcVfk71zCYwDrqsG1POXD8qh2DNEIKQ2zyeYrq5w3y
	 b+IqNwnD5WJafWas2w97BtGoT8hxfI1WJP2kVwggMB9lC7sr9X7fJbV84WfAsy3nnIelr
	 k3TusXiZVdQ4A3LitLYaNoPIByR95jNw67XVQL8evvJonRzySGP1B7q2vw9+DE9ffFNtc
	 IgKZw4BxRWaohsFUPpmMDwN3hjOkMaKLegACyNGp53/mSO6i/i5D+KQ6Wgooe6ZdZ0mXk
	 K3EPea5d02UmrBzZpZK1wHHu6bhvyEQ+lruKMXmC9aDGEM64CHbyQo/sSEOu496088Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJiaul36;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A666606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A666606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJiaul36
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so405655a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793160235; x=1793765035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LLguDpNiVBNTA+rUvQkRbaretslcjtR874A6eMULAU=;
        b=SJiaul36xyFiV6GQQYY8w49qlEiHv74g5/+Quebr2/10lGrVcMs8ZcQmVhFgsGGD+m
         zYUtFP5CkA9S+X6LWtOlQMawc2pPxEAOQkMRyWHL1Pt95M5oF3c7OZN5HRPaVQYiZx+X
         KX31OJMgIdrxrcfG+5WEWplXvnZC/Ch2Gkc6fj58Dz5Zj+vDRlpR3amQJ8vOP5TaOs/8
         f2QRHfdyqe6eI4C+ExKHwUZkwreJDDH50Qw3SJJU4x9jVxz6uBg8H0mDSDxwztUzF3lr
         G2KVAOWQ5mwtL4Vg/myuiVViQFtmdnR7Gy8is5kcQ/M6n+kWdkeR8UnU0jeOA7gR/pPf
         A4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160235; x=1793765035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LLguDpNiVBNTA+rUvQkRbaretslcjtR874A6eMULAU=;
        b=nzQK2bTYGNicgn4/7hnnqUCyDOlIQdQx3kjZoX8rrcmQeGYt72zok9GYdPdk+cioFk
         w5htWi0n5nDGnhKrqcJHT1zlKKnPKnOekl1LekdBx7P3mNcRjIjjk+S4Z9SIk0qk+/bo
         x7RtBFipJg/OkX53CL6BTjIC5ZbOcYqvl+MfbgK8CUoLpts57CwEAiQgZ0VHJn9ZPzIe
         Wj/++1Z35anjblgnhk4F/abhggBt9Io3DAaM1poGgUzeg3nFnT7JsPWh+sg/gSO/xt2A
         PiI01XzgFqjauZrnEWioVjOjwNAIUlFntShMFYDb0yu61/+kOysv6XubsqfmCNCKSYh1
         rkQA==
X-Forwarded-Encrypted: i=1; AKwUvBwPNRmzUEFn4R3wZUU8DauCjWwIPJhktzMnGXatD2ihdkEenMLEWf200h4aBgtyITeDzgJ0nqM0rYVBkkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdOGdIyN9qtrCFit7XulcqT5yP85VWCABomQXHdCaGrVYINoJS
	KKs+T1fnr9CZ4iV6MmOAfY1kIB1iAymA4UYgzQ8WtkhQT0avG1+K+t1G
X-Gm-Gg: AYBFou3mscqxiEBiRGBt8iYh7JOtNF3mnAzqbXk7i4hKadjTwY/xS2SdFlnn+6SPIlO
	KKgg4IiOxMHvT4ylNif3X0A+UiUsRUGc/p2QBl1pdnQY/4WfVuRqehX8XYLycJaW2jCNqONIEat
	hruTzC70qpJ4xmyrAlfZ67lnRoXoihbhfKADDzY3+eU1MES+9IcQoBlIM8AAPlS3a0t79AVKyBn
	AcQa8sHWKX4FAYtdevHi66K+hH5HVTXYtgbK6Y0QUzbtjRU0nYI4U0JlBZykMl4y0JBB876adFg
	tlM+U/L1ONYRuqu7w9Iqknps+J7DpNz6I59GiHzZr6C0gaiKAXdbpBoKGWhyJLG3+T2j0seKrFv
	HhLM+B/Zufj93MqtIiDysrln91QX6WGuTIGnjDgQjyIcDrBm7gVjg3DcnTZFQ5q2UbiefY/OR6f
	XrFYtoE9uqhCMGFCFZLRbQGTEF9ClLuHlBwtzIcJvI0MsR86OSLM0D5rR2AtoalQNOuqHHCym4P
	NSvXLb7iIJ8uamqyrIk/1ITERkeAsInV1lCTZ3BtyS+s0YLVkpd99i9tPoYWMo/HFvs2O491QHw
	RM1LJDMuyonHhTiAQbgKTsJtoYC4EPwZnx34fd/sgvjQrdi6
X-Received: by 2002:a17:90b:4fc2:b0:3ac:403d:6232 with SMTP id 98e67ed59e1d1-3ae583142f1mr837945a91.55.1793160235391;
        Tue, 27 Oct 2026 21:03:55 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5834b1sm952468a91.13.2026.10.27.21.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:03:55 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] afs: Fix NULL stream dereference in afs_retry_request()
Date: Wed, 28 Oct 2026 12:03:47 +0800
Message-Id: <20261028040347.843936-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

afs_retry_request() is registered unconditionally as the netfs
.retry_request op and serves both the write and the read retry paths.
The netfs read-side retry path, netfs_retry_read_subrequests()
(fs/netfs/read_retry.c), invokes the op with stream == NULL. However,
afs_retry_request() computes
list_first_entry(&stream->subrequests, ...) *before* it checks
wreq->origin, so a read retry dereferences NULL plus
offsetof(struct netfs_io_stream, subrequests), producing a near-NULL
wild pointer dereference and a kernel crash. The read path is reachable
from userspace through an ordinary AFS file read: a failed fscache read
(source NETFS_READ_FROM_CACHE) or a short/partial server read marks the
read subrequest with NETFS_SREQ_NEED_RETRY (fs/netfs/read_collect.c),
which drives netfs_retry_reads() into netfs_retry_read_subrequests() and
hence into afs_retry_request(rreq, NULL). The existing switch on
wreq->origin already rejects all read origins, but only after the stream
has been dereferenced - too late to help. This issue was found during a
code audit.

Fix this by moving the origin check to the top of the function, before
any use of stream: read requests return early exactly as they do today,
and list_first_entry() is only reached for write requests, whose callers
(netfs_retry_write_stream(), which explicitly skips empty subrequest
lists, and the unbuffered/DIO write path, which holds a live subrequest)
guarantee a valid stream with a non-empty subrequest list. Behaviour on
the write path is unchanged.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 fs/afs/write.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 7f34b9397..4b4922858 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -191,10 +191,12 @@ void afs_begin_writeback(struct netfs_io_request *wreq)
  */
 void afs_retry_request(struct netfs_io_request *wreq, struct netfs_io_stream *stream)
 {
-	struct netfs_io_subrequest *subreq =
-		list_first_entry(&stream->subrequests,
-				 struct netfs_io_subrequest, rreq_link);
+	struct netfs_io_subrequest *subreq;
 
+	/*
+	 * The read-side retry path calls this with a NULL stream, so check
+	 * the origin before dereferencing stream.
+	 */
 	switch (wreq->origin) {
 	case NETFS_READAHEAD:
 	case NETFS_READPAGE:
@@ -208,6 +210,9 @@ void afs_retry_request(struct netfs_io_request *wreq, struct netfs_io_stream *st
 		break;
 	}
 
+	subreq = list_first_entry(&stream->subrequests,
+				  struct netfs_io_subrequest, rreq_link);
+
 	switch (subreq->error) {
 	case -EACCES:
 	case -EPERM:
-- 
2.30.2

