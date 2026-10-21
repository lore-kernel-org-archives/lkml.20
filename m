Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617768;
	b=HMpmsaoOMKQ0xXpPDCpw1pUE2apQ3c4gRoWF5hqr8q9kMC3v39LI+iU/CR9dyuhLydQZ
	 Y0sgI+kG/gNPnBytsYfSjnb7uHM6j1Xl7xxTtLPoDV7YJbAf9kD5EvfCeTnOmbyirTTIH
	 IW5OnW2TgT5pHwA1IpaQKoFNlTOA27DWN2fyCr1FRrW9QDr7Jg2vAQf2wQaKJ3uIpQpZ4
	 qZ5ls0xLZBDntrGlJNztNZnIPMaaGePAx5i+9kulpACDLMAc4uwRounHcu3h9Ho46uxX9
	 BnCrGSCj1skbsLimf+FBxJAtOcU7KeszL7KxN9NT/GjvBKFAEsJ1v7QCvazbltQUd8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=JC9fA4/O03RslRbGMA29FHUYG/vmJ+UslNVNMsIwusc=;
	b=CO4o8IzqPINQ0+e7vBMwuak0iLd1wV5HxKawmrvHS3ZibK8GtreYl0nsY/PjpdlD7hzM
	 +k5XJ6Rvr0PaCyroCkYAETNxznctketlNcL4KwIfkYhq9GYu0yypdChhc7Gd4uHKa/yHU
	 JERxZQvjvzEjlSkHXYcWvRDA4icwfomtNgRZZtLUD019+cGKc8nCBytoa/GcuOveBMXeM
	 vA48ZRqCF3yuVQjhvfFRAai92Un6Hde1GJtfIyiGT07JnxP5r1opFx8hXTNsogeX1fIV4
	 BpI3ctR0xL7L0Rm9uON3EuVtjz/UfPDMYBQlbcqsHt5UsIZFa1YIRFs+U3FrnsAexLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=cvPz83to;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D95606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D95606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=cvPz83to
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b125371596so2709937b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1792617767; x=1793222567; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JC9fA4/O03RslRbGMA29FHUYG/vmJ+UslNVNMsIwusc=;
        b=cvPz83toLcEF80lL7soZBtjNhFB0JG7be+pacF+F/ry1j9pAzvZG21KKvBobdeOWt1
         fwhWTPyIKvJLrInd7IUJt6xNSAGc9WE2qo07O1Z/PveLP/MtKvFARMFfQAuX1G353H7S
         OcPIprulerZspK/k/spcWaUGrTHkyOITK/6Sn9bBCUSo4i3Lwg3+ofxBwVUuBQXUbBc+
         o0zr6eFIL1tZxN6gcmhplVzEkQtD+Gh0elU6KDum01AGhrZVodxJN+1uTkAPGXIcafpB
         pH7oNJ6eKT8i2kKHW237bg0EozQ6H2P40V0u0aRBkMSDfD1KVdPoenycz64xvzCx6Byt
         yOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617767; x=1793222567;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JC9fA4/O03RslRbGMA29FHUYG/vmJ+UslNVNMsIwusc=;
        b=PKCnIaFVN8cn+SuDf31LcPaQVc7EzBCGTxcdDQrCA/nVA63CHemtgUx6QoQCVpwy91
         TnDJ/Zzu3pIAaq28GDww1Zp4lBvYOTY5VtITk40PNIUOSHKYJnr5rhauq9Oz22UxOSMc
         Qgj2FosEmVsLPzA9tbyrcdL9slbYOBjaL4+DfsHIHQYXDoZ598zw4siDD6vwVFPJKZx2
         PA8oDw1fBt4vKW+upHa0HW9xXKD7HkdmCLfE6HcAxlnaUm1OJNq57RPZicbeXAVq3Pov
         5lOymxMhgltmnQJu0746YkV0gYZwG+8oeApF0WzufUchmdRW8qSodV9MTZjZu9Bn3Zyd
         wilA==
X-Forwarded-Encrypted: i=1; AKwUvBzCkJyBTbRxBJgw2VrKlgouEzHxLRxDBNQm3oUrBZeEExLNYGjslqlzVfO93FTmYNV73LRHqFJEKhD/IXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHr+erqgZb5pMpFKgPlCZLG6spTlp4b+0hram3vUHCX9toXSjE
	x3dATErdTgbP9Cyufpv/xic+r7Mv8C1BGfa4iKYLSRWXZmm2O/1fPw401OrsW++VZpi+u5+c/FW
	3A5/RIxs=
X-Gm-Gg: AYBFou1pKqeAGjK7KvtmAN51SB6DffGtzdT4k8m4ZG371q7NZ5LATCb59VWlVrFBp8n
	xYSURDIeHJ64x5jtbsHtWtEAoWcJn45yi+3HxWhEm8peJFOy18Gs1rx+q8EBAdkQKv0WQJQrw+d
	3FA1Vu9PKZwm1rUpDZqacmlGz7gd5Ui8yo1sk/et9nJe9svQcSgOJx7NOX22ux1kj5EOp8plwbS
	9jDxKdjkswK8SyrmTAbx0dmMtdPrLlc5ZyHauulnsX/QvDv0coGpILn/sfdG/L4Vt97IncetCLE
	SsdaWO9p6xYjU6I4weG/+vQ5Ugt9GYOob9H0fSS5HtOc5QZqEcixostcsDKg5Fp6g/f5b2pA0Dn
	/wXifwKFQF8bqu1vPSu+Qf42Lb++sTzwOeaLS7weIU4+IJlHIghTaDTGW+05Rj7gzAgnRY7PQb8
	49JP3/LHvpnO7a+E0idT4fKrK7dEuDTKlpckZPYBpOtLj7cEl/B0nx2D1+qzianfNWJ0bzN8/j7
	3FKgCiDTgbPoGy2AdLTU1YajI1gfSkSuRinu4pzWPyc7gh5jQ5RCsdQp+MuEAapdgFhtNBveVVz
	8xG70U2mHiW7VdYKAzEsZi5aTptNJtKeEyRnjFT8Pz1guib88y2Gh/JvrQt7Jg+1QYwa4aq9xtD
	VhlwP3wZOfHX15w2ssBZZk/hrQstRHfhPPwI7QbgqZrg=
X-Received: by 2002:a05:690c:348a:b0:88b:6ad8:48cc with SMTP id 00721157ae682-8b1456fbdefmr3878857b3.16.1792617767006;
        Wed, 21 Oct 2026 14:22:47 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:de6:d01d:526b:32a4? ([2600:1700:6476:1430:de6:d01d:526b:32a4])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b13012f929sm17378997b3.33.2026.10.21.14.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:22:44 -0700 (PDT)
Message-ID: <2b9ea598558ed4b7dd25eb26a05f6667522c3afc.camel@dubeyko.com>
Subject: Re: [PATCH v2] hfs: report errors when extending files with setattr
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 21 Oct 2026 14:22:41 -0700
In-Reply-To: <20261021145627.288953-1-hengyul@cs.unc.edu>
References: <20261021145627.288953-1-hengyul@cs.unc.edu>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-10-21 at 10:56 -0400, Hengyu Liang wrote:
> hfs_inode_setattr() sets i_size and calls hfs_file_truncate() to
> change
> the allocation. If expansion fails, hfs_file_truncate() restores
> i_size
> to the allocated size, but its void return type leaves setattr
> reporting
> success.
>=20
> On a freshly formatted 64 MiB HFS volume, ftruncate() to 128 MiB
> returns
> zero while the file remains empty. When the requested size fits
> within
> the volume but exceeds the free space, it also returns zero, leaving
> the file only partially extended.
>=20
> Call generic_cont_expand_simple() when growing a file and propagate
> its
> error. Keep truncate_setsize() and hfs_file_truncate() in the
> shrinking
> path. This makes failed extensions report EFBIG or ENOSPC.

I think now this code [1] becomes dead. And we need to rework it:

void hfs_file_truncate(struct inode *inode)
{
        ...
        hfs_dbg(...);

        if (WARN_ON_ONCE(inode->i_size > HFS_I(inode)->phys_size))
                return;
        if (inode->i_size =3D=3D HFS_I(inode)->phys_size)
                return;

        size =3D inode->i_size + HFS_SB(sb)->alloc_blksz - 1;
        ...     /* existing shrink logic unchanged */
}

It will be great if you could share another patch with the fix.

>=20
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> Changes in v2:
> - Keep truncate_setsize() and hfs_file_truncate() in the shrinking
> path,
> =C2=A0 as suggested by Viacheslav Dubeyko.
> - Replace the generic/736 and fsx runs with a comparison of the whole
> =C2=A0 xfstests set selected for HFS, as requested.
>=20
> v1:
> https://lore.kernel.org/r/20261017160612.3740256-1-hengyul@cs.unc.edu
>=20
> Compared unpatched and patched v7.3-rc7 with identical KASAN configs.
> All 805 tests selected for HFS by "check -n -g all" were attempted,
> using freshly formatted 2 GiB test and scratch volumes for each case:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 passed=C2=A0 failed=C2=A0 not run
> =C2=A0 unpatched=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 109=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 27=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 669
> =C2=A0 v2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 109=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 669
>=20
> The different results were generic/113, /394, /464 and /795. /113 and
> /464 passed and failed in replays on the unpatched kernel, and the
> /113
> failures are the same existing workqueue warning from
> hfs_file_fsync().
> /795 failed on all three kernels in replays. On the 2 GiB volume,
> /394
> passes without the fix only because ftruncate() returns success after
> a
> partial extension; v1 and v2 report ENOSPC. It passes on all three
> kernels with a 4 GiB volume.
>=20
> Also ran 39 functional and 18 recovery cases per kernel on 32/64/128
> MiB
> volumes. Content and read-only remount checks passed on unpatched, v1
> and v2 kernels. All three had the same 12 post-ENOSPC fsck failures;
> recovery fsck checks were clean.
>=20
> Functional/recovery cases and generic/394 were repeated on unpatched
> and v2 kernels at the hfs 7.4 merge (dd7b15aeac80), with the same
> results.
>=20
> =C2=A0fs/hfs/inode.c | 10 ++++++++--
> =C2=A01 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index 2aef3c36a150..9bdaa60fc392 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -684,8 +684,14 @@ int hfs_inode_setattr(struct mnt_idmap *idmap,
> struct dentry *dentry,
> =C2=A0		if (error)
> =C2=A0			return error;
> =C2=A0
> -		truncate_setsize(inode, attr->ia_size);
> -		hfs_file_truncate(inode);
> +		if (attr->ia_size > inode->i_size) {
> +			error =3D generic_cont_expand_simple(inode,
> attr->ia_size);
> +			if (error)
> +				return error;
> +		} else {
> +			truncate_setsize(inode, attr->ia_size);
> +			hfs_file_truncate(inode);
> +		}
> =C2=A0		inode_set_mtime_to_ts(inode,
> inode_set_ctime_current(inode));
> =C2=A0	}
> =C2=A0

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.

[1]
https://elixir.bootlin.com/linux/v7.3-rc5/source/fs/hfs/extent.c#L488
