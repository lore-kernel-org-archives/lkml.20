Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4154EEBB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080752; cv=none; b=Rbz98S6PcdTKLc+rx9Jd69VyykxPfRx0M3FqeThVVM9674sZUmskx978TQGqW3O4ZvaRqfkzlBnHwam/C52FjBY9N9n1+RXJJoQKC9F2jx62tLoQBc6S/VPAm1cNzFiIlFdyOy9DKMzdkzgFTXXfKsINBIvQJj1yXOrOoNa4ISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080752; c=relaxed/simple;
	bh=YAp+UqTI2EKIrmrHZot3/UvBbH0z78L9rVY897I9fhc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wfwf2ffNPqe7Qf6dkEg/ds4KZ0M9ENe/CZ8qlEyjFlggYxEb3mAM/IMPK5wfnGlYnOZY9UQXFn7stjKRtqhVsve2lcWYQKskqb/lLEh9egmDkgfwgYaErDgPbPt62b9NS7ta0tMkSgGOFPjLAFR4VZaCsf/Hlvnfa9y0yGFOrA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jBfdprWE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k4cS745V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jBfdprWE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k4cS745V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792080732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q09aj7UEe0kumCJq8WS9Ah0WmFTTIB3exnEXv9Bz20I=;
	b=jBfdprWE5ZLpjK01V3XbGNJSWOScXU877gC2Zyct83yQ50sVLB0DPqbZM8pZTWh27Vr5aY
	lFuZ5eB8Gx9A6Ecmvi86ZyniLjAXOdQAKpAE+fmmJEIqZ67A1n7Rg7crTwC7GHll0bxnE/
	a26CHHuWGo0bMupuRbvYgzLqsq9IDEc=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-ilAbh00lPWiPeDbjEMh6nA-1; Thu, 15 Oct 2026 16:12:11 +0000
X-MC-Unique: ilAbh00lPWiPeDbjEMh6nA-1
X-Mimecast-MFC-AGG-ID: ilAbh00lPWiPeDbjEMh6nA_1792080730
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35d4538fd74so6431751eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792080730; x=1792685530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q09aj7UEe0kumCJq8WS9Ah0WmFTTIB3exnEXv9Bz20I=;
        b=k4cS745VqFo5u4X6cjCy7aAsooB618X/3xEkO2/g2vzIIbsAzSRqcA39S14mqWLKDs
         kwCVhD2Ih95JYf3y+Risoa7xP3a47NuAwRqmNRJIjOlLoHLswJAvb5IM4XFXautBkvx+
         8fL93yjBM9x7lyNfzMJAO+3Lrwh3+/WGQvU4c2EjxHUOtmr9789CPu8hyWyqsGC6gDmt
         BY9iSHVOza4euzWiKv2AWZxa9HfRM5sEdLjlVV9Bb3crrCaOpZmKzngy5bh6Cwq19/Fn
         vrubt3DISeMOyR8uHYaLRZY8yPofN4hlS6oZmSULboeUh0Cy8ulLVR9Whiw58F9Wk0Kq
         h6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080730; x=1792685530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q09aj7UEe0kumCJq8WS9Ah0WmFTTIB3exnEXv9Bz20I=;
        b=ztduoYgWFt3WCPLwn5yX1j4RsgNSf4QvXqx/QGBgO/xk298VVWYVDvMkzr3GjhRWjc
         VgbhaqXRKigD56/S6kgG3z9K2r7un8KcJiVEVFToLn7/Q4/tD0NtbE67UwqgJn6lKAbf
         uiWeQ07wYQqtxdI9ssuDfESodKcEweIwJQ7Ai2Q+0NJ7qPBfNTsDeQO6RuAD8DAqS2mg
         FKpjs2aH1YNycX5C10hyzANpu7i8g/2L7Vyqt8Tnwrzn/6225LUu4blhN/YeTTJmeBX+
         fbs1QPE7eH9I0TCZgSpaJApU7d1BIzV/pVS5FSh+kAlzoaj+9j6KdoxeK/2gM2GCUloy
         CKCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZnWhthIpXwvy6dN6dftQ7pLefWWl34E8XUprpefX4HInuxDWrHFHIsSH5TH47BhxDYHvmHrP6KXf0XjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe4zIFwP12xiq1+Agv82sD7rgizAkLOonSsWxV2+kEWmYAh713
	0zWxkeYZ3xcKenIZeGK5MVks2KlYlYwzntAc8lQALuMLL3Lm/OJKAOkxmGnOhVuiA+uexDnWyLn
	EEBgVXUn0r+al5NJKU+YhytrIl8gLb0hIHENBPwR5mf0LagHA6SFg9J8fPH8d2KsOds/7K0dPjq
	Ai
X-Gm-Gg: AYBFou39ZUDS9rIhXSfo4dmWjnuBWohZH3FkQSwd+fq/ioZ9rQsSNzuTIcPrlJ0McGw
	QUrzP9MMC+hc623OcDoXFH8bH0Qy2efhlQlZ7xGI6ZF8t3AT/5xxZetMXQbU4UACYZTmyCfmlLs
	1MubDFFbUHH/+wbsVBoNabsqa9JIgZIeZGshmcIF043NTIFkpIxU++d5JeeTBhT2D8YGubyBn8E
	dmb57UncYZSbz/RmZJgkx+WFRUEoJIjePZC+ZpPjGCKPrUpIojYn+/jY+zysjbrF9XTD76BfgF5
	kf/tbuhGsvYquWceo5NA6sR2L7rC9GMFHV+kO7js+HPclE6zKtEIHy1z7EMcpIBTualViqQwsZI
	wBGe2w6wyTbW1hvamyom6fwzWaNj0GAJLWRHmrBB1+wv1hJEfMazSH8ECwxnWk6RuURzCFyyQpO
	LmCA1639GmEPMC0Q==
X-Received: by 2002:a05:693c:895a:20b0:351:f762:a10c with SMTP id 5a478bee46e88-3537dc3ca81mr26307176eec.0.1792080729579;
        Thu, 15 Oct 2026 09:12:09 -0700 (PDT)
X-Received: by 2002:a05:693c:895a:20b0:351:f762:a10c with SMTP id 5a478bee46e88-3537dc3ca81mr26307138eec.0.1792080728889;
        Thu, 15 Oct 2026 09:12:08 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm49961933eec.11.2026.10.15.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:12:08 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubo.li@clyso.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ceph: support subvolume quarantine
Date: Thu, 15 Oct 2026 16:12:01 +0000
Message-Id: <cover.1792074165.git.amarkuze@redhat.com>
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

This Ceph-only series handles MClientCaps v14 quarantine notifications,
checks cached data and metadata access, and handles disable notifications.
Fresh MDS replies allow recovery after a lost disable. It applies directly
to the base below and has no fscrypt prerequisite.

Known limitation: cached encrypted symlink targets can bypass quarantine
checks. fscrypt populates inode->i_link, which the VFS can use for readlink
or symlink traversal without calling Ceph's get_link operation. This series
leaves that gap open. Uncached encrypted targets still pass through Ceph's
checks, and plaintext symlinks use the revalidating callback. Closing the
encrypted-target cache gap needs separate fscrypt support and a Ceph opt-in.

The three patches add the wire definitions, record quarantine state and
ancestry generations, then install the access checks before advertising
the session feature. The fscrypt cache opt-out is separate follow-up work.

Changes since v1:
- Keep metadata submission on its normal path, including POSIX and flock
  unlocks. Uncertain async creates and unlinks fall back to the MDS.
- Treat incomplete ancestry as unknown and ask the MDS. Preserve pending
  state across session loss, and use accepted cap replies to recover.
- Skip ancestry walks when no inode is marked. Cache complete RCU walks
  by generation, bound retries, and invalidate across parent changes
  without holding an odd generation over sleeping LSM hooks.
- Scope MDS read confirmations to the exact inode, credentials and
  generation. Authorize writes separately with a mode-specific OPEN.
- Check cached ACL, plaintext symlink, directory, attribute, ioctl and mmap
  paths. Authorize snapshot operations with a fresh MDS request; preserve
  connected snapshot paths and validate exact inode/snapshot replies.
- Keep nonblocking cap checks free of RPCs and release locked folios
  before blocking revalidation.

Validation: W=1 Ceph/libceph object builds on x86-64 with ACL, encryption,
inline data and fscache enabled and disabled, and on i386 with ACL and
encryption enabled. Seven deterministic source-extraction regression
runners pass. The ASan/UBSan/LSan VFS runner also demonstrates the remaining
cached encrypted-readlink bypass; it does not claim that gap is fixed.
Live cluster, KASAN/lockdep, multi-MDS recovery and depth benchmarks have
not been run for this version.

Protocol limits: existing snapshot mappings need server notifications
to revoke already installed PTEs. Disable messages carry no generation,
so same-rank ordering relies on ordered MDS delivery. Recovery assumes
the intended rwq/rwQ delegation; overlapping ordinary rw and read-only
q/Q grants still need server-side cap filtering.

Alex Markuze (3):
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
 include/linux/ceph/ceph_fs.h |  13 +
 net/ceph/ceph_common.c       |   2 +
 15 files changed, 1481 insertions(+), 133 deletions(-)


base-commit: ed0502cb11f84fff29f374238e526ae94d9bdfde
-- 
2.34.1

