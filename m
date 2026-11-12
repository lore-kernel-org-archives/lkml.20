Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794487418;
	b=Gvl4EDblJ9WaVpxDpFHmJD2xLCtEnd02XKze5i9RLJtV91GAuwDUlASrjtkWyOm0yXPg
	 Vloebggrr0/XARld8mlgWkneSoUdVl/YWDKwg6/SIFiNlfu1yJzMzJq3GvCZa0c4F/93C
	 dtCpCXKRxXAPqT6gYTSVZWhcNtbOPKQfZmk2JLRjOsxpUwA1f2/lL94a/t2SrTLS+k7en
	 71k40cDE+KXZwtdRPP9k13kiIxpV6aQRhz0tAMy2BZivz2DCtoHwvKomUqFWSk9Ge7n97
	 rNH4zccBTG7OIYVZXhOvADL4So4bWhNWqmaSQvlQj1fFAJd3tFNlubS9PVr8PLpKUDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xNoA4U11buox0TWTao1trLlkLV4o8ysypTPbXU9Mens=;
	b=ie9DJtqyOg5SWAI5ogDShCB9NZwFB2EnxVn1PD3YDlKA60OE2RxwsxzY8dMSbzWKDhJ1
	 IddrMPqEyAD/Ch//+1v/GOpFf/JO77D+Xi8UDY5Qy554KLtBrpG20Bj9/PQ3ZjTv2F9RO
	 AakKmMw2R/om0O3iBszcQsEOnKCnG73/WhNU+b7ecOuebyAPLxpaWasPOWN6Vxi1hWG/K
	 o10qa4UOodDHKNabf8lV31APl2ZAjQof5gQjn4n7lUKtAyX5zU5KQuxtMM7k8kqJ9ZEtZ
	 CrTPtPa2cmG5RwvpmHEEFAp8k6Cpz67fvQrC/s5vL4X1OkHXnEaeWanEJYvmsV8Ll2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjQxjVGz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B838606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B838606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjQxjVGz
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso5031288a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:43:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794487416; cv=none;
        d=google.com; s=arc-20260327;
        b=B04MPE/DFaGUC3dtlx4zdpeEqF8Tua3TBBMjjofpzDrUxvMk5S50j08lFiloZKd9u5
         kwQwWEQkcYoMvGHovH7R09rPpn4h4ACkqsuoUctOih+440/Cu0uXY7K0ZZI+SORt65NW
         xf7Nyyd4xhjNLbIMTl/HKzbaF/hzkDIJC40vQ70irV74aLS28iYrrvfBp5PowD/uUH4j
         O7Wl9vBOFEGfKch5FwDdmuMVuH87N3Qe0xk7iIP/fKjy2mnp/ugFvBZkpbJXmwndudJu
         JZrmJX+hS0Gmpm0/pVL7K731lkk0cBJABavCTDDKmPaiIeFxvrhxQEDCdhLAHiTbmvzW
         53vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xNoA4U11buox0TWTao1trLlkLV4o8ysypTPbXU9Mens=;
        fh=nryIa3VnG81/5QkDs4dHTvcAjryOOfn1nTlys8513CI=;
        b=ZmyjV+2b3+wDN19XL2m09WEDvU5Ah+dmmAVnQh67oamvcV4IFctMm2LzRTmk4g+Jrb
         xETc26MDGd/nhUwF4JmIyB99sAXCx96K4J6hujnwG/urVnR3bgQHb9piJzgMV9wiljM3
         fYl3+8hc/8ou5R0RFRhF2dzPIvGsKmymhx6+1xhzwTMAURArKpZjMNfW8z4qIUWNM80o
         fKSWglZv753UMvsX/Q4YfJjxVyHoNmnLu5MFYEPdNxYIycXN8mAcVG2dTuVMEFT8+SWJ
         bdm3mggE1TaXfNMFwaB/OUDxZ8qkMKhuqGWLTbIDZQh+gR8I2QIaC5eimEXtGnMkjmd8
         th8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487416; x=1795092216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xNoA4U11buox0TWTao1trLlkLV4o8ysypTPbXU9Mens=;
        b=TjQxjVGzhjhqp7E4klkPZ09rq43BbDlb5NXakTXgPY+pq8WU5SKf9wb8drNVm1d3mR
         7tVDNuECgw2vtpiNqkv6zYqebFP3tRwUox605HC8u52Ru+m2rni2NyjaU5H20c3jAZq+
         W5EH0grs/+TIjdZCXBP+Od4yaUmEKbOu8kicmuOkXiZa5r/U69v1er4aKN8riWH72Pm5
         dxJxiel9dmDTiouSrXa5XGYJFp7LiuQUsUHSgz+GuFHfVbmejO5zhcF2oA5uhAKLIQgf
         7bbG00diVwtI4g73hreAHYvup/D9GOSWRDTta3z3JtldsTn61JYPuFeOU4CWw0jipnwV
         GUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487416; x=1795092216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNoA4U11buox0TWTao1trLlkLV4o8ysypTPbXU9Mens=;
        b=ZPpz5dMwQI4i5wOLpPjDYN7rvOkXFG2HOEFnOzEcMWF63h7CStycmta4KHU/toTr/a
         E3P3oBiU8m8gdYn2Y4IHOhuVLJ8+Yz8RghV0UGhiNZHCJQxH5Ul+80yKlPSjOGTQKUcq
         7mnP4yR0ZI5WtJBEuJr8j3yNCli8OIctfXrGVCmUw7tevDUhmOnCqweWrqKN73oL7jkJ
         ZszShv6dVUjBykP226Dqgc9soJIjH5zwdVwPdgeY7cxIlPJOHiyJU5BrDw7avHG6mw7z
         TQXUZYInLNLboiqD6IzfVl0mX4PVc1kjZVgUn5fdKZgm3gpuohNm7JUJSCyOoK1iRwlU
         lRqA==
X-Forwarded-Encrypted: i=1; AL+hErF9QIOdU/aBX8pN39MbtNkJdQiErDlYF481PJiENp/jyGG9eI8WMOQorLUaLuyev6HzvxAmJ0hjTUA+u/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NaiImRK97nQ8dJitGXvqFqSzVRTIFcOToJxRYcs6BjH85a2JD
	EBGrSYr2E5AhcTKjyP4az+H8MBap/pCUN+sI/HsrC4TanYOxhHlg9IXAmdNl6TIEnlGvqedrUXV
	5vY4T3eWI9I7o7iE/+38KdLHhtZCn3z/dDdCZ
X-Gm-Gg: AYBFou07AFCuVCyvUcT/KYjzKbRzaCE+A5oTJOEDA8dfQ6B3q8iEMeeG+nv+INOUqAY
	f9pwhbYMzPQ8x8d/XQoUINwNiXDPub3M2El9PUiWKCB+o5zUoJfhsP2wyTglfJimo8Okk9mK8P0
	31AI6FqnC0TpAThxSD8MDmfcEDY9rfGPImiLHLXnUZsElnagFGrQ9xyF8m0doyoYDKIGck4li0g
	ActBddgRwZmTHiP7SJAQjjNfRdA0YL6W4PijdfKs5ajaBFUcL/EgKZ4NqgyXbJLTYZ1hYtBDcAh
	k1prGuLbu3Sx5FgeZOsr2DHOxJGvkiNgRTLij6uCH2xHsq5m5ZFc4GYpO/F2T4DUj0Xk55+Qc6m
	5uqpW/v82smkFVsyXvTp11gpYkBwPAfDjVNHZWyAQI8DoRN1VYMsG5KmXh30dj3AhlHRlhA==
X-Received: by 2002:aa7:ccd0:0:b0:6b5:646d:be3b with SMTP id
 4fb4d7f45d1cf-6b7773fbcbdmr2868357a12.18.1794487416385; Thu, 12 Nov 2026
 04:43:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111224227.2496049-2-Jeremy.Jean@oss.cyber.gouv.fr> <20261111224227.2496049-4-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261111224227.2496049-4-Jeremy.Jean@oss.cyber.gouv.fr>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 12 Nov 2026 13:43:25 +0100
X-Gm-Features: AclHuK-2WtHEqM4hrMJmIDeZ0fdZ5_X60kJZg_N-n2ESIxL3n3QN2L1Su0d0XGE
Message-ID: <CAOQ4uxg-EOfn5bpaiEwojAPvdR-HZqoefT2mqqkA1+e6AAZUHQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] selftests: overlayfs: reject different lower
 idmaps on same fs
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:43=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> Add an idmapped overlay test for two lower layers that share a backing
> superblock but use different idmaps. Check that mount creation fails
> with EINVAL.
>
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---

Applied with addition of index=3Don mount option.

Thanks,
Amir.

>  .../filesystems/overlayfs/idmapped_mounts.c   | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/idmapped_mount=
s.c b/tools/testing/selftests/filesystems/overlayfs/idmapped_mounts.c
> index 44a75839f4ed..b496b279ce98 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/idmapped_mounts.c
> +++ b/tools/testing/selftests/filesystems/overlayfs/idmapped_mounts.c
> @@ -498,4 +498,47 @@ TEST_F(idmapped_overlay, nfs_export_handles)
>         EXPECT_EQ(close(ovl), 0);
>  }
>
> +/* Same-superblock lower layers must not use different idmaps. */
> +TEST_F(idmapped_overlay, reject_same_sb_mixed_idmaps)
> +{
> +       char lower1[PATH_MAX], lower2[PATH_MAX];
> +       char upper[PATH_MAX], work[PATH_MAX];
> +       int fd_lower1, fd_lower2, fsfd;
> +
> +       if (!ovl_supported())
> +               SKIP(return, "overlayfs not supported");
> +
> +       snprintf(lower1, sizeof(lower1), "%s/l", self->base);
> +       snprintf(lower2, sizeof(lower2), "%s/l2", self->base);
> +       snprintf(upper, sizeof(upper), "%s/u", self->base);
> +       snprintf(work, sizeof(work), "%s/w", self->base);
> +       ASSERT_EQ(mkdir(lower2, 0755), 0);
> +       ASSERT_EQ(chown(lower2, ID_HOST, ID_HOST), 0);
> +
> +       fd_lower1 =3D idmapped_layer_fd(lower1, ID_HOST, ID_NS, ID_RANGE)=
;
> +       ASSERT_GE(fd_lower1, 0);
> +       fd_lower2 =3D sys_open_tree(AT_FDCWD, lower2,
> +                                 OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC);
> +       ASSERT_GE(fd_lower2, 0);
> +       fsfd =3D sys_fsopen("overlay", 0);
> +       ASSERT_GE(fsfd, 0);
> +       ASSERT_EQ(sys_fsconfig(fsfd, FSCONFIG_SET_STRING,
> +                              "source", "test", 0), 0);
> +       ASSERT_EQ(sys_fsconfig(fsfd, FSCONFIG_SET_STRING,
> +                              "upperdir", upper, 0), 0);
> +       ASSERT_EQ(sys_fsconfig(fsfd, FSCONFIG_SET_STRING,
> +                              "workdir", work, 0), 0);
> +       ASSERT_EQ(sys_fsconfig(fsfd, FSCONFIG_SET_FD,
> +                              "lowerdir+", NULL, fd_lower1), 0);
> +       ASSERT_EQ(sys_fsconfig(fsfd, FSCONFIG_SET_FD,
> +                              "lowerdir+", NULL, fd_lower2), 0);
> +
> +       errno =3D 0;
> +       EXPECT_EQ(sys_fsconfig(fsfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0),=
 -1);
> +       EXPECT_EQ(errno, EINVAL);
> +       EXPECT_EQ(close(fd_lower1), 0);
> +       EXPECT_EQ(close(fd_lower2), 0);
> +       EXPECT_EQ(close(fsfd), 0);
> +}
> +
>  TEST_HARNESS_MAIN
> --
> 2.47.3
>
