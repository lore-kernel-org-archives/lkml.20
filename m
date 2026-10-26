Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021455;
	b=XPKQU/ESuEAgTkX6bA6Xei4Abq2FJu+HjRn7HowPvLkJXeL471bsITndzE18yiQH6QkS
	 1ZPiG4y4l+j2iiGrs9mhmsyal08MoC46ATuy2H0qIT2riiEpU+2Dc244NAbAZBpiBuhhW
	 QfFl9Zltyk8IqHpT1doT2l5gEVkViu06aNVvZymWzw8VOcrejZJnomXv76rlTgAPXPntZ
	 n/3jt2img/0+Sl5Vu47QBKwjDByG9UioNk3dgR0ErDwm4Esw8E55zWbE+XHy8K5Kd/EJB
	 FLJzpMxF40A5CwSOZD2XPAVnPrqizwk2Ib6+rr0gt8EoS5jfh94uZk2rIq1wjYY7QqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021455;
	h=DMARC-Filter:DKIM-Signature:To:Date:Content-Transfer-Encoding:
	 X-Original-From:Message-Id:Mime-Version:Content-Type:In-Reply-To:
	 X-Lms-Return-Path:References:User-Agent:Cc:From:Subject;
	bh=J4UXRSWdp9L+slM0l5w1zWdkgLQIsp44pt/Clrth68c=;
	b=UV0Sfv7ccG4T7k7aycbJHJBKJu+KIamJSHednC0wRwwhm0QxxLJxo8Qzcyx/8rdpaxtB
	 reY5gyDdDCKMoLLqu3JkLWsjjnJYi4b3VFvrRIIBfvDn8WQlZdc0AeM3bA7IL4Sr4Yz1a
	 t2wpKXwBWoUPj6wfhsb8r6VJg5/sS1h9oEJ5UP5n1eKxwCFz30FP8jLZCVa2lie5S09RK
	 ru+R/XD6r1yuff2Pu0jUDTvartvYz4GElh6C0da04z/Ylrq/ZP4+w7AQCet4N+D+28WQt
	 IJWvKCW/MH4OYhuaOzwwfVyIW+zPV/mCZqoInBssSTNzkW5hztWaAuvA/A3TVocahmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=DP6Ih9JU;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=DP6Ih9JU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793021448; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=J4UXRSWdp9L+slM0l5w1zWdkgLQIsp44pt/Clrth68c=;
 b=DP6Ih9JUTFHJoJ6beHoY5BaEe7d958V6WxgXvakOnJLZXpVkQEOcM0/N0cKL8kgrOk1NQw
 cdXwr5CfUFsWgpejmChAasJS28yJSGdTRnAIRuPwr0vOkGJI2pPv5vnX7A+D7s4XKE/yMt
 LN7YPQxWeCtsu+Wzgv7ckda0sM1xuuV3AmxVUyZLbQCQaP1vCFcQm2HtQsLCNZJPxDwGjw
 JAnrx9LXT5xkjzKqaIk5+wTtR3KGbOnmfCaa+RBsQ3giDBE8rciRgjP8JhiWM51rv1ed6j
 ZsmD9MbUg1nJgkR3Xg0miLmNUxT1UN1/Z71kuoXZMxFBvevjpwLmA690gREaOQ==
To: "David Hildenbrand (Arm)" <david@kernel.org>, <catalin.marinas@arm.com>, 
	<will@kernel.org>, "Ryan Roberts" <Ryan.Roberts@arm.com>
Date: Mon, 26 Oct 2026 21:30:08 +0800
Content-Transfer-Encoding: 7bit
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Message-Id: <52e7e1f6-3535-474d-9b46-6bb62f96eefc@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <1c0141e8-3033-4f59-b247-34dee14cbb1f@kernel.org>
X-Lms-Return-Path: <lba+26adf5606+28b41d+vger.kernel.org+zhaogongyi@bytedance.com>
References: <20261013093600.54995-1-zhaogongyi@bytedance.com> <daab2f45-56c2-48ad-a24f-aa4f889e4da2@kernel.org> <e0f60526-bb95-4d39-9a7a-72cdf32ca5b6@bytedance.com> <cc2e3af6-bb56-41b1-9cde-151797c3068d@kernel.org> <3b57c214-6a43-4fc7-a531-fb5eac196465@bytedance.com> <1c0141e8-3033-4f59-b247-34dee14cbb1f@kernel.org>
User-Agent: Mozilla Thunderbird
Cc: <dev.jain@arm.com>, <baolin.wang@linux.alibaba.com>, 
	<lance.yang@linux.dev>, <mark.rutland@arm.com>, 
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <liam@infradead.org>, 
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>, 
	<mhocko@suse.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid PTEs

On 10/25/26 8:34 PM, David Hildenbrand (Arm) wrote:
> 
> Can you paste the code here for easy review if that it the right approach?
> 

Hi David,

Sure. Here is the minimal prototype I tested. It leaves
contpte_set_ptes() unchanged, so present-invalid PTEs can retain
PTE_CONT. The pte_present() check excludes swap entries, where the
same bit position can be part of the swap offset.

diff --git a/arch/arm64/include/asm/pgtable.h 
b/arch/arm64/include/asm/pgtable.h
index 6000905a2..2f89959ec 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -185,6 +185,7 @@ static __always_inline bool pte_present(pte_t pte)
   * Returns true if the pte is valid and has the contiguous bit set.
   */
  #define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
+#define pte_present_cont(pte)	(pte_present(pte) && pte_cont(pte))
  /*
   * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
   * so that we don't erroneously return false for pages that have been
@@ -1704,7 +1705,7 @@ static __always_inline void 
contpte_try_fold(struct mm_struct *mm,
  static __always_inline void contpte_try_unfold(struct mm_struct *mm,
  				unsigned long addr, pte_t *ptep, pte_t pte)
  {
-	if (unlikely(pte_valid_cont(pte)))
+	if (unlikely(pte_present_cont(pte)))
  		__contpte_try_unfold(mm, addr, ptep, pte);
  }

The diff is against 24a19b953e2a. The runtime tests used the same
changes on an arm64 tree whose base pgtable.h and contpte.c blobs
matched. In a QEMU/KVM guest with KASAN enabled, the guard-marker
reproducer passed 100 iterations, and the fork and PMD-split probes
passed five runs each, without warnings or KASAN reports. The
unmodified kernel failed on the first guard-marker iteration in the
earlier A/B test.

This shows that the reported failure can be prevented by a small
change to the unfold check. As Catalin pointed out, this prototype
does not extend pte_batch_hint() to present-invalid entries or address
the other pte_valid_cont() users. I agree with taking v2 as the current
fix and considering the broader grouping changes separately.

Thanks,
Gongyi
