Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE7388E7E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532602; cv=pass; b=KVLSq2xkNrqGttnTxXg88V0HzoEDzY0juj94teu0/CiJEDYfGi/UsGqHdBmKgilgMxxxFj+a0K79nuGLUOW7NLppfpl2oTf2eLHd9xHb6uOFlkZJImRmYkyj/0H3V9eSg2oYSoKI1GfreKKPwBEV/51lI2f2E0A11vjEqzZQuF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532602; c=relaxed/simple;
	bh=sufgCmERkq8BhvzxeLr9+DCQH6M2RGa+zHXe9QrcWq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRhtgr7YGB1xb/fPhElpRVfWNxEpEgqfRvP3wWJ4pq47v+P6dYndSeG+Dvii7riTw0NNECJQAswUcTZl93b0Ar4gW/amRga/HTO5oReQWdPi3JArxCcNdzXIZ/+wNEFlKNAU81fLwyqjXy/uyGxjR9BWpldzZ41w11IoJOM0tcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SN9d4Ua8; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN9d4Ua8"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so4465535ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789532600; cv=none;
        d=google.com; s=arc-20260327;
        b=UmQi2pZhST7+KSYjLNCluEvd+bR1B0Ytmuo69dc28/lrjY+w0zIHIXBUGdoEOcj/CD
         e2bAHTYUsFH3qGHkOu7rYHSors0LiyBulWAcBpQ1Ifv9MBNdpf0SU3UWBpDsHbtiC9iC
         4cqaUKNWlb68Rx4idTIYMh7PCTnSBfVL5dHfuVlfnprqmef34kmIOcGOCXvZBXCMX108
         tqoPKYnBY44pQEQHB61FSzYjxCd+PdK+O66L+A/z1GpEJqxGgyMtb2msEfoPjlWRMZh9
         UNnRR9jdc+GoaUaP6kT1VG9+1PuCiLux0q9Bh/NmhMyNGtwVs860tP1YwesezyxliCmP
         NW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qpv+I+ll+AWjEBkVqvOiwNT8JvM6ZrpwZw+bmn6KWNk=;
        fh=OAV9KoeHUH5fZcm/BNQNJ5mUR7Wf1EMsBQKOF0Hp+Z8=;
        b=U+1QZLtlYeLZRWr2u5SinCazQuvcgOOn82oksEiy/G7XyEM3SaOLOMb5RVTUJ5Pl3X
         4mJiTp4s20oq0ERz5JVeTSSTsvDe++SxEvn+sQhyEDQx1+1V1tiDukB2mSGnbv1yOfJ7
         0vxrDWwK7pgll2J5GHTO5Nci+XhjfYiLS5SSrM3MSqd0M5KLPLXohf7cQU1rNOnRrDOa
         Hz/YBhRpjfghGAL6SduoO+KeNM17XwbkgikFy4ql0lBpL8GsZnBPTk/ms6MkFcZHSlMU
         TUpscPtKW31vrqTAoUq8fB1nBynmrCehKn5Zf+lyRmO9k2n5AMP5RA3F4iXcFtpRVCM1
         hKnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532600; x=1790137400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qpv+I+ll+AWjEBkVqvOiwNT8JvM6ZrpwZw+bmn6KWNk=;
        b=SN9d4Ua8tr0yhhKBebrbwLuVvWr+GzMnLhZTOvXS//slM3nTT8m8xRBedDKtIh8v+t
         garlUV2mXIGU0Pmtjk5wBQ6VDc+ZH+DEpeMBUwzDTnnAq1pu+LAGd1RX20WuGPu+M7P/
         dsdjcJ5J1ojUuo0PQ00xCV8B+gbf23lyhkSEkoW3At2XNeVMvuXnvOaZjhyP1H8h2SoK
         LnOxoaOVTrguqFpEUmjIcLIKtYDe2/ZTPJv6tybWkHO28tHwBtyqk4tVK5TU4NTLtQl4
         bNOMxdIZOtN/aLJyZjU6Lf/khz0rlj+J4P7yeRNVl9BdxZeua8q8ok6hHZpnfVHyjkvk
         +orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532600; x=1790137400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qpv+I+ll+AWjEBkVqvOiwNT8JvM6ZrpwZw+bmn6KWNk=;
        b=zRWUXYUcl1NUsR9xBxEy5kDsPvfISiW74akoqfWOUK0GikhlJKuUYdLqf6GSG3BpSB
         z/Z+WCFcbTPYOiQBg2Z3mp7yTbxn3vJrjrw8fEkzxYLjq4C9txXRrYM/ou7QBPVyFQ+2
         b8mUHeysIu990u+16paKEWAUPQvqu/4fz/dAXid44lEtXU9ZTRmFgVcC7KHDv6/VsDpu
         b8LTagPUxBbPoKdLJQDgwPXddXiFvUuuFCKFVwRxYWftl6oCA7ELJ9oM35A8Lp/nj4Ex
         3u4aorvA9WYlup8pOnGZ5xKsyEW1l6lRxCeTPYMVzVa1UEL2IVc19YCYIBMCbRxA4dWq
         cEzA==
X-Forwarded-Encrypted: i=1; AKwUvBzBuvTRNL39oydFajQV7rBQChlWHM6EsGyDmVPhiT9cpwspsQPIarBtOzeBZhDmHprQmhuV40soSNKyeh4=@vger.kernel.org
X-Gm-Message-State: AFuF++l10fT+8/iFxJwoSD3C48R+IK/9LsbKyLm4ULdY2eQMyuVFm3SS
	7MmfBaRra+rlolxY8oclemhLz50tE+RVja4OWhEVUqFGSRu+qgbtVmWguq/xk9b5c2FIVv2nATM
	EdlJIYY4xBbCoz2sB6tm++qEfXv1BeEc=
X-Gm-Gg: AYBFou1TsRMlHL6g8zQ97eiHXqiNt2Jzbhz8PuOLZeeWCv8q1pTM78M1iizlQ5LZRuE
	hHM1lBPVvyVJT8zh1pm7tVk0+wyzDEkJuBThQ+kJpkR+7Fhn04bMB64wA9h9ulOBI7fE1w0WI20
	2uiUcq8JTdBO2f+4WnWuuLiO7s/t1Wxv0tnAlUgcCPIJ5wjUdiOAsfHazuggdDPjSxRaO/kt9nt
	WcpTan1qeJQ426pjnHjR671SAd1XwmEgJ48r+GXa1gTNsiFLKnUfmEfy/YWfdWUHgUrsMTM9pEW
	1T463NLhDVA4x5EP2yfhLmWRe5GpT8l18G7TbrLJQKIWftBervgtkGxRb50N7Gr1ook2F0XN1xB
	u5QgbDWmh+hR1u/5O6jGOcMS0mvKhC1MihJLiJn4L
X-Received: by 2002:a17:902:eac9:b0:2db:5c0a:f18c with SMTP id
 d9443c01a7336-2dd8e00ecdamr15104775ad.6.1789532600085; Tue, 15 Sep 2026
 21:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev> <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
In-Reply-To: <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Sep 2026 21:23:07 -0700
X-Gm-Features: AcwNN1WihaATHBhwxK9WTwB-lsHa37kIkPVuYEXTCQRAV-qB8ftIsulPsZMM9so
Message-ID: <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.de=
v> wrote:
>
> On 9/12/26 11:59 AM, Alexei Starovoitov wrote:
> > On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
> >> Linked-scalar equality is full-64-bit only. A 32-bit mov from a source
> >> with unknown high bits therefore has to drop the relationship, and a l=
ater
> >> narrowing of the source never reaches the destination:
> >>
> >>    r6 =3D ...              /* full 64-bit unknown */
> >>    w7 =3D w6               /* 32-bit zero-extending mov */
> >>    if w6 !=3D 0 goto ...   /* not taken: r6's low 32 bits are 0 */
> >>    if w7 =3D=3D 0 goto ...   /* not deduced today */
> >>
> >> Record a low-32-only link instead: dst shares src's low 32 bits and it=
s
> >> high half is zero. On a later narrowing, sync_linked_regs() rebuilds s=
uch
> >> a register from the base rather than copying it, by re-applying the sa=
me
> >> zext_32_to_64() the mov used. The reverse direction is skipped: a ->su=
breg
> >> base knows nothing about a full register's high half.
> > at the first glance SUBREG_ZEXT is exactly the same as ADD_CONST32 delt=
a =3D=3D 0.
> > no?
> > Both are unidirectional:
> > w6->id =3D=3D 1
> > w7->id =3D=3D 1, add_const =3D=3D 32, delta =3D=3D 0
> >
> > will zero extend w7.
> >
> > This new SUBREG_ZEXT will do the same.
> > What am I missing?
>
> The 2 examples below both imply ADD_CONST32 + delta=3D0, with different
> semantics and need special casing.
>
> w3 =3D w2; w3 +=3D 0
> w7 =3D w6; (r6 was wide)
>
> With code hacks it could in fact me made to work, but its less cleaner.
>
>
> Current approach we have something like below in sync_linked_regs()
>
>                /*
>                 * A ->subreg register shares only the base's low 32
> bits, so it
>                 * is rebuilt rather than copied. Not modelled together
> with a
>                 * delta, so skip if either side has one (sound, less
> precise).
>                 */
>                if (reg->subreg) {
>                        if (reg->add_const || known_reg->add_const)
>                                continue;
>                        if (reg->subreg =3D=3D SUBREG_ZEXT)
>                                reconstruct_zext32(reg, known_reg);
>                        else
>                                reconstruct_sext32(reg, known_reg);
>                        if (e->is_reg)
>                                mark_reg_scratched(env, e->regno);
>                        else
>                                mark_stack_slot_scratched(env, e->spi);
>                        continue;
>                }
>                /*
>                 * The reverse: known_reg knows only its low 32 bits,
> which say
>                 * nothing about reg's high half.
>                 */
>                if (known_reg->subreg)
>                        continue;
>
>
> With the suggested approach it looks something like below.
> ADD_CONST_32, delta =3D=3D 0 has to be disambiguated from a real +=3D 0 b=
y
> inspecting another register's bounds.
>
>                /*
>                 * A low-32 link shares only the base's low 32 bits, so it=
 is
>                 * rebuilt rather than copied.
>                 *
>                 * SIGN_EXTEND_32 says so outright. ADD_CONST_32 with
> delta =3D=3D 0
>                 * does not: it is also what "w3 =3D w2; w3 +=3D 0" record=
s,
> which is
>                 * a plain equality. The two are separable only by the bas=
e's
>                 * width
>                 */
>                if (reg->add_const =3D=3D SIGN_EXTEND_32 &&
> !known_reg->add_const) {
>                        reconstruct_sext32(reg, known_reg);
>                        goto scratched;
>                }
>                if (reg->add_const =3D=3D ADD_CONST_32 && reg->delta =3D=
=3D 0 &&
>                    !known_reg->add_const) {
>                        reconstruct_zext32(reg, known_reg);
>                        goto ...;
>                }

I think that's a problem with reconstruct_zext32().
It shouldn't be necessary.
The existing code that adds a constant should
already handle it.
If not, we have a bug in add_const_32.
Instead of losing link at wx=3Dwy time
we can keep it with delta =3D=3D 0
and sync_linked_regs() shouldn't need any new code.
