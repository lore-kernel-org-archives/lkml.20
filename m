Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311495;
	b=ZT4DhypiyGLP/KIJN4zNxCJNQTx/h0jmvGovRJrEzDtTUkrcLMmdQdgt75Xlu7c83OzZ
	 Um41pEpvssPVUF6IFD/2Q23Igdu2hAOb9QR1zoPAxZkYlblg1YYAoluxCDBzbpnnuhxqR
	 Vkg7DCtHqD3EsEG4MGXBU9kIbcj+rKgXCnF1ah+Yn01YTNBa5ES/MKu+TsGQnM+UaNyka
	 yUQAAKn3D+RpHn5rbO44k1dclp5rbNW5rcNmc6DEayQBNHHpbVjpqe+f8pazNuarYT/r5
	 e3dmrqGXNq9FUKHOYY3UVZl69P+C2KLEWsII/88UE853sLrI51dEskPZi8almW4BFPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
	b=J38JMkA2G3pCiboypBBTjO/mFxBc8ywoSfrxL0I8bv9GW7EcqAvWQ/QpkJhamJ3rV0/m
	 2VVISJBa2XqgNremfYMXHM620SYy2xE8ODSzvGDh4gzvbbesQDLq4qEuTUxQpkkMWnhWD
	 vkty1ThMPr0aMAZlOekkrM8uPM6BagxMhqBn/BEgyfFvsCKx/6C5wFc/TZUATBM2k7tnd
	 MxkFBG+CpI8pLQPPZkp8Jc+wZD2nI2S5zJxyyLIIr+Np1wOTXO5297rv3HQm2zYkvsoYK
	 OD6kIow7CcUZkOx4O5vnhMJHvJz1qR4GRGQt6Y2YmdMBUELrkdyB0qKIEy4LcI4uMcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoZYrDRq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B90A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoZYrDRq
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1767a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311494; cv=none;
        d=google.com; s=arc-20260327;
        b=BbtBgtlzITxsfc6I2Hk7P0w8j5TxmjDF+SmdAxd4P8eAxRblDLBt+uGMn7KQ7tVSDm
         b8I06lU26E3qMf30O9VYYUsP9j+j5DgNTycKjpqoC1mg0MPfY+URpTBx6oZeBiVBRs2n
         XPyrwa1gq6F5TL6KKo5VDM+h7SB39I5LzoXtMHAkMXIa4oLmt8RMQGW8EoxJqFxX6N3Q
         gSm5aJFC1M3KDpv0nlVxseESLv+t1cdacuo6xBCZUJ8hvD11TI1tUw1gMs/CU5QQlriC
         38iBCxTP3ISRgj49qt3lYqoazVNVERtaPxeo5wtqCfPTdybqG92il3RmVc8ipIeDDPrf
         mb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
        fh=n+jxzDVCYvWMLsbxLSEXLvh+jVrSv5qRIE+wskrFBJM=;
        b=rSF8vyaDu3+HZ0E2gcRVZtZrPI23ThwBPv9gUvRAcIu44Xtyjz68PDo7lZIRz3m4Ws
         r7qh9MxrQrOxx3XGxuuDgJdNe3Hikb2E3nuTtKP5OhwNZ9R1RLsdCuZ1U9mIQ+StsNuB
         gaRpn1CMDWAfBlCGDooQhK8cOyHx84KgrtGrx6qxKK3TXPEVtIHcpSIVQyG8e3lRj8N3
         CVNNJIo8Qb0kRhqTIUAPO/tlIZXaQr/IqdKaJmZhIMsGbpZcu18ZkwYPKxrIaekrpwoy
         ixA9k1KMIXYOAwj1SVQIAMnpf5lbKU5TtTY6mERtrhx/2Arb48zGzpxUoZO4yTF61zFf
         zY2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793311494; x=1793916294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
        b=EoZYrDRq09IAHfGFnB6PhfFCC8BohHQL3muqXimashHCmHChePNgkWhfxO9y5MpA9Q
         Y/Ry0dNNIBodVgVAZvKmaTm05tvUuLIjs8k515ashbM6WctShEhMk1OOh8+B4xfpDNgW
         S0qWb2UfXumsusqqhYlwb9ewzluD1G/lQhSIDJyX4BcREmyCJzBUacg/A3GSFBa3fdy6
         kHGqSR1gEJzIWieotrGcwpdTnXERAC41+PfmfXz5k6Ugc+2qygD9Mqy82uV2mVMyyJ+A
         38lipn9hFrNT9H/JgkUTQWTvL59P2MzRKm9Ww2Oo1t8S6keL75vN9AVGmi02y+Ler8aJ
         xKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311494; x=1793916294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcjS2XWAO2PVPZ4E8IA6fWD7RE9agLKIkmYjROKzQ6c=;
        b=G79DHp2Dd0CzC31A1BsBQLUViPvIzRit6futQ5J7wM48RnrHaV1fGbKGp1NrukKGg2
         MA1iPhRMvmBYmA++P/ckXyj+cibBhrBxJ059p+jvPD7p2s2XUGQt8HGHFGw1LLoXUVrd
         hI5Fo/yC70Lq4lO1rCNsGJn1urKvF75q0AUkrmNXJxOGgCXyDTH44I3rgKTw3Vb6XJEF
         cS6PvEz57Kau9gXouTk0VMq6dkd7mtADXGElb8SkGPj1IDjmS7BsulF9TpIUORv5Dw0p
         M1jAlsPh4NFGDuIqDb0uY6Ta9z1e6uN2uKaTCctIoEz2nDE3Nngo/RTUYMkC273biFe3
         CUIw==
X-Forwarded-Encrypted: i=1; AKwUvBy/g41A60UIaU5TqiU41w5GGPw00uxy6hHb6qs+pnlWmVG8dhIaAugJInwzkVTD42kOOTrpYbz9c64+kq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/iQbpMSZqjptmBxc9/sl5ONsk3SfS1RGbFDPY7125m639iIi9
	wBfqRxs9vynQxuZqJYwanUS4SipvJiEv63VehQNd6gnmVwseVukrgk92tiPStiE5tNozBHfB/8n
	VL2sfkKWI+LlNbanMK0OY10Pa1iJZ4BZ5kpfl6wE15mSAgevmCtQnDCw3
X-Gm-Gg: AYBFou2WnW10W/t9WqCU3r6CitwcrWEMPoU8Xofd3I2iSjpOs64besDoUdBm43LlGko
	VlZHZ9Tl6imjeFhTEWvN0wGwm+NC87faeG6PpAN/PkeswTniHk6Ydx/eKHU9f/yWhsikqwxkVbe
	+O6doNB37SK1tshEwlObRCzPRsgXtl4k1EqF9MnBeQDPsjgEKURaomPwqtivyLurp5XwRE1JtmB
	nxqgq9hCrFTbeEe36czT9t8lF7QHrFXud1p2DSmEEsowsgd2OF1zek9MAUd3qoE+uVUW+rEz1QW
	lhKbZoSkiY+4GK1a2oI/lCOscT1fvND9PmcDevXLqyg3aDSqP0f8Hujpxu0tmGx+gc9mFeDCXmU
	FRNU29FjlpZDE076QcScTED7mmRru98fNZp2cS5m1s4M9GKkLMbzmsemmyQ==
X-Received: by 2002:aa7:d3ce:0:b0:6b1:c6fc:aba0 with SMTP id
 4fb4d7f45d1cf-6b4b38e3229mr100799a12.7.1793311493406; Thu, 29 Oct 2026
 15:04:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com> <auO4UueaV0mTVzzB@google.com>
 <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com> <auPAFxXy4ulcK_jq@google.com>
In-Reply-To: <auPAFxXy4ulcK_jq@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 15:04:39 -0700
X-Gm-Features: AclHuK_ENQe2XaR80YT1-r3wPysVO9nAq8MWJ4g7grxHkMKrLjeivCR9yTj8Qmg
Message-ID: <CALMp9eQdtvjQkdgnJ_NTt=2ArdzUtqqzieXLccv9Vb_My5G+fQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:52=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Oct 29, 2026, Jim Mattson wrote:
> > On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > > (Host- initiated writes are allowed to set any valid MSR_VM_CR bits=
.)
> > >
> > > Eww.  Why?  If we allow this, then we'll end up with the mess where t=
he guest
> > > can't write back the current value (if userspace is being weird).  I =
get that
> > > we want to avoid ordering issues, but there's *already* a required or=
der here,
> > > unless userspace ignores the failure from svm_set_vm_cr() and continu=
es on.
> > >
> > > KVM doesn't advertise the MSR as something to be saved/restored, and =
none of
> > > QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make=
 trouble
> > > for ourselves?
> >
> > OMG! I didn't look any farther than the obviously broken svm_set_vm_cr(=
).
> >
> > It looks like svm->nested.vm_cr_msr controls nothing other than itself.
>
> LOL, nice.
>
> > It's just 5 bits of storage with some weird locking rules, and it
> > resets to 0 on suspend/resume.
> >
> > What is the point of such half-baked support?
>
> More than likely, so that older kernels didn't crash when writing an MSR =
KVM
> didn't emulate. :-(

You're not going to let me get rid of it, are you?
