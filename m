Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190C54BEE4A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252777; cv=none; b=KJF6/tznKH0UOv/se9RAx4LPmkMlthq8zNdPRqbsNAIuilnfej64LCGY7kcED9PjwR+izy4zoJthWUur9VC839F7EPL51EIdSsKYVzimVKzQg6Jduzqu3BaN8h/ahM1NNfcyG8zZ8FAbIEiElprh3t5JpLQko3W3ZAc20FI+WuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252777; c=relaxed/simple;
	bh=we8mnm/f613zZ1ll4RJjRsvqMgkHwaThiDyN6ZY3sDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urPAHGdJJ9+PDLMkn/lcpKaTgXf9b6w4yVsR8NItkl+45IJt+dwC8wEd99j2ibJAG548cLle/0o4UF0yJJBbGtAsO/XKczHkcfqWqE0hvx9GgGsbk7qh6LEreujTy/tVtNxvI1jbaMZqWMIGNFk8tkgkUXtROHq3YZDTJFvZhys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXCAAUSh; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXCAAUSh"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-939b5ded99dso209298185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789252775; x=1789857575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOGMTD5LGSJ43nsYgDh0j1HHamIrGJcLYj3gibAvI+U=;
        b=gXCAAUShukG95VEURrZteW/3GL26Yz3iARH0wQ/VFIxsP1REsxycrRYBYsVcV9V1oR
         Js+3bJ4VbfoqVNlAP6A+8mIzxNRQfrWnCtq4vSzbH7dfxiUKIiotVttXsvMVKgMW01nv
         3TYB+0vYvBfRlawuQQS9+RtJjgyd1CXWoee/CJc6yXyH7OCYI+9xN+xmqX+oQdasuH5o
         0EhjwUl1pW3QXqwjuOTY39HFmzaoxspwaV8Iv46WE7LoXCGDZAOKdsXTAUK7XF+I8ZKJ
         mCAajIEIkZ+g5LA6270T2w55dlkq2PQEmKbMaIHowzDH2/LkXqcTxuPfWWqcgC9DDPh6
         7Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789252775; x=1789857575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOGMTD5LGSJ43nsYgDh0j1HHamIrGJcLYj3gibAvI+U=;
        b=IgiZnA+GaxD+JnHHrlLx+yWL65f8nUG+WqW6BH0NoG3gK12wRtmFZE5ovNDsA8GfLA
         Tiu08SqbqJSUWTvCAjZ1/5gt7+7JlEWYYj26I9QvNOPXfOVBk+PC27hvc9vdS/9rLL1U
         TZL7w5TAaRtLfYODvWCC7oHsjiv50qORysv4msIXaNQr2u1c2PmRA4j9+nW0iLTKyBE5
         nKwF8Bwtpn0hIKYrAI9dlPp5HVOPwvyi1dfhZOX/i1cJ7QzZKpzrd/faYqtZAJT7Tq/j
         EBhDrfq2Syr6lfUKA6Ec76SN7gY5U5NiQ2x0o5/5+bq+T6S6N3SQVDWZ+IJvvtbtMuza
         HAGw==
X-Forwarded-Encrypted: i=1; AKwUvBwvbMb59XlNszS2nccjgHJBSHFTRzHuakCUf06YlOLWss845GpsXWxMVdOUY9aGKOc8L8AWel57bI3cOJA=@vger.kernel.org
X-Gm-Message-State: AFuF++kNT3T4Wa5SxvM6lKKxw2DMOxGGemt5OhaqDVK7i/Lf5+pJJbCA
	m/0wjX4Yv09rSQMx/4x4vRu0OwYC++vH24UizsQWLr9d9uxrflcfQ8njIZJ9Mk+F
X-Gm-Gg: AYBFou0Kk3kq05pfR7ykRQ9Rem5LEldaVJmQ/WdgohKYAHj3YS+9QVnzllnfZ0yNC/d
	N0CT0mj/sLzOryBkyuAjcK52pLMLPiIc5NXCsxugVr721u/G7RVZmGIrEJEpm1PHaHF6hGDZHKn
	Ye1zf1IUuREPFIQZ8zr1rm7yQeTtwRyIphx/4aXZKCsHzj3033WJZb8Ie2vYwCKRvQ38vpF9ZTR
	lIaKhCzqzPaqn9NBn/kNYjKh/MAuorNGy5rJqrp8JDvC9vJTCtxjH0fH8ECKaipiG4A08QpRuPi
	OhU/F6c7V3kNoNKwZrfxrwN9kpzj9JdKLZZJXwwmISE/h2mEuPub80FBQ7HBsvObSP4F1zxM2/X
	XSKNw/LdZhkj5iqT7kaePol5B/3P2hNC78P4lNu1Z/2GmfFD9sdvK3R6BaQvoQkuFQTj38d0SGr
	fKwVFH7lWXlP658XQikXXp8rwocdbxaZAwy/WzGDRMfs+8yPneKNqZ7ISxX8oXFvihHpgciEwGu
	tkTe0RFBTQHnMlSV3ul6LjEhvuxaoxc/5D/l4ZDic1S3wjWqx1+ec0KsXdNcINngQNvRXjU8b3t
	2wN4Otf3Svqv6kXwImU=
X-Received: by 2002:a05:620a:17a5:b0:93a:12eb:b626 with SMTP id af79cd13be357-93a12ebd99dmr245498185a.4.1789252774908;
        Sat, 12 Sep 2026 15:39:34 -0700 (PDT)
Received: from docker-runner-pve5.tail732951.ts.net (bras-base-toroon4524w-grc-16-76-70-76-130.dsl.bell.ca. [76.70.76.130])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ebda519bsm537893485a.26.2026.09.12.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:39:34 -0700 (PDT)
From: Mykyta Bozhenko <caudadragonis@gmail.com>
To: richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] um: ubd: perform the flush the block layer asks for
Date: Sat, 12 Sep 2026 18:39:32 -0400
Message-ID: <20260912223932.2941631-1-caudadragonis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ubd sets BLK_FEAT_WRITE_CACHE, so the block layer sends it REQ_OP_FLUSH
requests and, as Documentation/block/writeback_cache_control.rst puts it,
the driver "needs to handle them". do_io() does implement that: for
REQ_OP_FLUSH it calls os_sync_file() on the backing file and maps the
result back into the request.

That branch has been unreachable since commit fc6b6a872dcd ("um: ubd:
Submit all data segments atomically"), which replaced the single
per-request do_io() call with a loop over the request's data
descriptors:

	-			do_io((*io_req_buffer)[count]);
	+			for (i = 0; !req->error && i < req->desc_cnt; i++)
	+				do_io(req, &(req->io_desc[i]));

A flush carries no data and ubd_submit_request() sets desc_cnt to 0 for
it, so the loop body never runs. The request is handed back to the block
layer with error 0, i.e. the flush is reported as completed without the
backing file ever being synced. Guest fsync(), fdatasync() and journal
commits return success while the data is only in the host's page cache,
and because no ordering is enforced either, a host crash can leave the
image in a state the guest never allowed. The error path is dead too:
a failing host fdatasync() cannot be reported.

Measured on a UML guest with ext4 on ubda, doing 20 writes of 4 KiB each
followed by fdatasync(), then one fsync() and one directory fsync():

  before: the guest sees 22 successful flushes, /sys/block/ubda/stat
          reports 16 completed flush requests, and the UML process issues
          no fdatasync() on the image at all
  after:  the same workload results in 43 fdatasync() calls on the image

os_pwrite_file() is entered 131 times either way, and e2fsck on the
resulting image is clean in both cases.

Honouring the flush costs what the flush costs. With the image on host
ext4, 400 iterations of write() plus fdatasync() in the guest take 467 ms
before and 2007 ms after (medians of five runs). uretprobes on
os_sync_file() attribute 1.597 s of that difference to time spent inside
the host's fdatasync(), the remaining data path being unchanged
(os_pwrite_file(): 19246 calls in both). A 64 MiB sequential write
followed by a single fsync() goes from 278 ms to 362 ms, due to the
periodic journal commits. With the image on tmpfs there is no measurable
difference.

Users who prefer the previous speed to durability can disable the cache
per device:

  echo "write through" > /sys/block/ubda/queue/write_cache

That is also cheaper than the unfixed driver, 326 ms for the same 400
iterations, because the block layer then completes empty flush requests
without entering the driver at all.

Fixes: fc6b6a872dcd ("um: ubd: Submit all data segments atomically")
Cc: stable@vger.kernel.org
Assisted-by: LLM bpftrace
Signed-off-by: Mykyta Bozhenko <caudadragonis@gmail.com>
---
Not verified, stated explicitly as the process asks: the change was built and
exercised for ARCH=um only, on torvalds/master at cba2348ab and on v6.19; no
other architecture goes through this path. The flush error path, map_error() on
a failing host fdatasync(), is reachable again but I could not isolate it: the
block layer fault injection I used fails the data write too, so the EIO the
guest observes cannot be attributed to the flush alone.

The numbers above come from a single-CPU guest with 10 ms timer granularity,
which is why they are medians of five runs rather than percentages. Host side
counts are from uprobes on os_sync_file() and os_pwrite_file() and from the
sys_enter_fdatasync tracepoint filtered to the UML process; the guest side flush
count is field 11 of /sys/block/ubda/stat.
 arch/um/drivers/ubd_kern.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index 20fc333..bb1d990 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -1516,6 +1516,18 @@ void *io_thread(void *arg)
 			int i;
 
 			io_count++;
+
+			/*
+			 * A flush request carries no data descriptors, so the
+			 * loop below would never call do_io() for it and the
+			 * flush would be reported as completed without the
+			 * backing file ever being synced.
+			 */
+			if (req_op(req->req) == REQ_OP_FLUSH) {
+				do_io(req, NULL);
+				continue;
+			}
+
 			for (i = 0; !req->error && i < req->desc_cnt; i++)
 				do_io(req, &(req->io_desc[i]));
 
-- 
2.43.0

