Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212FB33BBC0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641633; cv=pass; b=XIVohKhN5QaDTFhUrEBg3PVOd6u0ZcqRzROc4Z3g84rQztJcqGbUx+o6JwQ5jymfpjaUIcitrkbhRc9VzJAGh2ry37C2Y+/3JhFBbehPATgAp4VhqRbaoR13NkOClvqQBjFdN6Zz522OhtDEOvA0fMSJNXsbwsXPzolraprd920=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641633; c=relaxed/simple;
	bh=oedB+msz1/RbWTTJI/j8Ob89ZiVihiju6Zoh5FNSFPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJCqzN1ZSh3ThoBxKM/+gRCctxPdVZnVp/OPfgaKm3hxLJaqmaMpCwBIBYaKpj/q74PxvBF9YcbisqlGy3Qip6kpwZo0x3RQMUnhIqmB7EUyCyApcQjVWvWfcx2p52te2rE4X/eOBSt7/AGYN7LcebTaQyFo7SgPwrPYQ4aPMfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqMkzJHR; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqMkzJHR"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso22978215ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790641631; cv=none;
        d=google.com; s=arc-20260327;
        b=BZB9lJjoFGFNMJNL/P61fOC1MueQFC4wtBPYqKoz62JLXnZ8T5cGPDZNxP3dOG/CWx
         HtXQGeg77MauecY+tqOg/nNOBUHLrYpJ1LrfkhRjE5025tAlfCXkun8sJoROnoquHIjP
         6lud7yN/zi53ZdMzvvmlTE+HGX2JK6HFI57V0UqEAhvAl2B/6OrV3vD+qrh0XEIxD3hg
         DGB8mOM8ctOHGJDupLCW7ocW+K5y11wZV9InH83vCzlIqB6Vqz/T5mh3csCZz1BmorPs
         sLT/+AKIku5ImlTBCntvm2uhr/Sz2KhZj2JunezLaEmCpfDwa5bSRweVZFqhZQqJfXY/
         pV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evfNHQW86Cj5VxAsvpF7erfdox+HUI7X2p1VfXog5vE=;
        fh=QkE1Oyg/pwl0h+xj2Ec0J9etl3+Dr86dzARhCT6i0zA=;
        b=e12KJJuFplA2j3hxVbVm01xBFpsZr3m2KB7hqwaN7Lx/oUyjFR0kONF3BRe2NKkaYS
         R25Y+KxtthlGAksdnTSbPJrXH0zCgqX0JymzgGDlezMhQB4hktArfwoKFl9rNMZia0sy
         h+Sk7BVurGbGNSQuRSMVfLZIqU3H3UzaVJvM1NuKf91bNZgCsL/MurlT674hBPESJcEe
         /PLrR4i0g22cLQmh1ILsHLYLGuMXg/tuHWMjMFRJGUf3B5ZvigtWFbChMJ0QtK7bQpN8
         /YpCIh4wftjNFT/UY9s29ld4EDgJRpgP2qhMcV5+iTwNtPxvfX0u8vTCYIJsOasSccG9
         m66w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790641631; x=1791246431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=evfNHQW86Cj5VxAsvpF7erfdox+HUI7X2p1VfXog5vE=;
        b=eqMkzJHR6ieWUMsumPxX+FoMW4HbGfMIXljhQ2oy011tIPyxc+Ri88AVttjHEPpSvW
         KEoa5PQgVgdjq+2j2XI4TIXbckCzfx0GGKjkEOn5KoMrjLwV2QrdWKnW8KZJCsq40bsQ
         NXPgDzxrRrUo5A2Eb9zCbeou/cSFtISiawXc3yQPqq4p5fX9eJ7Z0Jm8j9tHrgsNSNaD
         zGf2DWzbmg9Uqbaa7eL1+3gpmHCpgGw1Q5hOj8lVjIWFz02PV6BAOsxwRSprSnsVM2qw
         /sY9cYSYYBTzHvBuGNn1wT7Ftbf6es1oHhajjhE7eH9qVKEiEK/T9VZutqxC3jcj+15f
         RlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790641631; x=1791246431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evfNHQW86Cj5VxAsvpF7erfdox+HUI7X2p1VfXog5vE=;
        b=WDk09VXpncETvpUT09iW0RGbQ/Dx5OdV+IuDqAWxn9+W1bRiNZI99iF1IE/e6i7Bdp
         JtktYKu2q1VdTZ9fTfrwx5VoIr4ygCYvPKz2wScIxgDR88TCtIvS2NzOYv0/XCuTedzA
         dyvw6XTQ033nL3Vymm6s/SwCM8DKZyxbUP331EPMjhGHnMeo/uibXBWU/tKpDQeupbkg
         0jrOyFYlNq0CodradOBShZoaei1cwPPL2msruuYz+5t/aKyxTva+6rJFbSK0t6EJXQPa
         S4Jb25wccd4twfL2nT4IKrwwCPcV8vqlzBh14N+QUonVkrZQJo7Qx37xrj4pA3VR1tvF
         iToA==
X-Forwarded-Encrypted: i=1; AKwUvBxSuSAzTX+npGrtzS6srgA+ra9RggaiaokdaQGpm8wwV48HBQQHFMr/oYPw3CizNDR7wp9cZY9nq4cA3Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW/5jvBx1Udwg1f+Sm2yuxyZpeg6Os1pz9O7c1boTndfwG9xAV
	oItR4RS8OSeihXEm0YZbmTggOqCce12V7nhStixLBAeATzXW73VnQc42o7PQcfmfq3+Pavck0xr
	WlhpmyOWsmDTHyInTymZELHYz+Qzb6hU=
X-Gm-Gg: AYBFou0NvWs0lyYzR759+eBZu4+xzvy01QUQtR241f667S+tpx01GBsFY/hnGSaqhap
	XS5mYv6IjXZo+u24+fWFlRPVydtViBNzhzA3lxC+mOwTu+COW6qcK7ZUJaXjMYwazRbGGqMHo5P
	CwyKI16e9Ml/yxrfhf8QybAujPyXbG8cci6B4alOe78eliPs347FmYBZqNe5A8trCcjM+valfF9
	emR2xmcy97NcNqK1iko3RGEZsWM2VJf7/yk6BRbKRC1O82wIxt66Mg8uedcT4O4Kjbcm/2bshOw
	mUwmp5+0u18eYd4FBajEA8Ko1zMFV5F4DKhnG0F70RjSpUOVPBRhQwosMmCdY70z3rf7/OG4jn1
	LplIiQcwHXXzRWuIKxg9bMOfebdjXbx3fMQ/g
X-Received: by 2002:a17:903:2f82:b0:2df:9ac9:bcd5 with SMTP id
 d9443c01a7336-2df9ac9be4fmr79405115ad.50.1790641631214; Mon, 28 Sep 2026
 17:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928231441.4037097-1-vineet.gupta@linux.dev> <4e178583-b510-457f-94bc-e0e201698371@linux.dev>
In-Reply-To: <4e178583-b510-457f-94bc-e0e201698371@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 28 Sep 2026 17:26:59 -0700
X-Gm-Features: AclHuK8Wia5st71WEpOkvxm5_4apACucCGaXw7j9PK_Be6EwbPI_fD9sXSXcg8s
Message-ID: <CAEf4Bza13wjYrDRLok6VPf-Q=HsmuBvn9ac7BNE70baTZ49PCA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Fix linked_externs with bpf-gcc
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Vineet Gupta <vineet.gupta@linux.dev>, bpf@vger.kernel.org, andrii@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:01=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 2026-09-28 4:14 p.m., Vineet Gupta wrote:
> > test_progs-bpf_gcc fails to build:
> >
> >    prog_tests/linked_externs.c:17:23: error: 'struct linked_arena' has =
no
> >        member named 'arena'
> >
> > Several problems, all from bpf-gcc not supporting address_space(1).
> >
> > First, the arena variables are declared with __arena, but that macro is
> > for pointers -- it marks the pointee address space. The one that carrie=
s
> > placement is __arena_global:
> >
> >    #if defined(__BPF_FEATURE_ADDR_SPACE_CAST) && !defined(BPF_ARENA_FOR=
CE_ASM)
> >    #define __arena        __attribute__((address_space(1))) __attribute=
__((btf_type_tag("arena")))
> >    #define __arena_global __attribute__((address_space(1)))
> >    #else
> >    #define __arena        __attribute__((btf_type_tag("arena")))
> >    #define __arena_global SEC(".addr_space.1")
> >    #endif
> >
> > __BPF_FEATURE_ADDR_SPACE_CAST is a clang predefine. Under clang the two
> > are interchangeable here, since address_space(1) both places the
> > variable and is what btf_type_tag would have described. Under bpf-gcc
> > __arena is only a BTF type tag, so the definitions land in .data, the
> > arena map gets no initial value, and is_skel_data() in bpftool does not
> > emit the typed arena member -- hence the build error. Note this is
> > distinct from skel->maps.arena, which comes from SEC(".maps") and is
> > always present.
> >
> > The extern declarations need __arena_global too. Without a section, gcc
> > does not place an extern in any DATASEC, so it stays a free-floating
> > extern VAR rather than an entry of .addr_space.1. test_relink() only
> > walks that DATASEC:
> >
> >      id =3D btf__find_by_name_kind(btf, sec_name, BTF_KIND_DATASEC);
> >      ...
> >          ASSERT_NEQ(btf_var(t)->linkage, BTF_VAR_GLOBAL_EXTERN, "var_re=
solved");
> >
> > so relink_arena would report OK under bpf-gcc whether or not the linker
> > resolved anything -- it would not be testing the allocated-section path
> > this test exists for.
> >
> > Second, placement alone is not enough to run the test. Dereferencing an
> > arena global needs an addr_space_cast, which only clang emits:
> >
> >    clang:                                  bpf-gcc:
> >      r1 =3D 0x0 ll                             r1 =3D 0x0 ll
> >      r1 =3D addr_space_cast(r1, 0x0, 0x1)      r2 =3D *(u64 *)(r1 + 0x0=
)
> >      r1 =3D *(u64 *)(r1 + 0x0)
> >
> > so the verifier sees a scalar and rejects the program:
> >
> >    4: (79) r2 =3D *(u64 *)(r1 +0)
> >    R1 invalid mem access 'scalar'
> >
> > Guard the program bodies and skip the skeleton subtest, as
> > arena_atomics.c already does. The variables stay unconditional so the
> > arena is still populated and the skeleton still has its member. The
> > fallback bodies reference the externs without dereferencing them:
> > 'used' is ignored on an extern, so an unreferenced one is dropped and
> > .addr_space.1 loses it again.
> >
> > With this, bpf-gcc reports:
> >
> >    #217/1   linked_externs/skel_arena:SKIP
> >    #217/2   linked_externs/relink_arena:OK
> >    #217/3   linked_externs/relink_maps:OK
> >
> > with b_val present in .addr_space.1 as linkage=3Dextern, same as clang,=
 so
> > relink_arena covers the same path in both. clang still passes all three=
.
> >
> > Fixes: 34354db1b148 ("selftests/bpf: Add linked_externs test for extern=
s in allocated sections")
> > Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
>
> Tested-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>

thanks for the fix and testing, my bad with __arena_global and GCC-BPF
build failure. applied to bpf-next, one step closer to green CI!

> This fixes the current GCC BPF selftests build failure on CI:
> https://github.com/kernel-patches/vmtest/actions/runs/36498905340/job/109=
187331070
>
> nit: The commit message is kinda too long. If you'd like it to be read
> by a human, try making it shorter :)
>
> Thanks!
>
> > [...]
