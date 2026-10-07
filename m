Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D64B0C8B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386669; cv=none; b=qU9pHhrWsDsWYMFC3k75+U4I7wYyHE4fSCEs1GY2sTfLXiQg7AOaeSsKwEXRqSNi0nKrGWWEdk8qOMPy/vcnDp7brIUr9kU/o+07+ySKTt4YrexRA+WnplHRiCXUmKwa2AO/g8KaIBgzJJqWKKQn27d6VSLj8P3IMWshA+vgUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386669; c=relaxed/simple;
	bh=OKeBJjxR7tTzm31iiCNs1ehQBwk3CTtHMQrpO2BvzB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNoq78WIGqXGL8CDrqVulayCGV4D5QjNauhqYIN4Fa6MPRJF9cbN3lMZDvJc1RAv3syrk/+r6M9HY1Q9KnL1Q6GChAeru+9xyRF0Lg4rCR0KLYR63+FepMQ2rGy8fTDVxwOhbadr6neaQYcMDRfHRZy6tmyQUjb1bE5t+JiI2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AM5ZOJfq; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AM5ZOJfq"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2894202a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386660; x=1791991460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AXFnZrOxQoN0fjJ2Z8AczhwxhKYtEEpLfKD4PfAddM=;
        b=CkhK0KLDnJ+dPj0aBnRME1NNOEwzMaYt1cWoAMQpTErDa5oqD/S6cicnii/BQHEbsh
         em6LgXzHSNyDPj/O8dPILGaSR6nqz+K3MFcm5FBn3MZHIwb7f6M14BI34hTLeYGn1iyc
         ePfCUgk6m2lo0w4hG1Y+s7dE2z979R9o7uMigpXTL8Ad1u5EYPPm2PkurMKj7yCR+b+i
         JI2Ph3xkS9ZalxTPmx8M1rdG6pYVNZxyo73vS3gOt7n6YRUBwmYBudRQP2jBiJB8/Y/Q
         YOVlczIhiS/UIRPAyYB+NbqKGIL5CZrrsfbOjTbuSAkw0a+NW4bXpsF94LxMkzJ/CI6a
         SwtA==
X-Forwarded-Encrypted: i=1; AKwUvBy+fM7vzmYMNVmvaY7Bs4hZn492kRS2084woVE5MH4k91eM5aj79Dj54wQDfTMZN5wEQCUDmrKEeFS879c=@vger.kernel.org
X-Gm-Message-State: AFuF++kRGquOmqHDpMpJLj+Yvxenq8V4NN0ciPCtgE3lN7ibHzWMSwLm
	nvjTsm8xiCn0PEts3XVAsLo4Mm1EbhcQ+XMX+Cn1TIaA0UnY5+jTS1n8Tfzh7zWG6K3nj21o6gp
	UsU7zK3aUHoFiWjkQUj84oqhC/945Py3G+NakN0Pi2A0z3ilxL+PC+xQJn/TKK1HTkZ7GHb+XVN
	1KUdpN+1ch2n8cJcslAFraey1jG5/uMLNnK2SKmZygpgMWvXTP1QbUwKOy6pyXp6B9mOA5tmPED
	P6x7wXttvjf0WP/
X-Gm-Gg: AYBFou1XoZFPz/MtUmBw3A01nhIuRQQVlKFZjalsXgnR9HdgVroBQlBSj/7AtKSQBci
	mrXu/uu16pyHgLMRIkImnrFCbwVTKafJgHl8dcdKBQFSUXL6qjABEsplvLOTlkPOyBhiQhdx6b6
	uxnoo3w732KqNqpzkEm/S4YxelJkLUiV9El47f0FipbZhEt68qK2JJS5U5gAoODUSPCQbJt7gHr
	/R8drc7dpCiW5HpnmJnM6QZNJKXhHh+b9wvVKHg6hT9Ld9xHLOrYwdJoszhrMJe3rcFK/ga76pc
	JGBVP3F929h7p+HKs1D9H3uGHhyvWAG571gc2mWS/JTs0V2oSNDdbwMwCb/dmtxcq/mBqVnhaZ8
	mz/ookggXtfl8AkgCtzXXLOqZes8rX0qSDkXj7AM7iW2QsNgLo/O1xEQXpIRjKqzTTdCEi11ABb
	9DOEcSJnlT8DBRHkqKe2AYkbji82czLNbS4Ks=
X-Received: by 2002:a05:6a21:e081:b0:3e1:1689:1eb8 with SMTP id adf61e73a8af0-3e133da9e73mr2313196637.2.1791386660063;
        Wed, 07 Oct 2026 08:24:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd0ae858663sm377147a12.11.2026.10.07.08.24.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 08:24:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a7a968980aso9749331fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791386658; x=1791991458; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AXFnZrOxQoN0fjJ2Z8AczhwxhKYtEEpLfKD4PfAddM=;
        b=AM5ZOJfqnqQONTiELHbzd6aDmQVMRiFmHM2CyZcDJYaBS0hiEiZKJACqzRL0Wsaqwq
         P4x2CZEjoqQoRWUwgPAKKwjSgitXkR8iGBFmsvPUSt52Av8q61NOHGpfMqNSV6knVGRb
         lU2ppsWSmwhYgiq0eqmxr6tSqMAB9mBxUCNP4=
X-Forwarded-Encrypted: i=1; AKwUvBzpZLG5Umxrg95oi0BGT3b4UHJAr/bC0h5vfciFWBYNuv2HvN5WVbptBqK0sC9Dd2C/rYNai/++BEOIz3k=@vger.kernel.org
X-Received: by 2002:a05:651c:41d4:b0:3a9:8969:3dd2 with SMTP id 38308e7fff4ca-3a9a2d0f257mr5662841fa.13.1791386656051;
        Wed, 07 Oct 2026 08:24:16 -0700 (PDT)
X-Received: by 2002:a05:651c:41d4:b0:3a9:8969:3dd2 with SMTP id
 38308e7fff4ca-3a9a2d0f257mr5662741fa.13.1791386655515; Wed, 07 Oct 2026
 08:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f8efaabd-c06e-4f04-8cfa-489c148e37ba@ozlabs.org>
In-Reply-To: <f8efaabd-c06e-4f04-8cfa-489c148e37ba@ozlabs.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 7 Oct 2026 11:24:03 -0400
X-Gm-Features: AclHuK-7Psz2fEN6Ia0WD4-kcZK_lZfa-O4nL5-5vl9wSJCF4amtlpIyd2gj7I0
Message-ID: <CABQX2QOOaxkxzREaDHY3iXHs0106u+F9JvQSTXCnA7AEjPPxuQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Annul dmabuf->file on file release
To: Matt Evans <matt@ozlabs.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Thomas Hellstrom <thellstrom@vmware.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Alex Mastro <amastro@fb.com>, 
	Alex Williamson <alex@shazbot.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000686130065d41b5ab"

--000000000000686130065d41b5ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:15=E2=80=AFPM Matt Evans <matt@ozlabs.org> wrote:
>
> The dmabuf release path is split between file and dentry release:
> dma_buf_file_release() is called shortly before the file is freed, and
> dma_buf_release() calls an exporter's dmabuf->ops->release when the
> dentry is freed.  However, the dentry can outlive the file (for
> example, if opened with O_PATH), meaning .release might be called some
> time after the file is freed.
>
> This presents a window, when closing a DMABUF file, in which
> dmabuf->file points to freed memory yet .release op has not yet been
> called.
>
> For VFIO, if a buffer's .release has not been called it's considered
> still active and subject to move/cleanup.  If so, it attempts to
> get_file_active() on dmabuf->file: a file close with dentry held open
> will call this function with a stale pointer, a UAF.
>
> To make this pattern safe, set dmabuf->file to NULL in
> dma_buf_file_release() to reflect that the associated file is now dead
> even if the DMABUF is not yet gone.  A get_file_active() ... fput()
> sequence concurrent with a file close will only execute as one of:
>
>   - Gets the file before file_ref_put() (dmabuf->file valid)
>   - Observes dmabuf->file pointing to a file, but it's DEAD (no file)
>   - Observes dmabuf->file =3D NULL (no file)
>
> Originally, drivers could assume dmabuf->file was valid until .release
> was called from fops->release.  This assumption was no longer valid
> after 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to
> dentry_ops"), which moved the callback to the dentry release (by which
> point the file might have been freed).  With this commit, drivers must
> still consider that dmabuf->file could be NULL before .release.
>
> Fixes: 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to dentr=
y_ops")
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>
> Hi,
>
> This issue was found (by Claude Opus 5.5) in the context of VFIO's
> DMABUF export path.  VFIO iterates live DMABUFs with a
> get_file_active()/fput() block, which now becomes safe if the file is
> closed (and memory freed!) yet DMABUF .release hasn't yet occurred.
>
> However, there are a couple of other places that directly use
> dmabuf->file and seem able to race a closing file (i.e. without holding
> the file reference)?  If this is so, they'd be a UAF today; with this
> patch that goes away, but instead of a stale pointer dmabuf->file could
> be NULL:
>
> 1. drivers/gpu/drm/vmwgfx/ttm_object.c:get_dma_buf_unless_doomed()
>
>   file_ref_get(&dmabuf->file->f_ref); on a non-refcounted DMABUF

Yes, that's a real UAF today. vmwgfx relied on the exporter's
dma_buf_ops.release running inside __fput() before file_free(), which
stopped being true with 4ab59c3c638c and we missed it.

But this patch on its own makes vmwgfx worse. In the ordinary case,
where closing the file drops the last dentry reference, a close racing
PRIME_HANDLE_TO_FD is safe today: ttm_prime_dmabuf_release() runs from
the same __fput() and blocks on prime->mutex, keeping the file
allocated, so file_ref_get() just fails on the dead refcount. With
this patch dmabuf->file is NULL in that window and we oops. So this
shouldn't go to stable without a vmwgfx fix.

For vmwgfx we'd probably need this one line change in
drivers/gpu/drm/vmwgfx/ttm_object.c to accompany this patch:
@@ -471,7 +475,7 @@ void ttm_object_device_release(struct
ttm_object_device **p_tdev)
  */
 static bool __must_check get_dma_buf_unless_doomed(struct dma_buf *dmabuf)
 {
-     return file_ref_get(&dmabuf->file->f_ref);
+     return get_file_active(&dmabuf->file) !=3D NULL;
 }

under prime->mutex, which keeps the struct dma_buf alive. It needs the
NULL store from this patch to fix the existing UAF, since otherwise
the recheck can accept a recycled file through the unchanged stale
pointer.

> The commit message of 90ee6ed776c0 ("fs: port files to file_ref") hints
> this might be more subtle than replacing it with a get_file() variant
> (so as to accept a NULL file *).
>
> 2. drivers/gpu/drm/i915/gvt/dmabuf.c:intel_vgpu_get_dmabuf()
>
>   gvt_dbg_dpy(... file_count(dmabuf->file) ...);
>
>
> Respective vmwgfx & i915 maintainers, what is your view?
> Or, indeed, if anyone sees any other questionable uses of dmabuf->file.
>
> Thanks,
>
>
> Matt
>
>
>   drivers/dma-buf/dma-buf.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 4c9add51f9ef..726639130477 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -193,11 +193,15 @@ static void dma_buf_release(struct dentry *dentry)
>
>   static int dma_buf_file_release(struct inode *inode, struct file *file)
>   {
> +       struct dma_buf *dmabuf =3D file->private_data;
> +
>         if (!is_dma_buf_file(file))
>                 return -EINVAL;
>
> -       __dma_buf_list_del(file->private_data);
> +       __dma_buf_list_del(dmabuf);
>
> +       /* Must be observed by __get_file_rcu() before file_free() */
> +       smp_store_mb(dmabuf->file, NULL);

I think Alex is right and dmabuf can be NULL here. An early if
(!dmabuf) return 0" will fix that.

z

--000000000000686130065d41b5ab
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFw7
JigJDzWY+MbEwLXGqD52Gt+esB7H6stgjSNjxl/bMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAwNzE1MjQxOFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHByaHrkIAGF++rS7lWVzENDABygcbAG+ewuH1xW
uvAiIjg3OHnMrg8nonv4XXc1plPaTaTxX5R7nMjhvjCM0+pMoH6DV8AfsIgkmQaFBBeR0COlQS6v
iVW3FKjvDpL/PtIy8TSO2RD6tTs0d1yxgq+ghgF/BhKaRA0V5Glzjac9oJWKRl0nG0n3DJc0QO4b
V4El/N+PyHkOJTT2eH2DZwlfRGs8E+7AowlCCvqORJHMBMz4TIWusuG5LJyaY2P4HahsOI/2JlxH
kGjHLbfxtukhb0/obTjghj8LxJ5IwCvilaqzkT277+XPMnQSpXi3DU4sJ4HKF6nIS//o55bg8vI=
--000000000000686130065d41b5ab--
