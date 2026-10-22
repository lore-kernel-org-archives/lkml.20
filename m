Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661942;
	b=vqNSo8TghDJcXuw5JM5BgW9s2RaRe14gC921VQyyR+YIzn9/RjJgNQ+h2dUuWY++f9NR
	 H8ROQyd4q8D+/8vYjdhBFfN93VOz4NlSHrzXJtBgn0K2Bxd2Sq67jSIEM5TrnlbegrIky
	 VX/pmRrjPxfYz5a3PRjtrMHv5J1MVUCifJiSHNTQRyEKggg/IKgIRBanUv5VAWlucud25
	 gwGwjFb0T4nz7IlIeUQICuKEC1kArG9WkWemmeHjP/vxOc+grGxowvjitbI+q43Z/oocs
	 dG0+rTttMyCqn8qk7kjkm4Nc/WEjX/P0RUezsr7EB8+urPW+MDg27wj53a4LKmCnGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661942;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XjC6tLjuAhdZA6EAag1c8rxrurEQGdNeh8zsiCS6oN4=;
	b=0bZnT7/K5RAFjYSfRlK5r7D7xI3B0xj/SG0kCljHRo/ik2Hryb+NY2V8O4S3yHxbp+22
	 JkdHAt8dNxhuZA5zmGav3x6OX8qysQx0Yy6mzgJJaaUYr1nBSO6PwslEmxYTi5a8Ox6Nk
	 xnVfXh6xtkUba6IVPfkkBZ9GZNNN+2daxSRavdJ6qcocDMgp56q+6Hoavo97vZqKll1Zf
	 Ak7DNeOce2SEddCS3IKmveusYJu5+Qsc5xJAGYATTgLXz29EBexbA2wDnOLurv7d3aqiD
	 qlEvr7VDwXg3Qh0dlLXAprh3lcDr1U7PVHeeSd+LMjuLhuYRgak+083DkQ3ACr6k1WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=TzStpDly;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A3606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=TzStpDly
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=XjC6tLjuAhdZA6EAag1c8rxrurEQGdNeh8zsiCS6oN4=; b=
	TzStpDlyvAVJpfHEDIsiUw2mdadSLGjPEXuOZIACNtz+ZxY0a3cJZNOmqY9IoCm/FTooHdPnEoRPT
	C+VN6RSUrDwlOCNhoOgqrEolhdcx1yXCM2cWsA+a+xLiEtg11BfxWyDSoFVcjYdyY1OVZALbh9RGs
	IN/kwJUkfFFbUm8V1cd/mzxfas/CnxEYU8Kv+V64TxNW6PL4CHmi5M/D9ylTRuGLerj8Ek8uowjEh
	qRxwCUfaWA8cfWxnivp8jVe6vytk5MUwy5+c+az3/dANSNsBdDZFP+5wc8ppuxiMKkxDP1HF6kuIo
	vjKEZGIDwalHzVe4HPC5EqsS2wB0TEBwVw==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xJpG6-006erT-Ab; Thu, 22 Oct 2026 11:38:50 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH v7 0/4] Realtime workqueues and panthor realtime submission
Date: Thu, 22 Oct 2026 10:38:44 +0100
Message-ID: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
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

This is a continuation of the previous discussion which was here:
https://lore.kernel.org/dri-devel/20260702143745.79293-1-tvrtko.ursulin@igalia.com/

Work is now converted to a much simpler approach by adding real-time scheduling
workqueues based on Tejun's feedback

To re-cap, when an userspace thread submits GPU work, due how the DRM scheduler
uses workqueues to feed the GPU, and regardless of the GPU rendering context
priority, or the CPU scheduling priority of the userspace thread itself, the
use of workqueues can add significant latency to the submit path.

When CPU is busy with enough backround load this translates to severe latency
spikes measured as time between userspace submitting work and GPU actually being
given that work to execute.

With the panthor workqueue upgraded to use WQ_HIGHPRI and varying the CPU
priority of the submit thread, the test program from
https://gitlab.freedesktop.org/panfrost/linux/-/work_items/49 reproduces these
kind of latencies:

         .    N    RT
    M   27   28    32
  95%  163  246   809
  98%  924  991  1882

Legend:

   M = Median submit latency in us
 95% = Percentile latency in us

   . = Userspace submit thread SCHED_OTHER
   N = -||= nice -1
  RT = -||- FIFO 1

Upgrading the panthor workqueues so that the realtime GPU priority queue uses
WQ_RT, submit latency becomes completely controlled with the median of 14us and
95 and 98-th percentiles at 23us and 25us respectively.

Important to note is that VK_QUEUE_GLOBAL_PRIORITY_REALTIME already requires
that userspace either has CAP_SYS_NICE, or the DRM master capability. The latter
can be had by a single DRM client per GPU, usually the compositor since DRM
master is required to drive the display hardware. It is not possible to have two
DRM master clients simultaneously.

On the overall this limits the number of userspace threads which can access the
RT queue - it either has to be a compositor, or a rendering client which was
explicitly granted CAP_SYS_NICE.

v2:
 * See patch 1 changelog.

v3:
 * See patch 1 changelog + apologies for v3 following so quickly after v2.
   I have found a race condition as I expanded the testing to a second platform.

v4:
 * See patch 1 changelog.

v5:
 * Rebased on top of tj/for-7.4 branch.
 * New patch in series simplifies unbound sysfs attribute handling.
 * WQ_RTPRI reworked to fold RT marker into attr->nice.

v6:
 * Fixed accidental sysfs attribute rename (patch 1).
 * Various review feedback as per patch 2 changelog.

v7:
 * Describe DRM master in the cover letter.
 * New patch in series to separate attribute sanitizing steps.
 * WQ_RT updated per the respective change log.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Chia-I Wu <olv@google.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Tejun Heo <tj@kernel.org>

Tvrtko Ursulin (4):
  workqueue: Simplify unbound sysfs attribute registration
  workqueue: Separate sysfs mutable vs immutable wq attribute sanitizing
  workqueue: Add support for real-time workers
  drm/panthor: Create per queue priority workqueues

 Documentation/core-api/workqueue.rst    |   8 +
 drivers/gpu/drm/panthor/panthor_sched.c |  37 +++-
 include/linux/workqueue.h               |   5 +-
 kernel/workqueue.c                      | 237 +++++++++++++++---------
 tools/workqueue/wq_dump.py              |   9 +-
 5 files changed, 197 insertions(+), 99 deletions(-)

-- 
2.56.0

