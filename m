Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859648;
	b=qEav9Xhajj7g4YMYqdLrwC61uKo5o5F1WVfuAkp+iYBkjZle7ulZjEDi47p8dTuskBr6
	 J6XvbAFbLoR1ksg3ccRt+ph1PLj94pJPPGLCig4n6gCCUORkwxI4/JctRWsbb82tL1ueX
	 aWPryP5XeiXXu1N6GBvP/zKgfdutoin7HdzX5O/EMpZ+4QLjpJhpmOWLGssiMSutsw9jK
	 SHq9BkpIS47VSi6VhgiG5sQK8UsJZPwYERHhcBuqzSkZ3glx6WScfT0sGPG8nDO/VlnCI
	 ugXjG5ZpYFC1Neqivhr+TBCUPfhk76ecQUPaYQW+gRQmTp01yVPNKQEcSMDsXXjdhpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
	b=0kRJkE3jmu2kEIGj1rM7UhaduJa7XfeIAZy5gCiZ+gmqnnHAEUWvD32Q0LnkPn3ZCY/X
	 7H3+o8bqws0jrx2gIkgmlgFUdSD2worTjTeQd70mwOhPoL/KSWm3gF1OECKjWB8HDqaa9
	 JdQNv+G6d4zIkZWPfR3+jTBZ/hsvwzBYVYqvO+zhBtk+qw/Bjeb4k2M8JB1JqcC7UVYLk
	 o2IsJZa5420PVcCBe6JxFBjTj7haxe4866f/F0MzQ7fnibivVL77cCY8pvQSVMjSHHDUz
	 DlFIKeKfCw3/s+oWi8nrHDrYGqAiieNloL1VWEnC9Vbra/YJaa5pSKtydByPcUELl8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFDBy0c2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F01606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F01606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFDBy0c2
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso32098785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859644; cv=none;
        d=google.com; s=arc-20260327;
        b=srErHdov+zMZEANA7Kodqi769ldNq/nyYFuPw6vjGb9x33KGg/HcG++37rbQwyonRu
         Jj3q9xmcklM5hH58GgLRrm09e2ZzwE6QnRskyMX17pYMvyIw661bstczCXY1chfT7nEO
         SmXFYEMH1yAJVH7Ln1G+axy8bIKQPKvb2FCEBFob4KH2sGx55K7Wf6YfmV/kNmTXx2y1
         DI34BnowcaG8v83Cq1u7KNc2ZZZgcipiaeeHwhK2c5FQ+7WvoStyjxP7E4eOCLhJaioy
         vxatqlp0DdRNF/7L+maL388UqFQ591seMaoKCvFAjvMTyAKPeT/e+rEf2T8zDWwVI+dE
         rNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
        fh=F4m5bv2O3KM9ir8N6NK21cEizqOi+qMLKoenZnWl3kk=;
        b=SoWpkY2JlxmdwGXNviGE/oP5C07w5DIDcdUlp24LTmeQzAVxvAXSzXG8wzau+AOfPw
         soROBkpqDJ6UNLIQoun0hR4WCkTHCHychLdafFnwhWP3jLe1rynZjurIdr8QNgOJHLwo
         9MB5+y7NPjttXRtcwe2msrTKBmt/fUFlImuxlBAhrSVEZkGqkI+r5Fu8EVNYT36Y5Mbu
         3oAOIeT2GYdIWOuCsF0bBbPwXvK0YeSzf3qKNMWLpHcg6uwKPrh67axZMB5QLjM+7Dla
         dvelMoZid5+ZLtTlXHqluLh1bKMvbOkc68qA2rbpcGKiPS3ExmlhNoqNUOyKgK9j1shZ
         wVdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859644; x=1795464444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
        b=XFDBy0c2q6nTYiJ4dwLENH1mguXX/IcFF58gOeYQArjps79P1XpkrhGZpUclTyZwpS
         r/ZYwRoOG8WhRg+8JvLZN08T5FQLHs7jA/CzeQCQsJeulI93s02F+iYtli/pBjYHG+CR
         W2MoU0n/+grSPpLZW83MAsn9WQiLh5CCwtBf/0GxLqRHC416IFZ4i13TeIFhLxmbz0il
         NPxDzLDOL7N17VVYsTOL0jDLDvB5woBcjlvcU+oGB0Wrnz6q9rCc3VHuwmdjl71ac6+n
         fuvYHmykPJU4vuSvTSKMetyKY9BqLddb2of0qXOJ87q21uNxSrudqkhk+T/+cyqihyd7
         2YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859644; x=1795464444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
        b=ekDSnrPhlS8ALHtckJnaxnX9YKdQl2EDJOtzJeCLnkDpKSOmAZew7vHDuKm5Qjrco/
         aGWnBLp6xTQXdkN7DtV9kWXi3Wqm5gu7kd2i0DEeaNxuAFoenQU0+4hDL5Dj3JOiqwMT
         Gn9lbQtb96CNWZZddEpUVyiafwEZWKVAW2ntyKSYPHhiS3rRy9xM9ZkIgwdjzVLLVFLG
         PlsP2jbDQBQRptZf0a14+v1cVXf05jKdVxGQDcUJL9rlfKWAxsfR5w5UA71sZIpBHahs
         qUYttAyOd+DE2XbiZc8riR39PyDNNJaFnVIxFDZV5W1uURlVZC3W7q2mD72pcbNOCkAi
         dnIA==
X-Forwarded-Encrypted: i=1; AL+hErG6L4uMnoy59P+9pF+WtEEySnoAC7RR7jq5HU1Ht+5uGIHPmgfpaMMANAzyfvYBntxV/VHr/nPbAGw8Ehg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A02czppNJnDHCdWpzHT+ck/2Mz1YPCIAIGEOxQ6rMwakFe0hP
	B9THZB5rW5DX8mw5MTIaVBkl/2KeKLF+SzTsEOK3Kq05/syjLohbZqnLoNRcS2YJ2hPYRxvi9Qi
	+B6Wbj7zniwpthxLod+ynEBteD2jT1vg=
X-Gm-Gg: AYBFou1T8+xyzuSepWmK891rZqckAKd8wGLY9+Rp3srB1eb9A3sG1uqjFvXyQXHAWln
	HKDx+jqAM9kQRPlLLaz8q5XLBrg6RyRyzJ1a1CBeMHVkxLVY05X8Mt/Ds6mdEFwlyW9ahSFIyby
	bHqfmTdDd+uXXOT/y7Cj5BlNSO74mWMaLhq7XlxvksAYpFsie+S97T26oxKoiT1T1APaigRhBa/
	OsdKqyjcpH3YfmOdqaKcM+5OASg+Gudfk5Vs1x4ckV8PjiabDzRmw5KMrrQXrU8J9xuM7gMoi+y
	omVkrCtyA9Tackw2ZxRdJoxBZbNuxqLTFpwLCbKwdux/v8TrwUmVN7J2hG1mMmXyBajEm5YDxmx
	3/dKHRXO1GYwTcLP6oKGOjrag0lR5K40arShovH3EooeTg6gR9Ah4MMEgzAhNqa3yv07t6UxYKp
	nuYhoW0Fz+o4wjndWcIA==
X-Received: by 2002:a05:600c:506:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4bb55a5d6bbmr165067875e9.10.1794859644313; Mon, 16 Nov 2026
 12:07:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-fs-frozen_writes-v2-0-ecc4a2aac40e@kernel.org> <20261116-work-fs-frozen_writes-v2-13-ecc4a2aac40e@kernel.org>
In-Reply-To: <20261116-work-fs-frozen_writes-v2-13-ecc4a2aac40e@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:07:13 -0800
X-Gm-Features: Aa3M54rpWiCplKeR8o5TX-NbYGDID_36BWk-3VAyUzdEoXSYZ7J-t8pfWvm9Fcc
Message-ID: <CAEf4BzYANM9vtQ8L9-rJPQC-tTcw3YUGsw=qnCaoym3+EU=DBg@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] bpf: fs/xattr: take freeze protection in the
 xattr kfuncs
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org, linux-nfs@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:13=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> bpf_set_dentry_xattr() and bpf_remove_dentry_xattr() go through
> __vfs_setxattr() and __vfs_removexattr() which leave freeze protection
> to the caller. BPF LSM programs call them from sleepable hooks such as
> file_open where nobody holds it. So a program can modify a frozen
> filesystem.
>
> The hook may already hold freeze protection or locks a frozen
> filesystem would make us wait under. So don't wait for a thaw. Fail
> with -EBUSY if the filesystem is frozen.
>
> The _locked variants are only used from hooks that run inside setattr,
> setxattr, removexattr, unlink and rmdir. Their callers hold freeze
> protection already.
>
> Fixes: 56467292794b ("bpf: fs/xattr: Add BPF kfuncs to set and remove xat=
trs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/bpf_fs_kfuncs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> index 35ccd98a4de64..7f61e2efa08ba 100644
> --- a/fs/bpf_fs_kfuncs.c
> +++ b/fs/bpf_fs_kfuncs.c
> @@ -295,9 +295,13 @@ __bpf_kfunc int bpf_set_dentry_xattr(struct dentry *=
dentry, const char *name__st
>         if (!inode)
>                 return -EINVAL;
>
> +       /* The hook may hold locks or freeze protection already. */
> +       if (!sb_start_write_trylock(inode->i_sb))
> +               return -EBUSY;
>         inode_lock(inode);
>         ret =3D bpf_set_dentry_xattr_locked(dentry, name__str, value_p, f=
lags);
>         inode_unlock(inode);
> +       sb_end_write(inode->i_sb);
>         return ret;
>  }
>
> @@ -323,9 +327,13 @@ __bpf_kfunc int bpf_remove_dentry_xattr(struct dentr=
y *dentry, const char *name_
>         if (!inode)
>                 return -EINVAL;
>
> +       /* The hook may hold locks or freeze protection already. */
> +       if (!sb_start_write_trylock(inode->i_sb))
> +               return -EBUSY;
>         inode_lock(inode);
>         ret =3D bpf_remove_dentry_xattr_locked(dentry, name__str);
>         inode_unlock(inode);
> +       sb_end_write(inode->i_sb);
>         return ret;
>  }
>
>
> --
> 2.53.0
>
>
