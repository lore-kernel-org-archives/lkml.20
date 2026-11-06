Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924540;
	b=mCeNnoAWVebkeO4LhLsj0M+hY+MtKsBVBTAfn29yRy1kdbuD8ORjsI7Owczq7oFipcZd
	 TC1y0G9gLiE3NPe2UdWrArFIH18G3Vz6C1bm6R/ML1lpp2pn1C08d+Mbdrstsl1vO/sKQ
	 6ZFmJi1SL2dCZpvhYb63EZAt4SSqbmIdlRnMipV6hfWwINHF75ssVTHej3VVqcaMrWvc7
	 J1e84uomwqPna4G1mwlANhEiw8OiNy88nWAoYUmC21aLxCpmnshBKpMMpEbf8rr9UFcoa
	 HGBjHWJnam80W5Ck3L+pHttpP+O1pT6t3F7BDzYAyThWP4G/Qygl0CrManFBOndWzAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JfNHbrnn32jFAe3Oz75ROYK+aCQk7wj/Jc6nPtqsyuM=;
	b=23LsWWraTWLLRJRgGI4olN5m+hPBP8rWQ3mGcOkX+Xx6ME46UtDfWFDYEknolzGWsic4
	 lxLc4URfqgteLLmFSL3oUO4SyVRpe5iYSdrHh9lQXoDMGevWw9MG38Eeg0FRsbVcx+Hb7
	 9FDe0Nz1GbbiF++9BTM2PwQrEYkqKlc16eI6uUzO2YCOT+39P1tZBx+WtTPsllAmZceAZ
	 pHVKXXyMznNmUtJ6iCnItsss/PxYhZvO2tfJRtEVmy5vcQWIoKgly2uWRl6nBBbhfxRoo
	 Bp6eUCR3rIn1zRgMzeJwMWKATuCWPMIBSAfwhIU1f/ouG9mSm8UP8tE41kZC6lzD04A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B7ZAEf1w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA21606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B7ZAEf1w
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso269a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924538; cv=none;
        d=google.com; s=arc-20260327;
        b=jzLD3V/fPqonGYeeS2cXWWURU/GX7V/Hc1O2kqv84njW8/G0CM/Fk7XaRXELgPiRbe
         6YKM2Oqy6NUToYZctJYrACSeF4UxeNgzPLaa9nFgyJnAgsLr7QaaIcE1v5jzYJD6Haqb
         6H9O3iqsrScBxnp6kahvWfzVYTzEHySpeiebUTo0icQry/M3VW2twiETsy/jwMvwpFY3
         vKQw3FIfVsxM/3ljuYJ9kW34XY9XdcQCUrSU/dRRS0OStLter6v2+u14ta3L8/Q3GvKa
         Ybv5LQFCCyCjX/5nFt24ICJEdT/NRe6AVEhMdQYekZXC5aDFgTAcLUX7Dmtvif3loLTL
         8zSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JfNHbrnn32jFAe3Oz75ROYK+aCQk7wj/Jc6nPtqsyuM=;
        fh=38qAxY8OJAcKG8JZTHkZm0zJh+av0c7VgUuQUVultsc=;
        b=UIoa4OQhG37IbQKf4zh5ZEiuxDvToKn7BvCmm9VHlvv+6MkxS0pdFc/a078Tn2EFs1
         LAKkUERNH26H15lSQUAxypffVsIERX9Eaxxgsu75Yb+GMlHVev1CHvZqs+h9nZMsVBBK
         SGgQuiGObqpf9zdRvr+z/hTPfCdL9MpwGQe6tD96EP+FqKbbYWfbDIkw7YXHkiFaj0hD
         QCct2kuPuW9dQJ1emTstclU7lK+HPf7TSG55BFVrxzJuXdOMlDOAoRGjzKS62AMU3o9r
         ZiMWPOc+4YCv3P/sdd6/lJX3Cbr/al2c6R4luHIFDULGtb0+olEBVm8/+NU5CxW0DXv6
         Viqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924538; x=1794529338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JfNHbrnn32jFAe3Oz75ROYK+aCQk7wj/Jc6nPtqsyuM=;
        b=B7ZAEf1wMN3v+L3N2LfPkVfzzdhAA0lwNtmod1/0GV84MDTB4T9DCNMzsZDZSr4i9l
         /Ks8p3gjfqox+Mfa0L9Zcv+t64JPQ6RVF7UhShUFRe34X/cg6+mpWU4vZER/U05lRCdQ
         WfiHL8ANzx+0/Vk7jFEFg+RaMmzxGTYvMGb45GPoJqbCWfg7CFhGTQ8k84qNG5+2s9A3
         3LvxDHlLw9hMzRYIqm3frUP0Jw6oaASAkHwk1CMz0jpmY65UZQ8KljCQ/oFpMH3J444e
         FrwTtGmVo+K5vsQ7QLJ6hGwSXBjA/55CG29Ea6l9uYX7lGmgLn1JLK6oCON3ZRRxk/Mq
         52Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924538; x=1794529338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfNHbrnn32jFAe3Oz75ROYK+aCQk7wj/Jc6nPtqsyuM=;
        b=qvk7iJfvPHTRt7MC7eog4w7XZBOB4UZWYlYyvyiptoL2MnohiKCCPhsRU+rIM4s0n8
         46sFbzKfzSWoDt62vwDmMIe9/jsOevXDsTi1Mp04HKiStN2pszr0sh3wH3mMPpyJWay/
         3Bs5VopQC/2sbfk7A+9lF0NzlxfH9MBpx5lXReByksZVWCg9I/rWxEiW2HRbvMCwHcNP
         ugoo5/qRzcg0/NgMnxCrpC99Pw+y4lLMe4prml2qAc2oT9SqRKgVmE7/MIJGvuZ5npSo
         D4ug9ilrlkoTVvIs4DN1Q1V3d5+q1DhIpj2wUvUExZ4i8ZR8+/+KxwQ0mg2+LTEEF2Re
         U1QA==
X-Forwarded-Encrypted: i=1; AKwUvBzXhmw45dn3LxiQdTF5JQdZOxBaRDqxLwrdG6cpwIp9jGI+H6g8skVXNMVK68wA80VY5h192kCv9/zFARk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gOvjKkpMdOPAB9Mjt184BRgTOJUJsWSDT42NW3MHRfk088+FQ
	Jx5R2EGRhbPkWtECt7L5itvTXsTZhVB3YPQVn0brMWSASst8SeFoz1C1CzVh1ltWGGlMISbuR7j
	nnru3+w0BHlLKtBCzuggCb6OhkRhdjfr0DQd9FG6f6FPVZL3cSG6eOpuMICk=
X-Gm-Gg: AYBFou3I7q6sr9cQZ9ND9EJUKXL7+y4Br72I17tzsdkGa0szV013VVzJuYB6ir4SdjR
	cF0Fdqa18h1Km0naZdLt9W6NNKCgWhmqcp783hgdp4pM2zwmWQnu8Hh8T2sB00LkqKq0aHmxHBf
	Lg/78b0IdVHK+P1bX31vAwprwjxpfI0IGoLJYTS5+IH5/gvypFN0lXu3N15nQBS+K895onKooWa
	aiGHJ5QdAVvnWDbHNWvG9EiFgAt34JiXH1Sb863fqGN1tnIV/fFxVD6QCk7eAIE8jAP4IEMzqnA
	E+CUY6IFy5V3RNScJWeQlAcxz0WT7Y5BUIKnCIyC3AsFe4MXzXccPnxBq5rUtcwuJuE2OE0ehYd
	OZ1BukZximPlF7AWoii6kbK15WlSoWXk1dluM/pwTNaHV6DY4GJnA2N6TexAbQ5cfr4e9I8dj9e
	634tx0nHKdq8czfuUGlSIHFdQu
X-Received: by 2002:aa7:d390:0:b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b5d53a0241mr21825a12.8.1793924537343; Thu, 05 Nov 2026
 16:22:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-8-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-8-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:22:05 -0800
X-Gm-Features: AclHuK9pYvtR473jSzvnw10DoDYkrQg9rQfkhGrTphbASWY3EEcXQLh_NL0D90w
Message-ID: <CALMp9eTtNO0vGayWE1tVw2fKZB+oDGJqbQ6VM2OOkkGbnt6waw@mail.gmail.com>
Subject: Re: [PATCH v8 07/20] KVM: VMX: Refactor register index retrieval from
 exit qualification
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:36=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Introduce a helper to extract the register index from the VMX exit
> qualification field.
>
> In addition to the VMX instruction information field, exit qualification
> also encodes a register index. This field will expand into the previously
> reserved bit for extended register IDs. This refactoring will simplify
> the extended register handling without code duplication.
>
> No functional change intended.
>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
