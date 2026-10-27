Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105489;
	b=tE4f/2wAr9hmTKPEIH7S2noI6OtWlYs6NJ9NVuwSsUIygQ4nB8eX7rfVUJm6oeea3EBS
	 e2Fy7O/PRhYUzqzXa7kPBwVp1oOTon+CGZ86t1MlQlTYfJxtNoRfD9NQIqiUOcB31H3EK
	 CnqB2oJ+PqPzSDvFnGuUTQE+UFaJ3S8tPUfwq6O8xQnUZYeNrxMzOxwZJZ4qVWzGfV8kS
	 VG/cXMo1x0lhTmX2MQxE3rxeqNtoPxqfh/j5NGojBwtPoMLITTToNGGLP1YhWQX9u80kn
	 IrYJKZx7qQYIFPJcOllCP+mGwz6JcK7cwzpwJ2HN3htf1Y6hitHSu4iye3WnfcS3rdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105489;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=Fsp9jXGbGZd6wZFrHnK47Iq/PvcD3/GY40vhsGHd3tg=;
	b=i293LL5zzQy3IiE94WwGvD4G7hKQe+jGKocJoyqCABKowP0I6HQc8fp/K5OzT10rbryr
	 Ch9VLajgmTwoiLUReN8gtGrnmHXf4UyrhHt1CpM+Ic3KMKi31U40j9XElR0mwdjRVupjl
	 uqQqKMHURxAtLWI98ZYH7/fNA5YWcgrGNvFHAObyBn5h2xZ8NIxecdzS0+kwGxXfAh7E1
	 NTHQO/IRwJjCNmmHumNk52LqfIk7Icb+16Zv41G0W44AF24v5tSr8NMtCI3H3N3CR6DiI
	 VoEMIihW5LDXk81PeJk381SH4IgJrNzUENC7fVKdodXFhexQUEY6wf6E06fMznd7NNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UMuVTMyj;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9DE2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UMuVTMyj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fsp9jXGbGZd6wZFrHnK47Iq/PvcD3/GY40vhsGHd3tg=; b=UMuVTMyjWSsX6K0ZWg4iKT31r2
	RXcKV6C8HVi6G98NBuCgrFsccy/9JPPzhYmOPSqiDmbXVRewfLl/3iQm/rNVQZ5WkTqcdhFoniMsu
	6IN+ho5FeNAdZvNydOc/Bo5UaFboatME6x6KiuB58AEmu1lXvBI6y1AVn9sQngTrSU2W1jCW1Y90J
	hFuEy/H8l/MZpH8fQWoTalSnrupz2qt6IAEiJua5XwNUawPDmEQDyJRSmmxkv8WHrI/F6lMEWtL6s
	YAvZ0EC1DXgqJYvcMzPBO+ctRqH7voLB5MjdEseaSJtNkOKN9zin5uxUNsgstYb9cljgMQrzMTwqd
	7xtpAFeA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLge9-001TEv-2v;
	Tue, 27 Oct 2026 12:51:22 +0000
Date: Tue, 27 Oct 2026 05:51:17 -0700
From: Breno Leitao <leitao@debian.org>
To: Slawomir Stepien <sst@poczta.fm>
Cc: a.hindborg@kernel.org, k.opasiak@samsung.com, nab@linux-iscsi.org, 
	linux-kernel@vger.kernel.org, syzbot+b3410eb576b568216ae5@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/2] configfs: give the root inode its own lockdep class
Message-ID: <auCeMlxBJ0DyaF6S@gmail.com>
References: <20261022134443.1122318-1-sst@poczta.fm>
 <20261022134443.1122318-2-sst@poczta.fm>
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
In-Reply-To: <20261022134443.1122318-2-sst@poczta.fm>
X-Debian-User: leitao

On Thu, Oct 22, 2026 at 03:44:43PM +0200, Slawomir Stepien wrote:
> configfs_depend_item_unlocked() is meant to be called from configfs
> callbacks, where VFS already holds directory inode locks and configfs
> holds the subsystem's su_mutex. When the target item lives in another
> subsystem, it additionally locks the configfs root inode so that the
> target subsystem cannot be unregistered underneath it.
> 
> The root inode shares the &sb->s_type->i_mutex_key lockdep class with
> every user-created configfs directory, so lockdep cannot tell it apart
> from the directory inode locks taken by mkdir, rmdir and symlink. Any
> lock held by the depend caller therefore looks like it nests both
> inside and outside "the" configfs inode lock. f_tcm's usbg_make_tpg(),
> which depends on a gadget function item from the target subsystem's
> mkdir callback, triggers this in two ways:
> 
>   target su_mutex -> root inode (depend), while
>   rmdir under target/: directory inode -> target su_mutex
> 
>   tpg_instances_lock -> root inode (depend), while
>   mkdir functions/tcm.N: directory inode -> gadget su_mutex ->
>     func_lock -> tpg_instances_lock (tcm_alloc_inst())
> 
> Neither is a real deadlock, because no holder of the root inode lock
> waits for su_mutex, tpg_instances_lock or a directory inode lock held
> by a depend caller:
> 
>  - configfs_depend_item() and configfs_depend_item_unlocked() only look
>    up the subsystem and scan the tree under configfs_dirent_lock, a
>    spinlock.
>  - Lookup and readdir in the configfs root only take
>    configfs_dirent_lock. mkdir and symlink in the root fail with
>    -EPERM before any other lock is taken, and configfs_rmdir() of a
>    subsystem directory never gets as far as taking su_mutex.
>  - configfs_register_subsystem() only locks the inodes of the new
>    subsystem directory it is creating, which nobody else can hold yet.
>  - configfs_unregister_subsystem() does wait for the subsystem
>    directory's inode lock, but it only runs from the subsystem module's
>    exit path. Every mkdir and rmdir in that subsystem holds a reference
>    on the module, so none of them can be in progress at that point.
> 
> Put the root inode's i_rwsem into its own lock class so that lockdep
> stops aliasing it with ordinary directory inodes. Splitting a class
> cannot create new lockdep cycles, and real dependencies on the root
> inode are still tracked under the new class. This is an annotation
> only: without CONFIG_LOCKDEP the key is empty and lockdep_set_class()
> compiles away.
> 
> Fixes: d79d75b5c518 ("fs: configfs: Add unlocked version of configfs_depend_item()")
> Reported-by: syzbot+b3410eb576b568216ae5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b3410eb576b568216ae5
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>

Reviewed-by: Breno Leitao <leitao@debian.org>
