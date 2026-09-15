Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60B53921E0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438635; cv=none; b=juUdhlZ52uy2WkRMFWcm+Lz4HdV+oT6jwzvYVvmenQLPaivTMb6FWReYxsUerTFppBXCIT8RxVbF5xIPV35tnazs2oPhEzeresVVNHQHVWMQkv8gAhKhy+YBa2Hve3kB4oAkvyOxSz216Diq+qoKEzUOVqWvJql6Q5A7pR45Md4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438635; c=relaxed/simple;
	bh=LFGXW1FblkTFshMQGaMsfdUloYw1kZsv9AVoUcndYZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUDh2SIR9aLyIIsljbD+x0LtiyqAYrT8NqQ2sVvjRLxwEv1J35If73SQn9utaNX9M8FsUCNiMfeVX6Wm6aoQY1KJv1E8UYP+O6DRcad06CKR2A6rYman7kUJmPPuqtrkCkMN3CFa+G0fZ3Gdex3ARpTuDVhHzf17IZfgjKU+3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=KOomrOLA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="KOomrOLA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so2907527a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789438633; x=1790043433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5fN54m/6l1dsqIXpSbFFXJyY0rw5CeeF8vOOOKH6SY=;
        b=KOomrOLAUgNuIEYrBf0uQzmJ7MWLlSD/pWM8sG9JGIO/xNlCqhN6v81VGo1Yp/+ZWs
         mWlmXNtSeLC3oE4eZQbKvqRQiNZEak2vxZUy8hlW5qcOopAQC6zZdoZpE5LuYhJ86Fx1
         pActNagR+JHQYxD6iEI9rn00Nhb4j0v3Hr5iPdxazDie44fsUBU/yaSytLMJPdwEdFiA
         eP5Bcgzt9toegWMgeGIoQ2GkwITiChJhqhWos9MUQy8w8f0zY+zPLcrvI7q63k900ACS
         6fax+UE158MqKpkCnbbOIGvSIYYpsSRrUDSnezjHiVtwdeU+MeUurwWNfivVBe8g+07S
         lAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438633; x=1790043433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5fN54m/6l1dsqIXpSbFFXJyY0rw5CeeF8vOOOKH6SY=;
        b=FRHPnPIHd2H1wuA749A0kzW03DxRAe7PMTTXo2lykddEFeCdMCxAv+f07caTcuqpfY
         sU78XHITXGbAiYzuxwVYaKj/nvC6LpCUdrVZWAUGhFfiY1bL6tWhXXeTr0m6Jovd5NFZ
         PR0l353/dCjORRT3aEE9EO+W1wqX/oK7X7p3Jk2Zjc6Qa+N2N2yN3D2YMUG5iPhiuRpW
         6z+NLQvZQl1WnRCC5nCkeGcfeV738Jk47WOl/cGUUv8JtQwEKM1Kj3WGHbwVvf0lmz4l
         fIt4xi1j415FJSVkICaMnu4Di0kwJODgVDk74pNOJOCbScTPxsegyO871p1KcMXYlDWC
         aL4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsKcxwgRRu5uKiJvW/LbIFGLzem06HCBLyutnFqyMmrvz/sYOZNbNkdEFK14FXlBiMomi35IMG8i9nzJc=@vger.kernel.org
X-Gm-Message-State: AFuF++n6WLMWc0jXrSCA4F6zDUblq0L5CvXuD83ZaG/65MWk34WlE1GL
	DKIa3uFZiEA7kK7Bhymr1fEgH2k9DPTV5PlsP0lJ8YVCROrqe7aNtm+LYblLbRHA8w==
X-Gm-Gg: AYBFou25RS4yMESe7njvXZOZ87bj57XHNFV80vDYlwBx7x2DTxMIXoG65qSs1+Yqu4p
	mRAc9F2AzqEEmsdA3DJTvumciQlEMwAVi49UxAx4uFX4pgQtqMONDoFKRyaZ/GjondmY13bKcRa
	5bolhKyFcnhXGj4H49A77ycXFsODjTrd9CAVpzD5CBAEzTOJIGjC3TFRhZe9+0CNnB/2ERPUhGT
	seR2/zU4qEb+osv6k6OdfnWvHCeIMEcWtcLobTIpMSiS2x8I040VC+uoY6Atzq6Nf3HImz3F0RN
	2oKxzlMThatpFoZQ7KQzLbLcEQ0NzeRcJ6r43MY9MiwY3Mz5KCX3GszIiMn1GgRuOvhrJPX7X/W
	TNQca1TsQvHFo1x8BW/f3/PynTHF6LuG2l0cw9tmFjZee6eflmt+RuqzIPLjwKdKjMT5FDsSpNS
	c8V84B83gfAeq5l+25YRqiZmyB/waRu4AapWPbKvmfSya86hSdgdOb6GfqS8JEMynQbqhXZ17f0
	hYKAEB03pkri6ME3wICFurCYLHJWVWscOkI+g==
X-Received: by 2002:a17:90b:534c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39df08f09b2mr9956252a91.9.1789438632963;
        Mon, 14 Sep 2026 19:17:12 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm318965c88.9.2026.09.14.19.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:17:12 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	slava@dubeyko.com,
	ceph-devel@vger.kernel.org
Cc: co+f92fbe44e3c6df69@bugs.sh,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] ceph: require the dentry lease record to cover struct ceph_mds_reply_lease
Date: Mon, 14 Sep 2026 19:17:10 -0700
Message-ID: <20260915021710.386847-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_reply_info_lease() reads a 32-bit struct_len off the wire and only
checks that many bytes are present, without requiring struct_len to cover
sizeof(struct ceph_mds_reply_lease) (10 bytes).  A malicious MDS can
declare a shorter record and still get the pointer published: the
following *p += sizeof(**lease) overshoot is undone by *p = lend, so
nothing downstream rejects the reply.  ceph_fill_trace() ->
update_dentry_lease() then reads 10 bytes through that pointer on any
lookup on a mounted CephFS, running past the end of the message front.

Require the record to cover the structure, matching the sibling
parse_reply_info_dir().  A conforming MDS always encodes the full 10
bytes.

  BUG: KASAN: slab-out-of-bounds in __update_dentry_lease.constprop.0 (fs/ceph/inode.c:1459)
  Read of size 4 at addr ffff888026c63d65 by task kworker/0:3/2366
  Workqueue: ceph-msgr ceph_con_workfn
  Call Trace:
   __update_dentry_lease.constprop.0 (fs/ceph/inode.c:1459)
   ceph_fill_trace (fs/ceph/inode.c:1474 fs/ceph/inode.c:1823)
   mds_dispatch (fs/ceph/mds_client.c:4229 fs/ceph/mds_client.c:7225)
   ceph_con_process_message (net/ceph/messenger.c:1424)
   ceph_con_v1_try_read (net/ceph/messenger_v1.c:1430)
   ceph_con_workfn (net/ceph/messenger.c:1576)
   process_one_work (kernel/workqueue.c:3396)
   worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

  The buggy address is located 357 bytes inside of
   allocated 360-byte region [ffff888026c63c00, ffff888026c63d68)

Cc: stable@vger.kernel.org
Fixes: 4ac4c23eaa38 ("ceph: decode alternate_name in lease info")
Reported-by: co+f92fbe44e3c6df69@bugs.sh
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/ceph/mds_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 085ae0cfb5f7..073d9f4a3adb 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -380,6 +380,8 @@ static int parse_reply_info_lease(void **p, void *end,
 
 	lend = *p + struct_len;
 	ceph_decode_need(p, end, struct_len, bad);
+	if (struct_len < sizeof(**lease))
+		goto bad;
 	*lease = *p;
 	*p += sizeof(**lease);
 
-- 
2.43.0

