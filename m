Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794671011;
	b=gmCj8dtUrT+jcm0NJX0sf2iJATeR5X3D+JGgd0WMK9xiHFXYaPFvY4GNq+mIpEU5uhWz
	 4LCHBrw51uHKC2aEbC6dTfq7cS6/cWbosRhpg36XczeSq31Gw4KbruwXygipQ/qjxKXP7
	 i1FkcZ0DancjmG9jcy5Hw4yRAniGbrmkFSccWXBGKUBprW5WZ+aJlfyTzjEq3DGfXAcAA
	 cHXz+YvbBUrzbKykcGuWBxvKzM6bV6se/G+7JWAv888ok1Vw5sa8XcjkkbOI5jK6gVgy7
	 j8vgCIVGVW4/BFT7n1e18HA3FWGrN/Ov3PVnacgLSbglVLheeE5Yk4NuxnSEc5gywwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
	b=kR0LOZlI/R2YEbsQ03hzRxMsZqFgUcMdG0+YpZ6SD2tBxMMCJAhsrfntEvAszBU1hS4Y
	 CKk7FRX+8+Mjx0EVvlJ8Wh7FQ0QQW6BF9b5QUkXpBP8XHhAB4jM5wc/KeLwU7jzq3gc0a
	 Lz1kz8PPjcQs+uB5fpHUFxmOTwAwi1ty/3B2p/2k20JOIMaPPGPSs9NAFLMqjcrIw5jNk
	 ClqU8rNcH2Geui/KhUhPloEk295EPulZzaKqKOcXburQT5aRHPIniHUNALeR+DULInfNX
	 21bNqdiYCen9MhIUjt5F11aoRDA4V88NuXPdwYqHkWCGtOPJ2bGZ6ygc+d2Flh1RItg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEH9IuOf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC65E606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC65E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEH9IuOf
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3acec6677so2666718c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794671010; cv=none;
        d=google.com; s=arc-20260327;
        b=UbWM9USzn6G3CP8/6yyN6CmcX2IVtQ+XbMPeVDxUJaiqsQlQbgt9L1HWzfjG1afbkR
         k3D93bM0GhgzteR8vIFZG06yRR74VGLKQStTVgDPLVZm4+NTLfxJQBlH2DYSBLRQ/c9N
         CtQFwJAIuYNGH7T4r+ljSrznSU+fZOxkhAAPk/MZuLTefutIAkXIC6pZ66wrude4DI5r
         Ggwi9PD7rnYxK5jBut+N0MuxoiMlWtICdORQXD2rJAcDWy5dVcz4VtJdhZjqGefJcbPr
         fayBe81Pm7WCiF13/jxAlvplLh2oJiMM3CUKK/efHyZNlqx9/t266D/Oq1+oTqcCxhcm
         X8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        fh=KT4R946jfo/2Z39+95ssrmEjC1J+ZkLxWdvZLxBDORI=;
        b=ZK/apRXFrHrUON0Y+M+eqJHwX7MAKI0/8bjvPjoMo+IZzhMfg7AeYmGHqTYT5T4v8x
         qwcv5cF0U4+FaBSkAbM5DqBklDVJWTUCx/NRLBHA6QcahbM3Yrq3CyXtbCESFhn/xDoM
         17RmUKWWcrLbpVDaRtQi2cvs3/Mvqk4Gbf7z2AEcnFoyfFgN0EU2EM+7CcneE9SAJfGy
         WA56hAFvK0yfrf3zm82JEuZ3Ls+OrcBYnyVjFQFDhEe2DjO68roBmhqmuJWXtx7l3TPi
         pVOn10jQ7MxI8iec+ys9JgIG8c8FbLT7T0z5UBalrGnvRw3TjOOL4tvqeBqTZxHBUb8q
         Mt+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794671010; x=1795275810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        b=vEH9IuOf8TqXlFP9jIwVqQe/KNAJtF5/1hpL6sn50wQwUogRkv51QaBIzUQxFvWX5K
         SUEZKCImhTL+TVaiIplzcY379q3ZV7IMgWtzWwpZvYa/NjasxqQpWRyGurewcZHmkYn6
         EXup1ph+mGCKntgLBQVhsjDuokWH5RVxh4qw6N/JXw5tgBc31TbCHlPlq2BONvt8zO3j
         D3imt00RGdnhGifjEXXTqfk3jpbUcT25+U4fCE5CclL27JUUME/2HAf3ES3GyzH0Ram0
         0M4G4oceJTxLgQP/wID8VAxBN2w0ir3lIM8mYXdlG3xU/zOoSl6Na41oe7HB/AaYTyNz
         cohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794671010; x=1795275810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        b=K6/HX6Qr+SCYDayye2ROPmz64zUNurXvwI55rRqW4TKB6zfLHTr+lbQ5iDVcHgwN0Q
         YVmChzuW2cBJiqjP2RROBUWTrjvt+No89SBrGYaU7AS7mFrHAjhzCYAUPy78FqBWQ8cH
         FWUzy4b1A2EvmXl0kTa5lFG3Jj6YVoUfzQUabyYnbBkZog1ZpV4Gd52X0lLfxRzYKSKt
         dMHoAPfyDLQWoeD59hdI6d6Tj00/UGLBH5W5NopQZuFb0jtRAmGf/1ONf0usEoV/7Y21
         2UYwTcmOw2euqmJ44PZ/5AZILb8LyPgvFGOLDGqF2OqDqUlRAut5vwSGyxsKnHDTnqnO
         4UrA==
X-Forwarded-Encrypted: i=1; AL+hErGLotkqLk499YIe5W8LWDqO0CoxqJOJJW/NhrZQwWP5HEjx3geifdR4eHLgvAx1he0P0Hn95DJqlj4zDRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CK/qCPLInnfgLVt+PCCVE3p+0LQNErv/qotijJfI//cT0SiZh
	wL3OPN86/QP8Iv87Lhtf4rbDoFM5d1FFc02ng+YWMcbUUB2zPPODDV77SJ/5wdgzgVwa76q1OLD
	DzIuI437On/rRGnD9DKuqD8jMUVBWfmY=
X-Gm-Gg: AYBFou3Bka4AmKe3yh/rhx/XYIspF3IuiGUhJK4PE0aVZ1a8TvWueCpzEozejIrCM6l
	J3eWG+DBiN4Y0SgS3q4TbLTRQ0E6pUaabvHEYL9aTmjmO51JYvKdmUpq1dkTKFPWCxxc9Ow4SX6
	bcOMd1EvR0n8i/T7W9MtnmkuXY2cQHGHLVxEYQJxBOXZkepI6zHv3lDTDp2snodRWGCFm/sRXn4
	yltm6LTC63YjwnwFdTH01OShWGgqyBehTqI0NYzg3eaN+/Vo1YPHOlwvTE6pvsFB9d43+7eFhQu
	VOlNtGaHnlIFOzmuzxCKY9ftMWmeUZ3+rWpoCI2INjuBuYJ0PjGfBvbySCg9V8gqgLT0glnQyae
	JIp30xMnn0azAgDitfOEx1fopTBqq1rNA0iPhSAeZXTEG2jEPstCjOzwosKlkeIo4urkJ+58JhN
	95umk9GbDLx0vJDp+hdYnKasN4hpy1Zy+zG12dKqmhjA==
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id
 5a478bee46e88-37966e3abf5mr6101065eec.10.1794671010025; Sat, 14 Nov 2026
 07:43:30 -0800 (PST)
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
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com> <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info>
In-Reply-To: <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Sat, 14 Nov 2026 16:43:19 +0100
X-Gm-Features: AclHuK9JZCuhMb1uoaKigZDdQKHU-3gJV6cHqPK13T6gU6gv_wW71frzsK9rTyg
Message-ID: <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	regressions@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hungyu Lin <dennylin0707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/14/26 14:11, Thorsten Leemhuis wrote:
> Thx for the reports. This sounds a lot like a problem Hungyu Lin is
> trying to fix with these patches:
>
> [PATCH] fs/ntfs3: preserve colons in symlink targets
> https://lore.kernel.org/all/20261029203457.59990-1-dennylin0707@gmail.com=
/
>
> [PATCH] fs/ntfs3: preserve colons in volume labels
> https://lore.kernel.org/all/20261029225856.1173-1-dennylin0707@gmail.com/
>
> Please look into those -- and if your's is a different problem, please
> report back.
>
> Ciao, Thorsten

Thanks, Thorsten. I looked at both patches. They share the same root
cause as my report (ntfs_nls_to_utf16() splitting names at ':' since
be310476e886), but they fix different call sites and do not cover my
case, so I believe this is a separate problem.

- "preserve colons in symlink targets" adds a parse_ads argument to
  ntfs_nls_to_utf16() and passes false only from
  ntfs_create_reparse_buffer(). All other callers explicitly keep
  parse_ads =3D true, in particular ntfs_lookup(), fill_name_de(),
  ntfs_d_hash() and ntfs_d_compare(). The commit message even says
  "Keep parsing enabled for the other callers to preserve their
  existing behavior."

- "preserve colons in volume labels" only changes ntfs_set_label()
  in fsntfs.c.

My problem is in the lookup path: an existing directory entry whose
name contains an interior ':' (e.g. "Reverse: 1999") is returned by
readdir, but ntfs_lookup() converts the name with ADS parsing still
enabled, looks up the stream " 1999" of a non-existent file
"Reverse", and fails with ENOENT. With both patches applied this
path is unchanged, so stat/open/rename/unlink on such entries would
still fail. Only mounting with 'ads=3D0' restores access.

So I think the lookup case needs its own fix, e.g. one of:
  - make 'ads' opt-in (default off), as before 7.3, or
  - in ntfs_lookup() (and the dcache hash/compare helpers), first try
    the full name as a regular directory entry and only fall back to
    the file:stream interpretation if that fails;
plus accepting 'noads' like the other options, since today only
'ads=3D0' works.

I'm happy to test patches.

Thanks,
Cl=C3=A9ment Smagghe
