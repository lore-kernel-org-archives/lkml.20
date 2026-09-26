Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18539A7F6
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405041; cv=pass; b=eu3FDeVAVQu/yXP54ZB/ZdtsC3gs/Yqi2K4WE7LjWR6F3aM/Ux63gSrBMatCZzyBQ5x2n/H+0CajbuP8bf0nvuUtcn/Nlu4ZBEJhlCSpo5OmIjH5D8g6GFOp/yRMyO5pVCIxWFAXzx2q++P1x+7a4E0qIl120UnwNLR+nPfonMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405041; c=relaxed/simple;
	bh=L/x/MsSpsPMPwv6hmc9szKtWP8yzSBXJpWyuSwDuuXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ehqk20dQunVHIyXcfpgNvSX2WetJJRsM8BhvUq0j8C1qhxUL0rKYBE2Cj71k1dhOYB7oD24cZ8I8VcUlcuSCMbs8Mu0xNOhxwQpM55sRMiqWYQOvSR/InKK7pcwey1LqvYKUosDRDYOMWUkCmFmwwAnNLy7bX8RUqgE08JYY5gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq6u1nQH; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq6u1nQH"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso137634766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790405035; cv=none;
        d=google.com; s=arc-20260327;
        b=hetWiV00K+E50jwY/94Dzvh+eFxqhsuGHRwvo0fnhwPNp+aQREqP4DtOvSgi7Rs4WR
         GRLtlZdSakCfRHB0lpYufk+nLsweJFTGNazwVmDvg0QSNfEOIlEUJLCfYRsk7m3ZIAJ9
         1ZKPdSWQCImfSXfxfyN5kEDc+srs3M5+HUF6BFvgYbPUmzXu7TxV8eu+tJDBC1JsA0aV
         9vHGC5nlLaa9FW+sqNhqO5twTliC8lF3aSRPjzr4NgF7e+YNXzriFv0zdjH6Yzvju12U
         bx4c4/fCWKYaYPB1Hv/LUKGMwU5DeHkSjGxlVwIuYqeIv3eksOSWMB/wYyXwNXbXsvok
         GopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m19pIzxq/CLGg8+DYWn+q04ehTCniHZwasxO+AvM9gw=;
        fh=9NZvpeAj9Q8V9iIJJZJcE3OV6IARxHxov+Z4t44ioZA=;
        b=O/+3DXqEgkqwl8KlSjMEcVgK59KbatxKzUi/HjReQAZRbUxImQJBawyV/s0u6395As
         5GWhqm1rQtXIMVl88lybztsp3c8ZzzkgJt4eE4k8ycsl/4iZMtv3+bh8lEaGHwcGLs7c
         C4JQepQrD6QqN8Hm54xn4eX2GkrA+nh22K+RX0hpT1Y8K52p+qUN5Nl+TiSV4VEtle4x
         GtHZCHXbkz6gpikpiZe/oFGRkXZnMbzR9mWgya1Bvz3zCsH0zSqfnLreEZnmtiB6S+kB
         Rj2wOYyRH4a79Ee+L3pXdQQG5Jwz4DGnikkD4GmvOry3l3viocHrHDrn8UN0lDhx5uFY
         C6Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790405035; x=1791009835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m19pIzxq/CLGg8+DYWn+q04ehTCniHZwasxO+AvM9gw=;
        b=jq6u1nQHEYh8t9O/sL0lF53go1obYIzbU7c7HNlYeQH6JvuJRyEJSUrjEB/vOwo5qn
         uesatFnTPfnN9YvYFfBYym7F7JiJRFYkhGITALnNd7wAiRc05YDg4c2dm7GCqBh847BN
         y/exse6jDQyJdgVdzyMDoQu7q7oGTaFCqvoms74GWosmPkhj74h2bzkmK4xF9F6NvKqG
         GoMxX56VXXgRkRvvT3WP7p1PwjsPBmveAxnSTuBVUM3vPcfsLEPQrCulGfBQwlw/zIq3
         oUQjLs7hMkYMA6mxlhE1ypwRyDOfoyXnM0I7O63VKA41BHrDa6luVp51BfAEmALjmToN
         EPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790405035; x=1791009835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m19pIzxq/CLGg8+DYWn+q04ehTCniHZwasxO+AvM9gw=;
        b=07HWU/+1xhf0JkpqHTaIwZcqzgerFIRAKU0E7xQSoNHEQxlHZFIEsZJs1ISsiC+DYq
         8emn5I2eKrAjLwn/cwOJgGxrRcZmIugBt7mryiK5rXnuIDOr210IkAXP8xU745HNhPKc
         0narW6s7Korp9Rl9IKa/fwh2ZKFxDHroKBMJTRS+yBmNjMr9wYemFul2ZTuuMmtsOOqy
         NNTGJdPO1Miz/xw01toJiD0gXvyodfD248qsBe5AW3E3RZ4G7FnCDXVkWmuUvAWWnh8i
         wDwLaul/NYXLU6PVSEj/sSv2gJ+w2TACCKBU6M0lRBwA7FAsYQ0gV7r3J3CIzsSaL0Or
         Phng==
X-Forwarded-Encrypted: i=1; AKwUvBxgH8yNU7YVO5NVe39mZlhP0HlQ4THAaa7FROt3Cm3zeHJAGjfNaBlkd2fNcUdo2Z6PQQeZqMqGesFinQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mIB5twJtDJ5MZ2Rigyb35jQ7fcm7XBLUz/nieTdcfxXBylwZAG
	qUZHweUqVD8J+XCXtvu+DGtyMywOo7egyWEkSdlVzGYuPwbiJ3vTVFFfvlKozjxfpvOm+Jioa4x
	JPhruRyzLR3LNNvWEPxdquuwv0EQ71k8=
X-Gm-Gg: AYBFou2DzhP/mXMlumTms/4TeYKhSWYfAxMZdhk4Y1HagLhxvNyu5cfmOI+dZOXm3g5
	19+Iz9Ynjfs4JhwymBwFreWtmfkx/gpgwEMJcez5vU6l43fFA+rH/2YTvAfUbqF/xoKFsODK5AR
	qj0PWfwc+fFGszL0uz5hPd4Hqn/P5N6afvzu+RGr/NUSKpupNp0/7ZNkNR/9g4kvE/y20rl+9LO
	l/mJYGpKTqTwOiDI8GLSfBxAFpe+cZRUGjLVM0pIZ5g5V8lyll1asCcaibuUwkIE3wHCN5ypFX1
	rCdSTp0tKhRacQOYdGqg3CamMHjbrJbIvhyVJToaiuohEIEdXZ+vPvb4dMdVq0wKokEiQw3O1Ku
	fAZ4iZDLnZObxHan72ATyaQM=
X-Received: by 2002:a17:907:d408:b0:c29:3821:ae6c with SMTP id
 a640c23a62f3a-c2ac2606943mr702009466b.37.1790405034922; Fri, 25 Sep 2026
 23:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922122955.69433-1-fangxy@xiaopeng.com> <20260922122955.69433-3-fangxy@xiaopeng.com>
In-Reply-To: <20260922122955.69433-3-fangxy@xiaopeng.com>
From: Jason Wang <jasowangio@gmail.com>
Date: Sat, 26 Sep 2026 14:43:42 +0800
X-Gm-Features: AclHuK8xFsvc4j73hXtI-ilJ3XzgO5FqQXk1LCo83q1Fcp__nagIQq7skCOkqq4
Message-ID: <CAAf7B_NbjMu-9CEPwN2HD8+P=L4Nkk=tYO7Ga5-dHq=CVneBwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vringh: add regression test for cyclic indirect descriptor
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xie Yongji <xieyongji@bytedance.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	stable@vger.kernel.org, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:30=E2=80=AFPM Fang Xieyan <fangxy@xiaopeng.com> w=
rote:
>
> Add a case to tools/virtio/vringh_test.c that builds a top-level
> indirect descriptor whose NEXT points back at itself and checks that
> vringh_getdesc_user() rejects it with -ELOOP.
>
> Without the preceding fix, the walk re-enters the same top-level
> descriptor without making forward progress: count stays flat, so the
> traversal limit is never reached and -ELOOP is never returned. With the
> fix, the top-level count advances on each re-entry and
> vringh_getdesc_user() returns -ELOOP once the traversal limit is reached.
>
> Use index 1 rather than 0 for the self-cycle, since returning from an
> indirect table is only performed for a positive up_next value. A
> self-cycle at index 0 would instead terminate the walk and would not
> reproduce the bug.
>
> Assisted-by: Hawkeye:GLM-5.3-flash
> Assisted-by: Qoder:Qwen3.8-Max
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>
> ---
>  tools/virtio/vringh_test.c | 41 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
> index 84961b9..2a5d7f7 100644
> --- a/tools/virtio/vringh_test.c
> +++ b/tools/virtio/vringh_test.c
> @@ -458,6 +458,8 @@ int main(int argc, char *argv[])
>         int err;
>         unsigned i;
>         void *ret;
> +       struct vring_desc *ind;
> +       char *data;
>         bool (*getrange)(struct vringh *vrh, u64 addr, struct vringh_rang=
e *r);
>         bool fast_vringh =3D false, parallel =3D false;
>
> @@ -755,6 +757,45 @@ int main(int argc, char *argv[])
>                 vringh_iov_cleanup(&riov);
>         }
>
> +       /*
> +        * Regression test: a top-level indirect descriptor whose NEXT
> +        * points back to itself must be rejected with -ELOOP instead of
> +        * looping forever. Use index 1 rather than 0 so that returning
> +        * from the indirect table re-enters the same top-level descripto=
r.
> +        */
> +       ind =3D __user_addr_max - USER_MEM/2;
> +       data =3D __user_addr_max - USER_MEM/4;
> +
> +       /* Fresh ring and host state; resets last_avail_idx to 0. */
> +       vring_init(&vrh.vring, RINGSIZE, __user_addr_min, ALIGN);
> +       vringh_init_user(&vrh, vdev.features, RINGSIZE, true,
> +                        vrh.vring.desc, vrh.vring.avail, vrh.vring.used)=
;
> +
> +       /* Single-entry indirect table pointing at valid data. */
> +       ind[0].addr =3D (unsigned long)data;
> +       ind[0].len =3D 1;
> +       ind[0].flags =3D 0;
> +
> +       /* Top-level desc[1]: INDIRECT, and NEXT loops back to itself. */
> +       vrh.vring.desc[1].addr =3D (unsigned long)ind;
> +       vrh.vring.desc[1].len =3D sizeof(*ind);
> +       vrh.vring.desc[1].flags =3D VRING_DESC_F_INDIRECT | VRING_DESC_F_=
NEXT;
> +       vrh.vring.desc[1].next =3D 1;
> +
> +       /* Publish head 1 on the avail ring. */
> +       vrh.vring.avail->ring[0] =3D 1;
> +       vrh.vring.avail->idx =3D 1;
> +
> +       vringh_iov_init(&riov, host_riov, ARRAY_SIZE(host_riov));
> +       vringh_iov_init(&wiov, host_wiov, ARRAY_SIZE(host_wiov));
> +
> +       err =3D vringh_getdesc_user(&vrh, &riov, &wiov, getrange, &head);
> +       if (err !=3D -ELOOP)
> +               errx(1, "self-referential indirect: %i not -ELOOP", err);
> +
> +       vringh_iov_cleanup(&riov);
> +       vringh_iov_cleanup(&wiov);
> +
>         /* Don't leak memory... */
>         vring_del_virtqueue(vq);
>         free(__user_addr_min);
> --
> 2.50.1
>

Acked-by: Jason Wang <jasowangio@gmail.com>

Thanks
