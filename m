Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E283DAAD0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393887; cv=none; b=k+qkAgOWUT93//aUGDhEHiah2gyD9S4lti4qvl/4CWnPTyGQSBY6hAkiHBxs3GPODpyjpEjoGQtxWO5aeUFILSdH0H2Idfpl2AuD4Vbkl5qFvhBt8MtHo8paHc25Rmea9gAlBu3thovANeKudtC/7OqdxVar1k1tNnx70xazxJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393887; c=relaxed/simple;
	bh=gzd2R2XVsbPvcC2R576jeAdho8Levfwu3oSTB6Vmimo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUB95Jkf7LrR+za/kXjpvsqunLcWeIfaKJ6YcTUQW7RLcTEogXPunBjxNQvQu+c2k0ODpUu75puqrr1wOr8jBgrE+fWv1FD/KlbPdPolXImw+rDINo+KcwNI58Wjzj182/JXxiaBs3Q6JZ67soitXazxgUQu/BgOYtSKTbhHQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gHxLNreU; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gHxLNreU"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso966197a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791393885; x=1791998685;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/aBQUJGcsC5HOCo1gGMWCZ4gT0vt3Xw8tT8l08Gnnw=;
        b=VaijKCrA912xsEE5IplOGSAb83HnXyirmcJSnA4hwocem91pnodf7zVTQHG2hf0xxg
         FJSe/Ax+fuav17jkm/OA6qVnkZVmNhRK7IMuKBjcYZG4xM12SRskx0JlCgw5Rz3MCjKE
         f6xs4DPFjRs4UlpkIlXBlaHUAWa8LoJxxMtkQQVKFTrZzklX7TZxWne1kY/D8tNa2y1g
         S7uSSoc49QU4OowielIuCvzHCYk+DoJ38KqgaT8W+O2b+JZpYNdMK2tsufJGuBDWpyyc
         g4+N5AhKAhZ2vUGYG/OtqlXFz93hzk78f263BEP0ZbyMSIB6DRQIQ9o2Rs528RAJTP5F
         9FEA==
X-Forwarded-Encrypted: i=1; AKwUvBzR5rdj38FpdJrrpqAPlSGc/zQ5cYtOAOR/ECQxPtN/g4Ej2Qq7Z7NH3e+FdM+vpajAcZ0GQmdCTo9gfyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7x4N2mAMivh1zoODK9ULUcUtl4gUFGMH4fXPmkLymV506MddM
	mMYv+tjI2YvVI2sUf3lvMYSzTOpyih4fXLFmqepNUPufMsECmFHPwavufQUHTU98d+DVhFt3w8h
	vIMqXc78yT3HIQJ41KVLxL+lZ/pDY1P0JcKN64A3JhMdz68NsXUaSYti4yNGdi0vwofWANesFAc
	zh7lXBN0s0/SFkXvXrYGox1S6/hLUVPcPuXijB8K0dZ5tBGyX++a+K9cFBPqCRJ3ysxyhpnHBcO
	QRXws9ZGM0lglg9
X-Gm-Gg: AYBFou0frpdYQg4Gy5AmwwVV9qLiwXTrzuf8EInhgoo2NX8zkyKvBFkdA4eaJuu4SGo
	4+lHYHGN82plAo8qzNuQ4BOy2gQDDlzukMl6e7AX8BJCds6LV48ok8PJcXO3ZoQX9Gv6S0OVdRb
	nLESm53i2IwZu3IbJ3gLR9Y8EgwyZZ6wZiLgdgQY3x5t3914t7r7z4pJ+aZEolAn8Xk1XHj2BDX
	sD1tJoz8w6ADaa3sDvNfvUr3I9eElOacxJO+V0a88mLn111XqEMZgpvaI1ugaRCQFVag2TkVL0S
	bUMD4S4Fza1RkaMbtYhsuPf2rVZySqVwW3vUCqA4bKV6Hr4JxEI77Cjem+IsPzVWnExtdb06ok6
	n2fkSUnvKjC4j4gKg7+uQI8SASdGcInzsFb7oh25Kzz40OYd3wW+GVAFt4pVm5ZRplDsxc5boaU
	XJdVneLzeJ9TnZxxhpmxbot7QqPemdIJtbQAw=
X-Received: by 2002:a17:90b:3c8a:b0:3a4:d5c0:f826 with SMTP id 98e67ed59e1d1-3a8a15809e0mr2531582a91.65.1791393884905;
        Wed, 07 Oct 2026 10:24:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a8a3e794d4sm437363a91.2.2026.10.07.10.24.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 10:24:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8351790eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791393883; x=1791998683; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/aBQUJGcsC5HOCo1gGMWCZ4gT0vt3Xw8tT8l08Gnnw=;
        b=gHxLNreUYTX/T754Rds26yo4OD7/7e9BQsm7iwxjtK/PclsE9/+JijXeiYpv67Bmbk
         mOUgsf8CZ5wC2wu9Ikf0rV183+hhRoD76HTPFjFpQe5xYuenXIuzDo7ndOy8lNWhuRZt
         1s+wIaCXHr2L14Em+PnZvri1NvfaMcKAkebns=
X-Forwarded-Encrypted: i=1; AKwUvBywUeWb1tPLOcb1s+NiY21bWzNKUXIBNzlwAVsiDx8ta29EE/mU9hdUuMPi3em4VwxRHBzk2MOVrlF8/eI=@vger.kernel.org
X-Received: by 2002:a05:693c:6391:10b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3515da5dd21mr2968912eec.4.1791393883098;
        Wed, 07 Oct 2026 10:24:43 -0700 (PDT)
X-Received: by 2002:a05:693c:6391:10b0:34c:d1f2:b552 with SMTP id
 5a478bee46e88-3515da5dd21mr2968887eec.4.1791393882356; Wed, 07 Oct 2026
 10:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923135012.1823971-1-qwe.aldo@gmail.com>
In-Reply-To: <20260923135012.1823971-1-qwe.aldo@gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 7 Oct 2026 13:24:27 -0400
X-Gm-Features: AclHuK8Rtk0VCGvLWwuukn9V5BNplvYIe1zYZb_CQF7GhcBv2ea2umqr_KEADvI
Message-ID: <CABQX2QOhT_wzq=EVE-cqjAADYKOvM8t64nxyDgB-Q8-k+89X-A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: close TOCTOU on guest_memory_bo in surface
 reference ioctl
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Ian Forbes <ian.forbes@broadcom.com>, 
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000179c7e065d436447"

--000000000000179c7e065d436447
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the patch. Just a quick note: I'm not a huge fan of patches
like this because they attempt to fix a potential issue, usually at
the cost of introducing real regressions, which is not a great
tradeoff. Especially nowadays when writing code has become much
cheaper, patches that don't mention the type of testing/validation
that has been done are going to need to wait a long time because they
trade the part that's cheap to reproduce "llm please fix this sashiko
bug" for the expensive "run the full test/validation tests". However,
lacking proper fail/skip lists for igt in the kernel for vmwgfx,
explicit testing instructions, or a public CI machine is our fault and
we need to fix that.

On Wed, Sep 23, 2026 at 9:50=E2=80=AFAM Aldo Ariel Panzardo <qwe.aldo@gmail=
.com> wrote:
>
> vmw_gb_surface_reference_internal() checks srf->res.guest_memory_bo for
> NULL and reads its buffer_map_handle and buffer_size outside the
> cmdbuf_mutex scope that protects the backup pointer.
>
> A concurrent surface eviction can NULL out guest_memory_bo between the
> check and the use, causing a NULL pointer dereference in
> drm_gem_handle_create(). The post-mutex reads of vma_node and base.size
> race with any concurrent backup change.

Thanks, the locking change itself looks right, but the description
needs adjusting. A successful eviction keeps the backup. A concrete
racing writer is a backup switch, e.g. from
SVGA_3D_CMD_BIND_GB_SURFACE: vmw_resource_unreserve() drops its
reference to the old buffer and installs the new one under
cmdbuf_mutex. So the unlocked check can see a transient NULL, and the
reads after the unlock can see NULL or return another buffer's offset
and size. The new handle keeps the original buffer alive, but this
ioctl holds no reference to that other buffer. A further switch can
drop its last reference and free it while we read it. Please describe
that instead.

> Move the NULL check inside the mutex, and read buffer_map_handle and
> buffer_size while still holding it.
>
> Fixes: 14b1c33e8429 ("drm/vmwgfx: Add new ioctl for GB surface create and=
 reference")

afaict the unlocked check and the reads after the unlock go back to
the original ioctl:
Fixes: a97e21923b42 ("drm/vmwgfx: Hook up guest-backed surfaces")

> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index bd05637..fff4402 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -1718,15 +1718,21 @@ vmw_gb_surface_reference_internal(struct drm_devi=
ce *dev,
>
>         user_srf =3D container_of(base, struct vmw_user_surface, prime.ba=
se);
>         srf =3D &user_srf->srf;
> +       metadata =3D &srf->metadata;
> +
> +       mutex_lock(&dev_priv->cmdbuf_mutex); /* Protect res->guest_memory=
_bo */
>         if (!srf->res.guest_memory_bo) {
> +               mutex_unlock(&dev_priv->cmdbuf_mutex);
>                 DRM_ERROR("Shared GB surface is missing a backup buffer.\=
n");
>                 goto out_bad_resource;
>         }

This touches the same lines as your "return an error when a shared GB
surface has no backup buffer" v2, and this branch still returns 0. I'd
treat them as a series and just rebase this one on top of that patch,
keeping both its ret =3D -EINVAL here and its surface-reference cleanup
on failure.

z

--000000000000179c7e065d436447
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINxZ
Pv1ePkB1fJHwbRMFJ5N7Qa+Hubfs5Fy3QWDEwpaBMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAwNzE3MjQ0M1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKXWzvScZ1la5WIwpbKbEZ2xGJfIVdOvfNOzb27s
qNaGlobSDkF9nHZR+jU5R215V0Kk/1uRJYSpR0ynmv30CzrZcLew8gSuH9S24WXJpR2zJgpT2Kzo
OXWlxEIFlumG5zBxb85ZPMzvsCJXMWwsVa41Rr2AvYMf50r7VjWXiNmbOaaqaEcfp0LwFBlrPgPg
Y1ttE6lRGbkWkkarm6WcSuPpl3k+bJ/S/9ptVgTGCei7SxhSZXxYR5BEQcQ18g90/pHBd/LKE/xb
6bdI9EDfepjir7PK5OrFOXT+n19lW1s/YaeLOoCdjC/V4chwUgRcj91MDCkypDsaqklRlaDwUQY=
--000000000000179c7e065d436447--
