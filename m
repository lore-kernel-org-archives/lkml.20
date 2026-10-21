Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612302;
	b=Z+S72x6bKEjzOlmUMxXL3LFUZoMnA30sBtalegSczEze/Wt3LwjXSy//tkXW30B0WXHe
	 Nh+0pF7eYwx2vLvw3njSstFgVNXU3hsK22oYQ3EF3h7qDW4GkPyi+dgn1KocC8HoTzxwZ
	 OhAPmIVb3bNLsCyXCJeShesGj4EAx0Jng8Vad2yhx+hWuyhcgs0OTzwrLuoRb/B4txfYM
	 o1b5TTq3aTGAVwD9eQ3zWzHmAWtXk9/SWDhbX1ui8VbYyxdZXYY0QU3pgjo7Cp0QNkbfE
	 B9gouzpKK/J+41pnZadAXgPsmxU6tgHjEzzEWl+Ki9JLLgyX0wV+JhWeY6f9Runv0PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612302;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=bqau19TqY0r4dpFYfNOfGhhJliHmi761J4F9WACojO4=;
	b=MbL5/z9py7gzk530WPAkpPwdOS5sAmnCdaPRuSysbikleN7SVHsuhhIHh0Qry3gNxtHq
	 fETRpyi/Xj83cPJ/JzN/Y/6lGp5H+BepFWXQr47fSGs3wWE8JrOHgdExiGtB1+hzMMUD2
	 Ltq/8HD9Pr8dpNE4DtyoQvPXntPHQcCqdKqmcsIxTj6UEy+BoGU5dymzA0d+6q+nUQ3Zs
	 bXCGHZwBrlazgdwMX7LsQ1l+lgFlueL5230tXCGUdqtfTJ6pG8VN7Wma/e8gK3mKqzZZM
	 5A5RAFhDPasAL6PLd+vp487XMI7G0CkZH5O+imxzNTidCu8MwydlATowetBJXEsPvqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dNaYl7+6;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4B60A4AE3
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB4B60A4AE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dNaYl7+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612301; x=1824148301;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=00F2KpuNNTQEkJdtDNlJ9Om6pSO458IPwDGtoI2CnoQ=;
  b=dNaYl7+6t8cq1c30zcaETr63/8hTpa/0EwBxLacPrweNod2+xaHo1QQl
   pp6SHBnPvweFE5LhUEdcc6yydSdp2m0wToOa9sbUcyTL6CDrl3arj3475
   C25TN8Xbisnbxnx+sACtB3J45+ABDxrVl4OPv/5HYxdK0a4wH53BZ9skS
   NmAxLGmf5UDRCktD6JAz82A2JRYsfBW+qCEV65sOf4ILMeCaetzTCHV5M
   L3YZweY4AlcZ56zUx5xJISqWWtKTPkVdQqlJR5owu0GyB5x7d711r3GQe
   BTsMEVXrGmkt3uy2X6XyOIXiwuRXgs4ltHuge0SOgbRVk1oa6sb0vbKcJ
   w==;
X-CSE-ConnectionGUID: cq4QJJdITgGL/ReiqcKZZA==
X-CSE-MsgGUID: jntz2ziCS9++rzR8GCONHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230198"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230198"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:41 -0700
X-CSE-ConnectionGUID: EHDdJ0ksQX+NEWuumwcnqA==
X-CSE-MsgGUID: NTxBZNHfS5qWSnUvYkea4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092177"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:41 -0700
Subject: [RFC][PATCH 15/24] x86/task: Hook up arch hook to detect shadow stack enabling
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:41 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195141.2A1FD9F9@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Provide an x86 definition for arch_kernel_shstk_enabled(), used in the
generic code to skip any attempts to clear shadow stack pages.

---

 b/arch/x86/include/asm/thread_info.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff -puN arch/x86/include/asm/thread_info.h~x86-shadow-stacks-enabled arch/x86/include/asm/thread_info.h
--- a/arch/x86/include/asm/thread_info.h~x86-shadow-stacks-enabled	2026-10-21 12:36:39.920884876 -0700
+++ b/arch/x86/include/asm/thread_info.h	2026-10-21 12:36:39.922884879 -0700
@@ -231,6 +231,12 @@ extern void arch_setup_new_exec(void);
 struct thread_stacks;
 extern void arch_init_thread_stacks(struct thread_stacks *ts);
 #define arch_init_thread_stacks arch_init_thread_stacks
+
+static inline bool arch_kernel_shstk_enabled(void)
+{
+	return cpu_feature_enabled(X86_FEATURE_KERN_SHSTK);
+}
+#define arch_kernel_shstk_enabled arch_kernel_shstk_enabled
 #endif
 
 #endif	/* !__ASSEMBLER__ */
_
