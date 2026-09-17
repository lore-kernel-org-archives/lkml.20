Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B265331EBA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605031; cv=pass; b=eHuirYYRx2JAWzdNy2aqP2lYXgEfRhFQHCINQEsPolPYj9SlGxlxhbqbSOUwxZXhtQUmBRbuOi2rliSCuOREyOU3TD6XwC878MvS3PRB2Cd6fLMTcmb/xx7dvBxMkZkN2H5n4NQnZLcJCx7Aau204IQIFc29apwqmQSc3+w3ViM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605031; c=relaxed/simple;
	bh=tlmyzNUENvNb4Oylh+WHiAZUPw2m3n5RaX0zH+LuxaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjmwY2WYpYUT2GhLDtQi4z7+AFXjPGRvKbJ8syqF2eAaibSEq6OHmF0aFIcecOsiApwkY/UQcOEUGWRjYssNBNFMm5XkpTRmVY2GG4XpPePiwRIS8iPUnmlCohawX/Q+2b2xjNKYTnUPPYCuEzkgtQbs+6GBxvLgA1lR1KaR3QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYvz5cCa; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYvz5cCa"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso178742b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789605027; cv=none;
        d=google.com; s=arc-20260327;
        b=fgGsa/eHpVRVmmrbBhQdmPrMcccfuZUwTfWnWDV9q/w042nRs5kl3/LokkOyWkn+8m
         XINu5GwSH3xinxANQSGEhR6+x+tC+L2dbK8egDWzD8T6xzm6Iw7VuJBgSHFmU4rkb7zi
         toyqJPOmuDGVQ3oekABzHjOg/S+6vRCHNt7eZ0+uphpEAs646fx5zBh1g8wW8x6y9tVc
         JQ50rmdR2LzFCilD+prTQzCvCvEzHbcQmh7c7mc9nMUp1oPEMLRmRliV2qjBq8c5P8NH
         Zi1d3yqvYksQRLXRQzrL9VfnL4vejGiQQZ6d7gqQB3IJobSBADvuZq6YtUs5BOgYDdMq
         zj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nH+1D62/vONjE3NQ4kwcRmw4ufbdwDd91huhFb0U00k=;
        fh=qOb43SokBt9L9hmKYi/5YtUbWy7fone4XthYdyjQPqg=;
        b=Xb9it5zJc/Wqyi7O2b8HSM0Z4loh1Kp/LAv1Kpl6+ZU2QsrQ5gXRDZGDII+Gl3w8CP
         3UFUkFUOF6jynOSY+obV9snjOpm6poQVH8FbytPdgM5Uw5G52Pt95bM1Sxu/FoIjxKQ4
         0xeWgNxQ0VDxRIno1OqUIxivCukcaAt68Op7yd+5Fxj1ZRVZ7C/yUdIvwRZ5eyiIelKi
         d7VY7b1aMRN9HbeO8DFNS/yqeNkPKP9BLznF07piYsgXw93tZ0ozuxE2SXqyJcWwIjXu
         eh8cYxC2oq5JuANaz9VXeNPpjb6NM6ffUwO1zzjXvEVrLFrdWDdHx30TedW0NTxGijLc
         AtDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789605027; x=1790209827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nH+1D62/vONjE3NQ4kwcRmw4ufbdwDd91huhFb0U00k=;
        b=rYvz5cCao9532scJdPg8dvAXksLLWHZC8u/uMD+Yl4rpF5S2Olha51c6mQFPgD1Qhg
         9mzvjgRE+OAMLsa5Az0N2pU2eMAtjjGRm+vKNo6llTGrjPC5iae6TXq/CWk4WwiWp/gZ
         X6iePs+W6uecExiRhYDtyL9qeONmnGGMOtWiRGP5ioNSPzfi99oLwoJzzgyXyxutZByo
         KmW4RRR0p8gZt7jl4r/yxWr15vO4Gn7vgqe4VzOYItSj8xxfsKHQsnjSpfnNGNnM1Ty3
         0lxhL7/AU3cSXUluSVHELJMZkGSaB4iSnXos+WFUsOyCGr2E35L4N5zgkJm5kPYTrs84
         DANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789605027; x=1790209827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nH+1D62/vONjE3NQ4kwcRmw4ufbdwDd91huhFb0U00k=;
        b=MG2pmCy1zVrZcWc9RPi+UEY+0yh67VqFLmNnvRbUNIJvoVBLmUuR5/CRnFSa6+x7oH
         IEouf1Tsh8qHdY+3+qnUdHTsLIX7dND+ThDDaP9tLXb7uyWe2pCA9g72qTdyXM6lYYjn
         ucNTRvcdf7MhvS87eLubWrXGu47X5aRJmc6LbRiEn9q1F2ShWB8I1O/tj6+9+96hLpLf
         tO2bkgjU28zERhjdjINGtlKlOjTk49CvUZOjstjXOS8P489VbIXMqn1kVc1nj7CPSgnt
         GlYJQm9GOyhGZN9ihPFfEvElKl6Zop1ivQYahshqbk3bKsGz7/5J09/A6uohIX69jakU
         sWMg==
X-Forwarded-Encrypted: i=1; AKwUvByhuJtGFwjJop/qJN8WnkDgbA/B51J1IKtmnDb2K4LzP3e8CtBaWMmbg3wiEHBqxUXewxwkSHd1N1Zi9xs=@vger.kernel.org
X-Gm-Message-State: AFuF++kwAeiFMJOzmnwjv51GiTxk77C8JGRPKQ4EWwZOpihdwBbWL3Vi
	owj2FGQedusCnGsA98yMTt3WJqP4c9og/8drHWaz1xOD7krZwjIT01iILT96Bq1rIIjcC4IGgha
	hu2UH8o2g2uVIy2tBm3sgOZKBV49Kp1U=
X-Gm-Gg: AYBFou1dQJSdE34zl5TY2v3yVGPWNfEy4v+b4XZB4DNWggONIBo2YKrXAPIsfWKd4R2
	RvBWirqpfOHmC1eNIhwXejHd3DC0axb+dWwaGGtBuVdMZssjYJILqPdlX15jN7aBtgxm253AWUS
	PYA7JsaZWOxxPVrJjwMxakycvfDRpVn7WYPrxD5/W2pCMA3BBFgIHVA3MLZ4hAWukI+mmN79LaT
	SAtLVESOEisiE17Ia4yWiz3PpbVmqs6mm384FwcDhqZHqRp2NZ6Xk62dqoOLJYswaP/nmSTnxPM
	LqEc3eOvwAHJ+S+pJXqoUjYQGM5jUD8AM+Sr0dHZIliRPu00y7o2GqVXoGOnLQOEKaOOaoibJt2
	k9UB2L5vtJfE7wH2NnDVRsyjHsA/5L8qiSLn4jzURhw==
X-Received: by 2002:a05:6a21:3315:b0:3d0:9590:7148 with SMTP id
 adf61e73a8af0-3dd5f5d86a1mr12651151637.17.1789605027369; Wed, 16 Sep 2026
 17:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev> <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev> <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
In-Reply-To: <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 16 Sep 2026 17:30:16 -0700
X-Gm-Features: AcwNN1XLUhSaujLVZNDBYUznBk2B1PEMW-Z99HXDCfKhyI83tPo-EfJkONx0oj4
Message-ID: <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
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

On Wed, Sep 16, 2026 at 5:08=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.de=
v> wrote:
>
> It ended up with full testsuite run parity - after 4 incremental patches.
> But the pattern of all those patches was adding some predicate /
> special-casing to reg->add_const
>
> hunk 1
>
> -       if (src_reg->add_const)
> +       if (src_reg->add_const && src_reg->delta)

why? It should not.
My point is that zero is not special.
It should be handled within the current framework.
All these extra hunks are not correct.
ADD_CONST_32 logic should work for delta =3D=3D 0 just like
it works for delta =3D=3D 1.
