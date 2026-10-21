Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612305;
	b=nwONVMGlN0fSOAYXPV42yA0yXjcCTYJeRCY0laF2PrIspxpJTwayidf/e0wVO5EGo4f0
	 RJIiQ2R9idz+N6RkJ1gnYh21mXQV0vRz4nJP4FeiEQvWUEf2+nE3p5/SL09yfR+3OI2Ow
	 euuTWoeveoRG44sNyAqOZ/vns0Y5LpX7p6IIblDzvCa3Ef3yv8KdP7huMmRnyOxhG5KDG
	 OeFj494Zh8LbcDtY5x52nIr6AHWxiRHcQjtXmXtz4vkXXYFdK0v9+oyLsw8R9zZD1Q565
	 TYM8hEk6Ui3Ta7PHBsMJwXItO482XOPX6/R0bcBvrhzIGMvOeP9wsWFJV1Hr8kxHJBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612305;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=I0MXsKMs59mPbhmE7ZGwTU6fx9JD6lThJj/ixY0hGXI=;
	b=QE10OpQ+IRbiWG/KMsmistdQDJlbyIkuospXywI3e6MLpzOJ3spruFi5idB5mmu5BJGb
	 MJ5cOaoywoYbdd99SXA05r7gcYr6dUPWX4aT6/LDHMRToh2xDpXtY8GJnbkY186KgoDYb
	 IfTiJRvo48OXv5WpR07pvsbPjQkUFSp5muyTLeTjpeeiB6wh0DyNS+IcDVC2arO2oC7Vt
	 XbxqPjH38SfB5lgITweb8Ah9iU4VD8XmLBuYkhTC4a0wg+JM2qAUX8Q8y/O9oLP1EJldr
	 yggSaY5Ety2ZAuF/hsqVpJxOTDQo5vUvKDKe0AqXpqiTTHcRwjNrj4GSZlRONNCXc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ld4TfzyK;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0C60A5BCB
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E0C60A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ld4TfzyK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612305; x=1824148305;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=/Nl3sd2w/+pg9x+6y5hkUR9EM7Ft4O+HIvfJw4eUnOw=;
  b=ld4TfzyKCpjlif3IwSK7SqN8FNLlDsBHkqMCh4oybaTZEFY4cINA3+up
   9EbhPNzgdn8qhvdSYByj1oD3yvxdSSxSuVEYj55Y90EN6pO/5RqpGNLrk
   jsbSCgC4E4oXRdWiOSnIQ+gNu1ly7u4gbwW6KvYUDCD7tsZDP4R6ztVyy
   PZYMFAbRmi3scJ6TD5g1j8DK+ykMvfS7TQR3UlkcNB0XJ8w8VAJ4/R7/m
   6fCusMKIqpbemPyZAb3N/JVJXXgfz5r+rbuw3QrT0uwxgYb6bmKRC2his
   irnDGxnXO8f2A4rlDytjled4Dba1yGLCkzn2rT7BkVnF1UFyeoHDbkXSq
   Q==;
X-CSE-ConnectionGUID: 1SgT5R7+T4+DIRK+9iJG2A==
X-CSE-MsgGUID: 2KGUOY88Qt2TyVgbeKtjNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230225"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:45 -0700
X-CSE-ConnectionGUID: H/QMLIC/QySHz2J2RraCRw==
X-CSE-MsgGUID: Be3egP0VREyeWvtZmEBTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092220"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:45 -0700
Subject: [RFC][PATCH 18/24] kernel/task: Add a helper to get the thread_union
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:45 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195145.40C0CF76@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


There's currently no helper that, given a task, can work back to the
"outer" thread_union. Add one to help locating the shadow stack
mapping location.

---

 b/include/linux/sched/task_stack.h |    5 +++++
 1 file changed, 5 insertions(+)

diff -puN include/linux/sched/task_stack.h~generic-task_thread_union include/linux/sched/task_stack.h
--- a/include/linux/sched/task_stack.h~generic-task_thread_union	2026-10-21 12:36:41.575888044 -0700
+++ b/include/linux/sched/task_stack.h	2026-10-21 12:36:41.577888048 -0700
@@ -23,6 +23,11 @@ static __always_inline void *task_stack_
 	return task->stack;
 }
 
+static inline union thread_union *task_thread_union(struct task_struct *tsk)
+{
+        return (union thread_union *)task_stack_page(tsk);
+}
+
 #define setup_thread_stack(new,old)	do { } while(0)
 
 static __always_inline unsigned long *end_of_stack(const struct task_struct *task)
_
