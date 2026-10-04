Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5F1990A7
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 05:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791091178; cv=none; b=fCz4tb9cdTcYM8vG0yJ5tqeZk8tf8WDYXqSW0VGy4SMpYrKAEhi0f9XysoG3crpFqpl2r3XmDVBaXqKg8PkGDj3Vha3rqwCSPM0ThgT76XEDhiOju87fVmW1fyafqMnABC2BAOxLT38OoHuFfpAw1WfUDAUR5Sv7rIqgRpI24xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791091178; c=relaxed/simple;
	bh=v5kumIhHbooVZld8KDR9rDAofLM2FcxXbLNFfLzX0qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fi9YPH3tGrf8nHjDfAei/ZAq9aorPccJ0uAxFQrtROczC7N4tSzckkvXiZvW6RpmXdfx1CFkZv896wlGVySr5/5VXKCgPiNcz9XdmCB52/GqkNdoZLJ4PhNDDjmiwbM4V9Uy7e+OttEOXq4a9GdF30r+LjzfqPC4z1OPavqv9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/4dCk6e; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/4dCk6e"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351224e684dso498625eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 22:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791091176; x=1791695976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1bncc+l1XtOKFTC71CmsTDedtb/IE0KuKezygnmB3M=;
        b=j/4dCk6eCp/yKc56z4huCoNstXX9KudqE77Scbto09krQVfKDH2V6LMvTuTM0YzAZz
         XPM1yvgrdM77UcAEiF+EOUIvHICzVtRmbp2nTV/fd8FKRnZbbmck9SeD533YutPiStoJ
         tHgQVSzScod9Do8/8FecV2AB0U9R2bj0z7sPap9itKacFSmOZOuEwvnIyh2sVQpyMHbv
         32E05YrINklNMM0M8/ClOeNIgj14i4xvajPkPs0/VWRtR3P9s/cml7E7D21nMXkYMh8x
         V5Ohnq+CLHYpKdn/1iqX3gGt53hI0yMpHpJAH8MSYFCiZ934vWbNFj+BVx/GW+6ViHNS
         mYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791091176; x=1791695976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1bncc+l1XtOKFTC71CmsTDedtb/IE0KuKezygnmB3M=;
        b=bibbLH7usH4OBic+3VVe2papK8+n889ejSUpAYZGANfPQFmNKqNn01+q7Z1rap9MgZ
         5VvhPOE848Nqou5w5D+HJAndpd/XZIjNxP+p48aeei5krStTobb/cTzB1IR0HcX2Nn5Q
         6YOiS1JjWRRSRLfcPnWyqNMZZl077TSfaMY5xXtTiN7Ja5lLVWbZqsh+sAveSDkjdS37
         I7lyLUYrE5V2vu+amoZ7hzHBnmGI+wNeIxQtkL8umqPSXnGsygcCefcG4ACJlL1u1eyX
         NVpdku0GHQB4Dp+638LpnLePeP9QH0B0hzk+tqWohfeX5dFZ1WxDK6NN81XdD31rilDh
         WAwA==
X-Forwarded-Encrypted: i=1; AKwUvBz99/ekSUWWCuY/3GfEWbSBYfytPrRQnYhQtQJC+hoHEu8uAymq7jalbk0rplhQ1arV8+dx785GGU+xWhM=@vger.kernel.org
X-Gm-Message-State: AFuF++ndrUXuKh5VMdOVJSsSPL7GUlJxYk8HvMp4Fgzs/g2wJsjqN5vH
	NKdAFiXpBqd9s0GWsuoYeL10lLhbyGpdfYWhrk89bnwzuu/83lU8CmQb
X-Gm-Gg: AYBFou1QwSbSCHtomS43FC+w1om53VLbRhmEEc/bepkK5BxnYaGiSt50EABVkiPKqO7
	mYXfe1lMguIPUVYS0SqZHUFHwLA5KItgVQINWZI8NyS4LzF1FM5+Ohg39kp4T6rkWs4rp7PMDgE
	jM/cGR5ptW+0in6eyniXT0y7QyZaDkCZ1UXfYgzgJd1+w+qgoPsJ7SWW66LnuULob0oxyyKhKS/
	4CJcMOuFgA8yDlXlDWy5BblAmCS6xGqOLhfghCaDSL1aCWuyO4GBEgLvg8FhZh8mXmBQOzDhGWK
	4yTFFr6boVP+fSI8LGqIdCTRcgVsAm0JYQOI0m6NoELRUaJVUFfRFHcpplSfIO9/uQ8AMtfiB5X
	FSuf3LQOorOvkwRp5CvPYJwgIN9Oh5tsGDXK3H/DvowHOJ4tGJ5d7uwvj8t1RCBpQ5DagnX7p+Y
	LC0HWxVOk7O0fiOBkGxaQCtzqZtWHGQO1Ak2v28Okt2mwOVyP0poHsbIVEDCftmxI32B7N5pZND
	yh5t6PYCt+P08jXQocexQkaQyPpCrb80A==
X-Received: by 2002:a05:701b:2406:b0:143:46a6:b01f with SMTP id a92af1059eb24-151c36c4ddfmr5288938c88.31.1791091175592;
        Sat, 03 Oct 2026 22:19:35 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc872e43sm10699591c88.7.2026.10.03.22.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 22:19:35 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Subject: [PATCH v2] dlm: don't publish a lkb in ls_lkbxa before it has an rsb
Date: Sun,  4 Oct 2026 10:49:12 +0530
Message-ID: <20261004051912.1045-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260909112108.2281-1-yogeshgaur.83@gmail.com>
References: <20260909112108.2281-1-yogeshgaur.83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_create_lkb() puts a new lkb into ls_lkbxa straight away, which is also
what assigns its lkb_id, but the lkb only gets an rsb later, when
request_lock(), receive_request(), dlm_recover_master_copy() or
dlm_debug_add_lkb() call attach_lkb(). In between, find_lkb() hands the
lkb out with lkb_resource still NULL, and its callers go straight for
the rsb:

	r = lkb->lkb_resource;

	hold_rsb(r);
	lock_rsb(r);

For the userspace API the lkid is simply whatever was written to the
misc device, so a lkid can be aimed at a lkb that another thread is
still building, and hold_rsb() reads res_flags off NULL:

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

Make it impossible for ls_lkbxa to hold a lkb without an rsb instead of
filtering such lkbs in find_lkb(). _create_lkb() now only reserves the
lkb_id, by passing a NULL entry to xa_alloc(), so xa_load() returns NULL
for it; attach_lkb() stores the lkb once lkb_resource is set. All four
attach_lkb() callers hold the rsb lock, and nothing takes an rsb lock
under ls_lkbxa_lock, so taking it there adds no new lock ordering.

An lkb that never gets an rsb is still released by __put_lkb(), whose
xa_erase() frees the reserved id as before, and detach_lkb() already
copes with a NULL lkb_resource. The lkb_id is still assigned at create
time, so it is available to tracing and to the caller as before.

The xa_for_each() walks in lockspace.c skip reserved entries. For
lockspace_busy() that means an lkb still between create and attach no
longer makes the lockspace busy. That is the same as the request
arriving just after the check, which can already happen; the caller
holds a lockspace reference, which remove_lockspace() waits for.

The unchecked r = lkb->lkb_resource goes back to the original DLM
import, but an untrusted lkid only became possible once the userspace
device interface was added, so that is the tag below.

Fixes: 597d0cae0f99 ("[DLM] dlm: user locks")
Reported-by: syzbot+da6dc573ce5e6624f505@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=da6dc573ce5e6624f505
Suggested-by: Alexander Aring <aahringo@redhat.com>
Assisted-by: LLM

---
v2: Following review, stop ls_lkbxa from ever holding
    a lkb without an rsb, rather than filtering such lkbs in find_lkb().
    _create_lkb() now only reserves the id; attach_lkb() publishes the
    lkb. Subject changed to match.
v1: https://lore.kernel.org/all/20260909112108.2281-1-yogeshgaur.83@gmail.com/

Not runtime-tested; syzbot has no reproducer for this report. Built
with W=1.

---
 fs/dlm/lock.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 2609e4fdeba8..2b7f3ff94310 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1488,10 +1488,22 @@ void free_inactive_rsb(struct dlm_rsb *r)
 /* Attaching/detaching lkb's from rsb's is for rsb reference counting.
    The rsb must exist as long as any lkb's for it do. */
 
+/*
+ * An lkb only becomes visible to find_lkb() here, once it has an rsb.
+ * _create_lkb() just reserves its lkb_id in ls_lkbxa.
+ */
 static void attach_lkb(struct dlm_rsb *r, struct dlm_lkb *lkb)
 {
+	struct dlm_ls *ls = r->res_ls;
+	void *old;
+
 	hold_rsb(r);
 	lkb->lkb_resource = r;
+
+	write_lock_bh(&ls->ls_lkbxa_lock);
+	old = xa_store(&ls->ls_lkbxa, lkb->lkb_id, lkb, GFP_ATOMIC);
+	write_unlock_bh(&ls->ls_lkbxa_lock);
+	WARN_ON_ONCE(old);
 }
 
 static void detach_lkb(struct dlm_lkb *lkb)
@@ -1525,8 +1537,9 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	INIT_LIST_HEAD(&lkb->lkb_ownqueue);
 	INIT_LIST_HEAD(&lkb->lkb_rsb_lookup);
 
+	/* reserve the id only, attach_lkb() publishes the lkb */
 	write_lock_bh(&ls->ls_lkbxa_lock);
-	rv = xa_alloc(&ls->ls_lkbxa, &lkb->lkb_id, lkb, limit, GFP_ATOMIC);
+	rv = xa_alloc(&ls->ls_lkbxa, &lkb->lkb_id, NULL, limit, GFP_ATOMIC);
 	write_unlock_bh(&ls->ls_lkbxa_lock);
 
 	if (rv < 0) {
-- 
2.55.0.windows.5

