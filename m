Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC243CE4B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390484; cv=pass; b=u8fmMEnXwdlzuiR+L4TM4ESSI3lCWnnF8ZzQk7MKe0m8FIxEDaFaVwykyxeS1S5VgkNEyfMm1UNWnhLL0D4sJsA5hVe54VInjLPwlC/6vFhm7lM3+sZ/BiTKQeUhVd6HV+F33yJpwdvdl58cEYnTD5/SYrUNf/ldvItDrxRU/wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390484; c=relaxed/simple;
	bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2ZzyPQR44WhaRkOLmjBhuhY+7YEirqbQEa+QNpPMCHSDBi2K32nS5MBRzAfIOKoBZGhVVf88Pkkh4QB5IZv3s8dNni5rAbSw/OlUNypb9LoYHcw0Khmm1KwwF0VIj10z7lVE2C4/u9YFNDA6Odg0jcEBdz6uRlAVLKCkuECEmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=0oF+7oTZ; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="0oF+7oTZ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1332952a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788390481; cv=none;
        d=google.com; s=arc-20260327;
        b=d64fyfVg060uQNUrsApGHZlIH7BlSSV9p5ZFzQuhDkmNhFzXPpfFqGomJkrmWsFlP2
         LHfHChQnZqrt87PfC7wqtrg5WzWwj7p5XqOXkWgBUmeDkN4PYzsnkdB90CQQWU2k/FD5
         ZknyXm0C/jp2Pp/qtSXxS0/L2WFClItODd2PdSTsFuhaBi9ck7gtHA8mX9auHbaP+ARY
         JBLnYjUoM2N2gr5qCWOMP6G9v8Un3qXz/YUMmvWqDUQ8nrxpOy8FYrVmJ51yFl57ISCA
         ItO3k+7g9/8tOJps+c20gMf31ID35D/mRne2dQHu5CHo6e6faYkyGBQr6qd1lHdkF+6D
         kEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
        fh=IOOksLvADbIad1eNK2euFg95+gto0GnBPns+D8tnBQw=;
        b=PlEZNLsxiVdWbI0Mkm3eI47NCCzx2duRkuQf8nGt7br491Stji/ALR1HD/CSzLrcPt
         GJzkgtvlOvLlPu2ltKDKgCV3n9vMg/ho7gHSr8FQ9DQ79an+Zyu76N0yg89qRoEPMNed
         jEhh5YYr89JwYozs7vwVGcJ62nSdaK8AB/l/f6kHd189cssROpFyCqSpABfEVxnOLq8m
         it8VV3WM9c5adJEe7ypF8/iyHMTFvXP7Khv8rs5G90fMhHx8/58o/Ku/pW6A0rFZ6KnB
         cmjr8Cq/lNYyDB35INxoHIBcNchYFmpAO+iNXFh/0uICKkj/gN+MdgrmEApFdoTMWPsR
         ltow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1788390481; x=1788995281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
        b=0oF+7oTZDJCEPJ5GxamqvPfAO34tnu0De+/xzfpPjLEoV6fqiQbBTDJNvklTqryXWz
         4DUGZ9M4It8Hr5MLPcfGlofAv1uxt7W12KHGRuAl8wX8Pa5EEEaUv4VA9tavpBLeRXu7
         LtueW1Jc617D0bc/p3XpQ0vSzEMTdXTT47OXuFFCgW1NoE4ATKQ0a2SaDx+stXMr9eJ1
         gjtJXnpxVMUpjpuMxNteucXPuTjm37hzv62t/R54a+27K3WUxPFCURihaU+/mdUDKhAa
         mRSr2owqyc4kWFBIBsgITWUTY+xT50RAWK2lezkbAUho6oUKm+nul+xFZGTQVQ4yA/C5
         375g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390481; x=1788995281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
        b=aVyALMxC5EBIP6BaLnzsZqbX/vTQMBegZ2J0Cl3goteDbv/3ELVdsHjG0RukdR6BT/
         j8iev3QmwKQYWn/+2WPOnu8YlxPDOllprWWgx/eMWFxZSoLwIOgczC156pSKaITtRz2m
         ZhmexY6ONvYlU//64zzLfA/Ah2aBxQBBb35sc0IROHiQOdibdXRvzeN/nqqk/gLYvQR3
         CcHrgQSIWV/RBG32bZ/vaOVHuMaMnJYBkgRiVflSbKZ6/1dah9Glkfd3lYlaF1v9aKZi
         pU1HXvk5rntxg/XHdn86Od/vFsehtM5TuErXfzMfm0zcNlI6zanE/jvD+H2ynhFymDri
         FH+g==
X-Forwarded-Encrypted: i=1; AKwUvBxgZykMqQGUkw5G0stdRP/Kp8D//IjY2tWng9BVsplSZq+HaK8Avq3HDREndwb/y+/vNJW41lDgGe1cMqU=@vger.kernel.org
X-Gm-Message-State: AFuF++lPDdKfJ4CmtzAEzAdO0WSbqEjtIaoG0qYNEAovLxoK/13ckWzh
	EM69jT8c8CXmvy7rzVotRt8eXPTrznfeZNykpghLXY+7o1Yxl0ZrEa50wJLFPewntEeJMt4WHVq
	IMqcSOEXGnovSRUcx7Xr1nsrJBRxMcRUNhF2Ht2OJbp0=
X-Gm-Gg: AYBFou2JHGE22zAuboIpytpYzNekxcSbjloVC8tJkgB2cELbbj0tuim3iEbOQH0sPvx
	G7DSLE4O+YLdjkFHiygQ0jo+nGzixU8Cj2yJ2g6KcrvyvlqrvtKNXKjL6bNpWEDu8xDKlSgmnex
	eYLrDDhgokTkLRP39unVuVGuPVhT6l1yVtiYlRDPfu+qKzM+5SBT+ezH0ZlDj7eDab7Cr1gUYRQ
	cgeBSSxKoNqbG5fkfhHKarsyG5N7w1E9UuXd1xc4J3e7iX5x8GF39CyPsTucaxRTdOZqABOPWws
	OwCP/dJE/NUGFANcKpRnxjdcWGTfUSVOt+JIvRS1lkGvGBNnYT81/OMClhDfag6UQafOipp+4A=
	=
X-Received: by 2002:a17:90b:3e8d:b0:396:4cbf:45bc with SMTP id
 98e67ed59e1d1-39aee153e79mr9644253a91.16.1788390481503; Wed, 02 Sep 2026
 16:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170849.4052816-1-dhu@x6u.co> <20260901170849.4052816-3-dhu@x6u.co>
 <20260902120832.GB2890729@ziepe.ca>
In-Reply-To: <20260902120832.GB2890729@ziepe.ca>
From: David Hu <dhu@x6u.co>
Date: Wed, 2 Sep 2026 19:07:50 -0400
X-Gm-Features: AcwNN1UWr9DtGOkBk_AsJGV3X93dnPOEvrR1ndZaMb2yMaRxX36LCdah5a513PI
Message-ID: <CABdL-LTO5OKkDmtXpiLury=2n6q6Rcm42_qqz8U+JkEu=v886Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] dma-buf: Split sgl by largest page-aligned chunk
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, alex@shazbot.org, 
	ankita@nvidia.com, chriscli@google.com, david.laight.linux@gmail.com, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, jmoroni@google.com, 
	kevin.tian@intel.com, kpberry@google.com, leon@kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, nicolinc@nvidia.com, praan@google.com, 
	sashiko-bot@kernel.org, stable@vger.kernel.org, viursachi@google.com, 
	xuehaohu@google.com, Leon Romanovsky <leonro@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:08=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Tue, Sep 01, 2026 at 05:08:49PM +0000, David Hu wrote:
> > From: David Hu <xuehaohu@google.com>
> >
> > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > first entry, resulting in non-page-aligned DMA addresses for all
> > subsequent entries.
>
> This patch is fine, but pedenatically a scatterlist's entry limit
> should be bounded to dma_get_max_seg_size(), though I don't think it
> helps this. Operating scatterlists at the size limits has proven
> problematic in a number of places already...
>
> > In addition, a non-page-aligned sgl length will trigger an edge case
> > in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
> > buffers, we will have a `va` with lowest bit set to 1. That will lead
> > to `ib_umem_find_best_pgsz()` always return 0, and break the promise
> > to find best page size for the mapping on the NIC side.
>
> That's an IB side bug, the newer logic that joins adjacent SGLs should
> have avoided it?

Hi Jason,

Thank you for the review. I think you are right on both counts.
Regarding the IB side, the new SGL joining logic in
`ib_umem_find_best_pgsz()` indeed avoids the issue. `mask |=3D va` is
skipped for artifically split, contiguous SGLs. Since Christian has
already pulled v8 into drm-misc-next, I won't spin a v9 to avoid
creating unnecessary noise on the list. If you prefer a followup,
please let me know.

Thanks again for catching the IB logic detail!

Regards,
David
