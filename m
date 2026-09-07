Received: from va-2-41.ptr.blmpb.com (va-2-41.ptr.blmpb.com [209.127.231.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AA37B40A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756553; cv=none; b=nxNOw5BIa5a2a09nYlM1+GOCUJiySFrIYn41gCGctR9jQ8h8BYbpS7LfE6nHily1ctfgjZ2oT0u/TYA42gbRoTN7nHBRWYmPWrBmUtGqgsm7GxJwLf881aQj9QmbkFxnoyio6OYtcLBMm8m4JUMVg+IZLYNxUdvXNIawmkucm1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756553; c=relaxed/simple;
	bh=crTNUsjPG1QiBt7ClQwttBThqcJhYP4ZOoQdLEw/Tug=;
	h=Subject:Mime-Version:Content-Type:In-Reply-To:Cc:From:Date:To:
	 Message-Id:References; b=u3xS0BQWDzARJVE5yznRKOQWCRF0GIykDblbMl9Caj9F+u/FdqRQg6wZuxbkSAjjg2Ljd/oWlpy3RhRcsbODGfAyl6v/ABfYZLE4cNOqNV3x4tu210rv42roRstJ/QCIIQ9lgYG511tUs2N8Q/AV8f3XEy9IY2mi+oFV2G/SK60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=ANT2XpbV; arc=none smtp.client-ip=209.127.231.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="ANT2XpbV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1788756546;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=crTNUsjPG1QiBt7ClQwttBThqcJhYP4ZOoQdLEw/Tug=;
 b=ANT2XpbVP8okQ8rZUgEYE0CCoqGxKaQF31iTTiwgXwlGesShqe8uNpziOmqXKNmHTQefAv
 28iacJCrG79wWjYJKEFhfQ/Fagi54VUu2JQr4KI6livCm3yp+fMABg4aujVUyi4zzbFcl5
 AmJiw9v3wBpeh8det6i9aUT02vc9R5fy7dOKG5TQ1PXN/L5ofFJn9+Py0GI59IMVsZnCkT
 Iq0/az/NxwstfjjbBAdiQQ5gwzV3i41syXJ4e9rNVxUIitH7ygk48jtd4Za8kH+a+LSXm8
 eOXMngWsZt78kzy2D2gYtRBNJglnCXaDVBSYt4CvAMZqU935e+onTfBL4icn7Q==
Subject: Re: Forwarded: [PATCH] check keys size before checksum calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a9e4242+1479d9+vger.kernel.org+colyli@fygo.io>
In-Reply-To: <6a8018bc.10853dc7.22f513.0008.GAE@google.com>
Cc: <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
From: "Coly Li" <colyli@fygo.io>
Date: Mon, 7 Sep 2026 12:48:52 +0800
X-Original-From: Coly Li <colyli@fygo.io>
Received: from smtpclient.apple ([120.245.64.136]) by smtp.larksuite.com with ESMTPS; Mon, 07 Sep 2026 04:49:05 +0000
X-Mailer: Apple Mail (2.3864.700.51.1.1)
To: "syzbot" <syzbot+cb5b32abe226710cdd8a@syzkaller.appspotmail.com>
Message-Id: <16EE1A57-5223-45AF-B459-F79D9E74BF58@fygo.io>
References: <6a8018bc.10853dc7.22f513.0008.GAE@google.com>
Content-Transfer-Encoding: quoted-printable

> 2026=E5=B9=B48=E6=9C=8815=E6=97=A5 15:43=EF=BC=8Csyzbot <syzbot+cb5b32abe=
226710cdd8a@syzkaller.appspotmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> For archival purposes, forwarding an incoming command email to
> linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.
>=20
> ***
>=20
> Subject: [PATCH] check keys size before checksum calculation
> Author: subasris1210@gmail.com
>=20
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git =
ba5cc80fd32665ed609037ff30ede8d194f24aab
>=20
> Signed-off-by: Subasri S <subasris1210@gmail.com>

The above content seems not like a formal commit log? It is too simple, no =
explicit clue and
connection to the following change.

> ---
> drivers/md/bcache/super.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 97d9adb0bf96..49b3a2231820 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -204,6 +204,11 @@ static const char *read_super(struct cache_sb *sb, s=
truct block_device *bdev,
> if (memcmp(sb->magic, bcache_magic, 16))
> goto err;
>=20
> +
> + err =3D "Too many journal buckets";
> + if (sb->keys > SB_JOURNAL_BUCKETS)
> + goto err;
> +
> err =3D "Bad checksum";
> if (s->csum !=3D csum_set(s))
> goto err;


Normally if bcache works correctly, the journal blocks record will always b=
e correct. How do you trigger
this condition to happen? If it is from a corrupt super block, this check d=
oesn=E2=80=99t make sense, because the
next one is to verify the checksum, checking super block members before ver=
ifying its checksum doesn=E2=80=99t
help IMHO.

Or any information that I missed?

Thanks.

Coly Li
