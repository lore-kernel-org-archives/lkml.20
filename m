Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90237106E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107742; cv=pass; b=gizKgPu7Bp5E2rXWI6XLO4PXdmarFxNH9eprnQNnYp23uzLCyyLqjmlQZ1/YDB6Z55aciU0LQWcSd6s5VqHCmCxbP5YfiLoHcKGXHMRnIp9T4oJU7OciH5IYvDH3T4dhfvzpFxAgmJj+Ev18/+WaabIVjQNaojrei+QX7Y8F2z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107742; c=relaxed/simple;
	bh=qnYBvLu3wP+0deufjLD9NX37QLMFMQZ9+Pr7pKVdW5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcTIRa1Baf35z9ozhoX7ObOENBgU021u3HdyhdOltiRbUbapNkPK+Cfb2+upVQRoI3xdaX84ByJPsOcApusNNbqTJy2NRMyJU0cKz6RXkRP2bSDn5dryE69TjOjPcSWbm2kRRlffckkqoRPQspCvVCUnwDkg3jBqW+sYTnGEl3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hEBOcK5h; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hEBOcK5h"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2585a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792107739; cv=none;
        d=google.com; s=arc-20260327;
        b=Qkm9kRsmjfAHIE1tITOaI6t5G68xCpfP34V1o975mNAbMAnZS4q5U+co9wqtSb/cG3
         Cp8IDL409+PNodcqJOMznB8KB0GoznzeMS5MJEpHi6XUNLlbHKvQvFFQBCTjtMMMi9lE
         VvfORJEax+zv8NS8YppVQu9UkouTuf398BsoyFTXcdrXb59Bew/8pQn/Q1WrqT8XxSEI
         w6JOck7JhykhmDrDxhwWLKzYeTpavU7rkSq388qSaNm8jFy6QVh5DSo3j4vuhuXYN8ln
         Um8r/kusr9UJgR4Tt8bWRCkDIPjIr7lq+lUMTMjbaVzMUrsxFegVir/Oplh9q0XnJryK
         30ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnYBvLu3wP+0deufjLD9NX37QLMFMQZ9+Pr7pKVdW5g=;
        fh=obCCBGV3F64WmkR+mPoyQhL5gYe4BgP8Ibq1/e9bhtE=;
        b=K4M4EIy8DQP94X8irYbVfT1+nFTADOFrkqFklt9zghJV6ohHNoUQpP5n1W9S2Lydas
         utarWXHSmc+UZS5NBVNbXKufCs+EU6rVLfU+DX6mJaj4b9soZuSw1AxeZPxloZz6iWJ7
         XEUy+evxjeHdk8Xx+YbADRBC9aY4GYd2beXLTWj1r4UbmpAw9bKj6FylbHRE3YFuhbB0
         0JjUWoxqaDld9ujbWJpy186eggk25Mrlfehm4vfUFA1io/jhv8wFhVbZ7DwuKWJMoVXe
         iehZt3vhxcU/QDdIxrCsPrmtBHAnJB2EvShVzDhprjRqZqRit9pIcHIqAE8gGA7pxls3
         Ygkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792107739; x=1792712539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnYBvLu3wP+0deufjLD9NX37QLMFMQZ9+Pr7pKVdW5g=;
        b=hEBOcK5h+YyuWf6MFgtpAED/I0v0qKG/gwEAVyG8EWe3CIbyqsjyGmqZ78+A4tAAd0
         4cUtYTsnYOme9zkeXo79vdVtnLWcgj7ZXO2uKGsM8e9l+d6uu591vFNkwG5KdW/ys1aa
         DYtLwi2M5X2HLLZGZkWZeqDNMoTRMPI2aah7QdYQbenLtavr64Oyb7sjyGQX8/OW5SUD
         +kbTmCvIF+pymAezP7LBdBFj/KrOAsQ1FxHCv9QiMAKDjJV3xpMiR4gFY+mtrv9wMHtQ
         /0l51XDk4r+SjSEVhJRlE3FALN4zdgov+vkxtOD3R6uCERt/MyjuW/GgCqFIDMTAKJ5s
         qFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107739; x=1792712539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnYBvLu3wP+0deufjLD9NX37QLMFMQZ9+Pr7pKVdW5g=;
        b=vSfAMuZT+QBnJjJ/KXlOxUOeWh+k+2plvnxQcBXaYHBde6jQXUUFW6JbLa3txtVVKx
         zKaLqsmY9fQSyVZrMHLOMbEs6B1maijMXuud/+A0AebrMz+wtQWAfzEP455Q0xxLFCpF
         FOoXCVLey25Esc6m9ihd4MBSvxdzH4t2c64K42qmSAVFNj3R6+RH3dQUR9D0jx2I26Om
         32Pjt30mCwPWYPjCoBVCzHKRWteBcN7ot35vWlAHZSB/OXFQ8iskxrW2oy84wM4ydf/N
         +pvj4Uf6C1dQ00iRF+k7qMc/V0dBhswugziihk+0frYzNKJAO5nQHClwLSGdYTxk2T56
         mpqA==
X-Forwarded-Encrypted: i=1; AKwUvBzqLZ2P2VdUOg3GohQTTjCv9r+3urftEs2lX87kL5wrcNV0/BBINnhL9qtWWdDgeEvR2G5bJGKvlsFlgO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwoTEmzRQRLexNsSUeHEBcW1I5MCXLL9gZGVFre5S1CdlzaBtG
	ZOB7cj5z15A1QorI/RViyvnlcqOK5kgSc6lVyf4a1QgDL9ytNz2235en6mzaTA/tquMfKrRmUik
	pTmJ3WLn0yTi26neb467v+tBivcYHlFqxJS43OzLx
X-Gm-Gg: AYBFou2s/fyR38yPA2LV3oSA5P12Gh5RwkV818UT9DxxUTUUvXJJWNal5MfLS0EBUBS
	HBLiwXCaL+1gplyJspvvFmozPPnZD7vKe+9Mt2HcTut46FVKZU+SskRuaFkJh0tN6Fd+HuJvHLP
	eXZtDzGZGgonSo8mvFJ7GzjMtNjVG/TJxotXLpsPtBXHPflOpx1RvSPXrGGLZCyROMIcM6PesLY
	QJsGzN2K260o1g3avMBHNlR40xXEupi++zhfUONR7fzdLWMlxW3oe48Y61jjVI2sVdCcChul5hC
	Q2rRW2GzL3sjta9yytHtOrn9tNg0Wo5YvinS+7QZQpVbBCr1C6U5UFkJG0bXxGkQKoBYRvsscJp
	ReX190JZlVdx2SkFh7nceFsLyxK8odzP3no7h
X-Received: by 2002:aa7:c2c3:0:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b38c1d2c27mr13029a12.10.1792107738186; Thu, 15 Oct 2026
 16:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-26-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-26-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 16:42:05 -0700
X-Gm-Features: AclHuK8zmX5F0uZUL3_9yaYG8YILbTZauumuUb9eWsw9lpIUhMqrbcaBGQMe4t8
Message-ID: <CALMp9eQB_9UQ_qy8RNQUc16XhznasacBZxKQ-VNRrMOmyva49w@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] KVM: nSVM: Flush the ASID on nested transitions
 if shared by L1 and L2
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> If L1 and L2 use the same ASID in hardware, always flush it on nested
> transitions to avoid using L1 TLB entries for L2 or vice versa, since
> from L1's perspective they are two different TLB domains.
>
> This is currently always the case, but KVM will start using separate
> ASIDs for L1 and L2 in most cases soon.
>
> Note that KVM_REQ_TLB_FLUSH_CURRENT is required here, not
> KVM_REQ_TLB_FLUSH_GUEST (used for L1 TLB flush requests). This is
> because KVM could be switching between different NPT roots on the same
> ASID. While this generally requires an ASID flush in the VMCB, which is
> done by both KVM_REQ_TLB_FLUSH_CURRENT and KVM_REQ_TLB_FLUSH_GUEST, it
> also requires a hypercall to specifically flush NPT mappings when
> running on Hyper-V, which is only done with KVM_REQ_TLB_FLUSH_CURRENT
> (as KVM_REQ_TLB_FLUSH_GUEST is only meant to flush translations created
> by the guest).
>
> Note that this is currently a noop as KVM requests
> KVM_REQ_TLB_FLUSH_CURRENT unconditionally on nested transitions, but
> this will soon be removed in favor of conditional flushes.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
