Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7C4B04B2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952880; cv=none; b=CRdfTaRYumxT42w3kGz//TsRYK95+ibTQxvQAvypgZovPKO4iRIkc4I+uX2kiduEyMjeTKsh3RLQ9E9xvoxyhY2j2kXd0PhwOoxmuH2bOKTLRBslEi+aKVW/FPQnWl8p0lILzB8in0DJLpqcPf+gO9gwUUNEeZDEoBTwrh/w0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952880; c=relaxed/simple;
	bh=ejKLOMfYN5cbTm0XLhNm/9cnSoVZpQ0xyMtLlfidjgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=InYeT9YocIrdV79Cv6CxrcRKDe2oM9PcK2e2kZC12Qrxso2+ba3q8gifWeceR5/53Ia1ZLaWnYTuJUJCFihuZed3AoHsHotkAkhmOOjeA2zg6bg9Bs3sAUVFGa76qjTp4FikK3OWCBtGjQz5pl//btCuhrbGZ/sSo16nx1DOq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYa+YnHT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYa+YnHT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964e480f76so6644651a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788952879; x=1789557679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUHFFioMah0sAuoQzwWsCFgryzdcGUF6ghThqp3wfNI=;
        b=BYa+YnHTNjKuHzgKRG+ySBsuIZeVouwrU5U2MH2WS4UM+DwmRuw6L4UaYaiY+sMxca
         TEGQJIgHZnZX0/zkJ0fd9OQYOgi+eWWn+qPU/GZr4DqGRTtnyQNTcBAgV4jz3zCZqR8E
         hHxExUzK0vbPfDou/jD+Uw5CBudfjOsS0iZ0uVIUGKh0iY2xMJIQdPUVj6mUKbOPg7nk
         1mhGyJjk93EgY0gv9ghgrcdleA+Aef03J7z0ysjtPKCVdk8Wshi/IB2UJCbT0nqYj67Q
         JwVLHFxb3I0d0DpP1mfFKZ2N6MRcE+a3JtTT9/Dy/Vx01zUwUytk1uN+clVEoJVs7a/s
         rSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952879; x=1789557679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUHFFioMah0sAuoQzwWsCFgryzdcGUF6ghThqp3wfNI=;
        b=ZWA3vVeGZ/BXOa1y6qz5iQQAhdDwkZNyFex9fhary4ufOeZY4iq1B1kDsN20B3KcDG
         u7DFrriPCgdGLXWpqZmK+DqQ0aedihuOJhIzpGxGZXq2lK1X65rw0cOqmJFUkI679uJ3
         JJUTrkTHh/P0mjgFn2PiVyYaEcwvkI6qnIvJo5GPZ8rNIcLnLfAqptZ3xNiIWRd/CR7h
         cO7F5XwHZ+8OdJruWz8d8vsvpLEMNWxlKwEtUUYgzXp9bB/1lgexzrGnFTU4OKrXtV4r
         QsV26zyXZ79nA3YfDGZ6mx0m/g0ZqZ4cvoFI7saBWCnMq3rlPNuhu6Ze6GsuYYaRs2Lv
         MEuA==
X-Forwarded-Encrypted: i=1; AKwUvByYqt3YM3inhscM3Ekh4vw0fXKbHanWuVH4NdFoVZA4qeC63E7i1wCmuaphSpP2+iNZirIpkRMJ6qleXI4=@vger.kernel.org
X-Gm-Message-State: AFuF++nH9vr91Vsed1OQpdb2ZWewvjRA70ZdIVh7+6LWm4stiCWUEkkj
	/l6B6CYJZ/jV59zfIXyhT8oWwSuIRakTRaFYYLyN11keb0c83MBqPAsD
X-Gm-Gg: AYBFou2uPtEHe5mvGOsskg4mt2uG8YSQQP+UF49DY8TlPB95PYil4b3AN9Be2RlF5Zs
	gITjeYSHHBOlhYAGdPFePTW6qcklbeTHasGAHHxzUR+LSY0TlhZs5toYm7tkBl2/KL1ZueiAnw6
	Zf5rA4PTej7soSlQ8lwvhkceVtfxfx0I2w1/wJk9n78iyGEget7xlksLN0fn3UTb8Puk60AVNxJ
	psKECxw3Ab5awAkBWpkNY4xz++YqyfUYGeGTe0+lkn7b2yB1T8WzDtIiSbXSHBQmLmwx3udNZ36
	+LDGdutire4TMVpUIWroCULp4Pg9SDRruY+XFOM6DJazz8qsSQY4RPudEITedZoFwIDYWDwuIDZ
	JdFYNLS2TD7wXykoZi0Ryu3OiIvycPDSGs7FSEdLSWbjvNiAq8VVY8FkBDLJ5sieDZSkvYgAz7p
	v34N+Qr4lBjKNWS73uCU27xCG6UOE2VnVSlUHJ+N6KyY5p6frojyqeWq/apbFbkNMchcWxU1PIU
	qCY/nGcQFXuaMuF9aztYZKTJF8JXaat684=
X-Received: by 2002:a17:90a:1188:b0:39b:a8d8:985 with SMTP id 98e67ed59e1d1-39ba8d80b06mr5282578a91.12.1788952878427;
        Wed, 09 Sep 2026 04:21:18 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm31265258a91.3.2026.09.09.04.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:21:17 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Subject: [PATCH] dlm: don't return a lkb that has no rsb from find_lkb()
Date: Wed,  9 Sep 2026 16:51:08 +0530
Message-ID: <20260909112108.2281-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_create_lkb() publishes a new lkb in ls_lkbxa, which is what assigns its
lkb_id:

	rv = xa_alloc(&ls->ls_lkbxa, &lkb->lkb_id, lkb, limit, GFP_ATOMIC);

but the lkb only gets an rsb later, once request_lock() has resolved the
resource name and calls attach_lkb():

	static void attach_lkb(struct dlm_rsb *r, struct dlm_lkb *lkb)
	{
		hold_rsb(r);
		lkb->lkb_resource = r;
	}

So between those two points the lkb is fully addressable by its lkb_id
while lkb_resource is still NULL. find_lkb() will hand it out, and its
callers all go straight for the rsb without checking:

	r = lkb->lkb_resource;

	hold_rsb(r);
	lock_rsb(r);

For the userspace API the lkid is simply whatever was written to the
misc device, so a lkid can be aimed at a lkb that is still being built
by another thread. hold_rsb() then reads res_flags off NULL:

  BUG: KASAN: null-ptr-deref in rsb_flag fs/dlm/dlm_internal.h:386 [inline]
  BUG: KASAN: null-ptr-deref in hold_rsb fs/dlm/lock.c:334 [inline]
  BUG: KASAN: null-ptr-deref in unlock_lock fs/dlm/lock.c:3333 [inline]
  BUG: KASAN: null-ptr-deref in dlm_user_unlock+0x2ab/0x690 fs/dlm/lock.c:5956
  Read of size 8 at addr 0000000000000050 by task syz.3.570/7893
   rsb_flag fs/dlm/dlm_internal.h:386 [inline]
   hold_rsb fs/dlm/lock.c:334 [inline]
   unlock_lock fs/dlm/lock.c:3333 [inline]
   dlm_user_unlock+0x2ab/0x690 fs/dlm/lock.c:5956
   device_user_unlock+0x1ca/0x260 fs/dlm/user.c:321
   device_write+0x905/0xed0 fs/dlm/user.c:590

Reject an unattached lkb in find_lkb() rather than in each caller. Every
find_lkb() caller dereferences lkb->lkb_resource -- convert_lock(),
unlock_lock() and cancel_lock() through the r = lkb->lkb_resource above,
dlm_recover_process_copy() the same way, add_to_waiters() via
lkb->lkb_resource->res_ls -- so none of them wants a half-built lkb, and
a lkb without an rsb is not a lock anyone outside can name yet. Callers
already handle find_lkb() failing.

Testing lkb_resource under ls_lkbxa_lock next to the existing kref_read()
check is enough. The value is not stable under that lock, as attach_lkb()
does not take it, but it does not need to be: once a non-NULL rsb has
been observed it stays attached for the life of the reference taken here,
because detach_lkb() only runs from __put_lkb() on the last reference.
Observing NULL while attach_lkb() races is the case being rejected, and
the thread still inside request_lock() has not returned the lkid to
anyone at that point.

This is the null-ptr-deref only. The refcount warning syzbot reports in
dlm_user_request() itself, where hold_lkb() runs on a lkb whose count
already reached zero, is a separate race on an lkb that is past
attach_lkb() and is not addressed here.

The unchecked r = lkb->lkb_resource goes back to the original DLM
import, but an untrusted lkid only became possible once the userspace
device interface was added, so that is the tag below.

Fixes: 597d0cae0f99 ("[DLM] dlm: user locks")
Reported-by: syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=da6dc573ce5e6624f505
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 fs/dlm/lock.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 2609e4fdeba8..73e92237fa07 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1554,9 +1554,17 @@ static int find_lkb(struct dlm_ls *ls, uint32_t lkid, struct dlm_lkb **lkb_ret)
 		/* check if lkb is still part of lkbxa under lkbxa_lock as
 		 * the lkb_ref is tight to the lkbxa data structure, see
 		 * __put_lkb().
+		 *
+		 * _create_lkb() publishes the lkb in lkbxa before
+		 * attach_lkb() gives it an rsb, so a lkid that comes from
+		 * outside can name a lkb that is still being built. Every
+		 * caller here dereferences lkb->lkb_resource, so treat such
+		 * a lkb as not found. Once an rsb has been seen it stays
+		 * attached, as detach_lkb() only runs from __put_lkb() on
+		 * the last reference and we are about to take one.
 		 */
 		read_lock_bh(&ls->ls_lkbxa_lock);
-		if (kref_read(&lkb->lkb_ref))
+		if (kref_read(&lkb->lkb_ref) && lkb->lkb_resource)
 			kref_get(&lkb->lkb_ref);
 		else
 			lkb = NULL;
-- 
2.55.0.windows.5

