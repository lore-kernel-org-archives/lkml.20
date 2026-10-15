Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C316F30D3FE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101524; cv=pass; b=Qor9kjm7na+QF6IYSrGbylgWr4qzLpAf50rkcYvVNT7mlPvKqluu+5iTepnSi5hDWiXLWOh8IprJg5a/blRAzyGodUqQawF9O7pc9NmypNZNrFxf1+KiNlUU1Izz3VmeSwOn+4KEM1R1DFxB/ms3M+UYMH92DNKu+PztH+em38w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101524; c=relaxed/simple;
	bh=4lfsCC/pIXgqCBYAycCDNBM8TUqqtrJavSIaFKbNshw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLpapMCjR6YUOPhMsDFqIZ20pH6Gbcx20gxp9826LZ2q/FZ2Z3+MfnDrjzyRpfCUB3nCVUAtgStl5NqguX0aQl5Y4PHlgx2IquskUxD4j0pzmt/E3tjn8XH7v/XJA6vWPh5KLeXuqOGJIySuiYP2g8qOovOBzh5SWwyT4n+Fb5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fh1ySglX; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fh1ySglX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1633a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792101521; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6N67Ya7OaN4wRO2w+gCBSjxUd33wV/Pqb26jOuCGtk5kOHlx6YuvN2oS2ZE7zXcMy
         MkbQZjQ0dPqwN797/6qj7XAqVAeVhHn4AtShrZAzCmdC6ans5MLIU3CEdvYGvIs+pHmH
         LWvYyehKi/lSd/j7HnFJBBKOjn35rttZ4JDYDoxBtvODuCtxCJPhPr+GAV3/Ksv/A6yW
         W2xjJDpq9xlghRWylkPH8KKRt1RgouBYydag0viRr9381RRRETJIaHa4BnuwRVDwX3Bj
         pbWzyCyRH2QYREzhpx1goWAu/SNiCd1Q6A+WTl/NRHkdG0qJagvY4gEkjcAXAfly7xse
         /3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lfsCC/pIXgqCBYAycCDNBM8TUqqtrJavSIaFKbNshw=;
        fh=dzUm6EfUHEglG7V4AgjPH9mCqEY+J4GuLsqEA1aL5eM=;
        b=gCRB5zwqw21vkxzoD9421g97fCH+eksG5l+LS1L/b9+BoX2rOan1heaZXYRJEwFDpV
         FOpKiE2lqaASMF8G0wN+uo9/IDiktl0ocZqYsMkbl+ac3mbkOUYe457ONhWoulzPz+7V
         noM5X8kZGdU514SKGhbANn6hHBp77GBzCUCcCPTVaRtLNMwW219EoXhdqhe6oAQ+Mj+w
         i829yMhkFbrl+vZ2fxckthR9zqsDEqaqUFnX2tyX95YGUFcmHoq9Cyf/yZxVd3xRGW+m
         1Zz1qOdIFGGHlN2h2DEwRhyEygdP2sn+1c44XsnOA0aU+P5McWPz2azPxPaKdo3UekX/
         PU5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792101521; x=1792706321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lfsCC/pIXgqCBYAycCDNBM8TUqqtrJavSIaFKbNshw=;
        b=Fh1ySglXl8hMK+ZtAwv2GwFacihlvCZzeVODdxh0ae4RT6sZCFc2x7FSaVakU2Q3ky
         KpR/QQGSCOub5djaEp2K3rxqWLzjB3KTW7+6J5j/fLQqsj/Bg+KMv25FYRFH3+kl0xmg
         5wijkuOChAjBt67/nk19zkeIglqRY2p2KL9QD4G2yD2JPFl0xJUAFn9eM/ktEKhxNtQb
         ENfV9s9OWVAq5SGDLb11x45SKD2OQmwtmk3fv6iCJhf3AZwQ90EWsZNgMh8w4l2yU6eY
         UBpDQOrd0NI2H9uorMiBbZSp6Bu+Qxha3Rg2RMZ304cKy/Mxj3zCsKIj/jfetfjnC5OQ
         yAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101521; x=1792706321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lfsCC/pIXgqCBYAycCDNBM8TUqqtrJavSIaFKbNshw=;
        b=KlWwOwczQs7JSR36MoC5Go/JbxqA5P7fNivPAWldF00MeNlfdeWRU2ILOM3a9VZPsg
         wWEc3mZocyJMJ9Iz1sfpTQrdNvehwHkBqVXdUWism9tMYxqCMqyz0HD7BJSASvAtrz6J
         X2d5jJZudfSvKt8XfBptsNeXi55Hplw3RImMkI4cxgRj0fjNgfPcmqX0Db5mxf9ewm3W
         XvioU8ehuleFcZZ/j8JY2ozw5Lybw/BOazp6Nr3TBptmV1yfyjhQ5oOwH1aBLENgTR7G
         ummTHv6Hdo6IInU+TCfuoaTAJJ3CzWeYufVa8Gg1uS59VtpL8DClp6V8QfJH5PAstvfN
         vMvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx+XB9VP49Whh/WztOT/4Orm7OdggMfy51YmkIbDM//pU9/Nb9zhDBOjFJOj/4WY1FS7BHXTR33jg+Fk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd96JZv/sHcPR1sdWb/RwM0KdvjlYvjuG0emDW1vR0NjXWwBvY
	cUNc8OpTpd4i1mt3ZZgDGAuc6uSMFyAkoYotFqME9tIjJ/hTq8yysw3jniIVK4bSOytxzIC7Mhe
	V0PfhSgwm+BfS6xdfXuvpMhPf/T8HTA4SsuxXrHhY
X-Gm-Gg: AYBFou2sP7WTGyMx7PhcKCZ2Zg3kWUhoTr/WIOSZ+/7eXQDT8ysus7QVlKyQPcz3BtA
	Ig2S/nnUNfwhGy5e8RB6oOTV250PIwojgtcfJixgJRPWthx6ArDIefPlkxCoH0khn9NFMv5ivyd
	n5vMrAMjZlH8aVJtVZuwQ1b1+aJqXjhuWFPPEgoNnhTsS+cQNwXTP9YlO/ixynwmTz0rZMVATGL
	KTVFFV8hBpvr5vIKVLL2d+Kl9tykK5h/Zw3UehbeiWxKHLv5KQOnYMPj91lyFDQY6v3s9NvSED3
	96hyIqecR4EjYgNqLW5GWS8ZkPqFXQJLcETweHzMfjBQ/QQMlRZ7CJY=
X-Received: by 2002:a05:6402:208e:10b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b375fddc3fmr77708a12.14.1792101520578; Thu, 15 Oct 2026
 14:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-15-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-15-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 14:58:26 -0700
X-Gm-Features: AclHuK9CxP6GbqbW9U7W79mpoa0Y4WMcsiBdKJF8JhPFOD_gck3RCkNZ1mCmaGU
Message-ID: <CALMp9eRLJcnUEwct80x5moBvomgxvLL8eiabx6=YXoHxLKsaRQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/27] KVM: x86: hyper-v: Rename kvm_hv_vcpu_purge_flush_tlb()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Rename kvm_hv_vcpu_purge_flush_tlb() to kvm_hv_purge_tlb_flush_fifo() to
> clarify that it purges the TLB flush FIFO, not purge *and* flush the
> TLB.
>
> No functional change intended.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
