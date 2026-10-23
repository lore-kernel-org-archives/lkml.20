Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792780414;
	b=G5wZx2ovBs6Rmch6jtE5K9AIP/pMr7NRB0LUMLTnVEFFTQNZGgTLAsmYw0fdQHY7B5DY
	 ZRTUWLZaUrDo0PNCzac2zFjIEHvBHiOGsI3V5fiT56ktxmpK49Mtpvz813sFAXx04ibPP
	 zSVdHvgwicqbV5sJmhaK/DkvtRH8SQQEFjaEH3Sfz3ZiTtQEx8YS99erXNNxIX1iyxCZw
	 iQvUOWfIqHo0y9/3yTE/mchKVA4F7gvmGoYoFMPyJUqoT/GPPAucRNVCjjKEW1/Y8PN5z
	 T4uCCHeHp5VyKNpLbBRpl72Xy2PN04mB7HiQZZS2YK/XxiUajHCO41QYYaBt4TTaAlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lJ/PTfv5RXcFCq/Fmv1kk7W2C7lDfDCOzu0A1tXDMGI=;
	b=B/by5ko4RDsw0iaaNtTD7x7ml6bdbxBb3q7PqHCDgXm7ty8eeghuQiv2RObrKiOwmbEP
	 X2dEdtfRuSvEA4/0hPMUCvieVbrGx/XS+Il0fvnLe/i1u8VI6mh4CAiR4GIpsEyChAaY5
	 RQf+QKovwYC+J/qytjtRXy7pJs5GsT6ahjUhtctVBVfF5WQS2S2VB6IZYLmJzmMgy30EN
	 yBLCMDmNE7O7ODyWXPbgY0GU2enbQVP31ZM5ifeg35qckfqbtHVb6KSSXItk+FnD/BQQt
	 H4swLwSzQrpJbAz+C7a7lfKOrVkw7/viQCgcbsX22soj5iGOpUz22HlflyGU8gcA6ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ouyVlE+t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C5C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ouyVlE+t
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1774a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792780412; cv=none;
        d=google.com; s=arc-20260327;
        b=Fx/1cpEZOb5UfMzCXN7aDku9UWyHio9kEh4lkJ+mHG/pCXBg9V0WgVMimyz6Ov9QAb
         UgAw5g4IM/ksHCsjOfQpBTY0hKa1+EvsuNGtovHN8mVjVhAVjCTeQoesMv/MIidsPoPW
         ybmaLH6b+GWcDgLDMpToxe8stBRiQ+xvjhfPf/t1D8iOHcqzOb9VwqDCAS6sHRjj8DxS
         l0/ACUZgS3mA3pIxi3YPleInhcouPUiCrowtpaF3bI4wO9zaqC6MgU9TlKqTjSDbm3bU
         UVWmi36laf2wY5Kz8ENcttj1F73R8/54Ct0Klx9cUcmV7+i6D9/y6YA8CXMy3fr7+6Of
         bfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lJ/PTfv5RXcFCq/Fmv1kk7W2C7lDfDCOzu0A1tXDMGI=;
        fh=E82fQbo4FuKswx5qV5+wg6jhy4ZCo+zTy5m26+357g0=;
        b=E7+X98RkRd0GRkKJ7+CgdHvjm4YEG/cCDB1bHPaopCWK5nNh82fgwFF8lyzWyIgLkq
         EScxPy2iB5akdaY7PBLJzQSG+E0/9lrn8NPBfsrbsAzE8hOHsYraMIsXXkbSAx8mVYff
         uSP98oI7R0eqv9JnqdTcvARmmKJ/kJn6gzlHRg5bH140VhXuaXtX4YVHkyD5KPeIJomh
         8SdcNk0r0x0ky+Hgp7IYEnXTqL+1ZorPoV4oGQEDhhmXprY4Y1RcUJjYIKUMejx6eQ+2
         zojoIv/fHMQcilGVXZDC9NcrXUZ6QuzB9cf6P0PT3XFX6Gzj6zfcDHlFoQAvDGLwhVQf
         lR9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792780412; x=1793385212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lJ/PTfv5RXcFCq/Fmv1kk7W2C7lDfDCOzu0A1tXDMGI=;
        b=ouyVlE+tjZggbTz9IPfAlCSRI9kRdKGAaLaDjGr+hBPcBH34MkLaa5erTh77aq4/7u
         hIP3wurytOhz05R0FADGgynVgyYfkOnS6Y8nwi0cEBnzQp+0Ru4boPB26Qx5Qb/tUaAH
         atCIKeHgnXxS3ViYZWy0YGWIGwTyVHA8y671I8YWfZI5C6coJKZHXTVKN3s23Wm5tCJV
         GYPi4cPKEzjidVSK1gFlBtNtkam7jykRz+KqU0P3ABF3kNU7w+VGjLJaNUutqoCqj/TP
         zJru9puV1P2oD9oUpIJsWFdNJPkye1y6QjeXZKa5x2/idGm7D122SUPvJmA4ejc60b9z
         ObDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780412; x=1793385212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJ/PTfv5RXcFCq/Fmv1kk7W2C7lDfDCOzu0A1tXDMGI=;
        b=1Tl/HwPn3owEl9Gt6CB09gCy/eZDuq68jSNjDNDtB/8TR1XUfwRTmb/n/bCQxEgSwu
         Ja7DohyBCQZ/JRE0lCl2DmbOTXy2Q48w+iLIqyMvmBQ0IokKF7KZWs8tLlhuG+DTWKif
         l/ZfBUOXJQuBx60XiCsXaFzEMAvDCB8fKqI2wc9IkKqjjZOnGtb3Nv/yTxQI39yNRVpZ
         PqW9Q2BtyUhXV7ORtYF5bk5AZ8K3EY4rA8wG8EPfYUztQ+Yx/OFlIjSj1+IJZ2TVRtp5
         gfYo9dv4zLEpueIdr1Ke9IXxnTxfomZY8h8czo+aYQKD85ubw5NEbnSy3ldmaMkQmEaJ
         8MEg==
X-Forwarded-Encrypted: i=1; AKwUvBwUqgnbQeCefCXNJYafgy0yk7Ytxv+/7MpEOXF6L5xpCs6am7WKJiMQ6Oq5MmYx/gyBR/Z8eCT/OUA5lsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyENF1ICk3zB3RE6vxAwtdVkoMxiWoIYKG7P3+KHnPzuO21mBK
	iqSGxxOtyceNOJOK5rqfXkLQ92nNjAh2d/ocfUw6EhyYAbSyK875glnqPSqs2b534Kita4q/jzM
	kGhyqM69VuTetuRgZuL8TKph/xfmVfkALxXOsKdGr
X-Gm-Gg: AYBFou3FCFaRbOUn+QZivTiq0MMrp3WvEMX7fK51YUVK8VOOEvjq3UI+34VVo0TrFVw
	CqkGNyHt5vXR9CMqxmTqVRbda24S9SkrDW2iNSwpIOUB0ADAA0XbKfdJC9KQk9H2hROYEJmUF3F
	ZKFpGSApOMMlWfQ7352I11WPJ01k7zQ1LyE0oxz6Ijzk/RLS0ahc1hEOu41oE9etfAO/sQ5VOpE
	5gD20olt6n+FW23P0meXnWyiRZlnK0nWQlQmGmRhOYgNPfkKC16dEWv2LmgbIMfGRfWvRgO54Zm
	4RsDNSD8WnWaf0KJIzRfaCIBdrRZCLkqWuM2ioITFaxgSZBPjDaz6wNYpOpfrNQQtGw1iNSIGhA
	jPxg+t+VFjfDplqMPAkDOEcMmZSrfepwwabkD53tuztKsTyaCTKFh9Jv3IQ==
X-Received: by 2002:a05:6402:1488:b0:6b4:18f4:94a0 with SMTP id
 4fb4d7f45d1cf-6b44260476amr7317a12.1.1792780411407; Fri, 23 Oct 2026 11:33:31
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918193937.569414-1-zide.chen@intel.com> <20260918193937.569414-8-zide.chen@intel.com>
In-Reply-To: <20260918193937.569414-8-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 23 Oct 2026 11:33:19 -0700
X-Gm-Features: AclHuK_CT9diReeX_afaBUV3QEArYKCd0k-Zn51egC-a7l25vS2kQ6aRFfZD0_Q
Message-ID: <CALMp9eT-vAspszOpGu8Y=tj61Ed9NFre-fho_uHN7YGqbpnXSg@mail.gmail.com>
Subject: Re: [PATCH v9 07/12] KVM: x86/pmu: Emulate RDPMC on performance metrics
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wr=
ote:
>
> If the host has the PERF_METRICS capability but it's not present on
> the guest, RDPMC interception must be enabled and KVM should inject
> an #GP when the guest attempts a PERF_METRICS RDPMC.
>
> If the guest has PERF_METRICS but RDPMC interception is enabled for
> other reasons, KVM needs to emulate RDPMC with type 0x2000.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
