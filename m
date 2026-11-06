Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793926401;
	b=LliXOytGFqzjmhCi0TrvBsjP9Q6sRNRmuhaJC7PxItQNYdEq9JyfMQ3vU9gIkx/dmD/0
	 mCKXSjmvMyJthJms8uODrw3C9n2Dq20O7nE18f17EYxf7YYD+g2jJH4rh1daLGQBxxoPb
	 IVVuEuEbYijPnYNTqp8OA3ZG7hEOHvm7q9b/9PA0JatCLIl4obyuapB8cCLtmn9rOhtwr
	 ft/p5LLpDsTXBaLd2lkkI38nBsAcWSIJCe+th5qe7xrwxWFbNPBkpqgjI7vufbKOKi2Es
	 yU2Zb70wO8JKOJ8eNZpf9Hja6vjIdIQt4YSkx+lyd0KZPcXqR1/J8EUwQmUAjTwND+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z8p0bYiVFuNX4OfWuZZ4sxGIKahg/FfKszGkM4uD0Nw=;
	b=x37AD4QBvFtxiRShJVyEjcd0o/rGezXxmkQ99DH37TuuxnpBpshJiw4UkWrFbqJa75Eg
	 gRk7xrW9ZyW/nFF2VHWIaPzrG74j4RqROQSB7Iuw1LkKIMIXXu/v68VBig4vmltbGC5v3
	 th4hskndqhqfBWpraZJgpwXrVBmRFmHljAXM9ygaSFiVobSeqF85O+mqL0LjNLZ1S7moi
	 wPXrLjO2TDsHr5iOwiYJkoodAlSzf1LaCG+eQExysZexg+D/UPhd5Yj4y5W5EJMqp4rMg
	 T4f0Wjalr+sXMmrbCs6IjFbDhfio7mDbLtnSNuj1b91bIrLCTys9+elRtP2W2otYETw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GUqyc+PE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GUqyc+PE
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so311a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926400; cv=none;
        d=google.com; s=arc-20260327;
        b=HkqjZOb8XddE/YcQBhJMgslI/lHk6Ej1YFEsjcaTjQ2y/lv8cTy2brQ9PiWs+3LQYU
         HyZrelbL53q1k+wGETi8lhEf/ecRiAYGO9QYfGgWI95UUN7japl/U34Ry4TFxTHUtxxc
         oLTSS7OBu+anBPBX5KZHJG2qyvwPd0YyHBbmdVtMxW5KV7WlSq5sf/bvjuuqrUlGZMzi
         3UsnrzoF6lgnknHzmAem3dc2NVgu0ifKPGTSz1WUc4NySjFSV+8WQXXzEud89gUh0Eru
         pZHSmfZcbtbJM/7Yo7xR01V2sQMiVV/3LH1hCiF330na3t+DAMzSmDWaUWeOniaBWFdp
         UEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8p0bYiVFuNX4OfWuZZ4sxGIKahg/FfKszGkM4uD0Nw=;
        fh=7b2j26Pls4gyJ95POAUKxKQ1q1qS9eOYaIGHup0Dt9g=;
        b=sspUUkhdqsoOjHTMRcaET2LzMOOnVWiJaeO2oiliSnyFgVdJM5R5zUUIVwITzDNHFp
         DY/Z8Fd9SXG6Z8yXxj0LSHmaqrRHr+zsScdyqseSPaeO4XBwjzwieqkSs/ZvLny8wLdP
         9M9Rcv/2LhZS6/lyefOe1dRIA+nq+azwU6pnDEjCK+dBMpT1jR4Um255h0UkwlE95OtS
         SwRy/1o24tVQEajYq90pj+b+K7m7Ll+6H4Ir+l09Cn0JWKx08XFCsTYcylSZK4ADTWxy
         UOQ0HJQLAkjqzTC5T02OTQ63NR7bGdif+nqwlyFIhsQ2b6/9aRkaUpLjsbnSC30iyy8j
         65dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793926400; x=1794531200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8p0bYiVFuNX4OfWuZZ4sxGIKahg/FfKszGkM4uD0Nw=;
        b=GUqyc+PESPCRisgfCD13AQ7e7emdlghEExujUKLxIzHKpk7z8xfI355RoaQ98hWyFx
         3zBlPq0nR9JmXHRICZ1bnume/4epEI7ZVtuV/F1SO/xrRVZ+9BDYtYnQk8HQ2LVvpOoT
         r/BgrjpNJ5qItxjhpwcpk9HEzjBmEA7Gkl6a/Uxly3M3m0S+FjccWTituF0CYyEFArTs
         kTSMMjKymJHXUInedhlDjwvbGAn4dGFn1c1zRdXqldKyOcSqKarcJQtBwCeW46oprKo7
         Qpra3klJ8pd9WPVTdtl+wcwamc1Jat4kuD6yoGcFuc6ZQmOJadbDl2uHXpt6suIAe/+4
         FP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926400; x=1794531200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8p0bYiVFuNX4OfWuZZ4sxGIKahg/FfKszGkM4uD0Nw=;
        b=x8Snf1nF5rKZajItu1SfJmjBi7PB3ZGLG/U11AxyIHvgav0ku2xjC2hR0f3ihxVVVR
         Nw91qQLTVVOwWkJB2YbDVyxO23Ja16k9IrM2v/tnGQ1DRbDYF3vtTLrESvE+5BzyZIYx
         2BEZZsbZCQR26xrjhWUWDOgGTdw9GU+1OZECMpilHk8e5LltLB75uctgTsK9CMQAQ6SX
         uDPT0PCU4Bxtq8tq3Xx8CwgkJ4ZBPQu40BabavUWB8fUSHBEjOtsWRJnGM5Xiraqb+ea
         j2BCtSfGTbx74qfVbZJKNYlO0n/eV+caoH2MOf/ZxLTfMiFkW4CRpoVf4osJG0RXnekh
         HSgg==
X-Forwarded-Encrypted: i=1; AKwUvBz/1wnw3wzkQ0etLoBdteGvgXK12s8Cf6a58Gu5Xjtub5L2m5QdudvnldlQ1+DK5jCtBXzS4XU6inXkVNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dd4bx+3KTzX11/awL/3lAOgb/GMgOAo+oQMgrKUfmyaTzqizv
	K66SVxkWZbFEyoNlOQwxwmTlNOg97ma4dXWucdPosvgHxekjmrxgLSpLwp76x5TlGxyhbFtygwA
	K5nzVHShlzELB5I0JFJVj5dYVZjfy2Krm7hwCm5AbRKKiPFz4OACVqJWTO8A=
X-Gm-Gg: AYBFou2TdjEaY20NVFEmBV/kMQRlO6NKXayTLbZBFHaNTRRNaVH9aKYpKli/dUKryIT
	EzYINj9alanL6JOGdKiQcV6LTYLMbECOOenzr9n5SsR6zc4oJEUt+RT3Ee5t0fU08cPKkPz73xL
	9Kog0drSbTduwJzyhwFN09U4lMv9KuMSYABCsa6AGyujem8hcm+p2hCyecISB9cAMpgpje6gQF4
	G4OHW60xm800lVfSCKjKuRSw4ag8OKcRHQZiOVsC9tXYdh9FjwJ2NIOLKtfaiw8wWOHVx5ukXm+
	aAMzG8yXl5U60q0M+vb/uGs1Utqn5h8JmeeMNtJlKFRCRSgPLIP56YsCZMSvEtdcXnMZxgeTq43
	cDaugY3ihyH41Aa9eepibq9Z5YfRN4JGVkxM6gDT5TnXwMyfQZXtCRb8gFNFd24whN1ynXxRuKX
	78b0hbfGmSEFPdd3USimqgG/5ogsat0FXGjDb98d+h45wiPA==
X-Received: by 2002:aa7:d44c:0:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b5d53d5c2fmr27678a12.14.1793926399217; Thu, 05 Nov 2026
 16:53:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-10-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-10-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:53:07 -0800
X-Gm-Features: AclHuK_SEF5elS3aU0BqmAvaeLUrXA4HaQU5I3YL53_AQiNGQtbuBTA-Tt14aoU
Message-ID: <CALMp9eQ2TbHZ1xzsDq+TfFTfaJf5wHMk9g1fM0aWRhJsE=sgOQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/20] KVM: nVMX: Propagate extended instruction information
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com, 
	Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:37=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Define the new extended_instruction_info field in struct vmcs12 and
> propagate it to nested VMX. Gate the propagation on the guest APX
> enumeration, which aligns with bare metal behavior. Thus, define the
> CPUID bit here too.
>
> Suggested-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/aRvOSnaUt1E+%2FpkC@intel.com
> ---

[ ... ]

> diff --git a/arch/x86/kvm/vmx/vmcs12.c b/arch/x86/kvm/vmx/vmcs12.c
> index 1ebe67c384ad..267aa64f005e 100644
> --- a/arch/x86/kvm/vmx/vmcs12.c
> +++ b/arch/x86/kvm/vmx/vmcs12.c
> @@ -53,6 +53,7 @@ static const u16 kvm_supported_vmcs12_field_offsets[] _=
_initconst =3D {
>         FIELD64(XSS_EXIT_BITMAP, xss_exit_bitmap),
>         FIELD64(ENCLS_EXITING_BITMAP, encls_exiting_bitmap),
>         FIELD64(GUEST_PHYSICAL_ADDRESS, guest_physical_address),
> +       FIELD64(EXTENDED_INSTRUCTION_INFO, extended_instruction_info),

You need to add a case for VMCS12_CASE64(EXTENDED_INSTRUCTION_INFO) to
cpu_has_vmcs12_field().
