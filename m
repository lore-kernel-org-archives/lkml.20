Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A63290B1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186526; cv=none; b=IvtO1SteYt14hE9K0geWYWnowUjuwqDcNtpysDMOnClQVYt3JxRdJ+j7BarD6O9n4ND3bmtFJC+RnpbtT01ebf8MYsitIALn6iEncMkD2KFRfNdZ32WTD2tcTkmB4Rfrbv7EaZh9E/9NpGAn+YrerVuiAXDnUd3Q3xHoOEI7O68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186526; c=relaxed/simple;
	bh=1WgxqFj0TK3sZC/WcR8KKTUmv23zZmK3A7bpWnG2iVM=;
	h=To:Date:Content-Type:From:Subject:References:Cc:Message-Id:
	 Mime-Version:In-Reply-To; b=l59ceXJWBQWc/sikBewyxOqEufrwkYtosaeP3I3GqYiJzFR1/ULozkhachCP3ZkLdgSQzfKx6gf1Q5/0sE8D6N/QGQI6AOLTBDTPLwx195uEexMwATNuUZAMMWP6audr0E4DvX9mFM97MHAqPCV8XJMn/0AzQ4IniFry2tw6jfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=k/dzuN4B; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="k/dzuN4B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791186512; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=1sOpn9EiTvVXVl/l1lljOqafyddYxvDxWEEPHo5jI9A=;
 b=k/dzuN4BU2J5Tx0AeS1gMvE+oQXNA2ecby4+2XlBAgO7CB+flhJfFy6IWbh78KipDVg/gV
 CmqdZsdb6lac7N2nVrg78/bKS5m/kFk9uWD0X97pc5v7Axj4ciE6rMcdmzVUFJoA7N9IAR
 v2DyaK3tcVIFtOzk+PtxSLysaKoT2A3ZYyBA7ZoJrlalp3b4+WtaGNJUmyM44yCZzCb0Zs
 W0pwYk3gFS+z+tSC1txAzXXWCUqiWa5ilx7UstqU8ciHn7Xpo2Ed/KMFEjj9hpSXUaybY7
 RDDT8WxJXKMxNY7P1PUmxay0WPet87C75r29QSkQZzbdSPUHhnoUIusHiLTu7w==
To: "Nadav Amit" <nadav.amit@gmail.com>
Date: Mon, 5 Oct 2026 15:48:14 +0800
X-Lms-Return-Path: <lba+26ac3564e+e892cd+vger.kernel.org+zhouchuyi@bytedance.com>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: Re: [PATCH v2 0/5] x86/mm: Allow preemption while waiting for kernel TLB flushes
References: <cover.1791179421.git.zhouchuyi@bytedance.com> <3520FAB5-83C3-4116-BF19-87D66048D993@gmail.com>
Content-Transfer-Encoding: 7bit
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<linux-kernel@vger.kernel.org>
Message-Id: <278e53d1-e0ca-4886-a762-ca98d1a21a69@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <3520FAB5-83C3-4116-BF19-87D66048D993@gmail.com>

On 2026-10-05 2:50 p.m., Nadav Amit wrote:
> 
>> On 5 Oct 2026, at 8:57, Chuyi Zhou <zhouchuyi@bytedance.com> wrote:
>>
>> Changes in v2:
>>   - Patch 2: Reuse flush_tlb_all() for kernel ranges promoted to a full
>>     flush and remove kernel_tlb_flush_all() (Sebastian).
>>   - Patch 4: Drop the explicit TLB_FLUSH_ALL check on the end argument.
>>     Callers pass actual address ranges and can use flush_tlb_all() for
>>     unconditional full flushes (Sebastian).
> 
> Chuyi,
> 
> It all looks nice and clean, but I am not sure the end result is that
> great. I think that instead of consolidating different TLB flush paths,
> you break them further apart. Then you try to copy the logic from
> userspace TLB flushed into the kernel code (TLB flush counting and such).
> 
> I think that perhaps a better path would be to further consolidate the
> two instead of separating them. There is functionality that is missing
> from kernel-space TLB flushes, and might be needed in the future.
> 
> For instance, you can see userspace TLB-flushing has a mechanism to
> prevent TLB shootdown storm using TLB generations; and you see it
> supports TLB-flushing stride. Now, the shootdown storm might be less
> of an issue (for now?) but stride support is something you may want
> eventually to support range flush with stride for stuff like [1].
> 

Hi Nadav,

The motivation for the descriptor split was that init_flush_tlb_info()
initializes initiating_cpu with smp_processor_id(). The kernel flush
callbacks do not use that field, but removing the outer preemption
guard would allow the initializer to run in a preemptible context.

We could retain flush_tlb_info and initialize the range fields directly
in the kernel path. On top of the first three patches, the following
change could replace patches 4 and 5:

--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1466,10 +1466,13 @@
  /* Flush an arbitrarily large range of memory with INVLPGB. */
  static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
  {
  	unsigned long addr, nr;

+	/* Keep the INVLPGB operations and TLBSYNC on the same CPU. */
+	guard(preempt)();
+
  	for (addr = info->start; addr < info->end; addr += nr << PAGE_SHIFT) {
  		nr = (info->end - addr) >> PAGE_SHIFT;

  		/*
  		 * INVLPGB has a limit on the size of ranges it can
@@ -1502,17 +1505,16 @@
  		on_each_cpu(do_kernel_range_flush, info, 1);
  }

  void flush_tlb_kernel_range(unsigned long start, unsigned long end)
  {
-	struct flush_tlb_info info;
-
-	guard(preempt)();
-	init_flush_tlb_info(&info, NULL, start, end, PAGE_SHIFT, false,
-			    TLB_GENERATION_INVALID);
-
-	if (info.end == TLB_FLUSH_ALL)
+	struct flush_tlb_info info = {
+		.start = start,
+		.end = end,
+	};
+
+	if (tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
  		flush_tlb_all();
  	else
  		kernel_tlb_flush_range(&info);
  }


The kernel helpers would continue to use flush_tlb_info, and the mm
paths would retain init_flush_tlb_info() and its smp_processor_id()
check. The synchronous on_each_cpu() call keeps the stack descriptor
valid until all callbacks complete.

This keeps the common descriptor and threshold policy, while allowing
preemption during the final IPI completion wait. It does not yet
provide the broader consolidation you suggested, but retains the
existing stride_shift field for future kernel stride support.

Would this smaller change be a better direction for the preemption
work, with further consolidation handled separately?

Thanks.
