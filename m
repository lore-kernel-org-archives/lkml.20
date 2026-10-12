Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445A48C40F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808195; cv=pass; b=kyuE7Ru9T8lpxDnIXym9x3m5h6BAg4s8T8/cXgCLUhnloQFGUeXsFqO1DE7jcl3QMpSytj4CrgzQEF9RgHhBMcv7iGn5sT4if8+b6nCxBLiQvgRxs9AZeWm0TPSBUGgk6cQeVvkoUcmnlfTyWne3PDsVEuTs/0ebqCv8Dfrzvtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808195; c=relaxed/simple;
	bh=aQzmNXGcSuNt0+K5ClfmF3eNMN4LgrYdBCU5stJ1AOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lojEGpVRYmnmvDC2VuaBShc+vzVwo3iy8eL4o628znGp1YpWPeO20EG3wHwUAE+aKFPK2XUXSAS1GwuzJYW1RyWkHvoVykB/hjKe3dIlz0O2biVhGZqiqrFpZTrKoBgEnkFecvPHlRDvG2a54NS3hVovgdLoV9eMTnuJhVh2mBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNgFZl2r; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNgFZl2r"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53394bffe0fso78593601cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791808192; cv=none;
        d=google.com; s=arc-20260327;
        b=bgpVC787Kpdi04lErFZyiXC+JDssB8IV1zXDmCmke4ju3JimBeY5Lgp+/GNYCByBRL
         pezqQ6fmJY5s5iX4iOXKXxTZvPneypFSE17e5AlJeapK7CNQwO/juWHBJ7g15PJF61YD
         nsqO1lTQPSEacM5BXWK7Gw1Do/oPJ5S4YiUNnHjK2f7Nz0126d1JfZVMveXJQCUgOx9i
         4ji65xrYmSlCXy0a37q99CI9lgAM8JwPAYgSfmLoJbWkWTeTkgya/vv3C7+MB9ZrtWZR
         XElnRiHOONQhyw8jrlP3GdqIjjNaX+X0jVoyfeRh5kDkVxnLNc6PeeQrFvHO/6lCgzUs
         M2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIWHaUCymsWkNNoIa2i603tTFbvYNzqXmd5C/K5ZBAc=;
        fh=8dOCQ6amUeownGkayejB87q52nEfW4tS23icLHkXzug=;
        b=e10F3997Dh9GUVQIUsYxcos4lEFm3wEmEVF8UDx9vhKycmQKiUTRK0a0D8aTWSRym0
         qBjUYoLo/qraTqjpb3GuEzz4sRg1TbnvEjiuXCU95uGwPnu/fh7QzhiSKnqQX1/DaTg2
         rf3TcoIzOKhe08WkkBqbS2h5D97Hx/8pPrXPnaGydlDIyPMPLJOP161gQyC5jU7hBld8
         tLDdYpXFzJPO3ilpOBtyLZbMmNG0tCzVHZTU5EK88pWzrR77wp+GknwgMsvBxvxnplcz
         Mh33ZL58mVJGwawkMccSm60muetvSsX3DHjqMtdtdw8Me52XKcu7eEv9CDMyRv4PfhJy
         SOJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791808192; x=1792412992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIWHaUCymsWkNNoIa2i603tTFbvYNzqXmd5C/K5ZBAc=;
        b=bNgFZl2rvVOD7o+57JRalBQkhhKWsdI7ANbrFsD6lTF+FQms9t0oOsvcXir/5/o9WD
         tC0UOrwGpXk8Wmk1YvDzKPKRkwkkZZ5VPH1V9oEywI1rPfq2U1wNlsLGa33U/KY9orfH
         7a7K1OMVa06+HqqMl4L6knQEWHD+fes7GAo8tkbEywDVvUrNOsSl4/MFp0qwgHTTw0Z+
         KzWwn3WI4pGtmnUohKT6ZLWtrMfDpXlUOH1nZ+Z5lpTShOvQWFpBzS0g6LeJHQmdiLLC
         6fTNhf+ZOuzfysIun1qfBgg80P+ImFSluLNdVTuyVECF4usVs4NuBSLrvaOJTMRWad4w
         LBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808192; x=1792412992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIWHaUCymsWkNNoIa2i603tTFbvYNzqXmd5C/K5ZBAc=;
        b=uDndGTBwasDsrD5Fgs8yWQUWlTKLobaPU186XPRBbDH7Yh8ZbMByWiXOvZBBnMvnQv
         3QdZA3HepgTtfnhrH4hBkhxlCrOQx3zwzXZILjbYCzX3F/teTT3n/axf8ImuefDHEGjp
         AkXSNV1PSvH42Et7ddmicUvnZUNTVGtDqRoETPfA50e3l+As6atfkozUiOBuGpQdjsGj
         0AoV4PaNvCT29KkPeyWEccGKvTpDwIREPUDe3NzDywdE6wohQBVpIlQ541N2bCTOU0mP
         x6ElAwKAZBruNoxvOi01+j6LjQUQPZNSPwEYE/p+RtBnU41Go6KL57uqdtSF7VPo/1p2
         4VZw==
X-Forwarded-Encrypted: i=1; AKwUvBxFZ5llV5KdLqnDkuvxGepe+YyPpg205JOXXrxkYJiO1NzDbQ1+tB/67BWTHQChw8/UDmwhCzoLNryCos0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIQelNEscIVKljewUG1DH5QQ8tYf5feFjQe5xVqRVsvOrkXqFb
	mBCdXCysZ7KtHbZ6SKdCEgMpyC4USFTOThP3E3urqq86P3C253+YvhjMiXjkIp8PCzrF+ydgcZF
	gJEjMLnrJXy9gKhxCuOexmDM8YIeubI8Hb43kDmO0lg==
X-Gm-Gg: AYBFou0Yob4yVLD3p6fd+DKwFINgNjqoKVpXi3YqOz2B7f/tJZh7zr+ddCysG+1RhKA
	+U/Ek5SgSAGOP3jrOTy7nWFJfgbMnaQ6l2cn8Wb/fGCFhnNsx8PLXH86Lp4Mx5L5G+4bP3GZItE
	V38mxNHbjAHUorbFf0kB1LlK0e/g3JRvJfy1g+aCUP8MhlxGi4kmcgiloIKEeOpMSdcAp2kWUFo
	PDFOAenymOVZ2u5uafhn4qNYg04pfHIV6vIx15J33rVsx4CmXe8td/z51n6NhBhLzTMhmdrb9L7
	MdOo4abWISehKFTLftLns0FMOkzZllrKTS4oKBeg1LotOsCTYXL8CsIjjIICmRPjIKEIyO1Nhxn
	gK7tG75NrhxbjoIPRGICaUpF6KFfISmbHsRLifi/ta3oc0xDtqM6ASsZ77DuE0IX/oMpJLi/+5n
	ABcYQI/2Ie1KPYx5u71vC2AM9qUEZj9KQJ3JWdjisWiH3b1VPkjJrDJtb5ka88bN9jRMUTpfZhN
	cLHg3DIVNOXqoQupGmPRY8qwzFIk5ZCpXYfAFCN
X-Received: by 2002:a05:622a:1813:b0:535:271c:8e99 with SMTP id
 d75a77b69052e-535a60739cemr140833231cf.6.1791808192160; Mon, 12 Oct 2026
 05:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011051906.60397-1-jain.sm@gmail.com> <20261011051906.60397-3-jain.sm@gmail.com>
 <20261012122112.GA31242@lst.de>
In-Reply-To: <20261012122112.GA31242@lst.de>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 12 Oct 2026 17:59:40 +0530
X-Gm-Features: AclHuK_PEl7KjQBeQ9EW7hUgBDCPywXTmc6ppL-X9j-cIvzZh0Thn-Gl3haHU4I
Message-ID: <CA+FWx=n=66eHOgMFb=unfgqFrhw3prW0EOf1bYHfLATV2-o1_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] block: fix the length of a smaller last zone in blkdev_get_zone_info()
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Hannes Reinecke <hare@suse.de>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "Martin K. Petersen" <mkp@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026, Christoph Hellwig wrote:
> Can you add this to blktests as a reproducer?

Will do. I'll send a blktests test under tests/zbd/ that sets up a zoned
null_blk device with a smaller last zone and checks that BLKREPORTZONEV2
without BLK_ZONE_REP_CACHED matches BLKREPORTZONE, and that the cached
report's last-zone length does not extend past the device. I'll post it
to the blktests project separately and reference this series.

Thanks,
Shashank

On Mon, Oct 12, 2026 at 5:51=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Sun, Oct 11, 2026 at 10:49:06AM +0530, Shashank Mohan Jain wrote:
> > blkdev_get_zone_info() sets the length of every zone to the zone size
> > of the device. The last zone of a zoned block device may be smaller
> > than the others: blk_revalidate_zone_cb() accepts that and remembers
> > the capacity of that zone in disk->last_zone_capacity. For such a zone
> > the length reported from the cached information is too large, and
> > start + len is beyond the end of the device. A conventional last zone
> > is also given the capacity of a full zone.
> >
> > Example with a zoned null_blk device of 10 MiB (20480 sectors) with
> > 4 MiB zones, last zone:
> >
> >   BLKREPORTZONE:       start 16384 len 4096 capacity 4096
> >   BLKREPORTZONEV2 with
> >   BLK_ZONE_REP_CACHED: start 16384 len 8192 capacity 4096
>
> Can you add this to blktests as a reproducer?
>
> The patch looks good:
>
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
