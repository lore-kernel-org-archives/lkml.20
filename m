Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668493;
	b=m7NGu94wA6KK4mlTQLL/jZ5LEMyke/Pd17IBhp6RMo7pQ9xrq4ERC/JKRA1GD/MnF0o6
	 eqNYdpSXC74q4PF9VK0fzcgIdTVcUm2TmJfWG4sPL25x40h7Q4TZlw9YAH+edpJRA91XC
	 1RyNOvJiIKqB4B0N+XOQYnqeJsBKlMVupeE1kE9yVFw+qVGUmn2L8Lrcuxk8WN3J8Mll2
	 8VLKfO73cm+1tTigAEK9R3BBG8qmEFiv3/KunUWi1NKyk6pFgrD/TKlD8+OLWqYjTc1iX
	 seRP5fBXp6CdLg0qMoXHyYaqMbwpANTqZP9t614Ht+fDcnvwm2F8cFGMm1ZNf/QrlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668493;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=J6YI7+gHBY7EK1SmqLnbwCa4P9bf8M/zCyX1MY9akck=;
	b=ENWynX7JTUr49PIzBRdwtEQ45k0T3dySPcPOaybSeOQTsVjiwKMYL1lHYvz/ZKK50UiQ
	 A2LhMbe4nrDpQiXAysZnLGcambnA9nIXnY4lKQSVHFzczaGDy0cyz4ikgd4FKgiVuV1xs
	 ZUsayoOUJKUHz6VfgyTy9H5DoDfcTy0686hpFyIaHBnf8xM/3akNqAnsncjW23Bakv4oe
	 pZq8PlKHcaNLHEhYPK8k+dv5cBFHiYo6GkiyA7Y9dk7IHkuFyazbJHR2emCYaaiDTjaqg
	 sVrFrrEq9GWjGzE808BDl8mTtDEADLS3QqyJhrTNtRujz0+0/C/axCNfFTI/lij96Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=maurycy.com;
	spf=pass smtp.mailfrom=maurycy.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=PoOa8oqT;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509E606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3509E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maurycy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maurycy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=PoOa8oqT
DKIM-Signature: a=rsa-sha256; b=PoOa8oqTHHzq2eWlaVeWRZWPttRylgZeGc77gm1dVoZP1Qg0ezHLZ7ZDXz8gCBpEHG8WUVKxARldkn/rKFzE1b5k3zKLA2XeXLZjGZ35lgnSoa66wOBhvm548ug225aug9T4PZAYkjpan5XbntlEMb4fgmmtPeepj4iGedZ+NK4DKXW0pq9GenJsYol4kOvxZJ9tcx3jr8he20rq11UgbKev/NkPSnuhSHgzyFSiwx9U/gh0qXOEn0kDIvSb/Linm9330akJEcUfwSpf7vHNJ4G/f6Ir/g73pKJsJ4k4JsF0yYkmiCqbnTSfbfcDLPH+6VL0AT6jFbxWNmdwMmEq2A==; s=purelymail1; d=purelymail.com; v=1; bh=mimxsNqhVnd0lCdCb8owKuPr5DmEBgQ0iSGfQxmJLIA=; h=Feedback-ID:Received:Received:From:Date:Subject:To;
Feedback-ID: 1351280:50731:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -193871350
          for <linux-kernel@vger.kernel.org>
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 22 Oct 2026 11:28:09 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso649428b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0K62mqCAfSS+5S2d1H0O/ryFe/TIRX2xaO9p1aIpXnECSQPADWOmJWrP3rrfIcAOwtGIjJeBBybbHEEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4cpCr3P3CRLYW12agt4A5h8nvkGcwTRVs48l1d5vi9vraLQJr
	EmsU9UPIqKqDpASsi1l/agTXIdb3W6SvX7Oklgqs0zwH8QFGtmGjOH0uTKuO8C/tNGHVKy1TjHc
	sTA0iVEvxCLDLvABrYEnuP+mLGPsHioE=
X-Received: by 2002:a05:6a21:6b18:b0:3e2:200b:dc1f with SMTP id
 adf61e73a8af0-3e287f3fd67mr3785808637.74.1792668488506; Thu, 22 Oct 2026
 04:28:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022111700.1288273-1-hengyul@cs.unc.edu>
In-Reply-To: <20261022111700.1288273-1-hengyul@cs.unc.edu>
From: Maurycy Pawlowski-Wieronski <maurycy@maurycy.com>
Date: Thu, 22 Oct 2026 13:27:32 +0200
X-Gmail-Original-Message-ID: <CANFf4eCN7rRRfts1pQozdAq2Nn_eKJCSBTAGNjx1BOEKTtLN-Q@mail.gmail.com>
X-Gm-Features: AclHuK9kQpiKgR2aJ0KID_d9uvfCjDr7iW2kpKGkhhqYBC0Tuy32_mm2vN23hJs
Message-ID: <CANFf4eCN7rRRfts1pQozdAq2Nn_eKJCSBTAGNjx1BOEKTtLN-Q@mail.gmail.com>
Subject: Re: [PATCH v2] hfsplus: fix truncated xattr names in listxattr()
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: slava@dubeyko.com, glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	kees@kernel.org, justinstitt@google.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry for the late response. Fine with me! Everything looks good
to me. Thank you for keeping me as the author.


On Thu, Oct 22, 2026 at 1:17=E2=80=AFPM Hengyu Liang <hengyul@cs.unc.edu> w=
rote:
>
> From: Maurycy Pawlowski-Wieronski <maurycy@maurycy.com>
>
> Commit 7dcbf17e3f91 ("hfsplus: refactor copy_name to not use strncpy")
> made copy_name() build names in the osx. namespace with scnprintf().
>
> However, the size passed to scnprintf() leaves no room for the
> terminating NUL, so the last character of the name is dropped. As of
> now, listxattr() returns every osx. name without its last character,
> and these names cannot be passed back to getxattr().
>
> The issue can be reproduced with:
>
>     truncate -s 64M hfs.img
>     mkfs.hfsplus hfs.img
>     mount -o loop hfs.img /mnt
>     touch /mnt/file
>     setfattr -n osx.test -v 1 /mnt/file
>     getfattr -m - /mnt/file
>
> Without this patch, getfattr lists "osx.com.apple.FinderInf" and
> "osx.tes". With this patch, it lists "osx.com.apple.FinderInfo" and
> "osx.test".
>
> This patch adds room for the NUL to the size passed to scnprintf().
>
> Fixes: 7dcbf17e3f91 ("hfsplus: refactor copy_name to not use strncpy")
> Cc: stable@vger.kernel.org # v6.10+
> Signed-off-by: Maurycy Pawlowski-Wieronski <maurycy@maurycy.com>
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> Changes in v2:
> - Rewrite the commit message. No code change.
> - v1: https://lore.kernel.org/r/20260828-hfsplus-copy_name-fix-v1-1-75ed9=
f0f378c@maurycy.com
>
> Maurycy, v1 got no follow-up, so I am resending it as Viacheslav asked
> in the thread below, with you kept as the author. Let me know if you
> would rather send it yourself.
> https://lore.kernel.org/r/dc187921249a3f6716b829624853e64c10321cd1.camel@=
dubeyko.com
>
> Answers to the questions on v1:
> - generic/377 passes with and without this patch. It only uses user.
>   names, which go through the strscpy() branch. That branch already
>   passes name_len + 1. No xfstests test uses osx. names.
> - Why + 1 helps: the prefix and the name are name_len +
>   XATTR_MAC_OSX_PREFIX_LEN characters long, and scnprintf() writes at
>   most size - 1 characters before the NUL. Zeroing the buffer first
>   does not help, as the last character is never written.
> - Why the write stays in bounds: both callers check that the buffer
>   has room for name_len() bytes, which covers the prefix, the name and
>   the NUL, before calling copy_name(). This is also the number of bytes
>   copy_name() wrote before commit 7dcbf17e3f91.
> - All xfstests: see the full run below.
>
> Tested in KVM with KASAN on a804c5742bff, without and with this patch:
> - The commands above, and a C test that compares listxattr() with the
>   names set on files and a directory: short, long (up to 127
>   characters) and non-ASCII osx. names, FinderInfo, and user. and
>   trusted. names. Without the patch, every osx. name loses its last
>   character, fewer bytes are copied than the size query returns, a
>   buffer one byte short does not get -ERANGE, and getxattr() fails on
>   the listed osx. names. With it, the names match, the copied length
>   equals the size query, and a buffer one byte short gets -ERANGE.
>   KASAN reported nothing with exact-size buffers.
> - generic/377 and generic/062: 5/5 passed on both kernels.
> - Full fstests (805 generic tests, 608 not run on both kernels): 188
>   passed and 9 failed without the patch, 187 and 10 with it. The only
>   difference is generic/617, which fails on both kernels most of the
>   time (19 of 20 reruns without the patch, 18 of 20 with it).
>   fsck.hfsplus -fn reported no errors.
>
>  fs/hfsplus/xattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
> index 71364e093fa7..470f090b2699 100644
> --- a/fs/hfsplus/xattr.c
> +++ b/fs/hfsplus/xattr.c
> @@ -515,8 +515,8 @@ static ssize_t copy_name(char *buffer, const char *xa=
ttr_name, size_t name_len)
>         memset(buffer, 0, name_len);
>
>         if (!is_known_namespace(xattr_name)) {
> -               len =3D scnprintf(buffer, name_len + XATTR_MAC_OSX_PREFIX=
_LEN,
> -                                "%s%s", XATTR_MAC_OSX_PREFIX, xattr_name=
);
> +               len =3D scnprintf(buffer, name_len + XATTR_MAC_OSX_PREFIX=
_LEN + 1,
> +                               "%s%s", XATTR_MAC_OSX_PREFIX, xattr_name)=
;
>         } else {
>                 len =3D strscpy(buffer, xattr_name, name_len + 1);
>                 if (len < 0) {
>
> base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
> --
> 2.53.0
>
>
