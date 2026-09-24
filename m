Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78C318ED2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224053; cv=none; b=FHIKKhf182JhmoJCTFr02kpY+j0Qdg7MOO/9YSGKPygJJSVmoYQ+fax7vAOOzzhBY3tv5MbMnYseVuI6W/GgQN0f2YEEizfH2GjPP03LCAKFQHoCfVRrvOwJU1Hz+azymzM8Wigoc7AIVKcw/P7c86JQIll6wsF+aan162Sufd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224053; c=relaxed/simple;
	bh=6FDbxZi9t7QTATEj4+pYmjibp3MxGo1+bcWEQGMBuOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q02zDcNhTY+ijmrt0ykodLa5SPvEE4+kNDlhUh586EICS8nHDBm81Szrepzji6Dipb2OVMn01bKpf+fGPhtT6bh8pC/I+9bJYq3hjyPoK+BvYqO91bnaUVhaS5jlEjOPYFGCjo/npothxT8uDzAtZ0KrTOFqb0B35pSv9fZ4+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ur4fK/9A; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ur4fK/9A"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso8747625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224052; x=1790828852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCxWPEOezuSLO7Xuzn89hCOd/GEmzudfz/jg7i8ODxQ=;
        b=Ur4fK/9A0Me/To2XdxkZL6rgJr6kihqaeqANIJG2Vl9kfvBBZUocrCJODQtu0b2eWz
         NSqlWOmh8ISH4uDurHqFu3WIjN1EX8+S2BqGFURFB3YsX1k1HldwuFebftpu8lw6sGr1
         kb6eHyWhHHnDHMHkC6ezFvpwu9SNxt9wWRF2GuT9lnWNCFHeydHkyDwUrTCCrGiZc9E8
         fcIK4GFCIG7/9Sx08nq0V3FL/cKGTxdeU3/JGowQqC5LyinodaJ4dgmT9A7qFyvxn34y
         XGZlFPc5fAsSRHDJms+DodW/5OvO6SrNt/3UYRSU1tVU61IXDlB5bi/0W89/LzOYnqNL
         Z1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224052; x=1790828852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCxWPEOezuSLO7Xuzn89hCOd/GEmzudfz/jg7i8ODxQ=;
        b=nDys3X+uVKEbjPQdRqQ3ZtiC64+RdMi13Cx2ysBAMEdBlPXaC9koZ+aMyCl5fhS8/i
         /sJOhTYWn4tXR20X0MYj+6hlBDFxR4Jd2lrT1MGkekCSCUFfMi0tH0oN7EYsJtd1Ii1V
         h2ycmi+IByG2hjwuXUY7NMJlBx2iAPC9ekyGWmCmmLSEXjxyrwAIk3l+Byibc5Ebffs7
         AfOwTY2RQJ+DdcPD6/zI+tLHZBpTXDp70h2cC4i4vHU5Fmtr9ceYHCA/aPVSf0go+YoP
         MlcgWMODf1DUPruxvmXXbJpXIm+55gWgd4moyQn3c/EUXfgQU8OGcQcku1MQHTbMJT1T
         4mYg==
X-Forwarded-Encrypted: i=1; AKwUvBxCqB4cxVl/aD/y5eIzQNcE2tlIWWXL4j/JfAlJpIDyzYDUhuRX0MZc9mjLSjO/USYPj9IOSrt2cY+c4Nc=@vger.kernel.org
X-Gm-Message-State: AFuF++nClITJCd83V0a8jZomR5kYTKyGRKMSATBbM05RJZ3HWMsDn+c/
	tz8ooBFiK7hGLWezboFVbkIY7Hpim2WorfA2LbffTQ7ZfyvRZge0UCgK
X-Gm-Gg: AYBFou1Zct+1FizH4U4j599E/EcpZQtFOsMLOUWD1mt7wT0NMFZFj8t2lOkf7w39Eqi
	TOnHbP5Uyymo/kgVcQ2GQhpY5hEz8hAfl7acgy0ZGfclizWTEuwoF4ZR99RCctV9J4kH+itzwYS
	AVCRCV1pw+HDmRMWrE8Q0zUpfX4xIgqd+E/3Fd8C1x+C0Y1Q/AI0rym64OwGL1f8iv5pWoaKhE3
	RJjmbg8LZDE3IR8dCPBTMLyx94Zn1/oVyA2L67+IeA3xLHGFR3mj7d6TMAOPL+esuRSDwxeoV+B
	FI+rv4wypZnr62D5k+58QMqiHPFvtswcXUjRExosNeDsrlGTEtB3Rf6VG3VYncCIiO+JFNQ2rR0
	vvjwdVYikUd1VB9fVqP2D5XqC7idxmHv0ChvS4HxUlW5vzJOybHOOjEkxoyR4AfFxMDZjWXvQrs
	8hdoa6dJ54WOisuj4MnTqaxnjR8YcCmAofoj1T9PF+AgdH0ChYeCAbseQt3s3kVog1kJ4EfRXYh
	s1+4A3pSm7bFWaxdsZNB+hGEDC3ci7k52iOJL1LLLbloSabjeQRyDnklG32MBGzv4Q0S7b+yPZG
	p8qegmAqVQ==
X-Received: by 2002:a17:903:120d:b0:2df:81d0:7c40 with SMTP id d9443c01a7336-2df81d07e31mr4850705ad.55.1790224051565;
        Wed, 23 Sep 2026 21:27:31 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a4997sm19710685ad.27.2026.09.23.21.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:27:31 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Chen Ridong <chenridong@huawei.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 0/3] cgroup/cpuset: fix exclusive CPU conflict checks for local and remote partitions
Date: Thu, 24 Sep 2026 04:27:26 +0000
Message-ID: <20260924042729.1908863-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three exclusive CPU validation gaps across local and
remote partitions in kernel/cgroup/cpuset.c and adds corresponding
regression tests to tools/testing/selftests/cgroup/test_cpuset_prs.sh:

1. Patch 1/3 ("cgroup/cpuset: return PERR_NOCPUS in
   remote_partition_enable() on subpartitions_cpus conflict"):
   Restores the subpartitions_cpus conflict error check in
   remote_partition_enable() (returning PERR_NOCPUS to match
   remote_cpus_update()) so a remote partition cannot be enabled
   underneath an ancestor local partition via a non-partition
   intermediate cgroup.

2. Patch 2/3 ("cgroup/cpuset: prevent activating local partition over
   remote one"):
   Checks trialcs->exclusive_cpus against subpartitions_cpus in
   validate_partition() when !is_partition_valid(cs) so an initially
   invalid top-level partition cannot later transition to a valid local
   partition over an active remote partition via cpuset.cpus /
   cpuset.cpus.exclusive updates.

3. Patch 3/3 ("cgroup/cpuset: check sibling effective_xcpus in
   cpus_excl_conflict()"):
   Falls back to sibling->effective_xcpus in cpus_excl_conflict() when
   sibling->exclusive_cpus is empty so a sibling cgroup cannot claim
   cpuset.cpus.exclusive over a valid local partition's implicit
   exclusive CPUs.

Changes in v4:
- Send as a standalone series with a cover letter (0/3) instead of
  replying in-thread to the previous version, as requested by Ridong
  Chen and Waiman Long.
- Restore the exact v2 diff and commit description for patch 1/3
  (which was accidentally corrupted when splitting v2 into 3 patches in
  v3), fixing git apply against mainline.
- Make the test_cpuset_prs.sh test case in patch 2/3 independent of the
  system CPU count (using X2-3 / CX2-3:P2 / P1:CX1-3 instead of
  CX0-7:P1), as pointed out by Waiman Long.

Changes in v3:
- Split patch 2/2 from v2 into patch 2/3 (validate_partition(),
  Fixes: 6da580ec656a) and patch 3/3 (cpus_excl_conflict(),
  Fixes: 2a3602030d80), as pointed out by Guopeng Zhang.
- Add Assisted-by: LLM tag.

Changes in v2:
- Split the remote_partition_enable() fix into patch 1/2 and return
  PERR_NOCPUS instead of PERR_INVCPUS to match remote_cpus_update(), as
  suggested by Guopeng Zhang.
- Add step-by-step reproducer and test_cpuset_prs.sh regression tests,
  as requested by Ridong Chen.

Hui Peng (3):
  cgroup/cpuset: return PERR_NOCPUS in remote_partition_enable() on subpartitions_cpus conflict
  cgroup/cpuset: prevent activating local partition over remote one
  cgroup/cpuset: check sibling effective_xcpus in cpus_excl_conflict()

 kernel/cgroup/cpuset.c                            | 12 ++++++++++--
 tools/testing/selftests/cgroup/test_cpuset_prs.sh |  5 +++++
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.49.0
