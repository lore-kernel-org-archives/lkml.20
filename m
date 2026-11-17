Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926136;
	b=s3HJrGBuHfzRTCcG1BDweGju5ydNDepbuBIvWzNv2LFgVCA3+oTknVpJaoTwdW/MYax0
	 7Zthv9AK/uxixEIQhVo3aDaMlJGRBQpwVw0JiS1Qgc9ShBRoWu5J9hbbf9fiLIizZBqKP
	 e3xe2DZriUEVUj2wuEWEwEulR1FXlk8MNTcK4nNXTipOJB9NZH5hDhE+Auvx5DJyFE7Wv
	 iCqOdMXhUhg6ZZpSeqzwi/pT9UCPpimyBo8VjTMkxT9ctVZfIKrJWZ2IrXkKYTe7Xux0C
	 lg9NIBUSKQv3HlVUGblvLh4HdTdvgNkWg4Vdda8kq0mwNX/bbWUr4pXLR05F+rfBdJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
	b=5jPJZ0HGgtorqi8ZUR8QI/2N7U09rWkcmOiXwhXIpTcqJujp9FCv6xr7wfn66vw7oREy
	 H1hvKdNDjLd7eHvcIIejpVxuYerPYvgYya1Vh7jnWcl33CX6lFNMdJpP0JoTAi+vKgxG/
	 OGNQYbsoClhGyVipZbEeG2U643+b0EuAUMA4T9+TKw6S8qP3qmrEGvvwg3a+SSs0oLMdW
	 OpcljUIS/lfaeeYVLlJTHl2ML/Xez3TlpyqSHbmIZ/1jSO3ygrZhzOR4z1ptZq+BzMq3p
	 y5dUFgPMqRuC+Ak+Q+m9Z7PGDQsj4Wh+2+v1UOACEw2gt1dnQ0gUpOEiTW8gGH+jnQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URmfsKnN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B600606A893
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B600606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URmfsKnN
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso725325a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926134; cv=none;
        d=google.com; s=arc-20260327;
        b=lfElpNaGY5Mo8xc9BXAOsx5RkzobNpiEeHmC53qWhPbeEhvNGJF4ot0Fh5u48+6aQx
         s5D7V6jvk1APyk1PD0LgQg9RCDLORG+HSuJdo6fyPOKZ19VjDUOpNTzGTxBSvb2V0oXQ
         tuodfPL6QgDQiaHrGnNjadvnHCUV9SS86PbE07fpIR2F6kXbcNWS9jffWCCMrzedn1Ey
         v0EpytovVmvD8172+cQ0RUjKoeYsQATI3PpuJIW+ywpX5t0ZLA/ZSzlNC1CK9DWwwhTH
         m34pLgTmTCpVPSq/cKzVgKRFLq9t78dHD8AASAsAftptp3WB4s1l1hQRtlom0ExMVuN2
         8M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
        fh=uyC47Xc8FmKHo1Kn+3SI6c+gv7krGgZMozHCt4ojw2E=;
        b=Rl/GPMltX01r9eY1/dhLm/S37sqG1FrLN0n/3ia20DGE+1A4M5pe6E9oXzFpPGeI6e
         38Fa1sxQ3kj+y7ba310wRWqTJ+x+3E+ZVBrxNxrrTmZnjxCuxIZ72YxMoFIg6l575fVk
         ASHK28BH6cWGWQWhA6/6f60SeSFBIis8AC4ZEfHpypO971Nagxp0AyJMLmcG3hxG6con
         Vs3y4guhrOXc0zPEBZg3RvYpxIP3PHe/L2LOSNFuHKfRkhEWydVNkwfpVpxuE3hpunf8
         Y+zn18hWgkhyu7UHGXs1jeVgl9gMBVAeSbF03be88nnK0FF0p/XZFCZiK/9/bbPsxfA1
         xyBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926134; x=1795530934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
        b=URmfsKnNWJSODYZrfj3c/NpMWLpE9pLm6rNI2X3ysZ7qIqhaoJiC5GieCaPi82mGtn
         cmALgIGRweZqbcX/4nSU9t5Sd7yGAyeSwUC00OBDXLEMsXK09GQO8t4Zo29ULjvYi6Al
         HK6l+S+GA+7vyo/WpBUEBAjaR3tv2GRNzV7JewrMFxQAevi0dZe9mFKoopmgsdpdOVGU
         BnOFpK0SUSQoJLXkIya5t79OX3bvHHrYXeIbSXVVmE8Dm5fXT2Z3W+RyHevDV30pL6oY
         ZhwD+uuaXvPO8SrEnbM11zfysNQhVTeKAJQ3IsfySXy0eu306VggRaS6EYvoJLP0BY6B
         sIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926134; x=1795530934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
        b=p4k3fYkyGsz+uKv5WAW3LEMSJN8ifO/NhHhSgynrad8PTyyaIbmM/Hf168yiHVXOoK
         rsP2Jin9SoaK3ZvHtxHOMidzf9JwPDv26dS4eiXFvd7Bm/qgNZIEiu2KByBrb4NUOXl7
         93hcOXpo7b7hjkNNwOP/9Zrb49qzezZBe778+JuaBa8cA8x/MGXt7O8B55v23Ns2T5jQ
         PjtjJfoNU/5ySuXD1jEsD5HnUhqwfPWL2+SqVGmgY0xbbHOK0dYNrHqOy0uJDGc+3Qq0
         JN60VrQYc227E/D0yaMOiwMrer27KEk8lBweFhMdBBoiB4swRDbIJJ1PzzeHyVUUZ/Mm
         +Jzg==
X-Forwarded-Encrypted: i=1; AL+hErFR9A4lX12+pkCX7n9z5K6d7zLapndD6JMc6wnvz3L6mob2t460/99ogjnP5c570ID0bCdm+PV1cnu13WI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KZvX3qCCZNSCZ7HEx/YeP+85EVju0ypx/NAKDYigPwx2rirgi
	wiMtT+0U7tItyv4hMT8UfKFXf7/Waoa7vTYQqbjIxNs+qMkRT/F/SlHaALGVK+VNp2EIjyv7v/f
	TL7gGI/U2n+9bOj0tgyEKKhQHrzC40+g=
X-Gm-Gg: AYBFou08puVHX5VfGpAxvnvi9SqDbH/S/DPny3jIaWzhiyyO/Y/NbJkcPmyh8BkNfVK
	sH16E9tJFk4eYAiwfaHOm+bIRU3mA9HXU86BfCJL9e0N6ebE1OVNi5BN/PPqxs2xpaPpFf6bMNr
	fFuwptuB0Uq4RA5Mxt6lY9D5q6ZBWDhZHRPFAmYrX/MC9HGXCPCKd6YCSkRp0bnQdxeAUgSPXBM
	DWHv9SUcdYhD+H3Ln0/MT/gfBfExRGVXMbHs6RH5NmuaTD51bXzN23uQQ+xILinVYjXz2ENJVLO
	txo4fLbeYrXZ8rFWccI44i2wUj08C1aT4mMl0W36hsSks5rGKq8VlKBfWxzeAttHHxyzOehdEr4
	cm/NjEDTcotR0HZa5olkCYTTwFbdG++WWaErbfRNmwLmI5H/vJvQmDctcV4uiHzvzYH00bGZkZI
	nb0YuiDrWD6N7RZFc=
X-Received: by 2002:a05:6402:2b91:b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b859739689mr2260195a12.10.1794926133831; Tue, 17 Nov 2026
 06:35:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-2-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-2-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Nov 2026 15:35:22 +0100
X-Gm-Features: AclHuK8C4CURJWV2PAqKHkl0J2MOz_Ngu3IxgsUB1ZW-CuNtY3L1YeTqpgF395s
Message-ID: <CAOQ4uxjMNxS-jtBt7w4nwJpMQXFraec2UFDRoiXoQqs9eoq2gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fuse: skip dcache instantiation for readdirplus
 names with embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:52=E2=80=AFPM Junyoung Jang <graypanda.inzag@gmai=
l.com> wrote:
>
> FUSE READDIRPLUS can pass a length-bearing qstr with an embedded NUL to
> d_splice_alias().  Unlike verify_dirent_name() in fs/readdir.c, this
> path can create a dentry whose d_name.len extends past the NUL.
>
> For such a name, strscpy() in inotify_handle_inode_event() and the
> fanotify name-copy helpers stop early.  The kmalloc() and kvmalloc()
> event-name buffers retain uninitialized bytes within the recorded name
> length, which copy_event_to_user() and copy_fid_info_to_user() can expose=
.
>
> Some FUSE servers include a terminating NUL in namelen.  Follow
> nfs_prime_dcache() in commit 78d04af4995a1 ("NFS: nfs_prime_dcache must
> validate the filename") by skipping dcache instantiation without
> failing getdents().  Return -EIO from fuse_direntplus_link() so
> parse_dirplusfile() sends FUSE_FORGET for the unused lookup reference
> and continues readdir.
>
> Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
> Changes in v2:
> - Keep FUSE READDIR and READDIRPLUS getdents() behavior unchanged.
> - Skip dcache instantiation only in fuse_direntplus_link(), following
>   Amir Goldstein's NFS precedent; forget the unused lookup reference.
>
>  fs/fuse/readdir.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 1f6cf565477f..6b2468b575d9 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -191,6 +191,8 @@ static int fuse_direntplus_link(struct file *file,
>                 return -EIO;
>         if (fuse_invalid_attr(&o->attr))
>                 return -EIO;
> +       if (memchr(name.name, '\0', name.len))
> +               return -EIO;
>
>         fc =3D get_fuse_conn(dir);
>         epoch =3D atomic_read(&fc->epoch);
