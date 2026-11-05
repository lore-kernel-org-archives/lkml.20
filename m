Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793922773;
	b=i2ON8c/pIYxgbvqKzbMJHQFCQ6HjjYgO65U2U/7Yw1E8yHQCpVZCZh8PZnDVwlTwT688
	 yzfptVvAlYB1Yse7BA42oiV0mKEEyb9b/hfOR+1zUai0n7+oMyzWNKL+u3T4DNuRbdIA7
	 jTol51touAz60fSPDE4BcFOyaAirueylGEkVBN1qRNOZnAxhfHqCgVPlcQHlUlnPf+5Eb
	 +sbiCrRgvZPTOTVVRL+qBqmpOI8R9buiHvjklDBlcCO8O+V6r+K3Q2St4Xen9sYXOdpyQ
	 G+MK2w681DTPaESF1tIuO2HsYy7xXR2npHEl9dD9CzaORE7DdEXKHmiTRy91UpsnFdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gyTUMZMCRBB3NFufCxWmPinuLT4dvHJtRVbeflStz44=;
	b=3BNpK0B91UuPnAwVS04RLm8Mnw6afWpDRtNduh0PIAJgXgAJo4EwvZnZr1Aog0+LMoYV
	 piKsljmQ3v8WvMguYWgAUItFftONItu9mIncPsI2ghjkEDUB32WGkOtkuLPvWAg1oNW83
	 d3QV4dfh5FI3CgFWgAWeKDz2nyTpSEjslnweXO6WryZ8aZIb8Nv/GZkiHqnkYJQ+Cv2zK
	 37eAzNm6urKkjh7sE2bplisW3T8tsPIxhYZcszvSU/CAu8TT7VGZmwC7KdAc4Md6LfCiV
	 NoAVbDMYQT+zjIMULX295XqAflrNJZbJM/rwiRZ/Lgj6kxz8sHRPDCy0FPWHGAkvsqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h2dtoYhn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6215E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h2dtoYhn
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2129a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793922772; cv=none;
        d=google.com; s=arc-20260327;
        b=tDHW7R7XlyaRkk4u5VEE9iyYJK0oJOYUGzNBNjkICmbsA8YI3kdtJzwASJINe85wg1
         +4L35QF5SoVHrSKJ5gJ8pjeyuA97nuF/wqw2RB7s3dxAymFqX5ZzfLIlg/Gmf7YxTays
         9ZZknkFhKS1xbEbSlV8jX6VU+3fzqUGRN3VMhO0Wg3ledAfb7eKrtdSa8GYQMXRxWl27
         A6DKcGOAVEwwn5kCeQFcW3icrXDF6YA2iqdxRgwcO/20b6u4a8ywPJ6jVQ7Q5AI2+tOy
         +7Dr2Rf9ivmwm4F3DgkG46s75S6p4PGhQCqLN68AbA+1ZzTDbbb1GWefXZtgAyRLpo4l
         6L0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gyTUMZMCRBB3NFufCxWmPinuLT4dvHJtRVbeflStz44=;
        fh=nsIgu4no941Z1P4QBhE7GxOu4iRf12aNoRSZUFcVZ2k=;
        b=oPQONiLCjqZBUYiBK3C+dHla9rxFZn+LxGPIkCQ3r/GTOkc0xFiUR6IfTbjGE9CskF
         DSWBNsr+hOtzNV4ceA0SQcSTUAI7I2tPObxZpoy4OFc5EbkNtL/4RhjXSCiuTsVJIgLM
         6mfhZN8TAYCU0QjZPChCXwsiZRXIgN3fh5zYb8HEHx7cy6SGS0otS3a6lwS7ZsTixaag
         FJUpS4nRMWxjQBizAzK8mjYgWbOyNDwCYUz8NGLqRr8LDNef4uYPzxPwoCZEx0cdz2SI
         6PhuEQkFV1UbLxk4G02MHCA9O9NGRJFOC1TlyHhOH1+1GojcDdmZE5PBe4+gE+Uy10PC
         tlug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922772; x=1794527572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyTUMZMCRBB3NFufCxWmPinuLT4dvHJtRVbeflStz44=;
        b=h2dtoYhn7JloPa+v0QpM3KuxwFVtrCd9gU1Q15Yod2dQLNvhwTdBTwtW46BbJMwBIk
         6FM2Xp4GTJbYHGjAgt/y+fGgkMiEULt1cBwH18pBa9xW+M96YrrSi3Ab4EgeGgPwwYEm
         NUFyPkcrWugPXd+BhWfUG2txfEF7u9EZ5EQIQ8bDhKblqdQX8/urD5awRFh+PcnkVlh2
         64WjEUBzmBIDoiDP0YQiwB9qkhevf3Ivq20P8Icx42dvimDvG9wd3XKVFHanIzNEuk88
         /ultylEwcwm8i25T4QJ1Tb99cBeCokW2wBRgLVF2+Yv30LwJ/pbj1yL8bevA3rLj1lmw
         E5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922772; x=1794527572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyTUMZMCRBB3NFufCxWmPinuLT4dvHJtRVbeflStz44=;
        b=ri3ItKTh/Wmvr4eZq7kRkzck6lX/0xdJui6Wmq9lR10SuJf64tS4qo8G5oLwTJduLC
         pLpLQ/YjuYqKbtigXTVVcnS7+ucQEVB14fqQ43f53HLb81uryoQUI7TnSQwkqyThcPEZ
         bgqGXvlQpUTdOrP4uiiTWqbyw03LyRuA2DO6hDbI77GgtnM33vfB7zThSf/0cvmFdcpv
         PQ28FuIqMiY+N1YMuIxzGjSs1M+hgdFDAeW9a6hPRcfwIFwfNJhhK1csKk7Yhamb/BwU
         75+NaHnfofrUlGF6omjVDd00FL8X7RaQx44YG9jWcliSPF7MRgSBkE/pHRleaVN2uwW6
         i0dA==
X-Forwarded-Encrypted: i=1; AKwUvByW663jRJKWZX2tlQIgQ/FFYX1YECkcNPus/XQRJEQo9vbpFyb2w0ODAodu1K/wkuaBO5umdglipDYaxyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2RZs3VNGOk3ezyb+EmjE8VgSBMHV+N9mJieRZZ8Iz+Z5LSKL8
	+BEIv4wpmmJzrxryyPOwc5/j9FH8pjAlYYkbyjtvgtmcU0FlD3h53b0Q6/njMKKtlj5Bu3q9R8G
	4H2G0bQmGwIbzmNvZUQz9jsaaTseZe88reSLCWT71
X-Gm-Gg: AYBFou2ul4sq3cxvfpG+R2K8blKwT3P/o+k2MlMtCwOgTkA3RZdtNR//ZlUjvi1aYEO
	OkXLnKgrug0efxGthBl5inIYvjSQamaWzny0l69hCR76lSMFhvRE+yryuYFzkcY3T6ikmFckF/s
	sirZkMu6VuWRj7D9Hn0ANVqC9UrY3a7usC6ROPfyNbQaRsB+gD0pmerAcNeuqStnUaPZ1HhlVeQ
	5SrAGbEUMjNOs4DEf2IX00BoOsVHPbq9buyvb2lQDFjbkK2oJ8tOWpanh8FVReP2fAdnfHwWoQt
	bSKtem2U91stxUqrbAQd82bHJixKEjvO/9Jv7+5e+XeorB6FgHocc5J7tPawJCu+LzHVx33F5qe
	/0MnXpnzJuH3bQOckU7fuZmXbqAX2yLb+SeIdwoGpT402SZDFFHuzVbAwwb9uNUJGtP1TM+Vbea
	OZ9Tk0Ver4uPYmasH1iWiglklS
X-Received: by 2002:aa7:d958:0:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6b597591551mr33247a12.2.1793922770998; Thu, 05 Nov 2026
 15:52:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-3-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-3-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 15:52:39 -0800
X-Gm-Features: AclHuK_hZNLLfvoDKX-PNoVckk9K3ZWiYV2R_2Vomf-6kb2jS7CQyCf_jEgvZW0
Message-ID: <CALMp9eQibSk_SOG4GBybgMd=uOwjVfjLsx+Hxsm2thg-qwNBDA@mail.gmail.com>
Subject: Re: [PATCH v8 02/20] KVM: VMX: Save guest EGPRs in VCPU cache
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:35=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Save and restore the guest EGPRs on VM exit/entry if the system supports
> Advanced Performance Extensions (APX).
>
> There are two possible ways of handling EGPR accesses: reading them from
> the processor lazily, or switching them in the vmentry/vmexit path and
> accessing them via vcpu->arch.regs.  Prepare for the latter; it does not
> pollute kvm_reg_read/write() with conditionals to treat GPRs vs. EGPRs
> differently, and it allows for future usage of APX registers in the
> kernel.
>
> KVM intercepts all XCR0 writes, therefore XCR0 cannot change during the
> execution of VMLAUNCH/VMRESUME. Thus, for a guest that does not set
> XCR0[APX], the EGPR state does not have to be loaded/saved.
>
> The register saving path is placed after SPEC_CTRL is restored, so as
> to avoid any mis-speculation into EGPR accesses when APX is disabled.
>
> While saving may be skipped on VM-Fail, it is not worth the added
> complication for a slow path.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/adPRA4ZhnvbaXSn0@google.com
Reviewed-by: Jim Mattson <jmattson@google.com>
