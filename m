Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793877397;
	b=qHN+L13LObNNP3jVJu7XHVMah1BWiPpHsTA6uLCbWTmPpCuVgmN5NpDp96/Gb9qCSLHP
	 IgCCVbTwEAIbC0crh6N6tXqjTMkGLP42b4bZmCi6+Ke1v7mSXoDjtlrgycgN8WlIhpta6
	 Y4yRW7knVFStaG2dhCjK/q3eqKW9lmG5Fnoq/STWPFnHv7hfSFyipPpFt+kzN4kCZ1fpw
	 U/kiH34Fz0Rz0nHubjKuremTSJdTfg14ag7c4OX0LJ8LMZSi9jhXdVKJXB6J3RwwCC040
	 ZlHHo+EKa8FW00tg05NnP04WTTEVp6bAP1d3Wn2j6+QIRRmGYHhCgTivc/gwxci98vA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mbuO71RAfzZg4eV/uh/nLbsBTf1bF5h60PMcEHEZE5o=;
	b=0n/BwD2Znq5ymH62DuTuW10eduRDlHTbhF4omsGDNf5+kOnowzcIYwL4o3ollkafNDsi
	 Yn/HrYI+PQTPler3G+chAMbkKjpuh64V92tcez1LDiDHxIQoosuCgbFN4cBqkNmtvlf3r
	 kO2n+PgVrUxksJqrCP63ZH8TJ8k/xoQJDmzLvM4m2DbA5VLpXpIDnbSWf2P1ou+l3ocMo
	 Ya4wB2S295mb49PgrJ9Pj/92yvhZB/dbHc6jIObhYJ6wmLj/QMySzF+9YnGNzYRo1qPcr
	 SGk5kwU0zGT5CISlY3jNC3EK0Ah5u/ewIHKNiXOFZMnC0xIZIxwkk5vXO2f6Kt9GGYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JnrWOJm0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F0606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532F0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JnrWOJm0
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1215996a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:16:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877396; cv=none;
        d=google.com; s=arc-20260327;
        b=EEoZbxsiLqHurhU7cYakXqLHJMI9LiDl/DOiRrwNguXl4FaA8o+/BGh70pjqjR6Zw7
         rsnT8PsOQFY3tGW2vfq6x0mnbb9Pd67sXg3gsoF/eDKEbb6eDMzeRhryr9P07iNiuBj+
         ZrIw3xzBcreYiP4uSDlvdgbyF/vNCLEhQmkewpUTjozyvdEToDn2e6Zsxzp4laJMZnjC
         DMPpR9ZiJCuHatApY0i3WL4NN3G0N4P11SjnRAdn+KG+V1iidWtRzgYllo4FiNceuUWP
         74mdEKCKlrAyI5abSt9wmBZ8YeajPKZ4v1XfMGAEClXPN6bS9RRpC5TwXT9hB46pAYfk
         CyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mbuO71RAfzZg4eV/uh/nLbsBTf1bF5h60PMcEHEZE5o=;
        fh=1Y+Jhy02T8HnQth4ZkBrmP7oXoy0K51c6OENlZhgvGs=;
        b=hq5P9A1v0PfgbbM0n1YWcvcopxfnSHErRoaL/8hSWsr3UUAo3nWR6aR75AnFh6Ub44
         PbUvN8Kl/fc4aB6HIXxLbf9M6izeN7j23HK0PrBkzfjrQA/I2sca5vbQfmynmgoGKWJm
         RlZiI1DOhnCA2a+EJPNPj5nTgMfHqNvZt5c2DjyxfqSjbJ0r4vqD5+Tyf3fTWCowLYkh
         PSBDWzB9FYZdAGKQDXC4137OXkp0QLu8OKIbm4BTwpnx/vyI0nLHPtuExHgoSkkkuxQX
         3IRjLiXHndWCCHsq4szo7OZhlNwmeb0834au7/g0CfzfaSv/+eBeJA2cvGbwsQ0parpl
         9DTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877396; x=1794482196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mbuO71RAfzZg4eV/uh/nLbsBTf1bF5h60PMcEHEZE5o=;
        b=JnrWOJm06ylNQjuznyd8sqofcdiseURgioYzHNPkK56kFeQBc+fp+psRX11elRJPEK
         jMNr3qRq3IfPex1/zda/0UOVMTgogLeykFQrVcjk8H16PVxgZVKi8W/cb7GW2BawEwdK
         BtAtd0vDi7SpE4WSnhSuE+uBuC+Agr8byE25I7FWTC1kqNUDGpt5VNxjfNi9QadpWASq
         14CkgmgfPo35WLEeYg82Oi24Gz88HYVXuzL3AL3avLLNzR30YCEsgU/LMo1obCFihjuy
         4QAzrNeCwK9Go34L+UnoNgtDa8F+FDQTHGWb/zzOKUFJ8V/U7A+MmltvnTVeglc+7lNo
         8WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877396; x=1794482196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbuO71RAfzZg4eV/uh/nLbsBTf1bF5h60PMcEHEZE5o=;
        b=X+c2AJoPzLnyJuXm9GNEiAWYAlWisSHBmRARBwGQSsRTTclR5qgmaQFz2d25+8kOx2
         4w1mqT4XEvUWZvq4+bwNdCe3Gf7UXv2togJE0DN3KoKzl3mbT7cAcaHY+8ZhBUtylkII
         aLuNx6wl4WbThgivgm1lB7QeRmO/TcSavvmywVoeDQu4f3ZfLBgMqKnZhCt4IeggTbp4
         2EjXBvUruG8hSRgT5OeJIpJT5eAELVFM6caC775B6rCHmDHiNucWewT9B64RTrauaz2r
         o5ls6Rr0tujYppnpE8ywQRXHpm9Nl1ln8tQyJGDi16JOJF8a3F0qcIkAV5oChEYHgTdZ
         MDnA==
X-Forwarded-Encrypted: i=1; AKwUvBzlzmLNQSP11StW08F1OoRUPBqZV/JQPVLO/D3gqsSCC9ismzJj71dl7Ni+HWbh4NmaMybQhUBHiL5AtHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QoA7IsSzYErQvXF8dPAOT5hchypqOHpp59sbKOkXzsSYGhioN
	nyNlUoFagJSIFDvb9t8OO/nuGV7FDcpNPCNgh39ipN3hf1Me5rfXoXMiBcj4D4QiZDJy459SFpN
	sN7t1yoC1+KD3LU2/j8dGTTb4Y/FIYDM=
X-Gm-Gg: AYBFou0UAuIdGtSBkfL22ChVxj2OSfvi5UT2BRT8lNqjGgvzVXi2OOtKc8svkFwGN48
	TWy9IfLK5+xVNywNomMtvRfYzN2xchb3Tta9Fx0ODgFf+cXPyW36o364KqDi+W8LHl3VmnC+kDU
	lHI5jgZ2Rqo0w1DDyJz3S/fcOGRRK0YlZJSWP48hDaJRVUIFWYh4tyhrW02j/1Rp5sGAp0qC+Pp
	v1cijefKHlBlpSDqbm0MlAwtYpwjK0XW2WLrns0zaDOzCvR4btpbFTBMOx9M2NA95PBM/HwlGUe
	pyovwwc2W9VvFm7pzdDKDnr80U8P90wHgzLR8S0C5Zs6IratxyznxJ7pHEqOhMfsmnK50P0knaq
	ihIqN0f1jKC0flej0LeoJBi+9Cmp7I5/qKkUEVJ3scSN2iMTFELfoDXtf9Un8Q/q0ie+VPw==
X-Received: by 2002:a05:6402:90c:b0:6b1:cd52:5798 with SMTP id
 4fb4d7f45d1cf-6b4d5fdf3a4mr14456258a12.42.1793877395601; Thu, 05 Nov 2026
 03:16:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
 <20261104-b4-ovl-containerized-sync-v3-2-8daa20144f53@toxicpanda.com>
In-Reply-To: <20261104-b4-ovl-containerized-sync-v3-2-8daa20144f53@toxicpanda.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 5 Nov 2026 12:16:24 +0100
X-Gm-Features: AclHuK-spGnE8QR5SMxi-c64TQxC-LWK8IrBlPJQdILHTMjL8cI4wsf9q4-duS4
Message-ID: <CAOQ4uxirA3FC8gukL_o-SE5dgD8LFxQZotXGMiE62VpnOosj=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] ovl: setup overlayfs' private bdi
To: Josef Bacik <josef@toxicpanda.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
	Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chengguang Xu <charliecgxu@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 9:45=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> From: Chengguang Xu <charliecgxu@tencent.com>
>
> Setup overlayfs' private bdi so that we can collect
> overlayfs' own dirty inodes.
>
> Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
> [josef: only for an overlay that tracks dirty inodes, add
>  ovl_tracks_dirty()]
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  fs/overlayfs/overlayfs.h | 18 ++++++++++++++++++
>  fs/overlayfs/super.c     | 10 ++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 444e28c09145..0ef81c7a9701 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -7,6 +7,7 @@
>  #include <linux/kernel.h>
>  #include <linux/uuid.h>
>  #include <linux/fs.h>
> +#include <linux/backing-dev.h>
>  #include <linux/fsverity.h>
>  #include <linux/namei.h>
>  #include <linux/posix_acl.h>
> @@ -683,6 +684,23 @@ static inline bool ovl_should_sync_upper_fs(struct o=
vl_fs *ofs)
>                ofs->config.fsync_mode =3D=3D OVL_FSYNC_STRICT;
>  }
>
> +/*
> + * Does this overlay track the upper inodes that are modified through it=
, so
> + * that syncfs() and unmount only have to sync those?
> + *
> + * Only with fsync=3Drelaxed.  In the other modes the overlay never sync=
s, or it
> + * syncs the entire upper filesystem.  fsync=3Dauto does not count until=
 it has
> + * been resolved.  sync_filesystem() does not write any inodes of a file=
system
> + * that has no writeback, like tmpfs, and nothing ever clears their dirt=
y flags.
> + */
> +static inline bool ovl_tracks_dirty(struct ovl_fs *ofs)
> +{
> +       if (!ovl_upper_mnt(ofs) || ofs->config.fsync_mode !=3D OVL_FSYNC_=
RELAXED)
> +               return false;
> +
> +       return ovl_upper_mnt(ofs)->mnt_sb->s_bdi !=3D &noop_backing_dev_i=
nfo;
> +}
> +

I had concerns that this is not the exact opposite of ovl_should_sync_upper=
_fs()
and testing noop_backing_dev_info here is not optimal.

It is better to set the fsync mode correctly for noop_backing_dev_info
at mount time (non-upper ovl cannot have non default fsync mode already).

So I sent you v2 of my patch with my own version of ovl_tracks_dirty().

Other than that the series looks good to me but I am lacking familiarity wi=
th
writeback to be able to properly assess the vfs correctness.

I ran fstests on overlayfs nothing popped out, but it doesn't say much
on the implementation.

FYI overalyfs fstests supports {,_require}_scratch_shutdown{,_and_syncfs}
and there are 2 tests that make use of those overlay/078 overlay/087
maybe that's a start for some test that could exercise this code.

Thanks,
Amir.
