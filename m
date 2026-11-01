Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533353;
	b=LkaRhZasN2LCxYTQrAbUmz4qf7lSEpp4jdNVGjTFX0crvAqLawvUfPvAJW4raFI4lEyL
	 TQDDZ0EO9OP4UpIkyDCj4mbOYW28xzmGUyso4uZlVELJc/t09vwLTh2XXhVUnRLC2l19F
	 IuG2MV+BFq2Bv5XM69CTUelj0wC1ATG456RYIB7pD0SZ4Vo3bku3+mQzJ6Iq0jQuYtrKA
	 8xhmepBCWtFekS/gTvb+2+A7gU+I3AsAxJC9qwZYaPFH70L067GL86tfZP0t9YPO0l62f
	 TGq2gD3DlxMh2meBY+PmWPUoqkOVxwlnFRxzfpJHsMS/31tKIq+9jAslkDQoZ6p7YuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533353;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EanTznwx/0Aj/s3QT07UfcluAx0YVeP46HRwNlIZl5E=;
	b=UX9gJXdtxeSm/j/lr/wTHlsYQkBWTcHFvddxdK5vowOy+zzn3Qm79/43tVDJNRdl0xXP
	 JG0me8ESxirQGlBI37LvmaQWewhtCObh29h8Vn43E3XUvpIQcdfIi+ZmLI/1/wr5+GbEi
	 3R7qkYZXC/meaIy406W9yWh3npKmZkFG13KHDgVlTbQuzgdeozLSpbolktGHSBvvGVVLO
	 rtbEtM5TQFUuEVv2UnUa/JCcHdjhB+kL8xZCHOwS8uXGq6hH7YOCLC5dcjPss9Dyeyj+M
	 HX0a/nquDWI/qXnNOkoIhpTynxzE5IBtvdRvsPLBPEbM+5d976dWyqdA6f6asKM2Ilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXubpghL;
	arc=none smtp.remote-ip=91.218.175.52
Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18466606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18466606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXubpghL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YY39keWneTLPZBamDlcA7DQOVwj7BemwZtli7jAgQeQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533349; v=1; x=1794138149;
 b=HXubpghLGLbYI3xxEG+9D0kPuf/Nk51OpfXkI+MF+ANwfh0dk64ZFMcB4kfIC4cbmrssotrY
 MbGDYZ/YuwnquMCuXhWFqqwGr6amcYBbLr9tFrMVkUhGNUjxhhMVAAsUIB+wWpZeKLOiX5SF2by
 KpRfiDy6jDyaK+duIE11q1Ew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 25a5b28c65c94713;
	Sun, 01 Nov 2026 11:42:29 +0000
X-Mizu-Trace-ID: 25a5b28c65c94713
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Michal Koutn?" <mkoutny@suse.com>
Cc: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH -v4 00/22] cpuset: rework local partition logic
Date: Sun,  1 Nov 2026 19:41:44 +0800
Message-Id: <20261101114206.2434398-1-ridong.chen@linux.dev>
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
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

There have been quite a few partition related fixes recently, most of
them caused by the scattered handling of partition state and the
isolated CPUs in different code paths. This convinces me again that the
rework of the local partition logic is necessary, so I am restarting
this series. As it has been a long time since the last posting, this
series is marked as RFC v4.

The current local partition implementation consolidates all operations
(enable, disable, invalidate, and update) within the large
update_parent_effective_cpumask() function, which exceeds 300 lines.
This monolithic approach has become increasingly difficult to understand
and maintain. Additionally, partition-related fields are updated in
multiple locations, leading to redundant code and potential corner case
oversights.

This patch series refactors the local partition logic by separating
operations into dedicated functions: local_partition_enable(),
local_partition_disable(), and local_partition_update(), creating
symmetry with the existing remote partition infrastructure.

After the rework:
- The code is reduced by about 90 lines (568 insertions, 657
  deletions), and the 312-line update_parent_effective_cpumask() is
  removed.
- Both local and remote partitions go through the same
  partition_enable(), partition_disable() and partition_update()
  helpers, and are validated by validate_local_partition() and
  validate_remote_partition() on top of the common
  validate_partition(). The structure and semantics of each operation
  are much clearer.
- The partition fields are updated in a unified way. The direct writes
  of partition_root_state are reduced from 6 places to 2, and the
  writes of prs_err from 12 places to 3, most of them now done in
  partition_state_update(). The isolation state of the CPUs given back
  to the parent is settled in partition_xcpus_del(), so
  isolated_cpus_release() is removed.

The series is organized as follows:

1. Infrastructure Preparation (Patches 1-3):
   - Code cleanup and preparation for the refactoring work

2. Introduce partition operation helpers (Patches 4-6):
   - Introduce out partition_enable(), partition_disable(), and
     partition_update() functions.

3. Use new helpers for remote partition (Patches 7-9)

4. Local Partition Implementation (Patches 10-13):
   - Separate update_parent_effective_cpumask() into dedicated functions:
     * local_partition_enable()
     * local_partition_disable()
     * local_partition_update()

5. Optimization and Cleanup (Patches 14-22):
   - Remove redundant partition-related operations
   - Additional optimizations based on the new architecture

base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9

---

Changes in RFC v4:
1. Rebase on the next-20261028 and adapt patches 3-22 to the current
   partition code.
2. Add patch 2 to settle the isolation state of CPUs given back to the
   parent in partition_xcpus_del(), replacing isolated_cpus_release().
3. Fix several issues of the hotplug, prs_err and remote partition
   update handling found in review and testing.
4. The issues fixed by Waiman's series [1] are also covered by this
   rework, and its new test cases pass with this series applied.

[1] https://lore.kernel.org/all/20261030190701.78308-1-longman@redhat.com/

RESEND: https://lore.kernel.org/all/20251225123058.231765-1-chenridong@huaweicloud.com/

Changes in RESEND:
1. Rebase on the next-20251219

Changes from RFC v2:
1. Dropped the bugfix (already merged/fixed upstream)
2. Rebased onto next
3. Introduced partition_switch to handle root state switches
4. Directly use local_partition_disable()—no longer first introduce
   local_partition_invalidate() before unifying the two
5. Incorporated modifications based on Longman's suggestions

Changes in RFC v1:
1. Added bugfix for root partition isolcpus at series start.
2. Completed helper function implementations when first introduced.
3. Split larger patches into smaller, more reviewable units.
4. Incorporated feedback from Longman.

Chen Ridong (21):
  cpuset: add early empty cpumask check in partition_xcpus_add/del
  cpuset: generalize the validate_partition() interface
  cpuset: introduce partition_enable()
  cpuset: introduce partition_disable()
  cpuset: introduce partition_update()
  cpuset: use partition_enable() for remote partition enablement
  cpuset: use partition_disable() for remote partition disablement
  cpuset: use partition_update() for remote partition update
  cpuset: introduce local_partition_enable()
  cpuset: introduce local_partition_disable()
  cpuset: use local_partition_disable() to invalidate local partition
  cpuset: introduce local_partition_update()
  cpuset: remove update_parent_effective_cpumask
  cpuset: remove redundant partition field updates
  cpuset: simplify partition update logic for hotplug tasks
  cpuset: use partition_disable for compute_partition_effective_cpumask
  cpuset: use validate_local_partition in local_partition_enable
  cpuset: introduce validate_remote_partition
  cpuset: simplify the update_prstate() function
  cpuset: remove prs_err clear when notify_partition_change
  cpuset: remove unnecessary validation in partition_cpus_change

Ridong Chen (1):
  cpuset: settle isolation state when CPUs are given back to parent

 kernel/cgroup/cpuset.c | 1225 +++++++++++++++++++---------------------
 1 file changed, 568 insertions(+), 657 deletions(-)

-- 
2.34.1

