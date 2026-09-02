Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB8736B90E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335904; cv=pass; b=u3N9NOkC13RDB82OiZQE5rU5ga1F6i96j8DxLJAdjrkERY0R5g14s89ijk7v5W70ppsT8KEtpbcCkO9/vLwjqP7FzIWxOYcKh/rTxxiyAdM8AZtEl1aGS3fytk1GBw/rpBJSVLuAS3vy/QngvGkcqh14IrlsCWWWLIJeBKU7jvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335904; c=relaxed/simple;
	bh=AH2mFVqfhI+VKGe1qrjFhqR0NL173+MpfdqBHJo/XSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGmtk1eh/0ClN0sH6Pq2nIrUIhUdMB94kF4V8Z6CM4/aviZqZh1akv8ra34V/MYsnCevlBnz9dnbl2WwVRw5UpOzap5qL24i6qR9A1ufPloaDQyO2lq+o2Zi+WgXcSJ5MkE8m99ObLb2zohcy/UIeUPh6d1iQrkxIuUp8WtA8vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdQSKpua; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdQSKpua"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso1022410a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788335901; cv=none;
        d=google.com; s=arc-20260327;
        b=fhaHR8wfTuQFVAzLSvBbfcLr21ag4o7uFYHkOrO+0byQ17xiurxBx//zlQlpIFQXAD
         WWjn9nSccBHBHJIKEseoeEfYexmctBGbmP6YdVDw1IhsCHSbUJ+mIm3+yF2q3+9hjVdw
         valV/wXya++cs1VW97XlEwUY6RbsAZa/J/tVOqfpZWbOHWXC5YtgClAT7okRPk4u4c8M
         KD67egSGvM2Dp0F/WHDVCND9n96Vd8efvjXhZsu7rd3UG6f5GPTLKFxmfHc7RIqAfgEF
         o/A/0fDd11E4eYrRE9PUXcD/UWHJDKHVbnlqxDI+Y2LF0BGcGX4X7kEZXZCn4rlyJTUy
         IgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLdiTvSJWQNew1V32/cWxFx0/714LJbgj8z0b1NpVhA=;
        fh=HccQxOZbQbSf8hQ7hZLLCL2gucp/pW4z5CQu3VvN724=;
        b=BdXOhnmXZTqvj68FvVybvd5rHVYz5lu82bbcCq2HDXiPS4eNxibqsoq4zeQTTCPE3U
         lQZFnlZxVFWQFHGLYiV/xDont2PeR6a7SgKbj+tJ9jkmJVYsGuVKzZCetz45nvCijBrL
         +6dr6fa/GUIjE6NkVs0SY4KN5HzhytGp0KwbEqYg3N6ULdM/Z0SwRHkcV83VL8egpGDx
         BQRlkJTpxKLPDcQxz259ptmgZqkfzL4MXg7/zOYQy36V0AzDtg8NQ1+Q4AEHySZt0wXT
         NE7/+2kcvs+RabqpKW2xDCAxL5bjh2mCA3mvejTV0A+tVOkRmMn3DG3JRdFWVckkl4to
         ifqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788335901; x=1788940701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLdiTvSJWQNew1V32/cWxFx0/714LJbgj8z0b1NpVhA=;
        b=KdQSKpua/w8HKvps738kX6J6E6s79tTVv04ABGzYUUHp7Wghv4gqShDT8PFJt9OJC4
         JJzu2OW3jLysyq4JOl/7LaGCjeSbI/5FO8aHAOthie9t+zCaz9cVpWJCYEgT5DAWT/6M
         gixDSCcqmWFpgitHZ20sTRMaXSmaGaAJX0JzI6KtuKDgZXLarQa1wi1zEWpdtK+Cx2K8
         XnaoXVsC4obF7Jiuqiyb5ImqgSkzcxotU9RUjrccEMaNyQC0owo0Pfep/n1iUQXVhCBf
         rSr7GZ8LiXAlBQiRqBs8WdO8fEQkJJ5SY5CJy0bG5HI2iMk4NtVAPjcx3e11pe3uSNbA
         9gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335901; x=1788940701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLdiTvSJWQNew1V32/cWxFx0/714LJbgj8z0b1NpVhA=;
        b=hcq8ZTBs3GC20qxifZsh9EvjY67+zVCCp9qAXRdYnGU0BP8bFN5zVwTl6qlxVzFIen
         hZptnl8dv8vC+tyMalpAyAbm19fHqPU0bMOlK+7/WQugxaqJ932Mg8tMMyAqVysViXO0
         daCWg/kxsZOSqN15ocoV4pftzfbTOql2bBY6aFnFAyPtTfzEHWhfi/RIfPQHZu/2nJp7
         HzvlBvPyxB4v6kWtRy8rNgLCe3WEzCyee+AEaLuvh9klnr79ZbufjHbcGZZ8lW2wjGR+
         KaWDXAIR/nFjpjGYIy1DdnxhUgROGCY+Cf8EdzugFHuqL1yFQ++Ua4qx+v1b2Xi5TQ5Q
         4m/g==
X-Forwarded-Encrypted: i=1; AKwUvBwJUHfGqRmSSqorp3KS9nx+4D6lD4kkzzjqUMTWfin9SgtThR0hivHNZGwoiSnxvdMhvFigktAy/e7l5Ww=@vger.kernel.org
X-Gm-Message-State: AFuF++lZiV5eUFkfPe0lyfRVKdxS4rLCgLJDtQRe11yEVsVmCsKGxojY
	0jRS8hStlXTnAbrjuwO+NMnzgMTbzMrpt8O138QGirBLQ18YDGNS99qzf83RI7B+a6vPz+awc98
	X1kQShaRVbYcVl0BgzKquSN9xS/XTu34=
X-Gm-Gg: AYBFou1VwPqtUxt8JwytDpU1mRVGZZMJjSLxk8jDkYwothhma0A4zS/ky3w1lIhfw/s
	hPCowvsY5QmoYkaxyztH2Oy7+F3hpAGrVUCYNp+DGiwxFavWnNOuQcNAy7t1dcHYnXQP5+V4vNh
	LMnUWUj5hgytY9+Cx/dMMLAjeSO2VwxGxwchQRH7OBVcLMyzOvNo5zY8KmS4EdYmtMRzKaqZp1P
	Oh4qs6HlTZDEEL56t9zNssB9LMX9mOxcL6zfrDbsFBAGGjk0puEaJfyvnW9TFTLyLo1z0FePM5u
	1DIX9OEaBqGE8fMa/diLcL7StvsZyXgu40h5EM1SVrhpJg==
X-Received: by 2002:a05:6402:3783:b0:6a6:32f9:d7cd with SMTP id
 4fb4d7f45d1cf-6a682abfe4cmr1855105a12.18.1788335900646; Wed, 02 Sep 2026
 00:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
 <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
 <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com>
 <63aj7jbfaoamdmcurlge2c2kqpliaifgq4vbythrrxpfyr5vtm@z64myom426zd>
 <CAOQ4uxh-NZ76hEFoNNGjyhodr9U=dvZuGVmYHVPGZ_=jRxCAsA@mail.gmail.com>
 <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa>
 <CAOQ4uxiQF4M_YSBMW3h8VCKR15GV6g_K5nf=2odtYetEwKHm9A@mail.gmail.com>
 <6n6r5zvcu5ojihyb52rhejlky7xrn2a2p4l2cgfut5lsscunek@bcnpy7bifjrs>
 <CAOQ4uxjbEY12XMmfCXTPTpASmECCXcGBQR+bS93k=4vgqzFDZA@mail.gmail.com> <20260902070359.4163607-1-4ncienth@gmail.com>
In-Reply-To: <20260902070359.4163607-1-4ncienth@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 2 Sep 2026 09:58:09 +0200
X-Gm-Features: AcwNN1VQsm29RxK23PY9cd3cS0J_wxYXULYhcuyjD9hOdxiN-6Qit72LzmQlurU
Message-ID: <CAOQ4uxjwGdKhX423KoFxW+T5hc9uzCWSsGwn0-QX=CJipPSaYQ@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Daehyeon Ko <4ncienth@gmail.com>, Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:04=E2=80=AFAM Daehyeon Ko <4ncienth@gmail.com> wro=
te:
>
> Hi Amir,
>
> I tested the exact attached patch (SHA-256
> 9fa187507909ae14c8de8a117e775122e3daa425c69081b7115b3dc979fca14d)
> on Linux v7.2, commit 8d3ae59288f1, with an x86_64 KASAN kernel.
>
> The capless prerequisite probe passed as UID/GID 65534 with CapEff=3D0 an=
d
> NoNewPrivs=3D1. I then ran the original reproducer command
>
>   fanotify_destroy_add_race 10000 1 1024 256
>
> in three fresh 2-vCPU boots. All three runs completed 10,000 iterations w=
ith
> 10,000 successful adds, zero add errors, and 10,000 fdinfo reads. The com=
plete
> serial logs contain no fsnotify_conn_mask() warning, other kernel warning=
,
> KASAN report, Oops, panic, or kernel BUG, and both guest and host exited =
0.
>
> This tests the originally reported race reproducer. I did not yet test th=
e
> new permission/pre-content, duplicate FAN_DELETE_SELF, open_by_handle_at(=
), or
> NFS/export-filesystem semantics discussed later in the thread.
>
> Tested-by: Daehyeon Ko <4ncienth@gmail.com>

Thank you!

If you can think of a way to trigger the race in a reliable LTP regression =
test
that would be great.

By "reliable" I mean works reliably with some fs at the moment, for example
if ext4 or some other fs practically keeps the inode on disk long
enough for the test
to open_by_handle and get a new dentry for an unlink inode after
FAN_DELETE_SELF,
and then close the fd to get another FAN_DELETE_SELF that's a reliable test=
.

Jan,

If you end up picking this patch as is please fix the typo
s/fsnotify_removeinode/fsnotify_inoderemove in commit subject/body.
Also, do feel free to rename "dead"/"live" to any other terms that you
find less confusing because yeh the lifetime of inode on-disk/in-core
is a very overloaded namespace.

Thanks,
Amir.
