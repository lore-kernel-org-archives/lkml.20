Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859451;
	b=tegeb38SLsbQImv1dlkNk9EpUplGYJYRSONZraNJBYOyGmgEJpfBFYHny1uMNRkd0cpr
	 KaUaDc+pTW+Z5EMZhGdB/kfv/We6wM2OeH7IUoeNBCevEGauTsSrUH1seeIIeh8M2N4l0
	 KwTgkYatOMZKNboSK+g3lmDh2557V7zDZSqpfTjfRRVI1rvcvSI/ck/ei3AHnFlFxEuMf
	 W3/VYcO0S9MaWLShoPV/d1b3Fw4XaBVMdxR4Sf9MA1hnuxiE7/tRQtI6qxXE224XGnsU5
	 /sac8DDQVlsMLafickWLPvqr6cfd3dGwTyEX1bsjdDi6lnPCx1EeT6dz7YZvi5dIv7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
	b=v0aRXjV2yz8ymgAeDiexYmERjPuUlvdH5WuD4udbyU50Gx6olkGY2WMxjib8wqb7t5io
	 K01d/px+3Mt8Q342aL+XwDbcO0AltrKPuvL9HrEYgQZw70wEFXAFk/UMZy34zVCnhCaz4
	 rCpEFSuNDCDtszQofbn+M5ya8ugABkve9MI26FpbtN6mnxmogSqpIN8EWnKMuX4mhhVdW
	 CIeOtI263UXT3G0E/l+X5gdOtCkA4xHAqevFwOUiwMICb6T0qxqRZ+OoYp2pWBpJVi7c+
	 yGp07MMO2+bVoOgnhFokK9DIsIJf/TyABR8xj1Ra9P1yHKdD7ATXSQhIFRAMl19i9vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A6606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399A6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1736446f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=iHdcMv0+uVwfnVBOEy/23Eldm0UaOsiAg/hHnzYIzs5lNe5Dyj1JEXe0d2DyTt0ktB
         +4SyP3m8vQwqLX7zQCMYFt6mnUpclKE4EEM2pv+RgoKZF/n7twJSkmnpZ8SOXn6t91g6
         VMS51F8eDWayl/fixMcJks2AlrSeL5h59bNHkO469PeeJI1fE7RMwbAovP91C89O4V4I
         +8dY1btzkYno3+WKUFbZVKWtYRjj/pFnM1Up85KpCala3dupakzg+R6b7fVssjETWaCq
         l6or96a/T3KnS2AIx1s3JP+EYTuGYkbHgQToT0GBTqsQWelFsHzJcL/nqIbLCIfOG3kV
         o/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=OK1+eI8XqSQQ+6YNvfnXxI/BOPcIGCxF9ABh5tyqXPw=;
        b=FNVgcA1J55HTcp9y3s+Y1UyDxHYdXpLxXR0E72pPasgqb86oucqsUKvSmKJAfyh2lS
         s70z5r0PlovdMVc38XNoUR6oWKrUwYIhc9zcC2bds2mpApIEWH8Ni+wt2HB6Y2KehsGf
         Vc37f4CUamxuvOJ+kt7mqWhZHDrSuMpZAZD0aCH/7Bqy4JMFn1svhZgGsuxj3rk5NSp+
         5oZqAJgdjJaMYKqBeingQZw9Sm1QslfdcQ0PgooS4iTHvlHBE4nN8O6mktiDckAvKQR7
         mltOq/rHB1/RTmbxoXuIm7kwbmqWknKrnm1FAkW7ecxpF6ZJW2JUPIxqq3NMZwwDxSKh
         tJEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=hnqDx80H1BHGMZ+jCw863LQE2wm4hG6wTw//ziQNWkZpZIjdyNNCtFJNcbykSvuJWZ
         RrqgQGru9l+9Rlw9NCoAO7RXSeH6CHzRwb+h6TsbT77V+vTLtC7o5AslWzWJ8+7yhciq
         sbJxN7Yoz6y6VYO91QUyEDVlXVHt5e/uzOZriYhKEljZIduQH6pNfhdOY5sHlJFueOxf
         bN/uTLfuNBjnHaTZ+WukZQS/Wa30tWyiKsfqEPmOKtkcPCgN1gGIeLsa9pfco/3ZvP3P
         koo3Bb9/+esUnHdHS2hTd5qtXE/k/xctadMJUuU/zchcL0VDKvTRNofZgdIQ6mLOou9W
         X5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=z+MZBy4zRNDCcqf24Omz10AZWzb4EY+KxmJQ9+AMiNM6+/KWSN83sXETDzWikznKTF
         N5CQlIB4krm8y8YcQ8gh58cXniVKJF+K+cNEaEN/LdNl/i+BLtvwfMAYO7RSLFw1MCAz
         IW0GVStUPOEDGQA3rwcmC5LMqJTrbfS/ay1il7vnrlcFPraYjggqGcGjv/GYnbEDMOoo
         8U8GGIubv89LL7rkQI6thG4cQ2HHT6a4c/4jFPBvoLourhGD2lzm+qq89sYwbXiwEbYM
         999Zam2UkbDNEo9xqz1wtBdxq05eSiInFJDZ60qkfqei4IoPTOdbGdiq0ggknCcRb9x8
         r8eg==
X-Forwarded-Encrypted: i=1; AL+hErGXRqhOnusnumACqwuHLoPH3SfFa/paOTTE2WxXvmZ/NwwYUkbAadFUx9EQW4xNqdJixSD/5Hy9JKmTKmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0tXxayewQFgkdwy0RcFLgbK6T9fD1CosahNs7jTXjUE8ndTkM
	Hia1GFaIL86JcYBCoOpMdjts2evwGg1h26AdCObw8XYD+NEWsM3IrgeDJB5bc37lAjmSnFPaS3B
	JCRLSnb8xzLi47U0berh2DEJBjGysRNU=
X-Gm-Gg: AZFdTZcQI3rWNrT4lmly/bsGHZ5i7pn6l+eCcKFRtY4WxCMzCPW5GVckrF4rwS0KqVa
	zusL/wyPWSAfK+Gd3dmm1lq2j00z9QSEzEaRYE+yjrkdJK+4YEn6waJ6L1srnHyVvgLu7OmrD3V
	3QOF4ZLXlHoJM7SCEu7EICgUs1GBFzU/H5r4WgT+9YIyLdmWqpZtYsQoAFOC9ZOj4CQeqRJhTmP
	7T/M9H55YWgpcYsbXjkJ+ILSKju2ZWd93+rO19Kkt/+TJ+rbR/KUdZ+29bEVyb8k73N6jB1QL+Z
	kh/YBW3HcDDQQpLZ1c474scbdkHHuW6uDUw/vUCplDP68bCuBr5u569t2jdNGvswrE12wn3aSR9
	H7C6552Jnt6T6A4v2e5OVShRv8NMwtBw+qoG6RHSHOMn7Yw9aWWP/2pVFWM5E4hLl95uEKKu3y/
	+NB8GpgA0hDSyU5Ko3GzI=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>
