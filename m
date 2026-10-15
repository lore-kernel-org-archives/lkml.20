Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EE3D75C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031035; cv=none; b=iak3NkT/PZBJatFlSSQDZFGCyLoOG18he9Yv6NZtaXgwGjMULZFHgrfgYEUMVJcPl9VMlVA69Ax0Ul+PyapYbeepa5aFEb7rMJ7ZAlMmDPZiJSnkRrB+ldRDVwpTMBo4H/wgl1QmtrbpQjbKhFXUX0Vpz3I6zpm9XuFovqXOHuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031035; c=relaxed/simple;
	bh=nUe5p8yDfrxxzbakZWJcPwqsW7cOSu54n5/w3I/l8Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf+PTyLkBkojvAbumiH1zzK623UZz+3iysR5Kcjqduj4eGTsrYrLBQ1k2YzoCnN3k02vUb4w4YONyesFP8EY7XTE0XYmWgwOjdOfpSwuL/t2jIzB6rwAryRWgQGE8BIBs4QS5TicVdu1y4Qu2ry+VVzEh83UE08a1BaZhIQxcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gKUofZl6; arc=none smtp.client-ip=91.218.175.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gKUofZl6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nUe5p8yDfrxxzbakZWJcPwqsW7cOSu54n5/w3I/l8Gs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792031030; v=1; x=1792635830;
 b=gKUofZl6BXqgTs89E8MKTTxBF6OAgm3Wb0i3YsQW9+YhKg8+KsAmctt0OJnPuwUhlmoz1nD9
 wV2qioOTSH+xP6BXr94EMmDwL3e1/kym7tSFGMy+fARt8p/3mpXWDWn2gCL50EIEL/koVscQqzt
 mWlJ27jbw8SV/mxkl4hSvFvY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce96ad1491dcf66a;
	Thu, 15 Oct 2026 02:23:50 +0000
X-Mizu-Trace-ID: ce96ad1491dcf66a
X-Migadu-Flow: FLOW_OUT
Message-ID: <f6ad4302-3540-458b-aa94-1b306ba23d65@linux.dev>
Date: Thu, 15 Oct 2026 10:23:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] tools/mm: show_page_info.py enhancements and fixes
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
 <20261014170519.d07e3a5f791e16a5cb9f51b2@linux-foundation.org>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <20261014170519.d07e3a5f791e16a5cb9f51b2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/15 08:05, Andrew Morton 写道:
> On Wed, 14 Oct 2026 15:04:27 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> 
>>
>> This series improves the show_page_info.py drgn script with bug fixes
>> and new features:
>>
>> Patch 1 fixes memory cgroup information retrieval by updating the
>> obj_cgroup type casting and handling slabobj_ext field name changes
>> for compatibility with newer kernel versions.
>>
>> Patch 2 removes the incorrect Page Index field display, as pages
>> don't have indexes - only folios do.
>>
>> Patch 3 adds VMA flags decoding and VMA name display to provide
>> more detailed information about the virtual memory area containing
>> the page.
>>
>> These changes ensure the script works correctly with current kernel
>> memory management structures and provides more comprehensive page
>> state information.
> 
> Thanks for continuing to maintain this.
> 
> I'm curious.  Does this work mean that you're using this tool in
> real-world situations?
> 
Hi Andrew,

Yes. We've been using this tool to investigate real issues on our
production systems at Kylinsoft.

One concrete case: we hit list_del corruption warnings in
isolate_lru_pages() during memory reclaim (shrink_inactive_list /
shrink_active_list path). The system stayed running, but the LRU
list was clearly corrupted for some pages. We needed to inspect the
affected pages' state.

I also use it during kernel development as a general-purpose page
state inspector. There's an rmap analysis feature I haven't posted
yet — it currently only works on our internal kernel version. I also
plan to add a mode that accepts a page address directly rather than
requiring a PID + virtual address, which would be useful for analyzing
pages found in dmesg crash traces.

> 
> Sashiko had quite a lot to say.
> 
> 	https://sashiko.dev/#/patchset/20261014-show_page_info-v1-0-7a68aee0114a@linux.dev
I'll address Sashiko's comments in a v2.

-- 
Thanks,
Ye Liu

