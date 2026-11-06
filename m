Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793943390;
	b=Er/4AoKsbtdR7961FPYgVl/XAPVO+2Jc8WNAdtr1SGhn2kzSz0lbuNsb12D2oqLkmrYP
	 v2e9mxvbbdY/gc2f9f/H2QDzxkVk5NsuE+gFCGR/x41IO6QTxVmetcmv8CWzzqBSQzHwS
	 cPNx5Epm1dkYkWoaLx1oN7MKBznDxTjtAVTRrhQG7upd8PA8xM0n25op+PS5SLLTFdmuR
	 sRTOOr2eOTh4i39w5ZgLnECuyqc6RiHK/1GuSoHE3iRM/bDqB2Z7D33MwuZarZbgnefjt
	 hrYpcyG2DDZuuwpfjMnXdd1Wa8smRT5rTOfnuyktbRjqw5/oZP6R16SZElNhRO4/a1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B2Xl0qwQ+HJfglChvJoCcSDLAUODoscudE1S8AAqSn4=;
	b=X7kNm3NUNOJfiq5xYYRag8dXpjM1KNmde9VUAd/Vv6j1SyV3Br8lwnzFwECr8Ec0C83Q
	 EfLdAzOyaXxTK/b0yWRVUIoue+rRXePhm98aemeJjX9TK/8gL4oUoi4z24z1cGdeR83ai
	 ydbKHhv9R2b81P7dPQcd8QkCYoPnG4rBN02lmAQqFyKWoKZF+xGeYvlz0wrwfhORKGdZa
	 aX8xa8DcQOlLtpAsNWsKcn2WXUf8FPulc7HLr8NQoWLMd4tXBP8Ljg96gq38u3Kacj9Qy
	 i9Xw1hJMqSQs3wql03heQro2jvMEzZJo6g75qnS10IevAqGZMV3MxsJEfas9pL6vd0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kqvc0MGF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D1606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875D1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kqvc0MGF
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso2114a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793943388; cv=none;
        d=google.com; s=arc-20260327;
        b=e+PawVXVCB0yfUj4MfHDKNTKf39Si5RDBIOsmvQTpYlm/FRoISXqkWqym+u40oigrz
         /wckgVZ7qy0HyKxK67AlptnsAjJK24J+U+H/9SjjMFoP/ACdeuVR3Bjq5J5/oagXTiBJ
         ZvxH8bO8eoTWMzb0gVfnR0lWfbSFfSiHJgwOzSa5/ipMpWLyqG4xjjhHcdvtmFCI8ONZ
         Pvb0ea3tBvYSfMMUWSUyucNSR7NkkaJPXmk4sr3jevxs1se9PVeKW1BfpBZAB+2Rv9uh
         s3HJ6I/MOZWepor4MVTltad4rWmVED05nJt7U0hs/QsrkB2kaC2iZ9yviF2vEi3QGi4y
         JUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B2Xl0qwQ+HJfglChvJoCcSDLAUODoscudE1S8AAqSn4=;
        fh=AsCKxXA/CsEsZZPdV6AXAR2EL7L3ln9+lsJs/1/Fw9Q=;
        b=aRPEppTfY1Mti9xFJqhsHiVI8P+3U7TqS6xK+klyo3SWX3I4BgmCwfKZxv7cJCT6dq
         4T3ABMdhvDnW88yT+Cud6GeWRdAqCLu622sJoghJwHGzG5l87QV9roeyG08ZKZInFVWj
         kU3iNjhWiUFu472J5uygLY6N9Q8H5/p+NR8xiKe+34vQGsN+z7jwdiSGJHAFbrPbeuoU
         HL0MrTSrUCAqRfg0EElMu+uwaMeFtY2LWnhGeN2iZ7UGpfPPcbgfpc5YCkSHMBjKY//t
         Tz6WQLJXBNSI3wYoBAtdN4OJCcP4LtSsV/KRvugYn5ktsALUzU2qXFeb4nm1mD8AzOao
         hj3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793943388; x=1794548188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2Xl0qwQ+HJfglChvJoCcSDLAUODoscudE1S8AAqSn4=;
        b=kqvc0MGFoFpVAj+E54Nk2wxEX1xKRGFhtJ1kqE+iQUCRYFBJVPbEPQcH5i37IpUoDo
         vvwRCgA5RBv0wj2ya2+54CI3AefoA6N5RDa2AZNfcnmqQ8az51q9O8gaTKERYn/2hqLG
         psPa6nPXukpRZ+1XnHiMy1/sx5BCC9C6zuOH2VLutLh/hChcXyAnfUZoJa/moBp/H35d
         kpQW9srpcGo/qRx+l3+6aLN9FMznGb2xvKDS8jla9OLhGT8L728EY/QRu3dsNXNiWlT+
         R0Zh67aamAJQVXhIIOA8+n/H8TWWbmhNn1y9JuifWBbgEencJM0SUs5wnFbixJ5Gae9W
         WESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943388; x=1794548188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2Xl0qwQ+HJfglChvJoCcSDLAUODoscudE1S8AAqSn4=;
        b=zGbAp5Jsz8GYwJimX2lGUzaOAllpDa0nISMoYvmqjHo/U+sQWKYOc67lCjx3YQp4pN
         4nzR/LmogXP72IrrDxc9EIFljmPQ35Zylp0/BK8uK4W3H5kas8e/7G6YgCuQ/+YRRZ3G
         rE4Qp+3Gc++nqMqXwBFJB3XfAIKdocBvgZnY43JQjB6ERjly7EUsUoJQ4ET0DfpQiEme
         osh9HCc4LZOJEKdcbBwzp+YhpU6omny4HQkZwGQKyjHKfsYbJSLoWATSXQ7KFwZrzKi2
         RGtJgc5bozfknGMTxlIjtm1O5FpKHvqHs4+sLckuLi42HB3QXUyh3YnI1ls2U9XBFGOz
         vpzg==
X-Forwarded-Encrypted: i=1; AKwUvBwH6IITA5mmWnEezCtnQ6SAlUOawTpyebbR/FkcpBkhSDZmN/PSPFKqFu30MdZGW2sQOU5bem/xQb/mJBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GXzn441E6h6HXyqqrS8xVNcJcCKf/Z/tViXqyTvv+ZEXmJ6od
	UAAZCAsRa9MvbRcWdLtwAUd4Vwfx1yT9YSUPXuNpQaQL3vS+O47ybykFPJzAtNjFFHQiPCnkov4
	I9XqvY/BeRjmyAUxKwxAm1Tvc4eOKoZPt8UmvbNJB
X-Gm-Gg: AYBFou0IOK2JlKemP5zxYZz8999BuC2eyjZECj+Vk7cHc6AOBthglOGlhGhNXFKRRvw
	ehxKuYTkHT+khAYEUS+UgpPgjVM7btqbom4Tq/a/WttRKQn8EZxQpe2DlKKXGdSHvef6nsHv4qo
	VzL2JEdVRAYfFMwipZSt0jGJpdpbiX2XJHPdtI7EuHnlqh8gzYPkJrx924lV63Fm4rhQg4Zs0Jo
	4Zz5CVrsPp4nmw8fCnmieZBtOVsg19rH+X+xXS3MEf5mDKWnt1rw/T3/3N1YuOPyPpO7l0VedRF
	BSUITjef2Td+cL1TmnaovT/NB+tTxFbVQk/iOL/iw7NRQV6tWzY61SAk1VyT7ZLbi9OYn2K+pM7
	+CuujEHi8o/m9EY1YWa+k5y3ur9yAl67gufeurCwxJyR9N5m+aCuWlAbSaWs6jKnNiz5SMtna6v
	N2/DU2b6S+LGCg+7MJH6Ff5++a
X-Received: by 2002:a05:6402:1009:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b6e69f57c5mr9919a12.5.1793943387501; Thu, 05 Nov 2026 21:36:27
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-21-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-21-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:36:14 -0800
X-Gm-Features: AclHuK_U_9mpuiaWVuz8w3auJHuo9V9ud-NFm1xYXZaSVUoexqCjtHTFbrrgiRQ
Message-ID: <CALMp9eRT-R18RT2iJLitYNYrqLn=qVFDdt1DYWHQbu20ks2Daw@mail.gmail.com>
Subject: Re: [PATCH v8 20/20] KVM: x86: selftests: Add APX state handling and
 XCR0 sanity checks
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:40=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Now that KVM exposes the APX feature to guests, extend some existing
> selftests to validate XCR0 configuration and state management.
>
> Since APX repurposes the XSAVE area previously used by MPX in the
> non-compacted format, add a check to ensure that MPX state is not set
> when APX is enabled.
>
> Also, load non-init APX state data in the guest so that XSTATE_BV[APX] is
> set, allowing validation of APX state testing.
>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
>  tools/testing/selftests/kvm/x86/state_test.c  |  3 +++
>  .../selftests/kvm/x86/xcr0_cpuid_test.c       | 19 +++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/state_test.c b/tools/testing=
/selftests/kvm/x86/state_test.c
> index 4a1056a6cb8d..9727dbb2b981 100644
> --- a/tools/testing/selftests/kvm/x86/state_test.c
> +++ b/tools/testing/selftests/kvm/x86/state_test.c
> @@ -164,6 +164,9 @@ static void __attribute__((__flatten__)) guest_code(v=
oid *arg)
>                         asm volatile ("vmovupd %0, %%zmm16" :: "m" (buffe=
r));
>                 }
>
> +               if (supported_xcr0 & XFEATURE_MASK_APX)
> +                       write_egpr(16, 0xcccccccc);
> +

Nit: to match MPX and PKU below:

        if (this_cpu_has(X86_FEATURE_APX)) {
            GUEST_ASSERT(supported_xcr0 & XFEATURE_MASK_APX);
            write_egpr(16, 0xcccccccc);
        }

[ ... ]

> +#define ASSERT_XFEATURE_CONFLICT(supported_xcr0, xfeatures, conflicts)  =
               \
> +do {                                                                    =
               \
> +       uint64_t __supported =3D (supported_xcr0) & ((xfeatures) | (confl=
icts));          \

Nit: u64

Reviewed-by: Jim Mattson <jmattson@google.com>
