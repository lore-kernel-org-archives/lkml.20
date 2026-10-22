Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684970;
	b=NB0fLExaa1xo4MPxDDeNmIQxGvUOWqFm9RLf+6egtkl4HMUWQEj6f+LvSku6rMd8eqe8
	 wQgiZXkHzVa0TVkc57x/MSEuyQ/XppscsPP0IlMnihmR90uYeT3SM0OnowrCNVyt8I85E
	 0BiTMnme/WyyYZukyVK/5ocAbIgfGG6PCKmKArpmyPQ69dZCifVGTqH7kLJ83AAdFs5Zp
	 r67YFwhrN3D8/NrRuXuanL6H/30SYn02hfzFOvVO7s7G6pmyBZcwBCQbopzow7P2o51Fu
	 HRDw2I5VnfE8FtlrZSiD3+4EaxKQdRCGU2BFIjhUH69xE5DqU4baRO4wHlPslQZ5txg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eA58oXbcrSiAmB1z3oyxKF4Toj+uE3Ix/LWp9TBh2Do=;
	b=4uOzIicULjSa9M5uEWnhSq1b6K8cIb61Ud91mSPR5LcQVOwLQHk9HclEwD0q07mCatI+
	 D9Z/tU4ZdTx2ReIPcRmkttl8at3Mhalv0SUZtbIgSFa/OEp/gunNBfFimMY3fNVcXW6IB
	 zzVWk0qIV358zZMyVP2PmqHFEqjOFDhGi7lgfgEA760g9oYLICbgGWryBe9VCNHL5JK58
	 9D82WzbA2ogOWjvKH/bHm+YQdmclN/XtsQbLcM/uioI/psthSjcjhAeNVWnW9fM86+nvw
	 jFHltYvgSQrRnhrcyXGTo/2/PztN62cDKtLgjkkMcLPr1NDE74piEjg4uUO7S+sLFLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nRAF2EWy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09C6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nRAF2EWy
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-156cbe59622so1729632c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792684969; cv=none;
        d=google.com; s=arc-20260327;
        b=Cw/rB4RwrdweGp0M/a1fnu+px73EXUwjNkmGIOSw8Ui2jOy6UfE7Lzyepcl1mkvpdz
         RGmDDhSQnHjLidW76aljDm6OB+mAZho1fdYIp9W6ofue7PTgepjh44DuOMTytE/a352y
         QSePv9YsLuq07vKpwtkdGbNNi6NH7vIQrkloYIai7F9Txdohae5pKZik4MNv3v3dHaSC
         aDuFaR+7lvitYtnhFGmz6wOf8UYeXXFb+5xqW+vwUWdnTVTmJ5v7ywPGbcOakH1iQdGf
         M+zcvYzC3XCnDIfHj7FY1gx/dgqfrufdGJMfOzEnU7V4bPyS6zGaYAJn+LkbbkfElz5w
         2o4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eA58oXbcrSiAmB1z3oyxKF4Toj+uE3Ix/LWp9TBh2Do=;
        fh=8okG9m8gYF2o0WOobx2v6FqrZrOHIF6ZvoSRXPp/jcc=;
        b=YbMhWwEcwcnvAP0g8YzPpzarow+iH79AgOmbTkPdXWNvhishiZ1vAC/4skUfiHQe4+
         mqHcH5Di4ju4z7zn0PLcdw6XI8PZvDdP69BzOleMWZLvaYcyhROUwOedoCBafLe4TOQx
         RYX0S05oQa583c6kO7QFX7iyScrp+ww3XTQ5ZdCo5Q+cU7I6+SqYfT7Qb2xAWzjl/jkI
         P9JEfgZ7J6dbBwd8qFlVJWJb/ynXNtAqe/h/vbFs8bLNdxpRe2gbZvcC8zd3sDQIODwL
         u6zb4KmRvp6Mub1Od0Nn1LJAThQFqBuzqnfkZM4U/nzfPasfsxAqvzGka5dapD3Zsekh
         LukQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684969; x=1793289769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eA58oXbcrSiAmB1z3oyxKF4Toj+uE3Ix/LWp9TBh2Do=;
        b=nRAF2EWyUvrolQqqw9Nj7dm39wTIUH+369VUnTl+rNV+6aWufDtdz1lbBJXzbufflv
         ZBmJudnuNOgLVRrdE5S9yqy+UqH8Foils1h0S/jhpme2sR8o/BwDIiWFFnavfTBHU1KF
         FaIOWmw/iTWjHIBm19FMIeY2lU29CaA7NsDHjU6LbDAj3EAXrEED22ZATGElxc6RZBqy
         FIpv3Yz3gMxjmTFUzHp5g57akuYbOQAFcbndlXLbalg/Yo64jCjk5ff+PJSj2NohnUic
         pKlml3qgatkSoJNLUY/VVKxpxWTLPYL7eox3DJbmDlkCxcsJCLKjXqIH9MUZZsj8Igyy
         KO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684969; x=1793289769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eA58oXbcrSiAmB1z3oyxKF4Toj+uE3Ix/LWp9TBh2Do=;
        b=qlyDBz7+ktQnzy4quToUy/aGFmsut79/KbeUL613GFfoFm8T0pIwvcCewBbVleKCJi
         JXofs6ni8wIJKjIfKpKbd4e4igKskTlX16toc3cxvzMQ5pZ2rQvteCij9x0XAz1Yznem
         CNmpXKElxbvniiZT6GO30ktCu3VUIdk3QS+4pDN8OTsdWNSxHsVs3OHNKfoTpG/aAhMU
         eiE6xo4+bME+DUeiYHhTyquIOnqUdD4ROyh5ZH3hqgKyptT/HtUIJ1zyfe8wIkuSKy1J
         VWy5/FJqfxzvaiD4w2jcHqquX5Qr/KYWBCdJAjuBelET8fhw9VcsJCHUDs1x31xlAKry
         IiAw==
X-Forwarded-Encrypted: i=1; AKwUvBzXU1Hk50H0QzrE2UonjSZGZMZsrW/z5RcbLztNqkuV3eF7PpPkPgmeZxJmHFqhsQeERdua4wxrsW/+/jI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDZFQUmQA49yGB16ia7STYo6Fr/ZoFTgK9X3k9K39I1+Ek+NWx
	AsL+CeomQGz2NgGrwCBKU8lFzHHT/mLfKwjMPdlj/yCHPLRYkO2vsoO3b3gucu9RACGlJ98qyml
	aCOWjuyDYT94Ewe9ahfuyOR37csjwY79bO4a4XtN/
X-Gm-Gg: AYBFou3JyOI5LEp/Kgx/PGbOE3Phlp6ZrVe0ZcG/ViQwrL+3oLz4pQFzX1Wi/d9UiZK
	8Jx8X5pPjZNjRkieAAl/Tqu6DEHQ27EWQR3x9RAEsAGgaB/NcAdN5ybrsLOrn1X0gmoXF17/WIc
	uqCEqjh6XQDwfjjlJfYVMek2u43J7ARO/kmUuxF9+4UuGua/SK+ANV1/XbbRrPlO4P5s+L9346r
	lIvCRPEvtVRf2JbqreEkeQTwwX27fyqM0W/wfGj7xoJIXrOCDsK7psiIAdA+FQ+OXvX/FrggfCF
	+r+oYRBoHCDs7XjU1mIjOfDQJ0w3JoUUdQiuk+8TFJLjR9CarfdmcgvidXa08Q4V6m0vGeCOH0S
	hmjpGbFJ/JsjVPoihTm59+V2Ffb2aJtaXvXDG4s4L1lMhi77t332yIrWqYVo9IQtVKQ==
X-Received: by 2002:a05:701b:291b:b0:160:6a5b:7edf with SMTP id
 a92af1059eb24-190a728a5a9mr5870744c88.44.1792684967579; Thu, 22 Oct 2026
 09:02:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013205223.2396822-1-arnd@kernel.org> <6c18da11310ced4a7c85ac7862c3f5c67b39891a@intel.com>
 <3486e0b1-d188-47a9-9de6-7ee5c2cfd097@app.fastmail.com> <90fe0000d611f080164a1fd7f228cd533a2e927d@intel.com>
In-Reply-To: <90fe0000d611f080164a1fd7f228cd533a2e927d@intel.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 22 Oct 2026 18:02:10 +0200
X-Gm-Features: AclHuK8K26Lbju3qBt07ubYqFLozHzTFn-VahHrb67MbQWwOYgc-zANXgi2WEOU
Message-ID: <CAG_fn=WbwZKeaprUu2q640ffLfxOSsGAjGE3CcC8fm7yeJ77AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: reduce update_display_info() stack usage
To: Jani Nikula <jani.nikula@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Chenyu Chen <chen-yu.chen@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 1:37=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Mon, 19 Oct 2026, "Arnd Bergmann" <arnd@arndb.de> wrote:
> > On Mon, Oct 19, 2026, at 15:28, Jani Nikula wrote:
> >> On Tue, 13 Oct 2026, Arnd Bergmann <arnd@kernel.org> wrote:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> The drm_parse_cea_ext() calls into nine individual parser functions
> >>> based on the data format. If all of those get inlined and KASAN_STACK
> >>> is enabled, this can explode the combined stack usage beyond a
> >>> reasonable amount:
> >>>
> >>> drivers/gpu/drm/drm_edid.c: In function 'update_display_info':
> >>> drivers/gpu/drm/drm_edid.c:7040:1: error: the frame size of 1888 byte=
s is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]
> >>>  7040 | }
> >>>       | ^
> >>>
> >>> Mark all of the individual parser functions as noinline_for_stack
> >>> to avoid this and keep their stack frames separate. This reduces
> >>> the stack usage for update_display_info/drm_parse_cea_ext to
> >>> a more manageable 744 bytes, while each parser only adds at most
> >>> 200 bytes on top.
> >>
> >> Is there really no way to tell the compiler to not do silly things in =
a
> >> more generic way?
> >
> > The problem is really the sanitizers here, which turn off the
> > optimizations that gcc relies on for its normal behavior and
> > which cause additional register pressure for the inserted function
> > calls.
>
> Cc: a bunch of KASAN folks.
>
> I think it's really silly and ugly to have to sprinkle
> noinline_for_stack all over the place in pretty normal code [1]. The
> stack usage for each individual function is fairly small.
>


Together with my LLM friend, I did some digging to see whether this
can be handled on the compiler side instead. Summary of what we found
(x86_64 defconfig + KASAN_STACK,
GCC 15.2 and Clang 21, -fstack-usage on every object):
1. The immediate cause here is that GCC's inliner has no idea what the
   frame will cost under KASAN. Its stack estimate for a callee only
   sums the raw sizes of address-taken locals, so it never includes
   the ASan redzones and never sees the register spills that
   instrumentation causes. For all nine parsers in drm_parse_cea_ext()
   the estimate is literally 0 bytes, which short-circuits the
   -fconserve-stack limits, and since each parser has a single caller,
   -finline-functions-called-once inlines them regardless of size.
2. A generic knob therefore exists: passing
   -fno-inline-functions-called-once under CONFIG_KASAN_STACK with GCC
   brings update_display_info() from 704 to 344 bytes here without
   touching the source (drm_parse_cea_ext stays a separate 368-byte
   frame). Kernel-wide on that config it removes 22 of the 103 frames
   above 1024 bytes and introduces 6 new ones, for +1.2% text.
3. The GCC estimate itself is also fixable (make account_stack_vars()
   add the redzones it is going to allocate anyway, ~30 lines in
   cfgexpand.cc). That reduces total KASAN stack usage by ~7% for
   +0.35% text and fixes this particular case on its own (704 -> 368),
   so it is probably worth upstreaming. But it is a correctness fix, not a
   cure: it doesn't change the number of frames above 1024/2048 at all.
4. The reason is that the big frames under KASAN are overwhelmingly
   functions that already have 0.5-1.5KB of genuine locals without
   KASAN (97 of the 103 above 1024 bytes); KASAN then multiplies them
   by 1.5x (median) to 2.3x (p90) through redzones and spills. No
   inlining heuristic can undo that, and this is inherent in how the
   stack instrumentation works. So for KASAN_STACK builds we think
   FRAME_WARN simply has to be higher than for regular builds. For
   what it's worth, Clang does worse on the same config
   (149 frames above 1024 vs. 103 for GCC, 1176 bytes for
   update_display_info), which is why KASAN_STACK is already off by
   default there.

Arnd, one thing I could not do is reproduce the 1888 bytes: with
linux-next's drm_edid.c the worst we get is 704 on x86_64, 752 on
arm64 and 1264 on arm64 with PROFILE_ALL_BRANCHES. Could you share
the .config and GCC version?
