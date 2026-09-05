Received: from va-2-19.ptr.blmpb.com (va-2-19.ptr.blmpb.com [209.127.231.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0B35201D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573588; cv=none; b=LYX2tPRIWSD4a+UNn2RmoQH+JuDhhLua2ZjFu45HiYbX+6MERyHFzP7VCcjSPQsLvD6PC6xF9Wsv4N58MwxeoJnGpVDtSTXwwMcumMcfHNgvKjKECfw7+8K+3jDGlSksKAFKrGSxzVDF6IspwBY1QgRkMU0fydwCvPowJjB4j9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573588; c=relaxed/simple;
	bh=DIC96otagZtJuR2uB89/SIte/P56JphTotHcrN06TQc=;
	h=To:Message-Id:Cc:From:Mime-Version:References:In-Reply-To:Subject:
	 Date:Content-Type; b=otQ7J/XqmJRRu+cnoomz+Kh4ZxZwoEdZx7zjmBnobUuZPkOUCJT9K5AwxqaatGnr84bf5VsZhHXspcpU2CN7p+iR+YmHdzXJNDruFtCdPT4Re8CBElHE1JKegBAe+k7M40EgsFn88RGYlSzfGcact8ZZHqsXEdU7qVrbElVzhyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=amWgXvIo; arc=none smtp.client-ip=209.127.231.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="amWgXvIo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1788573578;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ejr5y86eKNB893asXhaPTaG0CMPbNRB19MDb2BfT7R0=;
 b=amWgXvIoZKI7rG907ra1HFujDtGTDIiWgAuTavVTsa6YIZTKdUqZ2s135FqwHEloXqMNI3
 fr98sGOrQpiiPJwqAZd6G0xjHbtY+3Cz1Y+47d80PtoHvSHfAGWC9HB9OjL0FNUmM5siXc
 hAYKsHWPvnKLYy7Fnk2f3oBns4sTWYJdfquRoCcyfUzX00dznBRpMaz3tksEXd5B8nXD5h
 JYAGkIuhOYimKVHkbGhG8Of7XsbAvcgcChjesbfj74IxLQF0/92xbqWOQKqEybnAplK8tA
 jHbcQ8JSnvR5vR77TGszyKpAoCoZzWFxN+KlxTezjCj4nhON74FPyQN/f0oDmQ==
Reply-To: yukuai@fygo.io
To: =?utf-8?q?J=C3=A9r=C3=A9my_Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	<song@kernel.org>, "yu kuai" <yukuai@fygo.io>
Message-Id: <9f3f3606-6e9b-4bd4-9c9d-be4f202b1222@fygo.io>
User-Agent: Mozilla Thunderbird
Cc: <magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	<linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "yu kuai" <yukuai@fygo.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260820210703.3035608-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260820210703.3035608-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Original-From: yu kuai <yukuai@fygo.io>
Subject: Re: [PATCH] md: reject v0.90 arrays with too many devices
Date: Sat, 5 Sep 2026 09:59:33 +0800
Content-Type: text/plain; charset=UTF-8
Received: from [192.168.1.104] ([39.182.0.178]) by smtp.larksuite.com with ESMTPS; Sat, 05 Sep 2026 01:59:37 +0000
X-Lms-Return-Path: <lba+26a9b7789+7d0aa1+vger.kernel.org+yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2026/8/21 5:07, J=C3=A9r=C3=A9my Jean =E5=86=99=E9=81=93:

> The v0.90 superblock has room for MD_SB_DISKS device descriptors, but
> super_90_load() only rejects nonpositive raid_disks values. A crafted
> superblock can therefore copy a larger value into mddev->raid_disks. When
> metadata is next updated, super_90_sync() walks sb->disks[] up to that
> count and reads and writes beyond the 4 KiB superblock buffer.
>
> A checksum-valid RAID1 member advertising 64 devices can be assembled by
> mdadm --incremental --run. The first write to the array then produces
> out-of-bounds writes from super_90_sync() under KASAN.
>
> Reject device counts that cannot be represented by the v0.90 format while
> loading the superblock.
>
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>   drivers/md/md.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

This is a long term problem, applied to md-7.3 with fix tag:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index d1465bcd86c8..873a0e5fce7d 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -1398,7 +1398,7 @@ static int super_90_load(struct md_rdev *rdev, stru=
ct md_rdev *refdev, int minor
>   		goto abort;
>   	}
>  =20
> -	if (sb->raid_disks <=3D 0)
> +	if (sb->raid_disks <=3D 0 || sb->raid_disks > MD_SB_DISKS)
>   		goto abort;
>  =20
>   	if (md_csum_fold(calc_sb_csum(sb)) !=3D md_csum_fold(sb->sb_csum)) {

--=20
Thanks,
Kuai
