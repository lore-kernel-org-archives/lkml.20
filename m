Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311221;
	b=OM4tQ6HQFsTGZ+igLSdiqDEWXeDfwvRoIiEKCJShZ+c9cAHkDosIdCkOduyhCVDX01Jl
	 H34Qlbnqo4KUaBea/KEUM9zLHMkMnnPRt/skwA2Zji2pePmEwkzmFAohe8EPWGqjuFtgC
	 Eh9TDrg0YKQRc5F2ygbSVUmRMUwTahjHFvKBMifc0l6G+ffZatepCxoM2iSiXzYP0HiXJ
	 /tMF/MOuEMYDuhnXczgp3M/2pN64100kPFoKeg86YmeINyfTJ89J8r6vBIHU7faI1MuJ3
	 Phv/RgnfPRrTmQgCVpeDef5rJUraL31pkvu/m78i7WyHMfkp5oKqRxLdvQgeSACGaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=IFhjJU50NRnZLc/6Fw9ifnZsiu6cQSxgUNU45JN2ns8=;
	b=uo3C+TY09WZJfKZr1EYWVi6CohRZ+wNznAwf5O0MdbHCTQ8A7Dc01txYgYIemySmPzOG
	 ZZOp+UGERazNNPA+YDhp6W7uNhtdPQMyjxtpCUq8OW0E4aCmUYlj32Dw6YuPlO5PIYC4Y
	 teL+AiYxPcj+O9fG6sagjsubipyPCfYpVG5GR7B8kVXI/h3xiedwG+tXDVnMn/EOuxzSQ
	 /wLH1SdjwjTarBlGW9EIaHVPRmWtW/YJ/NWgdJ2LSWAeJvkZbpCllfkoPX7/SlfoX0uwV
	 E+qr39sslp+8TGNUpG4RnwFQB7YgrZ3npaDtRT3cV7TtE8aw8hWRgyNY/0WZtzt3/Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dTwvA/sR";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16919606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16919606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTwvA/sR
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso15910a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311220; x=1793916020; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IFhjJU50NRnZLc/6Fw9ifnZsiu6cQSxgUNU45JN2ns8=;
        b=dTwvA/sRRhEhXRAnPsyxzlNDqgVCYWHpW52EmzfPti3xB9n3NjiKn5rH7l4bNbacS9
         E5WRPKd2jJAedVjG13NHfCroVfIcthHERDrn3n4Abohw4phcIchUON427kpLpd3Mignr
         b7JFtBBO5arDkDuUrENXbQvMxP/dT/xVunsus+BXppO6DjBhz+kfpzSjwa6Ve/3TOGN+
         72a6o7nL8zDe3qMZIQMTbZN6Dkw8sVx4nnoO6fZu1DOgkt7y5qFXDLj5Hc4RwFftAvbT
         ANMmRiS95qOEiY0dCrn6B6FpEyBqqNTTEQ4g93Fn9waJFej0WznZHW9L27RY0yiBZCxU
         pb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311220; x=1793916020;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFhjJU50NRnZLc/6Fw9ifnZsiu6cQSxgUNU45JN2ns8=;
        b=b6+A0X4rF0ft3JcRwgw6PYOc3a6yZ33KEqfpKFbBom7ynNKrb8u91ePiaP8royghIg
         9FXnI6AXpV2nuA7/vb/g+92e1ifjfMrhKMiKPmQ6onVivm6Id9MdoQPffk0E6KAUXtcS
         NSTfBUG1k4puqRvWY7HC/cFQ3nOWyaFdLiY4gkRR08M48KrtfkYemtHc3GxEPkt3JSyH
         OciSLH5vRqpB+Ana6VVioOQpMris6u2fKOTkxqMylVTaCFWnPp93vCaPHPk94Fz1ZcBo
         0zi4DyWEENzPAOaARMvBtq5/20Ec0nY6vt2nG6btIEgrSq7A1sl494fr/G6CfklZbs8l
         p82w==
X-Forwarded-Encrypted: i=1; AKwUvByB0VkcezQTOAFYwxzCQfjJN+s2bDdKi/2n9W6415/TjUkckTyqAKMrUrsKHYF2DdfWC8F7EerssfWIwGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqrjWBLnAqJv5wR+qV92cVvlGL3IoSgkaSl9NYI5JvRwnXjzWT
	Xt2SMHUIKSGMSCz2mx7yS18qi6EJwLIz37sUTejnFjo+UwWljDL8lPkF
X-Gm-Gg: AYBFou1b+AZif/oJVpypPCO87ec63e9o8IY+BbJNelrErpAzeAJ1xEtt/0YW7eczBVK
	8NGOCnx0M9OfS5Jtp4NfJKIhHeNlb7nI6miG/KyBOe0985GjVC1PJ7E8tAYltveEbStD1JeBTOd
	QQrBN96PQpR4mSsdln+fyNu+26knmoISoN/H0SiIgfshLIwoXbF4w/T1Ikpp0KA1yicgtNMe2kN
	yC9+C9G174g8zIW+mHDKXtPZoUEpRrl1AgcsV1PubjpEVJFohqW6863sDbjztirFW5lNv2nn2Of
	B/pD6RPMVeWkFJr8dO2kox6JVfIfE7xARiXxBP6YMktG19OVpR8iz9cyQkoRroXBcvSP1Gor0oZ
	Y8fflSD6B3qNcU8nGCBuNYnpVceakUwPHvlmXkHcXqE+oW7HHgNsE12elBmYv/0Z9aX4Mds/hKc
	lNs+vuCtxbuREls5Np73N1pWYOJ6Nyle3ai0Fo2w2TK56T8vw/yRXnywBVQ++NSYuJqGQUqhMHB
	MsYdvaSkYVyG2MLD7oQKQUOyjqq72zdwprEaclSXF48Mf/dE89GEReSSyDjO6P3j25S6bP3e+dh
	Cb0K5yDdVn0iGLpmrx0E6FSG7o7kg9jyjIRBZR7g306eXWiD+7E5N1DMXaJuoMyujvJaHoMM7+f
	cAdH10OjVwRg=
X-Received: by 2002:a17:90a:e7ca:b0:3ad:3715:d21 with SMTP id 98e67ed59e1d1-3ae897d460fmr248569a91.49.1793311218239;
        Thu, 29 Oct 2026 15:00:18 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cb2e:96f2:5ce4:2074? ([2620:10d:c090:500::4:5b14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm1228515a91.10.2026.10.29.15.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:00:17 -0700 (PDT)
Message-ID: <8c5de3ca94f9abd2afd994b6a7f1428d5cb5875d.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 00/11] bpf: Scope callback arguments to
 their frame
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Amery Hung <ameryhung@gmail.com>, Emil Tsalapatis
 <emil@etsalapatis.com>,  Nicholas Carlini	 <npc@anthropic.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 	kernel-team@meta.com
Date: Thu, 29 Oct 2026 15:00:15 -0700
In-Reply-To: <20261009202759.50520-1-ihor.solodrai@linux.dev>
References: <20261009202759.50520-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-09 at 13:27 -0700, Ihor Solodrai wrote:
> A callback-calling helper or kfunc can pass its callback a pointer
> that is only valid for the callback invocation, and the verifier has
> no way to express that lifetime.
>=20
> Two helpers need fixing:
>=20
>   * bpf_user_ringbuf_drain() passes a CONST_PTR_TO_DYNPTR over a
>     sample it releases as soon as the callback returns. Saving this
>     pointer in callback_ctx leaves it pointing into reused kernel
>     stack and allows arbitrary kernel read and write (bpf-next only,
>     see patch #8).
>=20
>   * bpf_for_each_map_elem() over an array or per-CPU array map passes
>     the address of a u32 held in bpf_for_each_array_elem()'s own frame,
>     leaking four bytes of kernel stack.
>=20
> Both arguments point into a helper's own frame, with nothing
> longer-lived to anchor them to. Rejecting spills of the dynptr pointer
> alone would still allow derived slices and clones to escape.
>=20
> Introduce REF_TYPE_FRAME for this use case: a reference owned by a
> callee frame, dropped when the frame is popped. Tie each argument to
> this reference so callback return invalidates it and its descendants.
>=20
> Callback setters repeat register defaults and map metadata setup,
> while reference release couples descendant invalidation to object
> release. The refactoring patches give common initialization one owner
> and separate invalidation from reference removal. Frame lifetime
> tracking can then reuse the existing reference machinery.
>=20
> ---
>=20
> Patches #1-6 are non-functional preparation. Patch #7 introduces
> REF_TYPE_FRAME and its diagnostics; #8 and #10 apply it to the
> helpers, and #9 and #11 add selftests.
>=20
> v1->v2:
>   * Add the refactoring patches: release frame references in one scan,
>     and fold diagnostics into the REF_TYPE_FRAME introduction
>   * Replace temporary argument mask and deferred register scan with
>     reference acquisition directly in the owning verifier state during
>     callback setup (Eduard)
>   * Reuse callback_park_dynptr() for the nested drain test
>=20
> v1: https://lore.kernel.org/r/20260922010333.1226537-1-ihor.solodrai@linu=
x.dev
>=20
> ---

The series lgtm, but it needs a respin because bpf-next had moved.
Also, what Alexei suggests makes sense to me, it would be a bit simpler.
Ihor, please take whatever approach you think is reasonable and respin.
If you decide to respin as-is, feel free to add
"Acked-by: Eduard Zingerman <eddyz87@gmail.com>".
