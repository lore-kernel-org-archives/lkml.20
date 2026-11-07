Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794070131;
	b=33zXl0dAykI8FZzV2HXKXSiZHnBFdGq8tMrU12zv7+TtBpTh+EF/e2jGwvwvIYWXDmT0
	 gAQeOJm94NicVVLt7qr/Zq8YyezwFgLQ8On51KBCcJTcDTqqPw0cnWjNOBm5sES6Hppaq
	 rsQskgkubGHzLkmEyHaZ+O4p2cl3bPibbfHk7JGg6QziJYrLp7C8WJd4jrN6IGW2CGqFQ
	 zjWXbHPZs4zCeC9mgkaXECwiCArmj7UmlbGVLHlN64MWjX7sMEHYfxoZH01Z1nOrda7Qi
	 zKw4Jf6bXmNcK6zw5+QmtsR+sJrBDCHU1fkTiD4eSd7DbCbLszl96LTuGJOM+g6PV6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
	b=BIgD1br4I6JR/WJbVyJ/RHRSJJPDdZsx9q6K1lsdWhGvRxug7PycH81GBmD5kf3AHhoA
	 xqiEcRyERHX9dn8P4Zyp8Y3zmxw6DtLnYTYiJCaWWGOcy3Akj5EqcQ2WiWtJ9PDPe+dMG
	 gqhPBYT5tZ36QrhkeknmeSpgwKMf76j+6AnZ1p2b9IgORJUfJJoLAe8COdRDLHUNAysKc
	 EK8/GNogRTYl4n3GtqpnHKdo6jQiZQ/CSSLVN7YhU4dUDlLB2nWJnQzOHcDtAtatCtAnS
	 h4SrVgIHFxoF4zUBGpgV8EWS/0Fb/YkR1nNdgNRGiupwoJj8NhCUCF5J3qFuqr7ZYAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbJQ3Zqr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A71606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A71606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbJQ3Zqr
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso495632a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794070129; cv=none;
        d=google.com; s=arc-20260327;
        b=V36AWKcy1m3g1NoboYBSFHFQsyqvPuBqORiQzgx/4GCuy/sUkIA//SzBJ3tbk0hBL6
         YoCYyviCDp8UYLkCcccEMm1qEq3uPOyn+3A1KuuY1ce8HNlQgFyT7hWvhPRwqA31Cdf3
         bpnnW+DjgDpYs5z77aMW/tJoHO6ajXzcvcLkUtrcP2djYxaz5Ld2n81zrn15YuKzEpkH
         6tvWVFJip3tXoj+GR7S8twIduYMVHtEs1we2+oXg+2rm9paQgfTSJs+fw+F4TchTBTb0
         hUAnAcPYOZOl+uzGqt+qOokbZCwTyc0XMUUvV3O4eDB0i6m/VV0mOYIxFS9w53jgMLtG
         f75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        fh=LjeT1d17KPBiKz4VayZUMWzUF0w+tLvSUzhVnBotETk=;
        b=DB0uvWZxoZi5k0gNYdJtBJ8dnEqmxCX1X7si0tu52v7X5c3nzVbw8YRg99oEm0f5z0
         /l7qq0lPxanyR3REQ0gj76AVl1HHtnXw+5PabWuE5J+OpqK3DSR6p8XDp36v7WZ3I0Ef
         VvuWtFi+fngwhbDqd/BbhX2HH2ZFXTZDBZAfBgINkESLNnORBk1gh65DuBspn3M/vo0c
         Opp0GbszhFYTYdfxeTHDDG1qSg10AEIhc4NXAOmLcg75NhuQ2MNu5Q4UvEMEMK3m5GZa
         HU08YIJEWfl3sfupQeeDgg58zzK1KIDNv6r1bjdV5fgmWVj9KNmzdsTgxPDgw04aSHp6
         F7ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070129; x=1794674929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        b=FbJQ3Zqrdpn7NIhiDmg+EUuO6n3ozLBXaaXnvJNjmuY5AlqvMAyJo597rNOoVGHd+P
         Wy0+BFjRiKW+LdqY/E8CeYV42t7cwAmJ5AugbcA9IrMB2CM/bZ4DBvia0Xv7MsG4AgZi
         C30lhUT4bvKQ2SikSiGakC0P7/tq5w5ZAiw7cjWTlhOJPAGHcWeKY11DNjLSqhaj3LCJ
         EfYP2qa9hYSvPmYbNMnzYlsCnW2tfO8v2zrKk1TZnVnWfaWVJoi9yePqPucWkME33sCP
         PU+42FoiSdOSik4gy1NrZDeNWmmJHSVsadZh/wdcs6shRWcOD02h1nfTlAf92y48Nmox
         Q9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070129; x=1794674929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        b=BD7IiKKPjpCBSD4+PoM+cdSwI7e4K5DYUOFb1JVsGdrlfNJM6yayvu1Ifa8W7Q2ZzJ
         fcZmQ1+b1lmVBe/jHUXTo11cIrJZvDegnHOf2RMvDxM9WjQMcQT5ytH68+GgHHHgjHFs
         +fMJz67KU3HzYtA3jSX0Zz6OoFWi5L0wHgso5StLjqO1nciCrcMy4ferec/wRPeY5/Hq
         QcgZ/Ud/CNIusY9Z2uxEERamvB6lQG4SjE/jIA/KP/jy7vq2AVuBKPd2ow0JvF5k6mr2
         QZPwzMV93FTzTpUOp0+AEmJefwsEP3kSLkOJOgnQyqyfJA65199+djPYJgWT48xDVhPN
         PThg==
X-Forwarded-Encrypted: i=1; AL+hErGIscxFHX+4e59W34NxFTbxIzUpCGDhvzuAsDhvI1hbQq9fSxQD+u+w39PYKLHsyIJ+0UArjnmJ3fszJas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YmybtfhaZytcW8n0+znlTUpeNilwmHIiKXScPf7zv4K1EX39C
	WCJ8Ex6VYWnzOOFaqIx6C68Wd1n2ur28fs3z/TOBJHpzrgZQY5YcFZ9R2lPpUONbMxhR1T1mVh1
	VOjLJVQnhw9VtEzX9h7wecVIjszMBjlY=
X-Gm-Gg: AYBFou0xVpqbA6Gt8zZkhkEOAqQe+rzlPSCxqp03T+WMfPbSbq6lz9LWo9H1d04g7IE
	5hcnDTv1DCdJYFvNTld5lYH3zxOb0aRLkJOLDarYVz7CexRK8UvTE3vFAmgdXBGQCS21MamNEHp
	9DWoOOM8k0HrQXT3vIK7I5uDry0oeKVAIJSa/9PVLJldEwBDft6iLY0l+qn06W85M/XeGVaebb7
	eD1h/bGZMwkEGX+w6v202g60Jub5uG/v7oe7mA5jRfNdnaLQScCh2f0I1EqLijlO94EzaK93SES
	2c43NJ/bYyRwbiRJjqLo5OdObhSIvz9XOhBfKZPoopixpCwDOLQEzEDfdanA/hslQAcWh4/45/5
	cazQG0HilvxEE8JtnpYrzXF9xcaGgiYDZtN7rwOuqlRGb+DIEY1CFKksOdGKxRHrJ+2LA+Q==
X-Received: by 2002:a05:6402:1ec8:b0:6b4:dcab:bf9f with SMTP id
 4fb4d7f45d1cf-6b6fae71be9mr1620380a12.16.1794070129335; Sat, 07 Nov 2026
 08:48:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com> <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
In-Reply-To: <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 7 Nov 2026 17:48:38 +0100
X-Gm-Features: AclHuK89rvp6wjLvX07JFLvpP57bRUqY-Yxm_O2zzvQ-fpYQDX7x1__0QP5KjTE
Message-ID: <CAOQ4uxgSVc8n1LbL_dcU-DpNN5BB-ap_vGdXEu7+d0Td7PK5Tw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 5:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wro=
te:
>
> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> Add provenance time (ptime), indicating the time when a file or
> >> directory was created. This is user-settable via file_setattr() and
> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> >>
> >> The semantics of when to preserve this new timestamp are the same as
> >> mtime, the idea being that there is a correspondence like this:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> so every operation (copying, moving, ...) that currently preserves mti=
me
> >> should also preserve ptime.
> >>
> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() =
to
> >> allow ptime to be used with the file_setattr()/file_getattr() syscalls=
.
> >>
> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick =
J.
> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
> >>   utimensat() ]
> >>
> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@g=
mail.com
> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
> >>  fs/stat.c                 |  2 ++
> >>  include/linux/fileattr.h  |  5 +++++
> >>  include/linux/stat.h      |  1 +
> >>  include/uapi/linux/fs.h   |  8 +++++++-
> >>  include/uapi/linux/stat.h |  7 ++++++-
> >>  6 files changed, 52 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >> index 833e03810b24..c0645cb22bf3 100644
> >> --- a/fs/file_attr.c
> >> +++ b/fs/file_attr.c
> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
> >>                                   struct file_attr *fattr)
> >>  {
> >> -       __u32 mask =3D FS_XFLAGS_MASK;
> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >>
> >>         memset(fattr, 0, sizeof(struct file_attr));
> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct fil=
e_kattr *fa,
> >>         fattr->fa_nextents =3D fa->fsx_nextents;
> >>         fattr->fa_projid =3D fa->fsx_projid;
> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
> >>  }
> >>
> >>  /**
> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
> >>                                  struct file_kattr *fa)
> >>  {
> >> -       __u64 mask =3D FS_XFLAGS_MASK;
> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >
> > That is not the correct way to extend this API.
> > This fixed mask was added as a placeholder for
> > "We intend to add support for more xflags to selective filesystems":
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il=
@gmail.com/
> >
> > Please see this POC patch for filesystems to publish their supported
> > xflags mask:
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il=
@gmail.com/
>
> Quick quesiton, should _mask also be used for user-space -> VFS to advert=
ise
> what it wants to change?
> This would be useful for on/off flags, but for ptime both fa->xflags and
> fa->xflags_mask would have the same meaning of "I want to change ptime,
> look at fa->ptime".
> Should we make _mask the only way to advertise what the user wants to
> change, ignore xflags | PTIME in user-space -> VFS and use it only in FS
> -> VFS -> user-space to say "this fs supports PTIME for this file"
> (which will be always once support is added to an FS, so it would just
> be "this FS supports PTIME")?
>

Sorry I was not able to parse your question.

I think the mask should mean "this FS supports PTIME"
regardless if the user asked to get/set it or not.

Thanks,
Amir.
