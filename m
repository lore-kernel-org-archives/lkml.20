Received: from mta1.migadu.com (out-100.mta1.migadu.com [95.215.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8E30567B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010841; cv=none; b=jGcn7dQmBxLS//FbVu0wlEJIjqNj8CdhLUJEq4JC2UaJPj8gcTLEgy9WPYxVwMfCgzhP6mkxzURXbbEn+ZOsqo/lU5GDNgSfe6/oklG9TPEvLIJ/SGdgJXnRfM7VhglIUK7HG/QOSXmz7UQUh8p3OTz6c5EY4B1RxasfgYvSjuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010841; c=relaxed/simple;
	bh=gHja9HIu/bxkuNrmbSELtJIfILpHnzbnGexXRFGXaTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlhYLGfXFQSbC3MG8Fb2dr+00QA8UOOaJRn18fioTU/HVQU0dIJiYMLirc9+hKJnMDuP5QaNYzeqadBSnAOqcV4RyTs2Qn2i5Foi69QGeNplUyidHi6y0aK+QVkgQTMQLBr3udkMDbNdhugcrAggrF6cfx/3j6uXjMC+ueVlVbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vhhboQXf; arc=none smtp.client-ip=95.215.58.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vhhboQXf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gHja9HIu/bxkuNrmbSELtJIfILpHnzbnGexXRFGXaTI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789010834; v=1; x=1789615634;
 b=vhhboQXf8cOTJLXOIPvmbxdIE8/Lo7ZRrFA7eQCSSZDBigPU1okygdn6OSldQN9BSa2GPwha
 a9VQRuLcUb4di9HRYbjY1MMZU2OpzUq+0fWBBTEfRLLHYjHVf63l8YTUBKC8ZP3eZ17Q7zqDEv0
 INi6jsOGt4KwBhyJNn2KafTc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d91fe77cc28b0de6;
	Thu, 10 Sep 2026 03:27:14 +0000
X-Mizu-Trace-ID: d91fe77cc28b0de6
X-Migadu-Flow: FLOW_OUT
Message-ID: <675259f9-c093-439c-a411-1937b23ddaa2@linux.dev>
Date: Thu, 10 Sep 2026 11:28:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module: fix lost error code from codetag_load_module()
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
 Bradley Morgan <brads@mainlining.org>, stable@vger.kernel.org
References: <20260827030503.49171-1-hao.ge@linux.dev>
 <20260907213815.0-da.gomez@kernel.org>
 <9acf2cd9-b808-42f0-bc86-7ffcaac965a0@linux.dev>
 <20260909234838.3-da.gomez@kernel.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20260909234838.3-da.gomez@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel

Thanks for you comment.

On 2026/9/10 06:00, Daniel Gomez wrote:
> On 2026-09-08T17:50:33+08:00, Hao Ge <hao.ge@linux.dev> wrote:
>> On 2026/9/8 03:42, Daniel Gomez wrote:
> 
>> I skipped it because alloc_tag is the only codetag type and it
>> already cleans up after itself.
>>
>> With a second codetag type the problem Sashiko reported could indeed
>> be triggered.
>>
>> My thinking at the time was to do it in codetag itself, as a separate patch,
>> since it feels odd to unload something whose load just failed.
> 
> Then, why returning an error at all? I don't see why not doing it inside

codetag is a generic framework with a dedicated section in modules.
We keep this error path to account for possible future data stored
in this section, allowing us to perform security and validity
checks for codetag within codetag_load_module.

> codetag itself wouldn't work but it's a "bigger" change. IMO, the error
> is supposed to be handled at load_module() then, the unwinding as the
> rest.
> 
> 

I'm worried about this as well. Invoking codetag_unload_module() here
brings kvfree_rcu_barrier() into the error path and triggers two runs of
->free_section_mem() (used=true from the unload, used=false later from
module_deallocate).

My idea is to let codetag handle its own cleanup while keeping the logic of
our current patch. Maybe we can put this patch on hold temporarily until I
work out a proper solution. How does this sound?

Thanks
Best Regards
Hao
