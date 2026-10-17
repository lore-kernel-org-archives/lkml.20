Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F24351C17
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244428; cv=none; b=LTY/jMfM/RlKGXq6Tq27CdESI+tSkr6j+HkDmvIVHwzg72yiGzUs+vrbnG8Q7dTG5qRk//5CHnFyN/7wrRf8DscFttAL62yeKhlZaNfBI1ie6rssfL/LraH5QPbpuwfTylbfNUOVuROr6ZWFCb1FeXTlj+9FYwpVmuUeNlpUiA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244428; c=relaxed/simple;
	bh=fGhpFHhnxJbeuyXdQDXOoiQeUDoWhcJ8jAOHC6D6C1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sn+o6iX/IWi7W8Y8CLjQXtJ7BqDhIDit6GsX5/rnBJTaMqOMu5culklbkS1XUvXnthwFPOh4vQCk7b5zxmkeo7cJumfjmIHxXch6WLthLexuVqRlULLTv0cORlcWHuZxGWt32RFt6fMY61tIF3T+MbuCLcH6ppybzI2O//1wSB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJk6vtcw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nQIaPBmg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJk6vtcw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nQIaPBmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792244426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3sJ25QlDwNYlnIG0z6n02tfJnAa4hWqpwhse3XHRzk=;
	b=VJk6vtcwega8JSs80XKrWvftfxvfvyKNIjxUaaSrLHbZzVYhN8rPDSiD97x0M5LoUt21Wu
	3TwFsgghE9rupnuJMMZvWrpSQCo3lNN2UF/GUCNlpus0MRTxFwvCir4iE0Ws9Hvs5tavFe
	/rF8Co/kjnPKVtrol/F1QUUgdpdovQ4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-DfA3hqG2OZG0D3IQ712ncA-1; Sat, 17 Oct 2026 13:40:23 +0000
X-MC-Unique: DfA3hqG2OZG0D3IQ712ncA-1
X-Mimecast-MFC-AGG-ID: DfA3hqG2OZG0D3IQ712ncA_1792244422
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b1d35e3c0fso609640a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792244422; x=1792849222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3sJ25QlDwNYlnIG0z6n02tfJnAa4hWqpwhse3XHRzk=;
        b=nQIaPBmgfWQI92C23rCovKoLyViOqODI9pG45SpqZO/rH+JM6HY+nQEVdj2MIi+UPN
         awF9uG4jGGObFmGg+MKK7Xy1SdHv/ESBdRw1Mv5S9TjbnrDMbbdSqX6uye9dE8PPdrjl
         o1llR+m0H2mdYOaqqMwRIeDfA0OMld9TUBwpPimwh0+ZGIXnScvA5u9g9oAnnQZl3rIp
         2mVHeIzkxP3n63i0nV+N2QjOSNe0C9qrvFijZ8g4ViJ9L2yo95DCnfEnhTRKnj8lgnTg
         oqHHHyDZs2sJcVBrBacBMrUKcA6UMGPZVl3KxTb0oGACs/kYPnc0VjP/g5W4QxTSrm7s
         I9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244422; x=1792849222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3sJ25QlDwNYlnIG0z6n02tfJnAa4hWqpwhse3XHRzk=;
        b=o4GQhoSwG0tVaBECs8YDT+cGetWcnuzIqpik89/0Ao28+rEDiVf1d9MnpZ2u/y2rUt
         a7BA5d4BIw4qzk5rpK75ZbKLIMzgzUqumZ1ssCzdfkiZQM7n3fbT+hUkMZ9P6T2QnXkp
         zrOj/lkizhrX6UADlW3o6Z8IvOSjRgEmLNnRriuswwQeTtnb8eIaE2LzwgDQe/LUO8km
         L5okhcxuy6XlAwDUL3kug2AAh/6qIQOCbpSfO8j3i9TB5lQXp5Ct9pgfclyKUtjzEDOd
         eeCu+AAvyoLZ8qtD79e5JYPSpnYBMROd87d9o7OdcjJEW3kiXIBa+Ep67l8PnKuDfIhO
         mErw==
X-Forwarded-Encrypted: i=1; AKwUvBxP1TohYAIuVUkvNhCTeckH2L8OymuNJUEn7+X73v9STnangaA3E49nMQPJ/rqFvY6TSKXTgjeA3DHhBzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKfsMNYJ5gjQ5WBz+0u0H8PGuPHln5BD5RRudhLUfOjiOcxtgk
	V585+rhM5FBfDkEfMg1K4HWFsEVMIydvR0Ymf80IvhPw8AXCMIvYioSb1Zmur+PAkEOXMpQ21a/
	aZvu0OYJxrGxbN103M5Xapd7svaoMbZqfkeHOZd568fKBQ4OJ7lQkQj+T4tT7dCLIOLySWJWBPf
	ES
X-Gm-Gg: AYBFou0fZZYx8YoKYJSpk7blkM//WYXjKsCCOnwSs5rTS5FhyOK+PIy3snRd0jbYj64
	UIjxmKetx6qstUhN5d5d5epUOz+raHr0MAzgoj4Qx9DIhviHhWetiup9PDagoIRmvTKvNoaaN0r
	HXMValF6Ojz9pW8F9f6rEq9kCnh3zr7SOUVIYk9Dq30jUAmXg+tC9C9kEUu7PvUmsm2U3kDxihP
	4w5nkm4D9lO+2O7x8HwQL3MqPLanTeJkf4bxl23n19DUTbkk86wYaR88MoykVlGD1omlvXGm5wm
	9J9/3+o4SKzIawcC7rUSpF/DCh5M49BL98rLkK0g45Yjk0uR+5iUuB5tAUr49xRgsYrpvsg+vMN
	lQhxhyVzYQak33NWU+Y2cSClBan0MYc7eZkSK82a8d2mZX86VOrMmxLcvNdcGVGq9cFDtfuypAS
	J5OGdpZFjzl5AL+g3+gMcul0y5unXyuaLPY9PXV7QJ7UovdPVbXWgmGZAYJUzTa7JuHsNdTO5Iz
	II=
X-Received: by 2002:a05:6402:4018:b0:6b1:bcde:9f32 with SMTP id 4fb4d7f45d1cf-6b3a817697bmr1371827a12.7.1792244421891;
        Sat, 17 Oct 2026 06:40:21 -0700 (PDT)
X-Received: by 2002:a05:6402:4018:b0:6b1:bcde:9f32 with SMTP id 4fb4d7f45d1cf-6b3a817697bmr1371813a12.7.1792244421483;
        Sat, 17 Oct 2026 06:40:21 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm1913032a12.10.2026.10.17.06.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:40:20 -0700 (PDT)
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
Date: Sat, 17 Oct 2026 13:40:12 +0000
Message-Id: <cover.1792241577.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792074165.git.amarkuze@redhat.com>
References: <cover.1792074165.git.amarkuze@redhat.com>
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

