Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612312;
	b=HAizOWH7cJA6eNs/v2ujl+z2Gp3KA8l3+R9N+W/2xs5VJLIz//gNsB26QtDCgptpJ9WO
	 usT+MTDn5X9usGfsn0F2ynRgJ3aOXeAfnZFcFf1maMA7uTNSTgC3iwxDlP0Qi12CfTC9F
	 SKmmaFrrDWzNXp29Se9QBbqETX/jhRJEjB53TKVOpxmwZkPCyeA3WF0JmrALjGEOpkh37
	 D8N2FB1RNTvC8Bv5Qk6w3tIt6qW4h1oVD7QKmtpB/bVHoE9Dj7YE7QG2kKojDztjKAUDp
	 yo/IZvOF5NtRCXvE5q3k8HGCkolaZBcdtiyy7C82bNHEyK6VzqdlLNX1xI/Ca783QGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612312;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=Us82m4vkcdPrarQageYEZKdWE9ZdErx0C96b9osx1+s=;
	b=2OQAKL6myso3u7vRL/EsejtdZlUfvN3B4znkxFxpRqusVg8OPq55vex8ewsRsXoTTU7a
	 soTciD5DT3CjqptfuiX6Qd/w3MHT8Yv4l3dUVKVcAlGoTkaM/oLd4LIAFO6nuI9CIhvEK
	 lceN64dSdvdEFL62eblZSo/ve2t+J1P0efNuaV1ahVH0Ts6mRyJLc9JU6I4TJ3iQ46FvZ
	 wRrQOrexPkHSpzVSBb5tfwDBIQWGdFDpo3aFTd43FVTTtPtXzmOie0mr+xYfe8z1WrtGI
	 m+c86kKWKpm0giudk9+aZ9Z99P0QXS2Ylw7PrPVHfMTq6uMzuXtmLBDNsAux6SCXp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="azR6/Rjd";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B16E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B16E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=azR6/Rjd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612312; x=1824148312;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=mMRwQlV3w5C719HDe6g6qL8UvD5Zt7v7uu2o4x4H5Hc=;
  b=azR6/RjdPiHf8PtSvoWVH1qJ4/o8W3+MuRHvr2evFmy1tfxvNXL5mI4q
   9KOoP2mGkAmh7BGOyj9Inx50NP0u6adfIpF/02RJ7/6VtFVR3tq1TwBMD
   Kz1OxDjEIyWV3BidiALftlI6JXphT7RIAi0ngTFS0w9cnc4IKxBzf5j7e
   UTzvoip7/0vY/YaFT/HcjCy1lE/kawTafCAh/MDWlMN6YtY5HkMdYLNg8
   DSsvbVS7lvZ7hqwikzO02gTl5QDbSDLtlTKskJGPEYjczf3iBjx9wmSib
   coS4oHrc7/zMuY006iZGS4852YFDwoqsssOibjgwZWKqXBrui0Zd2cu7Z
   Q==;
X-CSE-ConnectionGUID: 7ByZYmdZRuC6V7W77FAdVw==
X-CSE-MsgGUID: khFQh+/kTq++xj9uAcVJoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230277"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:52 -0700
X-CSE-ConnectionGUID: sROZbS6uTamvWRTtFh9QfQ==
X-CSE-MsgGUID: cMnlBX1FRbClqS/IcDPNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092265"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:51 -0700
Subject: [RFC][PATCH 23/24] x86/entry: Populate FRED register for user=>kernel transitions
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:51 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195151.8AE1628B@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


== Background ==

All the shadow stack work up until now has focused on running inside
the kernel. The work has manipulated the actual shadow stack pointer
(SSP) and prepared FRED hardware to update SSP across kernel=>kernel
event boundaries (the SSP values stashed in FRED_SSP[123]). Note that
the shadow stacks for event handling are fixed for a given CPU and
never change.

Once in place, this lets the kernel move SSP around for normal
CALL/RET operations and also handle FRED-delivered events like
interrupts and faults.

But, this all only covers kernel=>kernel event boundaries like when
the kernel takes an NMI or a page fault.

== Problem ==

There is currently no handling for user=>kernel transitions. Those
events must use the active kernel task's SSP which is *not* constant
on each CPU.

== Solution ==

Point FRED_SSP0 to the active kernel task's SSP before returning to
userspace. This ensures that the FRED hardware will set SSP to the
correct per-task value when doing the user=>kernel transition.

Mirror FRED RSP0 handling for SSP0. Avoid setting FRED_SSP0 during
context switching itself. It is not necessary to have a "good"
FRED_SSP0 value when running the kernel, only userspace.

---

 b/arch/x86/include/asm/entry-common.h |    2 +-
 b/arch/x86/include/asm/fred.h         |    8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff -puN arch/x86/include/asm/entry-common.h~fred_update_ssp0 arch/x86/include/asm/entry-common.h
--- a/arch/x86/include/asm/entry-common.h~fred_update_ssp0	2026-10-21 12:36:44.081892846 -0700
+++ b/arch/x86/include/asm/entry-common.h	2026-10-21 12:36:44.086892856 -0700
@@ -65,7 +65,7 @@ static inline void arch_exit_to_user_mod
 		arch_exit_work(ti_work);
 
 	fred_update_rsp0();
-
+	fred_update_ssp0();
 #ifdef CONFIG_COMPAT
 	/*
 	 * Compat syscalls set TS_COMPAT.  Make sure we clear it before
diff -puN arch/x86/include/asm/fred.h~fred_update_ssp0 arch/x86/include/asm/fred.h
--- a/arch/x86/include/asm/fred.h~fred_update_ssp0	2026-10-21 12:36:44.083892850 -0700
+++ b/arch/x86/include/asm/fred.h	2026-10-21 12:36:44.086892856 -0700
@@ -105,6 +105,13 @@ static __always_inline void fred_update_
 		__this_cpu_write(fred_rsp0, rsp0);
 	}
 }
+static __always_inline void fred_update_ssp0(void)
+{
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+	if (current->thread.kshstk_ssp)
+		wrmsrns(MSR_IA32_FRED_SSP0, (u64)task_shstk_top(current));
+#endif
+}
 #else /* CONFIG_X86_FRED */
 static __always_inline unsigned long fred_event_data(struct pt_regs *regs) { return 0; }
 static inline void cpu_init_fred_exceptions(void) { }
@@ -112,6 +119,7 @@ static inline void cpu_init_fred_rsps(vo
 static inline void fred_complete_exception_setup(void) { }
 static inline void fred_sync_rsp0(unsigned long rsp0) { }
 static inline void fred_update_rsp0(void) { }
+static inline void fred_update_ssp0(void) { }
 #endif /* CONFIG_X86_FRED */
 #endif /* !__ASSEMBLER__ */
 
_
