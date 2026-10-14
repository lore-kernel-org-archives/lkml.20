Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F984C651E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981899; cv=none; b=KUkwQTY43BtbXu8YV/1z+r6bS4fpfoFJP2qjvwd+A3deRDEYyIhdX2Mg/e8FyK9WnmXuM9ev1fMBKQkeemJGRgqoaHuIqyqHdhuSQzLkTOqzQXFuTbxUUsMKQQFmmNLPv3ZsYZCJyRrpbkepgDQyvX7XIqSVmpqPQ3fLqzNhaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981899; c=relaxed/simple;
	bh=jlkg6Pp9S5K6OjqDHZJE27nWpXn+g10CvZhATskod9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZav5B6KbDkc68lJmNAuz0UADCoWWTzrs+LcatruRXihd8ifdUz0Sn+hwcDM3z2lc3HXEIQVgwDdDP/VvBrS6FpUyPdAqZO3vnzYaYS8MyfHYVFHJQph+tMEzXqpBH8IVfvXTYVirNHmLtNuhIipaUnPQJJWxxQv+h6UTENoxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUV9RsN7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUV9RsN7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BAA1F00898
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981898;
	bh=jlkg6Pp9S5K6OjqDHZJE27nWpXn+g10CvZhATskod9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cUV9RsN7MPaUayQSlydVagR7Gyx9JLiMfjhfYZJMuXev9DtNRzEUa9bSbCgeGolZF
	 CbW8lCPQAklOqTxEtEK3Y4w4/pfknVyNR3xBcgoVuUvCOF2O6s31d1qgyu7gQDEmnR
	 AJmDkargcJdUylKDQbWec0mzVVQavVYYMN5ZW/HBI1X4UuJq7GSGh1Gpee3TCtBEp1
	 CrgmqFo8Qx8MdWTLrboV21/zryvSWVGmsnkS5/YY9kZK+KYzGoJICphtQUxhPSsEJu
	 e/9moBCl359hQ6TV8Zpb+hCCcobCdcQh9IWF43rDrOok5sXOzycDmmhNdGybjlWIGv
	 xFdb2pLQ+fNlQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2a4e013a44so158240866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:44:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIwnCJQdFjWsbdOJLl6gCDooo5RlqjP4I3s5u7HMyUX2CWvf5FvjdCvDj0wlKwVmWpnyw48Jl8i0H6ebA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW4585tY1NL32Ds3SjnRq9uOOu4BDL/9NESH1qzRqRs8G4OsbF
	1p6q7l8IDBQHz1/kcUZbuju5F2kEtD678NhfBxlPzRt+I5W8qw/k5qU11vkVxfoxYKYVH8ETnGP
	BGQMyorfkTQ5KxZv2v/Cp15qoCdt8QxA=
X-Received: by 2002:a17:907:971e:b0:c2e:4831:1442 with SMTP id
 a640c23a62f3a-c31a9a046bcmr1398161066b.1.1791981897013; Wed, 14 Oct 2026
 05:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013234310.836392-1-liubaolin12138@163.com>
In-Reply-To: <20261013234310.836392-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 21:44:43 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_RbY92zjeAXXjmxBSPoBLLLyLkov0JcvLksd+QxgknuA@mail.gmail.com>
X-Gm-Features: AclHuK8IGpmJGG5lHjhKYsUqNdolcBK51uG8dYcXIGxQjTdotJ0LRSHa2Uho0uc
Message-ID: <CAKYAXd_RbY92zjeAXXjmxBSPoBLLLyLkov0JcvLksd+QxgknuA@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: support FS_IOC_GETFSUUID
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:43=E2=80=AFAM Baolin Liu <liubaolin12138@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> NTFS reads the 64-bit volume serial number from the boot sector but leave=
s
> the superblock UUID unset. As a result, the generic FS_IOC_GETFSUUID
> handler returns ENOTTY for files and directories on an NTFS volume.
>
> Register the on-disk little-endian serial number as an eight-byte
> filesystem identifier with super_set_uuid(). The generic VFS handler can
> then expose the existing volume identifier.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
