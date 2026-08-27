Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0354456286
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834984; cv=none; b=cQkNLD6mJxjp0aaw7VofEhAADltNJ41kmadI6WJ83GZMlT+mXE3Yelgtt8VYwfCsSpImgQp8OtQO7Jht7meyYDYPkAWmb577o8KYeETZp/htyg5+YLxYDiteWTxU8IkOCxiY6+SSWU4CsQWVk8VZlxXYSneb9WgO1zY8SyfqnUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834984; c=relaxed/simple;
	bh=yKCPTwcn1Usks+ClmSapEiuKubRHc2NxhIPyl2cmL+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2sQUn3CJp/iwrV3pSEB2Jc9ydJOXN7SsSAf4QpgEm7Egjy+a1BGdZpIYR+F7tsDRFMc8uIiO6E3yHH2ZJplNEiCYSPJnyjqNW6iXiEnWIHmpxphD47jz76/P1ynl7z/VHuEZJJC1cRFm5VHs5/j9WaOVE2Z/lZkP/33TT4g93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C31hv57S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C31hv57S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCBE1F00A3A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834918;
	bh=yKCPTwcn1Usks+ClmSapEiuKubRHc2NxhIPyl2cmL+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=C31hv57SPL5r8e7nMPv15pa57vs8FnW2Sd4uglsbPGwXiKUmCP3spo513PwxeMvE4
	 JEfqyMBwGHHrpcTgyp/ZQkN3pN+e/KKGCMwtttQ+mfCQBZ2BEUdj4tX71jXTTtP4VH
	 BttFCbVnERdNZuex/ikHkgFh6YCDOqk5ifK+/sONMcRrtiolfMNI1XAQxXsWlAVKus
	 +37AjakF5biwuQIxISr0DEl1XjDr6kYHPiuCsUF4l1EKNWrEnzFz5q3g0XZ9lSX4v6
	 SCunAdQO++JpKIJSw/5Arbs0TpvMIUgEALWEKq9QVB6+s5ONOqBOrYBG5nhCMqYpno
	 YPwqn19I3NCYQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so3782979a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6rdYVTsBJ5bWGrNV1ajVRyejXTlibGxMh4IV/3jgjRJpwiXnmY/CxXkIwOZGowxyivf89TBpORF0Oe1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nd+E5s03d/ThQFObhrFeRlz/fAyfnOSOhtsMaNpZlJY/p5h2qC
	SE5iHAclLAW5Vbdn/NOxFT1gJFfcJyqBExtoV3X0kcSLMMxeOLrT37T2c2C838xdBm0YyiDJ2Dx
	5MTYaV8lhL6sGRWlJbw2j1BPTB5N04yw=
X-Received: by 2002:a17:906:eecb:b0:c24:82b9:361c with SMTP id
 a640c23a62f3a-c250c3935b3mr1646579266b.17.1787834916600; Thu, 27 Aug 2026
 05:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a8a9d9a.fdee0002.34cbe9.559f@mx.google.com>
In-Reply-To: <6a8a9d9a.fdee0002.34cbe9.559f@mx.google.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 21:48:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-h8aUMgipB-3fXUpNnbO=u4dE7+NRRGQZ5OdHn-_xO0Q@mail.gmail.com>
X-Gm-Features: AcwNN1WbE1-hlqOzH0kDbv7P2c5vowcHzUDu8iIZI140vB7ZZynzLyL04mRjB-I
Message-ID: <CAKYAXd-h8aUMgipB-3fXUpNnbO=u4dE7+NRRGQZ5OdHn-_xO0Q@mail.gmail.com>
Subject: Re: [PATCH] ntfs: compute bi_sector in 512-byte units
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 4:13=E2=80=AFPM Dennis Tighe <dennis.tighe@gmail.co=
m> wrote:
>
> bi_sector counts in 512 byte sectors and not in multiples of the
> volume's sector size. Under "normal" circumstances (with 512 byte
> sectors in NTFS) the current code works as is; however, when we have
> a 4k sector size on the volume the current usage of NTFS_B_TO_SECTOR()
> and ntfs_bytes_to_sector() end up converting to the number of 4k
> sectors after mount.
>
> Reads work today on 4k volumes as bdev-io.c as performing the shift
> correctly inline. With writes, we end up with significant silent disk
> corruption on these volumes.
>
> This fixes changes to use the new ntfs_bytes_to_bio_sector() function
> everywhere we're performing this calculation (including the existing
> read path). For the change in inode.c it removes a dead code block
> rather than updating.
>
> Fixes: 40796051991d ("ntfs: update in-memory, on-disk structures and head=
ers")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>
Applied it to #ntfs-for-next.
Thanks!
