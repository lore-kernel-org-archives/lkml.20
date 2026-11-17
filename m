Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926017;
	b=VMBd0uv/KfxQ7mHyr7IFARp4lt6T6drGzyp0CL8hH9DGQBzbQOQqaLzQmFuZrm2q7k7O
	 NXYQVTNPFaY2kqXgV4Rqut3AuKUbnrGUKUileKw5irZCu9f13VU2P5IntZ71SxqOycawV
	 B/GbBhSTRqBn044Cgm2wM/vBfW529U7Q12qCVtc7puSCrK4N2OG2Jfyt0ijg2O6rg6CFn
	 ro001Bzl4TB6Ad+9kno7Ir+sAhf9i7XSa5HxOrXlbcAzLGUa4gCwPYY4H2EJd+/h9CP5F
	 rCmxYvmN4SlpnM32VvdafzwK9H3KS3EZ1svU/+DEm1roCPSmqaN9N70u3y9DX35DP8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
	b=fOfsFEtjOPbXdmrPxIUj1PBSvjZ0NCLtsXRZdvys+/DJIusEq9VRgMOciJTFEo2iNElo
	 G7rCrL9YVXS1cBtgNx9hIgQlXsXda9JnwuzZxnqTfECWvGX8gCcw6M6mb9EdSAcdo7BEC
	 zXEy34hCVFMOef/UHUKa21rtnqSP6eWTiip2zMqR0YKDcyWk2Gj+9jMId7ZeV/QsVIxjq
	 EiN1ZhqA3bcQJK5wz1+GMuAdj3pcEhE0cFDW11RtD2pmOCpq8oZLiNdygc+Jq8GAOGoy3
	 kgKTVVj51Lr7jQ6/Ac7K7DEgrkyDxZuiaHlPwP1oafU94qhYyubT3IS9/8T+KW1ErZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mNVNXfi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15B606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A15B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mNVNXfi
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so622338a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926016; cv=none;
        d=google.com; s=arc-20260327;
        b=XSr9Amhm9fZeRVqjdvRD0zs9wA077hosHNMKf+hoKGRrBrXBIxyuJK62CZ/lqSDvzO
         5ePruELDEt6jMhiIQpkf8ojbNzIECLAX93NqW8ndxVQAWN+SexIbriPVB0Q03535+Y4Q
         qKaJKl60vfwvin1vl5mC3gRhMN6xcplnhgnc2HIIps/IbMKihOE2H60hK55HEPEASU1k
         8Xppk0EXX8ZWyfmkAjidF4xqGDliWFOeFJkhA1jlRF+CyquDdvkFV3j6Dagfc4WS1M5I
         omzCZD7YT7x7M05vQHMFOGg3kJSqYcI8AsBL0kylmqxw/x+slWkgrkIt7iCCaYJt/VFl
         BHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
        fh=nT3/pGk25Q1DqTA/eP3KzUJ3nReiv2lg2UlX1+IvjpA=;
        b=r6rEL0ZJcqkbFH0XQbqL7elPn654ygDHr69SJm2eaG+N5EFbKk7XiktfzVGSBkfXE5
         fpIUIVHuWhlPhxT1dokcjseGeC6dVKmbX+FP0nZx2TRgeb8BR6ElOvV1/6JxtIuiIZUx
         Sf/h+s46tWgQgcQs9SyI1dxIdL2ADz4mfNXrzEteV1bm7tVcRB8lrr+GU7wYJ83mILeW
         WRjXpLGh/1TAfvB5stpcjnEyCT+/Lr+uhsJmJGDNqrVU5Pu35T4zY0QR4/shuYk+L8ga
         Z9e+ivubhhJVLvKwnmhWNs/rR38zMG3yAPLVC3U1t1L7KszThZFLLfVkOuw0UBLNcWZr
         SX0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926016; x=1795530816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
        b=0mNVNXfiQQ9XqB1g8J5uwr05zLt8Zy9JB1kORj6uu9v/Enc/dwdj2h+ayrhTSnTLAM
         mzSIM7IlSWTsQWSwG1nSKV+JX+YoMc50pW67PftdsGvCL2im4XdFKBZivszLqUn5ifMb
         iH3f2/7XZjvbWh1tovAcbMkickWuKZqmp0xyfK5/w6rP9fyMSHqn+X+uzyrboAH+kzxD
         Dvt+ZOisKHzi55lVGVTz8HWUpjQrVbOcU0sq5d7HwzKIGDihFUI2iwA5JEJ4wMzXO/BL
         2xs/lUipTtlGQNL9Gm4g6O+r0pYP7bLhEUwD/qTqeTMVCjDHNKwne3jD4ItWcO+ziZ4A
         DDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926016; x=1795530816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
        b=ae+/fZvRcTd3jtIZ7nc6gMEFVR3T3U2sTibKSTeXqNG9UkL/en4Ai7DlddpIgDJgXH
         e4m6TCdvu6OUnWoCZndt/IgBjCA/f5DSBf/wSLdP30PKyasEl5iuMNfGobYg/RfY2URh
         SHAw+tGAyIGEWdZ5RYDo99dJ0jLgpuhIhKWd0u40H7sJL9rWUbEtygvJ2U1yqP2Zstgd
         K4yfOB84YMzEJmQDD9G52iNjm1mnjRG3RS8wqGZJkAt4aPh7xR6HWW0X8QaxO/QS2iQa
         M0Q09yuEGXQ3bykBhFlTv1FO8rbLeV7Zrh9CGhLMMGMLov9ybD1JgsEJfmEZFQlaLDev
         +jHA==
X-Forwarded-Encrypted: i=1; AL+hErE4HBCgzl7MIMV4C33REEQj4PImG1mhf0neTOfbGbcHr31Org9s39QdfoZaMUMJteKaHicknketCKfe7+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jmLSvPJ+0otzdQRgtsI5IdBjg2Dd8BVITlc9EQtqCBixkh3b9
	duMixxoL+le1LW2X7cFHuE5ztRz49WpDZkrd2IjjoKvFH/tkS6NlO+saQ6jVRO2uI4Fgorlkj9A
	VeWT214bgUPZHaMeADc5goZeIcNELW20=
X-Gm-Gg: AYBFou03EOvLWMAJfHc0VG8Ygxzo3tsmomk5wYDv6QJKgVaAwe2W1k1gBojljiAvPfg
	G+7CyeXUdpNWCZPYTLYdyDgrgvhXxBVJTeviiVIT4QmWaOaGtBPTkCcVhr4MTHgQvp10UgB1adT
	+FRLvW5+4/AR07355kp75lKR5XTRn0J13ShpnV+onpJQ/POTvyXNaREwaM323WWBeM5xtc9hyPx
	HUXHRe8U17hj6+l/UFGOSaiHWLKnsU7nEc7EatkGeQQ6/AVdky5QizC0h9daEFhxbuyuwi/lyEe
	ngv+B58UjdoQ73nMSK5Abp6HZRX1ZkwctM7My83uFXit/Kzsch0s6sibQ5oLYoFGcW3zqD1bEkE
	A12xyAg18mM5QtHP45INm9bM6tnIzVltMbsi9DFisNi33QtPVrcOTqLyfEdMpPx+zoUMx7A==
X-Received: by 2002:a05:6402:c51d:20b0:6b7:749:4bff with SMTP id
 4fb4d7f45d1cf-6b7c0bc3facmr7573789a12.26.1794926015815; Tue, 17 Nov 2026
 06:33:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-4-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-4-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Nov 2026 15:33:22 +0100
X-Gm-Features: AclHuK-oqTtDNy1F_dD-TE8gCQJwenfN41foadOCG31m2aii0fr_9cwaA2IqUTU
Message-ID: <CAOQ4uxjO-eQPk3OS0iCTRqyFgFSRtVMFywCiPdgWGHkmRBuAUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fanotify: copy full qstr length for copied event names
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
> fanotify_alloc_name_event() reserves name->len + 1 bytes for each
> copied name in a kvmalloc() event.  fanotify_info_copy_name() and
> fanotify_info_copy_name2() use strscpy(), which stops at an embedded NUL
> and leaves the remaining name bytes uninitialized.  With the original
> length stored in info->name_len or info->name2_len,
> copy_fid_info_to_user() copies name_len + 1 bytes to userspace, leaking
> uninitialized kernel heap memory.
>
> Use memcpy() for the full qstr length and write the terminator
> separately, consistent with __d_alloc() and d_path().
>
> Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
> Changes in v2:
> - Use memcpy() for both copied names, as suggested by Amir Goldstein.
> - Write each terminator explicitly without reading past the source qstr.
>
> FUSE fanotify mark setup on a zero-fsid mount returned -ENODEV; the
> normal-name FAN_REPORT_DFID_NAME and FAN_RENAME paths were tested on tmpf=
s.
>
>  fs/notify/fanotify/fanotify.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.=
h
> index c25cf5c1fc70..2d6b5c2c6f25 100644
> --- a/fs/notify/fanotify/fanotify.h
> +++ b/fs/notify/fanotify/fanotify.h
> @@ -221,18 +221,26 @@ static inline void fanotify_info_set_file_fh(struct=
 fanotify_info *info,
>  static inline void fanotify_info_copy_name(struct fanotify_info *info,
>                                            const struct qstr *name)
>  {
> +       char *dst;
> +
>         if (WARN_ON_ONCE(info->name2_len > 0))
>                 return;
>
>         info->name_len =3D name->len;
> -       strscpy(fanotify_info_name(info), name->name, name->len + 1);
> +       dst =3D fanotify_info_name(info);
> +       memcpy(dst, name->name, name->len);
> +       dst[name->len] =3D '\0';
>  }
>
>  static inline void fanotify_info_copy_name2(struct fanotify_info *info,
>                                             const struct qstr *name)
>  {
> +       char *dst;
> +
>         info->name2_len =3D name->len;
> -       strscpy(fanotify_info_name2(info), name->name, name->len + 1);
> +       dst =3D fanotify_info_name2(info);
> +       memcpy(dst, name->name, name->len);
> +       dst[name->len] =3D '\0';
>  }
>
>  /*
