Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612284;
	b=X1umzRyIueaFRy1DO7vWM1/x8Aq2kHUecgwCa56afeG8PAuVd7Xl+T3DeX73PYD2p1tW
	 Rlx8N7z7swd7JoZE7hsgSF1a/uBctJFBRr0zwgYodbMAU5/Gu6YS/UV9+zXfcuVLNACpF
	 Rx1yPVslV4VoPbwv1ACBk9pr+DQzXowwygCVqAkNWw1YK2qXxAQq045XzrD9mEUpHCcu5
	 GJfWDKS6wqrJPs69hR/C40nW3hWqbjYgHdQb/11qnUTqkWUUgSFVvZiaaM96URWa4vhOF
	 AtVFanOM6ADUU9/77ZeBjrEbvkM7OoGvu8BObW0zjv5Zhr0jlQMi7I2vI1hDcXDbeHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612284;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=yFtnMB5RDN6IJVZN4f6S6Gl+0h86imTPfhj+pxneW8U=;
	b=il22rCmHCbRBcSrL2nvK67GCQOYoNrfVlzNJif29WnW1kKjWNUgOn2D2VhA34nfWFoxy
	 U05OK74gNLABY7u32nKJKLkbeyFQVTz/rji3NqRSYPeIMAPJ9nKcl/wghzPcfRJ6EGWgI
	 sMcF+hySgnsiblbxLhjh6+HoFrhxjqnlMOAH/W0JFkL06Z6cETFQp4vuavpZL1rUQ3L8P
	 PYHyYskGJgjOQgyqbfAi8/GAKSBKrWS0IMnI3lMZ7cN+5dtleqE0rF4bgE3MKmZi9chmQ
	 oEAU+7T4ka+Ul4rK0bQ2j5CyvgIH31HEbtd6y2YJeVxjiCs4xjmDSynIyOzsPaaROjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlFsGHSj;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA343606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA343606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlFsGHSj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612284; x=1824148284;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=dTxYcnn/Osro5eM3LiFseTnBsVeJ33ICVpfO/evrT4U=;
  b=jlFsGHSjOe/kgad4wJvOjUxi5aHQ+yKRnotQBQHIbfQj1yoVhv9YG2et
   j6zXTvaCyVZ7/5jq33/Akzlaakykxn6FvKiu+6OzCjQ4xWqBv1NUpVWWv
   yyVPZXO8w9F6ycPcapVvNaFhkhoB69DdxYlHtULZYJJe8JX4EE7biRaRh
   F7zsW2jBtCUXRH1c5Bv8mbJTVG/bD3fSRtOWrKP7J36Kec49NcejWojAz
   Z8V2ZjOUYXkp+0q19+mJHNYg7HRPMgxXUBOfQ5itBeo7l+MeUKV9hNGDL
   KC3hzPyuY9F19f6nQ7EbFq3j3gZd/d3h5FriSwkBTru8eiCEtLciPp3jS
   Q==;
X-CSE-ConnectionGUID: ApJdNO+bQxGx3lK9vP8T1A==
X-CSE-MsgGUID: m2uy4HpzQDi6z/iakZ1pog==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1341782"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1341782"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:23 -0700
X-CSE-ConnectionGUID: WbLRcXQHTVKLJWdbadf53A==
X-CSE-MsgGUID: 4aOq9Ke0To6yMljvL+ZkcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3248199"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 12:51:23 -0700
Subject: [RFC][PATCH 02/24] kernel/fork: Use sizeof() union instead of TASK_SIZE
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:23 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195123.337677D7@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


thread_union is sized with TASK_SIZE. Instead of needing the definition
and this code to match, just use the thread_union size. This way, if the
thread union size changes, this code will still be correct.

Foreshadowing: shadow stack support will change the size of thread_union.

---

 b/kernel/fork.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN kernel/fork.c~alloc_thread_stack_node-2 kernel/fork.c
--- a/kernel/fork.c~alloc_thread_stack_node-2	2026-10-21 12:36:33.082871786 -0700
+++ b/kernel/fork.c	2026-10-21 12:36:33.085871792 -0700
@@ -315,7 +315,7 @@ static int memcg_charge_kernel_stack(str
 	int ret;
 	int nr_charged = 0;
 
-	BUG_ON(vm_area->nr_pages != THREAD_SIZE / PAGE_SIZE);
+	BUG_ON(vm_area->nr_pages != sizeof(union thread_union) / PAGE_SIZE);
 
 	for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
 		ret = memcg_kmem_charge_page(vm_area->pages[i], GFP_KERNEL, 0);
@@ -332,7 +332,7 @@ err:
 
 static void *__vmalloc_thread_stack_node(int node)
 {
-	return __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
+	return __vmalloc_node(sizeof(union thread_union), THREAD_ALIGN,
 			      GFP_VMAP_STACK,
 			      node, __builtin_return_address(0));
 }
_
