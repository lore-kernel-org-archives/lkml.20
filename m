Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA63B7767
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133503; cv=none; b=YlpE0QuB9juF+IqL+m26ugfGiul+ZKKxgkIgA29FiOP8vK8J5B9adb6CyzC8pJGFwI086NVe7gGJ14X1xduxr95nt/Eybo2lUFHdPeGUaoMWLhETudnW3CiFYclMuzS670wAGtLiPVt8RNPH9jZWM1I7l9Ottcs/xsbkeoVe3IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133503; c=relaxed/simple;
	bh=ZppestnB/L/9h/jlv1SF6oIBtJU8mdjxcVXZv2t6Ldo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5hzWlxfZD4YUu1JcYOQJxxaPsJ6NypgYGjCZkPCjih+0GjPl18fjjwKCQkSzAywfFiPQmGD3Rt80X8OsvQsfqb2ac0kYXhRMjYCGYufF0NtCq0EUj0OppYOPVdYK001upovv3CoeuZf1wj+v+55FqvUYSjG89sbi5n7C42cCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guqYGqgQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guqYGqgQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d944747d41so10844125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789133501; x=1789738301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3EUyltHhlIzlcifnulrGVfpB7IyEyQBzKiFTuyNy3E=;
        b=guqYGqgQn5sHhRmhd8SFEybvQkfNH+VAVRiXmwe/35XSr+Qw6WCrD/F0A2HnPdCR1G
         gZSeSwkWUV1XA+FqpEwYwQpNPdvTlTw6CuSrfbaoZVs1F+GlxcxzFXBi9617Z+aOZlNJ
         oVxK50LitwLO3g48c7zgyut7t14v5PY+txJgZPaMyfKYFZEF2GSPgHIUCpFJaytV/K1j
         KBewl7JS4bxlHIdGm+Cw8iAi9yxTQ5s+28zkiQOJ21xhrWutz9bneTjbAalehNzJ9oDA
         r/oB7B85oYHM7usub9omoJeY2pw8qpzd2gk5MYDpT9/RlozKGphCd2XuSmFFcUoqe4TL
         R11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133501; x=1789738301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3EUyltHhlIzlcifnulrGVfpB7IyEyQBzKiFTuyNy3E=;
        b=f6/r7GurY2cZiHmMJxfWZB7tRXNSnmJ/hQ5fMaQzkPlKHJiOcLzcERTk+kWB9Epo30
         9OTh3NaRnmGObsTtlA3LaOXn/WMmrDOBSDSjFI+CoFz+U7MAuPMyT4skfZKX8GgVCUwq
         rkKtdVA78wEgMk/0AP01JiJAzCge3swcidwzsdEZBa86ZMuniu6BauWjy5DUzcqJZb2F
         ymAktwque0ckVcMOBULdfTrL4Wv5/irTLlU6pbgOtcd3Bj1JuNmz23v/OGAURHUG463+
         1boEXygfqPdhxcO2KEvSAME5rnr+ePAvvhDgk/IuoXxvfqOzFqMHuDitSXXC9LoyChc3
         q2OA==
X-Forwarded-Encrypted: i=1; AKwUvBwhMLQxAGW5us+CVqD4bZRTAmW8YwEoRWl7YTcx+WcljzKrwf8Ehw0z7bcivtoCIoKr/r9eHt8NNylWWPo=@vger.kernel.org
X-Gm-Message-State: AFuF++ngIVZORQrq4HWSblTmpkdDM6Tt2P3DikSZYn4eo4fCDlK7MW48
	RLnTFBlEKbcByMdrKAdHKdtq7lCJo4Tiw+75a+QjBBkTOamUj4O1ljgm
X-Gm-Gg: AYBFou2CwUc7UUdIbFytZgLlrPEXMA3EKA/soqoIg6fRzNy79D6OeA+AU3V4tXvfIQh
	kEy1jedEjTNo5Rau/PEjZx4G77lMSSX8e26iMZDl4yxohOdr0+DmdELB0Sdox7xnDl1mx29UGFw
	7gKYmYSw/V2kOq/Igua6jCxFRnk2JUYGj8o/Tnu1mp0df3Xg+RqC/OKYHYd0e34Co+A5aUE/dRy
	2T0FUDBoDa01BwnFkewO1s0xezbftr6//woTf8iqproN3xr9AOOdH5e01GtRDn3nKaGhaRYzHaf
	5L/mNi1SHHuYxJFNnsH8nsNcnK/Y1NafQV0iw66+DezB0uUoa5nkrLMpDhPK2GDTIEpZDlo9gkO
	K/3HAayKBH1eOr50RxL1d/tozBIqTEKLx8xcaFL2pYqQoVNE0KlrPteZ3FIo1450VixtaSDFagO
	QWmPqGcUYawPTPJTNpueUG2O+yo4R0Gc2ZF9tJx2Mzvumpsy66TjwUFPIqvPBvKuk4+0oc2M/v+
	ezV/JLjm4lbvIDzviMUgRbB
X-Received: by 2002:a17:903:40ce:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2dd2a1ce379mr80201455ad.3.1789133501529;
        Fri, 11 Sep 2026 06:31:41 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc5c7bsm11349015ad.51.2026.09.11.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:31:41 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+1dbed5969931c19d3eb5@syzkaller.appspotmail.com
Subject: [PATCH 1/2] libceph: reject an initial monmap with no monitors
Date: Fri, 11 Sep 2026 19:01:09 +0530
Message-ID: <20260911133110.2218-2-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260911133110.2218-1-yogeshgaur.83@gmail.com>
References: <20260911133110.2218-1-yogeshgaur.83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

build_initial_monmap() takes the monitor count straight from
ceph_options::num_mon and builds a monmap with that many entries without
checking that there is at least one. ceph_parse_ips() writes *count only
after it has parsed an address successfully, so a ceph_options that went
through a failed parse still has num_mon == 0 and the resulting monmap
has no monitors in it at all.

The first thing the client does with that monmap is open a session, and
pick_new_mon() asserts the invariant that it is non-empty:

  kernel BUG at net/ceph/mon_client.c:211!
  RIP: 0010:pick_new_mon net/ceph/mon_client.c:211 [inline]
  RIP: 0010:__open_session+0x60f/0x740 net/ceph/mon_client.c:245
  Call Trace:
   ceph_monc_open_session+0x46/0x60 net/ceph/mon_client.c:534
   __ceph_open_session+0x135/0x590 net/ceph/ceph_common.c:798
   ceph_real_mount fs/ceph/super.c:1173 [inline]
   ceph_get_tree+0xd98/0x1fd0 fs/ceph/super.c:1362
   vfs_get_tree+0x92/0x320 fs/super.c:1947
   vfs_cmd_create+0xd7/0x2a0 fs/fsopen.c:231
   __do_sys_fsconfig+0x55a/0xcb0 fs/fsopen.c:463

The reproducer gets there through the new device syntax: an fsconfig()
mon_addr= that does not resolve ("libceph: resolve '127.0.0.' (ret=-3):
failed") leaves fsopt->mon_addr set but num_mon at 0, so the "No monitor
address" check in ceph_get_tree() passes and the mount proceeds with an
empty monmap. The next patch stops that string from being kept, but the
assertion should not be reachable from a mount option in the first place.

Commit 40480eee361e ("libceph: Reject monmaps advertising zero monitors")
made the same BUG_ON() unreachable from the wire by rejecting
num_mon == 0 in ceph_monmap_decode(). Apply the same rule to the initial
monmap, which is the only other way one gets built, and fail the mount
with -EINVAL rather than assert afterwards.

Reported-by: syzbot+1dbed5969931c19d3eb5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1dbed5969931c19d3eb5
Fixes: 7b19b4db5add ("ceph: new device mount syntax")
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 net/ceph/mon_client.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
index c56457378d00..bcbcf47506c9 100644
--- a/net/ceph/mon_client.c
+++ b/net/ceph/mon_client.c
@@ -1141,6 +1141,9 @@ static int build_initial_monmap(struct ceph_mon_client *monc)
 	int num_mon = opt->num_mon;
 	int i;
 
+	if (num_mon < 1 || num_mon > CEPH_MAX_MON)
+		return -EINVAL;
+
 	/* build initial monmap */
 	monc->monmap = kzalloc_flex(*monc->monmap, mon_inst, num_mon);
 	if (!monc->monmap)
-- 
2.55.0.windows.5

