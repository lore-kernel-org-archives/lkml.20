Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794660616;
	b=sL7EhVKr8CFcY/ZibWIiVwcPYGGDisS9UPKw5itmlHHYzs670hsRqVCSWXvikKSJVBiF
	 QrkANk9/WUgb6gv0OQAVjV+wYf4eyMJH1Mtfh3mlausT5DTpv/qs9cTJ3kpVWZM9RJWAm
	 3GHWyPp03FFq7KVcCdOx8vWXECyKDsV/gsf5kjkDnmRdFq6N/Lj4B/VMncFASG1DAd+A1
	 rfY7QSzxlhNXaNqWgK1wqwvr+PKOGkHGOWLtSeIb4t6ku0Vi6cd9j8w4I+tymTifRQvqm
	 fVTzX2vh7mcydOCzPVwcz7wBh9nhLlN/lqQDmzbdTs8z1MhxkDf1XQgt6FvCaXDk0DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
	b=aN64M1zsYQS/eUdiZLQiVyu/XFapsmXZSSmUV+Fmwk7wqwvVJYuALCwMY3ZAh0xO1fq7
	 UOrhcBU81C9augjPNH9sNufSbF5hLjjsX1yCo6GotLOVCm9ZGl6mbwh+7vOq+aeFBDsQU
	 vRa3HF3V0EZa9WMMA+5wSZhESkJ13j3cj4ehAheZn/DZlJniQW84CL8QwtudTDqSrPnMa
	 FjxPvb3goC1WPMpqAVHpahvn7iPnhZAXzsH0k3rNkxoEZVsHE4mOslp+unkixkUgplrU+
	 zJzFblsNEbXwh0i0H5TqW6monz0lVelW0vejYFYUeWMRU1NU3A/QpXa/52oUzmFNXow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHLxnGAb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482B606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8482B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHLxnGAb
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37198ed3727so3347619eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794660616; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNLKa3mSq8ERS2TtJtfEExk6/XggzScdBmU/kqkVyvR/r4PQRX18Bl7DQfSm50fJd2
         gMG3oW3Edl8f9AMTUbybXGyqxrqv7CnAmxgsn3oa2ON64w4SGJPI4d7X0EXKsAVStxY0
         3wgbf+OkvmuJbKYyqHi2jjeaAtJwk3ZaL0NqGt1t1EGtmCzdbIzQvShXX/WWQiSorMAO
         CGh8Rshe+w+RrofKWpYeHqcrQwDXZIW0uDFmvPpeJELxkRmBjDeQ81LB4utvYO3DJ+Iy
         DXlSouDwkm4qub/BGrsLj+sj2iXze/4e9M73eR+iDOLkR6HSn00MiGYvKOODusQmqQfG
         s1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        fh=riHxHh75DjiDr02ziKSYsPHGXMIwaPO+xHd3of52nfQ=;
        b=ACK+n5tdq0kJAros9DL8N8AqhTb988Ybkh3Un7B/97WayQs2tC2MPbMAvxrbY5FfCY
         pvcKoFpNDxfNpKdOxINDSyXytdz6RmqQuPd9/7oUjYfZyaYlzbpJSsEXJH3l0s1wzBF3
         1FYRffKCKkGIf6MOWzn9qDPITnECMxJdY8k6qx0KlL/DLH0MtXbSkHOYSez781gXRMuM
         aV7oC4qsiStGkVUWkivFXuaEI5XsLkw2/6QVx9NfhQZzOIsY7cdX77ynNnrjP7goD5Ux
         9oTD2OeENW56R4SqsWnxa7Fbi/17CH7TtnAG6dxeTo8wK2HYnHD+pfx8zkJcflzzKIcA
         bO3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660616; x=1795265416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        b=rHLxnGAbFSmDpAxmVZJvNpdCvaeisiLzrYpTLQmYx9KMwRsWnPOlyDTMEwJXU2oc+R
         +rFSTlhBLkqQm5lE7fcQ2ATaGfunF5QpMjsozfS2ZPwnSj9xiBJP8hp9hWVWEm/rgQs/
         TE7rhoeiNtWYohZKRkPourE1IjEC3vPsiYcZ7x2k6V8qkMhJ05rQyAUXr7UtH5S1L+qB
         ZPDfHtuCTnmymz9uQHhfcRnwn+LQbb4qT6P3L/9cRHn8fR2irpm5Y2oqa+pY2XqmEloD
         HOFOavPKC86gWRu1zg9rQzhXx+arrrREhY/Zibc7nIQVVgxp2Z51cfXBIgKPFUmdpfBy
         BSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660616; x=1795265416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        b=gE9BuswKP2BTMYvXx9fWwiaJV7FIjmik8u98QoLZoQhjA4PM+spNFBy412EYFsPOQc
         gPwSWnDzfI21MzhqqpwaA/FCU31W4RwUfn0NlxMHTHSWIj0Xg29bSO7HYUN4z6qjjpTE
         CNEhEXaewqytO0M7pBm0YF71df14mjztB9Zo0BRKkAgT5mUNf3n4o3EAcjJ7zNOXcdld
         e6Egr5P1e7TzWaCXCPossR8xLykp17ZPE4bNxkRzSyxn8sl3UTTIN9uz1Zpx6SezEM85
         noxS0zFecSmH/7Bm15dS1bsG+WtXHMqfLvFl/Elru8ChYTZzmyA0gYoIxpA7FTJqQy3J
         OK4A==
X-Forwarded-Encrypted: i=1; AL+hErHfLjwJ0AfzPkifA2I8yQ+Nqp74VoTmenR5eLorVQoMvd2A8BBXrLaiJR4NDioWOOqQ/Pd8TaYZCRmkaSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jivG+gvMkUN1JJIKGfhBd8ShQvePB9ss44sqVsREQQkjWOSct
	0IsIQKvmdcDswYthGXHb09FjUy61wOgXTkPjrQUIMtMMAza8QWvd8CYRI4wiCvH/S2h6xb4gVSK
	bS+XPVseipd7H1e9NYh84JQZfixTPor4=
X-Gm-Gg: AYBFou3kmql02HV/CQZOqn5ImrnuQF+TZwvLuAa1x5jLdx+xp/OvztI1AiCBRhNqkqf
	z3yLaamwNi1nGMZ7lv5jAPUd/+jo6ysVdMZd5fOXpGTkuHFgjTa7frQh5rsmns2hQgj68bjFZWC
	IpG6Y6GFORvE2e1ndD77LccuF2OpmKZdpIEfmlZR/E8pYY40hTr6pfgf6GOCPWCEK54kuZkWImb
	xa1UCw7ni3ofIdRkyTTLcQ1AmeRIx1Zl8lTyZMCIXVhyxhvhBknp9xqnChsQdnduaiXRlfatD38
	9MjUyTbiBqN6wfIaHNAnq9pFI3Hh1v/ScHSxl0GNgHXFslBJbmP141ZAK5ygf1Ia4rUrvYqEMMX
	YbB2wKCKKRWFivHeGUrkz8t6v2linRCpmyktqhUv4QrKh2wfWO9GPuxGatroHe/Hm/FiuPm/aJt
	krLVkr/FWmu9ROW/vaNV0rm8cPsuEzhd2ipdDfKPK2
X-Received: by 2002:a05:701b:2608:b0:1ae:d447:6c84 with SMTP id
 a92af1059eb24-1b4f5f6471emr6935062c88.19.1794660614833; Sat, 14 Nov 2026
 04:50:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
In-Reply-To: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Sat, 14 Nov 2026 13:50:02 +0100
X-Gm-Features: AclHuK_R76m67a3L3t-pYvKsH2nE90VH0yHZRxCdMvakyYIbxZrTCTjMoJpBnWE
Message-ID: <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hi Konstantin,
>
> Since upgrading from 7.2.11 to 7.3.4, files and directories on an
> ntfs3 volume whose name contains a colon are listed by readdir but can
> no longer be looked up: stat/open/rename/unlink all fail with ENOENT.
> Nothing changed on the volume or in my fstab; the only change is the
> kernel. This is caused by commit be310476e886 ("fs/ntfs3: Add basic
> support for alternative data streams"), merged for v7.3-rc1, which
> enables the new 'ads' mount option by default.
>
> Example (the directory was created on Linux and was perfectly usable
> with 7.2.11):
>
>   $ ls -1b "Game Soundtracks" | grep Reverse
>   Reverse:\ 1999
>   $ ls Rever*
>   ls: cannot access 'Reverse: 1999': No such file or directory
>   $ stat "Reverse: 1999"
>   stat: cannot statx 'Reverse: 1999': No such file or directory
>   $ mv "Reverse: 1999" "Reverse - 1999"
>   mv: cannot stat 'Reverse: 1999': No such file or directory
>
> With 'ads' enabled, ntfs_nls_to_utf16() splits every lookup name at
> the first ':' and treats the rest as a stream name, so "Reverse: 1999"
> is looked up as stream " 1999" of a non-existent file "Reverse". The
> real directory entry is never matched.
>
> Why I think this should be treated as a regression:
>
> 1. Userspace that worked on 7.2 breaks on 7.3 without any
>    configuration change. Names with ':' are legal on NTFS (they exist
>    on volumes written by Linux, by ntfs-3g, by macOS, by WSL, ...),
>    and they are still returned by readdir, so the directory listing
>    and the lookup now disagree with each other. Tools like ls, find,
>    rsync or backup software report errors, and the files cannot even
>    be renamed or deleted to work around it.
>
> 2. There is no obvious way out. The current mount line is:
>
>      /dev/sdb1 on /mnt/HDD_2TB_WD type ntfs3
>      (rw,noatime,uid=3D1000,gid=3D1000,dmask=3D0000,fmask=3D0000,acl,
>       iocharset=3Dutf8,prealloc,ads)
>
>    'ads' is shown although it was never requested. Following
>    Documentation/filesystems/ntfs3.rst ("You can use every mount option
>    with no option"), I tried 'noads', which is rejected, because the
>    parser only registers fsparam_flag("ads") and fsparam_bool("ads").
>    The only way to get the old behaviour back is 'ads=3D0', which I only
>    found by reading the commit message.
>
> 3. Silently enabling a new syntax that changes the meaning of an
>    existing, valid file name is also a data safety concern: with a
>    regular file "a" present, an application asking to create "a:b"
>    now writes into a hidden stream of "a" instead of creating a new
>    file.
>
> Could you please make 'ads' opt-in (default off), or at the very
> least make lookup prefer an existing directory entry whose full name
> contains ':' before interpreting the name as file:stream? It would
> also help to accept 'noads' like the other options and document
> 'ads=3D0' in ntfs3.rst.
>
> Workaround confirmed here: mounting with 'ads=3D0' makes the entries
> accessible again.
>
> Environment:
>   Linux version 7.3.4-arch1-1 (linux@archlinux) (gcc (GCC) 16.2.1
>   20260810, GNU ld (GNU Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Wed,
>   11 Nov 2026 19:02:39 +0000
>   Arch Linux, x86_64
>   Last good: 7.2.11 (Arch)   First bad: 7.3.4 (Arch)
>   The Arch kernel carries no ntfs3 patches. I have not built mainline,
>   but in v7.4-rc2 fs/ntfs3/super.c still sets opts->ads =3D 1 by default
>   and has no "noads" parameter, so the behaviour is unchanged there.
>   The kernel is tainted (OE) by out-of-tree nvidia and tuxedo laptop
>   modules, which are unrelated to the filesystem path involved.
>
> fstab entry:
>   UUID=3D717D6EE943D0AF06 /mnt/HDD_2TB_WD ntfs3 x-systemd.automount,uid=
=3D1000,gid=3D1000,fmask=3D000,dmask=3D000,noatime,exec,rw 0 0
>
> #regzbot introduced: be310476e886
> #regzbot title: ntfs3: names containing ':' inaccessible since ADS suppor=
t is enabled by default
>
> Thanks,
> Cl=C3=A9ment Smagghe
