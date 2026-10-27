Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105460;
	b=o3V0xW0NR7gY9SJCaqU8mB+FRx/vs8MGtkOh4NZQ++iSHMPrifHeRWGKHsiDWcF41C7U
	 jvkSTa+rjDJZFBOdiiuH+VLL7Vwj1ZCzFALPAgPF128+yNqlHVtMIiN5D20UiLRGiqQ3T
	 3SgS23qsJ+9nYHsNM6K0F8hd3x4WT64/aWoTFSzp8UI+x0rS1l1k1oj4UxdgP6Exk1UKQ
	 XY/YwsNw2SwzJD5kijEB074wNPgWNrO+FSZ9BXvL7MmjPHjR3oy3fXx48aFM8sXhCGFQh
	 PmuHr3w3yYAMMfdZjwCsMFrd5c6GHfQM6+Akeqgqnkk+QHu7TU7zOyohHWyCkitcJDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105460;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=OjTqggf3+OH91kmiWVP4qR6QPPLLzRINAaYNEazv1Eg=;
	b=3/wQ+bDewgXmSica/GqfBgLd+vQKy/kzeA0y3V5UDKrtl37b+jldz3AdsUc1q3H2qM4s
	 xUjsUiEk6f4igEElWWTF43hCbMP8UMDRjIyHFnV5cQHGS0y5Pu7o7xQHC/AUX7Zy3yD9w
	 UAH8j7NAVbQWN+9dfnizU+4dQCXUxTsfl/ltu+LVo3Ie1eiVHVr+sl3iTNvwzVKMoGcas
	 wFOvLOSttgGPZtM+rqC9dk2OLUZQ2Y4snIO+E61simgTO8K35iq4bMDVtXOnckcT+dL5K
	 P5GDSUKhuEdP6nDl15V4cXlL93KFL5Q2wWONKyfF9qEnRg5lVmcOMHFKGgFTnBP9Wkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=lsNVgbKe;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3299606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3299606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=lsNVgbKe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OjTqggf3+OH91kmiWVP4qR6QPPLLzRINAaYNEazv1Eg=; b=lsNVgbKeeuSMKdCcheLBARb9kB
	NJena6MgosNRqK2Bmm2tP75IFtmlC25MSr58zINnJwxJblZILMQf3qbf9tdo9NzYzDKC8wMSlwxRk
	JEVoUYMRTKkbgc1bHsu/SfEl+fxfdacovnBhF/bgyVtm3AT01xYeqoVSkdscI3HbmVHFWHezQVSoV
	Z/hB37cMfOhzahUfaBfizSEpaPLPjt0/JE+1Cjo6FC4fO1luiy/7dMiD6nqecP2JWp+fbdIus6uPX
	1I8LzWnwLva1EGg6hBuy/qk5NiitkJXOmDxGHWlnL+MJnq8JgU7B4fPV8el6UPgPnixGMGdqkSAnW
	+ZEe7zrw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLgdh-001TEd-2u;
	Tue, 27 Oct 2026 12:50:54 +0000
Date: Tue, 27 Oct 2026 05:50:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Slawomir Stepien <sst@poczta.fm>
Cc: a.hindborg@kernel.org, k.opasiak@samsung.com, nab@linux-iscsi.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] configfs: handle unlinked target in
 configfs_depend_item_unlocked()
Message-ID: <auCeHAUGWXiSWMFW@gmail.com>
References: <20261022134443.1122318-1-sst@poczta.fm>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022134443.1122318-1-sst@poczta.fm>
X-Debian-User: leitao

On Thu, Oct 22, 2026 at 03:44:42PM +0200, Slawomir Stepien wrote:
> configfs_depend_item_unlocked() starts by reading target->ci_group to
> find the target's subsystem and the configfs root, and dereferences it
> without checking for NULL. ci_group is only valid while the item is
> linked into the tree: it is set by link_group() during mkdir and
> cleared by unlink_group() during rmdir, both under the subsystem's
> su_mutex, which callers of the unlocked variant do not hold.
> 
> A caller can therefore pass an item that is allocated but not linked.
> f_tcm does this from usbg_make_tpg(): a TCM function instance becomes
> visible to the target subsystem in tcm_alloc_inst()/tcm_set_name(),
> before configfs_mkdir() links it, and stays visible after
> configfs_rmdir() unlinks it until the final reference is dropped.
> Creating a TPG in either window makes configfs_is_root(&parent->cg_item)
> return false for a NULL parent, and the following parent->cg_subsys
> dereference crashes.
> 
> An unlinked item is just a target that is not in the tree, which
> configfs_depend_prep() already reports as -ENOENT. It skips items
> marked CREATING or DROPPING, and rmdir marks an item DROPPING before
> unlinking it. Read ci_group once with READ_ONCE() and return -ENOENT
> if it is NULL.
> 
> If the target is unlinked right after the read, the snapshot still
> points at the parent group: unlinking drops the child's reference on
> it but does not free it. The depend then fails in the tree scan, since
> the target is already marked DROPPING. The parent can only go away if
> it is itself removed in that window, which is the same theoretical
> race the root walk below already has for every caller of this
> function.
> 
> Fixes: d79d75b5c518 ("fs: configfs: Add unlocked version of configfs_depend_item()")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>

Reviewed-by: Breno Leitao <leitao@debian.org>
