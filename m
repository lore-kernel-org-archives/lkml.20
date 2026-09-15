Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFE3B9D9D;
	Tue, 15 Sep 2026 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479177; cv=none; b=rc48/shk3me42ZaE402sx6sfKVXOAVMwvKMjoawYZ14hkDqpJLwF+7bJELN9Q3RGakQccp7r3QCL7ig6Uii2Det4NXIvYNIrAQujYatfAwhuf97syJn/Zgb6L4MRrWv/PLpVopXP5hmOW13wJWiSt8NTgUEO3NvH0xgyS7s2coY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479177; c=relaxed/simple;
	bh=yWBtMuxeK7sbo0tMcx/sExdVrXaZxM0nuHtLXyJlP9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aoY9A8uYIUHjcgfQxgYD/9koW6aXeCyT3iRM8ptR+l7jlEjM3wmFwHHVXz7QlzKL2yiO9Tg9LpDZESOmUnf45IzMFsagHtpaJd1RAZ31NylxRfNqj835grkm0FSY+tf0l/XQM5vjSSGDFVcs8c3F4Dl5UOvCmcfZf0ztmnzuRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDqZ8dTq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDqZ8dTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018821F000FF;
	Tue, 15 Sep 2026 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789479176;
	bh=7CjjBVJ41zEYOrvRvY5GZQku+YykUi3656ahu5D9S0k=;
	h=Date:From:To:Cc:Subject;
	b=aDqZ8dTq6U3pTePDGu9UQfBooL1Uo4Ive2XEVcaXHHg0IPtqcc7/evFTXrCT69JnR
	 96kEf40JScVGam8c/+wXup7HC3g/Krtois0CvIgxyPuWzL7f1qSIj35VzbhI6nso94
	 M/eW8ZdQ7vIL+FuqXEtzR4IDLzfe6LTgmL4ELOI/njkJ1v4AHBHuaaSgu5vx/JCF9L
	 jDQLYbHvX0JKfrGRG0G2TuCXyF0pLNNDEtK1XTgL5DG3tGZT93jNjt6yafticrGbSd
	 QrB7MTd4WKfm47L9kJcdw8d3S73LNWvN6q+nrJM6Hn/Tdi3EudOQEIqGtlSQKI4mZn
	 M+w8ODXtyxmXQ==
Date: Tue, 15 Sep 2026 14:32:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: JonasZhou <jonaszhou-oc@zhaoxin.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the mm
 tree
Message-ID: <aqlJBMANnd0-yQIs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HRvDUwmlzWmCmHhb"
Content-Disposition: inline


--HRvDUwmlzWmCmHhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/vmalloc.c

between commits:

  f71e94f83c2a2 ("mm/vmalloc: ase dedicated unbound workqueues for vmap dra=
in")
  662d2275549a8 ("mm/vmalloc: avoid false sharing with drain_vmap_work")

=66rom the mm tree and commit:

  75b41adb019c4 ("mm/vmalloc: ase dedicated unbound workqueues for vmap dra=
in")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/vmalloc.c
index 859e6d2d57a38,89c327a6ce7d9..0000000000000
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@@ -1090,12 -1090,7 +1090,12 @@@ RB_DECLARE_CALLBACKS_MAX(static, free_v
  static void reclaim_and_purge_vmap_areas(void);
  static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
  static void drain_vmap_area_work(struct work_struct *work);
 -static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
 +/*
 + * Keep the work item, whose pending bit is updated by freeing CPUs,
 + * away from vmap metadata read by allocation and free paths.
 + */
 +static __cacheline_aligned_in_smp
 +DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
  static struct workqueue_struct *drain_vmap_helpers_wq;
  static struct workqueue_struct *drain_vmap_wq;
 =20
@@@ -2452,8 -2447,7 +2452,8 @@@ static bool __purge_vmap_area_lazy(unsi
  static void reclaim_and_purge_vmap_areas(void)
 =20
  {
 -	mutex_lock(&vmap_purge_lock);
 +	if (!mutex_trylock(&vmap_purge_lock))
 +		return;
  	purge_fragmented_blocks_allcpus();
  	__purge_vmap_area_lazy(ULONG_MAX, 0, true);
  	mutex_unlock(&vmap_purge_lock);
@@@ -3138,7 -3132,7 +3138,7 @@@ EXPORT_SYMBOL(vm_map_ram)
 =20
  static struct vm_struct *vmlist __initdata;
 =20
 -static inline unsigned int vm_area_page_order(struct vm_struct *vm)
 +static inline unsigned int vm_area_page_order(const struct vm_struct *vm)
  {
  #ifdef CONFIG_HAVE_ARCH_HUGE_VMALLOC
  	return vm->page_order;
@@@ -3147,7 -3141,7 +3147,7 @@@
  #endif
  }
 =20
 -unsigned int get_vm_area_page_order(struct vm_struct *vm)
 +unsigned int get_vm_area_page_order(const struct vm_struct *vm)
  {
  	return vm_area_page_order(vm);
  }
@@@ -3372,18 -3366,14 +3372,18 @@@ struct vm_struct *remove_vm_area(const=
=20
  }
 =20
  static inline void set_area_direct_map(const struct vm_struct *area,
 -				       int (*set_direct_map)(struct page *page))
 +				       int (*set_direct_map)(struct page *page,
 +							     unsigned int nr))
  {
 -	unsigned long i;
 +	unsigned int nr =3D (1U << vm_area_page_order(area));
 =20
 -	/* HUGE_VMALLOC passes small pages to set_direct_map */
 -	for (i =3D 0; i < area->nr_pages; i++)
 -		if (page_address(area->pages[i]))
 -			set_direct_map(area->pages[i]);
 +	for (unsigned long i =3D 0; i < area->nr_pages; i +=3D nr) {
 +		if (page_address(area->pages[i])) {
 +			int err =3D set_direct_map(area->pages[i], nr);
 +
 +			WARN_ON_ONCE(err);
 +		}
 +	}
  }
 =20
  /*
@@@ -3890,7 -3880,7 +3890,7 @@@ static void *__vmalloc_area_node(struc
  	unsigned long size =3D get_vm_area_size(area);
  	unsigned long array_size;
  	unsigned long nr_small_pages =3D size >> PAGE_SHIFT;
 -	unsigned int page_order;
 +	unsigned int page_order =3D page_shift - PAGE_SHIFT;
  	unsigned int flags;
  	int ret;
 =20
@@@ -3918,6 -3908,9 +3918,6 @@@
  		goto fail;
  	}
 =20
 -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
 -	page_order =3D vm_area_page_order(area);
 -
  	/*
  	 * High-order nofail allocations are really expensive and
  	 * potentially dangerous (pre-mature OOM, disruptive reclaim
@@@ -3972,7 -3965,6 +3972,7 @@@
  		goto fail;
  	}
 =20
 +	set_vm_area_page_order(area, page_order);
  	return area->addr;
 =20
  fail:
@@@ -4035,12 -4027,6 +4035,12 @@@ static gfp_t vmalloc_fix_flags(gfp_t fl
   * %__GFP_SKIP_KASAN can be used to skip unpoisoning of mapped pages
   * (when prot=3D%PAGE_KERNEL).
   *
 + * %VM_ALLOW_HUGE_VMAP allocates huge pages when possible and falls back =
to
 + * base pages if huge page allocation fails.
 + *
 + * %VM_REQUIRE_HUGE_VMAP implies %VM_ALLOW_HUGE_VMAP and fails instead of
 + * silently falling back to base pages.
 + *
   * Can not be called from interrupt nor NMI contexts.
   * Return: the address of the area or %NULL on failure
   */
@@@ -4066,10 -4052,6 +4066,10 @@@ void *__vmalloc_node_range_noprof(unsig
  		return NULL;
  	}
 =20
 +	/* VM_REQUIRE_HUGE_VMAP implies VM_ALLOW_HUGE_VMAP */
 +	if (vm_flags & VM_REQUIRE_HUGE_VMAP)
 +		vm_flags |=3D VM_ALLOW_HUGE_VMAP;
 +
  	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
  		/*
  		 * Try huge pages. Only try for PAGE_KERNEL allocations,
@@@ -4086,9 -4068,6 +4086,9 @@@
  		align =3D max(original_align, 1UL << shift);
  	}
 =20
 +	if ((vm_flags & VM_REQUIRE_HUGE_VMAP) && shift =3D=3D PAGE_SHIFT)
 +		return NULL;
 +
  again:
  	area =3D __get_vm_area_node(size, align, shift, VM_ALLOC |
  				  VM_UNINITIALIZED | vm_flags, start, end, node,
@@@ -4163,7 -4142,7 +4163,7 @@@
  	return area->addr;
 =20
  fail:
 -	if (shift > PAGE_SHIFT) {
 +	if (shift > PAGE_SHIFT && !(vm_flags & VM_REQUIRE_HUGE_VMAP)) {
  		shift =3D PAGE_SHIFT;
  		align =3D original_align;
  		goto again;
@@@ -5548,20 -5527,10 +5548,20 @@@ vmap_node_shrink_scan(struct shrinker *
  {
  	struct vmap_node *vn;
 =20
 -	guard(mutex)(&vmap_purge_lock);
 +	/*
 +	 * This shrinker is invoked from direct reclaim where memory
 +	 * pressure is already high.  Blocking on vmap_purge_lock here
 +	 * can deadlock the system: the lock holder may be blocked in
 +	 * flush_work() waiting for a worker that is stuck in this same
 +	 * reclaim path trying to acquire the same lock.  Use trylock
 +	 * to avoid this; skipping a pool decay cycle is harmless.
 +	 */
 +	if (!mutex_trylock(&vmap_purge_lock))
 +		return SHRINK_STOP;
  	for_each_vmap_node(vn)
  		decay_va_pool_node(vn, true);
 =20
 +	mutex_unlock(&vmap_purge_lock);
  	return SHRINK_STOP;
  }
 =20

--HRvDUwmlzWmCmHhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpSQMACgkQJNaLcl1U
h9Du4gf/YVJS4teLPtDMlOtj5eLI9cgJARnF6NzGJp39Tor5d94esJkhN7FbuxSs
DsOECSkXcuXd4l4IP3I7foQt6jfuKGCbuFnfXDBp9B1s5B3uZFb0UkxIlp/6OJ48
mI8mW6JJmmKfHG6vuZe6U10YhprGxU/HYLfDmhFdgACJHOrbykklAS3qcmbtWkx2
9um2vQkg61M9drs8Jd3cvDAEiH+tUU17JulWe0QmKcjxX//Xv4XLbIvHXnSsBps5
Kh9bGkJ5irdkpEAQBXEhIFbxrPEaQz//3tayaB/XyTZjiNn8999UbzkM3jhtZ9Py
8RHlrfbq0ETf2JS0RcmsL++mZUNvBQ==
=EjCf
-----END PGP SIGNATURE-----

--HRvDUwmlzWmCmHhb--
