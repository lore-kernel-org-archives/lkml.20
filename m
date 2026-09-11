Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9C46D0A0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131176; cv=none; b=g+0TvkORHcdRkAzTz0kwsPF2/N0qZZh9GJXdmRjGGqqpeooGGQ4sm6AxLtrMLl48T2kTOG+zKB/S88tBXBVpvM5EF4Rh78lG4f+F5bQNt/bImVpbvu6NI6ct3dRbFduys4CUyT6hbirx1lixJNRmdnR5qpGowMa5PBBViFiUoCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131176; c=relaxed/simple;
	bh=e8CHqOjITYfhNM3REMeUYdIk0klNnJyq5c5Sj3lHIog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmZLH2sjTl7cIPfcTNu1D7EtjRLYBcLi1g0qTb0Z8rIjSViX5R7OqmrA0Myq7J9Y49mTfuC999hqi2PA+rbPWEcnzF2IgH7RFJ7hZt7AaFQzQz+8sIHspt4MMbhLWRFjKHfsJ5N0VO48H4Ny+lB6WnXOC53FBeGKfxNRF7a0gio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUaH+nIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUaH+nIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7471F000FF;
	Fri, 11 Sep 2026 12:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131175;
	bh=hqq4GZUkH2jdAshgaO7CtrxI6Q1SGWpfFlboqDbRmvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUaH+nILEYyaoHpGgf4b3D7HTRRz9tPzgrnsw+TJcX/kxoI+2rvjHfDVUliK9Mkx1
	 R6ywyUKJWn+3AYh+eCXukGBMeNCHdQYZR9V02TVEj3DTXhMa1pxiT0I4LezuwGZS7V
	 lLU2gx7N0TaWKTFBpYEAk8fQ8oX2RqOYCfNPlrjv9YG7pzTynXFL4GNIVOrqemnp7x
	 bywHkxEJqba13xShTPGpzCsbgvzxenjYhD8P82STxESpkVz+UZYLlAIOXF99eETgWx
	 TF7DyktN4XIMl3tn5YHx3N6g0NrLaKjAUPQcuPSxNeaZVzynoJ6AImFfk8svrI1ahb
	 GCMTX/Lhw7hTA==
Date: Fri, 11 Sep 2026 13:52:49 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <aqP5ofIC8rkmtBtK@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
 <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
 <aqFS58mJ4GJNrbZ2@willie-the-truck>
 <19ba4bb9-e2c4-4956-bd8d-b8f50259a422@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19ba4bb9-e2c4-4956-bd8d-b8f50259a422@huawei.com>

On Thu, Sep 10, 2026 at 10:47:58AM +0800, Jinjie Ruan wrote:
> 在 2026/9/9 20:36, Will Deacon 写道:
> > I was about to say "don't do this" but then I realised two things:
> > 
> > 1. update_siblings_masks() can trigger lockdep splats outside of
> >    pr_debug() if RCU isn't up and running, e.g.:
> > 
> >     [    0.524042]  show_stack+0x18/0x24 (C)
> >     [    0.524519]  __dump_stack+0x28/0x38
> >     [    0.524546]  dump_stack_lvl+0x64/0x84
> >     [    0.524562]  dump_stack+0x18/0x24
> >     [    0.524576]  lockdep_rcu_suspicious+0x134/0x1cc
> >     [    0.524591]  __lock_acquire+0xee8/0x2cb0
> >     [    0.524606]  lock_acquire+0x11c/0x2fc
> >     [    0.524621]  _raw_spin_lock_irqsave+0x64/0x84
> >     [    0.524641]  of_find_property+0x2c/0x8c
> >     [    0.524659]  detect_cache_attributes+0x1c0/0x6d0
> >     [    0.524676]  update_siblings_masks+0x38/0x288
> >     [    0.524692]  store_cpu_topology+0x4c/0x58
> >     [    0.524706]  secondary_start_kernel+0xdc/0x1c8
> >     [    0.524722]  __secondary_switched+0x120/0x124
> > 
> > 2. This code is running _after_ cpuhp_ap_sync_alive().
> > 
> > So for the next version, I'll reintroduce the call to
> > rcutree_report_cpu_starting(), but move it immediately after the call to
> > cpuhp_ap_sync_alive(). I think that will solve these issues, without
> 
> pr_crit() and pr_warn() (such as vec_verify_vq_map()) in
> check_local_cpu_capabilities() can also trigger lockdep splats as below.
> 
> But I think this is not common on the failure path, so it seems to have
> little impact..

I agree that we shouldn't bend the code out-of-shape to squash a debug
warning on an error path (ideally, printk would handle this internally),
especially as the original message does seem to get printed in the end.

> [    0.158619] smp: Bringing up secondary CPUs ...
> [    0.173958] CPU1: missing HWCAP.
> [    0.174071]
> [    0.174088] =============================
> [    0.174099] WARNING: suspicious RCU usage
> [    0.174197] 7.3.0-rc2-00020-gef0bd63bdd97-dirty #504 Tainted: G        W
> [    0.174217] -----------------------------
> [    0.174226] kernel/locking/lockdep.c:3845 RCU-list traversed in
> non-reader section!!

However, if this is caused by vec_verify_vq_map(), then how are you getting
that to run on the early boot path? check_local_cpu_capabilities() only
calls verify_local_cpu_capabilities() if system_capabilities_finalized().

Or is the backtrace for something else?

Will
