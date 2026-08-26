Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177F3AD513
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773870; cv=none; b=tNfXZE+cRjusbjVClMk0NR3LXvSJNUdfaYBFnw3Ypljh+qD6w6h2ExzP8A/W6zfnNKHL143Yb+BNrkkMIz4LDIoNrDtBzbQ/rjkvFKvk0kqV1oGGyC7bgGRSr5rM50/qs8dKOlaTep/AnC7BpWVEb8372OWYs7odj87NUYMKYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773870; c=relaxed/simple;
	bh=M+TpnqIzx9YzVakWndAoYkuS3Ivh0lBQkdoao0Agnh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etqmGmEXCM/kJenB4S2sap99VfKIUh8p5xkAWt0LwJQMcNB9ogHcyqRE7v1I5P2Yo/Mf2XOuZkA4bdq7oxmTAfrvSmDZ7wZ8zC9hbzH2a0aLiK2c1ZbuU1ZKtJg78Ucm6ljj8l93ZQpvyn/2ntOujLZAAdbSb2I0fCWeBs0iCJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15cd3fd760so160922966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787773864; x=1788378664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ffOGWLkNU0B5wefleM0f4kOcS8WHnfV6s3VJ7x4ll4=;
        b=ERjrvOqT7aY+L5ry7juhZWFBtP/O0C8OzRv4Zsg64qoGzJ9YPORchtDH/evyWvh7FJ
         5omAOG1Qq6Yy8GsvwbXyNLRmEWmY/KQcwBPT+7l2OP80Nz9E53vTEXuHiCGrY2GJxXE8
         Y5rC7LLKTiZ87yXUqRbIVCscw0cGbJEgayuwvwpL5YprvFZlQ/ss+t1tzxuMjT2YUQFI
         rWH2NepW7ZvIHLA8eHu7z30uShjddg/tqkrTLuVxpYAvhYWDyGYwbDCqnWWQuGnC5gdE
         5bTF6iby69TtshUQ+k/vaV1YsvKCj2XGYXvA1SssQ/05OfDLProW1oJK8IffURH693sI
         yr8w==
X-Forwarded-Encrypted: i=1; AHgh+RqRlkHU+KIVzkm17CM3eSiNs7f4j1hs9v6F92CqMCJ8RixnVWJDk2ncYJIqC+9FIt05Tq1equgVtn+rWKU=@vger.kernel.org
X-Gm-Message-State: AFuF++m3vUew6puVg+zH0+PyC3Pjc2pg9tPOilQpYRnQ/8yUVRuYGYmo
	/44cI1v4+9zfwqDY/skPnnJwtnN9/4prqhCd57vOPg5LZWFJFnfGLqIT+bVXWmYo3vc=
X-Gm-Gg: AR+sD139wp9zlyZ4u9xe4T5TkhoT1Zk93fx6ELmSVbrDDG2P2riqzjt1+N7UkfLr40d
	/F4FcelTx1Qhx3EUzF2Vv+wyK6wKaXWCY/8eVYfaZLel3gD3w7Da/7SfAuUy2dLwnbF+5A24+De
	gIr5ra4dzsVFohkGD+q3v8S30zEl4Khm1N9cGY6puk10KTaEygqLip7+jOvllvsIkJTxsmR6S4H
	+KpX1GKCTHGcXii7wc+TYAJKnTEL54/7zJc+UlW1yr3feR+/f/v6cgrYoSNRW5h4bAxsQqkCJUG
	EY8QmO7MRnBUn9LGQSgylP5FWEfRXayndq73oXmA7P3LcuW1PH/DZOKtnjTLs4L8KEGEGzbAdsX
	VqnI+PPuC/odbcs+A9U4eFc4zEmhlqJFHrjrPlhrVocNBpKjmsdiodi7Fsv0A9mRuUxSBx1kvzE
	eX3+rJGB2FStOkBG6sl0RUojdkzL6kA5WHgbuz/S8KE6eRzKk2Oywm0snkTABJhtmPB1m9AXevl
	AL9+CHBghFTsJ4Gsqk=
X-Received: by 2002:a17:907:1888:b0:c20:23fb:bb05 with SMTP id a640c23a62f3a-c250c3089dbmr1317270066b.15.1787773863839;
        Wed, 26 Aug 2026 12:51:03 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43absm639069166b.51.2026.08.26.12.51.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:51:03 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1677c91969so155919466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpcUGseAe+kjM4dAfemy9/AAurpO+gVg/9dgd1oJqpuv2WiHt2cPRoq0GjqW0wpoS1++Q8JUNu5ebk1jHM=@vger.kernel.org
X-Received: by 2002:a17:906:9fce:b0:c1f:1520:4de5 with SMTP id
 a640c23a62f3a-c250bb50762mr1103314466b.1.1787773863104; Wed, 26 Aug 2026
 12:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOs+rJW1QymCXkr8-mU4kwMFvznnC98CXVvZMRjqpXwjJutdtA@mail.gmail.com>
 <20260815114533.2171445-1-fabrice.derepas@canonical.com>
In-Reply-To: <20260815114533.2171445-1-fabrice.derepas@canonical.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Wed, 26 Aug 2026 20:50:49 +0100
X-Gmail-Original-Message-ID: <CAOs+rJVggeq-Y4hysPRtpV0pQRBU8cZTm-iyQ4EpHM6-6eapkA@mail.gmail.com>
X-Gm-Features: AcwNN1W5DIcNWEcvlctI_OYJ194qPghIiHh-JbFunx3timWYfG5krkQObSF_4k4
Message-ID: <CAOs+rJVggeq-Y4hysPRtpV0pQRBU8cZTm-iyQ4EpHM6-6eapkA@mail.gmail.com>
Subject: Re: [PATCH v2] crypto: asymmetric_keys - bound PE section ranges in pefile_parse_binary
To: Fabrice Derepas <fabrice.derepas@canonical.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for delay on this,

On Sat, Aug 15, 2026 at 12:45=E2=80=AFPM Fabrice Derepas
<fabrice.derepas@canonical.com> wrote:
>
> On Fri, Aug 14, 2026 at 11:29 PM Ignat Korchagin <ignat@linux.win> wrote:
> > > Tested under KASAN (CONFIG_KASAN_GENERIC, x86-64) with a KUnit case t=
hat
> > > calls verify_pefile_signature() on real images: a signed-then-tampere=
d
> >
> > Same as your other patch - any reason not to include this KUnit case?
>
> The reason I am not including my tests is that I use real signed EFI
> binaries (a valid one and a tampered one), ~88 KB each via xxd -i, which =
is
> a lot of binary to carry in-tree. For upstream I'll write a self-containe=
d
> case that constructs a minimal PE in the test itself and asserts that
> pefile_parse_binary() rejects an out-of-range section, so there are no
> embedded blobs. I'll send it as a second patch in a v3 series, so the fix
> is not gated on the test.
>
> > > +       for (loop =3D 0; loop < ctx->n_sections; loop++)
> >
> > Looking at the code again: seems ctx->n_sections is user-controlled.
> > What happens if it is 0?
>
> For this loop, nothing: n_sections is unsigned, so "loop < 0" is false on
> the first test and the body never runs -- no chkaddr() call and no
> ctx->secs[] dereference. So the patch itself adds no hazard for
> n_sections =3D=3D 0.
>
> But you have pointed at a real pre-existing problem one step further on.
> n_sections =3D=3D 0 is not rejected anywhere -- pefile_parse_binary() onl=
y
> bounds it from above, against header_size -- and pefile_digest_pe_content=
s()
> then does:
>
>         canon =3D kcalloc(ctx->n_sections, sizeof(unsigned), GFP_KERNEL);
>         if (!canon)
>                 return -ENOMEM;
>         ...
>         canon[0] =3D 0;
>
> kcalloc(0, ...) returns ZERO_SIZE_PTR, which is non-NULL, so the !canon
> check passes and the unconditional "canon[0] =3D 0" writes through
> ZERO_SIZE_PTR. Because the digest runs only after verify_pkcs7_signature(=
)
> succeeds, this has the same reachability as the read this patch fixes: a
> validly signed image with n_sections tampered to 0 (the PKCS#7 is
> unaffected) reaches it via kexec_file_load().
>
> I confirmed it under KASAN. With a trusted key embedded, a signed image
> whose NumberOfSections I set to 0 (leaving the certificate table untouche=
d,
> so verify_pkcs7_signature() still returns 0) faults in the digest step,
> while the untampered image verifies:
>
>   control (trusted, 7 sections): verify_pefile_signature() =3D 0
>   BUG: kernel NULL pointer dereference, address: 0000000000000010
>   #PF: supervisor write access in kernel mode
>   Oops: 0002 [#1] SMP KASAN NOPTI
>   RIP: 0010:verify_pefile_signature+0x5c3   (pefile_digest_pe_contents in=
lined)
>
> Address 0x10 is ZERO_SIZE_PTR and error_code 0x2 is a write -- the
> canon[0] =3D 0 store -- so it is a write fault, reachable the same way as=
 the
> out-of-bounds read this patch already addresses.
>
> Since we are now centralising section-table sanity in pefile_parse_binary=
(),
> the natural fix is to reject n_sections =3D=3D 0 there as well, e.g. by f=
olding
> it into the existing bound:
>
>         if (ctx->n_sections =3D=3D 0 ||
>             ctx->n_sections > (ctx->header_size - cursor) / sizeof(*sec))
>                 return -ELIBBAD;
>
> A PE with zero sections is malformed (a signed kernel/EFI image always ha=
s
> at least one), so rejecting it at parse is safe and closes the
> ZERO_SIZE_PTR write too. I will include that in v3 and cover it in the KU=
nit
> case.
>
> Do you prefer it folded into this patch, or kept as a separate fix for th=
e

Let's fold into this patch, since it is one place now.

> canon[0] write? Either way I will respin as v3 with the KUnit case once y=
ou
> let me know.

Thank you.

>
> Thanks for the careful review, Ignat.
>
> Fabrice
>
