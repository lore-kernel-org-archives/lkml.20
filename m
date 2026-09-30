Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C374E324C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778601; cv=pass; b=R+5zV1BIrKhifYS3OqNJiK+SmEvdXJUAr56aB7dP4vz5LIUvRMwHKYWenSUoN4zSGd76wskWtPUuxI2k4KEBFazqbqnBp1xiNxGDU6ysxh27UJuDHaIF7w268QuIRZM54enIcqyjhDRdcqJV/3RqtnpK4gI92T0lo8fk6pP3ji0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778601; c=relaxed/simple;
	bh=Jv5f1g0f3qDS45IX1yQFN/XI/1HiyQaIpDbEOG1DCc4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BZ7pB0yEn1o3csk06maEgffjQNtlCZUR2I4+EgN1OY02PlO9326+64vwXi6oArdTruZDG+RmHNsgj6H/eB94kMEuKl7KSy6CUj7hbLxUkC3wxn0+aJylKvLL+4XemV3iBtTksualQmOYJnCqFobIfm0cdr3NLPO4oJyurxjpfPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=JtZc2h8E; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="JtZc2h8E"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so50023291cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790778585; cv=none;
        d=google.com; s=arc-20260327;
        b=YZEF4Vr2mVXOCBSkTsOhx2md4MywNk/c1DCdXqumLRrDE/g29Lndg8f/cJkIaM0yyn
         TIjZQAcDrm5MM35shXzg4IT/BVPyG9n4l1ZivR45ODxpdmWZqkE2fKL31a7VW9CEy/Sn
         FIYXyZhbm1y9fbJLY2iZib/mpNJVMuWHPtl9AXBS7ndFCw1EWhCYNc83if4vkeNttmJT
         9EvvMLEQqT8QxA+0q1AAkz5rrbrgk9eZJPQqsw+tAMqzbJRrHUAChahHOQ/KcRp8HCV8
         /iyuGB+3a90N3EsIoUHcB7rLLnn1lzgdojPtzmWIS1tIL7p4R0x1Liuu7opgOinLdAJk
         Zgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bFcOr5qvsPCgBjFZ4BWLUmj9QlCgJD693TK70ZfQ/Lc=;
        fh=qY5L/48xDo+d5huG3YY0GjX6Qga3DN64V2PQTM6K1m0=;
        b=fTXscBViT2M6OwP9vQzQUXXrigtmL4PCcD/Lb94VF5uJaAxPf6m/27lby3R+9xpQDp
         WkfIjp1UEGK7mr7sS1Tywm2xcWFYCkLbb9ZKkdJy6ct7uOfyr+6BeQu1K+O9hpniIWp0
         fIN4CGGni3lIyOoZpIF+HSJtWUKmrA8bhOgFDepModdqZZw/lOCLS1j8lazD96ARwRVD
         Blsia4uL/rdtBYze2+1TE58uasRlAGN64qwXH5ax75C63GpfrMRJd/U7J/X8BugXSgFe
         3xE+NsrJcICtNxSqoiPDKclUjmINXBLfRy43P9x/RqcbTKxNUfo5uD+VSsndr+ubjW/4
         WGYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790778585; x=1791383385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFcOr5qvsPCgBjFZ4BWLUmj9QlCgJD693TK70ZfQ/Lc=;
        b=JtZc2h8EQA45wKHjoOhwjBPvJIRF+85Eyx9ImkE9V6edmGXF91BJBPX14iSyK7TyK8
         2ryN6nFxlROoSwmDZaf24EgMB1C/0riOHVLkH94bm6pdZs+12tQLuIFoulWdm8xK4NUi
         RWKl2Lup3bX3feQudkK0NEhGsFCbRAeccwFUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778585; x=1791383385;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bFcOr5qvsPCgBjFZ4BWLUmj9QlCgJD693TK70ZfQ/Lc=;
        b=nXupy3uY7bI3+hGRo5DqFdAFZ5XzwydYHO1GTsYZfjd7JHoDDPqdqriHAQmZ6rJH8x
         R4Bp7EUKMM+U1psjPTiXpXMhJaHvDG4uUmu8u754y7JoHgNxLd0a3uGE03IN6QErLVtG
         lj/4G4+4ZbgxJFi30XjdJnZKs0v8smL8ph87GGo7SzbgsWzTj9umU7+n8PHd3J6ZJg3i
         xHU1E8TpiEMcKe1q32tXxm5d1CzKAYit7n54tg//9hBbPEHXpYXHHVFdjb4EXpYkxt+N
         KWpvBwLbDxdMrnqbZ2Zq/p+H9YHP5gaVZcGg+WNG1gBnAWcFvGxM1G98B4POVXKeQVmt
         +jng==
X-Forwarded-Encrypted: i=1; AKwUvBzFkP+rOTMXPh85J3qiJd9HQBa1Y+7nt7Baa2NrTgk04khyEZf5x7uJVfNG+eS6/XHazr8xKBGawa3kWLY=@vger.kernel.org
X-Gm-Message-State: AFuF++nKDLDmI0yK+B0dFHS+83orGEI3j1k8BSIdMeHn/pnEvKUsE3kt
	Uzn2Hn/scdv49MxkELim1yLdMco/Oy7TCyu/07ZIhALRcbE5RB9wDiu+mkftBtkoJvBBpngJkBH
	VSKR+nlqOed3s35s/gWqo2ja+ELAlvyDclYVUcbb37A==
X-Gm-Gg: AYBFou3pjfI0qOXFsYe4idOFyIIy9bzrUeZ4mY/gAPdEKqrZf+BQXlPZDrqqwR9XkD/
	ghj3ZvFIrR0lvTqCsRvQrV8V8i7glb8e9kyvp+hBv3OVAiEoslChwFBW24QWge5HCAdoL7PBIgn
	zX3BmKXNXMQyPHNGGwwMDuzvJwtEn3eo40MOB+y7WitLw0YfW/p7ZFbCOloaxmPxFrnqcicg6KI
	FLiYqGW619chP79hyNILbnYUhngVHzBDw3IV8xt9f0mfkNj0i7TwPhPvkNK/i+Egt9f8aek49S2
	1sINbPVhDsfFHxKHTNgv0+zR4h17APLnDXQzMuvGmzH5EUgsLO2IKe0GUuK0GQ+Zlc0L9QN6LaL
	6y9rn3cJqK4xyGg==
X-Received: by 2002:a05:622a:258f:b0:533:32f3:1db0 with SMTP id
 d75a77b69052e-533742bb8cbmr29673951cf.6.1790778584578; Wed, 30 Sep 2026
 07:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 30 Sep 2026 16:29:33 +0200
X-Gm-Features: AclHuK8GeOe_W3mvOTyMrVDZeZ25RiRcVppHiB0syijS4_yNrxLEymVmpXQKS-M
Message-ID: <CAJfpeguyOXGQO4Q8rSAc8GxExTJU0G2o19fxRnh_93GvAoNcRg@mail.gmail.com>
Subject: fs_put_dax() vs. dax_holder_notify_failure() race
To: Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Cc: fuse-devel <fuse-devel@lists.linux.dev>, Carlos Maiolino <cem@kernel.org>, 
	linux-xfs <linux-xfs@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	John Groves <John@groves.net>
Content-Type: text/plain; charset="UTF-8"

During ->notify_failure() callback will dereference holder.  It may be
NULL at this point, resulting in an Oops, or it may be non-NULL but be
freed during that call, resulting in UAF.

This affects xfs at this point, but the fuse extent map patchset[1]
also adds dax failure handling and is affected by this issue.

I think this should be fixed in drivers/dax/super.c, since this will
be a problem in each user.

Thanks,
Miklos

[1] Report from sashiko (select Patch 8):

https://sashiko.dev/#/patchset/20260922061019.3320196-1-mszeredi%40redhat.com

Or here it is inline:

commit 1580a2f8ad3f103a20b6280aa39a01f8b0be2d3f
Author: Miklos Szeredi <mszeredi@redhat.com>

fuse: add support for opening dax device as backing

Add FUSE_BACKING_IS_DEV flag that allows opening a character device
(dax device) as a backing, in addition to regular files. Mark the
inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set.

> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 58dbdd17c1ef4..aa558a0c2e647 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
[ ... ]
> @@ -22,9 +23,16 @@ static void fuse_backing_free(struct fuse_backing *fb)
>  {
>   pr_debug("%s: fb=0x%p\n", __func__, fb);
>
> - if (fb->file)
> - fput(fb->file);
> - put_cred(fb->cred);
> + switch (fb->type) {
> + case FUSE_BACKING_PATH:
> + path_put(&fb->path);
> + put_cred(fb->cred);
> + break;
> +
> + case FUSE_BACKING_DAXDEV:
> + fs_put_dax(fb->dax_dev, fb);
> + break;
> + }
>   kfree_rcu(fb, rcu);

Does this code introduce a use-after-free race with a concurrent hardware
memory failure?

When a DAX-backed FUSE backing file is closed, fuse_backing_free() drops the
DAX device holder by calling fs_put_dax() and frees the backing object using
normal RCU via kfree_rcu().

Concurrently, a hardware memory failure can trigger dax_holder_notify_failure(),
which protects its read-side critical section with SRCU using dax_read_lock().

If dax_holder_notify_failure() reads dax_dev->holder_ops and checks for NULL,
and is preempted here, fs_put_dax() can run to completion. This would set
dax_dev->holder_ops and dax_dev->holder_data to NULL, and eventually free fb
after a normal RCU grace period.

Because kfree_rcu() does not wait for SRCU readers, the memory could be freed
while dax_holder_notify_failure() is still running.

[ ... ]
> @@ -79,23 +87,88 @@ static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc, u64 id,
>   return fb;
>  }
>
> +static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 offset, u64 len, int mf_flags)
> +{
> + struct fuse_backing *fb = dax_holder(daxdev);
> +
> + fb->dax_error = true;

Can this code cause a NULL pointer dereference or use-after-free when racing
with fuse_backing_free()?

When dax_holder_notify_failure() resumes after the race described in
fuse_backing_free(), it blindly calls ops->notify_failure() which is this
function.

Because fs_put_dax() may have already cleared dax_dev->holder_data,
dax_holder() might return NULL causing a NULL pointer dereference here.
Depending on the timing, it could also return a stale pointer to the freed
fb object, resulting in a use-after-free.

> +
> + return 0;
> +}
