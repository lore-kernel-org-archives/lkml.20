Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275914B8269
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669004; cv=none; b=FGs9W9DgpAVz5NaUOYC+3N5b1S4dWrVq/3IQxkElkVPVZkz7DGPxbGIoyh/FA5GT05DriGItkXsysZIe9/T7YnsARW7sFFXaLH86ZNpDAoUAxrX4OTPtPDiCAaON7TlIEXUTPmnlZdNWgQEus/PZe/KXk4RQOVKe+I1rcTfTEKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669004; c=relaxed/simple;
	bh=YUAVxI5dc03S0zeECje45BTlBpm2/Fg+eKPXp8V7y4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uYuqQRJBdsnbwER9ggpkLguufofj82O9Hc+WTCpCh9JMgLx0LnQAWnNqzU6W+NBCQ/06B/6820g6DUlK9CQnC4sf6RiI5+1u7unezeCCPjdjq2hY39G7L/5mMgWMOIQKzglimopgZo6cOvCYlSlo81S0QgdwTDTPs/bAId42wQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=bK4u2w6D; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="bK4u2w6D"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf30817so8052707b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789669001; x=1790273801; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wcatl2FM68cEA06f+xMKVjH8U37nUaoUr7RucWDfkdI=;
        b=bK4u2w6DOKcKDRo8gFU4xh3H4hpDMPsl/luUemzi0XIfL4KtKYaLAOksd3YKXGRIdD
         4ktXU0x817EjDUUhCTxP/3jcjwHGNzYyUTezkdvGlg0+dWdgK6XJvzmrJQc2Xl6F60Ib
         +IlbHdfWx/NZzOSy7bM5BcMBVH3KPuHOxqRsKMoMt1slQdih1XQq45CD9KlijsRc4An6
         X4ZZJewnEH6CiGk80fqDZpVW1nfT8H8twMALB4D0Xywc0L0B9qhq39J9Bni72GKnfl4I
         t8k0ZptcsKrWyd4gjHn3AA/KYe2d1GXOcxQ+0DTQrAVjK6gfz4FKjfmdLbk4WyOo3aP6
         varQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669001; x=1790273801;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wcatl2FM68cEA06f+xMKVjH8U37nUaoUr7RucWDfkdI=;
        b=uLt1XYOYVJ3TggzdHUJbayKupEXWQzwfAHlCkG9E2QJsXtM9FZ+Va/8IARnKX3pLEW
         xhCiuGzIPm3aY6qTHJYPagnNN6E84g96eQfuB64y/Lw9pJmIdS6+WURLlf9vwOBlrvBu
         mBDYQhoWAeFAPA/e48cG0zjm0ck0Imr6rGrx7VSOTIGYbDxFMQwKRpfIsoaGz7gJE28N
         EL80LDVgBQqsg/AqCVnu5h55OWRXCopQWbBrKZplRDvz5E5RIJxR/tWDeuxzm6rKnrDt
         4X940PQySENy87a6B6rN1p/KlccY7y7wXyZSjPg5kQ0kjWaBBHUxwxz4QDSsDjt9HYmv
         xLCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdyeQ5K++o26m3ZrRC+4r5joHmcxvL5ky+ZrB2/z6erbXmT2uhxYFwHqTz0WtXjsT3xitP8iWq22Iwrcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lwOJmYlUjYBxNQC2Cws/EyqcRtaW82R8eXFDqv98jarMfh8vgM
	/xvyn0r/AIHpFxE/tH99GLUCePE0y6F3CVXiQCbMs6F2it1N3TQ+SV1yGflmzkAHPrM=
X-Gm-Gg: AYBFou1wZMAr/0FNYWMFDJKGcA8Mb21A/4r6kzuosUftTgkwp82fxBwDUBOHPJ5LcB0
	D1AIdxECoVO43Ik+YpFBgqzdMJvA29SJFibyPWcxacNnhAe2epVBe+sHJ9eOJc/Nqbm2pK73HLa
	lrQjFX654B3hoii5DQ36VW5CVMgT66HpzoqInDFFizieuUC0BaapHSMO5rbi8PcoXR5bmsFQGH9
	9GLrlYEXejAf1Jf1xPh2hHlgrAssxXcysj4mhDMl04YwXQITWD/GTWWRBCJ6vkRsM/8NidP5U8N
	tXHsKGgo0AMbcoX04NQZ96/IJid4PExAXPyqwLyFsX7cukFWq1efqzZ1I0yUZhr1wL14cdOqDja
	nle7Uplq2Gf1eQjNBkN5CG/dEJww31abwPEyD6r4WZXzp9CcWYtRGDeGlJTVziRr4ovqvk03Jb6
	JI+wr0pO1aQ9f+wKuLiB7Li6xzmRPRyBoAbCQYfSr3rKegpHjZmeM2OxJUMvdxrST+gCoHvougF
	zo6tD4OCbAPtJVQFLMb8KJBfkDzSmqlguWjTZM8cW7JQycgrmRGG3xgWPkGJxAC/oNb6JCjQQj0
	u8jErXAyLu6cMm00KtaUjGyiP7s+4Z05SjKfSWFsOJ0bfhvEgJkKfuX++M31c8Cq
X-Received: by 2002:a05:690c:6602:b0:878:cee5:989b with SMTP id 00721157ae682-892207639c5mr22526107b3.6.1789669000735;
        Thu, 17 Sep 2026 11:16:40 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:b801:b375:5db3:9ec3? ([2600:1700:6476:1430:b801:b375:5db3:9ec3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-896c4c852e9sm2569527b3.6.2026.09.17.11.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:16:39 -0700 (PDT)
Message-ID: <a99ac0a432911dd0a356d4fe95bae45973f23cb3.camel@dubeyko.com>
Subject: Re: [PATCH] hfs: return -EPERM for unsupported setattr changes
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Davy Felipe <davyfelipe34@gmail.com>, John Paul Adrian Glaubitz
	 <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 11:16:38 -0700
In-Reply-To: <20260916224016.266800-1-davyfelipe34@gmail.com>
References: <20260916224016.266800-1-davyfelipe34@gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 19:40 -0300, Davy Felipe wrote:
> hfs_inode_setattr() rejects unsupported UID, GID and mode changes,
> but returns the value stored in error when the filesystem is not
> mounted with the quiet option.
>=20
> At this point error is zero, as execution has already passed a
> successful setattr_prepare() call. As a result, unsupported attribute
> changes are incorrectly reported to userspace as successful even
> though the inode remains unchanged.
>=20
> Return -EPERM for these operations while preserving the existing
> behavior for quiet mounts.
>=20
> A chown test on an HFS image reproduces the problem. Without the fix,
> chown 1234:1234 returns success while ownership remains 0:0. With the
> fix, the same operation fails with EPERM and ownership remains
> unchanged.
>=20
> Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
> ---
> =C2=A0fs/hfs/inode.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index 2aef3c36a150..cce3a7bb95e9 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -663,7 +663,7 @@ int hfs_inode_setattr(struct mnt_idmap *idmap,
> struct dentry *dentry,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 ((S_ISDIR(inode->i_mode) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (attr->ia_mode !=3D inode->i_=
mode)) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (attr->ia_mode & ~HFS_VALID_MODE_BI=
TS)))) {
> -		return hsb->s_quiet ? 0 : error;
> +		return hsb->s_quiet ? 0 : -EPERM;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* map file permissions to the closest allowable permissions
> in HFS */

Looks good.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.
