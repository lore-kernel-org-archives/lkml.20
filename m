Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718890;
	b=23CbtmXyv45VZ1T42vcA0sCEtAcCawmM2GggUbBvPTT2/BbOPVaTIYSNYLpuGzL61tgN
	 P14WyCAiU1ELTNPi2KnfWqS8T0ybwikgyAf8uVALuYRFB7inD4AEq7XwgImJIS7U5i7u1
	 8MVoT9UCrC5wJfn0G0Lzv9uCcqjfPBRmnvGE9HLRoZ/ZETLy5FImlUk4vcre2bVM4XJV8
	 iZBVWUgG2qIpTLnQoi9ZfcZfsUX//xJnuJk4vgiela5MhE+NT7PX2CXSlNnaQwqfqT97d
	 j4eQ4uXGR99zM0L35TWT/VxfgAMblMja/3wDOIEOz6Ftsp3IDsCXQViZReiQYqWmGmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
	b=mQUdQB0kQ59i1bgwxqnf891vmaTO7sXZelZ8WyvF0D1lhL44PHBcfelOXTjMZQ1/gPuN
	 pfE9ZppWy2W82LtWDyIvaKYHXqbGQQVE/6QrUqyQkaiDr39QjShla64DsR8YnMK+0D4bV
	 FeCAdnvqk/28QaxBo3hjhJqV/uiqDwYWz9so9OxL9E1ADk8edUi4jTOEFScCZ47qcF+b3
	 +MO7XeNg0w6S8+oJyiSia+XEkIf8CTSb/cJx/1SQf4DMmXnX48Zv9/pg170CqTtBAfo+H
	 QvbiGzI7Tlg0jegN80fpl05PpiXDAyVR6bHQ8U5bkSitRv/QI47Moo/ZEW2Bu28k9jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAw1L019;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DED7606EE8D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DED7606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAw1L019
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so6198458a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718888; cv=none;
        d=google.com; s=arc-20260327;
        b=oJQoO1ejJobL4jdGT3dkjIkgzaznj2nro1bB/fDkan6cLKF8b17ZNJO7oY8ROoYWBe
         fmvRyHc1BbInY7fnyx9/nuwcKSPnmj3tKg3abBPMKnd+G8A9jZH7DwsE6fKULobY/ytP
         GX6/3k3b2eLkUi23fD/jWPI/6nzOdQwW20ZELWfFPBWQjLA7gTben9aHXI10jGEcmIZ/
         nHfvBFJq+O1vtP3kTPQfWmgPCv+E+01DqILL/dtyIiSOsNeq6h6d4VxhGX0qwl7j20ue
         0uZ7svKzhnVK/kKJNEvpXY9EwG/hd6Ac7S0MLGcXrgWz1m2DfBxKx3mUDMkVMtzHp6UN
         p3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        fh=LDyU4hpMlHDzZIulbesIsjcnk9HKPENkff/riJOxYA0=;
        b=AQlpDFNyeVb7Efkp1E5f9uuhBYlhcbQ0NEFhzbA4DFsX7uwu/3nHSEK467/NBGWZHP
         8G0fWTLA4KdPc0CSbcx0yh88cUTdNL8nNNpY/VpodD1aMpzJIywa4vU1tSf4wPbjAjOR
         0V8cT/yEe8JV8ZlcegeDvnh7rIPCBILhUqwfgNiMO64mGspaL39jFXuxAWHEqAqKjp5V
         /sVJL3pdIq4/iKan2hBiHNHqME1HFRmCFSx4nOGSUm3rX2pqsuX7u97q9ePU1HNh9OEq
         Okm728s4IsIKRCzmJm0a47NEjfJfh1AmaOpfyyI2EcAz1ttGqhotPFwUcsbarld9SqMJ
         n00w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718888; x=1794323688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        b=iAw1L019pbEECqKdWoucVoYt8cFM0CJimSPA3rGm9rZtMZpD0LGCCG5hkH3c1GOMpf
         IspJYDJNQRBAf5O6qxCrg24PZgTtDkgCcJNc+Te/FaLgF/P2D2ygdPGcLtFbCUaY0gnX
         nmK4XIqfh/wBKe13PTQ3kpyVHbCepAgmJlXpEqP8L3+CnEReQhrjzuddQkWkPc8aT2Ew
         WXWATOtMwvJL4pflCNbceNHwqDeFvIKJFx0h/Vg6B5F579r0iqYdPkfD5EDX+IkmrfUS
         8lO3wA9EaUVodg+Hln22pbunmgEx1YJidGyr6Qo2rLI9Snk3VNHTBqzw5kVIPPr31SEA
         cHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718888; x=1794323688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        b=hEzWjSMcvcg6TXJscwtKCZ0qa5PKafmFZmFRTkXd+DUookF0rRtB5FrLKTclUjyong
         BhM41hactRtuWW3PSnzJfRaLuMKcwgFVp/6s0MyBXMritMNXX0rMQ5OBi8AdO5FPi1Cu
         VG8NeoOzO2XmhAZwMn+vTr9VEG2E+V2sRyNiN/CEGxXZ5K95p0YAB5uhRW6zyWeQnYeZ
         h74HJf0wVogWa7fOq/eWwi2ZvQACFNXAZyBqIx9/T0DVa9Q6ykmFuRfUDOr9E4N6/2Ak
         jo1JFSLpISlzRTXWeyTzecfNdBADB7tmkBhwYjiabS+IsfzKPvA96W04pFwQ0WltiZzK
         IoWA==
X-Forwarded-Encrypted: i=1; AKwUvBwJi25mKmY90Q2pAySkTbRUdbalFqSOslYnUMX10YRSeuAbhBJaDxCjOQQN8lIEr83A7HTinQxKUJHT9Ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VmdGwXVpVP0prG3IlYS5jfvwbgLB99FNsoKUYS7uG8EVpg0Ea
	L5jbdCOMBXJswlmp7em6OqgGedg9bmYNFuG7apU75x3CVHtcX7JI1kaaYBWshz01Vj36GaON32x
	sjW38mlZJ1ClEmHp5TG/u08igDyCGJqM=
X-Gm-Gg: AYBFou1E/l55siiUrfSIcJL5ZtECGaJStxriuMAkQ0rklKbAXSfKBZycaqK+Pe8AmuS
	ALsuhcuVRxr0yGVA1HWsBrWS5RO18MrutPrj2PnUYpPmr8o8Wk/NZuo6uQpLOj0RuMpfSx2nPtL
	wDHxUc7VqXb0dFpwnk39jaYWdsOUh+aPAP1Q9JWbCjjiqtrVU5eZif5zOyZ8KJ0st7JxNt+AMoK
	+WibbSoEAYVJ9do3TUkrKNLMoU7CUzGG9SG95xBXpu7WS/Noj23HHq3les4nUvPTjVx40XlifA+
	opGi4P/Pq35XT51PFi0RUuBoqw7B2JPVggygf2p0QyAqeDjKcaw5C5FYyPuC8h+Hj6nqPJka1h1
	79HjduBu8lrExhLdPD6+Xq2iDglZx9gYSVe4bWbJ/iWVqmzq6iljEKtO9GNV4LmT6xvaS3tM=
X-Received: by 2002:aa7:d309:0:b0:6b3:f094:8ced with SMTP id
 4fb4d7f45d1cf-6b4d4683a29mr7344511a12.21.1793718887787; Tue, 03 Nov 2026
 07:14:47 -0800 (PST)
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
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com> <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
In-Reply-To: <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:14:35 +0100
X-Gm-Features: AclHuK-EjP75rU69csZK2uVzxHspULIwEcPYYUtLw5t3M157ApaMB9lhTx9MQvw
Message-ID: <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 12:13=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
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
> Thanks, I did not think of adding a dynamic mask like that, I will look
> into it and implement it for v4.
>
> > This will allow callers of file_getattr() to know if the filesystem
> > supports ptime
> > without trying to set it and failing.
>
> So after adding fsx_xflags_mask to file_kattr, every filesystem would
> populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFLA=
G_*
> in their own specific .fileattr_get, correct?

Not all filesystems. Just the ones that wish to extend the constant
legacy FS_XFLAGS_MASK.
So just the ones that you change to support XFLAGS_PTIME

Thanks,
Amir.
