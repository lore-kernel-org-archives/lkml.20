Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792603079;
	b=T2NyeRzX5hg2G2DRsunkh1oTpqiNYUTBQjc4WEahBvfb+J++4T228T1YFdrl7PzSOdN0
	 uKPAXPw8lFnjxGtK9c/IWHBsovK1zMlm6ku2yIMutemaRSrzlVXy0rN6rkNqjG96ZJXTh
	 74dCc7GOHtwM2iVsDuVo2hSZTbYYdDWeKDZZJKqBFNizelHAQTrJdgtnDn3l+6UzNM4ZQ
	 VowkZyomV3wYDGe6lVMBokZyJHfA59aXxoMip+koQ7hVWF2CudR5xiywXTEr/PKANy15r
	 jrTKrH9kyJh5lD7tcDokvS/TEGw8i2W5V1HW0b03ByDzWLFJ9igY/NB+LvqOsTVOakw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
	b=CJ7nwzJxqOaAo5bFWxEeOL3RuMKva/adKvRl0KvuAFrgsCmr5qRNLIjvrK9PEzOE9K5v
	 LlWeZ5j4/VbC7uz6qmEJu6Pis4MQfj8Z07jpncQzJKxxowgs6Zr6Ibop/G9LNJlR8BtzT
	 fFw8Vb8Lpd/eXDcHoWy88IrSPkfbBh1PnM0bd0zJR8/0PR+3zyXft7EtA2l2bQWcO4rM+
	 yIbxkT+bB+1KApaLwxdXWhNEP6zspyvqzL6a/UwjFww7MwSl3eKfDQV7o/aJFmX472/UD
	 KCy4H8pvz/IhbuxLuCC9QesrLaT8YDypPIg2knQw/NDaILDLJtXpdtzEwY82o82FElg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RnntubLz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8B606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C8B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RnntubLz
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3fd91337baso138587466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792603077; cv=none;
        d=google.com; s=arc-20260327;
        b=Qa/jXSwAihow7VD2JbDbUNKBXinSnywncaoYWW5Mb9kR5QHieQWdpKfjNExxl34kJc
         8rhE2qodpt+GXs1snrlDy9f+Zur8tnz3/J+rTst9L5AvZQxNbXj8V8QeVd7jNjYV1ykd
         5kauidShozjI3CBnkOMk/M3nQGivmvmahdkUAUNNvxJn8ADLXxwTzbdCB1r4M1PepvUR
         CKZhCnbCbEh1ALegEHP5+XZP+DP4f7j2iqmujxIKvUxZB9HFvUdU1067wcAuhmrh8Ph/
         kEMcFk7OtNw1fvHMeJ/UM2PKJnMqs4HugQJxP/g9DL1rJTe8lU09ee/rbS7wOIoEq4OY
         IGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
        fh=KCA1iewh/Co4SnA9Wz9kaTJEqQDpBep6lzxteT/CVPc=;
        b=A1HxlzrUSvA0PikGpDS24TU7z58kGYDLpmQC/5qeNvIMIID2AmNEXhfDzUo4qhxZbc
         oqOsT2mmTIbd9OrhWl86WZWyPdZ8Hwpd60kAptgaZMpaHZsFNfv5ES8QN5j3SLK5TCCF
         AFV6wE9mOTFbIBuQdW+o7qwXEmMlu7NFvEBKDtOh/wWpw4pG1W7naojD0tY4tamC1M4n
         CLzMOZAruOInrMYRZJlA+3GnyWaLZ+UU+A+sOgL1RtTK1YbkNWmEiGtXbmX9viC3M95w
         4T62p12T4FD2MIdLFE0qNii6OrlPuvRemgQsR5pybuZmH0NAxZ7xeig7TVfWEQAmB/z9
         sPSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792603077; x=1793207877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
        b=RnntubLzmvRqDzQZtAvafVhQR/S5BCx0gkEM89FBs/AgnkkFXqnXGhgLMbtmtcyUvj
         v0iaUF3cv5a7ZAq4M9cK+YK5wayhvCYAM1/emDA5E6s25q5GDYwmvz06Sbn680TfDl3M
         g3MI4M78GywKo1QeouQsAMZp5BmkmuUIHOcL7gx3C03ux/5EBVZAwQ1OoAcdHDgs81Rs
         lSsuvWXc/zJnf64HVhkBOX/qvJYyFs5V4CiF/umf7XKgwo6PRPk1+H9AwmuxuNDo2WQ3
         mVV2Fcyy773ICTh77VRKvqKyoLtSRyUrnJVvP3b9tbHENh28QCRfyvYzS92keqNk6SM7
         se7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603077; x=1793207877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
        b=Jzgf0cHTjVdX4dJfVFnqOHDaD2fCiR/VZtu3ZEODSD8//nkBFRm25IHD+NMFtLU7Pe
         mEWCjq8k9mQ8mw3XA+VMVwUcEjAC1XuSyCk1IUi6dv76XITrSOXjH+WsY3T6vYf+TMRP
         /nnoL+PxbfG1U53tDQdKzaj27WuSTjoOYtYTkhH8AXP3d9qqvV/hJqyYNuleWPBU5Oo5
         xlOmPZBBbT+OVmkd2wgMPJeVyF262e3qp1Ow3IeRQsUPbRPtgmD9K4D71syQD1lfth+w
         mVaWQd29hnBLMyGDBzuuzfOb0uxdw/nYCiEjLkWeHypYoFpzHVmEdNGwrqCFTY3FceGv
         xWVw==
X-Forwarded-Encrypted: i=1; AKwUvBykweRuQKF5RWWMD/30nTDHueZQUz8VYUZ/38CeBwDfEjvQ5UCegmwi9/M7dpLnmorXA5ijS4sl4+2sOss=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCbI8arEQoF1Uq6jNQqLp2JvErahhXyAd9RfKlImbWq9qmLXoA
	GEYEkR6V0fAuM6YPWZnX0aOKd41O9BJlO9Mb3UCgn1O0/RmR3PG1yMzQ0gN8qA4yB79ojmSC6Cs
	x3P0t3l7u3Pw/wdwWYcCCzrFWjy1IekX5ff5ladBM5w==
X-Gm-Gg: AYBFou38a0E9Uarg4sxAMNJ34TX25B48xrVEalYKPuhwwoo4m9326YbLvzNdYyqJq3A
	/Ze1y9LpI3V9JWwUEFONGivP5CTcwa1CQ7eJD9MbG1wPsDMmQ2iWZoyjX4JUyMMp1OY4bqusNk6
	FsMwPSWN8w8/Nj0Jo2QGPP9dLFPb9/dRWFTAy5LqcAB2u5dcXgdTHzwEMqv5R7DxYnIm9FyT4cL
	Vfgbdoq/i9ECa8R+Vn02VdsLmH7/i1BBGoFq00Bjfx6OGB0GgQoUpCHs2HfMBfyaW2zf8g0h2sy
	9/IAA+GAc3NCin4xlpDczjW2UHpmmS3ksE1cB3VyCfUG7Ry0OykdNiyD/7XUM4N4wzLHD30dyYk
	eC4hEVmp0eUxb3a7zO2INGWt6yIKv+fA2fEE8DiZM5VDjWQgQXhilCDUxIyQ0gj11m7o=
X-Received: by 2002:a17:906:f597:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c4678f7c6cemr225893866b.0.1792603076743; Wed, 21 Oct 2026
 10:17:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-3-tarunsahu@google.com>
In-Reply-To: <20261021152527.375070-3-tarunsahu@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 13:17:19 -0400
X-Gm-Features: AclHuK-IkiswuL9j-om2-Yvi6ZhWxvxntziJi6QKVuLB1ELR4YcI0vWO7hzjpeA
Message-ID: <CA+CK2bCnS8wcVDbOymBGeJB6pDUkknOpF22EynbwSV=D5=J4ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] liveupdate: Select file handler by name in the
 preserve ioctl
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	David Matlack <dmatlack@google.com>, jgg@nvidia.com, robin.murphy@arm.com, 
	loganodell@google.com, oupton@kernel.org, kevin.tian@intel.com, 
	alex@shazbot.org, dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, 
	will@kernel.org, Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, sagis@google.com, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.com> =
wrote:
>
> Currently luo_preserve_file() iterates over luo_file_handler_list and
> picks the first registered handler whose .can_preserve() callback
> returns true. When a subsystem introduces a new, backwards-incompatible
> file handler alongside an existing one for the same file type, userspace
> has no way to choose which handler preserves a file descriptor, nor can
> the kernel keep the existing rollback-safe handler as the default while
> allowing callers to opt into the new handler.

That is not how it will work. If we are in the .can_preserve() call,
it means the user has already decided which file handlers to use. We
need to do that before any preservation happens; otherwise, we could
run into conflicts on FLBs i.e. FH of different version require
different FLBs.

Therefore, there should be a luoctl call (i.e via a new ioctl to set
compatability) that provides the kernel with the specs file of the
target kernel we are updating to, allowing the kernel to select the
compatible file handlers. Since .can_preserve() is called when the
user is already preserving files, the specification must have already
been supplied, or the kernel should fall back to using the default
(i.e., latest) file handlers.

>
> Append char handler[LIVEUPDATE_HNDL_NAME_LENGTH] to struct
> liveupdate_session_preserve_fd immediately after token, keeping
> IOCTL_OP min_size at offsetofend(..., token) so callers passing the
> original 16-byte structure continue to work:
> - When handler is empty (all-zero, or zero-filled when userspace
>   passes the 16-byte structure), luo_preserve_file() selects the first
>   registered handler whose .can_preserve() callback accepts the fd.
> - When handler is non-empty, it must be null-terminated within
>   LIVEUPDATE_HNDL_NAME_LENGTH bytes (returning -EINVAL otherwise);
>   luo_preserve_file() looks up the registered handler with that exact
>   name (returning -ENOENT if unknown) and verifies that its
>   .can_preserve() callback accepts the fd (returning -EINVAL if not).
>
> The retrieve ioctl is unchanged because the handler is identified by the
> name stored in the serialized payload from the source kernel.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  include/uapi/linux/liveupdate.h  | 12 +++++++++---
>  kernel/liveupdate/luo_file.c     | 21 ++++++++++++++++++---
>  kernel/liveupdate/luo_internal.h |  3 ++-
>  kernel/liveupdate/luo_session.c  |  7 ++++++-
>  4 files changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupd=
ate.h
> index 509c6236720d..2413b19dabc1 100644
> --- a/include/uapi/linux/liveupdate.h
> +++ b/include/uapi/linux/liveupdate.h
> @@ -126,9 +126,14 @@ struct liveupdate_ioctl_retrieve_session {
>
>  /**
>   * struct liveupdate_session_preserve_fd - ioctl(LIVEUPDATE_SESSION_PRES=
ERVE_FD)
> - * @size:  Input; sizeof(struct liveupdate_session_preserve_fd)
> - * @fd:    Input; The user-space file descriptor to be preserved.
> - * @token: Input; An opaque, unique token for preserved resource.
> + * @size:    Input; sizeof(struct liveupdate_session_preserve_fd)
> + * @fd:      Input; The user-space file descriptor to be preserved.
> + * @token:   Input; An opaque, unique token for preserved resource.
> + * @handler: Input; Optional null-terminated file handler name (max leng=
th
> + *           %LIVEUPDATE_HNDL_NAME_LENGTH including null terminator) sel=
ecting
> + *           which registered handler preserves @fd. If empty (all-zero,=
 or
> + *           omitted when passing the 16-byte structure), the kernel sel=
ects
> + *           the first registered handler whose .can_preserve() accepts =
@fd.
>   *
>   * Holds parameters for preserving a file descriptor.
>   *
> @@ -152,6 +157,7 @@ struct liveupdate_session_preserve_fd {
>         __u32           size;
>         __s32           fd;
>         __aligned_u64   token;
> +       char            handler[LIVEUPDATE_HNDL_NAME_LENGTH];
>  };
>
>  #define LIVEUPDATE_SESSION_PRESERVE_FD                                 \
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index fb81239bedf3..be20e0f1e0aa 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -207,6 +207,8 @@ static bool luo_token_is_used(struct luo_file_set *fi=
le_set, u64 token)
>   * @file_set: The file_set to which the preserved file will be added.
>   * @token:    A unique, user-provided identifier for the file.
>   * @fd:       The file descriptor to be preserved.
> + * @handler:  Optional NUL-terminated handler name. If NULL or empty, th=
e first
> + *            registered handler whose .can_preserve() accepts @fd is se=
lected.
>   *
>   * This function orchestrates the first phase of preserving a file. Upon=
 entry,
>   * it takes a reference to the 'struct file' via fget(), effectively mak=
ing LUO
> @@ -238,11 +240,13 @@ static bool luo_token_is_used(struct luo_file_set *=
file_set, u64 token)
>   *         -EBUSY if the file descriptor is already preserved by another=
 session.
>   *         -EBADF if the file descriptor is invalid.
>   *         -ENOSPC if the file_set is full.
> - *         -ENOENT if no compatible handler is found for the file type.
> + *         -ENOENT if no matching handler is registered or accepts @fd.
> + *         -EINVAL if the named handler cannot preserve @fd.
>   *         -ENOMEM on memory allocation failure.
>   *         Other erros might be returned by .preserve().
>   */
> -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
> +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
> +                     const char *handler)
>  {
>         struct liveupdate_file_op_args args =3D {0};
>         struct liveupdate_file_handler *fh;
> @@ -266,6 +270,18 @@ int luo_preserve_file(struct luo_file_set *file_set,=
 u64 token, int fd)
>         err =3D -ENOENT;
>         down_read(&luo_register_rwlock);
>         list_private_for_each_entry(fh, &luo_file_handler_list, list) {
> +               if (handler && handler[0]) {
> +                       if (strcmp(fh->name, handler))
> +                               continue;
> +                       if (!fh->ops->can_preserve(fh, file)) {
> +                               err =3D -EINVAL;
> +                               break;
> +                       }
> +                       if (try_module_get(fh->ops->owner))
> +                               err =3D 0;
> +                       break;
> +               }
> +
>                 if (fh->ops->can_preserve(fh, file)) {
>                         if (try_module_get(fh->ops->owner))
>                                 err =3D 0;
> @@ -274,7 +290,6 @@ int luo_preserve_file(struct luo_file_set *file_set, =
u64 token, int fd)
>         }
>         up_read(&luo_register_rwlock);
>
> -       /* err is still -ENOENT if no handler was found */
>         if (err)
>                 goto err_fput;
>
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_int=
ernal.h
> index dac6644bfb18..911ffedec9f3 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -101,7 +101,8 @@ int __init luo_session_setup_incoming(u64 sessions_pa=
);
>  int luo_session_serialize(void);
>  int luo_session_deserialize(void);
>
> -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
> +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
> +                     const char *handler);
>  void luo_file_unpreserve_files(struct luo_file_set *file_set);
>  int luo_file_freeze(struct luo_file_set *file_set,
>                     struct luo_file_set_ser *file_set_ser);
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_sess=
ion.c
> index f48e9a4185f9..194ef45907c1 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -266,8 +266,13 @@ static int luo_session_preserve_fd(struct luo_sessio=
n *session,
>         struct liveupdate_session_preserve_fd *argp =3D ucmd->cmd;
>         int err;
>
> +       if (strnlen(argp->handler, sizeof(argp->handler)) =3D=3D
> +           sizeof(argp->handler))
> +               return -EINVAL;
> +
>         guard(mutex)(&session->mutex);
> -       err =3D luo_preserve_file(&session->file_set, argp->token, argp->=
fd);
> +       err =3D luo_preserve_file(&session->file_set, argp->token, argp->=
fd,
> +                               argp->handler);
>         if (err)
>                 return err;
>
> --
> 2.56.0.212.g129ede20d9-goog
>
