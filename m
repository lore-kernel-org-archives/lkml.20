Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716332;
	b=pKX8SG6bkedPssG1DeM6OCTtq/ohdRahjyu97kHJLgmXlFHUVP4RyVnyft38FbSgf35i
	 nC7Xp17voobJsZhqSdOTZQnAony2g7dmuc+AEnVWS7VgNCvncVK1BfShgExpRgmCv1kGO
	 zBAJrtTRQQ01JEDrrcXQSIiHbxwGzjCSqA7ii1GQdUuamdqS1aF4Lt+2OIpMI55kty+VU
	 1cw8MUYrC2pvxMaFjPN9eJeSQHVQFL7po/u4NXMd3r/X49iLFWlx1C3cxJfGdYGhkLx1f
	 gS0YwLNC9IJJ4goskTafTFbvN7638AnTHf94G3YEx54arsJ5vVNfWOmfvuw6q8ubrSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716332;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AAQh0i7jbvkpP3E62fivludhw4nryYEpLcoje4KNF1U=;
	b=x5vLgYrbjsfWr9Wsc5avdzmxXzNEjtaWMfKW1EuVDK0Dw7i6PnoJqjAmnZdFng0GVHe5
	 gjzr7jya9jbYFqj4f0JU6RcY0rACG+SF232BgZl/VKxL2mFWA/jJcDaU72fzkkXFZDmy+
	 WW5z+l7juq+3A60g3XVomdFA50u2gw72vJqZPLmQVlFqW8dT/7IDU5QCGk7G59r8Knanl
	 +YgcpEX+a17/zQyU39YecLvru/IS5FeKRTMUgTOLiHnYFnxOlRySGICY9J7tUKzaQqH4U
	 kWrrrTJWvnGSfEH2jWrhborURF/u9PvfyuiohnilVRFehteJbGX+/NpbM1GCJOJRLag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al+1fSso;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA7606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al+1fSso
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED28D1F01828
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792716332;
	bh=AAQh0i7jbvkpP3E62fivludhw4nryYEpLcoje4KNF1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=al+1fSsovOUECz/B49QVGFN4AO4QVwKaVkBqnQ/L0SN6BhPNXo3XXUYN9jSAMC9s0
	 3Slua+6Q+M1WsNMbhL4m+IAWUvhgG7WgcXjxtM9uj0sjePX95DDSr9w5K7tvox5fbF
	 Huzgk+4EKhVKsGtxCvbJnJ04T/cKTvpFXjQK6svs8EN10eqv+mi8myLjFbhhCy33Ho
	 RGSGr8BuVtwYIvfbWPy9YQqQQnwRFWmsTB2B6o89XiKu2nTET+pDb3GfmNjkbd/Ev3
	 C8/+NEyF2Kc+JW8BpomKrHm6s8vHsLBGbQpk2ltptbB8saxCEm5eCR4+4pmCvB8McY
	 VXtIOKx3u51XA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso429491a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3cpA0YceMLKPConulO2i2Im2XK1dIVLeY5a/gaN0X3ik5AYdSv0LZQ9ZvOl7Ka/FbR1rTqe8QkEI76hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH/3xdxAwEzqrnmAe/2Z9+7X14kaMGugao5HnnDhEpUBJ7xooj
	eCm5pjnb07PWmw7oWvGB5ekGHA3n1wW0SX6hx1/TbpOX/c13N5GIzDuD/aea4WJLIY1uCSAELCN
	LyHLno69kGgVL47LOrPblJb/9EQME6bM=
X-Received: by 2002:aa7:d98b:0:b0:6b3:f875:acd3 with SMTP id
 4fb4d7f45d1cf-6b432bdb4camr1142448a12.33.1792716330643; Thu, 22 Oct 2026
 17:45:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021063221.1410183-1-zenghongling@kylinos.cn>
In-Reply-To: <20261021063221.1410183-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 23 Oct 2026 09:45:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_y3hDsUB+qUm2t2CcvockVZkh4sHCieW9k8QCsMz0PtQ@mail.gmail.com>
X-Gm-Features: AclHuK9TBXmsgFBxyj4_0RYrmPjzYmIzn1LVzfdrY7oW112FOL8bQGUcDmPSPyg
Message-ID: <CAKYAXd_y3hDsUB+qUm2t2CcvockVZkh4sHCieW9k8QCsMz0PtQ@mail.gmail.com>
Subject: Re: [PATCH v5] ntfs: handle a failed size rollback in the write error path
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:32=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
>
> Keep both undo results: roll the initialized size back first, and
> roll the data size back only when that rollback succeeded.  The data
> rollback goes through the same VFS-facing truncate
> ntfs_setattr_size() uses, which also supports compressed attributes,
> and keeps the VFS size on the durable data size when it fails.  Its
> shrink clamps the initialized size to the rolled-back data size,
> which can sit above the old initialized size, so a failed initialized
> size rollback would leave the clamp in place and expose the
> uninitialized tail.  The undo runs under the mapping invalidate lock,
> like ntfs_setattr_size(), which the truncate expects.  On an undo
> failure, set NVolSetErrors(), which the next persistence point
> persists as VOLUME_IS_DIRTY, and log a message for the errors=3D
> policy.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
