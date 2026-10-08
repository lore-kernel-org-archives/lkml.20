Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F74F3C37A3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448192; cv=none; b=XW3tCXz0du4gMCtwT9A90t30qwVZo4tQTdgt3kBshVFZKgqchT+njNYNkGipF4tK3HpuOtdmMbx5c6G7lDp50jNJatyE5eAg3urRPDcZZJ9JpZq6h1Kgf8wK1PmboMBDVGHZURnpQawLLfsUtWNQtj95B4Fz0/MDO5emOA6DF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448192; c=relaxed/simple;
	bh=FR9DwjnJ5Bvmxwtpan7bSrJqZu7yVkYct7nXW04MKj4=;
	h=Mime-Version:Message-Id:References:Content-Type:Cc:From:Subject:
	 To:In-Reply-To:Date; b=sIz5GjjBtMfpA3hVIz6pq3i77hRtn82ePD7GWNvWgu7RCM33Qhc1DSljXUnw40YKinyPBl8NKV7PdMREMAtAQq0Nk54Afn7i1/Z1yqsugQ36CrIENV5Xr9hZwBSX3AU0qNBdCFH209eDK/RURqOfRlCb5KpZLdJlGw/bH28/WEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=M4LyNSY7; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="M4LyNSY7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791448184; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=NI7BhV4fd+dzD2A4MxmdVNqiPpwRT1wKoFnDmffyU/Q=;
 b=M4LyNSY7b9l+P6lvMnzYgKiCW4b/Gq3a+LyOg8dx9bGgbvsAF6eOqgUa/yPbf1juEnHeMO
 VmYgVEhFb4NvdRmW4+u2s5zew2LvnjsRXSe80xWT8zg9+KT8U/cAOHNB2BYLYQTmgsOKjY
 ehsR2zJcZYB++xHtC/JIOO7rG9y/atN7fwTCDiTO2FU3f+VnSj78folynEM478NxogvxHP
 RfkWwSQ1BXRls+hZokTHdxPftyvyAhj6dPD08HnzA0v7j0kOKxoMjkMyp8MoksMUKKQY7q
 DLaCwc4IUS+iQcX1+RGCh4ZLOXap0nIwMPikBz8ua2j74I236tFFxgwQUf6qTQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ac75476+2ef3cf+vger.kernel.org+qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Message-Id: <20261008082927.1277840-1-qirui.001@bytedance.com>
References: <20260928052807.GBarn656Cjchv-qbhE@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Cc: "Rui Qi" <qirui.001@bytedance.com>, 
	"Yazen Ghannam" <Yazen.Ghannam@amd.com>, 
	"Tony Luck" <tony.luck@intel.com>, "Kees Cook" <kees@kernel.org>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, <muralidhara.mk@amd.com>, 
	<naveenkrishna.chatradhi@amd.com>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH v3] RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails
To: "Borislav Petkov" <bp@alien8.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260928052807.GBarn656Cjchv-qbhE@fat_crate.local>
Date: Thu,  8 Oct 2026 16:29:27 +0800
X-Original-From: Rui Qi <qirui.001@bytedance.com>

On Sun, Sep 27, 2026 at 10:28:07PM -0700, Borislav Petkov wrote:
> This sounds like this is something you can trigger. If so, how exactly?

I found this through code review, not a runtime reproduction, and on
closer look I can't trigger it on upstream:

  - The erst_disable/-ENODEV path is unreachable through fmpm.
    fru_mem_poison_init() checks erst_disable and returns -ENODEV
    before get_saved_records() is ever called, so begin() never
    runs with erst_disable set from this caller.

  - The -EINTR path needs contention on erst_record_id_cache.lock
    while fmpm's begin() runs. But begin() holds that lock only
    across the refcount increment, and end() across the decrement
    plus an in-memory cache compaction -- a microsecond-scale
    window. Another ERST user (pstore, erst-dbg, apei_read_mce)
    would have to be inside its own begin()/end() at the exact
    instant fmpm loads, and a signal would have to hit the modprobe
    task during that same window. I don't see a realistic way in.

> Do not explain the patch in your commit message.

Agreed, that paragraph goes.

> Because if you can trigger it with the upstream kernel, then this needs to go
> to stable.

Since I can't trigger it, I won't add Cc: stable. It's still a real
bug -- begin()/end() are a refcount pair, and the old path decrements
without a matching increment -- so I'd still like to fix it, but I'll
leave that call to you.

Reworded message below; it describes the bug and lets the diff show
the fix:

  RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails

  get_saved_records() calls erst_get_record_id_end() even when
  erst_get_record_id_begin() has failed. But begin() only
  increments erst_record_id_cache.refcount on success -- on failure
  (e.g. -EINTR from mutex_lock_interruptible()) it leaves the
  refcount untouched -- so the unconditional end() decrements it
  below zero and trips BUG_ON(refcount < 0).

  Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
  Signed-off-by: Rui Qi <qirui.001@bytedance.com>

If the wording's fine I'll send v4 as a new thread; say the word if
you'd rather drop it.
