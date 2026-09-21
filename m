Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF14E4EF126
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014627; cv=pass; b=N6cT8pvaqT5vM5ytoYYLce9teNFEI7pfivGnn0U0Zy8lPO13N7E+iwXayldZQFHp0BJ/XxrfEvpRpD48yaaYj8c4XXp25wbNKkr3neT4PAkv53/a8d3kRILYaHN/6AggEbPoXvQelydB5xpdFkOosE2y1sjjXCuLUrpDnqLaAvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014627; c=relaxed/simple;
	bh=i8TfSstM+nFUfHowVBq661f9yHcafviHx7y2Zv6Y+6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYWHv/5nIsuWFziWdQxSkLWrV1o80538tpJTI4LMf9qOZv7oEvpc2SiQKXg1dC3cjj76K+ThoDYc1SgCCtNDqwz2CtP7c6GdaS97vEtIetNyLd0NIWS/bwUIuT3Dba8O5LBVcXZR1WHGjdsVvCI+XbefheGPRkzA8QkTeAD2bHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PoU1ScwZ; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoU1ScwZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so1381a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014623; cv=none;
        d=google.com; s=arc-20260327;
        b=USoGPKOxH6xiBigR+PBKS4HIgBdMTNn3XWnLTpXzr1lSq3LWrQxuOAiOc52CydaoAe
         2VgrtHHYC58I27Jnr4BiXdgi/JMKJMZS8urYG1pfgRCEknOHsecm0fslMP8QNYaqcZR/
         VrcjWY+CPUlKWW1iJ7Z14tZwTVB4AcpLMsuAYIvXzg7I9Ni1HPfxyVagMdWGVcUHbEHO
         wyigvsZidUHBIGxzWEUHfWsRRIJg12tUJ0oakZaRptcxy0taFiMX9x4iRvG2Ad7zF7NH
         KykPP/qsb8xk1RLSYQ9VxHEIsS2z54LkBPTdy9hzaRkKDoTpOTFhp6nQ1vkAD6xzCyKt
         b6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhkO8C1Km+Np1GICbpHNNLqCS950Qr/leZl7SKXOzk4=;
        fh=6mP3xYwm4IospoxJVAMpOF0aUldNbqprvz+OLCTafn8=;
        b=DZ01rPciWwJ4YIcN+Ii2g545h8v/IZAkMJKz1IeP9KsDwYCwYgK4ImQegxTZQQfDo3
         tmem0E74fpoCIACFPbopLE4rXYapLQ58xiZFyF55buUNdhvjxgmbkgEFh2TVKRFEbth3
         fS2FrxojPn+tQf64mcUTVHtQmB0ZHYF8S0GTwX1jVK9D0MnJZEuAIRVVl3B00GWOp2/+
         RXBJnVK9buIsz0pMfLGF1iJ/495P1zTmpQMNZZAvk9KYIXQMic99aWAmQybIjVaVyF8N
         2jqXVxpP7vRrmOlM/8Mt696HbEJuf+aWM9MlV+wGXIta8q7yd7yvLAOpfFfwEcW0gsBQ
         PW8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790014623; x=1790619423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhkO8C1Km+Np1GICbpHNNLqCS950Qr/leZl7SKXOzk4=;
        b=PoU1ScwZgzL7jxiwcYQR1YwcCf00EZDV1nmorhMZmMe0AcPJWuCfVa6pz1H4VlPqhQ
         XwTA8pWKMSZ6HdU9WXVgwiYnGVzSBMI3ghSKyL+l1TdQ+EuHhxUQpbq09BbDuAuMeLxT
         738Mr016C06w28DX208uWdJ5tId6ouwUEiigEuYsNIkKue7lF/X2Arm5jPtnvOz5m4Ly
         zaWVY0dhpPQFsXPlDquTwZozbgLOjl8hF20gIdGmIl5OWnJYGP1wQ3wDS9g2EEr5ee2J
         YNLGL+jP0bXUeuiAQ9KXggX6c8iTp/NCXk39b/B550GH93zalDaT7JCP7LtuMGwa1XNH
         ME6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014623; x=1790619423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhkO8C1Km+Np1GICbpHNNLqCS950Qr/leZl7SKXOzk4=;
        b=orBz/IAT4hBoDq5AMSjJ53Zj2fXio70cdggU05sCwNYE7Y7Rs5Nfp5S+LCh48Vrn+z
         uKCBD2DEi8595Y6wNUccbWR+6ifn0/xw6cItOO28kmiekiDWnQLbI5+bL1IscSWXO4Zt
         8mIRrXZX+VsJbgkebpnug/GuxKEO8FHIupwp3+zKaci5miFG7o6Mv5F2WCk5OGh/JGOY
         2h6T2o5R/515vnAOmvEczyHMhz+asuOB+hhI3TytOHlJtBputCDgQFJfnqlHNWKz0YmO
         PdhvB6HQn+PNsTW/e2qZD6U4eOWBHo7RbfB8MLVSti9A3yD2lTARaXScUparO83nCDFL
         qXvg==
X-Forwarded-Encrypted: i=1; AKwUvBwNp9AMRuTOYG8ySfI0H21E5qa3R0N8PdYMcaqvTB0pTcTox7dO0QUtPiufNuFjZopK5+I2+0vtuCjLvUU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWvEnMvPj2j48s7BBIjDMdEk/Flc4GvhuWw8z0Jau5zHIvBTfi
	XNXxdWW1hEjl9O8PdHbdAAUsUUyD3HCbRC2fQLtoWcwRVu4yA3wHeOeTunzKeESLF1Hj3RjzrQT
	QOHA+ZIZ6sVROCMZd7Iat+C4dFI9k6odf3UZqb8Y=
X-Gm-Gg: AYBFou3of4xzK9p5FFdZVzsJbix5DClK5bfKDHLDs2Oe1/ZXMlAzX9NMg0PIgAf2AYR
	zmLVSLt2Mj6KTOcIozYi+dS4w/WyCifnw1Wn2Z2jheKEFPEER/AUZvDHWd4JCY8EKLLWMBAP262
	SJpFxy6D0NirVRBFhjGEMfyO17nhibACBnDjHEzDk9mZbYoNp+XANwodv/BdMjWGuc57Xe4glpR
	m4FMUscVFD27nSSx35JWQB5UgFZtkbxo+u7NmlCRxlm9BEcXZsq7Doam4TllozteXhMR3Clf0L+
	ooqb+W/h+LLNK2zwjtoKRy0yjg53urMBWBWZbqSpPomwM6m6AqdogHMhBPf4KVWH4w5s8XrEtIZ
	AGa/+T0DbhpBeq/FyMBCAVg==
X-Received: by 2002:a05:6402:1042:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6aaa0b62266mr3710a12.9.1790014622395; Mon, 21 Sep 2026 11:17:02
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com>
 <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com> <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
 <aqrhFvwFJsQTaEkz@google.com>
In-Reply-To: <aqrhFvwFJsQTaEkz@google.com>
From: Jacky Li <jackyli@google.com>
Date: Mon, 21 Sep 2026 11:16:49 -0700
X-Gm-Features: AcwNN1WyjYSX1uzNk8-9L0xtWomFK3mRNzacv9CeIaSJ0csFTNXZn02hHr10_0g
Message-ID: <CAJxe5csCb0DHZmJo9a-asXZ-tYdcyK1y0Y4Y9Uoixqn=sa8zRQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:34=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> The problem is, I don't see how the guest can know when it needs to disca=
rd the
> VMPCK (post-request failures) versus when the VMPCK is still "fine" (pre-=
request
> errors).
>
> FWIW, I'm not terribly concerned about bleeding host issues into the gues=
t, I'm
> more concerned about ending up with deferred fatalities and a mess of an =
"ABI"
> between the guest and KVM with respect to handling failures.
>
> What if we "tickle" the resp_gpa before doing the request?  Similar to ho=
w CPUs
> probe bytes early in XSAVE/XRSTOR to avoid having to unwind later on.  In=
 this
> case, the response is restricted to a single page, so we only need to tic=
kle a
> single byte.  E.g.
>

Agree. I see your points and why this tickle idea is a great solution.
Actually, building on that idea, what do you think about using
kvm_vcpu_map() in the exact place that you did
kvm_write_guest(kvm, resp_gpa, &tickle, sizeof(tickle)) instead (and
unmapping afterwards)? A few reasons:

1. Like kvm_write_guest(), kvm_vcpu_map() also checks the existence and
   writability of the memslot via __gfn_to_hva_many(..., write=3Dtrue) and
   faults in the host page as writable, plus it pins the page across the
   firmware command.

2. kvm_vcpu_map() has cleaner semantics of acquiring and holding the
   guest response page in KVM until the response is delivered, rather
   than doing a dummy write to test the waters. This is somewhat
   consistent with the GHCB page itself, which stays mapped until the
   response is filled in.

3. Pinning the page prevents a malicious guest from converting resp_gpa
   to private between the pre-check and kvm_write_guest() after the
   guest_memfd in-place conversion patch series [1] is merged. (This
   assumes a future guest_memfd implementation, so it's less convincing
   than the first two points. This was also my original TOCTOU concern.
   And once we have either pre-check, on upstream today the guest has
   no way to change the memslot state before kvm_write_guest(), so I'll
   also drop the original TOCTOU commit message.)

[1] https://lore.kernel.org/lkml/20260830-gmem-inplace-conversion-v12-15-85=
e5fd25252a@google.com/
