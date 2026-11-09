Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201316;
	b=mBZJqnuMiAu00ZqjUiYr2vhZ2uaQupy0Q9diBJmeRuR9ZU/fj7QqhJ2x6gt3Vod6VMmI
	 Lxlr0+boz1An9t1BBYq1aUS7+N+wJSzkIJXseivk18NyKr7CY9es9hZXSzHTfg23ek24M
	 MRJ3Zq34HdCMj2LFBn/V5xQS0Zt2Y8jNBeEGOx4b+dakrRogfpeuuJ+PClKMfM9RFE8NI
	 3+G0F0T9n/RjBcBaT1Bn1VUfvhuS+MxjlFDzhgwM0Och5d49oQeLwU1365bMI23IrY3ep
	 vMAxcgbxd5sP+Y5b5/O6pG3laxLNl3YhWS9A5MDJa/aeyhOwFkcqYi+6QAZmxGC6Z7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b6gvZY+eglqUG4b+h69EzTLNKW18aQ6honSpwwPL6r4=;
	b=Zmoaqfmv+aEtQYBiUu5Bj5oGiO0i05+IN9V01J4LdAtj0s6+jqEG0i2hjao4PE52c+hG
	 fvnKMl0VIAK6r5lDJTQ6sG2l1W6O7XD51y9ysm/nzVbHT/RkE4OMMFYq4iLoCUO+rqEX9
	 XSC0q4T0uYkgUimSj+w6ykmEmf5G7nflBcC5GGAWw4RDTPubNj0F3cUDPtMUqqr2ZPMkJ
	 fMpGcQqtu0+7n6liu9NV0wDz29byFDcNqA+qPEFUyyPzPochzShNNPPq1zmtW0GE3vl5E
	 Gx9pzu8Ym7WE0BJsEVQhY3QmdpSQEgrcYBm3JyysY+lknud3XqXD06VYYTsliENXFUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o1HUf2FQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E541606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E541606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o1HUf2FQ
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679aeeddc6bso449056d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201315; cv=none;
        d=google.com; s=arc-20260327;
        b=JFCjlA8s4CnqHGwgGuYTNpwPIqs8omNeyT69jCAmwqRupetywNr8NEkvE2oj9rvb3H
         KY5oZWf73Lx65dXyjnCW/Ra5/IixgwZxAHdeiTho0uxNRm5rPV43gpGVRYJpeLvSbdTt
         MfGDJjjf0cOCu+BhrsObe1GiC7q4soTeSn2Wd8taYxa5eWZEtd4Aa3KhMdi+pc47aaWJ
         IuAH6jd8fVhup7cnBuBbyMG7ePDKtXY6UP2PWnUecdfOcTycUA8QbvVBF/49+Hb43sNu
         V6VO4SN2Ubfxu1PaH2vJri6Z2NZSGoHjYWM+0Km4iEW4OrpnIeRWImvhw9ujATKUbL6i
         lxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b6gvZY+eglqUG4b+h69EzTLNKW18aQ6honSpwwPL6r4=;
        fh=03GCqyZfiFX6ekKORyuTtbz/2qwIJBx9e+DzLz04ruI=;
        b=JAxYISPEcBzDU4LIsIicXDu/FoafoI/YMgeawy3I0VZFlYor7iGZJpwHmEbfuCdH+i
         Yijug3mkG2te8habslMJ8wOTkti5wbR8BLnGYGjjKycAUqOERMdijBSrS9iIYuOFZgaR
         GhIFGFDRuFSoLF187BMnRfgUSyzmwIR5ZEm52KRYsdeyEc5PjqnE+rqpsmmF7X25oKWf
         eIY6ivxN3lK0B3y8nHT1CGa8HZ+mg8i1fZbUSLWRGtp1dVAjhp5p6QDndEhnvFCFHXeK
         XGzxo9uP2S2gjYtmN5zF4WZTSghasCE8NMPa7yAU++tCZl3wpwc4E3EBYEMoGJAlRJVG
         /N4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201315; x=1794806115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b6gvZY+eglqUG4b+h69EzTLNKW18aQ6honSpwwPL6r4=;
        b=o1HUf2FQ+t1efdLs0RIEswqQ2YKFpAGg2ZaHBnzzEuTd767bZwT75sZeg896/JUExp
         NNYTooNeTisuX3ml7dwcM19aogwjKUWCpEWRd/rrOfXFjDMTszrt/cMeqXxiDepSLmX2
         y/DdGVD0oKcRZfYwOcU5S7Ms4QEYmF6cPIdFXddIZcoOGVX4LMTXo3IZdAmK/07nZzmS
         AoGUKYIxBy/d/miLPgSp7g0r72DBouBkXbQ+TAOSqSKhGfcP5HWYGH2h/4BsIx75jOkW
         g8C/tmEtIqSUGQeeLc/2PpViTOJVLbuaeGHmKIp2BHOrOccXZTqcjhZJHW5ry3Mf12Mi
         DOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201315; x=1794806115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6gvZY+eglqUG4b+h69EzTLNKW18aQ6honSpwwPL6r4=;
        b=1cVd1q1OBu6JmbjMcZJXjAudEtWfSU9BgnFEPR3OIAzEi4yA5+02jD/9wW83R9A10Z
         dod0Uzy5LlGRaTRAA3mmEJfL9pntZjv2GzWBNJkwTHDkKHsWoSw//iEKHO+SDdyilN2L
         odhvNn/FGQmNPSIxgGHulFzuLZAXx9ej/kGZAL+FLtlTf3OGe8jU8Ha57fc/xNIubDmF
         M1w1gWOh+5sHgyPglKVzFl3Es3eSK2MBB8jleQyn5uxQZPUiIcioJovEbHeJ0ZMr74do
         uujD2nNqTGRA7w+bwQ07i2HoyvUO8znw6R3N63rz8b5zm7Gqh8ZMHD9y8msPULpU6pMp
         IMxw==
X-Forwarded-Encrypted: i=1; AL+hErEqUO3urjOa1YTcMGJhHuZ6vw+4+TLQcnop2Jk7ITGbX0gIvw2pVf2Lw0kyboDS/OAK4Nuy/eJFxOzlaJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wr/SjgB18mdZdP6z3hBaw6SD6nXp8V7DX6pUBfF9LdUrqG5Pe
	r+RzYreiQG2JRcCeFUrz5oGe85mY5bwM8xELi2m8waZMpYzIyEZ4v9EvD4DNj3VW5GHNeR43j8Y
	O05TO5cMrVJ5EAUcrYvbzvI4maf5fG/g=
X-Gm-Gg: AYBFou1MmOErk5q0RQfFup4Foof7ovSpOLiLLBnb64XURhZk962GLBGXathVNDUOnE6
	7mzok2dSVIwqxlrhcKYWptKQK6painIsxTFAA5XmOk/c50ob2MlOCJDDOH45psqtyOBr6ELOyCQ
	rXmpcTIBmjGxeY4uYnd9BJCQwC6L0EObIXLny5E0ROnq+TB23ivbK7bdGPqznX/zIaXeq1Gg1Gq
	NEOMmnjm91RJdVlIdjJ//cD69MrFWnvZBA1lG6nUR84leucCU3VWn1VbJojbVsVaZ7xuAERSNWd
	kE91PZo3IkiOfaZFXKeR66dMfARnKjs32Vz0zQT/AHgtYZC3gbJ7SP5FCVyEyjKQTT48t6GCND5
	Odb5ganIL5rrpr7r3ZkT2HnLfSSpJyD3054mQjvNmorZ0EXHdUbiFDXWcPeEAb2I00xaMcGMggD
	t4MwU/PDxH6I4=
X-Received: by 2002:a05:690e:480f:b0:67c:eb7:591b with SMTP id
 956f58d0204a3-67c3dab97f7mr1019752d50.101.1794201315405; Sun, 08 Nov 2026
 21:15:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109041215.11280-1-ekffu200098@gmail.com> <20261109041215.11280-2-ekffu200098@gmail.com>
 <20261108205600.3e737ad18ce85b6ce3049309@linux-foundation.org>
In-Reply-To: <20261108205600.3e737ad18ce85b6ce3049309@linux-foundation.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 9 Nov 2026 14:15:03 +0900
X-Gm-Features: AclHuK9zSBCJoRVZWr3aNVajbv94Ct1tE8nQBFHbUH_58E9vEiS6l-CHETWCY14
Message-ID: <CABFDxMGhWgiqN6OJMc9Os1OFXwnC4dD9mo9u_v-U=5TR1tM4=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] debugobjects: Fix NULL pointer dereference in kmem_alloc_batch()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:56, A=
ndrew Morton <akpm@linux-foundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Mon,  9 Nov 2026 13:12:10 +0900 Sang-Heon Jeon <ekffu200098@gmail.com>=
 wrote:
>
> > During boot, debug_objects_replace_static_objects() calls
> > kmem_alloc_batch() while obj_cache is still NULL.
> >
> > If kmem_cache_zalloc() fails, kmem_alloc_batch() tries to free the
> > allocated objects with free_object_list(). But free_object_list()
> > always calls kmem_cache_free() with obj_cache, which causes a NULL
> > pointer dereference.
> >
> > So use the cache passed to kmem_alloc_batch() instead.
>
> Thanks.
>
> We conventionally assume that memory allocations in __init code cannot
> fail.  Because if they do fail, something has already gone horribly
> wrong with the kernel and it simply isn't viable.  If an unchecked
> allocation results in an oops then that's fine - it was inevitable
> anyway.
>

Right, I only can reproduce it with fault-injection. I just sent this
patch because __init debug_objects_replace_static_objects() already
frees some objects on allocation failure. But again, I totally agree
with your point, so I'm fine with dropping this patch.

Best regards,
Sang-Heon Jeon
