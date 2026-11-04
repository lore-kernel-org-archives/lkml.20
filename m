Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792253;
	b=X0ITz+FTgH4h/SmDpJ+xU+U150mk+qJIhMu6kUkKEyjVAyjIXGGLGgegyCtMef7vxXeD
	 79T6WE078rL355/jKwHCQZOiuiP+eAbDw01QIORCJwrZlJZWbYHZxcTV/ekgWLvwKuMWM
	 WZ/C5ajMrR5a5s2TG9LPU+rHkSXjWOF3vLtyibjENpY0ujDU11hWgZ9jge03GrMYtya/l
	 btMeM4C+lnZqSby1+89QzEUKpbJNjKKBbf30gTOIPfqm7op/9VE99IRUNyVIPlkEoI7m9
	 3zlpM2SYvG4cy4VU+LOn368yG4D1p/b2BiFEa8sFF3whl3N774JUxxj5u8uNkyX3F0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=m1N2CPL6JIQI1DoRI2I/9sbG/YpOMPe6UrD3Lt2CabI=;
	b=bXdHZUoSzfZ5nM4XQGrvcn3BfYsvOxhTW7ALuVE7IJvIgyel1ke71dpgR0mZkQf4Z/rr
	 BMTKXshx9w+/k3xokEyEHjkIiATK/E7xZKSixPeemLuRuo/bdKOcKXAG1kIjEColIcbA3
	 /6qC0xUbYEWMLM38x7TUFDn9d9RB6K+0V6isZIOUTQmMp4MRXLyCeSB2bJ3BGF+TuxrRz
	 2N4i54LZNnQFk9HEMtYDooMs/G+OxqLs5pvmPZgjNUPzt7u2n3j3qQwWNx//xeQ+5xS36
	 zuSVQSr0ENQ2CYN7h8Zca49Yp3rtUMqNy+T8Y54ibqtOWDvvldWQgyM9Uh68J9krhvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xcw7KGuS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA05606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA05606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xcw7KGuS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so4758715e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792251; x=1794397051; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m1N2CPL6JIQI1DoRI2I/9sbG/YpOMPe6UrD3Lt2CabI=;
        b=Xcw7KGuSrQbG5Tb3P8/nfqRZmZgLRlBjOTNH+WvaQdBXji6cpW64IgeIjQL9XkRN5N
         KIuqrnkvCeZ/qHlLc9gcjGNmjJyZFj7y4yqbJkzF3XkSSuAj0jXe94VXz/qZvwK7oUKa
         SYVwGk0HKx36TB63oIZd927U/3+x4Ww9XmLRShldoZiZULsqohiqmuKn7MoV4IRu0a72
         cXrldU1rib80Nj3/ZpkMBtTjxKEI9xNlWpE48PJM3KnZNXH0FfUPDfckSru6SJJHB4MZ
         JcvNeQe+fGJrI+83S+u+Qjs/4b7EUSxjQKwmrmPqph1h3xota5ZdJKD87XMz/meO5L8K
         pdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792251; x=1794397051;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m1N2CPL6JIQI1DoRI2I/9sbG/YpOMPe6UrD3Lt2CabI=;
        b=Qc+7xSzmCA5ztsoRJlZ0PBP/VB5aQDyVmo4jMr4UTXXcjDKwm0C1vuW8lbgFxDEs4p
         nTASG6d//Avpzqeu46Bne2KygO94AVe1lyOM2Nu0StetgyohB41ypZxi1lfiXVqr3nw2
         FzNanjZlHS1mCBAPGGnZMRpot3tBNcwi0GZ7AFet/ELGeerHu0uT7oxs/c9yHlWuGYfQ
         E6E/T+kLk1S519IMryq+7MVwRExiCwpBqa7PcYEHiXKgv8qXTzariExG+c4cGRDmrAp5
         M2iBT+IplSJv2ZnZzWlKyNESGshBc6w/hFzCHCtJBvpGdxDmuENS55Qut9PpBtV5Kxp6
         sorg==
X-Forwarded-Encrypted: i=1; AKwUvBzSo7n/UzvrX6umsfGNmzVvEvvSlDTUnAFJUllTv4lQO/HGw1MeV3Zz4gzGA72OqOHsWasPRucaZUVqLgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qfJpTbkpiLhNSClxJR7Mz7AFx8TXMzp9u+FbgWG3bATzdIXJ1
	1HvAdAdBTyKEPnNZ9IMrGokFdCc6siE+2JyCe2TiGltp2nojgyHCNCme
X-Gm-Gg: AYBFou19a2bcRGNkvnBWVDSpTtxqBbGl3Nz4zexJfBsDP7+1tbo7oD7PkyUeZ1PVj8Z
	TifUnCxxsmjuubCGm7UxPTF37OJGGwUVMdnwqR8iONnIEQMpbOtYxA1lA6cbAp+eQjy0jGPr04G
	RYpVOgXjcnbN0ag38OAa7EWKVG3uMHEAdPNJyJMqfst74exgnetscNcjwqcJARMe6w2azji4BbU
	dET+Ulz/g0kNEitQGMBNrKameCIXYM5HDh0PTFlRE/zZr4kJauxYxzS0q33kde0+dvbv4hvfkfD
	HevIR/YUPQxeDYLExEGjHLejGm6etuQvVWZrntI3taKE6g22HpWHbjRzl+C/bzgbRnPkowXedAR
	/Hs3vrkn6YmQDM1BU90sbqry0LsT7dcx3lR9k422b7Xa6wZSUs6KiPi6nW8/9zCP15OdHaBncCk
	6re8pR2v60bdqLqtY+ISZwoGEFyx2SK8C3ZKzH1uQbWIjWLeXGG4oeD0N8HC+z3FVRIPDENyFpI
	56BJ2XMCTYudFSdloti/tcrvNduHAtHZUQ4mKacqDtsEu+fws27m5HoSRf4FzeFuBSsz73yWjFI
	ULixaINsKlvDaThHR/QKyyTzbs8IRVcuPj/t4jvyujL+2r1+FdSvzSfrJ5mA
X-Received: by 2002:a05:600c:83c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ac17191017mr340673885e9.8.1793792250984;
        Wed, 04 Nov 2026 03:37:30 -0800 (PST)
Received: from localhost (mob-176-246-9-149.net.vodafone.it. [176.246.9.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm122452345e9.7.2026.11.04.03.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 03:37:30 -0800 (PST)
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
 boundary=48cc1ad8402764d92e1376cc3050a9a9645276db561dde693e9f605d6644;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 12:37:22 +0100
Message-Id: <DMMEA3RCJIIR.3M3VFS656X8B7@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Chris
 Mason" <mason@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, "Sean
 Smith" <defendthedisabled@gmail.com>, "Andrey Albershteyn"
 <aalbersh@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Jan Kara" <jack@suse.cz>, "koraynilay" <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027220532.736352-1-koray.fra@gmail.com>
 <upe7qvhod63zd724s7uiql6kanqyrcwplodoavcvqjt35vd4ee@s3iglizxejlr>
 <DMLN8XHASPL4.1R3MI7CMA5KCD@gmail.com>
 <unzslqbr7karhkgfxrcmjwgtps3byokmsqecyouqlc7aa6cszv@pgup6q2nxwt6>
In-Reply-To: <unzslqbr7karhkgfxrcmjwgtps3byokmsqecyouqlc7aa6cszv@pgup6q2nxwt6>

--48cc1ad8402764d92e1376cc3050a9a9645276db561dde693e9f605d6644
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 12:33 PM CET, Jan Kara wrote:
> On Tue 03-11-26 15:26:20, koraynilay wrote:
>> On Tue Nov 3, 2026 at 2:25 PM CET, Jan Kara wrote:
>> > On Tue 27-10-26 23:05:30, koraynilay wrote:
>> >> This is an initial implementation of a new timestamp to indicate the
>> >> time when a file/directory was initially created.
>> >>=20
>> >> This patch series takes inspiration from the one by Sean Smith
>> >> <defendthedisabled@gmail.com> [1], but using
>> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
>> >> <djwong@kernel.org> in [2].
>> >>=20
>> >> The semantics of this new timestamp should be at least these:
>> >> - it should be the same as btime on a newly created file
>> >> - it's user-settable, so it can be preserved for backups, filesystem
>> >>   conversions, archives and any similar operation
>> >> - it should be preserved every time mtime gets preserved
>> >>=20
>> >> and the correspondence with the other timestamps is as follows:
>> >>=20
>> >> ctime <-> btime
>> >> mtime <-> ptime
>> >
>> > One thing I miss in this series is an explanation what this new timest=
amp is
>> > good for. Because frankly, I don't miss such timestamp as a Linux user=
 :).
>> >
>> > 								Honza
>>=20
>> Hello, my concrete use-cases are backups and filesystem conversions.
>>=20
>> For backups, my setup is btrfs and using btrbk (so btrfs send to my nas
>> with ssh) and the only missing thing from the backup is the timestamp of
>> file creation (which I'm currently working around using xattrs).
>>=20
>> The situation that prompted me to finally start working on this RFC
>> PATCH was when I wanted to merge 2 btrfs FSs and the only way of doing
>> that (AFAIK at least) is using cp/rsync, which can't set the creation
>> time since btime is immutable. The workaround I used was the same as
>> with backups, so with xattrs, but noticed that some files (symlinks)
>> wouldn't accept xattrs, so I looked into it and found out xattrs are
>> only for regular files/dirs.
>>=20
>> (also see https://lore.kernel.org/DMGS4KQLY24Q.14MUTR6U93GIC@gmail.com/)
>
> Ah, OK, I think I finally understand why do you want this. Thanks for
> explanation!
>
> 								Honza

Nice, thank you!

Best,
koraynilay

--48cc1ad8402764d92e1376cc3050a9a9645276db561dde693e9f605d6644
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCausY8gAKCRA0bnTtJTDo
ODftAQC9g00TbhJ4fqkc0NSdA1KvBdO2hUflWG1D9U7QPJVKNwD/e1sMPB8EEpEs
oOjAe8fi91WQcNkFmUDPnwGV8y9PRQ0=
=eltA
-----END PGP SIGNATURE-----

--48cc1ad8402764d92e1376cc3050a9a9645276db561dde693e9f605d6644--
