Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500771;
	b=qLV723JTcCHbyBa6XgG7kGYBm9d+DrWpupS7E+nfb4Dg5bmXmeKNOvyAaHiMirCrZaUq
	 As4mZHIm5CpNgPoz0DWMHdV6yO3/B+sgHRQvNZw4gofkXmw1auVq6HcWQ8sC+x3dznXgy
	 xtshd2Ul4Er1gVLtwhg7GaIt79fJ42WmbmHizDie39RKj3LiHDE887FBSe0zu/C7wAJmF
	 AzIZWdq1TfLrfc++6rvbRMfvVAJT8DbiRec7GcMBclqO9dJRgudDnXdBCIpBmfDQqEjbc
	 Ip27yXKME//UBhHmvHgkaSBOajjozsM2GwUFAC9AWJfhD77vFP5JKhy7SxUxONE45Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500771;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/4u1vmaSqipBM0zxv3OAa4p5s287MyrcxTiYmzVTx/k=;
	b=GJokBjcc8v1Z3x1sEzlQKABytLagJdNc1wgcaj77BJRX8xP0BlA+zULHFuA91QLmoA2x
	 ilPUmXnK7ahn9zgFmnplqKiPON5Xvf+9noSQUyEhb18+B9vFaZklcaqcY+cKeVzV7Nfp0
	 MsDastldXFGO7Cv6tbmxJSDoZA4QeBz6lF1uRcHM6XFHCXHUZbAfy1FFiBpi8OjOs8PMp
	 KI3RkVyJuyhzq4S+wCuDuXdXFPHzBt36kq2GuTMD6cvdrYHvhI+El0mK6XvWlVyLhZJ8G
	 eTlwqLnzAFszlrqXwLHKCwyMBfV6L9pdF1Dns73iTbJUuiaGEZgYp0LfIL2ktF3dSIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="F/wHtwNC";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JA+2g4IK;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D610606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D610606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F/wHtwNC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JA+2g4IK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792500769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/4u1vmaSqipBM0zxv3OAa4p5s287MyrcxTiYmzVTx/k=;
	b=F/wHtwNCHtpvA4YrgXHagstXJ8f9K3UgdPFglAVNbJxgmwNs7v0DSDIMMAD+En7DmITb30
	lxs06FvEHjb7hvirfnIxweyKuSMCb0ff7ZBtk/A9372BqtBN0GVRhPDTfYVOjiHjH7g6CJ
	txxsUZS0ws3P+byQbu2Lw1i04XcJNAc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-NGiX4C8bMK6J1kDayDueBQ-1; Tue, 20 Oct 2026 12:52:41 +0000
X-MC-Unique: NGiX4C8bMK6J1kDayDueBQ-1
X-Mimecast-MFC-AGG-ID: NGiX4C8bMK6J1kDayDueBQ_1792500760
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b1f5b673baso3323698a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792500760; x=1793105560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4u1vmaSqipBM0zxv3OAa4p5s287MyrcxTiYmzVTx/k=;
        b=JA+2g4IKo1TpGTA0gXPRIyNRyC4/A95C2h9G8LbDi/kNLz/YZijJfR9D24SfengdgI
         wM0HcIpHAyqvXQjr+YMZa6onoQl1o980Nys5bJ1ZaHZtCfUNsuGd7YOPkqIke4T/fUU0
         3ANrxBXbesNuVmXU6KRqqF6BY1uyrL/ksjS4zifrlB+35OnqgFGUh+tiCgcXOiU7YAmQ
         Xulq+HU4UtsHtdqEVe+enpi+SMk7FgHe/kC8uUXr/LzkmbiareBGL5pk0f/Z5rQpM2N/
         /6Ktt3H7FjKUqshLaJE1wXiZZ7BJvYAFWKSp+NvQOB1Q/KYQ6mhh8EoiMEjzg0hvC2U/
         ml3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500760; x=1793105560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4u1vmaSqipBM0zxv3OAa4p5s287MyrcxTiYmzVTx/k=;
        b=19JA5TDpmaLiAuGWLthOyJX9gY4KPUmwUL5cDnstj7cU6uKPRjAcmKM1n1cPN2vT/G
         gRp/h0rq9n3RTnmd1iau5cUDGPSUJs2h+pp/M+GAcgHGOOlj16ajdJJECAtUiKHlgjJq
         E0b2Bg9AhStaCAoilwdbs7yJ9lsGW88VJEwMCXuIf/wOTBgYxrP9L0b0BdBmX5+/vEWm
         4cubZq9bP6rL7RqgXQ/e8HxZMJU1eufAH8nXXJsCdjYyFwsdWPZXZzDuePEcMm0dpdil
         aaUt5ZTxclu0frm4M/vvHKgCcCjFKxV5D8uqAnJzg2utnNZpOpa9sq+TQxHiZeFxvgMB
         /MFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXqjfZmFTqKMWyu0WJacnTOg9LmZFfXyGo2HZphAxIi1XDz/qT3yOMxu+02jqhi5fyQ1WR8wu78FHNsIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIujzZz/aOwI0dSWSeinHKsUfQ/AqLJBSIeAdlj7B3+hc43bzZX
	v9fBQ7AJvmuO4Ag9V2ZYQtFGDK/qJww1B0/dCAfYO6hI2JGj3qcEKcAeIgsJCT+UPpxddzkoel9
	r0FIkOKokjmFHTwAnPRBoQF99Qxx1+QvpuQTA2V2hWRlhKqfh+JaPYLNbPhTjVly+CQ==
X-Gm-Gg: AYBFou0VjXGhMPTK3Hty3l4UOYUqlqUOurr5V3Y2NjuKMn8z8jhd09BdzIhRJuG/v6Q
	k2Yj8RAuMBDF2X6h0pGmpjOP6QXVRRG8cOx0UpJvgONHOxo4+7c7i0VJURYiStr1oTfab+Mj7p0
	tl9fLf2RKunQyLKKZ8RAr6kfvBvnyO1GXwPQ19TW+iEC8nJ4ZOpjrNhpbJIy3lBlvRBmYNuMnDd
	qrpf3h+bVlNaNoxGmP0D35cBKlFXgzAvYAX8YQf4mmmoU1Ft/70hRHDs7G9fPrTMQe9INH1wlzF
	6o0cL/gy4RCgOapJBpBLn2b0OEhmQv1vetrgrS7w4lvYoN0v919zWy2e/7zV7uNWuupD8n3Ko4w
	1Pc5kAnNK5IfVID+PY2MrXyFnIT9cY/b2eXHzq1c22f1OEXHGyZjkz1pWMFvBSoNsYLLJ5CyzCk
	I0Gq6bcHPn4g86YoaiZhb3s3ENODIOgC+IqatqhWtR2cmGoEZ1lmN7uXAWYEM9cdINMdCw6MqkI
	54=
X-Received: by 2002:a05:6402:11d1:b0:6b1:c5c3:9624 with SMTP id 4fb4d7f45d1cf-6b3a819086fmr6835220a12.22.1792500760217;
        Tue, 20 Oct 2026 05:52:40 -0700 (PDT)
X-Received: by 2002:a05:6402:11d1:b0:6b1:c5c3:9624 with SMTP id 4fb4d7f45d1cf-6b3a819086fmr6835205a12.22.1792500759746;
        Tue, 20 Oct 2026 05:52:39 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3c74eb8a7sm2982781a12.2.2026.10.20.05.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:39 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	ebiggers@kernel.org,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] ceph: support subvolume quarantine
Date: Tue, 20 Oct 2026 12:52:32 +0000
Message-Id: <cover.1792498351.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
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

CephFS subvolume quarantine isolates a subvolume while allowing recovery
clients with q/Q MDS auth caps to access it. Advertise support only after
cached data and metadata access paths can enforce quarantine.

This v4 combines the fscrypt symlink-cache prerequisite and the Ceph
quarantine series as requested by Eric and Xiubo. The dcache export is
retained. The generic fscrypt change precedes the Ceph patches, and its
Ceph opt-in is folded into the patch adding the get_link checks.

Changes since v3:
- Disable only the two fscrypt symlink-cache writers. Leave cache readers
  unchanged and update fscrypt_symlink_getattr() kernel-doc. Explain the
  held O_PATH descriptor / empty-path readlinkat() bypass and the allocation
  and decryption cost of uncached encrypted symlink accesses.
- Avoid unconditional snapshot RPCs only when the connected head inode is
  the target's actual subvolume root, identified by its nonzero MDS-provided
  subvolume ID, with a valid AUTH_SHARED cap from a quarantine-aware MDS and
  no local quarantine marks. A snapshot P/.snap/S/V/file cannot use ancestor
  P's cap to authorize access in V. Synthetic snapdirs inherit their parent's
  subvolume ID. Unknown IDs, other head ancestors, expired root caps and
  disconnected snapshots retain MDS checks. 32-bit clients also revalidate
  because membership IDs use plain 64-bit READ/WRITE_ONCE accesses.
- Wait interruptibly and retry unstable namespace generations or MDS
  authorizations in blocking cap acquisition and revalidation. Preserve
  nonblocking behavior. Track splice owners and reject recursive LSM hooks
  with EBUSY, including hooks outside MDS reply processing.
- Gate ACL cache suppression and namespace mutation bookkeeping on
  negotiated quarantine support. Invalidate older cached ACLs when support
  is first enabled and pair namespace tokens across that transition.
- Remove the impossible NULL d_parent guards raised during VFS review.

Validation:
Nine deterministic source-extraction regression runners pass, including
ASan/UBSan/LSan checks of VFS readlink and fscrypt target ownership. A warm
same-subvolume-root snapshot harness performs 1000 getattr calls, 1024 read
authorizations and 52 snapdir checks without an MDS RPC. A depth-300
harness completes 20000 blocking revalidations with injected namespace
splices without EAGAIN. Additional cases cover feature activation, ACL
cache invalidation, old-MDS caps, detached snapshots, epoch/rename races,
interrupted waits, recovery permissions and stale cap messages. The ancestor
snapshot regression fails on the earlier v4 draft and passes with the fix:
zero local marks and a valid outside head cap still require per-operation
MDS authorization for reads, cached stat and xattrs. Unknown IDs, non-root
head caps and 32-bit clients also retain MDS revalidation.
A complete W=1 kernel and module build passes with GCC 14.2.0 and the
normalized x86_64-rhel-9.4 robot config: vmlinux, bzImage and all 2233
configured modules, including ceph.ko and libceph.ko. MODPOST succeeds,
and the GPL d_find_alias_rcu export resolves. Additional W=1 builds pass
on x86-64 with ACL/encryption enabled and disabled, and on i386 with
those features enabled. All five patches pass strict checkpatch and
apply in order to reproduce the tested source tree.
These are source harnesses, not live CephFS benchmark results. Live
cluster, KASAN/lockdep, failover and snapshot throughput tests have not
been rerun for v4. Xiubo's v3 runtime results are separate evidence.

Remaining protocol limits:
Already installed snapshot PTEs still need server notifications to revoke
access without a new filesystem callback. Snapshots without proven coverage
by a cap on their own subvolume root, and all 32-bit snapshot operations,
still authorize each operation through the MDS.
Disable messages carry no generation, so same-rank ordering relies on
ordered delivery. Overlapping ordinary rw and q/Q grants still require
server-side auth-cap filtering; Xiubo reproduced that with ceph-fuse too.

v3: https://lore.kernel.org/r/cover.1792248177.33a6e2db0a.git.amarkuze@redhat.com/
v2: https://lore.kernel.org/r/cover.1792074165.git.amarkuze@redhat.com/
fscrypt discussion: https://lore.kernel.org/r/a01d0a297a3e174d21741a3ad586ce546327603e.1792081664.git.amarkuze@redhat.com/

Alex Markuze (5):
  dcache: export d_find_alias_rcu() for modular filesystems
  fscrypt: allow filesystems to disable symlink target caching
  ceph: add subvolume quarantine wire definitions
  ceph: record subvolume quarantine from MDS cap updates
  ceph: fail quarantined subvolume access with EACCES

 fs/ceph/acl.c                |  33 +-
 fs/ceph/addr.c               |  72 ++-
 fs/ceph/caps.c               | 317 +++++++++++-
 fs/ceph/crypto.c             |   1 +
 fs/ceph/debugfs.c            |   1 +
 fs/ceph/dir.c                |  54 +-
 fs/ceph/file.c               | 112 ++++-
 fs/ceph/inode.c              | 919 ++++++++++++++++++++++++++++++++++-
 fs/ceph/ioctl.c              |  13 +
 fs/ceph/mds_client.c         |  28 +-
 fs/ceph/mds_client.h         |  30 +-
 fs/ceph/super.c              |   4 +
 fs/ceph/super.h              |  99 +++-
 fs/ceph/xattr.c              |  54 +-
 fs/crypto/hooks.c            |  28 +-
 fs/dcache.c                  |   1 +
 include/linux/ceph/ceph_fs.h |  13 +
 include/linux/fscrypt.h      |   7 +
 net/ceph/ceph_common.c       |   2 +
 19 files changed, 1676 insertions(+), 112 deletions(-)

