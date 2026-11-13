Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573279;
	b=CWy4HXOFT2lFUV7qdsJAS2ttDZSt8aDhzSDQNGFkei+sCfXgaoDm4vmdZqhn47Jx8diY
	 aQffwnGn3lXsbv0Yl6+s+ks191p4iqjP2gg0uv7I3hqe6zKG8v2ic8Y7PGMvk/SIoPeUK
	 FlD+SrWcW8V6vHI2DcGw0D3MZOdz3WOjyajMpSyTTLa0+GK1Y0vlgOHTkGRDkBe6Vl/Mw
	 Te4TqHGw7kmFNPaAKRAvpOUKkI4yotw/bMOkSy1D5kc3eEcVIUyiKqpM+xoElf2M9Q1Ut
	 aS2DwG/s/cvmD+9u6P48o9kFXc8IPCKMcMYDAuRamh/kkbH1wbu+VwGWqt6iGnH/7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573279;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BKXgEbrCq6fjyJzmt7uyeMsKlUcOMIVL4E1Y962hiaE=;
	b=bIIGyx3uwL/IKaaA978kBIMka242J7hPLKuP2704W2Zw70n8D18/kPVtYdEA5DpEUivP
	 gRjW61116R99MhkAryTOhxyYfJ5xyi+2ABzxxteJj1x0wwriTlrP/aCJa+rPcukgabur4
	 ztlfze/wAx33HK5YgQjEHK2zz3x6lbZNYDAgbywE2HaD8uZPIEt6u7/t3o7YgHS+LlKBl
	 zgM5gzVvlLCn73Bg0s21SfNrsiFtij8NPQI8iwTeWdzcZ0DkWDfjjF1GMm8JxNE/FPxae
	 UVfsOd/WLgqt9iTTmcwXQmbTurRcQIv6iAEt6Vg2HD528OOUG2VsvlRbl7xrmtXR44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W75MT3i+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27170606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W75MT3i+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A7D1F000C6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794573279;
	bh=BKXgEbrCq6fjyJzmt7uyeMsKlUcOMIVL4E1Y962hiaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W75MT3i+hx0dL5mhgFj2Hx4U3pwxoDnlsi8JyjD5FPw6aY2z8veFL5RohzrcLAkA/
	 wMbZcP4szlTsDkJjUQeQNhucW4JqATAoHVWYVnrS0Jq/8rWZ5mdhWmhLgXBcj0d8ZW
	 +GvnoaBwW7C5BIk4VDrZJIosD0bHi+UIjbl5VPPneBNTmvPX8V+nsWo20cDJo4GqfJ
	 B3QnLtCFSeZNe25Twadz/19RvbvETm2kMj4BVksoqjf68PME0IRLYkT6tlG0yrX6S7
	 JOeswx2mvlcGR+o0moadKgxA0v7su2vS+sq4Hm/JCfg7fDLxrDTNTLqSZgZbnK0S+4
	 PUlDLnn5s2FrQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b37c7d767aso6323937b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8R5qP035R+J+ILDC6XI8TzV273GrmXXKWqpJlSyJF2fczaa06YRC3OS9xSrxoMq04m5HLRlQewHGjCpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NuEDYjEhorO0Mg6NivddqH/rHKyTSbmzbPVpB8VWi3uce1iR5
	vviZ2hMqYx/qIy2oWJpb3OTQV2r4PD+WVor2Nqj/r496dlPQT0ohSTVf6cCQfwQrOr5p0dNuYX3
	DSQ0nilfF18qW4R3BYX80M0BLbr7d9Ss=
X-Received: by 2002:a53:ac99:0:b0:67c:fa4:a5b1 with SMTP id
 956f58d0204a3-67d897064c1mr1072575d50.113.1794573278285; Fri, 13 Nov 2026
 04:34:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_BED06C76C024128D13E6854C2FC31BF48A06@qq.com>
In-Reply-To: <tencent_BED06C76C024128D13E6854C2FC31BF48A06@qq.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 21:34:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-TyDN515MbXDh80LoMSgAKOybHOGc7u7Z3jp-FFBE7iA@mail.gmail.com>
X-Gm-Features: AclHuK-TuIfZZXwI0PrQLPteNRVtbSAXHZq4HOFEaAZMk1Haq12FKu7MnI9ge6U
Message-ID: <CAKYAXd-TyDN515MbXDh80LoMSgAKOybHOGc7u7Z3jp-FFBE7iA@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: don't let a fatal signal interrupt metadata reads
To: xkeyC <xkeyc@qq.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:26=E2=80=AFPM xkeyC <xkeyc@qq.com> wrote:
>
> read_mapping_folio() returns -EINTR when the caller has a fatal signal
> pending while it waits for the read it submitted. ntfs reads its metadata
> through it and treats the failure as a volume error, so killing a task
> that waits on a metadata read turns the volume read-only with
> errors=3Dremount-ro. A read that is part of an update also stops the upda=
te
> half way: killing an rm can leave clusters allocated in $Bitmap, an MFT
> record in use without a directory entry, or a directory index with
> entries that point to freed records. Killing a mount makes it fail with
> bogus $AttrDef and $UpCase errors, or leaves the volume mounted read-only
> with a bogus $MFTMirr or $BadClus error.
>
> Add ntfs_read_metadata_folio(), which waits for the read uninterruptibly,
> and use it for metadata reads. Named stream contents, compressed data and
> the read-only bitmap scans through ntfs_get_locked_folio(), whose callers
> do not report a volume error, keep using read_mapping_folio(). A named
> stream write that is interrupted that way no longer reports a volume
> error either. A killed task now waits for its metadata read to complete,
> as it does on filesystems that use the buffer cache.
>
> Closes: https://github.com/namjaejeon/linux-ntfs/issues/98
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Fixes: 5218cd102aec ("ntfs: update misc operations")
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Fixes: 8506a8031ebf ("ntfs: validate and reserve bad clusters at mount")
> Cc: stable@vger.kernel.org
> Signed-off-by: xkeyC <xkeyc@qq.com>
Applied it to #ntfs-next.
Thanks!
