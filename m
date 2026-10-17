Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C33451DA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248528; cv=none; b=TB7Z6EsYkI8lDzQgCH52sWSDHOJ6g5OqD9dwFgrHKZW7SyYgBGZUIvN8Yh9WhQWUqxbXqejViV6UTnjX3CtHq/FvzEj+uh3JDDO/ED719F7nRubLyYkqZYuw9hrInSYuTu3rLGb5hLHgPg2Syc8fCZg9h3/ANgyu0xO/Qd59Gkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248528; c=relaxed/simple;
	bh=fGhpFHhnxJbeuyXdQDXOoiQeUDoWhcJ8jAOHC6D6C1s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wa8kdg9N1JoJvOqDsSAUdSrz/Twqyo5ZycK2G2iccifSICgeaIr9nzyOiKZcym3AVqphkaptZG7BKgv2z4UB8DZ1UclpimQHfITXXIAydw4lWe4+xh49YJ3x0icNH5y3eqIUp4ns1bVjMTktdMmp4pwvQQpkJ3p6i3viXn1G27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVX35ySl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LJG0FSHJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVX35ySl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LJG0FSHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792248525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A3sJ25QlDwNYlnIG0z6n02tfJnAa4hWqpwhse3XHRzk=;
	b=OVX35ySlv3mJT9KC6eSHIZi04H3Sd5ycRgYLNnwJD8U/Bn6Ud0/dmkRw6opImH+aIB6zA9
	JrEB5g32X4PnrcRyFRiX+sbWc5b0Rkn2+WJrRbPD+llmOrgX6vsg8uvdyer3/8mrtlL/u9
	wKTcmJUbuuVtcEyivvFbZViVUN6rmp0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-KcJ0wFTCPiGKqWrD5iwmJA-1; Sat, 17 Oct 2026 14:48:43 +0000
X-MC-Unique: KcJ0wFTCPiGKqWrD5iwmJA-1
X-Mimecast-MFC-AGG-ID: KcJ0wFTCPiGKqWrD5iwmJA_1792248523
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4108bfb63dso40523166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792248523; x=1792853323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3sJ25QlDwNYlnIG0z6n02tfJnAa4hWqpwhse3XHRzk=;
        b=LJG0FSHJki3NgPyejG1HSPRUNQzMA5t/uJyS0GjizPYqX4aL7OIRe4TZrkJRr6Lton
         1lojPI9t4wwYNjJh1QfNQYoUTdct9+i6f1jIo6yDeWROTxqqJBgO8cPvMe/n4cq9EXZf
         IHYY9yYcbcrKtzLuy1kcytEj/PSjWl5fe/z8ka0QQqW1l7AscS6am5u9HBJOU7ZncIji
         dt0LImjC52G03QblJ3YiaZDwFqC05HJREDbUDaMrHGQXID20JB5llNHqFE2XadOYs2dn
         AZlxKN80EqxZFEK0SJGTY392emNmTK16kQyO7aC3qX5kL4Tp9Y9seT8dSiz6b2yQc8dO
         Z0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248523; x=1792853323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3sJ25QlDwNYlnIG0z6n02tfJnAa4hWqpwhse3XHRzk=;
        b=EQmfI+RDb0ZJJwynw9hyoZIvTk3QirFIn+MHr4TKLo1Irmu6ExN1KjKY9xuKh39OfL
         cV9B0v9u3ObdUkKydfjgAIFMQ4mq8BjU7Mrfaw8EXtcoBEM+v896skw5FTC0iJdm6mQJ
         JSAKlk7FwB/q3ViE6Cos8uFnavLMVGLVaSUWLYm8AnjEojU+WxKddrJdKu3YVEE9K2Ld
         0uRBZYvmycGyOdFvrvwVc0vkZbm6Ia2SLFyqPHaZU69NuE4RZIqmK1pIAayMNM20827q
         g5v7+dTyqdsBuovynbY0hJ9R8n9kADG3kEOZltsJ19YoWqfiGMa8jhx7PZdb4gM0V0QC
         EyPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCbaZlYApvavqnJVGokJuotkIDjhLfl8rAazFbS+XkyIBY3CDi/YCbDUKqaFW4TpKkJpv91YfVfOEqlQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuCxXvGvFp3+KxI5+pF9u7tq+Cwxw/oy07X89v3/d8c5/4nkQr
	QLcwlaFD4PLIPrNz2Ax9Bj+wBTpO6FWEbX9O2FNT03EiCu0HdT5RzyrH3I2bdrfUDiWm6f9ecwd
	Uf2V73FZs3yEyEY/IxmDHtw77Z7ny15FGqhaHayDG4TkbhA/kqdHI6dH9L+RBQP6hqw==
X-Gm-Gg: AYBFou34jhvhaxCFDplnrTkzswKTkldEjuIdKYwDw2kYtHlo0Na40PtSlzIG5AtO2Cs
	AuylA4/muog4Gs6vY8HYjF18gcNWweq9x6vCaLcATZpBJb7yYKwg609ka56m63hQpHxLGAFt5Us
	9Yrayu5RSJy1qJImI1gBFqNuzAeYt6Q6Us8BJLABpem0X7vZGLACh1oGb0bUe3lufx1IVV2SLjd
	+CHQ+O3er08DlcI2ZxinzASG7ruriivTfqBl5KBhTQuIMuLnJUgq6GEWkQ12fKRPEMFZYjZCCEi
	Fn/Z6e0x5xHAdp3cmappVFmmSyBkKspFNAPcfzRHzuNGKbIOOswEh+wQs2pIfsehDQzq/Qu+853
	nM4MG7KO6ihsZZXw/9Zd6NOvoNWSatlHpsNvu1lgQrTBoxpyjTYQH3fb6cH//Azibqvy+LICrFn
	mf1tEPtjL1WtoUXl81nE0RPxcEYRXZl9/d0ounZwHs3BSxXRnlhlw1Krrv8mt5DiF1HUZZKqtxw
	j8=
X-Received: by 2002:a17:907:398f:b0:c40:f9ea:7382 with SMTP id a640c23a62f3a-c4196f9d8e4mr185642866b.0.1792248522633;
        Sat, 17 Oct 2026 07:48:42 -0700 (PDT)
X-Received: by 2002:a17:907:398f:b0:c40:f9ea:7382 with SMTP id a640c23a62f3a-c4196f9d8e4mr185642166b.0.1792248522284;
        Sat, 17 Oct 2026 07:48:42 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32878bsm181645366b.12.2026.10.17.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:48:41 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ceph: support subvolume quarantine
Date: Sat, 17 Oct 2026 14:48:35 +0000
Message-Id: <cover.1792248177.33a6e2db0a.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CephFS subvolume quarantine isolates a subvolume while allowing access
by recovery clients with q/Q MDS auth caps. The kernel client currently
does not advertise quarantine support, so the MDS can hold its requests
until quarantine is lifted.

This series handles MClientCaps v14 quarantine notifications, checks
cached data and metadata access, and handles disable notifications.
Fresh MDS replies allow recovery after a lost disable. It applies directly
to the base below and has no fscrypt prerequisite.

The first patch exports d_find_alias_rcu() to GPL modules. The remaining
three patches add the wire definitions, record quarantine state and
ancestry generations, then install the access checks before advertising
the session feature.

Changes since v2:
- Add the VFS export prerequisite to fix the undefined d_find_alias_rcu
  symbol reported by the kernel test robot with CONFIG_CEPH_FS=m.
  The fix carries Reported-by and Closes tags.
- Keep all three Ceph patches unchanged from v2.
- Replace object-only compile validation with a complete W=1 kernel and
  module build using GCC 14.2.0 and the robot's x86_64-rhel-9.4 config.

Validation:
A complete W=1 build with the kernel.org GCC 14.2.0 toolchain and the
robot's x86_64-rhel-9.4 config after olddefconfig passes. It produces
vmlinux, bzImage and all 2,233 configured modules, including ceph.ko and
libceph.ko. MODPOST succeeds, and Module.symvers contains the GPL export
of d_find_alias_rcu. Configuration changes are limited to olddefconfig's
toolchain capability normalization; there are no manual config changes.
W=1 warnings remain elsewhere in the kernel; none come from Ceph or
dcache.c.
All four patches pass strict checkpatch and apply in order to reproduce
the tested source tree. Seven deterministic source-extraction regression
runners pass; the ASan/UBSan/LSan VFS runner also demonstrates the remaining
cached encrypted-readlink bypass.

Known limitation: cached encrypted symlink targets can bypass quarantine
checks. fscrypt populates inode->i_link, which the VFS can use for readlink
or symlink traversal without calling Ceph's get_link operation. Uncached
encrypted targets and plaintext symlinks still pass through Ceph's checks.
Closing the encrypted-target cache gap needs the separate fscrypt support
and Ceph opt-in follow-up.

Live cluster, KASAN/lockdep, multi-MDS recovery and depth benchmarks have
not been run for this version. Existing snapshot mappings need server
notifications to revoke already installed PTEs. Disable messages carry
no generation, so same-rank ordering relies on ordered MDS delivery.
Recovery assumes the intended rwq/rwQ delegation; overlapping ordinary
rw and read-only q/Q grants still need server-side cap filtering.

v2: https://lore.kernel.org/r/cover.1792074165.git.amarkuze@redhat.com
Robot report:
https://lore.kernel.org/oe-kbuild-all/202610171220.i77KPiw5-lkp@intel.com/

Alex Markuze (4):
  dcache: export d_find_alias_rcu() for modular filesystems
  ceph: add subvolume quarantine wire definitions
  ceph: record subvolume quarantine from MDS cap updates
  ceph: fail quarantined subvolume access with EACCES

 fs/ceph/acl.c                |  28 +-
 fs/ceph/addr.c               |  72 ++-
 fs/ceph/caps.c               | 291 +++++++++++-
 fs/ceph/debugfs.c            |   1 +
 fs/ceph/dir.c                |  51 ++-
 fs/ceph/file.c               | 117 +++--
 fs/ceph/inode.c              | 841 ++++++++++++++++++++++++++++++++++-
 fs/ceph/ioctl.c              |  13 +
 fs/ceph/mds_client.c         |  23 +-
 fs/ceph/mds_client.h         |  26 +-
 fs/ceph/super.c              |   2 +
 fs/ceph/super.h              |  80 +++-
 fs/ceph/xattr.c              |  54 ++-
 fs/dcache.c                  |   1 +
 include/linux/ceph/ceph_fs.h |  13 +
 net/ceph/ceph_common.c       |   2 +
 16 files changed, 1482 insertions(+), 133 deletions(-)


base-commit: ed0502cb11f84fff29f374238e526ae94d9bdfde
-- 
2.34.1

