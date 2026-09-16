Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F93A5443
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527149; cv=none; b=u2QopyOu3CFE/n3WFEOIveZUZ4atSj5MwNQqjxgPEzV4qJ34rJoBEPZUB5eOzLlp5s5sQBHlLiLCYGTNHakcy+3ZowTzUK+K2VBydeVvpJea5JyO2xusEMuQGIryf5WLn/f0aAAJpRApKRFJ+/luH5T79pAvxUCXtKbNvUHPxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527149; c=relaxed/simple;
	bh=YGkbI/aBa2R7Sc4KMCjD1BQTq1E2F3Jsy4Klibs1hmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfQXOzF5mczSPpjv0tKzvgUsxK6N0+Qk6KyzFWRhh/nJ0fiOcdoLF9UGy0hYP8xh/lEk8TA6+hzaB4owZyW5dtsiG4lTnviQlFslHI59yuO6CQWUJjWQSfre9a8w7fM93rwOJCemSDtp4tFCP9AB8wSf7OmIxfqIALbwgu0Opfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kGKGQzfd; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kGKGQzfd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YGkbI/aBa2R7Sc4KMCjD1BQTq1E2F3Jsy4Klibs1hmI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789527144; v=1; x=1790131944;
 b=kGKGQzfdjxnWReDujphVixic95Cscec/qt4aAv0ge83Ycv6pSKHku0bpzM7w7IsiIzaT12b1
 gQ2GoXS+oVBp9KJ3KemfXoFgP/KBK43/ZIQEiL1QtO88C9oudr0ZmEQazxNPBEvlrCdIVQNCP08
 GmEILnsMtNIAnGpHX8FuwBKQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0282261fe3cbfd76;
	Wed, 16 Sep 2026 02:52:14 +0000
X-Mizu-Trace-ID: 0282261fe3cbfd76
X-Migadu-Flow: FLOW_OUT
Date: Wed, 16 Sep 2026 10:52:07 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com,
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH v2 01/12] mm: xswap support for zswap
Message-ID: <aqoEVyxikqQ476IS@fedora>
References: <20260913075014.1732524-2-hebaoquan@kylinos.cn>
 <20260915100308.1599989-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100308.1599989-1-kunwu.chan@gmail.com>

On 09/15/26 at 06:03pm, Kunwu Chan wrote:
> On Sun, 13 Sep 2026 15:50:03 +0800 Baoquan He <hebaoquan@kylinos.cn> wrote:
...snip... 
> 
> The SWP_XSWAP flag and nr_real_swapfiles accounting look correct. The writeback guard 
> in page_io.c (both swap_writeout and swap_read_folio paths) properly short-circuits 
> xswap devices, and the zswap writeback gating on nr_real_swapfiles ensures writeback 
> only fires when a real swap device is active. 
> 
> No issues found.
> 
> Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks for careful reviewing. I will post v3 soon. I found this v2 is
based on a older commit of mm-unstable, and I forgot adding base-id, so
Sashiko reviewing is failed to launch. I have rebased this onto the
latest mm-new, hope Sashiko can be satisfied.

