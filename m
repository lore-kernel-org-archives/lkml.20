Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05663451CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526906; cv=none; b=U1ccoOjn80C1P57I9Ujv2kB538QPP0H6U4wLbibZXqlOMxUzUS3HdBZxPE97h5DYO8CslDoS0p9RiUFtino+TShb1qES7fvVlgOlBs53ITogOwgNIvsl52jWOCcDZkl3bvj4OhSEnhcnzqLj7phFLTacJH4EyhaGrEaTBXV/YXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526906; c=relaxed/simple;
	bh=Nur820jia1XdVla4bty9gBb8D3o6vytzH3lSbZmpYZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UmlCGahdUEn3sc51SeeU2scW7SD0EOujyp3vjBhuhzHaZpX1UqcZChJBencynDeQ21svthed17YAQ5o+Oy9gK89nPVpftLkybi2SJk7UbChEAzO1b8lFs4OTjXfV279X9ntkKpoXxJjgTgJXIHwDKwLeekA4oCbBqPRGPoPEO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEUQXIW5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEUQXIW5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-887beafb714so2131486b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791526905; x=1792131705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yl9vp0vQupVyoKVdIPNttogqXtRBQS71313jzYhlZk=;
        b=bEUQXIW5eZ7Os3D1OMk7NBKLs7nz6OblY+EJwCBiP1QJeVN1XpZJ7Lp6aRRcc4Wwpw
         g9ulP3pPzxsuAvvAJGjG2r+iYUmbLru67AaKO4EmFKtYANEhugc+PugvIfDvgYs3wQv9
         DhLcftZVPFMCr4o9k4WqKuZaVhb9KHDBhERCnp+Rt4cpuU2abM5mZg2s2vJSohmVWyjy
         ZNQk0Clvu9O6bND2wMV4aHN4nOyRZTyoZO3QphwsqnuihT8fnatwebAhKJ/rSK45I02t
         sQaOnkhLUKPNjeQEq0YJgIsqyAYPLR3xjwhZD3YxSsokR2rW0Slus7teqfE8XAVAZH3l
         7nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526905; x=1792131705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yl9vp0vQupVyoKVdIPNttogqXtRBQS71313jzYhlZk=;
        b=b40KYSHXVzTIHlwN5oZu0uCmyKNzhgRerIO/i44YKU093llXYxvTe5w9U5EfiVZ4r2
         MhWvXfo5wsajvTSWMOq2BEnfUkXTtOddF4O4unrYlMJg4OjyYNqbCvJ3D2iKLKMO/A8C
         Tyf+/oMpXH3w6O2tudbE//K/gtLDyfhe72mBfcShgQgpVWV0Dxh6BN04HRMS5IpM5cqW
         jyBJAXohHQvx/jjD3x0YBNCdKhpBnEt+b1NGPTXa2YXrk+sz++DKqFVzE7Ud/pFEyqSs
         FFrO+3S1bDestVsXF4FSHi3rkYl2r0Q3Ohd4bR0Szx2doz3+/U6H2uVcQg/8/3Gdxt/A
         oY2A==
X-Forwarded-Encrypted: i=1; AKwUvByOG4CuKaegNN7IUaIXhiYiIsq2C+KzAsB+8qByE0BYATyEGneVruZT0gSg70iU3/ERDBZ9s4GGejy6Cic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy7hIv2hOgsWI9vyGNoXEPZc2LPuHoV+aDreuQ8nBcXH8SRRCi
	irb1ZS/N/x5fmr7tC5BvRz6I8r3eid+V2QWtnnUVVF+yak7YzGa4ObUh
X-Gm-Gg: AYBFou3ClEBQOyE4ovkrhhRLnDtmfj70LBEWUBU8QTG+M5t+bfUxhikxijUVa3cN3ia
	kR8WstyjDBWtVDFNqwJ5mGdCdkert9mS6V8XuYyu7+tIiV/TBDAiNnKNhpqo9RDv2XY8cL5zfc9
	utO1Dyctx9YwxKn5oYmX5YBDDF8YK7vZbtKo5r4aXOUYY8nllUq2ZrSqIjS45jGHBKog0LRAY+k
	t5TurN0XN9PToto6FlHrUMzJZC8ukJpWTsGsVQ5+TnSdVIwXAifMzP0g+BCP7a9x8e6Q87Aav2g
	o2GCpgTsXZb5hmUawtlfaSK5CZXljOPBRU6xTbDMGVYaDMiJrzFPhsygKOlYQrdIsmjXwRz+aXp
	BB30z7JIsjpO5JKZhIwqJpu2OJHOJQvljohHpm2kS3xGGjOv+I9QTuUkym07S5oU43uaz/puRW2
	G6se57CDf6p3gcRBxzMY0Wd/9bsOQshvmciUsCoClcEP3A0q7BSnHxntoczza+MLCDsL2WfveSN
	nza
X-Received: by 2002:a05:6a00:4fd1:b0:880:cb86:fce with SMTP id d2e1a72fcca58-897c7ec4ce5mr844314b3a.54.1791526904879;
        Thu, 08 Oct 2026 23:21:44 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89805c75343sm139245b3a.38.2026.10.08.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:21:44 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baul.lee@xbow.com,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH net v2] ipv4: prevent in_dev_get() from returning a dead in_device
Date: Fri,  9 Oct 2026 14:21:38 +0800
Message-Id: <pm-ip-core-objects-candidate-0002-v9-1404514d79dd4560c571@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

in_dev_get() samples dev->ip_ptr under RCU and unconditionally
increments the in_device reference count. Device teardown can clear
the pointer and drop the last reference after the sample but before
the increment. RCU keeps the allocation accessible during the lookup,
but does not guarantee that a reference can still be acquired.

Commit 9d40c84cf5bc ("net: devinet: Reduce refcount before grace period")
moved the final put before the grace period. A zero-count increment now
warns and saturates the count, but cannot cancel the RCU free that has
already been queued. Returning that pointer lets callers access the
allocation after leaving RCU, when it can have been freed.

Use refcount_inc_not_zero() and return NULL if the reference cannot be
acquired, following the in6_dev_get() fix in commit 0e243671bc7b ("ipv6:
prevent in6_dev_get() from resurrecting inet6_dev"). A successful
increment retains the object for the caller. Under RTNL, a published
in_device still has a live reference, so reference acquisition is
unchanged. Callers already account for a NULL dev->ip_ptr result.

The RTM_GETNETCONF handler already checks for NULL and can keep
RTNL_FLAG_DOIT_UNLOCKED. This fixes reference acquisition in the helper
rather than serializing that one reader with teardown.

KASAN report as below:

  BUG: KASAN: slab-use-after-free in inet_netconf_fill_devconf+0x748/0x790
  Read of size 4 at addr ffff88811d70b958 by task ip_core_fixture/498

  Call Trace:
    [...]
    inet_netconf_fill_devconf+0x748/0x790
    inet_netconf_get_devconf+0x41c/0xe40
    rtnetlink_rcv_msg+0x7b9/0xce0
    netlink_rcv_skb+0x133/0x390
    [...]

  Allocated by task 496:
    [...]
    inetdev_init+0x60/0x550
    inetdev_event+0x71e/0x1780
    [...]

  Freed by task 0:
    [...]
    kfree+0x12b/0x530
    in_dev_free_rcu+0x51/0x90
    rcu_core+0x661/0x1d10
    [...]

  Last potentially related work creation:
    [...]
    __call_rcu_common.constprop.0+0x76/0xbd0
    in_dev_finish_destroy+0x12e/0x190
    inetdev_event+0xa37/0x1780
    [...]

Fixes: 9d40c84cf5bc ("net: devinet: Reduce refcount before grace period")
Reported-by: Baul Lee <baul.lee@xbow.com>
Closes: https://lore.kernel.org/netdev/20260815172032.79740-1-baul.lee@xbow.com/
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Replace the RTNL workaround with non-zero reference acquisition.
- Keep RTM_GETNETCONF unlocked and return NULL for a retired in_device.
- Correct Fixes to 9d40c84cf5bc, as requested in the earlier review.
- Trim the traces and avoid unsupported double-destruction claims.

Link to v1: https://lore.kernel.org/r/pm-ip-core-objects-candidate-0002-v3-4af089192b0b62b40b9c@gmail.com

 include/linux/inetdevice.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/inetdevice.h b/include/linux/inetdevice.h
index 6032eea2539a..a1446da64200 100644
--- a/include/linux/inetdevice.h
+++ b/include/linux/inetdevice.h
@@ -245,8 +245,8 @@ static inline struct in_device *in_dev_get(const struct net_device *dev)
 
 	rcu_read_lock();
 	in_dev = __in_dev_get_rcu(dev);
-	if (in_dev)
-		refcount_inc(&in_dev->refcnt);
+	if (in_dev && !refcount_inc_not_zero(&in_dev->refcnt))
+		in_dev = NULL;
 	rcu_read_unlock();
 	return in_dev;
 }

base-commit: 6d25ffca055a77787c21a36b66c253f76239411b
-- 
2.43.0

