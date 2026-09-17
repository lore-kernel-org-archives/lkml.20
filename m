Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E59F598C16
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655472; cv=pass; b=T37+FpC0mw0jH7Bp94vVOpbJLut2QXdo8hKqU7QeoeCwGc+AYmnEBRndVCriIocYlLobTcOyvPTT9Xwy+0tz7XNdfb0CoIdZv4qVz5DlHdhCGggab+FjRcBRtRJmym+kduVXJgBhO8+ulGM+qPyK2MQft2RmSizSPnjYb8SF9ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655472; c=relaxed/simple;
	bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhkwAbiSN8CFMZUHXPCmWFifxBM8+/ARavhRiXyWCpJC5HCUmkLVdV1nsCxppIPy+SQp8HZc1yluLd3EpMhoCBD+Y/itfzBJGriRwZ346APBypWAoyvyVya6AUOglRdAOnnVjbBzQRvsDlUEuTcbctkElGARyi6zgsNr5Jt4tt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKjnxFbJ; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKjnxFbJ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530e8c6fb80so82811cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655470; cv=none;
        d=google.com; s=arc-20260327;
        b=Ce0LVNYmWYW8O/k8kNg9PWJT3zoNmV49BlVHr/h+n1a4MkeeSe5wbVAKJhGAMu9c48
         v0+73mzqj/jBmJqSWCTSf6MKvfqUAb/NKL/lS+9V2HQFAPSX4xPZcsAkzEOQHYu46qSW
         u4Dx45M6DLe3GdgROxwBGfX2Zqul5NdWfi4Ac559Yze8rKzHGt4lEZQfvF9V5pLVNnmB
         NUhOEviAsUG7dWRsUNE+C4XkxUq71aB7GZ1WoFEJ0ndeV3CALUxUCQKwVKT8WD9lOcBf
         xX2V6XN0EI0fhtffSjFgGFdzcVTtdB3v532ky0ttKn9yeyO8yo0LzSvJ2DGArHVd9Ltc
         qESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
        fh=vj8gFai3C7dkNri26E3urdMM0gtnIfVooOjB6fmDhfg=;
        b=gApzpgbIiCxS7k64zLwYhNlmqR9FwPWtUYTBnQxRUJllluxL2m9dmDUsJe/lKJzBCw
         eD+k9IxGfQNkYdOEsRJ5G4EydUV9RjLQAE6p7dzQtaofiis7IkYsF2fE9CwvoF8hY2f9
         qoCPb9TCas5D+CSJ1G/HIR8x87TVL7hyrZqdL8PPiWlgCEnpgZQXIYar2ln2BlsZDf8D
         9KEcYV+LdVDNQFk0DAleOFvrZLbJ/dVHZKJHC/IE4+vE6DD8zcOFTK4dQrAyEgQ/QdqB
         VjxLT0K8HDkyKHn2HEbPuDqrELWYc7X6scFeUhKVuArL4N8aWmtvjpkezI4jZj/mXncC
         ZGGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789655470; x=1790260270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
        b=rKjnxFbJS2MhhAPcVRGEkOhipASSkLDPVfKni9GP3WTRKdID4oW/hSEZJQInOik6n0
         dB0Pcxcg1GURjGNYveby8cmzlXk6l4YjiI6Konl5/RWffjsGFKr/Bq7yNfxY6SWcLhyk
         NSwlhmUEmq68asAOMmHxv9POrKyX66zUZ4PJvkR5Fojgmu4sB0XQiidKf9B7lf/wYEkq
         3KkjmjjpKXf42sPP5CgfbN1oFB/nshGdrohA712pons/jWHrNoOro/14wgfh0Q38TZiK
         BQxMOkAcy8C1s0u5MoGoUepb79lcU4ZBtcNl+Gy707RVnJH6MIkRHq3vLfcxSOnK3Hi1
         kX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655470; x=1790260270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3oZRD9yG/RjtC4yF5B0bl+SmXgC13bgt8t7IT2/g5Y=;
        b=1inQaUws6wZ4RRRMair04W5o/98dJHDVyaop1OmVE9GTfN+iASrFcTJxU0bM/o7jrj
         aHzgeZBH5vUonJslb0vgkrdEVZyEKp9i1LLhAU92fdxqX/t+J42qW7X7f+qUQ5pL+V4M
         H2Niggkl4SfAPFQePzzogtMQN2N9Wn/q4nu20vKprR7DLer1Qlh7QR/D/xtfi4CVkbvh
         Q+2FFr0sIwcKrHcLszpA0IKSEFxnyhD3bBww62aCEH5EGQydWko1DujRI3OWViaVAq7/
         hlrVD9Fxudd9uSHem/E8qrO1skaJTQJjw6HpZ28BE4kAnCoySYgtdUW1PqudARl5ErIf
         DbKw==
X-Forwarded-Encrypted: i=1; AKwUvBxjDsgGmh2FP901SbRzUR42kaIE9dmZxqL1wRGKcCAgDwonEPuYadaIJm/IGxm/wmlB9TPFoajXkcZPc14=@vger.kernel.org
X-Gm-Message-State: AFuF++nAz4iAOroqRSCKywLGwx1tFezYrF9PmM7/Hh1HCVeL2mkDx3NM
	F0tP5jHO52EryTZ1AZx+6U8YazFp7HnTyGMmYxrngi5odDQgWNAiJq8kNRWIF3fjIa5oHPqO7qu
	1E1WQsSJHUtZ3eGhIGSZqWtsv11cvUNq6y0beyuT2
X-Gm-Gg: AYBFou06JfHSiWCyz5QSEbaOSuIOYzuNQRmhDqbi+9qS1/9c0N/mOhbaSHWPNYWISOb
	plNJKv02uDRRG5d8m+XJm6pQ04lkVQaYeVpU2I3g7WhNecYwIYYczvMA/LkBZeTIWk8LxUR9c7D
	hG7QzJRmlFnK1M33NUipUoXvMAJJxmb3cKQ+5wx+VtacJLeiBojsl+gantk1XsuNRPhqf1JGhak
	uX3mHXXB4u77GSI0IFPqH7UOqMXiIEtmzhD9H/MZx9T0C10pI0CZJbbfQ4pPfUDJLGOt5g0Z+Xk
	RWeZpwoMa9pj25O4EMOELIpmr/eGe4VjlzNd6zJcF10ypSNxK2YyCmHcq2rSET5mQUo=
X-Received: by 2002:a05:622a:400c:b0:531:129b:2dba with SMTP id
 d75a77b69052e-532998b798dmr3895331cf.3.1789655469226; Thu, 17 Sep 2026
 07:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net>
 <016ecb3a3187b20fac299f1c2cb15aac01358412.1789281096.git.zhang_wei@open-hieco.net>
 <CALMp9eSnoFAk5PN-JudLc=xB6jzKzERfTVPEeAaRbLTYqtnKKA@mail.gmail.com> <cd63935b-8239-4caf-8e97-0896ab7743f1@open-hieco.net>
In-Reply-To: <cd63935b-8239-4caf-8e97-0896ab7743f1@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 17 Sep 2026 07:30:53 -0700
X-Gm-Features: AcwNN1XpKe-CB8PQDcy6cyaywdtMnfN_H56Nu0Oy7JZUSLelJ_9kw_Ni3fDLoxE
Message-ID: <CALMp9eRGvU_zXO1FWAj9o3dECpUaK4qOCOVwenPZ0nQ9+Yk2yA@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] KVM: selftests: Add nested SVM DecodeAssists test
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 1:22=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
>
>
> On 9/15/2026 6:33 AM, Jim Mattson wrote:
> > Should this be:
> >
> > .exit_info_1 =3D BIT_ULL(63),
> > .exit_info_1_mask =3D ~0ULL,
>
> Did you mean .exit_info_1 =3D 0? For CLTS, bit 63 should be clear.
>
> I tested CLTS without FEP on an EPYC 9754 and captured EXITINFO1 at
> the L0 kvm_exit tracepoint, before reflection to L1. It was zero in
> all cases, with CR0.TS both clear and set. Each case followed a
> MOV-from-CR4 exit that populated EXITINFO1 with 0x800000000000000a.
>
> The current mask checks only that bit 63 is clear. Would you prefer
> checking the entire field against zero?
>
> I'm a little unsure how to interpret the APM here: =E2=80=9CIf the instru=
ction
> is LMSW or CLTS, no additional information is provided and bit 63 is
> not set.=E2=80=9D Does =E2=80=9Cno additional information=E2=80=9D mean t=
he remaining bits
> must be zero, or simply that they contain no valid decode information
> and should be ignored?

I stand corrected, and I agree with your interpretation of the APM.
The original code is fine.
