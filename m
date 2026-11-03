Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726518;
	b=jQQ2cAu86RH/9dse/qUxw4F0YpsbMmpqmnGU4MQEcofbPs4UanjyXyPzki17CZbifRep
	 g1y9NDWmw9QVH5sD7iWDE6qvv9sq/GX2IkDOIxU++Tjxpxba/eb93LzRRyEfyFZoVuUcX
	 kunGkJ2lzIROvOqEMbDCkG6pQ1rz6t5njbiVVwDiTmVUmDbCepFRCokWA9Et7QG8leanN
	 alCk+BrdvLSSdNa8PBAA++Xepn+aa5imttrT/XonItE+kH2axbdN5e5ItaOtEqoyvX4LA
	 GU3Fxut8qpUpsrlRTI98nK9zdOHXJWZfyMR9p5zq5YIuuDNw9MR2NKw66Eb1hsaNTiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=AD4L42H0HNVoYlglqMFr39a2BJYBFr7pQM1pceNP/MA=;
	b=dhMcy6B1ktLuMhVv3VEzFdxG35D28shOpLDOLapRwdyNBGJ15J7H/o5CEdaoPygBoPdb
	 7v6iuMfXiNjdpVA9Tnze1k5TTBfnPPMEd920jIA1vaLkpcSWzyA7hWCQqKezAaWqApQbc
	 bUyPaOhqytjEHZLqEmFGzorRI5/88BD66pwYal4/yia83bN3sCP5np8srZhkzqou8a0YQ
	 IpnP7yqctR+8tJOuTiI34AhvQ/WTNYQ+Y345BZSX+WmmRt0Jsn9nxWatXswzY8F0X4Ska
	 3oCNK3FmP6I1S6stPnN2GnliatxmLtawD0yjUUafa2l2t2zTiHvnMNpV3aKwvZqRE4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PPSaT/cx";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D625606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D625606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PPSaT/cx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so47292555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726516; x=1794331316; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AD4L42H0HNVoYlglqMFr39a2BJYBFr7pQM1pceNP/MA=;
        b=PPSaT/cxmZ6hURUQKCutb+9MNl3fhi5qn8d5wFV015ZFNP0p7wP/UMc9QWwSCjKlPZ
         zL/DD7gvjUVS1WwDG0vy7qUtdL4e9ZBG8lQnrDRgkfIUIZlbzvv/trLSefcWiQBKSr6u
         RWiOf73SY7QM6RfyYuZu6k4tR5WiWRRKh/RIeV0cY5iHRsNLK+hTXF4APDRoBkCtO0ct
         XYVAwfYwEMmz7BR45aY/9jxlYMj2cVxDIW7S6WMomC8Q4pSudP/vALucJz1DmpNouKJK
         rA6xG/hBuUMhhOF7kKRJNPw+Wh4MOGJIc9m2NaRK8UCv+/ZvMWsAaIltcn9U+q8NCPVX
         b5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726516; x=1794331316;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AD4L42H0HNVoYlglqMFr39a2BJYBFr7pQM1pceNP/MA=;
        b=fRASjMk8kxaDoryO/u8Wzd2INxLo/BLYp6QX1sQFOSvs0Yh8P1hwQ3YYA/1kOmstuk
         8VCVC6s3Yipiz0vylObsoSqqIWJt93PxDNtl4fi8yMdLnsHjGo4z+KnBcOWUUr90U6gU
         a+eEE4RVPOO5XSCDJaja5t4lgksyXFvZYqNX1c+MkdqtEcs3WJAvHD4gG+Pu2XiZZI+r
         BzfwUwlu3vFgUCia7ImoCR5y14G8VAjtmc1I6ICoEECiYB25mH4pD8NaPpBR2zgNXH+T
         AP7my7djACBu5+zf79XWCNxyhzA1aHKshPyig3h1OB4UOZuwtVQTUnk3JBwiDpzsFPGI
         lA2g==
X-Forwarded-Encrypted: i=1; AKwUvBwAC93DGyqf0LnUtacXUTBx3ftNk1K7OdfAKtcEZPymDYSZjfJo0xDIzLVLvr4Fjs8KHh8Y74Zdr6Lhm4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gzjKMUJGq+L+luqyMk9XTO5Y8VLQVS/bInXKQk7W5XpDP6iSW
	ZwjwWndrbEabp4ghpgf9EqCMnQULRraNNPk8UObPaJW5RebcaJGPL8ej
X-Gm-Gg: AYBFou0slZDFbWbYDYX+BDuk7B38te8jVq2w8erlwZsq4lx1UegBGrTF4HUnMrQqLeR
	M3k48NhoEJfE5t6iuRRcnLdsIYDb9aFgP3u3rgk31sjG+nEzkzvBjc8QXiHndXeX4hX41klrjjb
	3pkF/eXH+M665edlM9Twq8mBfIJO2a6J+Pa6+preNS6R9PsAMYG+/K7uf4Wismu/D4wzSWyFnDF
	JLp0coNiz2kmDFL3wDaTU2jW1RhWk1+HSI/S/NMzK8mD3Fv3KZdCg1A5fEttePNdXehxsIvs/48
	ugtrdeSDhwlL6t7gGyqTyZrLzcpsil6JXzSw+3q3Xu/M41qtfZClvCjLkbMpmGPNuhnIbh7nv/G
	H2IvFvoequvwmGt9taJHgvFoDDyYLEhBtU9uP46B4bnlF+ckYQyu1tHQceBarYIBNCgrBooLfaM
	xxKDcWv/oqXBADg5iaiEB4H+asLXdU8lKzcxEZvziZBpJpSxbtP7ql67asw1zqoycH0/TqUzuLC
	R3kNH05UfWxCczBpm2kOmaOW62BGTJfFfiZS8/NPFwdSYbNuDJIWjTEVMIpYXjCpicfJukMGyft
	qMkhTitAhQsltc6rP6uq6ibR
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr345177055e9.2.1793726515970;
        Tue, 03 Nov 2026 09:21:55 -0800 (PST)
Received: from localhost ([151.60.201.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm287061365e9.5.2026.11.03.09.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:21:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 18:21:53 +0100
Message-Id: <DMLQZCDREHI8.1PLK04U05AP4S@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Chris Mason"
 <mason@kernel.org>, "Jan Kara" <jack@suse.cz>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Chuck Lever" <cel@kernel.org>, "Darrick J . Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, "Pedro Falcato" <pfalcato@suse.de>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 <linux-btrfs@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v3 0/5] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
 <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
 <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>
In-Reply-To: <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>

--1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 4:12 PM CET, Amir Goldstein wrote:
> On Tue, Nov 3, 2026 at 12:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Mon Nov 2, 2026 at 3:54 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
>> >>
>> >> This is an initial implementation of a new timestamp to indicate the
>> >> time when a file/directory was initially created.
>> >>
>> >> This patch series takes inspiration from the one by Sean Smith
>> >> <defendthedisabled@gmail.com> [1], but using
>> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
>> >> <djwong@kernel.org> in [2].
>> >>
>> >> The semantics of this new timestamp should be at least these:
>> >> - it should be the same as btime on a newly created file
>> >> - it's user-settable, so it can be preserved for backups, filesystem
>> >>   conversions, archives and any similar operation
>> >> - it should be preserved every time mtime gets preserved
>> >>
>> >> and the correspondence with the other timestamps is as follows:
>> >>
>> >> ctime <-> btime
>> >> mtime <-> ptime
>> >>
>> >> Examples:
>> >> 1) a .zsh_history file created in 2019, then after a few years the us=
er
>> >>    decides to switch to another filesystem, copying the .zsh_history =
to
>> >>    the new home, in that case btime would have the timestamp of the c=
opy
>> >>    and ptime would have the 2019 timestamp (just like mtime would hav=
e
>> >>    been preserved)
>> >> 2) a symlink created in 2020 from the home directory to a /path going
>> >>    through the same process as the .zsh_history, in this case it woul=
d
>> >>    also make sense to sync the ptime to the 2020 timestamp instead of
>> >>    keeping only the btime (so the inode creation time).
>> >>
>> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
>> >> available at https://github.com/koraynilay/coreutils (master branch)
>> >> (Note: these coreutils code changes are a prototype and won't be
>> >> submitted upstream as-is, but they work as expected in simple stat an=
d
>> >> cp -a/--preserve=3Dptime tests)
>> >>
>> >> Lastly, the name "provenance" and "ptime" are not final, I personally
>> >> don't have a strong opinion on any name, but while testing with stat(=
1)
>> >> I noticed that "Provenance" is definitely too long for the normal
>> >> output, so another option which would fit well is "Origin time",
>> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that woul=
d
>> >> conflict with btrfs' internal naming and create confusion.
>> >
>> > FWIW, I agree that given the existing uses of btime and crtime in the
>> > kernel and various XXXprogs, using 'ptime' for kernel code is probably
>> > the lesser evil.
>>
>> What do you think about the origiN time (ntime) (Origin: in stat)?
>> It would also coincidentally be alphabetically (ntime <-> mtime, n -> m)
>> the same as btime <-> ctime (b -> c) ahah.
>>
>
> Honestly I don't know.
> My new idea is don't publish it in statx() at all.

Well I was more talking about the actual variable names in all patches
ahah.

Thanks,
koraynilay

> Thanks,
> Amir.



--1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCauoYMQAKCRA0bnTtJTDo
OI2UAQDfLMxbWJxZCtj5g/a2TQHWFv3yLHmv7IEjclN8pYY5IgD/VFtdYZ3g+FW5
oxEEhXF7xBfTTV5O+6Ag8QIL/lM51wc=
=XiPH
-----END PGP SIGNATURE-----

--1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8--
