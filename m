Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486754;
	b=VnDavwnZs1CzGGeHyfTmh65wDH/v9ORHM6boBNlIM984Q0ejm3Bqd+h6Q/mm6qrvk1Cg
	 3scxVPvV8k5FJgd5C+QbU5LqDfJZaIIhS3+4MFBEjiNHFpMU1WZMOPLPN+PLb2z7oZu+X
	 APNhAt67ovkVi8EyNlq3UN6IY0BwtO6dqRgkO7Ym2ktCHNkZVY3VPj9h779+DRBDqXBKG
	 EKNXXqLCNatVMhUwUIbqy4NGhyb1FvOEAaGOaP9Y1GuupTJ6zFGQleWe8m2L0QdVt3E+p
	 yA4NahDwNho614kGGhtGJW2S6rGeba6Ei59197J5MpDotMlpXGg4tpoKloiHs7RnpqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y20l2F/j+XurdMoSjb6j9VkFomg1wilobJpR+q126DI=;
	b=iyHOrCullk695Sx2kM6Q2Ry6zRVf/rDheAj0PR595eKmlXgJG2gWJmBK2cwufWq5f8bQ
	 PxvZKEOpNa5BZR2TU1UkYPnDre0ojotKPLSY1BLwS1RK59Vlq29FetdMfOJ5V+D8Lyz56
	 Y3oEGQEkA1oIyem1zgRdoSw5h0fT3mvIkPL4fUXp7ZCIlO8+iAu55/74zdv2mO0KJ90Mb
	 82L3m/DnjK9fYnETrkpqH0RAg5th46pgaigvmSlg2qLW3BPM/nl1mvXag9X42BhyrnhMv
	 1U4elTc2oCah6QAD78iEE1lMPv5UALTTgOfBwODKSftK6XvVvAKlpSfn3kwJ0v05KhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=OjK+AvZ1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF403606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF403606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=OjK+AvZ1
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c506a231b88so211420866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486752; cv=none;
        d=google.com; s=arc-20260327;
        b=Js1dD+7WIzAxd5ZeD+oPAFwNqN1op+2SlwiSKgxuXecgtKdohmlXsbVBtwifO5jvaw
         BVHIcbmRdqaqHrD4fdk9akVA1Xx4h3Dadd95ruE86zdro511RdShJHKaodrx3lBNIuRM
         yf3W0yx8JipZgGpCuf6T4RPrO71LQWdDlC8kKrvu34znJLs698QZYh12HPTCfxokZa54
         GdTOPKCTb/IoMFga/EUAfRnsv7cYSScvPWInOe6mRkD0gHyByel/uhhGYWzqv07potBd
         CvvAgoNFsQ1hktdjTrlBV1pxN+vjg4T8ToQMhCuCUw4w193V79+aRSI2AF2Ie4UJbAsb
         sBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y20l2F/j+XurdMoSjb6j9VkFomg1wilobJpR+q126DI=;
        fh=HSzyYENDFuFLFmKDOjzjqI8niC7Ijr2QOO6EAW7T2iM=;
        b=fze9FWoyf+YoiDbwteHhzM27xfHXgZ5f+mtrQYwU2Pp/hgVp2QYkyxPlvHjIXW4LhS
         dMMIVtXee7D9TkkKz9JQEFX7fxtN5yPwEHcMAJvhaOoFPsGru0pDsd+SsoMT0V+x5Rd7
         CzjZWq9J+UJo/9d8we0lg/qgZWvFaV0l8RFAqwlEweYO96hd/fK2l89feqLOV3DZSv6k
         j1QZmJxVYqqi41DL0cmm0g//RhH2kFYlw07BxXXumN8dS65K6SZL1jo8U155o29+NEQZ
         /BNZKcBgCwfjhfYSK7uK5F0l9V/JD97tqii/aH3eSMD78VsoP6NbvnCc0jTHHoCttzoP
         Y1hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794486752; x=1795091552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y20l2F/j+XurdMoSjb6j9VkFomg1wilobJpR+q126DI=;
        b=OjK+AvZ1DD1zojUH4ETw/TDbfx7Zw4gwU3EkXJWq+VsqgI2jj8/aiQuhifH+4HMoCU
         09hMJYnvmNa6Pv0fy3KdZG3ZzhJxWOrXezkVIUQ2D2j1vToBTO4kidka0FvuyDWAZsdR
         mtTR8ufhrHC9CGiHEW8RswspdjVdmLG6OVh2RAG7pMExZQWtE13J/FyRInB/aMi0VYqD
         41nPoQLp3CIXvn43cY8knIDKW0kVb8L8lMG60jvvKSJ+dyXid8n081lRCJV9EITTXW4v
         1xZ25avZmSW/ycSkGGbcuNEllffu9q9RHE8kNEDTQ+80j0BwGw8wxEkU83mAmW6aISY7
         LDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486752; x=1795091552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y20l2F/j+XurdMoSjb6j9VkFomg1wilobJpR+q126DI=;
        b=hdW8XMKPiGUGDYkBdayxqHMxJYKJbeOgTMitS5SiA7jW2YXeAPsbvdhwpkjV40Xeu0
         qlUT4ojjOMsAd9h3j9S0YISA/Tnbsaw0+SbCrjCXe8wLf45omlegywL5+kZpmc0kzpP9
         u26gyMMLvt07pxFts2/iq6p0ixDfim7yVsVYoJbE+9Q7LBLGnU8HFBlOq2wemL8nGV1O
         dWSbaleZarWFcKr6llq5XzWVWPkZLIYZh10HZYlirOFoqdObRvrDbvwqdt613oi+Yu2E
         dD85pVT/HhGAoh4fWTuKLJCUwGQejxus21fOrl3qdE0Yg8/3kdSXNqRGwjPlsgspUkq5
         NhlA==
X-Forwarded-Encrypted: i=1; AL+hErFjYPyUcL4Vn4ubTjLcFwMvmVTXNbJ//Dn4DoAeBsRsmQkKQ4xGgasdfeC3QUph/ouVOe6cjxKf2uK+j50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XHSynVVAeEEFzAuH2IPC6fDdWzGDTHVuMVHO66SyXFMDfPXY5
	bZey617LGjPgfaPSAu+Smc6huoVujN0jHzs0YjZQsQ2Hb+Oi2txET3lFZE3O9pfa7rCPFKh0JGe
	Um5fasO29GjkdDPcaGPT93WqhkTyEWyqn5yIl7koD/Q==
X-Gm-Gg: AYBFou17l+Um0P7hIKIJv3W8JyMCW62YI0SUKe4iamG3X3HhW/MwSXD9Cy8dmCLxGbs
	JL5a9wOLsozpASvHeqcPr7Vrv7yYbXfhxnh7zA4Wgh6seDs9BEoY3tdO4gqf384wvVzKypNQsVU
	bOhtl90rETMAj5kHju6onk6v3VueWwpaZp0BqZdyreiwxqVhsY8vIZPPzHNkp362pJzM9ESt+4T
	XzpIwHeO9/gYOTlDyQNR0p7WFBKGIrKeaFurs6MT8v+BHBlvM5SgcImFJbXqgT9tdfgtl3Hq78I
	PWXCwSWjo0vHrj5BxMKVqjZhQhTrQ0tlDu/FPHCwqeDbwMYJA8SnQpzHiUUVK+FRtT7Tvz+N6hZ
	jeydguMlaAAXzBUcyeHzNSgW6hGUb37doVjUzDkeNYlDxXgUyzkLJSaseQEgn05er9YqM8nD1bB
	lM/d/CWjoO0rLRrA==
X-Received: by 2002:a17:907:d78b:b0:c40:80eb:c543 with SMTP id
 a640c23a62f3a-c5066983d05mr436745566b.4.1794486752131; Thu, 12 Nov 2026
 04:32:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112004112.3059801-1-stanleyjhu@google.com> <20261112004112.3059801-2-stanleyjhu@google.com>
In-Reply-To: <20261112004112.3059801-2-stanleyjhu@google.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 16:32:20 +0400
X-Gm-Features: AclHuK-MWQP-owK8xO388Y6zrGZ3GrYV1JBK1tcff5OGBU0shzAmKP3lK-2IbRM
Message-ID: <CAKTNdwH9+xsHEQ9wMztC3QSFUBUmYMtLAcAStSGB+TFFrcWfsg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rpmb: core: Guard frame requests and teardown with mutex
To: Stanley Jhu <stanleyjhu@google.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>, Jens Wiklander <jenswi@kernel.org>, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@sandisk.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@iokpp.de>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Shyam Saini <shyamsaini@linux.microsoft.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:41=E2=80=AFAM Stanley Jhu <stanleyjhu@google.com>=
 wrote:
>
> rpmb_route_frames() invokes the provider callback without serialization,
> which causes two races:
>
> 1. Concurrent callers on the same rpmb_dev interleave multi-frame
>    authenticated sequences on the region's single result register and
>    receive each other's responses without error.
> 2. rpmb_dev_unregister() calls device_del() and allows the parent
>    provider device to be freed while an in-flight rpmb_route_frames()
>    call still dereferences rdev->dev.parent, causing a use-after-free.
>
> Serialize rpmb_route_frames() and rpmb_dev_unregister() with a mutex in
> struct rpmb_dev and clear descr.route_frames on unregistration so new
> requests fail with -ENODEV. Also update the stale kerneldoc note
> advising providers to unregister from their parent release callback,
> which cannot run while the child rpmb_dev still holds a parent
> reference.
>
> Fixes: 1e9046e3a154 ("rpmb: add Replay Protected Memory Block (RPMB) subs=
ystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
> ---
> Jens, if this looks good to you, an Acked-by would let Martin take
> the whole series through the SCSI tree. Patches 2/3 and 3/3 depend
> on this one.

Thanks a lot Stanley!

Works on my Rockchip RK3576 with two UFS 2.2 parts, FORESEE C2G071 and
BIWIN BWU2A0526B128G. Two kthreads issuing GET_WRITE_COUNTER, 2000
requests each, without the series (bus registration restored by other
means):

  FORESEE: MISMATCH=3D3814 ERRORS=3D0 (plus wrong response types)
  BIWIN:   MISMATCH=3D0    ERRORS=3D0

The BIWIN part keeps the responses apart even though a trace on the
RPMB WLUN shows the SECURITY PROTOCOL OUT/IN pairs interleaving, so
the corruption is device dependent. With the series applied both parts
report MISMATCH=3D0 ERRORS=3D0, and the trace shows each OUT/IN pair
dispatched together.

Tested-by: Alexey Charkov <alchark@flipper.net>

Best regards,
Alexey
