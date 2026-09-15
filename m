Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4B3F926F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440581; cv=none; b=imMBn8ViMk9yBGI+UotbZyrcRndbwgemQXRjwvKE7J6QEBfHfvTeSA5k4HRdSzISMhPif1WNim9MHTX3S906PuDBAQpe495yXZ9WLE3c8DBXCuJOage0h+djlKzijn3HN6SOtaSTUNgl4gmWKD/za6yNLXMb+7YWUJeHkBRT7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440581; c=relaxed/simple;
	bh=TPiaJesIqJ7PplIki0xusz3BjPaCRWubAMyDMo7M0qc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OH22rG/XTitL3sa/UTT8jREOE/7Rc9CNCZ4bxdkTckOa0qz+ngPXz7x2aC1unqDdi2X8JeUOvxOdDQkbDfIlFEFFUYBfbI0Gv9HxK4cMLjDvdOJto4ogUfmhxS26mjhsVlKSMy8twQzFOXKWyCEZez7klLA3yReqKYs9jE+3wvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kDF34Nw8; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kDF34Nw8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TPiaJesIqJ7PplIki0xusz3BjPaCRWubAMyDMo7M0qc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789440578; v=1; x=1790045378;
 b=kDF34Nw8gQf1kDIs7+rmXJ+V3Sh/evMeGoxvhaqFrdIJROatbIoFXvIn1Uj5VMEF70+avUvk
 4PYE90JDZBKmIpTf+rfvxemh9p42qmsIJaSUMuVkB2WVK+uV6t8pn/8DEODso2U2GkPgYcrMfeG
 3InQCZrSKFISU394+esk94Z4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 658701ff1c90a0b0;
	Tue, 15 Sep 2026 02:49:38 +0000
X-Mizu-Trace-ID: 658701ff1c90a0b0
X-Migadu-Flow: FLOW_OUT
Message-ID: <af33dfe1-04ef-4bfd-8c79-0593b24c6bdb@linux.dev>
Date: Tue, 15 Sep 2026 10:50:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] alloc_tag: fix a leak and a deadlock around
 shutdown_mem_profiling()
From: Hao Ge <hao.ge@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260817062726.106511-1-hao.ge@linux.dev>
 <20260826203914.347c42aa00081ee9e0eb858a@linux-foundation.org>
 <afa606df-3d5b-47c2-9972-f3e0c2e13c12@linux.dev>
Content-Language: en-US
In-Reply-To: <afa606df-3d5b-47c2-9972-f3e0c2e13c12@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren and Andrew


Update the status of this issue surfaced by Sashiko.


On 2026/8/28 11:11, Hao Ge wrote:
> Hi Andrew
> 
> On 2026/8/27 11:39, Andrew Morton wrote:
>> On Mon, 17 Aug 2026 14:27:24 +0800 Hao Ge <hao.ge@linux.dev> wrote:
>>
>>> Two fixes for issues reported by sashiko:
>>>
>>>   1. percpu counter leak on modules loaded after profiling is disabled.
>>>   2. AB-BA deadlock between module load and /proc/allocinfo readers.
>>>
>>
>> Thanks.  AI review asked two questions.  One pertinent to your
>> alterations and one pertinent to Suren ;)
>>
>> 	https://sashiko.dev/#/patchset/20260817062726.106511-1-hao.ge@linux.dev
>>
>> I'll queue the patchset for 7.3-rc1, with a note-to-self.
> 
> Thanks for the heads up on the sashiko review questions.
> 
> The question on patch 1 (codetag_load_module() error handling)
> has two parts.
> 
> The lost error code issue is already fixed; I sent the patch and
> you queued it. (Thanks).
> 
> For the rollback part:
> 
> I've also seen Sashiko flag this same issue on another of my patches.
> At the moment this case can't actually happen, alloc_tag is our only
> registered codetag type, and codetag_module_init() cleans up its cmod
> from the idr on every failure path, so nothing gets left behind.
> 
> That said, if we ever add a second codetag type down the line, the problem
> Sashiko spotted will become real. I will follow up later to refine this
> logic and make it more robust.
> 

Daniel also raised this issue
https://lore.kernel.org/all/675259f9-c093-439c-a411-1937b23ddaa2@linux.dev/

I do have the relevant fix ready locally. I plan to hold off on the next batch
until we close out this recent chain of fixes. I'll bother you all again when the
time comes.

> The question on patch 2 (async /proc/allocinfo removal racing with
> alloc_tag_init() failure):
> 
> When I first read it, I think the window is unreachable. It requires
> alloc_tag_init() to fail after proc_create() succeeded, and a process
> to open and read /proc/allocinfo in the gap between schedule_work()
> and the work running on system_wq.
> 
> But CONFIG_MEM_ALLOC_PROFILING is a bool, so when enabled alloc_tag is
> always built in and it cannot be a loadable module. Its module_init(alloc_tag_init)
> runs inside do_initcalls(), before /init is exec'd. Failures inside
> alloc_tag_init() are already very unlikely to happen. When the failure
> happens, no normal userspace exists yet.
> 
> That said, I realised the fix would actually be quite simple, we could just
> move proc_create() to the end of alloc_tag_init().
> I am not entirely sure whether we should do this though.
> 
> Suren, what is your opinion?
>

I've been thinking about this quite a bit lately. Defensive programming
is always welcome — there might be edge cases I haven't considered,
or scenarios that could trigger this down the line.
Furthermore, if alloc_tag initialization fails, the corresponding sysctl
entry serves little purpose.

Besides, I've decided to fold these two patches into this series:
https://lore.kernel.org/all/20260908092412.115953-1-hao.ge@linux.dev/

This is because Sashiko keeps flagging this percpu leak.
https://lore.kernel.org/all/20260908094736.2B1A61F00A3A@smtp.kernel.org/
And patch 1 addresses exactly this issue.

We'll fold these two patches into that series and let Sashiko run another
round of review.

Please kindly help review the folded V10 version.

Thanks
Best Regards
Hao

> Thanks
> Best Regards
> Hao
> 
