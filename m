Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442653;
	b=3Dln2QmvVqk+qIj4oTQ+aP5q+zkMqxv7EXb0++TNlgIVGnTdkhlXyCRbW3leB20hLqPe
	 /s0ZVfl9n/FFTnVqQMkRrLetkN2ezgBYXv8xrBcnRDtrg2UV+/Rq7MgrDjWbv0aJp2kep
	 FxGB1OueZHeBnbGhWuBAUtiCu5UbhAfKPdc9A3rXR+TWm2i4PRwMfCMgMpwN4NhE9xRs0
	 nu0UW68gvobX1BghjZyNOf/efPyEWxHcq5Y73oMZgQyFr3di6unj4mB2OU8hsU82httg+
	 +OwSxXVXKPETCqxFfTThXGLPOLjpOZamA0DUNo18xL5i8ztFZTCy760B7a3Gs5MejNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
	b=DzQAYWtYIywHXI7zfWvoV/+ZuC0zmDOCXJMNXE27Pzbu5J+Nhzj8cy3dsC9wccYlJIlM
	 69TkgnDCwFwTgl/zqXAFe2uJWffbyWVQ4qPdu8PzB6fvAubl11+NUyZRpvHHCAnoL5L8N
	 Z9v4kG47GrbbUBFlHUl5yM235VakLfg+8WHaxwYSlNVy3xrJoPi1bnWM4JbDSWnU1gJbD
	 LhIQ/2VVajeZj/tQOsHaVKLBbHva/dpI4VFF9PAcJy8C+YtWRm8955dNHzreqARBAN7Jh
	 90NGjUVff6ydrFgAoMbMNJSaO7kbEnysj8qvAVyRQcuSQDpNtzQ0VNM8JldMjceKvLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QY+9H4KB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B5606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4B5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QY+9H4KB
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1712a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442651; cv=none;
        d=google.com; s=arc-20260327;
        b=kXrvrKnLuQ9paqZbh+RgxXB9YezZrEN95Ooii04ZT4EUOSR2ECUS6UtDyfNemVTRo9
         GItWdX7NDZB9sf1289HKDWLgPxsBVKQNLIXFXAKifsUxcX6OISP1V/zpPFSABgzuYN3T
         oZCha4YoKq5CyWXx6ZuJ8NvP+VcnaUUGK0TxKnceHNthqffnoBOOndpWmZqk9fit838C
         hhlV4qOePcxIu8kpwf+tGzRlbEC7+fYfVnkxKn6oPR5XkVxTl7TgU3gCQMSfbAlcQsAl
         W/TDbaG0gHFbkAplaRDg7kcm+ax6Blt6jWiv2EEGGlG35VunvwRMFIhs/pHDRo6S/tXe
         GLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        fh=EMUAjtYr4YObO/Eq1WDxNeWqwd/AByprHmhN9KVi3q8=;
        b=Mw2sbEB+YM7Xrco53mZcOkHaJQlReRFxh5ai/jSmYydnRKopKSBDFCaGHy4espWNfq
         pD+14zRn3sjKPYlAmzkGyOc7ZFnLiAIeDWDEoZGyYnEEtt1XoHwCDNJvsOh9iiW+l8fW
         3p8clZPZSZk7aP0adcenUYHt3D2hOwvoAidXmP5ZMGOxGD79sS42per6PES+DTmEXkA4
         LrwK01pgWvDoIRUmDgCWoGFrTvUwYVnPedB673X7bRAmtQErRqSKcxdZZ0rEEyJZZJa8
         JoTxWmqL3zUm3bpgjRvmrmSxfqaWofr0j+n8EhF3Hdi9CmWzAFJHTI8OGirAvbgx9ClJ
         PaRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442651; x=1795047451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        b=QY+9H4KBVMuRH6WseMYE10z/E6oHDTOxh8WTDUyV9c1OJB/L2GOFHpJ8jTAfTPyNx4
         fnThIGMHJGQSj6hOU/X43MCGlvQdkiO64U45kfZ9SUWdV/nIBHN2yM8WjPL3ie/cE5CL
         KfH81hSPqG3FwvK/mbyH0AKy8wh/batRMthVd52IT8+bfnWhQT7GUqM9nWa5zuL3ThA2
         vyuaQMrfbHHFgxJvYpIprSsfvOxsGEFsy1XtwHw+8+fLUvC75LYsDziB7kDmd1lIZhDM
         bd44g2vlfdilYjpd0y6qdWk/rMix5Y9GFOEv1PHFlj/tkpTWdZ1OlzmijfV4pNIibtQj
         5FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442651; x=1795047451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmUxuFr1Scrtzy9jq6/XBAc+K/Jb1cYhpFQ7OvuHQow=;
        b=qeaYm5xPeMIU+cziDiqIdk96IxZExIh74p/Uzepr1DB+L6OIwNvVUnAT485RJ0bGl7
         wSf1L3JQ+QbjHNIWT34aN66++a3cNAPhgNulxSpiXec2NamL0jHJBY8hPwZR5VwcGtIx
         s8qrEhKCNCDdS1VxH7Juw0J6qktVmPmsjvCrptJsKI14yTia5C6ZsEmSVQ9WTZUuzDtl
         oUJUT0M6B+D8cdoXNfaWgf3v+E1bikqtAf1MSwbg+bb1ZT+5Tp+a/oRoatRgAv6gGh8U
         E4LVYCr2eHtt4OJRMMcxCRPm3OUolnHH8b7RpUSJYPt4nFh2NJXY1zucv57506mcz2G5
         2nJg==
X-Forwarded-Encrypted: i=1; AL+hErG2PJuQPw3BKVYyY2bn52UxMGTfyZ5+kdLXw+OEwlrFGwqpynI1kpvc2719F/6u1pAjbK7Rglq47DpZIXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KwpWvnI7mWZJExtedwQkpxOfehARlWr7mY4Ju559niVXJJLdo
	wOfAIG6HGyOAbBCOFT/1JoCYRP4AIrcoqCmAgTdPnOTu9FbNJEEp5nloar5BX2GTM/42mjZ4BKr
	DiefY41/+EcbmzcA5jbXYVSfVnT91onWSvfGMkOJH
X-Gm-Gg: AYBFou0lTl4lu2XsyRBZ7c9SrnGsVA2Y5itLEFdf1qMnet0NwqVAxzQJYwAtTybcSlO
	2i03msR8+37lFPVQWhWs3sXsGWgDmqhysXzwPussiv36yDOWCk0J6Fallkg+J9NUVThk44q+w2j
	rePnYp/oHmj7H6TP/YKzkNSUJzCtHawHk5T1RHhfnT9rNuFsrCY58hyoy2jCP2mckawmr1CWkE/
	Wf5iXTPEHhGMrZkzkIxuFa3whT3Ntw4jeQbDFIgah9gE5LdhULSGj5nmJoGkGfLNvbHVOABK0Ka
	6IHPTAYT09UG0kBlV1DBdQaI62+UgX4o2nsr0hiGc6OU4Xrec4ZTXt2LyXTRwZXcasgPbYLnFRE
	TFboWxnyhEPTCSUozCgvuNMg50s1/+NndLf1NI0JTSNlAhbhyMBwOoxVhgdXy1X5PUmcMDuz5
X-Received: by 2002:a05:6402:327:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b7a2a18aa4mr17979a12.12.1794442650687; Wed, 11 Nov 2026
 16:17:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <80b2f51ddabc3824b83da48fc0def984cf808965.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <80b2f51ddabc3824b83da48fc0def984cf808965.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:17:17 -0800
X-Gm-Features: AclHuK_V43cL9OcDFeVKDhORDjmYSlCIZPO3f49bHRt-Tpt3bJyQNBhejjxGgLw
Message-ID: <CALMp9eQvP6hdxJ2-X5bhZHfaM5JCsvVJe07OkzTnnQhq73mW4w@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] KVM: x86: Add a unified VMware capability
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_CAP_X86_VMWARE, a VM capability that takes a mask of VMware
> interfaces to enable, with KVM_VMWARE_ENABLE_BACKDOOR enabling the
> I/O-port and pseudo-PMC backdoor.  KVM_CHECK_EXTENSION returns the
> supported flags.  Track the flags per VM, and keep
> enable_vmware_backdoor as the initial value of the backdoor flag.
>
> The module parameter enables the backdoor for every VM on the host,
> whichever VMM created it.  A per-VM flag lets VMMs enable it only where
> it is wanted, and the module parameter keeps existing VMMs working.
>
> Use one capability, so that the hypercall and nested-backdoor flags
> added next share its validation and rules.  Accept flags only before
> the first vCPU is created, because vCPU setup configures #GP and RDPMC
> interception from them, and don't allow clearing them.  Limit the flags
> to bits 0-30, as KVM_CHECK_EXTENSION returns an int.
>
> Enabling the backdoor for an SEV guest still doesn't bypass the guest's
> I/O permissions: KVM doesn't intercept #GP for SEV guests.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/c60b32a3-e699-4a8c-8d52-09b34c4d5269@redh=
at.com
> Link: https://lore.kernel.org/r/aAjrOgsooR4RYIJr@google.com
> Link: https://lore.kernel.org/r/aAkgV3ja9NbDsrju@google.com
> Link: https://lore.kernel.org/r/aIEkrc7Mdf2ia1Mm@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
