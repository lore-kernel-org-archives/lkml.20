Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794753039;
	b=4bzA9kXSS+t6+Kas2au7OPHQ8nlNPx24AqmcGjMNNwphv4J/OuWFfDAXwzavfZWsgbq7
	 rf5Eq78ytaGx0WJy2VvCXuVap71vYybkgLSoNxLl9pu3dDCE+MQZPl4bel2+mfS9CiPXp
	 d4n52B6y2MmLPc2GURp13m9t46oo7prKwDsOe3+1aPzIuFHIh34BEtV3gEZp4TOegSZvV
	 t8zdOxWfWdJ8nZdMEA6s58+IwPHMkP503YAsALeWwJYUQFSFYgHuRKsqC0uvxY2GQ+KbA
	 c/xE2WemHanbZLbDa/H8SzRNU4pMlt0ttr0+x5y7/vM/bxmNbcyVxVM8OR2ruBzQokQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gf5ixW35iJp73VYSRJwntaX5qMLRQm8Tp7N7vAg02kw=;
	b=yir+DlDT/Hi6vh5PXMUki22rwwMIFeb+ld4N9F61gSwBVa9AwvdBo+/ZUoHqglHoJlZw
	 P0Yi+GueAA/Pmc2H6dC2wMTjL2yfj50Es1tmHVUhiOP2C5ABC3VDTESc7C+G5f/RrBt/r
	 xaLJ+xHNKLhFfqRUr8yyPdrxMo7LlQ+dAJTSYxnsb5IUVsRShXiJRE7OzDZhtdtQTgIdB
	 qYMKc1DaoYCnMhQLR/TK5ag2sx1I9dDzP94KSrgNhXXUbJxPJIqOyLXJTfx7iOPsO070D
	 6GWdwAAcBsIdHWVTCtVvz6YzbkZDhqZrGzLdFFE2y7tmdGLesEH4gM/Ap6EqXmBLIJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oly7qmtB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1249606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1249606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oly7qmtB
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c58f18765so1956298d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794753038; cv=none;
        d=google.com; s=arc-20260327;
        b=h6T/H8Wsxr7o899/Eq0WUe9Ss+rMx0JE0Vls+6LfPTSZmG9rARa9bsoS0Jild9l03i
         QC517O1Qxktmn815bD7rhcut0bPi9lSb+B6c654p0HL2ttEcHs78YgAVUXGtYdAw3o7b
         vRfXJwtPP28vJhZWPt57JXQoZez9yGPNYuLy9Ra3VncrTk1oiJ78ysBzwNlPRhualnJf
         omqujon9GXD+kZLLvotKoxXiYAQyYG4Mmdbhu//04ir9gGR2+h9PpNpVloTOhPSvOyUd
         9QRWGdC7+EUep5Dc6BOZIyYa8Ay40oyPSg0Yg5KDc7QVB6ad9vS3rseDb1e6lIxrhdPu
         MgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gf5ixW35iJp73VYSRJwntaX5qMLRQm8Tp7N7vAg02kw=;
        fh=B3r5MYAxgZegCmm4Gq6OInfBmdORlpmFDJWaYK9LtBk=;
        b=kFA1MoH/2x4y94ohYNa1NSQBDhrKOyY3jjJE74E4j4tyqYSlQPCag6XNP0I2+lMkDu
         xLsqSCiptNpXdzm4oTVTcfEGg6Vdrp+HWEr1HTZgBRrc6fNtgo43w6SdH/SpJ86g9Hm1
         UGjZwF6kD0UMp/RCpstpBuBIE0NJr6/1BDARA3QJ2okuFbJ/mICoI9FajZUp4Ikk8KsA
         +g5cpQQjoDfsJyA/Ac538RQYe/70GW76Rs8rEKKJIT2Fi+fdBkBajr7y8eyIiz/g3mhJ
         Gmi/3nrfvLA6YYeoX9Oaj46+fuLeqPLbxWdjtYCb1oe6mgqEfsx5Uvvy+twLFp8njJrk
         OtIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753038; x=1795357838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf5ixW35iJp73VYSRJwntaX5qMLRQm8Tp7N7vAg02kw=;
        b=Oly7qmtB90UPqgZDcVJiKirQy+3q/p0GvQ8s1jCD86TPt3O+P/N3y7kP43yOfrSxqx
         tBXx/vUz7aet1rWiMbrNntFeZWgSfyBiGkB8HGvkpVoM9EOBHjvu/Y/wGQVGhMErXL4Z
         4VtOiiHk1NF/iVkW9xyL0eKYawgKPLxVVi2w8tM+xdqOlPtQQ7dyxl9UPkuO/1l7VYHV
         +uFJatJ/M/vwOfl+2cQrEXEdSsyrhedqYi2JXrsHFwHqXjlsTpXdcDZGv3IaTl2McA1Y
         vEAgra/P4CqLet4bm4xlqdHWqhbdrrHOJxpjA9cwWKeELyjwLf3OhxEbIufEVmXOoIqT
         tx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753038; x=1795357838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf5ixW35iJp73VYSRJwntaX5qMLRQm8Tp7N7vAg02kw=;
        b=tbckRRRwYY5Le849yKnRqiVBd1sEKTiOJUOvUcmWchmEVk9RwpD7YxFw5Aks5mtGo9
         lLVvcAJKIEVotMNy7knJ7PgidPbk/EMmt2vAy0i1vZLCHZv+kPcG1DaFDXaOKaIMJuNp
         TA7SqYZgTp4CNvVhDkxtnqTFVZ3B2Ydf5QBUsy0wvGA4e+aj/uIet/OsaWqZ6vG9EHNi
         XCDpFlhKsiXnVTHsRkuxVX/jtdSTA/jyduO0XTSMaJ0DtMoUp/SsURoQE5IJHffzK4fU
         JYDk1Xj7a8z6ARHydDiPRaZfcBANrr2XdnGMUCYJxwTxutM8CWLXNbVg62dLDNY7bk0u
         5FYw==
X-Forwarded-Encrypted: i=1; AL+hErGEZuSViwGcGKSd4R/Kvxa+pae+gfMvBqdL91jmTN26j4kwyU1daUrnGLpjCnnDsy9W3pajJlCNJ6MQO6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fL55CSvlH6OLv6u017s1GJQBgOcOgmjV+/W5mK+TUf5/1c2ko
	8B1C10+aMmcrPVdmGMAgD6HQ4CZVBgx6oZRyPhN71MaQuu8GMkxBqG6/M9ISzvbOX7XFTTkJFjB
	nzX8RnZOBymxIdR1ftqbFYTUk59DCh2c=
X-Gm-Gg: AYBFou3nE/2pxhBkP/UdsO/EM+I1JhoX6fn54prj8pgBna5lBtQ+blpOZSr5DRzcuL9
	FxVdivB3ds3FRpcSwhnflcIUpBTrBDd8cXWy/UdQo9ct+Pm6yZkndP1vkWldYGVvb1Vi/BJYSza
	hy/V7JtGipimoyqFNP9lz/GwIGA4YPqftkTozzOiwNSTy5JRPrlYJkcUnDOcRiIfwathS6QlJZv
	Ls2FwKw7cKysM+oUXNgBV4MtmCWRywTdBlkvwZ9E5jlbhOu98J67plzIvo+3cNwBhqSOLaA0hbP
	rMFEJFTDjqXh5iX7VyKGfYfu4frSFToBvQf08b5aO6g0TPWvUiof2orewcJwRjqfJXLvjWwMWVw
	5OrmKKBr2ISvI6WSFafbhVpjAMQ6SFpFauQb4w3Mp7McFzr6qrqfsFuFYgR7UxPgcHtL5xnLDAJ
	zDIwq9OQeIJci/Xo1pnOmyZnLK2lZ89sXL6+vilgBL8pcbSzzAHwlWQ9uvcnIatc5d0jxW4MIYb
	f05tK9+Qw==
X-Received: by 2002:a05:690e:4087:b0:67c:2a61:ac2b with SMTP id
 956f58d0204a3-67d895e448amr4573986d50.34.1794753037737; Sun, 15 Nov 2026
 06:30:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013908.21789-1-kartikey406@gmail.com> <20261110004550.GT663069@ziepe.ca>
In-Reply-To: <20261110004550.GT663069@ziepe.ca>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 20:00:25 +0530
X-Gm-Features: AclHuK_sOxDehipD86J_QkU3K8KpVc6AEMCghy-pUvcXaUGF8BCqoYCDgCavHOo
Message-ID: <CADhLXY7HKNvAM9=2J+VOVynDW39_PU=ohUKZkvwsqj=ZxSLbrw@mail.gmail.com>
Subject: Re: [PATCH] RDMA/uverbs: Fix radix tree node leak in uapi_add_elm()
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: leon@kernel.org, hemanth.selam@gmail.com, yishaih@nvidia.com, 
	edwards@nvidia.com, mrgolin@amazon.com, michael.j.ruhl@intel.com, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:15=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 06, 2026 at 07:09:08AM +0530, Deepanshu Kartikey wrote:
> > syzbot reported a memory leak of radix_tree_node objects allocated
> > while registering a siw device:
> >
> >   unreferenced object 0xffff88810d78f488 (size 576):
> >     radix_tree_node_alloc+0x81/0x1a0 lib/radix-tree.c:276
> >     radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
> >     uapi_add_elm+0x61/0x140 drivers/infiniband/core/uverbs_uapi.c:41
> >     uverbs_alloc_api+0x85/0xc50 drivers/infiniband/core/uverbs_uapi.c:6=
59
> >     ib_uverbs_add_one+0x1b1/0x350 drivers/infiniband/core/uverbs_main.c=
:1196
> >     ib_register_device+0x4fe/0x7f0 drivers/infiniband/core/device.c:150=
3
> >     siw_newlink+0x36a/0x3f0 drivers/infiniband/sw/siw/siw_main.c:433
> >
> > radix_tree_insert() can fail with -ENOMEM after __radix_tree_create()
> > has already linked intermediate nodes into the tree, leaving them with
> > no entries. uapi_add_elm() frees the element on failure, but nothing
> > frees these empty nodes: uverbs_destroy_api() only removes populated
> > slots, and radix tree nodes are freed only as a side effect of
> > deleting an entry. The nodes are therefore leaked when the uapi is
> > destroyed.
> >
> > On -ENOMEM, populate the same key with a dummy entry and delete it
> > again so that radix_tree_delete() reclaims the empty node chain.
>
> That seems like an absurd thing to do, can we fix
> uverbs_destroy_api() to free the entire tree rather just populated
> slots somehow?
>
> Jason

Hi Jason,

Agreed. Since radix_tree_root is now an alias for struct xarray,
uverbs_destroy_api() can call xa_destroy() after removing the
populated slots, which frees all remaining nodes. I'll send a v2
with that and drop the dummy insert/delete.

Thanks,
Deepanshu
