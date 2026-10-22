Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792686873;
	b=CCyg1GXwpJl3n1QVu+PLbdm+0L772oByzw1d8s9XILrPA/dHJybBvzjyOXpLMN28p7dG
	 EaJ3k6uho6nzpdpwxwMvqcoBXppJPM4fMcpizOguRVkvRkuSLaLywxlojd/dZqMuC/5Jr
	 IPWa4Ko17wFd27LA+k9rG+i8EgQJJ2Eg5MNF1FRkaGUf+HO3tyfdt1ogT1POeflTCh7R5
	 crxS1rtPk8c9eEwSnugNPA16dK0FLESPoRM0Cq8fUuGKW0v5eFCBjJUVHeK+SLjXYfISf
	 eQw1PRIZvuIVaCDRKZ5mP5tLLoD7prf64dAHAJwJua3TAfU7Ok6Evd8viE6aQHq0EFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
	b=KIIdIej3LL1e+a8F96BmAGNnbghqQS+8xChxTYsk+RylgIZPzlzCXfERY58Lq5Gyx+9o
	 8nXWuxi5Gdx9qhRsLlE792nC99SBUml5x36/xmKIEHTar/XDe/HYVCsEIqkxO9M1QERgy
	 0GO8eLOVM4WoE2KH0zr2YgEj7hVtDRTc5ED4hCDP9+SHfqA+ERkL4QX16nfI6U/SAdrTZ
	 jlxKObUgMLCi0s5nWAv7vqKg0r3M75yeIi4e6maoVDtI2JtMEuaeAIV2Vgouz5EimS9h0
	 NXbFFmlJOnJqhJoqX/Zjiuj00hnvcezx5SLdoJ9PIjhJTAjS3bn0TSvJRrcOMO0bUUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PZng0QPq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F5C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PZng0QPq
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so4587939a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792686871; cv=none;
        d=google.com; s=arc-20260327;
        b=a4HGiTrdFuHz6XYpfWperl1scWYeS2CezSLAb+W3r4O5NkHnfLTGekSg0i0ruyPkTE
         pV1JWxvcOH4kAtLPriwlbgjaXPVxA3/LZ8ydzc692kBUhuNm+b4jBFLeO7/5tsblkFqZ
         poRSt/6Q/+bn4bMsAp+PUTolL63adZXp+GAv+Ykw0S/Byjd+QXdau+24OU1wv8vG3fJI
         CfzcIFG1Wzof51Jgwsb5QpSopEVvplT0P629Rc49oIHSq9N3/KDIwe1YTk4iOkx4e4W1
         pYQfllGvzUjzaZQ9SLzw2n26WbsMnf6Re1L3DE3XVa/dkfJ+CHPfgtegc/KDBphrwyQ/
         Rp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
        fh=1mSbe/Az/9jbQSOnMZFu7FEuSn/wiu0KQjGtUPF3N0U=;
        b=UareEIhycbO5bg1o5NIFko7lnyOq9ylTOOCh176EIEiYGZXEsIjDABNa2eQZFjjMbu
         3M4HE6iN/KxprcQvplYcL4C8Fpad7pco3t3+FwrQXnTML5Pv8/aLiK7Q481kDeR9eL1K
         B3QAcG0FdTZz/V02RAqdAQHn3TCxi/JJYpbAxCd+0ATUbjQ12iBXJxYMJWYsraPU55CU
         +j3psIWEFiNB2khRqgQFc5nmhX260FLnGYINORPwMb7Va9ao6+sID5tMCbheLD2fjhoG
         lFYMtA03AZ71fZi8dk2PD/B3Asy019WcvQ7wmxvgEn6Ti5lWVDU/uJOlQiOC8cc+5xYF
         GgWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792686871; x=1793291671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
        b=PZng0QPqnkPtt42LAfKVBRavC2IhEv5q9gK9vz0hM4RHNUKOd1Z4E/+UnW1dFtDIgj
         oH8nk9TzVQKQXKQiOC7J0KhqN1VeoX0yzD7cGOEg9cVfVhkss8D3H61XifTitynoFc/v
         BTMiu27aMFrpkc2uKtjF88GrWc/GKL55QFfn3zvKe0JuRopaiif0JgxKrmKrXlerAjCh
         vBYOGSW0FaswNMuYAMDdlLJ24kjttb+m0JVuCOFog80ZejKTpx9YIMMG3vsVWzUOBAsk
         RN0pooI9g3mRd6wY6klKUv4QZ5TNH/RNbCCxs8JMbdSJCVXnBejKeF1DYvx8tecfqcvh
         J2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686871; x=1793291671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdgvyfyGLF6xVqvT4lRhkOaHE+7q7+9ylmI+jmCxxss=;
        b=Oxp8p1n8d/vwUzVt7zVYhhubH/9oxYKzWR132v+oi2oyoWffaB70L505Dk08JZBFCX
         A15fX73LHMDYHwIdYrAD6dRvzVA6bnVUs/zUyuVjYMCoKUd3N17Kmkph3c0UKaAlV4kl
         G7429CsZ7blmHolDqVxWoxw01Z8qC6Ma8Asn5WoSuvlm/9eU8G22CLfIOKF2Ue4dgkWa
         Qe8vuHyf+xECr1PjcEmfgRaWLD5O4b1HBdMozjxS8uJczP5o/ZG/ZtIrGwKhn5XC8SAP
         g8ASDohEtPn18T1+QS4cncSu2+oMu5uacTc3yL5bpTzjJ4jdh/FAkw1F0rOnr8a+H//n
         kpng==
X-Forwarded-Encrypted: i=1; AKwUvBw+SkkBRXNuIp5urVoOFF0acUiP+2eZGmzWxXsIoJff+2OHies3Ql6+ydULQDMzyhlLulfZALnfPOvA8GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuLPwKq2wvTsYd/Rf7+sX34Fz23RzXJbRdz/RcWrUFUzttypO4
	bx+93JQA4HiRA2Tw24te0okVOaUg3Qm/4Zuy2hhnM+yA5OJSImIknf8EG1VECuu5vmDr7yu/YJ9
	nY2gU6aZcJHYjUiy7Rh/XL7nXFfibhwg9cur45TwuBQ==
X-Gm-Gg: AYBFou3795MxCc5ql5dAuxWuJFnist3FpKNW0AKhff+aeL4/7fVVy26s9b9t/NH8pzZ
	YJ0lkIz21YcS75awqqGc+CQrS6NURGfYETwL5qSq7AmkGY84u9OmLIKdPYretpDA/FOehHdImiY
	3B9zk9xUGtxrR5t4DIK9Z65+sKnZKoSgGsHDfexdWKFAfm8WaHPQu/8+AsaV9i4wNuHc/fyasn/
	emfuov/j5qeRZKevEWavGwtIKV/IBynEgyEvUShLcAOmXNXsSD1X9QscFZLP1u4XnXkXADQjaTE
	NZFtaea+90p8x8eIdYNOIJ8xYE03F+8IQydBQcFmAkh0OLubut69k2h4dVzdHs8+X6ubSFyoT1A
	3w1caj7e8QNxnS072LLncmlnvH2z9oVZoxsWg/4v3F9b+Re1GAHBU91blO6yiLPCGVByf
X-Received: by 2002:a05:6402:21c3:b0:6ac:8dce:5a8a with SMTP id
 4fb4d7f45d1cf-6b408e97bc7mr4806912a12.9.1792686871349; Thu, 22 Oct 2026
 09:34:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015020313.946940-1-pasha.tatashin@soleen.com> <87y0bp20pn.fsf@trenco.lwn.net>
In-Reply-To: <87y0bp20pn.fsf@trenco.lwn.net>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Oct 2026 12:33:53 -0400
X-Gm-Features: AclHuK8Otm0xJpYhkHmHhBvYvdF9NjZJWWHbtCPr-MhhnCbHqDLRJoujsYa2diA
Message-ID: <CA+CK2bCj9mSc5xu0B3QtxgRd=P1fo910pO_fx6f5o_Wu2YDTbw@mail.gmail.com>
Subject: Re: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct members
To: Jonathan Corbet <corbet@lwn.net>
Cc: rppt@kernel.org, tudor.ambarus@linaro.org, mchehab+huawei@kernel.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, aleksandr.loktionov@intel.com, 
	kexec@lists.infradead.org, pratyush@kernel.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:51=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Pasha Tatashin <pasha.tatashin@soleen.com> writes:
>
> > KHO ABI structures declare their preservation pointers with
> > DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
> > and its physical address. kernel-doc does not know the macro and does
> > not see the member: it warns that an unnamed member is not described
> > and that the description of the member is excess.
> >
> > Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
> > for DECLARE_KFIFO_PTR().
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  tools/lib/python/kdoc/xforms_lists.py | 1 +
> >  1 file changed, 1 insertion(+)
>
> Applied, thanks.

Thanks!

>
> One note... these:
>
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
> > prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
> > prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
> > prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
> > prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
> > prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8
>
> ...make b4 go off on a wild goose chase and caused the application to
> fail.  They aren't prerequisites at all, I'm curious about how they came
> to be here?

Sorry about that. I had this patch as part of a larger tree with a
bunch of dependent branches, and I generated it with "--base=3Dv7.3-rc1"
without first rebasing the patch onto v7.3-rc1.

Pasha

>
> Thanks,
>
> jon
