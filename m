Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CE2515894
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070019; cv=none; b=RAGe8RG/1evSSTAz7yMDgBIszi9OWuEvqt4l1PQd2fAVZmcbEwmm7ww36g9XTZ4uMvmO6lNXsZKZo0DvljRIaoY7GrRYLAQvnDzvQtVJK/IjkywvfQBFjit3BPMi6h+22+BlxNeZvMy48MNpE4iwjUI4ruAz9iS5YMHylK7mQ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070019; c=relaxed/simple;
	bh=ucFZ8Mq7ewmyXcDTFKP7UULK5m7ZGXARwwBrJyVQ/qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJ7Rk9818sf62yAMbsHu8FX6WzGRHXuEuT9aUTxE1HE5DEwSVD5ULOs0pCseey+TryBfd8JVVXZhXupoNXJdOhz+OxW+/V9w0B7Qqm+9z7MY8ZeQ0x9J/y379sVpzZAwLPBA1NT30yoQEYo1ccwA8tJPwHwTFnVV+55TRgEJzsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFozGoY5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFozGoY5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780801F000C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070017;
	bh=GnEkXDjMJm1exlC5tTiLHa25Mrd5Uvr2qX3xMMnipRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dFozGoY5ns8VBK7wD15lqifaPgZ5oRl7bS5qGyXzFGtf5JYcKUo6Ckh7lOZqaxhYR
	 DLj85OQ8ASr5MYvmCcys2yYLuwqteJELC5+5SapxUbX2EF0Aj29yUJ1ershJvccHnE
	 /ikMhITy18YX96OzVX0ctoBTREeIA/+3VP5iRNivJmPFWMuMNUB6uc31iZDqmJrZFr
	 2VlFH7SPEOnWnKG67yaPjJ9U6R41FT39i2Q4+fcE+cVdSj7ykYBqN2QcjOres0wxs+
	 +0lILV9W7gl6pS29jIS8ocoN6fi45+sp/j1KY4/Q6TVxAZqBa08jQR6wmutci5dyVD
	 1AkNb9jUGmzbA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c34bff61551so722069066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGlwR+pq5l4Le1hZU64Qm9YIt7Pc5RjEGHiC8HRqjNdJIZ0w8ZYjQdBTV5+nVs9kTsPwTjWgPsp1xoMWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP6DTF+3risyUn+f07c824CqGvIFHLLtxtjvKH/0be9fihogHc
	3AEak3Y8lMyuFHyZMDfpC7u6vamSdTa49G5FW3NET7iBhlj3G5KYLG8VNAax+scCKp1tx6Go+3F
	uZoog9Oarcvv8gaWDclG2J80sk1k6QHQ=
X-Received: by 2002:a17:906:dc8c:b0:c2d:ba08:9092 with SMTP id
 a640c23a62f3a-c31a9fe730dmr1694771866b.16.1792070016069; Thu, 15 Oct 2026
 06:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013015652.19724-1-zenghongling@kylinos.cn>
In-Reply-To: <20261013015652.19724-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 15 Oct 2026 22:13:23 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_O0Xf3pUcPdwKVVMf_jn0WD-J4i0xmQ3v6a=y1kOmoRA@mail.gmail.com>
X-Gm-Features: AclHuK_62zyJ9s2LrW-rF8gXePKSnnjHw0Oo6L11_y8j6ZkpLN8J9SMhVA2HM00
Message-ID: <CAKYAXd_O0Xf3pUcPdwKVVMf_jn0WD-J4i0xmQ3v6a=y1kOmoRA@mail.gmail.com>
Subject: Re: [PATCH v5] ntfs: roll back the ACL xattr commit when the WSL mode
 update fails
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:57=E2=80=AFAM Hongling Zeng <zenghongling@kylino=
s.cn> wrote:
>
> ntfs_set_acl_ex() commits the ACL xattr before it rewrites the WSL
> mode EA, and removes it again when the rewrite fails.  That only
> undoes a set that created the xattr: when the update replaced or
> removed an existing one, the old ACL is discarded along with the
> failed update.  No error is recorded when the undo fails, so the
> new, typically more permissive, ACL is left on disk while i_mode,
> the mode EA and the cached ACL keep the old values.  After a
> remount, a chmod 0640 -> 0777 that reported failure leaves the file
> accessible to the relaxed ACL while stat() still reports 0640.
>
> Save the previous xattr before committing the update, and restore it
> when the mode EA rewrite fails.  A removed xattr is created again,
> since XATTR_REPLACE fails with -ENODATA once the removal dropped the
> entry.  Remove the new xattr only when there was no previous one, and
> skip the undo when the commit changed nothing.  A failed rollback is
> recorded: NVolSetErrors(), which the next persistence point persists
> as VOLUME_IS_DIRTY, and a log message the errors=3D policy acts on.
> The flag cannot be written to disk here directly: the target inode's
> mrec_lock is held and the $Volume mrec_lock cannot be nested under
> it.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
