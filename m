Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793631257;
	b=FCLcfl0JB1Rht4C/yjQn8trIP+8DAE3oFuHoXa0qO3VvMyBMVcKqXHmJzPxAaTtAePNz
	 ys0p+CUK22Y6wY11FUjeXJz+Zl4tzUVGanzXOBVWQxPrZ2XF1tNnbP9I+sEBWYraGk2mG
	 BN42J84LPfttoCTyDF8Wvi90YBVFfH+Wkv6PbdxdxHMnddcIH5E56hjEWL6YyTPuN+20T
	 lVjcHTIsqMOsHqDPpnW50NVGNExLHyWKWLrh7NcagUO23qrXeC+1+rU90Xv2fQ5rI/T8Z
	 q+sAH0yq9vT29V4aCuLIFom4r3lRB99jC8kAuzqFdbdDEbmTot9SwR7eZoCnwt7Df+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
	b=m2cFYXgxnctePj4DaLSEiPPpYd2QXag2eIBRXStHbuOhadM80PeSNVMnCVhCtCvhEFD5
	 AGa+q30q7V36I6MWLieOuCtZxfU1odn19l/wzXrZfnEpKiMS9gUBOqPfQfJsNbuOWrr5Z
	 y9EY/aLYryDTHIOzM52ex2LCv4AYRKeUNl4T/Cyq8BiHc1CA1wwEDVbCJopH91PdvJg4v
	 azbkqvyoj9yXFXUv1Ttedxye+A6s08hg18lUae766J3jKVbLK1BkC5+Yaos8IlalTTIgR
	 nl78Jrk/GyJojrjel9ch4VqqKUoaKVgkDpVFg9/E8/WpNBGhN9vPBKYWVMHyCEx7g9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytXtI9ur;
	arc=fail smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98168607A89E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98168607A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytXtI9ur
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso4166711a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631255; cv=none;
        d=google.com; s=arc-20260327;
        b=BTqTjuNiaiWEDjUfrr9vnuMU1/bsWFCiXiwxI8K/w+RPEtZRF54mbCaDaCyaoZ6wJR
         FSQQEkFhQdGWI6gx87H066Pkb3HIVMaeLj5XuRbOlgPlwqF21ySRZi78DeoiP5bjQRgt
         aHjjOhVmp5bNf+Dg3HzXMEc+EdbcSEmg3hJgOE8/p2mhSDMaycjmGzZqA6btf2FD1bYG
         6Fce9BDH/a30My+53tJ+kWZ82RmqjcYj5IiDq7B+DYsdVNQmbVUhwxPWapCKUVAUyJ78
         A1tMYdQBut2FEhfzcBjYW0XLsecF4zEPEUbFueOARx+Qa2fQTXPH7XuaBKKNjD52jqBc
         80Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        fh=h9gm2P3c46sZx9zdqon+0bigg/8y1yL28FeteoCWNh8=;
        b=DUpYb2ULPNVxGohi+KGQ9slA5ivXKw677S2yWId2bJBCGn9g6bl0UR0Kr9zywqhT50
         CJqLafu2t0K4vy9JjcOZgy3dPy1wMcjyZkMpmMvbZlV2Ii6je+MjO5+KtmKuRFnmWt2i
         uoQfzmO1o7wSxKXmUAhRm1ybyVGGOQmBx5u1NNG09iW2CmJLAcAeq1s3Codlbgun2hxM
         W3/gRlna2k6sE+iTBfVdHbGW90rlqtJr3bTBrSYgKR3C6CkS3pX44WSoD9SAERU0/Nwz
         yGkn1yY4pgWDqAKK0ZuZlBe+3msdaveGhQuPJ9JN8ktll9M4RT3rDU6H2pnbPaQ12UZX
         njjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631255; x=1794236055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        b=ytXtI9urkBOvMSxNBLZNENQibMB/0gzzBc5DiEZfC6ZXmrvapm+egYYm9kWonaIvc7
         gYzuqpT4m18qhZoQbQrZpb2T+++MNHRQx0q7J3FLCRnOAViXnbf2YyRwymv8LzrKU5ji
         c3hNN+VN0CxAfA3VukdFS8J253OYA/wQYb0p1qfHH4obnQV38SG/fN9Yf7nEhJGmztoi
         1mcZoYTLpkCI+nVXEmAumOVmkqWZlicJwK24ec8XXfAhmX08g++Txd1372FncrDXskXF
         /MXJugsAdWJ1HQWyCTfxIUTUGG1CvKf+kuV8FP63sJZFLKd5uBbCsQI0I5rMlCQAlggs
         AlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631255; x=1794236055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        b=GUBW12LzNe0UJNC5qnWP4r3mC2n2vIUvAXTWegplUmXaNw0VgOD0SUF0512WBFdTty
         Im4ol+KHBXPnposLSxsoDlAbdgii38hXMOMxeKKlFZ4s5OwM8wtgYikIiEgmac5UhJNH
         jvVt15w6Cyd72kHpJ0hQlUucE7XhL+URklTXAHK9GCAOooe8/sEBHhFtPevz59hj37bO
         KHmqFKn0LHsQXg66ISyJftiLZunqo8QvfJSzpBezhfc5Yn+0vv/IBEh1oqkxP97dsFVp
         69Q9qfT3OrHA+O6CVbydFev11pVjs8apWVri9RSBahL1QiMr3sCuf3LFr3X+mOIdd7U6
         XdVw==
X-Forwarded-Encrypted: i=1; AKwUvByQjPbyhCulVuvFm4vnf4FrRJ+0CzF3TGkUmtkVLigHjECZXrROEIk84f5OJ9LGBIIG416xsTTdUZ+omc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eK+leucofbRFRW+qO5xNvFESWeVJK5DW0a43kFCpPx5gkN8fh
	uwOM1gWHkRWddy1UdeUQxWN0ByIRdmsb5G5oDfmSRo4foNdVdGpZVuLonSw2WA5NaMuCuMgLEj6
	inF0kZ9bOT+UqHkA1d0QV2ygneB2EWOk=
X-Gm-Gg: AYBFou1XtZ2kPh+lnUiaAQWZAdzcsL9BG8xQ/9AXxr8y/vj64d7MDlQv2dEa1lbcMqB
	nspjz+4JuAknixZ0oUUiOeVujU2G1fvZOL1m6NvnOckt300JBtY/evTroGPQR1VmHnXMJjylW0s
	2GkoYLM/RGsUj3qsRkSpksTiefuMHTvCd2133lSLD/7zoTebGaMg4UwnNu0kSJ165VDADCkAQhZ
	4bJRScaX5d9u4qoe1L9O5AEEIcBwgEINTlEF8buIh8RlrRIGKbsCkwHhD4ugbskUU7sNtOUK/9w
	HY8NDT2mW7Q/ZpjITGLTyUMvBfwUwgslUcRb4PjPDOlrXrAR/h9/jJUbLptFaRrz9UdG5+xaZa1
	c4eDzyPNP9yr2g1QssvBrzpghSOlfXWtYbLrffqx2+OVHQccV3xoH6i63ogZvPVLLQnNZV9O7ZK
	OCX38AinyME+SyMnU=
X-Received: by 2002:a17:906:eec8:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c4ca7aac250mr889529566b.27.1793631254792; Mon, 02 Nov 2026
 06:54:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com>
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 15:54:03 +0100
X-Gm-Features: AclHuK8MPfC_dz5RbDokIFz7RFGIRe7sv4kFXfjOWYu6Sb9FQLskiRuGBNP5Y1c
Message-ID: <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
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

On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> wro=
te:
>
> This is an initial implementation of a new timestamp to indicate the
> time when a file/directory was initially created.
>
> This patch series takes inspiration from the one by Sean Smith
> <defendthedisabled@gmail.com> [1], but using
> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> <djwong@kernel.org> in [2].
>
> The semantics of this new timestamp should be at least these:
> - it should be the same as btime on a newly created file
> - it's user-settable, so it can be preserved for backups, filesystem
>   conversions, archives and any similar operation
> - it should be preserved every time mtime gets preserved
>
> and the correspondence with the other timestamps is as follows:
>
> ctime <-> btime
> mtime <-> ptime
>
> Examples:
> 1) a .zsh_history file created in 2019, then after a few years the user
>    decides to switch to another filesystem, copying the .zsh_history to
>    the new home, in that case btime would have the timestamp of the copy
>    and ptime would have the 2019 timestamp (just like mtime would have
>    been preserved)
> 2) a symlink created in 2020 from the home directory to a /path going
>    through the same process as the .zsh_history, in this case it would
>    also make sense to sync the ptime to the 2020 timestamp instead of
>    keeping only the btime (so the inode creation time).
>
> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> available at https://github.com/koraynilay/coreutils (master branch)
> (Note: these coreutils code changes are a prototype and won't be
> submitted upstream as-is, but they work as expected in simple stat and
> cp -a/--preserve=3Dptime tests)
>
> Lastly, the name "provenance" and "ptime" are not final, I personally
> don't have a strong opinion on any name, but while testing with stat(1)
> I noticed that "Provenance" is definitely too long for the normal
> output, so another option which would fit well is "Origin time",
> abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
> conflict with btrfs' internal naming and create confusion.

FWIW, I agree that given the existing uses of btime and crtime in the
kernel and various XXXprogs, using 'ptime' for kernel code is probably
the lesser evil.

The question of how to display this in stat and tool is a different questio=
n
that can be left to the userspace developers.

The UAPI headers uses Birth time language and stat displays:

Access: 2026-11-02 15:22:27.067329367 +0100
Modify: 2026-11-02 15:22:27.067329367 +0100
Change: 2026-11-02 15:22:27.067329367 +0100
 Birth: 2026-11-02 15:22:27.067329367 +0100

If the UAPI headers will use consistent language:

+       /* provenance (settable creation) time */

+       __s64 fa_ptime_sec;     /* provenance (settable creation) time
(seconds) */

I  think that the man pages could be unambiguous:

stat(1)
       %w     time of file birth (immutable), human-readable; - if unknown
       %W    time of file birth (immutable), seconds since Epoch; 0 if unkn=
own
       %p     time of file creation (mutable), human-readable; - if unknown
       %P     time of file creation (mutable), seconds since Epoch; 0 if un=
known

statx(2)
       stx_btime
              The file's (immutable) creation timestamp.
       stx_ptime
              The file's (mutable) creation timestamp.

And userspace tools could be displaying ptime as:

Access: 2026-11-02 15:22:27.067329367 +0100
Modify: 2026-11-02 15:22:27.067329367 +0100
Change: 2026-11-02 15:22:27.067329367 +0100
Create: 2026-11-02 15:22:27.067329367 +0100
 Birth: 2026-11-02 15:22:27.067329367 +0100

If they want to, without that being more confusing than Provenance.

>
> v2 changes:
> - fix permission bypass leading to ptime update on immutable and
>   append-only files (found by sashiko[3])
> - normalize ptime timestamp as done in fs/attr.c:notify_change() (found
>   by sashiko[3])
> - fix wording in vfs patch to be like the cover-letter
>
> v3 changes:
> - vfs: reject setting ptime with -EOPNOTSUPP on filesystems that do not
>   support it instead of silently ignoring it (found by sashiko[4])

Please see my review on patch 1/5 on exporting the supported mask
to userspace.

> - vfs: fix not being able to clear immutable and append-only on files
>   with ptime, and allow updating immutable/append-only atomically along
>   with ptime (found by sashiko[4])
> - btrfs: validate on-disk ptime nanoseconds and reset to otime if
>   invalid (found by sashiko[4])
> - btrfs: avoid re-assigning ptime on unrelated chattr calls (found by
>   sashiko[4])
> - add ntfs3 and exfat support as suggested by Amir Goldstein[5], but no
>   vfat, smb, or nfs4 yet as they are a bit more complex

Please explain what makes them more complex.
My concern is that I would like to see that the proposed API fits the exist=
ing
fs and we won't need to change the API again later to support them.

Thanks,
Amir.
