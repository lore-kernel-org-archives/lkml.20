Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA43FA5FA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422128; cv=none; b=Pev24OkX2F7h5PNYud83Ny7M7QrwQaSyTFL+IP2OJJQcoTC+pJvKy9ac8fMRiyoaIvm63KEq58l+bsqOhlIPXrP2HK9x4cuNvAjgnKj0SmnNkuBiNOhZhy6YvF7R6cfkFXnn9oIhpzLjS7P1ofTDSYiVRIaMY0UQRWT43qdcWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422128; c=relaxed/simple;
	bh=o0utxRT6lPpIqhqf3RPoer+EjDMkX/LUDuhmVYcVzg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8UyudH4fobdc52BY5mpghxEVLWqq3GgVxaj8K6NPRr91j+MdpYb0e1Sb8bNFn+wcAUfrc/VOuY49o2k1PuWGZEPk/NgnfewGCM4fVLkasiWVp7tE4yZKrej4pPuOP5av6Ua+0t60lMxee/3TujBjiWWpLwBH5x6gMlJpzBzbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R2Gpkbrc; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R2Gpkbrc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o0utxRT6lPpIqhqf3RPoer+EjDMkX/LUDuhmVYcVzg8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788422124; v=1; x=1789026924;
 b=R2GpkbrcRX2pgBnRsWFQXjGmC/MeJp6XKq++/kiDi+mBxGzXAEb5thd8/JR1yoImzSYLKxqq
 kZNN5PmyKbpmDT7sm0giP7WnJFDsoRmFR8q3kV92x5JceWWFlI8ApXu/f6tlmuJqzGjvPQm9IDB
 Lari0hMB0PZzCS8f5dYJehoE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1e804ac248914eb0;
	Thu, 03 Sep 2026 07:55:06 +0000
X-Mizu-Trace-ID: 1e804ac248914eb0
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 15:54:59 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	baohua@kernel.org, youngjun.park@lge.com, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] mm: zswap: return -ENOENT when the swap device is
 gone
Message-ID: <apkn02lBhQl-JusJ@fedora>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-2-hebaoquan@kylinos.cn>
 <CAKEwX=MqTYpZAwBDOOzdkuo7NP0JFRjFdQaedtrjk_HCNmTSXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=MqTYpZAwBDOOzdkuo7NP0JFRjFdQaedtrjk_HCNmTSXA@mail.gmail.com>

On 09/02/26 at 10:53am, Nhat Pham wrote:
> On Thu, Aug 27, 2026 at 5:45 AM Baoquan He <hebaoquan@kylinos.cn> wrote:
> >
> > zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
> > device.  -EEXIST is the shrinker's "page already in swap cache" signal,
> > which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
> > get_swap_device() instead means the device is being swapped off, so the
> > entry is simply stale.
> >
> > Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
> > Independent of xswap; affects all swap devices.
> >
> > Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> 
> I think this should be submitted independently of this patch series!
> It's a small, self-contained fix for an existing issue, no?

Right, this should be sent out as a standalone patch. I will split it
from v2. Thanks for careful checking. 
> 
> Acked-by: Nhat Pham <nphamcs@gmail.com>
