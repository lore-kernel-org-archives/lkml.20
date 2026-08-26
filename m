Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AF411693
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762343; cv=pass; b=pNp/MeBXSglF/TaO7oMeWVi6Gvn9/IhQYTIcZRx2KZhCE7hZLnw0hKH0azq9yFYYj3R4b/suFLTidGI6XyW1EhCeenHNCBaaYYR7ZBz9dpn2H61k5hhQJGnVKZJv/K9O1NI3UDQZREPICMFIwlyQpDgwZxXCfuOseBNG1M1QPFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762343; c=relaxed/simple;
	bh=lFi74h/JZOOuFYSN0MxBQNSzJnsFIbge22WE6+smq1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jy7K1F5hSFl5+c8F+Pyk/VohYUExNlVnFRYu5WLybvFuQ+T0CvbZi+qENqGkBFeZNikEu4lnRLtDvYw6EldzDX1LnxmpAvrw5tn39u6JjDmow6ml8VUtwynNMKwcZTwLz1FvzGFmYU7ABRvJfQ4QbTguy86F1XTbc3HNWRdvPns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzmFTLmx; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzmFTLmx"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so99635e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787762321; cv=none;
        d=google.com; s=arc-20260327;
        b=JvMTq8DTlYuouzfrwECOJj376IkKdq8QnSB8yzj49dnPdmhrL+M2DKa0ExbLtZG35u
         gBEl5jberAb1VQRq6Zhf0QQUJu5Cf4aWIY5XfdbTFN/ZXjoGnT+i+fnbeY1WTNU2fhFP
         klyTPWXBt96le6HL+XsVYt0cpScDYTPV0i5FudM7DJ0ptXQ0LsnTnlj8amMYS4Rgy0eD
         z1NCNriGNjiI/NHuXC/HKQX5Iz4mCN/2r9ZkllUQZpCXZ1+4GQzSCoNUivyibOVTLPTm
         N2ZzNlhCbDCHo/P+W0WgY6MmhoPp7Okj4UKojQyx93TAOE8EngGnwXu1WSXT0E+Atj7H
         58RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLm3Wj46CL3RhIdYvP1hhVnQ4SPJTUELaPo4u1suXgs=;
        fh=/FbAyqxPYdASWY1zsVMe89B+pnrmQQlG+qRCnObi0q8=;
        b=XdMwwkilaXjH5kJ3SJc/qPsQPF4wUeKga/3rbjxmjBesxosz3Ir5b2XOI1PdPXsy5K
         N/QcZ6pD9FHE6XzpI4hJYTQPZdgxyu2wxjQ2snMI7Z45VuGNgQs4qoSi/HN9cdI1zdiu
         N4Cg27JhwRru0kjikLUkVPnOF4LSHCIoCsO4JQeGz1idF1kBVdmgQOI6Io1yW32cLiE0
         DIJRNPpVuNcG3wKjcuw6UTvU/ZDsH+wcy6YT5HbMZjIkjHCozLXsuyatyEdtAFZEOLX+
         oqXOeRKZ5S/5LBXbG7iZaQj/c18UTU5Wzk1XZrXMpcnEhhT1lPm44E/9iqkON0K3eUIk
         antw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787762321; x=1788367121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLm3Wj46CL3RhIdYvP1hhVnQ4SPJTUELaPo4u1suXgs=;
        b=OzmFTLmxvjs+ud3CCknjOYdtjWAxcOhZ+aWZpqERkwgdte1dZIJbTNh3sKz6WyWSm6
         VR4iZCDyLiYL3KB12I5tCsKWMzxdi+sd+rvb0ZBBYm3+SgikEOsPj0pccfa+63cX9OX+
         ePC9kWMYRnzX+vMgqAO5j9lGhgS8cDXcWwhV3ZEj1OYXcq98mX1UbsaesllA809X33jj
         jQoH3+iAPWfoZSWM0b149c/xLHVpLbnpZ0eSgf9JucQ7b+BbMBTbBm6S5wYqobBDmfrJ
         t7NixMYenNbKYtL6FHR7W2fSnJQ5tfu/tUXVOumw3X+r3AWnzFyzyKQYc0TggtCr89yb
         Rn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762321; x=1788367121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLm3Wj46CL3RhIdYvP1hhVnQ4SPJTUELaPo4u1suXgs=;
        b=knF6z8g0SPTMuOSI/wf+ivPd3t1yXvXcskR8K5PwxNsRG+wYtkWtWDY/JBUlMg0T0M
         sptS4nWQKf1szJqmXw/74vhsIw4tAO6oVOfTRobRm8USqDW+Os8aAFRSqwx6DtmH1CJQ
         CdqOS5g1AVnlcdv6qFZWuR6owy7BgB1/6dWAs4Eol2Ls/abiZ0fdNg2N+88bIhiEYdpD
         2X22/WWTcNQepsEiH2Kn/pxSkNpDp1KqeiCitt6y19Ma/NJ7B94QjAQvr53A7WedNga7
         R+ZvBDZCoSz+qsjXWLPC0eWcNe2OZUch1U2FKhWnVhbw41dCunumm+JGixxU/eqdiIgP
         Hx8Q==
X-Forwarded-Encrypted: i=1; AHgh+Roz3viQKDTzM07yqSSKc19Donao6l/rhJVdojdp3SyVnP1DBSBOTJBDmV0jNhX6Oh3ghYhimU8GKAER37A=@vger.kernel.org
X-Gm-Message-State: AFuF++n+V5kphFKK4s4FVJLHRxwNSo+YMaA6Ss5bnc4xN4LACeBdHNKz
	XdfQi+4tExOaGq8exRFZ1PM/ogTOQ1LACxP+eqmIWyQ6SdLr2EKIumaLXpTHHReCsA74wnop8rg
	ACsT/FKPEI5Kf9sN8113NCUh0/EW25cA=
X-Gm-Gg: AR+sD128oDb/WXYG7PDTZvkc7ngtKHYBMH7zzSGkWyE8hAZvF5SrlVr7XRANAryC5T2
	KH4iXj8mqOihhdWU5st6T0k9+tH6sOHeCeoI/TrebucNlpd1tJmpxmHq9WqwpkdfG81ugfusSiu
	5XgvfY6DrWO9RASrkl5kXK7ld7LftRV5xAju7VrdS9xTZC09VrV4IC4HN1VnPeqTaZ59dcFsZXR
	b7T/T0kwLPVvkyk+M7aSoKYfU3Pdl2v3Pae9yKGy/wr/u+FgrXe9L40DRLlyxmPWQb2O/S3f4WZ
	cc+7Z880osvQ2sJkS/FwmD5AYQ6WZ9Ez2JWi6U/j8muJUa06fptKHVyk8KxjazeywMW67C/H5Ez
	rqgHsgvCttG8TqCIHh8sN7I7mVGwN9+ZidQ==
X-Received: by 2002:a05:6512:3086:b0:5b4:ab0c:f606 with SMTP id
 2adb3069b0e04-5b4afe94044mr132795e87.2.1787762320578; Wed, 26 Aug 2026
 09:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Aug 2026 09:38:26 -0700
X-Gm-Features: AcwNN1V5krk-Lrgjk4QJD4t7rLKQ-7dJrnID72x_erkj7QQ5LgMpyhSvR4rAvDQ
Message-ID: <CACOAw_xpF2fBnJwXPATANo5bK0UWUEx2uNKpy2RCfZRzhOphoA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 0/2] f2fs: fix device alias state across remount
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, qiwenjie@xiaomi.com, 
	daehojeong@google.com, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 8:42=E2=80=AFAM Wenjie Qi <qwjhust@gmail.com> wrote=
:
>
> Split device-alias remount handling into two changes.  The first records =
a
> stable device-to-inode mapping so a custom alias name can be reserved aga=
in
> after release and remount.  The second uses that mapping to keep released
> alias devices out of pinned allocation, both immediately and after remoun=
t.
>
> The f2fs-tools layout and mkfs update will be sent separately because it
> applies to a different repository.
>
> Wenjie Qi (2):
>   f2fs: persist device alias inode across remount
>   f2fs: keep released alias devices out of pinned allocation

Hi Wenjie,

Thanks for pointing out this issue and for the patch series.

However, there are several concerns with the proposed approach:

1. Fresh mount issue:
Since mkfs.f2fs does not populate dev_alias_ino in the superblock, on
the very first mount right after format with a custom alias name,
f2fs_restore_device_alias() will still fall back to the basename
lookup, fail to find the alias file, and leave FDEV(i).has_alias unset
until a release ioctl is explicitly called at runtime.

2. Superblock updates during runtime ioctl:
Writing and committing the superblock (f2fs_commit_super()) during the
runtime release ioctl path adds unnecessary complexity and overhead to
regular filesystem operations.

3. On-disk format change and kernel complexity:
Modifying the on-disk superblock reserved area and introducing
validation logic in the kernel adds notable complexity to resolve a
name-mismatch issue that can be prevented at format time.

The original design intent of device aliasing was to map a device to
an alias file that shares the exact same name as the device basename
(for example, /dev/block/by-name/userdata_exp mapped to userdata_exp).
Rather than changing the on-disk format and kernel runtime paths, the
cleaner and more fundamental fix is to enforce that the alias filename
matches the device basename in mkfs.f2fs.
In addition, we can allow the `-c <device_path>@` syntax in mkfs.f2fs
so that users don't need to specify the filename redundantly.
I will prepare and submit a patch for f2fs-tools to enforce this alignment.

Thanks,

>
>  fs/f2fs/file.c          | 100 ++++++++++++++++++++++++++++++++++------
>  fs/f2fs/super.c         |  48 +++++++++++++++++++
>  include/linux/f2fs_fs.h |   3 +-
>  3 files changed, 136 insertions(+), 15 deletions(-)
>
> --
> 2.43.0
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
