Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE61371860
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767813; cv=pass; b=iLdMks8lfq5IumCl9ugPPVWbeGnDF40nxQUQWWpLdxvA7PbO0fvbMXxK+YayM7ZRiJwcfi6U4Jq3qsv3UN0rMwrnjCuFS7hpfx/4QV60lNZ/BFhnhiEA0oj+kgaIr8sEw6mEgLQBdVRwkHKJHHargRqC7Li959q6e9RSyb27RtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767813; c=relaxed/simple;
	bh=HKlNWChrlTdknNsFl50kDymmeGcJ6nBkHT+ji7+M0pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMrBhBXI/JZTrWm0lsPs3ST0C/tqq+QGrvvvJvWYQUszFS8pY6B88bKhne4N4oA+RZ5UgiVFuaR0+ptn8X+27ckIzmzEdHIoAfGGekuQ+dWzFHBU/QTmq8bLG/PFwXohVEQtMt4WgQpeFauBwM+++4E5YmVM7pSByerTyvwQjPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+44mMVC; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+44mMVC"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso1184771e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787767803; cv=none;
        d=google.com; s=arc-20260327;
        b=ZeVqkgIL5MxMfNtZArmkLxnFQZrqDPAc58t4fN0vdYe8PsW5heDn/LPH9iJNcYJv6B
         s7QUbbyrpuNukhNCv73Pe39r7fW/12zlKpLUbRMXBE+iOif2hWdI2kUNsF5bihhrw7k9
         /n0W6XRpAHukNxuuISLmaPm6Ip1xX+TengBgrX3D++wEdmWwMh2LVyIWPxLwiVB+oQ/D
         kAc7p/4GCU6UXCMvQ0REOxBvorssY/Ma44BNHxzAJ3pSbsK04SNnKAWxnbzOUXnR91HC
         MF4AiFpEYSCpYLes+WzVC6dN2im5DSWUuFvQgJqSTkIG/UX2x8RbVyNOeMrtollspEzj
         j3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKlNWChrlTdknNsFl50kDymmeGcJ6nBkHT+ji7+M0pY=;
        fh=6bQ95NBJyLQmgCTANXQh2k7KxveuxTtFVBVkpcvXviQ=;
        b=EJs4/QJJUurXxciHficPPGCRdHnQpXfBEQk38qeNWrR9NNI/zgzuTjoSoqJacPyRQN
         a8IV2gVj3zUGDsb5v+e61hnUYA4G3iAgqnzOj/hFV8JVNTXW/AK7FuqgcCoZMXqEQMJe
         wBP4uk7GzHP66iOfsd3fesVGODkfzWgo3ybg+QQYemeSUzKjHsJTjkOvJMdHY1Y8ZMGU
         0XDEU5Pe7IhGXKp52IFlGypWVLvfOOTtVqWvHoPvIWMQ68WWxrtC9pZQzI6ZT21F/xeW
         hZDEZYalx9GltYLILMf4SCoguaBFKnjIHoaTXX7kDe3vIIx6kWDtwa4gF32+NxnIvp4v
         AQ0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767803; x=1788372603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKlNWChrlTdknNsFl50kDymmeGcJ6nBkHT+ji7+M0pY=;
        b=o+44mMVC8+PgBnfxtXNaGENBWNBnyigImkVxvNBogCnDNZqx/WH+N0TnOE6C1OeshL
         QialDiRtlYBR2rnj5Rc4olbg8TLDjtHCVem2+BjB6oIit3Tj/1AVBv5g9QFs9wAeFk52
         bv/sO3ZKzQmSwwN/ZUCCNKbw4xPGTYqGhg9ZJFLAOCxgt0Sl8CGFcr7gEE0Ayr+L43++
         a1k07z0llGi587vIZtQ7tksyHYa7c1E71C29KYE1Mh2K5jN4x90ELT5l8Ym75GOSAA+J
         5R18E5tElutlju1/lSlSY1SFcx2qB2aRAyr3pQSvnHPqN52Vrj7JlqLcdXalT+DR1igX
         shRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767803; x=1788372603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKlNWChrlTdknNsFl50kDymmeGcJ6nBkHT+ji7+M0pY=;
        b=jzCmK0NSi2VkEu0kXP1V21IS3ovVgx/tAqyEgC5Aw8f+XucjO0nL65xeDds73ZaXfd
         d+ma8Ns0q5jxRd9P2qD0d2GKBSwF/lu3yUEOgQO/hk0+YL08QgBH+uUfznVXrAW3ZIDK
         UDYbBdcqaEGA4XfbPL6VmB+rfjcgmf7CrpkclZ7xSdxAVUkQ+jLEoce1BJmujZ2FPL8e
         DEh2JfAqLc+7hD52VdsvxK3DKPFmxcNSpVoIXAMOBOfsI5jB6Jo6/Jau0z8VpQrJG7hG
         zh92Azi1DB/P3m50Usp1u9tYJRVok5joZZsCjag49M4nnnzFV9B3s70VELOjPVMMKlz/
         1PyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGQJwyLifBbOMn42kLPYjjb0HdiShlC7bSlWsVtTBAAGU6vFC0SqsBS9Hk49HKYNo+BidAKhPJvT+ZmWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kXDUxzixUnOGpoSbjKFTGzthQ3h7LmabsmUahb+QPwmBmwb74B
	lpbN0a0kvd5AA2rqROq6eVIENcg8ofd1b4RZ70K7rdYlIAgCfQL2SVWCp9KvPYyosx/HUO5Hvo5
	xdjL8K65j3tnLBx1KniWgeHEaRji7lO8=
X-Gm-Gg: AR+sD12v2ahoFI3jyV9iSJHGGSSFgBlLjK2IDHnjE7jFx7WSf5P9bmf7Ymg0EIbFwBu
	sJFnh4wBKJtplENUel71cvYq2Vnjpjtzob0mCN4tB8rCjFwAbggMUtPqFeCPaKRdqNeVyQfvwkO
	AW3GlyI55dBbLFfjn0wuCiVNtfXr3pbsGYaXOf7OnRMPZ3GeExhfL7g1Jbpe1ftZGa38GHntu5A
	+F8KLBecbOjbQbedCrSVm5DMAjsvPYqEEj1JJ+lo3GZ04LwBvPDQNdZmFUzixTTI+Tuh+RLCGpF
	jB0slWNoX2ocsYZ7C7dK2m5Z8QDj+eoewq1Kxasc7ZF8a6LK9HDoEgpcIXPzbvCKUY4z/axPkq7
	rhzlm/zv6bmMSgBNJtROm5kdXRKGdTy17rw==
X-Received: by 2002:a05:6512:220d:b0:5b0:ceb3:1150 with SMTP id
 2adb3069b0e04-5b4a901ba54mr2637553e87.8.1787767802762; Wed, 26 Aug 2026
 11:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACOAw_xpF2fBnJwXPATANo5bK0UWUEx2uNKpy2RCfZRzhOphoA@mail.gmail.com>
 <20260826170954.3878638-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260826170954.3878638-1-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Aug 2026 11:09:46 -0700
X-Gm-Features: AcwNN1U6mFU_aQynqdGD2J9fZeJHXDULG_iVi6h_430q97y92VMIyrXjYn534_0
Message-ID: <CACOAw_zpa79gA7JO8FX2kiLnXSnCcaKuVTNaL0fH-6LfpTpS0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] f2fs: fix device alias state across remount
To: Wenjie Qi <qwjhust@gmail.com>
Cc: daehojeong@google.com, jaegeuk@kernel.org, chao@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:10=E2=80=AFAM Wenjie Qi <qwjhust@gmail.com> wrot=
e:
>
> Hi Daeho,
>
> The f2fs-tools companion patch was sent separately. It populates
> dev_alias_ino[] when mkfs assigns the alias inodes, before calculating
> the superblock checksum, so a filesystem created with the updated tools
> has the mapping on its first mount.
>
> Current mkfs.f2fs accepts an arbitrary slash-free alias_filename.
> Enforcing basename equality will prevent new custom aliases, but it does
> not handle existing filesystems: after release and remount, reserve
> cannot identify a custom-named alias, and has_alias is not restored for
> pinned allocation.
>
> The added superblock commit is needed only when the mapping is first
> recorded, and the release ioctl already ends with a synchronous
> checkpoint.
>
> Should existing filesystems created with custom alias filenames remain
> supported? If so, a tools-only restriction does not seem sufficient.
>

Thanks for the clarification.

However, I don't think we need to modify the on-disk superblock format for =
this:

1. Custom alias filenames with dynamic reserve/release have never
worked properly from the beginning (as you noted, reserve and remount
with has_alias were already broken upon the introduction).
Since it was never a functioning feature in the wild, enforcing the
name alignment in mkfs.f2fs does not break any existing working
setups.

2. In real-world production environments (such as Android), the
partition name and alias filename are already configured identically
via /dev/block/by-name/ symlinks (e.g., -c
/dev/block/by-name/foo@foo).

3. If someone really wants a specific alias filename, they can simply
point to an appropriately named device node or symlink (e.g.,
/dev/block/by-name/my_alias@).

Modifying the on-disk superblock layout and performing runtime
superblock writes (f2fs_commit_super()) in ioctl paths introduce
permanent architectural baggage and complexity to the kernel, just to
support a corner case that was broken since its inception and can be
cleanly prevented at format time.

Thanks,

> Thanks,
> Wenjie
