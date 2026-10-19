Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447678;
	b=ZbTcTAsF6PSqRU1iqjf2BUKxz7J9nMdd8hSCU75ybbruxriK1L8x+U/+Iw67rj60NI3e
	 YRigdxXIQ1i4FA6HV880kHct01aiuP397+wpQHy9bwavszZfKQwavJUp1QKP5dNuCZPUy
	 Zxf/V1QPwekw67t4vLOPnJpEYxgT6p19oUQJ1g+Lfs8tu0TSqXAN8mfqSK4i218WZmTew
	 Rq0AOj4XlrfYz1EtEOOrDDx5okvEvDdLG/ETuWWV1ERaH6FfM4vTAHLdyyhGjl6/kR7eF
	 eB7XNnC8QKSQNL9bqEK1KF8NawBHJQyNB0nJ6ZKxns5/Z3L+9BKIUVo9MUu/h+6ULKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447678;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S4jhFytiI66cmmm6AXrsnro4R7bcDCLYlnTCIFvr7kE=;
	b=5Yw6HZUMTvmlWTZdfgrx2BKt8/9aVHFzU6Oz9l64fQOupXOzfzeGFL64x+1JbwFbL6gg
	 TtECz5lUJxrMjIhQZAQSM04D9UjQ3mKv+7WZi1ZakWNl32QuY7UNe4Tlexpjvh7fNSxQQ
	 KjtLGav3YWDYpFjQDQOOEePF9QVLsAQJgXFjftoPnxfRl1hJbLhw+oapgYlPEvmQIBo79
	 dv/AUvJTU4krl5CEN7wUwIeJqn/f4cSCBsrEMcNt2GQehFwsOQJMSAcUUy8oxCpsikpoS
	 mM5CLhN2GvI655hMr+wJTONXhv8wbyH0G/jI935VGOAogVs5vsEbZvmpofcqYG8q7Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RCItmiej;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBEF606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBEF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RCItmiej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447679; x=1823983679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QQ9Bpf+tsb027Xat4FCScbe4wCVN+lfOpBdhngzVWbE=;
  b=RCItmiejCztd7CV0qzv20O3pnDMRDWOL62/34fnbr8qT5FWyu+6pUEFC
   hSdvol3A+iI/6dTSxMKu4HVuubTzQghuAXsEZYurBts6ame9kysx4DDoR
   0rQGL8PLgB5i/1py8jKH0Sq6TbtEJQn4kvXKV2ke4kLQa2KeJrdxBg0Bv
   /PNOSpCb+ELhhunr6qBG/74nuHQ+DSrmjBpJMpOtzrSMAbCzA5bxnTwbC
   Aw3JXcHFPnO0s8MlSxq+JlUe6vK4/v+ZvF3zT9AK+laKJW5+DjbCJWtQp
   A527dZJ80swPpBTbyoK1VmEuPkGOtuxZnn1gOr5YEK0cxWMxjE1/MPyIf
   g==;
X-CSE-ConnectionGUID: 3wn/RcRpTDqd6oMF07q9SQ==
X-CSE-MsgGUID: nB5riHupSViLAO9ZMek2rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144167"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:58 -0700
X-CSE-ConnectionGUID: MDzYSIG1SLubFn/53ZVIWQ==
X-CSE-MsgGUID: 0up9jIBoS/GQn2uwDl7dZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708324"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:57 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [RFC PATCH v2 00/10] arm_mpam: resctrl: Separate MPAM domains
Date: Mon, 19 Oct 2026 15:07:34 -0700
Message-ID: <cover.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
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

RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/

The MPAM driver represents a resctrl domain with a single structure,
struct mpam_resctrl_dom, that holds both a control domain and a
monitoring domain. On a system that supports both allocation and
monitoring, one instance is created for each domain and its two
domains are added to the resource's control and monitoring domain
lists.

Holding both domains in one structure requires control and monitoring
to be done at the same scope, and ties each control domain to a
monitoring domain. This does not fit the proposed support for multiple
controls per resource [1]. There, each control of a resource, for
example a "min" and a "max" memory bandwidth control, has its own list
of control domains while the resource keeps a single list of
monitoring domains. With one structure for both, every control domain
would come with a monitoring domain of its own, which does not reflect
the resource.

This series gives control and monitoring domains their own structures,
set up and torn down independently as CPUs come online and go offline,
in preparation for supporting multiple controls per resource. Along
the way it stops failing CPU online when a domain cannot be set up,
and adds checks when setting up a monitoring domain.

  1-2   Preparatory cleanups of domain allocation
  3     Do not fail CPU online when domain setup fails
  4-6   Separate the control and monitoring domain structures
  7-9   Checks when setting up a monitoring domain
  10    Comment update, kept separate for review

An earlier version of the domain split was posted on its own [2]. This
version incorporates the feedback from that discussion. It gives each
type of domain its own structure instead of duplicating the shared
one, sets up each domain independently instead of undoing one domain
when setting up the other fails, and adds the checks in patches 8 and
9.

Patch 7 turns a WARN_ON_ONCE(0) into a warning that fires. It is a
separate patch because it is not clear whether the silent failure was
intended. If it was, the patch can instead drop the dead
WARN_ON_ONCE().

This is an RFC because I am only able to compile test MPAM changes,
which is also why the patches are small and each change is justified
on its own. Patches can be squashed if preferred, for example patch 10
into patches 5 and 9. Testing on MPAM hardware would be greatly
appreciated, as is any other feedback.

The series is based on the for-next/mpam branch of the arm64 tree:
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

[1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
[2] https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/

Reinette Chatre (10):
  arm_mpam: resctrl: Use find_component() when allocating a domain
  arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
  arm_mpam: resctrl: Do not fail CPU online when domain setup fails
  arm_mpam: resctrl: Split control and monitoring domain setup into
    helpers
  arm_mpam: resctrl: Give the monitoring domain its own structure
  arm_mpam: resctrl: Rename struct mpam_resctrl_dom to
    mpam_resctrl_ctrl_dom
  arm_mpam: resctrl: Warn when no monitoring component is found for a
    CPU
  arm_mpam: resctrl: Require a component for each monitoring event
  arm_mpam: resctrl: Require monitoring components to cover the same
    CPUs
  arm_mpam: resctrl: Update the comment on monitoring domain setup

 drivers/resctrl/mpam_devices.c  |   2 +-
 drivers/resctrl/mpam_internal.h |  11 +-
 drivers/resctrl/mpam_resctrl.c  | 325 +++++++++++++++++---------------
 3 files changed, 181 insertions(+), 157 deletions(-)


base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.55.0

