Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE84BE443
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848143; cv=none; b=Qcenygsq73C3vtjBHrLz0hWZeMFiCELdhs01kY5aa8M0Gjntbx2LEa4hGMFP0TQzdMijGPnVvLMJ9sdfcC8tVY55nu/09Ke9xGqw2g59zXw6iMQ06796i7updIzYR+IKkCpi8sbuwP9Dz/sGhTTD92Oq/RsEK8q6eZTehEAdWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848143; c=relaxed/simple;
	bh=MMLeZz7TBUn2I+82DFcCuivztWDlEcWwfDQpbke9/pU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gchmt89TT5oD79rfhXu/H4ZykAbuItaUaR+pTDX7lpkOdOEuCyG6rnMPwR3Pt+W0MPKI0+J7+dlThUh80HujDuL4HZOoJBAtpa6LvrMM3MaYrPkbK5ZlCHGKAt9OeDePjef4/An4vuQOBTU7NmsuVQXLpiQVJclIfyfh0rIaLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=RTQsyCsa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="RTQsyCsa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso41667845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790848139; x=1791452939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7JKuc+UM6J7vMN5pxtMu3jOLdN1mwy5ealpXQmuqWg=;
        b=RTQsyCsa5bqNEDnEzgzHXYPEOrhmuMwTTQlKOkvsFlG4I4Hg3+8Hn4O62bmF0I/vUs
         uxMYdxxrpsr53fgGP60GSjWzN9panh6enXiB2lXe8+SN1CmafHvoZqt3xeUBpdgFCZ9j
         VjYJEoFu18p6mE0s0fuA2VOtl3cGtd8DrzXSTBRfRocqbmfIwxgWqkAM7wmegSGYETAk
         7mAcrJrN7fC3NosQ1+jjMl5Pf9Dkj8/VLHAcCAYdT3Qf5CoFkf9RBvwD5fOD7rafnxEZ
         UIiW0v8ejG70sxjiCkSQv2DIqkXgUhi8WAE/bXQl9KHt1LdhEiY+I8Q3hSG2I9jZippT
         XwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848139; x=1791452939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7JKuc+UM6J7vMN5pxtMu3jOLdN1mwy5ealpXQmuqWg=;
        b=PjV8KubLF5nvUokAs9J2CiJquF9tKunp8wsTbehAJA4de1ejhW96qvzP1XI0IAykDC
         djzMl9vBjfpuMZL9SIh7sb0Qx0sGhme6aaelkxWjc/7P0HRb/jrL5WcCcepItyFfNhM9
         9DtWQOdRqjNSURmr+vnBYtfqqdSGi+gaPxzGn0TUDwAv5CkERAepz97aRopa3/Y/bJeJ
         9dnWRGiwq4cIy0RhCdCIpVl3ux04w9UcYL5j7zOWlC2H+GZ+hgZoelpIVQqh7zYCElLo
         GRHrSpDPnBdQvx3re+5qyFveXH7Wy9u4YCxCDFxEphjFGY/EgAubfly4gyVfz8boQF+h
         Nujg==
X-Forwarded-Encrypted: i=1; AKwUvByF5aXgxOVEbeCOncVW6ES8WWLiOdhlpkteXBUr2iVOj0r1cZDiILwb52k++liJ0+6zdZ7Je/EP37i9UME=@vger.kernel.org
X-Gm-Message-State: AFuF++k3agdHhEbRAoOUv2KSzoYdXlUE+Uhn59fvfnSP2A96eEsJrfew
	yYPQeOrh9unSPPmvax6RtKwkcfJBR5CxF8ON72ATloGiILA5J2/C0ajPbLzsjsLVHwaZqJGyUka
	Yb4EZETET1g==
X-Gm-Gg: AYBFou3KqTb5SH7oY3TLG0rYp41rjYmYJShf+s/VJ5Ac2BtQt25KVBxlsZprO44INv1
	09esyiGC3OuU71kRZjYfxjuiYyb9DD0Akn4gvPwKPkIR0RqgX+vpedKcE9eEJv8KeaAvz6oSazW
	z90SDfwYs/AN+zkPUY7tbNKxYB6m8xlLVEtQQiA/6NDnLkNTgEOFOxS7pWSfdYs6EBvblso/Ltb
	oJJaSG/NGujoe8xviCVtdGWQhKhOW3hp5FCsbLQ7YE3rAX5zjT8XE0gTzJBy7IrVS00FwGuAM/i
	rAi4Cxh2ETgJkoDy/u1EsYI7OVpYPL0G29pW1iRKhc3K+PZ+91ITxhN6j2ClgGP6amC4E4HcdhX
	KPf2AaPd4P6M+z588dOw98QwaW2eUwiLLr9fB8rzJ4uRGHADc6xsdI1tuJEBLSXk3uxuxSr3Rds
	DxEa5BbJfUqdalxFQzfa72I3CthBmBJPCsE2AGdRdyuHTlvNW6Ti/w/2eXbBXL+n27AAfQpE1Hu
	9ewKpohbrJNFJw1hG7HBFeP8Es/MUQ0C6Do
X-Received: by 2002:a05:600c:6815:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-4a01b13532fmr71687085e9.35.1790848139033;
        Thu, 01 Oct 2026 02:48:59 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([83.71.242.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm1938341f8f.43.2026.10.01.02.48.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 02:48:58 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	hare@suse.de,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH v4 0/2] nvme-multipath: fail I/O when no usable path exists
Date: Thu,  1 Oct 2026 02:48:55 -0700
Message-ID: <20261001094857.74567-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On virtualization hosts we run NVMe/TCP targets with ctrl_loss_tmo=-1.
During a long fabric outage, I/O on a multipath namespace is queued
until a path returns, so a SIGKILLed VM process cannot exit while it
drains I/O to an unreachable target and is stuck in D state.

Patch 1 fixes nvme_available_path() so it stops queueing I/O that should
be failed, by default and without any flag:
 - respect fast_io_fail_tmo: when a path exists but its failfast timer
   has expired, fail instead of falling through to queue_if_no_path
 - a LIVE path whose ANA state is inaccessible or persistent-loss no
   longer counts as available (ANA change stays transient and queues)
 - kick the requeue work from nvme_update_ns_ana_state() so parked I/O
   is re-evaluated when an ANA transition leaves a namespace inaccessible

Patch 2 adds the fail_if_no_path attribute, an opt-in per-namespace
policy that fails parked and newly arriving I/O instead of queueing it
when no usable path exists. It is the namespace-scoped counterpart to
the controller-scoped fast_io_fail_tmo, needed because sibling
namespaces behind the same controllers must keep queueing while one
namespace whose consumer is gone releases its parked I/O. It sits
alongside delayed_removal_secs as a per-namespace policy in
nvme-multipath sysfs. Controller state is untouched and reconnects
continue.

This answers the question from the v3 review. The intent is exactly per
namespace differentiation, some namespaces stop waiting while others
keep waiting for the same controllers to reconnect. Patch 1 fails the
conditions the kernel can detect, an expired failfast timer or an
inaccessible ANA state. It cannot detect that the consumer of a
namespace has exited while its paths are still connecting, so that case
still queues by default and only an explicit per namespace opt in can
release it.

Changes since v3 [3]:
 - Split the single v3 patch into a two-patch series: the
   default-behavior fixes first, the opt-in attribute on top (Hannes,
   Keith).
 - The ANA inaccessible and persistent-loss handling is now the default
   and no longer gated behind the flag (Keith).
 - New: respect fast_io_fail_tmo. When a path is present but its failfast
   timer has expired, nvme_available_path() now fails instead of falling
   through to the queue_if_no_path window (Keith).
 - New: kick the requeue work from nvme_update_ns_ana_state() so parked
   I/O is re-evaluated when an ANA transition leaves a namespace
   inaccessible (Keith).
 - Patch 2 now carries only the fail_if_no_path attribute, rebased on
   patch 1's corrected defaults: it gates the CONNECTING case and
   overrides delayed_removal_secs, taking precedence over
   queue_if_no_path when both are set.
 - Document the fail_if_no_path vs delayed_removal_secs (queue-if-no-path)
   interaction in the ABI entry (Hannes).

Changes since v2 [2]:
 - Use the nvme_state_is_live() helper for the ANA state check, keeping
   the explicit NVME_ANA_CHANGE carve-out so transient ANA transitions
   still queue (Nilay).
 - Return early when the stored value matches the current setting,
   skipping synchronize_srcu() and the requeue kick (Nilay).

Changes since v1 [1]:
 - Rename the attribute from fail_io_now to fail_if_no_path (Nilay).
 - Make the policy persistent instead of self-clearing. Drop the clear
   in nvme_mpath_set_live() so it stays set until userspace clears it.
 - Enforce it inside nvme_available_path() by controller state. A
   CONNECTING controller and a LIVE controller whose path ANA state is
   inaccessible or persistent-loss stop counting as available. RESETTING
   and ANA change keep queueing. With no controllers left it overrides
   the delayed_removal_secs window.

Validated on hardware with a 6.17 backport of this series: parked I/O on
a SIGKILLed VM process failed within a second of enabling the policy and
the process was reaped, new I/O failed fast during the outage, the
policy persisted across path recovery, and disabling it restored
queueing.

[1] v1: https://lore.kernel.org/linux-nvme/20260904032605.65758-1-kiyer@crusoe.ai/
[2] v2: https://lore.kernel.org/linux-nvme/20260917231647.79956-1-kiyer@crusoe.ai/
[3] v3: https://lore.kernel.org/linux-nvme/20260923004959.88440-1-kiyer@crusoe.ai/

Krishna Iyer (2):
  nvme-multipath: fix path state evaluation for failfast and ANA
  nvme-multipath: add fail_if_no_path sysfs attribute

 Documentation/ABI/stable/sysfs-nvme | 16 +++++++
 drivers/nvme/host/multipath.c       | 74 +++++++++++++++++++++++++----
 drivers/nvme/host/nvme.h            |  2 +
 drivers/nvme/host/sysfs.c           |  4 +-
 4 files changed, 87 insertions(+), 9 deletions(-)


base-commit: 2ee54f01f07c0307deaf90ca8691a4643ae0357b
--
2.54.0

