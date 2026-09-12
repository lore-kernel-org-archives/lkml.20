Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A13F9F47
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789202831; cv=none; b=ONT38qd6gK2N3bOWBWTMRHIiP959ObIYK3W9u+mJQoIpR0aSpOtN4sPR/TQntx8uhA9Et4c2TB3vWvZWiX1lBgvPZyG6zbLqWzblGHWT6jr3ptOsPs214GH93efMHW8KOclkz0P4lIC9lxRC1wEL98TLjGqyVNwLSsyZdBVHVPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789202831; c=relaxed/simple;
	bh=rIulgAVduBypCeoiobuSpr5uxv7+IkP6LQ/8CR0yfZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l0wLg9ybwpKDCPeWFe5RuCJEigleuUkzqGALEGFgWYM33fq/pWg9oaw6wDnnfTzlp4erkceowRXFA4Pfourmeb2qVqxPQhL7B0IFUiZAqyvv8oZ9IQeeV3JoNHJElG69tvYg7pNorUlHGcQ/oK7yLUuCKmN8Ub78SOGUsfFVEIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSVpapSs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSVpapSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789202828; x=1820738828;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rIulgAVduBypCeoiobuSpr5uxv7+IkP6LQ/8CR0yfZg=;
  b=JSVpapSs0Cd5KWqT03w3H3pEgJwh2VhxxTzRXIL4m64IODN4nR/a2l2m
   v120eFc5yKnRsBXdkzCLI64PsK6EDucRZgDU8PA7tYJtrTX7PS8hdXp5g
   gH9zw9CcLcCThFowrj56Xt6HouvhZmSJ5wvQd3oNcFB7fD7dSjskRdij6
   3uVLc+mbyiaCHlDLtaOV1dcocoJ63oE/la5hvx2gR93XMBdeGKhyqCbB6
   8Pymn6YwKG08IkDBQaHXItYaUyRnnaVRbzkTnLakD/NF5ia6wknT4yc0z
   eu9L3xEnwiu5gLvKmGTgHm1reOuL5PQ9P5fYSnnwvJfnDdl+fsVvNtVKL
   A==;
X-CSE-ConnectionGUID: qaXxWapcTryDBHfeokCK/g==
X-CSE-MsgGUID: vvRAqyudSjiM3sVULS0guA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115186783"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="115186783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 01:47:06 -0700
X-CSE-ConnectionGUID: u0KD6KQfTxmHHyyTc6OgOw==
X-CSE-MsgGUID: 3HnY/+P5QomshGURjybSSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="272654198"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2026 01:47:04 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5JO1-000000002nb-3ju4;
	Sat, 12 Sep 2026 08:47:01 +0000
Date: Sat, 12 Sep 2026 16:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Subject: include/trace/events/dma_fence.h:17:1: sparse: sparse:
 dereference of noderef expression
Message-ID: <202609121613.vc7vgYkY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: 21f6bcdf2be72e750dbe430b7227a66763a58466 Merge tag 'drm-misc-next-2=
026-02-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
date:   6 months ago
config: microblaze-randconfig-r112-20260910 (https://download.01.org/0day-c=
i/archive/20260912/202609121613.vc7vgYkY-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260912/202609121613.vc7vgYkY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 21f6bcdf2be7 ("Merge tag 'drm-misc-next-2026-02-26' of https://git=
lab.freedesktop.org/drm/misc/kernel into drm-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121613.vc7vgYkY-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1040:38: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected char const [noderef] =
__rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1040:38: sparse:     expected char const [no=
deref] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1040:38: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1041:36: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected char const [noderef] =
__rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1041:36: sparse:     expected char const [no=
deref] __rcu *driver
   drivers/dma-buf/dma-fence.c:1041:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/tra=
ce/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_f=
ence.h):
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression

vim +17 include/trace/events/dma_fence.h

e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst 2014-07-0=
1  11 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  12  /*
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  13   * Safe only for call sites which are guaranteed to not race with fe=
nce
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  14   * signaling,holding the fence->lock and having checked for not sign=
aled, or the
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  15   * signaling path itself.
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  16   */
62918542b7bf08 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
6 @17  DECLARE_EVENT_CLASS(dma_fence,
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  18 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  19  	TP_PROTO(struct dma_fence *fence),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  20 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  21  	TP_ARGS(fence),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  22 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  23  	TP_STRUCT__entry(
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  24  		__string(driver, fence->ops->get_driver_name(fence))
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  25  		__string(timeline, fence->ops->get_timeline_name(fence))
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  26  		__field(unsigned int, context)
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  27  		__field(unsigned int, seqno)
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  28  	),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  29 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  30  	TP_fast_assign(
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  31  		__assign_str(driver);
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  32  		__assign_str(timeline);
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  33  		__entry->context =3D fence->context;
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  34  		__entry->seqno =3D fence->seqno;
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  35  	),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  36 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  37  	TP_printk("driver=3D%s timeline=3D%s context=3D%u seqno=3D%u",
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  38  		  __get_str(driver), __get_str(timeline), __entry->context,
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  39  		  __entry->seqno)
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  40  );
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  41 =20

:::::: The code at line 17 was first introduced by commit
:::::: 62918542b7bf08860a60ebbde7654486e0ac0776 dma-fence: Fix sparse warni=
ngs due __rcu annotations

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
