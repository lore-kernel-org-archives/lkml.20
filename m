Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718777;
	b=de1onXyAn3zPDkKKyd5Ky9zxMDuQ9P7u5/Jg9mckbpIefySdXhEUNIdq+33pV4CA7otU
	 0gsHZTUsN+qT9KwP5beSkvHrgVb3dnmJGfDFk/p13ZSTSwtGbdwZonfq+USgqtTmKzntI
	 S+uo4Vz+z3XG9ORGMd9SDvT8ND/8RlgOfeKiNd2vUoyzzFhkWe4FAsf01WadvRHaW+zy2
	 JyV2U9J8JgeN9kJwfFa5ttGLnzAKS3YaREPW4hYP40Jt/whlxrQK8SiZFcmLPqEp9B/nQ
	 qI9fX1tXILrY+wlXnONyFFI9gm44YlhFcs+FWXwHckK+c0LCj1n5qi/v3ljpzh7P5oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
	b=ZtLld1ld2/PAiySy4BJehhBbMyzNdOeIhU1BpXxBeeF4JCMTIFDMh06fTAabukcqxG+4
	 uUzukxMIQEHkSvIbWzy4ej2FN+hL3KJM8/KLnLlwazydQEAKvy0vW+HUwfVB1dk6Zb/ZB
	 G2kiiLkA/TmixKNs3TBHA6zYb8SOmZhnVl/XZsyQ8w8b/O2evdmx6dKGP93uTfrNgEGsg
	 gLD8rGlFpNwcfFsgwzRY9b2fwPhBdcIAQQj2Xi+ZpCjlZYvTWDi/ZLZdwIYHlJF5t6+OL
	 7G2XF88SqwN8zZZu8nFUX78vlvDTAyCe0cwAAYyCkWoQ0a9eD5ushUC6D398rbYJ7CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OvFvtKic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738C606B269
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9738C606B269
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OvFvtKic
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so1203937a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718775; cv=none;
        d=google.com; s=arc-20260327;
        b=Fhzw5GDX1HD9a6ZucgTvHjBExcvy9KeKTMsyX3JMd3/T1/rkZiCNP2NmETnHWqpq4o
         6491EZZJ+OzNczROFRTLABzUd1oqy9hAaDmUuHmI88xdO2usMmSPl+hGr0GCUyqIt1pv
         KCmfiT8Tz0eqhCcW8WYU3CzUs7AZFmF53baibOPMwvmjPjlivlwSmdkipn3t8sX/jJAA
         rpzKwmEqHpYADk+tA8oEPQc5garec08V+s17I3ExrRPg0a4G62yWaowUEt02y02LVhfZ
         rOEZ1dMkt35nptAc/DJxnxkbxZ4z6/ujlveaGKSEsp3bN2Y30LwXKAU+bPzdu66NujsL
         lQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        fh=uTSK5E36AiNwflPvUskOjwMDWi6JF/oqrXI+AlduNKg=;
        b=Tw0c+yyKBkubjSAYbotffv650JT9nv4xB6ToJ/+gHToxmOLWMYOSvsDlmoJWDySouZ
         UG8ZhM/3cWJGEB35e7CRTLNb9u9ygX2lsEtQOmioTgH+vu5HqNTOAUSnDsh1/f1pMjxF
         s+GRTkE83SlAl4kOD42YVbTtwHRL44L67nkojSU5A3/bVLRhCzulFuh98eZLLzwNmTng
         qZFtEhwqIdYK/s7JXo20yn1YkHviBQbKq6ujMXpHSHaSSCM3ThgwiUvshKS+FTf+TE9s
         iTAJ9sWWy3SaVsgIGTda/W0/rzfblCTej0azZXcAUAA8v3I1IjJ+1Frtt/ygI2ZWrEp0
         SjHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718775; x=1794323575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        b=OvFvtKic68lKCYq5u4vqHczl3baTPtF15hOIez1MaJdBuzdCpImLq5Qv7L32t95reC
         ew8jluUvcc+N3iPd5ONhE6VQMsevXPTcnFcQMaMAXtydoe1Hvu4ufW8rct43NHU52g5v
         X6kQhB503r+JeDBVm2lVapqlL+7T5XwUc4QW0kNnCmhuVPRXuTmuIrietp2CZoQSDa/Z
         4jg55kmTR2BGZX5663w+3TGaH1OHMO4OEHB3ShEet7gRgN/NDGqdS+XvhVI8/KoYJeGO
         ZH8EsfNHZpQ1Z4aUgHGqr2/pfzFkq3nT8y24hz069Du181ff3kyUHLwqV6RHhY7o6PLP
         P4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718775; x=1794323575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        b=RO1YISBHdEeif0KgJobYTzv+zUuevoMm0/ABy18EQauHCjwa/dEhtwBfVYzSIfgHBo
         rykwMj0OUEtn3DPPcQbGQ+77oMiXV9KBO04r6YZWTMbT5ZRpfYQolzlWbPrv1b5oLpHy
         L7f5VeRY2zx1Oa9aPM/gcltZWAYIrCtlevWG4lRtQxp8FOw1YmWLdd1JyjG/53KfBCiR
         /lQ9+e8Q9bkmvDf42A0FGc9g9Or8oUJSmirdqY2DLuL0nXj3VkIW/DipJsSKMql1RW6d
         11auqnKKWviCTUjXgPc3OD9gSJXzezknOZgUMpOUTlKlDieI0SiMX3jeE5UG1aem3Lf9
         WA7w==
X-Forwarded-Encrypted: i=1; AKwUvByrBHmVHqW3Zpe6YijyKesknVCf0khxuria4RoNp96Pkj33HQKmrfEHw+wPRmb/8NAimZXlXUP3mThjO10=@vger.kernel.org
X-Gm-Message-State: APuU4Z89b8dcOTDkLyZjZgTEy49dnGb/HPZGXzoK1JrLx/iDO7/UwfSa
	ahG9A5laViX8r8GuZWJMyLLCKTKfzCogVqHxOMkSHi6arYmJyT1aK8dWoaPT5KM2WG/mGH+swKj
	xpO+ph55gnXNxaV1lPeEGBE6w8pZbMFM=
X-Gm-Gg: AYBFou0ZjVLa1zfCtBBJkHK1asY+AFp1B1U5dgL4X0oyTLNGgSNd/U20ZlLjBrIWVaw
	6hVcRXFUNWNZX47XOrYp8DK+dJxX0H7vNYSwDuY4tRtZGpBaKcfO8zvSeA2qQt+3wkYp8F/8lVT
	Y+uE/5id830GHqQHsQYDgAXL7PEYI5b8yQPtb2wROGK8crwCourMOng3F/obXjFo7bdsz4ZullL
	OSTH+3vVKImKsatwmSNJ4x22CU77HOAUsBSORrhAbGMjebV6B4lAvwoEEqW+4D8o6EnuqthshwY
	me46l1gs9mMlRhAoj0ulF8AZiRMCC+PrHWN6oaiHP8LHdDA/zpJlpwtKfSDyrZhIuPbfseCYcFy
	U9vu+EwMcQOR0xDMQuTZTnTkigMH6AnmEJkfKCsnKx6+3+YwlW+48qaA8mLmcPBI/J2myspg=
X-Received: by 2002:aa7:c716:0:b0:6b1:c521:ebda with SMTP id
 4fb4d7f45d1cf-6b4d5ee6c50mr6756533a12.14.1793718774731; Tue, 03 Nov 2026
 07:12:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
 <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
In-Reply-To: <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:12:42 +0100
X-Gm-Features: AclHuK8QI8V9NvEKNRSnDchTL0FslmV7Uh3t35Xsoq4Akwwc8XamtLwVFdORxbE
Message-ID: <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] add provenance time (ptime)
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

On Tue, Nov 3, 2026 at 12:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 2, 2026 at 3:54 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> This is an initial implementation of a new timestamp to indicate the
> >> time when a file/directory was initially created.
> >>
> >> This patch series takes inspiration from the one by Sean Smith
> >> <defendthedisabled@gmail.com> [1], but using
> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> >> <djwong@kernel.org> in [2].
> >>
> >> The semantics of this new timestamp should be at least these:
> >> - it should be the same as btime on a newly created file
> >> - it's user-settable, so it can be preserved for backups, filesystem
> >>   conversions, archives and any similar operation
> >> - it should be preserved every time mtime gets preserved
> >>
> >> and the correspondence with the other timestamps is as follows:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> Examples:
> >> 1) a .zsh_history file created in 2019, then after a few years the use=
r
> >>    decides to switch to another filesystem, copying the .zsh_history t=
o
> >>    the new home, in that case btime would have the timestamp of the co=
py
> >>    and ptime would have the 2019 timestamp (just like mtime would have
> >>    been preserved)
> >> 2) a symlink created in 2020 from the home directory to a /path going
> >>    through the same process as the .zsh_history, in this case it would
> >>    also make sense to sync the ptime to the 2020 timestamp instead of
> >>    keeping only the btime (so the inode creation time).
> >>
> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> >> available at https://github.com/koraynilay/coreutils (master branch)
> >> (Note: these coreutils code changes are a prototype and won't be
> >> submitted upstream as-is, but they work as expected in simple stat and
> >> cp -a/--preserve=3Dptime tests)
> >>
> >> Lastly, the name "provenance" and "ptime" are not final, I personally
> >> don't have a strong opinion on any name, but while testing with stat(1=
)
> >> I noticed that "Provenance" is definitely too long for the normal
> >> output, so another option which would fit well is "Origin time",
> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
> >> conflict with btrfs' internal naming and create confusion.
> >
> > FWIW, I agree that given the existing uses of btime and crtime in the
> > kernel and various XXXprogs, using 'ptime' for kernel code is probably
> > the lesser evil.
>
> What do you think about the origiN time (ntime) (Origin: in stat)?
> It would also coincidentally be alphabetically (ntime <-> mtime, n -> m)
> the same as btime <-> ctime (b -> c) ahah.
>

Honestly I don't know.
My new idea is don't publish it in statx() at all.

Thanks,
Amir.
