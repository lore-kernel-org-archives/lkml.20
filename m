Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899464252D1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750417; cv=pass; b=hfo8XULvmmGeiXfCT9jnJv90ttSyXoEwz+JRYdIJU7PHjWzzRtaQV2fjLbrKnpd6FiOYpV2bRnWPXrcJtJ6duGMisKjiAfUnTZVfiwQ5/GW8u/RoeAxAkg/7vuReUn1g27/BCleRm80CfPYhOYaTNa9AG/9Qnmd/4SIk5JDTwkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750417; c=relaxed/simple;
	bh=QNKIrN2lFifU3ViEQu+FhMTw527yCyM+xc+9C4IKjvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgtgTXutNy/66Sw0R6Muwp4Ry83XolXJuVILnxAtKnB7ptLeo3ZWl1zMBsUCgaRNwpWwCiU5yYLm/jx7KngVhbD0nDbvqBPslat8sRm1oTaePdctOcXQKCKbKsOm2EKkfnoJS7XOZemgYAtpsbbUhOX6hgixwOgnfFvfwY3RXcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T27VMRxD; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T27VMRxD"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so8444671fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787750410; cv=none;
        d=google.com; s=arc-20260327;
        b=NHzffkrGcQR8PQqg//3F68aFKrIaXWE0LKsDrnPhTkd8nidO1agyk4Ng4KxmJdGsYq
         sCAM74woZVygp4Pr20jdVD6EuydquZYie9bcPniFoBruS/QR78deXArLTAs4eCtRuSIX
         GoxEKZXeRK7zhqY8o56pd9IAaN9kNdFcdjgsiVbZKGzEhPSiwSImBT/nsnUGFoSrx5Qb
         wfnDa1j94eBAFQXy5kta5W4YHQ12PMsR2t8WqtDOxjWkfA3t3Y28IKB1CSJUSJf4yEPD
         iJu0GF6EocEFGw4iYJCshTOkYtASmAVSd7Srv6zhrw0yh4qazTIfyJu1hEazYpZo4N0A
         YDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pH+dFL7dSS05A0t4Ra0NluTyTZw6F8KQqawmeG8hNcA=;
        fh=/8TYP0AG957NSExKqyZMwN21KvHZGgsgZoyCaZow2r0=;
        b=J1B61qv/hp/kQPvZbfBnez6bchPXEZL/VJgs7jR40lJ/kyErsi9JBYyPrS5FqbJT0U
         y67ECg/BY78xR2A7aEICiKRMJbA74kPnCbsLeIIWmFLOiZQMv6bdLuL+UWhT1R3PIi/p
         BxTZFhaQ8DIVFumKk3pAt6m4EX8o/Mr1bVYerfSJI/wYpCrnYSpA7wF49XAXNTnwWg4i
         scxAFEFgbfKVQjy/sjyVXK8DN4Z5eIumHVXc6uQLjm5msu9YG9AjuwSU0DBaRrsvSVJR
         4TD00qs3k3OHklRIcil3vXJ2lglESWuCUyDUCXo6oLnW1za66w5RWidxI2bLqRw5Mczx
         A7og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750410; x=1788355210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pH+dFL7dSS05A0t4Ra0NluTyTZw6F8KQqawmeG8hNcA=;
        b=T27VMRxDp6KHlcAVyfHlF+VJ6Qj/4bMbdXy3tNzLP089HcmxUEN2k2k77q79sJFc89
         bAvMw3bj5sSc+j+rVfh6wakexdvTo1+ysxcXiGPoeNX4mRbcXsewsKaqH/IA95HtlM4a
         VPsEd06cCv5BXBzmLpZ1da+y+lBhyZYWn9QX9w3R2P2KeHQlEArp6BaDK3PLXeKiO2pM
         uCxfj7JS0pI9HKNh45bU3PxvocNqHA47gj2qZ9AxTchMPKanTToiDjbvfQsAe16bq7h8
         HIsjLmyApQIsUrqR+HLzAg1dFJQf1mcUsl2Y5C61lyV99Sm53oAlnLpekkW/JUP9DddK
         0F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750410; x=1788355210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pH+dFL7dSS05A0t4Ra0NluTyTZw6F8KQqawmeG8hNcA=;
        b=JIItn+W+bbpiw7atxvk9DaTQSuLRG1fvUtLmdVNrb4KGP0Ev21ve2jG+cZ3yLeTdm8
         cnAYCyKjJP5ICwII1OOcLnFpk87LA3HE9QcHlkLhv9tmNyRV842r1TaFtlrNvIxTEkm8
         UGhmo9FIgJrtNotlWefP37NyEGTOtF9w8Wh2W2V2FMHEan8UQaZJSDoJYqglki0+Oryo
         P5lcw4BhvCvGTDEJPq36GCNZkD/deJKutjdys0d1VL1YaC9Y59xuj1+Pyrt0g4UtfF0l
         tJY3NpTxzrPpQtdJi0DhBztleE8CKvPePnIKsXGw/srWijqeVOZIR4uffzZEUBXGR5A7
         /XPA==
X-Forwarded-Encrypted: i=1; AHgh+RqMPCdXf0/sTGn1MLkxlgKu8DT7uGFSstFenC0Qeh4uXQNtANbCRKAPUoT9XT+Ug6Fp6USijIgpyqqWhO8=@vger.kernel.org
X-Gm-Message-State: AFuF++lKW7d7bCl2ZO8YKDIwfn8q/J7dCZxdnyQKqBnK1OmT52EUtpdW
	bUgXZZ5Jz2teBftRs3pFwi5t+nG5OS8KXsygSVVIuuRUd1NNkdJLsfTrDe/xcr0WmK5A8yeH2jR
	3Ir80vQlYYut4HcHMEAaZvaLVAf2MxyU=
X-Gm-Gg: AR+sD10LUDrIIB6Xp7ossdAqLCD5zeC3xRto/8rYn0R71WbB1YzKm94rWV1QLsbTavy
	IXAHDF6UQfLkwUWdsx0MqShqhWbG3OYR2lvmYzlZjxtnRyYVt3AEAqAQ0V8Ds86SmTi2AoZ01JQ
	ByEeLEUjfuVakLL4D7RTGGZyV5NNhXgQGEQBwUXIZMoKz5lziJ6b6n/WGD+u8o4FT7yMWeIw9hl
	KXO36PI34D3eVcaHUwuglI8TMyAKpyIUZ7NQ+ZIhm5lRWG0Pn9GJbDV6/l7Wdj2SLtsvu7kxD66
	4oyeHb2mXvJgsUSF/x+tGwshTkVTZyjQN7dYim0kFktYS/yYI1ZLGiI+YgxumWiJnM/wDfFHA2W
	xr+/LpLaZB5ng7JvCU3bcbF2F6nFikv6us7GJIrUJXAxhFEJNa60XCmpoCWZHyQyyarCQX0z+
X-Received: by 2002:a05:651c:31c4:b0:3a1:8dd6:aaf9 with SMTP id
 38308e7fff4ca-3a1fd65bda3mr15964281fa.8.1787750409060; Wed, 26 Aug 2026
 06:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826070004.8100-1-sarunkod@amd.com> <20260826070004.8100-2-sarunkod@amd.com>
 <e32c1437-44ab-45d9-9534-124a9e09f029@intel.com>
In-Reply-To: <e32c1437-44ab-45d9-9534-124a9e09f029@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 26 Aug 2026 15:19:57 +0200
X-Gm-Features: AcwNN1WbGq5_aFrBjMF8bc11mRGfw3k1WkpRjRJRN2DetDqB2igsmNpygDTr4cc
Message-ID: <CAFULd4YFphkN4M0a_gC=vxN8Xgh4WWBGPo8dO-o6A3v9RGX4_g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] x86/uaccess: Extend CMPXCHG user helpers to
 128-bit operands
To: Dave Hansen <dave.hansen@intel.com>
Cc: Sairaj Kodilkar <sarunkod@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, vasant.hegde@amd.com, 
	suravee.suthikulpanit@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 2:30=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 8/26/26 00:00, Sairaj Kodilkar wrote:
> > Extend the existing user CMPXCHG helpers to support 16-byte operands on
> > x86-64, using LOCK_PREFIX "cmpxchg16b".  This mirrors the existing
> > __try_cmpxchg64_user_asm() / cmpxchg8b path provided for 32-bit kernels=
,
> > where KVM needs an atomic compare-exchange wider than the generic
> > cmpxchg helper can provide.
>
> Please take a good look at the Sashiko review:
>
> https://sashiko.dev/#/patchset/20260826070004.8100-2-sarunkod%40amd.com
>
> It looks like the "A" constraint isn't one that you can cleanly mirror
> from cmpxchg8b =3D> cmpxchg16b.

Actually, "+A" will work for 64bit targets, as long as the variable is
128-bit. The comment in asm.h applies to 64-bit values, where on
32-bit targets they fit in eax *and* edx, while on 64-bit targets, the
64-bit values fit into rax *or* rdx.

This is documented in GCC documentation:

     =E2=80=98A=E2=80=99
          The =E2=80=98a=E2=80=99 and =E2=80=98d=E2=80=99 registers.  This =
class is used for
          instructions that return double word results in the =E2=80=98ax:d=
x=E2=80=99
          register pair.  Single word values will be allocated either in
          =E2=80=98ax=E2=80=99 or =E2=80=98dx=E2=80=99.

And can be confirmed with e.g.:

__int128 val;

void foo (void)
{
  __int128 _v =3D val;
  asm volatile ("" : "+A" (_v));
  val =3D _v;
}

which will fail compilation with -ffixed-rax or -ffixed-rdx.

That said, the approach with union of two 64-bit halves can lead to
slightly better code, because the compiler splits the value earlier in
the compilation pipeline.

> Uros, any chance you can give these a good once-over? This seems to be
> just the kind of thing you've been fixing up lately. It would be nice to
> get them right the first time.

Based on the above explanation, these *can* be copied from 32-bit asm
patterns. Even "q" constraint will include all integer registers on
64-bit targets.

Uros.
