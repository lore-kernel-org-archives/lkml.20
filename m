Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612296;
	b=RIPv6tQRXAlNop7UJP/c1r9k3/J08v/pbtGrchy1IUMCrmWeOow1HwImcREVcW2/4nAD
	 KnZV5HwI8nMUysUUFDt6hOOVVnrpwFQRy0HYD138S8DQgCvI11XhajelfRfQHY/tfeYFk
	 iaRn+4R64IcRb5hKF3N92DfIKkxmWZakzp9TndQ5ccuvjNtN94JnLNE4MqfEXngfQXAZX
	 pFMj86IxWggXb91eKVfKz1AKOZ90oB83AIj1sTPO8vrBPS8TbsfUDElCI5lvXZbfZDjHe
	 KbnQS20vFZojTeM+zaNPL3JlovrsSp5HQBKAozDu1jX0pJxFAx80yImyFVPucoLHm8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=tr6kZ65NxoAupd+TsmX/ZShACWkEQz2tCl3myBltTHY=;
	b=zeL+IsHG2ozUyO28EMd2UugHaH9AkI5XRnUw4MV3nEsWb5++dkmU7LHTgboEyW8IIIat
	 mZ5mbxMMOlk3ZFb5jDiEHiudIrkRjUa5io4ouG9gggFFjpGsrdLE8+dmAf72eYW1U0V6H
	 iE7ukf3r5VUAi5dCReQbtS2XmI5Aoo99a77GQqXHqwfIVGeToNWxuGg/8imUn8a2rlxpp
	 KbjFfD1fw0ZO4egdKh0uV5fsErlG/kNJ7kvibT6pOj9HkLHp0Grgh26pv+u8qzXxcBfFf
	 DNTlNC2H67E5X+1da8DRhmzBhfvChqEv9T2rvHShwKBcfcdy2KH5bCJnM0XaDedbAVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="b/X7uFlI";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7402606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7402606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b/X7uFlI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612296; x=1824148296;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=aLqBLPbwDAkjkV/aLgZu0up4JNWwh1P6by0dFqR0kB4=;
  b=b/X7uFlIiLU9+Pm5vLzPYDY+3USY1SLzrc3F6RFlJq3UFdq5O7Pu6xyL
   w1yWDwOO3pfhvQSi6dDnYJhQ6rFG+2ZEbjbNpx+VgssZY9OYGrbiETgwI
   3nOLs/pL6gvtbNIou1qfCRsQCr+TruflNE4Z+JPIJdTyTPza0wxJWQ15I
   8vemw1K6WTDN2oUmnDQGataX69ACh5PHcHlVU+dDq67JKvdWaufaWferr
   lTdMtOjRv9vk7CBZaqCxqRe5i3huNamVKlplkK45lUylJQh3PYmnSt5/I
   RFP/paGRXHMtzLh7kdRPPcycjmOhZoUj79motfhl5xX6FCfk9agW/cz7b
   Q==;
X-CSE-ConnectionGUID: d9nSi0LSRsqIMSHD6pAzpw==
X-CSE-MsgGUID: E5MaOmShRQGrcdIuEVOFYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230146"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230146"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:36 -0700
X-CSE-ConnectionGUID: BcPjDrnLRvSKunt2tZbxWw==
X-CSE-MsgGUID: IpMzFaG3SlyR/PIokD58Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092117"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:35 -0700
Subject: [RFC][PATCH 11/24] x86/mm: Add kernel shadow stack permission macros
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:35 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195135.67509519@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Add PAGE_KERNEL* macros for kernel-permission shadow stacks. These allow
shadow stack mappings to be established in a visually similar way to
existing PAGE_KERNEL* users.

---

 b/arch/x86/include/asm/pgtable_types.h |    2 ++
 1 file changed, 2 insertions(+)

diff -puN arch/x86/include/asm/pgtable_types.h~PAGE_KERNEL_SHSTK arch/x86/include/asm/pgtable_types.h
--- a/arch/x86/include/asm/pgtable_types.h~PAGE_KERNEL_SHSTK	2026-10-21 12:36:37.794880805 -0700
+++ b/arch/x86/include/asm/pgtable_types.h	2026-10-21 12:36:37.797880811 -0700
@@ -224,6 +224,7 @@ enum page_cache_mode {
 #define __PAGE_KERNEL_ROX	 (__PP|   0|   0|___A|   0|   0|   0|___G)
 #define __PAGE_KERNEL		 (__PP|__RW|   0|___A|__NX|___D|   0|___G)
 #define __PAGE_KERNEL_EXEC	 (__PP|__RW|   0|___A|   0|___D|   0|___G)
+#define __PAGE_KERNEL_SHSTK	 (__PP|   0|   0|___A|__NX|___D|   0|___G)
 #define __PAGE_KERNEL_NOCACHE	 (__PP|__RW|   0|___A|__NX|___D|   0|___G| __NC)
 #define __PAGE_KERNEL_VVAR	 (__PP|   0|_USR|___A|__NX|   0|   0|___G)
 #define __PAGE_KERNEL_LARGE	 (__PP|__RW|   0|___A|__NX|___D|_PSE|___G)
@@ -249,6 +250,7 @@ enum page_cache_mode {
 #define PAGE_KERNEL_RO		__pgprot_mask(__PAGE_KERNEL_RO         | _ENC)
 #define PAGE_KERNEL_EXEC	__pgprot_mask(__PAGE_KERNEL_EXEC       | _ENC)
 #define PAGE_KERNEL_EXEC_NOENC	__pgprot_mask(__PAGE_KERNEL_EXEC       |    0)
+#define PAGE_KERNEL_SHSTK	__pgprot_mask(__PAGE_KERNEL_SHSTK      | _ENC)
 #define PAGE_KERNEL_ROX		__pgprot_mask(__PAGE_KERNEL_ROX        | _ENC)
 #define PAGE_KERNEL_NOCACHE	__pgprot_mask(__PAGE_KERNEL_NOCACHE    | _ENC)
 #define PAGE_KERNEL_LARGE	__pgprot_mask(__PAGE_KERNEL_LARGE      | _ENC)
_
