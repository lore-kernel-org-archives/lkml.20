Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB941361DAB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941313; cv=none; b=GIldqP+VbFe2ACwm8uZBhKBO6xThqEj3aatGfySm866SjuWhWwn6bZDWrTwRK/WjFscGvForj9fC/eP3OClizECtqIX7lNAWA5cPS3LNC1SOtYNgYnA5qxtmBCpOe7dPxKT8Wd0Q50WN2hx4g5rbY2D6RkMhvXfpDYof9NwZJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941313; c=relaxed/simple;
	bh=IFR7ul7pp8/kLgTPiH28FnLtifyeTJtoTjKJ6ePRonU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9FCYkC6TbELwtxah2qWL9aVDep/EcFKuCMbNxbe1m06HimQtK240P7iCbwKrIphjDpqz7d2iIO6AAr/whh75ewtDGvnzrWlRoDoO1Yn4mJNd4gkh9AGW6IYlXdsvLEgm0x4osKszIP3AEGRXLkZDBvXBUUHHXlpW0Ld5KH7ZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mivOZ65B; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mivOZ65B"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cd4631090so12631676d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787941310; x=1788546110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e07rpWXrsj3p6ul0XVkxknQ6M4V6UQIKlB7MI75kBKY=;
        b=mivOZ65BJIMUCCen8ejbI9qGe+/i++Dol4vlgzS2Obe1hdnhi6XELjeqcUIv774l2z
         KnHfUmKWf7OlUQTl2+CRQkY8+nV8rNCv2N+VsZd7SHB7HdyrdGr8MVW1DGz45WJzPJ5p
         wP2vmMn91r+EmQhPipCy/S9vrQn+12eUYufnaARQizHTNGMlk+Vhge13hqn0Kj7p0tWb
         KNrLcaUfdskQghduVFtxLkQX2axtgZoc35GiUM/TaQTho27BZKk689vZjL9NY5F40CWj
         M9bLlTHTBbDeQZJJsvsUslXFPNd3iW9NjI+phteu8N9SzUX4CKtojZK2WCzduew7WWou
         OVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941310; x=1788546110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e07rpWXrsj3p6ul0XVkxknQ6M4V6UQIKlB7MI75kBKY=;
        b=IFimDD3b13t9wUTeI0sBtL7ahmPnm+5KKx9ySfgxe3BZMaxmS7Dz/W9NzD7ap9sc4T
         EhLin7wCu8mjgoW1rzFpcLODbLpJxgocEzhspZjvC0jnfwpwuJ/t7uLF2FQcDDU0jW/q
         GlY73bt24VhscvZ/hB4G6wrgh0nbYYOnQTzAGA7ftIGrgfvbJXCVNdSfs+OSxgy4govs
         DSU6hFyt5ZKan3wwfS1sHGRAsVm3jlJJCY1wyY/u+fwo0OfjGA6TtYDkGQsJOZQfnJh4
         d3VsN9aq18iHYP6ekgHAqGKrZTiWlI8HMWs1kCPuqQJchHEwAJEfv77DTD2goiT4B9ST
         SEBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ImnkvFKD1nNL1C/sn1yU1BrEIhCBbbYlQHC4g9GlbC4q7DRYH/nDfpOw2Er9Gn9oXT/+rBLeE/4yLeg=@vger.kernel.org
X-Gm-Message-State: AFuF++n6n6iN+denuN3Q/4sFZAPof+yMl5wqsZWkwwoiAg67PS5P4x/Q
	bVES63pnqQm/RPZBIWRXb6T1r2iMpBt3eqAabyTHi1GfhJSWfRMH197G
X-Gm-Gg: AR+sD11OjweYEMjoOPFfFpKROK5NQLMDnZPTYOuJZC/T0pyVeK4OZ4VK/VKEXae7siw
	mNcbapUxBGXWuR/vgjDuz0QWLE1Wxfri7Fq8KOY+hOBA3yt9pwmzj3uBMxJuCQvW02mNrwnNDiE
	fSnqaT4S17cWaCP8tUBwLMekDO1EwtMK9ka089loom6gSWbNOfJNILNSE6yIcU1SW5NglrNxguv
	/0IWIosC2KQwN+gc60U/t5L9aN7jdJ5WMlND06kq1QNATHgUGM6ddhhJu6bmiLn/D0IeUAMiFgk
	US3mDxPns79dzQormdTt/frXfGxItAK/MVasmdDOdFdJpF9LEh8MUP/65ERJ/318NtyNGUgC/rv
	3YbZt+SfW6IYrYCQhnffevYKpiTv91EvoK2sLRwFdMN9N3a5o2QC6bGbAiBcyqi5b+QAZDR25Ep
	wdGXgXSppoNbZJayrEmxd6Q8I3x7TR0wPXAAECN6wQZIXOPQeGGwVBAC1QHu+2F6K5/gQ=
X-Received: by 2002:a05:6214:518c:b0:908:598a:91d4 with SMTP id 6a1803df08f44-90ceaf5d9c8mr27447786d6.8.1787941305827;
        Fri, 28 Aug 2026 11:21:45 -0700 (PDT)
Received: from zambezi ([2a02:8308:b10e:9400:faf:460b:2f23:8f6f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4467957sm21270406d6.15.2026.08.28.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:21:45 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Ceph fixes for 7.3-rc1
Date: Fri, 28 Aug 2026 20:21:20 +0200
Message-ID: <20260828182122.1668032-1-idryomov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  https://github.com/ceph/ceph-client.git tags/ceph-for-7.3-rc1

for you to fetch changes up to 8fdf946445732c2bcd685abc8bd0e509d2ebc158:

  ceph: force a cap message when a deferred revoke can't be acked immediately (2026-08-26 19:57:29 +0200)

----------------------------------------------------------------
A wide variety of mostly CephFS fixes and cleanups, split between
changes that address edge cases (Sam, Xiubo, Matthew), efficiency
improvements (Max) and AI-assisted hardening (Michael, Jeremy).

One thing that stands out is Alex's change to how CephFS behaves in
NEARFULL scenarios: the long-standing "make all writes synchronous"
behavior has become opt-in.  It was always somewhat controversial and
doesn't make much sense for modern deployments; the new default is to
continue normal operation (i.e. buffer writes as MDS allows, etc).  The
behavior in case the cluster reaches any FULL state remains the same as
before.

----------------------------------------------------------------
Aleksandr Nogikh (1):
      libceph: validate banner payload length

Alex Markuze (1):
      ceph: make nearfull sync writes opt-in

Hongling Zeng (1):
      ceph: Fix ERR_PTR(0) in ceph_mkdir()

Jeremy Jean (2):
      ceph: reject export_targets ranks >= CEPH_MAX_MDS in mdsmap decode
      libceph: reject buckets with mismatched CRUSH ids

Marco Crivellari (1):
      ceph: Change system_unbound_wq with system_dfl_wq

Matthew Brown (1):
      ceph: fix leaked inode reference on writeback abort at umount

Max Kellermann (9):
      ceph: skip __touch_cap() most of the time
      ceph: use detach_cap_releases() in ceph_send_cap_releases()
      ceph: make __ceph_remove_cap() static
      ceph: add helper function ceph_cap_is_removed()
      ceph: mark cap remove with RB_CLEAR_NODE() instead of setting ci=NULL
      ceph: pass inode pointer around instead of reloading it
      ceph: drop mdsc->mutex before decoding the MDS reply
      ceph: do not repeat ceph_trim_dentries() if no progress possible
      ceph: force a cap message when a deferred revoke can't be acked immediately

Michael Bommarito (6):
      libceph: validate OSD extent maps before cursor advance
      ceph: bound copied dentry name length in NFS export get_name
      ceph: bound xattr value length in __build_xattrs()
      ceph: bound MDSCapAuth path and fs_name decode in handle_session()
      ceph: bound num_export_targets array for mds info v2/v3
      ceph: cap delegated inode count in ceph_parse_deleg_inos()

Sam Edwards (2):
      ceph: pass fscrypt `tname` buffers directly
      ceph: properly decrypt filenames in vmalloc() buffers

Tal Zussman (1):
      libceph: remove ceph_put_page_vector()

Xiubo Li (7):
      ceph: use GFP_NOFS for cap flush allocation in writeback path
      ceph: use GFP_KERNEL consistently in __ceph_pool_perm_get()
      ceph: do not cache negative dentries for snapped directories
      ceph: fix use-after-dereference of NULL ci in __ceph_remove_cap()
      ceph: revalidate ki_pos for O_APPEND writes after cap acquisition
      ceph: fix UAF in __kick_flushing_caps() on cf entry freed during unlock
      ceph: fix UAF in check_new_map() on session freed during unlock

 Documentation/filesystems/ceph.rst |   6 ++
 fs/ceph/addr.c                     |  30 +++++--
 fs/ceph/caps.c                     | 166 ++++++++++++++++++++++++++-----------
 fs/ceph/crypto.c                   |  50 ++++++++---
 fs/ceph/crypto.h                   |   4 +-
 fs/ceph/dir.c                      |  22 +++--
 fs/ceph/export.c                   |  26 ++++--
 fs/ceph/file.c                     |  56 ++++++++++++-
 fs/ceph/inode.c                    |   3 +-
 fs/ceph/mds_client.c               | 110 +++++++++++++++++++-----
 fs/ceph/mds_client.h               |   1 +
 fs/ceph/mdsmap.c                   |  11 ++-
 fs/ceph/super.c                    |  10 +++
 fs/ceph/super.h                    |  45 +++++++++-
 fs/ceph/xattr.c                    |   1 +
 include/linux/ceph/libceph.h       |   2 -
 net/ceph/messenger_v2.c            |   5 ++
 net/ceph/osd_client.c              |  30 +++++++
 net/ceph/osdmap.c                  |   2 +
 net/ceph/pagevec.c                 |  13 ---
 20 files changed, 462 insertions(+), 131 deletions(-)
