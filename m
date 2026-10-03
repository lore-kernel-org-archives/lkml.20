Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FB1E5018
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025311; cv=none; b=nYA9IUKao81YePiuEZYupAZwzwLDIR2zb/5f+NJzPQR9Dk1agwTZ/XRHRp295xsFoY235mpMgj6h/RaNhna3TIJVkutmfbl2k2IUVZ9GHeuE340x/uSFlPbMF34eMEGP0tYsmP92lw7jn4sUxBYLPJmIvVCjtZRaU161Bi3L574=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025311; c=relaxed/simple;
	bh=oxz6Hnxbn2oHmeqY+Q26PyVBH/quzvwQKwumGfN9c8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SSlX6e6WUcrPXvIW8ypUyaK9APi1heJSIz7090C2aNVL+9ep2T9DSd0ddYOIvsWPmw42NbQEfIATTbsjkO85Nlg7xUF1fuaYa4w4utQ48ikgwvWcKdIXkXbMvYj/yK/EyXIQ1zSfIL+yM3XhGnbtJbqhajsCJ8y899edVLS1Fv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4iP4ZG8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4iP4ZG8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso184946f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791025308; x=1791630108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U88Dx/fLCGECyYQCess+Hy3G4KhGKCmrl9990XZefic=;
        b=O4iP4ZG8hdRmIWAKVnOxFGyllxBqp9/xuOw+n45gSaLToSL7x9k/OmLUT5tdb5vYkS
         ExfrlsUaqfjtmWsJVLuXzh/vd0yvQ7RZ3Z++c4xWWufF9UPmHIl47voIW3/Z23TjRei7
         nKNiKCyBDaEN0lR/xJ/9E6utecJ/a/k06UlP2e8CbFLmmFpoAGFRDb+7uUE5RS6k/86U
         IvsWA+fpYUQgmTZu+hWSo08ttPA0OPdxd50c9tKGP5Svi9SXifOVzf5fSYYa/cy7el0v
         KWmF/evz1f27eSoKXfg4bPevhwYzdrYoYOwRSXVcCl08NA1IdtnzpuHilEQr0ZJ6WbTa
         e4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025308; x=1791630108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U88Dx/fLCGECyYQCess+Hy3G4KhGKCmrl9990XZefic=;
        b=P+nQnDqMQUK9OgA077udyGv9WShrJ9iloqycaQY+MCn9kQjBWoiLe5XR/iCt2N1Jqu
         3+d5zxqRR74jc4vFif6O8KMZS0sLOXXL6zp1pj33cZUMDQ2dNpw4DPOGrcMuQaqnfXv5
         VBBu3WMhXd40IO4xYN5LMXSxNPm86rD+Svdc+9uF5QAvbU9+pmN9gfpJ4MSNEnNETdcf
         tWyUFZ95yVfDffu+bAreDbri13yaBHGpF9fbd9BmKBvU1pjQFUDKQpOHcOX1UlV4FRHK
         7qTLewL9Igz6N6mGzAoRQPMxV5Mv8QdLU6oeIp/ytKNNwCRkkch3qOttI2jvU8VJAgbf
         AgyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXhcXeB4PKe3lX//MFuFZLgIyMglnT3PawCclCrZW2niVGHfZ86zqmul8iyex7xOpG9xad3+PScG0XU+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7VyjYWNHoTv00U/6nJE8/PCKrS3gR+m0TvoXvaN9fAImm0B8H
	tky/V9/dZoQFnnhMtunnDhxLiWTz5fBTjj/f/o1haEEaPN6Dh4vkKozw
X-Gm-Gg: AYBFou2nEkAQ81Ig1ta/TuugHm++vw79ixKFmPRsjssnZ70zbcGJuof89kOTWqfu4H+
	w5XxcQ6usdTCnV4+/57x9BGLugnIi5psXbFvytmW+NStnsCCybxEmt1TbEA+gv6bSXy0W+xWyOU
	o+rzdnYZ5BC9gMx4E6FCMpCe/bry8h4rK5oLz5qLiHXScuYm0bIDw7gReBMCNY7FIalHPOd0us/
	We6RuJxKYtIG49z1VnZzrGwcvFYOFsVH0lJJHXz0R+fyK4zxJfYnweMkU7ck8NFAyq8/1QVzKuW
	8THHQZaVSA0QiXnbPbVtZ8gMW1tCk65gXlEKviKGf8bjj286KkXAMJ42pedh/iX6UTrPttCC/V+
	VTbzApKJXP1fZToEI02ueSZ+VqCqgtZwbd8+qJxVQaqCn78S4/2Tj+uchuKbT92UbzuRWzccWRH
	BgQDInsNhoyFexBWevEeBXAkvGbn8fLqhxUVoKP+yXvNuIxcmlBe/9j60dWtlt734ojgpt8DD77
	dqKcIdOgLnSgPQPowJ67OpT/tY1j7gTuX6CC05V4krvVS6yno+RpMN7EmvVPvvPOrUsxN1UA7/Z
	ye7BAAejvI6qmrL/siZ0VuO+M2bAS5h2Q4SxhUhfZziL1miP3BokGsmbFY/UJsbLAK/N7R3XfgD
	rOydngaU6o4kjGlYsmA==
X-Received: by 2002:adf:e80e:0:b0:48b:437:8fbb with SMTP id ffacd0b85a97d-48b067c013bmr13201711f8f.19.1791025308156;
        Sat, 03 Oct 2026 04:01:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38103856sm12316254f8f.25.2026.10.03.04.01.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 04:01:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] userfaultfd: docs: Fix an error code, two names and the POLLERR cause
Date: Sat,  3 Oct 2026 13:01:37 +0200
Message-Id: <20261003110137.88619-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four statements in userfaultfd.rst do not match the code:

- UFFDIO_COPY is said to return -ENOSPC when the monitored process
  exits at the time of the copy. That error is -ESRCH since
  commit e86b298bebf7 ("userfaultfd: replace ENOSPC with ESRCH in case
  mm has gone during copy/zeropage"), and userfaultfd_copy() still
  returns -ESRCH when mmget_not_zero() fails.
- the postcopy example says that UFFDIO_ZEROCOPY is used for zero pages.
  The ioctl is UFFDIO_ZEROPAGE, as the same sentence says a line
  earlier.
- the write protect section says to clear UFFDIO_WRITEPROTECT_MODE_WP in
  pagefault.mode. struct uffd_msg's pagefault has no mode field. The
  flag goes in the mode field of struct uffdio_writeprotect, as the
  paragraph says when it sets the flag.
- poll() is said to report POLLERR "when ranges supplied were
  incorrect". userfaultfd_poll() never looks at ranges, and an ioctl
  with a bad range fails on its own. It returns EPOLLERR when the
  UFFDIO_API handshake has not been done yet and when the file does not
  have O_NONBLOCK set, and it did so when the sentence was written.

Say -ESRCH, UFFDIO_ZEROPAGE and mode, and name the two POLLERR cases.

Fixes: e86b298bebf7 ("userfaultfd: replace ENOSPC with ESRCH in case mm has gone during copy/zeropage")
Fixes: 25edd8bffd0f ("userfaultfd: linux/Documentation/vm/userfaultfd.txt")
Fixes: 57e5d4f278b9 ("userfaultfd: wp: UFFDIO_REGISTER_MODE_WP documentation update")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/mm/userfaultfd.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
index 783d969f0e28..97daea83b7f1 100644
--- a/Documentation/admin-guide/mm/userfaultfd.rst
+++ b/Documentation/admin-guide/mm/userfaultfd.rst
@@ -199,8 +199,9 @@ Notes:
   those IOCTLs wakes up the faulting thread.
 
 - Be sure to test for all errors including
-  (``pollfd[0].revents & POLLERR``).  This can happen, e.g. when ranges
-  supplied were incorrect.
+  (``pollfd[0].revents & POLLERR``).  This happens if the userfaultfd
+  does not have ``O_NONBLOCK`` set, or if it is polled before the
+  ``UFFDIO_API`` handshake.
 
 Write Protect Notifications
 ---------------------------
@@ -218,7 +219,7 @@ protect as many ranges as you like (inside the registered range).
 Then, in the thread reading from uffd the struct will have
 ``msg.arg.pagefault.flags & UFFD_PAGEFAULT_FLAG_WP`` set. Now you send
 ``ioctl(uffd, UFFDIO_WRITEPROTECT, struct *uffdio_writeprotect)``
-again while ``pagefault.mode`` does not have ``UFFDIO_WRITEPROTECT_MODE_WP``
+again while ``mode`` does not have ``UFFDIO_WRITEPROTECT_MODE_WP``
 set. This wakes up the thread which will continue to run with writes. This
 allows you to do the bookkeeping about the write in the uffd reading
 thread before the ioctl.
@@ -584,7 +585,7 @@ The QEMU in the source node writes all pages that it knows are missing
 in the destination node, into the socket, and the migration thread of
 the QEMU running in the destination node runs ``UFFDIO_COPY|ZEROPAGE``
 ioctls on the ``userfaultfd`` in order to map the received pages into the
-guest (``UFFDIO_ZEROCOPY`` is used if the source page was a zero page).
+guest (``UFFDIO_ZEROPAGE`` is used if the source page was a zero page).
 
 A different postcopy thread in the destination node listens with
 poll() to the ``userfaultfd`` in parallel. When a ``POLLIN`` event is
@@ -672,7 +673,7 @@ asynchronously and the non-cooperative process resumes execution as
 soon as manager executes read(). The ``userfaultfd`` manager should
 carefully synchronize calls to ``UFFDIO_COPY`` with the events
 processing. To aid the synchronization, the ``UFFDIO_COPY`` ioctl will
-return ``-ENOSPC`` when the monitored process exits at the time of
+return ``-ESRCH`` when the monitored process exits at the time of
 ``UFFDIO_COPY``, and ``-ENOENT``, when the non-cooperative process has changed
 its virtual memory layout simultaneously with outstanding ``UFFDIO_COPY``
 operation.

base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
