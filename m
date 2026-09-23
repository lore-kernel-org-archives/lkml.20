Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FA45C70F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195240; cv=none; b=iW+yLqZxSKCzuTcgSO6tqTVusDcnnFNvtdvoq4IhdPu+wm3CyYTlMIaH7jTQBUlDNYFuUgErbdKrI+QMkcsdHrcKjOUEHUT+U+T9Xzzj47ZFPmc7PDYnXvF7ZEbLL/4Ftm33Y1aT37myEzSULDcueUGR5BZ+3tAV0iGAmHbV+LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195240; c=relaxed/simple;
	bh=wrupWIoQ7mkSyAQTC8D9O8E7C2nWHlPDtbiD3cBr71k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTFVGoRv7sX/8WMB41Yy4fn+jpFYSTkyw1QjipzhKz8tMIj8a4XTBuZFshKxDawx3QRRNcMF8jlvFdDE1NkXFC5KBuvP4WWxInXFjCtnIAIPqLuTdDTqR3LWYU+1qrddJ4aU92IGnIcd77LTcz8Kk5kJDDR1Z4oU36eSpUpl05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYk4BEBU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYk4BEBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790195226; x=1821731226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wrupWIoQ7mkSyAQTC8D9O8E7C2nWHlPDtbiD3cBr71k=;
  b=KYk4BEBU32WB91wQxdCb4u84+9U0PCzWmZZXAjjHsWnfjL85fdW4zZyg
   OcK6veFIzH+IY4im/y7To438rYKj1fGYJ7A8oUCyQfS4TCpeLGcHhj7h0
   Y7kTHlubzROZzvI3ZQX1QZ/yez0Xs/uKQZJ8PjxvJ9Bbu1czzhsh9IGE9
   pIOxyMaOhNCbXMX/z2p0t7XP4kmScmv5wyDk800OttEuo7ez1fNnNVA5g
   tvO7RaTLmYLcq+k8TbDKyVm9ZJCWr4JudyDwcOZNnX/HtYdWRHgtvZeVs
   IU0kON8gYCXIJYMkp4yShRrq3r1ys0XQC/akg6bftRLRnDBYpF6yuKZmN
   A==;
X-CSE-ConnectionGUID: BZY1BCcoSDCdHMNdb4SlSg==
X-CSE-MsgGUID: 2y/nwrGYRuW+bMya0EFKqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93435096"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93435096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:26:58 -0700
X-CSE-ConnectionGUID: iqqiz5y+TsevJFXGpF2fqQ==
X-CSE-MsgGUID: K3MbR5IsSaSCbJ17UV+jiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273243463"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:26:58 -0700
Received: from cwf-2s5.sh.intel.com (cwf-2s5.sh.intel.com [10.239.48.132])
	by smtp.ostc.intel.com (Postfix) with ESMTP id BA5C66393;
	Wed, 23 Sep 2026 13:26:55 -0700 (PDT)
From: Shreshth Srivastava <shreshth.srivastava@intel.com>
To: Juergen Gross <jgross@suse.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v5 04/17] x86/msr: Move MSR trace calls one function level up
Date: Wed, 23 Sep 2026 16:26:35 -0400
Message-ID: <20260923202654.1412087-1-shreshth.srivastava@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260911084211.3149957-5-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com> <20260911084211.3149957-5-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11.09.26 10:41, Juergen Gross wrote:
> In order to prepare paravirt inlining of the MSR access instructions
> move the calls of MSR trace functions one function level up.
> Introduce {read|write}_msr[_safe]() helpers allowing to have common
> definitions in msr.h doing the trace calls.

Hi Juergen,

read_msr() and write_msr() get a single wrapper below the
CONFIG_PARAVIRT_XXL ifdef holding the tracepoint, so it fires for either
implementation. rdpmc() moved into the same ifdef but kept the old
arrangement: still defined twice, once per arm, with do_trace_rdpmc()
still called from native_read_pmc() above the ifdef.

With CONFIG_PARAVIRT_XXL=y that leaves rdpmc() on a path with no trace
call:

  rdpmc()                 => paravirt-msr.h, PVOP_CALL1(pv_ops_msr,
                             read_pmc)
    xen_read_pmc()        => Xen PV sets pv_ops_msr.read_pmc to this
      reads the value out of the Xen shared PMU page
                          => returns without ever calling
                             native_read_pmc(), which is where
                             do_trace_rdpmc() sits

So msr:rdpmc doesn't fire under Xen PV, while msr:read_msr and
msr:write_msr now do.

Was that deliberate? If it wasn't, here is a diff that treats rdpmc the
same way as the other six: rename both definitions to read_pmc(), matching
the pv_ops_msr member they dispatch to, and add one rdpmc() below the
endif holding the tracepoint. native_read_pmc() is then an untraced
primitive next to native_rdmsrq() and native_wrmsrq(). Would something
like this help?

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index eba325ecfe4c..6f50b703fba9 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -305,8 +305,7 @@ static __always_inline u64 native_read_pmc(int counter)
 	EAX_EDX_DECLARE_ARGS(val, low, high);
 
 	asm volatile("rdpmc" : EAX_EDX_RET(val, low, high) : "c" (counter));
-	if (tracepoint_enabled(rdpmc))
-		do_trace_rdpmc(counter, EAX_EDX_VAL(val, low, high), 0);
+
 	return EAX_EDX_VAL(val, low, high);
 }
 
@@ -343,7 +342,7 @@ static __always_inline int write_msrns_safe(u32 msr, u64 val)
 	return native_wrmsrns_safe(msr, val);
 }
 
-static __always_inline u64 rdpmc(int counter)
+static __always_inline u64 read_pmc(int counter)
 {
 	return native_read_pmc(counter);
 }
@@ -413,6 +412,16 @@ static __always_inline int wrmsrns_safe(u32 msr, u64 val)
 	return err;
 }
 
+static __always_inline u64 rdpmc(int counter)
+{
+	u64 val = read_pmc(counter);
+
+	if (tracepoint_enabled(rdpmc))
+		do_trace_rdpmc(counter, val, 0);
+
+	return val;
+}
+
 static __always_inline void sync_cpu_after_wrmsrns(void)
 {
 	if (cpu_feature_enabled(X86_FEATURE_WRMSRNS))
diff --git a/arch/x86/include/asm/paravirt-msr.h b/arch/x86/include/asm/paravirt-msr.h
index ba3ee64446db..47220bf16cf3 100644
--- a/arch/x86/include/asm/paravirt-msr.h
+++ b/arch/x86/include/asm/paravirt-msr.h
@@ -172,7 +172,7 @@ static __always_inline int write_msrns_safe(u32 msr, u64 val)
 	return err ? -EIO : 0;
 }
 
-static __always_inline u64 rdpmc(int counter)
+static __always_inline u64 read_pmc(int counter)
 {
 	return PVOP_CALL1(u64, pv_ops_msr, read_pmc, counter);
 }


I have no Xen PV guest, so that path is untested. What I did check is that
the __tracepoint_rdpmc relocation shows up in arch/x86/events/core.o with
CONFIG_PARAVIRT_XXL=y, where it previously did not, and that x86_64
defconfig still builds clean with gcc and clang.

Thanks,
Shreshth
