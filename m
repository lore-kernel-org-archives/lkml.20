Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0233218A6DB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886641; cv=none; b=fjab9QXQHYkvSlAYRfM2x21Y2ps8y6zBv/vrOzIX6oh1qYe3QogfHQRiwpvbA3OT5MY1xJtHa3nWFy5DySjjpi7p/vf+ztCLwa2Q3G0AH0lwmRw9Vsnw/+niloOLhSU/4zJEUxfjptWkxzH3Q3XCBPBgq0/NQadAa7LJEWYtk9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886641; c=relaxed/simple;
	bh=hfXKRYN40nrVu7Eoi6miivu7UIIRPwt+ewg3z4W9IEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7OteDA/CTHp3lx5rnvhWcm/DwnnebOcW7UnoAzWlqb1545t0FOlK3JhaDAm8Z2GY9GwcGgTyfs2+BlPADtQqb9nrD9Df8BEjlZoIIww4SABc/F5XdiKNhPbE6qLruP/sty8962yxFLb3Nmdw2KOOgx70jC1TcOaYPrCYTMwI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XGQfXx2w; arc=none smtp.client-ip=95.215.58.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XGQfXx2w"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hfXKRYN40nrVu7Eoi6miivu7UIIRPwt+ewg3z4W9IEc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787886636; v=1; x=1788491436;
 b=XGQfXx2w6iMYceE7NILGEYf9XUYW0HLS8aFsJ2qwMwXNplrTlNtDIId+yLQPWJbirT+e94nY
 tuVtUwgCKBO8WCYJzmX4tHPXVDflYGVsEAJahyCj8l+M4MFQ9A0LZMTl7RsNcyMn3VUTFh5maDQ
 Snwp4QS3BiJ3VNJ2Xr2ykzJk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ac20235960621f5;
	Fri, 28 Aug 2026 03:10:36 +0000
X-Mizu-Trace-ID: 4ac20235960621f5
X-Migadu-Flow: FLOW_OUT
Message-ID: <afa606df-3d5b-47c2-9972-f3e0c2e13c12@linux.dev>
Date: Fri, 28 Aug 2026 11:11:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] alloc_tag: fix a leak and a deadlock around
 shutdown_mem_profiling()
To: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260817062726.106511-1-hao.ge@linux.dev>
 <20260826203914.347c42aa00081ee9e0eb858a@linux-foundation.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20260826203914.347c42aa00081ee9e0eb858a@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew

On 2026/8/27 11:39, Andrew Morton wrote:
> On Mon, 17 Aug 2026 14:27:24 +0800 Hao Ge <hao.ge@linux.dev> wrote:
> 
>> Two fixes for issues reported by sashiko:
>>
>>   1. percpu counter leak on modules loaded after profiling is disabled.
>>   2. AB-BA deadlock between module load and /proc/allocinfo readers.
>>
> 
> Thanks.  AI review asked two questions.  One pertinent to your
> alterations and one pertinent to Suren ;)
> 
> 	https://sashiko.dev/#/patchset/20260817062726.106511-1-hao.ge@linux.dev
> 
> I'll queue the patchset for 7.3-rc1, with a note-to-self.

Thanks for the heads up on the sashiko review questions.

The question on patch 1 (codetag_load_module() error handling)
has two parts.

The lost error code issue is already fixed; I sent the patch and
you queued it. (Thanks).

For the rollback part:

I've also seen Sashiko flag this same issue on another of my patches.
At the moment this case can't actually happen, alloc_tag is our only
registered codetag type, and codetag_module_init() cleans up its cmod
from the idr on every failure path, so nothing gets left behind.

That said, if we ever add a second codetag type down the line, the problem
Sashiko spotted will become real. I will follow up later to refine this
logic and make it more robust.

The question on patch 2 (async /proc/allocinfo removal racing with
alloc_tag_init() failure):

When I first read it, I think the window is unreachable. It requires
alloc_tag_init() to fail after proc_create() succeeded, and a process
to open and read /proc/allocinfo in the gap between schedule_work()
and the work running on system_wq.

But CONFIG_MEM_ALLOC_PROFILING is a bool, so when enabled alloc_tag is
always built in and it cannot be a loadable module. Its module_init(alloc_tag_init)
runs inside do_initcalls(), before /init is exec'd. Failures inside
alloc_tag_init() are already very unlikely to happen. When the failure
happens, no normal userspace exists yet.

That said, I realised the fix would actually be quite simple, we could just
move proc_create() to the end of alloc_tag_init().
I am not entirely sure whether we should do this though.

Suren, what is your opinion?

Thanks
Best Regards
Hao

