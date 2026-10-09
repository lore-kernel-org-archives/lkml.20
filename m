Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF538DC69
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516407; cv=none; b=gabovTrhkAvG/LLSK3gLQn1ebVoKuNc8IRwcdTs0SSoP8bypByaZjJmtyeGnpRPJyld2daFODksIgw/qas/bYPX5Zlj8vlo/ySscGflCg8lBE+bA2RuwCS1jC9dZER6NYe6lk/S6lH+y+BfKT+e2Q2czbjrvQYSuGgEyLUg9l1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516407; c=relaxed/simple;
	bh=a7zHqrMj8ltjJpM0sNDbXHJaz5KLofXlEk4pWj+B1bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIw36PtjTC2tD8WhvxOfwUwUcZKyIeaZNuLjDbEfRbfJ+F1ZvhDYgsDCa5B2YTASjFUshB/zIPyMt1IhkqNWrMoXxocI1r7nUef+U37E2FHtZZN+DreO3OQblQXOGvcStpPzqgFIk7GtO8kqlTYLfG8OeZwP8/Uj2v9jAnyEz9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilLvOIcI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilLvOIcI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3044199a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791516393; x=1792121193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYAohfURFktRBLdiWxIwClXMCDAhfiRzTvJlH6pEOZU=;
        b=ilLvOIcIMa/wMrhJp3ledXB/nJ4VPqmQAijB98NRcCLCPTDd4cpB+u5bjtRR5ZCAiE
         hKAGIpKGGORX0FONhq+HjlqXJv/3NqTUK6zSURt76oCjAa5BlVEZ70e/Zppzg9KCc7wj
         js+Nd/n/XI1V2LyPN9s5R+D7f+frpdbJ1DkWolp0nl2OXzISnatQ0spyN76niX3xvnEc
         uCpEiEur9deoQFSTc4JF0QsBVO/nWeRfEJxTK3m/wdbWn5Hh/PbhsAcAskFRFxHTx9+K
         OTZ2cqaFJCniYFj5wJCK9RMBTX5L9j1/7mY9N3fWvyyYI+J27IKK/4N6+hj+RGA0Pear
         ZMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791516393; x=1792121193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYAohfURFktRBLdiWxIwClXMCDAhfiRzTvJlH6pEOZU=;
        b=sp/kL9UXgG5VYXAjn3s1M4050en+10AwI3jxEyXs/qBTsb/AsqPh//QMP0tr05izzg
         Lr0Y13pfdH9vxyOj3G6G6laN1VwSVobbJFeLe8l7VnHXW4rMwQadu3eZIsLMbNYjmV4E
         Lm0N+DDfJeTesYxj3oceDzEemabAjjMFVBxYw2zGicM6uFX9DBlbnhKgLKqra9u70x35
         avDNZgp8dtNzvDR6sV/0ekgGv/jp8eMcQsY6iDd6zw8fDYykbyj7xeOSeFKiPGIzxnrm
         NXqFBw9EtJeNll0US0pSfNOyvhztRSW+ZOyYl63gLHs53RzzfTmjYLzufAqD+KigQ8gc
         E6Iw==
X-Forwarded-Encrypted: i=1; AKwUvBze2J02Piukjhp/0jTiCXnMJ5EEzf5evpd62CGMerWyPBRsXHekYsqoz0ZfHSNGE0DrB6VPxmIKTFIuqMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwOgCleyRSGKFc50nU4JzyM1DQL7d4ei19uTZPNaiMJr94Bi4H
	5+oKsPuQZ6UzhLNE5pRcZLUVU7nP0p6Xtvc5ECKcrLMtnCRBwpRYeD6q
X-Gm-Gg: AYBFou0L1wUBOR3jaerMgGqboW7wXXlTvG2Ikx+0Q/+F7H9jMj356qMQVAZmiycZQ8f
	Ep/7hpgCPfeWM9wBgpgI34iIBh2Tg1yEyuD2pgiO5fs7NnenURnYcvhgu0otGUhQSxRyK/QYtbh
	rw0Nuu6XCpomVIdwAYFVEr5txymJFi/dJNxmLm2eoiI/lqUEYHS8ImR2MA3dP4aZt4/fJmGWI0Q
	+Ie5lnEEjSjvyuY/J8dwuNGH/rqtvwk8iJ5pZLlscL8QGOBVw5oJ79/lSAtxncePOhz60HI8cJn
	xZHe6w9Ez99KIKLRPeYglbRvfXRe5x1L4Af03XLNq4tBybHDEjVaeRFHhn2FiPNaLNJF8P1tKBC
	cWur/PtuAyXUKQDkpmZa+KiNOQLsOFwmsYey1WmSMdvM8MWSGEoj88yy6IdDq/EdDuWjWOjHbSq
	Kc2O7QxbRdiH78fTxFPEEVihvbnSmDxvyOE4i3AirLKnXoJH5l/kw77Z8V7XoJGUgn8Xp8rxac5
	R/Tw7j+e6cQ+UiHCM7GzB1Ayhg0H7ZR6FIpQHu84FqUWIinm/1dbH/+Sbv29QZol48XRBLHFC3X
	kZuWE9HA
X-Received: by 2002:a17:90b:4b09:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3ab3ac58076mr575751a91.14.1791516393448;
        Thu, 08 Oct 2026 20:26:33 -0700 (PDT)
Received: from 0xiviel ([49.224.123.154])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371b2f2bsm1436401a91.15.2026.10.08.20.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:26:33 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: stable@vger.kernel.org
Cc: Lizhi Hou <lizhi.hou@amd.com>,
	Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.18.y] accel/amdxdna: Bound the sync_bo flush range to the BO size
Date: Fri,  9 Oct 2026 16:26:14 +1300
Message-ID: <20261009032616.432392-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit dbc8fd7a03cbc0704e8e558a448015f620547a02 ]

amdxdna_drm_sync_bo_ioctl() passes the caller's offset and size to
drm_clflush_virt_range() on the BO's kernel mapping without checking
either against the BO size. The ioctl has no permission flags: any
process that can open the accel node controls the offset. Any BO with a
kernel mapping reaches that call: AMDXDNA_BO_DEV_HEAP, AMDXDNA_BO_DEV
and AMDXDNA_BO_CMD. A DEV_HEAP is vmapped, so an offset equal to its
size lands the flush on the vmap guard page.

Measured on 6.18.55 on an AMD Ryzen AI 9 365 NPU, firmware 1.0.0.63,
as a non-root user with access to the accel node: unpatched, an offset
equal to the 64 MiB DEV_HEAP size oopses in drm_clflush_virt_range()
under amdxdna_drm_sync_bo_ioctl(), 2 of 2 runs; patched, the same call
returns -EINVAL, 2 of 2, and an in-bounds sync returns 0, 2 of 2.
DEV_HEAP is the type tested; DEV and CMD are by code reading.

Upstream bounds the range in amdxdna_flush_bo(), added by commit
dbc8fd7a03cb ("accel/amdxdna: Add expandable device heap support").
This applies only that check: an offset at or past the BO's end, or
an overflowing offset plus size, returns -EINVAL.

Deviations from upstream: that commit adds a feature and is too large
for stable as a whole. It calls drm_WARN() when the check rejects a BO
whose type is not AMDXDNA_BO_DEV, which userspace can trigger; this
fix does not. Upstream bounds AMDXDNA_BO_DEV by the heap chunks it
spans and flushes only the overlap, reporting no error for an offset
past the end; 6.18 has one heap per client, so this fix uses the BO's
own abo->mem.size and rejects such an offset instead. As in upstream,
a size past the BO's end is clamped, not rejected.

Built from v6.18.55 with the test system's distro-derived config,
DRM_ACCEL_AMDXDNA=m. The touched file also compiles W=1 clean.

Fixes: e252e3f3488a ("accel/amdxdna: Revise device bo creation and free")
Cc: stable@vger.kernel.org # 6.18.x
Assisted-by: LLM
Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index ca747457cec7..95d04af2b993 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -934,6 +934,7 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 	struct amdxdna_drm_sync_bo *args = data;
 	struct amdxdna_gem_obj *abo;
 	struct drm_gem_object *gobj;
+	u64 end, size;
 	int ret;
 
 	gobj = drm_gem_object_lookup(filp, args->handle);
@@ -943,6 +944,13 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 	}
 	abo = to_xdna_obj(gobj);
 
+	if (args->offset >= abo->mem.size ||
+	    check_add_overflow(args->offset, args->size, &end)) {
+		ret = -EINVAL;
+		goto put_obj;
+	}
+	size = min(abo->mem.size, end) - args->offset;
+
 	ret = amdxdna_gem_pin(abo);
 	if (ret) {
 		XDNA_ERR(xdna, "Pin BO %d failed, ret %d", args->handle, ret);
@@ -955,7 +963,7 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 	if (is_import_bo(abo))
 		drm_clflush_sg(abo->base.sgt);
 	else if (abo->mem.kva)
-		drm_clflush_virt_range(abo->mem.kva + args->offset, args->size);
+		drm_clflush_virt_range(abo->mem.kva + args->offset, size);
 	else if (abo->base.pages)
 		drm_clflush_pages(abo->base.pages, gobj->size >> PAGE_SHIFT);
 	else
-- 
2.53.0

