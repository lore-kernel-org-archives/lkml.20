Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612283;
	b=MCaENSZ4r7cgiDrC5flXSxNDydhTpsA3Nj6ec1tk0qZfmYSs4hkYobjckvbL/oCs0usA
	 WfXQoIMJUY85f7jjmte6HGIAjdkRgYqYXgGSUkF/Ta7TjiW/BJY93QmjU6kTh1YaNdGzF
	 1nOIEWmTfK08qitj8Gcp7QtkoONdFIZ1b9S9K9DrC+UKv9lsfgM8LsmYpOeVm7lDYghr+
	 NiWRLSB3O0TbAK78XCwSHvVQkNRyOYKYMfJLalduGlxi5oWGyyTYPNfPc82SzZ5KqBg2u
	 z/oG1BuV08CDL/k+5EBtaBc2jfE1Wgg0TZ0sNlyPVedBaaKH/O9VbPZjBU7Uzid2Ing==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612283;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=7Wxq0Tpm1aalOHES/DGjUKwPrhQKwD4LCX+2/1DFnTk=;
	b=nwRx9/R7YOyXSXgpGAJOxQ8nV/ojytp2CCHzmPJTNmlB/1iXiWfgKcf3iEuk72wlsvAr
	 Jyse2037sY6bgmo8XUtFVGXYhT1oB8qkrVvzZQT+B5mQSDI9HYtU1/aQLbSH4VjF/Uhs0
	 h5qEfzGQaIazIJQWZFrfSRW79/t3TcFgYtHAxZzMw7bVwaWmeCw3lcSt3u9uscw4ScB4t
	 7ZUw64rJaqwvBrYkvjAnmvGqy4HLgSsuWrB+p8rjbCziE0nSgbprvR9kVzMhAleB5Hl/U
	 uJDcz3w/k+Imilp3Z05h3az27NmiIrq1y4sJhLqzHzXVg2GGI0ezcMwfJElKDZzFYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="RPekdre/";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBE0606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPekdre/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612282; x=1824148282;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=9NMEAGvwfhaErtp/rLp4sA+7esY9LhUmvQE0coqlddI=;
  b=RPekdre/bF59nN5awTVp/b+q780YQ2TzwOZQVN/ax60aH8UpalbiBsuc
   sq8zbwVZ8e3ip8PQXj7C8DYQcWGqeQ9vc6k+Z0XkQ5f1EU5bzPJl+dfsG
   A7FRMnqjBdOpA5ObUETPXhTRexk65OlD8Fszza+gK2XmOd38zXShCUDyt
   ciTEhtczY4y4udL3qglfmjI0lU5LSq/ni58LxOwZrfCPetQjYNi8S4Y0S
   bs030t+CdgRn65f20Mi4By7RUdig4LhZ0HPsYr4ZlvVinmc1bvMS9v3wa
   VBC/4/e39Naqsk818RSwO56RcfxeycfjwMwoaq65I8P682Ag7z7Okgqyo
   Q==;
X-CSE-ConnectionGUID: xFOxSBArQy22JtXk0OXzag==
X-CSE-MsgGUID: 2R0rEVYFQcS5ZHdqESIg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1341775"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1341775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:22 -0700
X-CSE-ConnectionGUID: M6vNVHLWQ/m1V0EvcJRE9A==
X-CSE-MsgGUID: ag8Y36BvTKmxIm+nGmVJFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3248195"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 12:51:21 -0700
Subject: [RFC][PATCH 01/24] kernel/fork: Break out vmap task allocation into helper
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:21 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195121.B9894E1D@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Prepare for kernel shadow stacks. Move the low-level vmalloc call
into its own helper. This will soon have to deal with more things
like appending the shadow stack allocation and setting up the
different permissions for shadow stack pages.

---

 b/kernel/fork.c |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff -puN kernel/fork.c~alloc_thread_stack_node-perms kernel/fork.c
--- a/kernel/fork.c~alloc_thread_stack_node-perms	2026-10-21 12:36:32.589870843 -0700
+++ b/kernel/fork.c	2026-10-21 12:36:32.592870848 -0700
@@ -330,6 +330,13 @@ err:
 	return ret;
 }
 
+static void *__vmalloc_thread_stack_node(int node)
+{
+	return __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
+			      GFP_VMAP_STACK,
+			      node, __builtin_return_address(0));
+}
+
 static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 {
 	struct vm_struct *vm_area;
@@ -356,9 +363,7 @@ static int alloc_thread_stack_node(struc
 		return 0;
 	}
 
-	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
-				     GFP_VMAP_STACK,
-				     node, __builtin_return_address(0));
+	stack = __vmalloc_thread_stack_node(node);
 	if (!stack)
 		return -ENOMEM;
 
_
