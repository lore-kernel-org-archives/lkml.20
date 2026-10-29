Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237951;
	b=ahMN5H9IakL7MP/aUA82Hpe3ybsvNrRKAr7LbX72ECCEkdgDeep+8ANLqMwkoGFAqdf3
	 jFPtefWCS8y2xvW4OgTkV04SKX3e943yCsckSj4IRL9j5zASpd1myeaE1RI28Qmbca+x7
	 qJPOZiRrWsgUcQkG5QIo7OEJYwfm6hY+n48oR3/M7fz2rl2/hBULPS+Ac+MLFXEwFJFWK
	 zGD4r3z4CDqiIXXlTGAAk0Xn83meCYDjBrzYlKUOmQIy+QQV8z+pyzdDyLu1ByxL1mG4v
	 CFj2un9zTBSonVYd33QkSgU3R89fFSb7lne9d75cHyw2uNJvLuT+Te4iFCSHRFO0HVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237951;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AWuorey2+GfC4KvscU51WE6b6XQx7DkkDB7vjHu7z9Y=;
	b=EiPxs37dtV24ZRVTKddM5FDEwjsH29psgYJlRx6V3tE5RXGIYFJaN86fJihO0qLjUBui
	 22ZCjkMbuxGlsdwyCy8rJm94NF793IG3NZm0MRv/YJrxYso+kbOICeKgUA/C+53KhYi6o
	 UmgFT3jkxWQPxsWjHxHtmOo6XG0L46KR3ZsSllc0R/vHS8XVLMYLaNU70N1RKlR2TGFPd
	 mtoXEyB/zeFghaudB3zW7tpbkwyiNenJKQPrt7tZi1Zru77/WJ1NnPECfLMdK2Fg84yi5
	 cIc21kn4qwo+0ik5/SO8bnBUtrIhkQeF0aPjH3TlSDA+2ujt8S4q40HXX3bu6JKA1UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GS1VH+Yp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GS1VH+Yp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D76E1F031E0
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237950;
	bh=AWuorey2+GfC4KvscU51WE6b6XQx7DkkDB7vjHu7z9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GS1VH+YpNnneD+WG5YL0tcbWXKRgYjo4dqxms9kuQExUuGDSuWdA57VmVr61+virc
	 CRov31ZQQem2KOcVKZO4gplufU5lBTjU2ysBDvb9Xy2Y2s0bSpJWtclB7CDAKG2nEi
	 D8pc0LOr0HmqNW7Bcum+7SDK1TLQ0KvV3hY/TEOs8yhiPThXTUjsPKmRlhfYWE8yJp
	 YgWqZiOHJU6/BJ55zukizvmKqqr35NU9ek6/YpIq/oF26oNbiAan8VDJ1suFndkOni
	 fln7bMkPK5NP4ier8BD3j68HT6e05lzY0rMyJ4+H7UszGbBACdEUkjW92h5JXyHBm+
	 1D5CcPt9pk4sQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c43fbcb4393so256371366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:39:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyNsWJW5ZkrEkhHJX25s13QXa6n3RbsqWMJwsB+WZH7LQjtQdAlPF+KM47hL86RGrUtc5F/HBpM0L9FoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6MOsHYWJCvwY0EUk6/0j7JUsI7IKDIySO18v2Mi50rNr6K8I0
	uMTDbX/6EAggq5WhlCMGCH7u5S0WUTFH9KfG+/1v+gOu1K7fsiajvg42MqycbpqIrtHpwNbSPP8
	veax7VpYIb0wq4nQZ6/Zc8xquo8w6tec=
X-Received: by 2002:a17:906:24c2:b0:c49:c76f:dad3 with SMTP id
 a640c23a62f3a-c49c76fdf1dmr180329666b.34.1793237949192; Wed, 28 Oct 2026
 18:39:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028153441.184701-1-icb@fastmail.org>
In-Reply-To: <20261028153441.184701-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 10:38:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8PwT4aaFgUg82NYZUB=pFNasL2QN7TGGpJVaZjFXCuSg@mail.gmail.com>
X-Gm-Features: AclHuK9zbE7gF0pHaTPVpFsWzwKV08SqtKyYeZaWBxaTFlMoIWOSnmjrajDfLFo
Message-ID: <CAKYAXd8PwT4aaFgUg82NYZUB=pFNasL2QN7TGGpJVaZjFXCuSg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: enforce the DACL permission check on
 delete-on-close opens
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Hyunchul Lee <hyc.lee@gmail.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:35=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> smb2_open() runs the NT ACL permission check, smb_check_perm_dacl(), for
> an existing file only when FILE_DELETE_ON_CLOSE is not requested.
>
> On an acl_xattr share the stored security descriptor is the authoritative
> permission model. set_info_sec() maps a descriptor into POSIX ACLs and
> mode, so its read and write restrictions are also checked by
> inode_permission() when smb2_open() opens the file. A file's DELETE right
> cannot be expressed in a POSIX ACL, because Unix delete is governed by th=
e
> parent directory's write permission and not by the file's own ACL. So
> only smb_check_perm_dacl() can check it.
>
> Because delete-on-close opens skip that call, a client can open an
> existing file with DesiredAccess FILE_READ_ATTRIBUTES | DELETE and
> CreateOptions FILE_DELETE_ON_CLOSE and have the file unlinked on close,
> even when the descriptor grants the caller no access at all. Only the
> POSIX checks remain, read on the file and write on its parent directory.
> The normal open-for-DELETE path is denied by smb_check_perm_dacl(), so
> this lets a user delete files that a normal delete request could not.
>
> Run the DACL check for every existing-file open, so a delete-on-close
> open gets the same DACL check as any other open of an existing file. A
> caller the descriptor does not grant access to is denied. An authorized
> caller is unaffected, and shares without a stored descriptor are
> unchanged.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
This patch causes smb2.acls.INHERITANCE failure in smbtorture test.
Can you check it ?

failure: INHERITANCE [
(../../source4/torture/smb2/acls.c:1054) Incorrect status
NT_STATUS_OBJECT_NAME_COLLISION - should be NT_STATUS_OK
]
