Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577879;
	b=IDLSAzl02DUuUxjIcenMOxFXghzXG8s/ReiZn8bD/pkA3jSuyYfqR9pLxScxTcaSu3mx
	 ta5Mk3fdTuwoz3pHLU5hPJX5Up9VZle9UQMyNE2qenJo5Bj8hTq+Lgr1s/atVvWNbmS6j
	 uFdiXG/h7jdcHHCPFKlk6RLATy/ugqwuP25szU7gNi1kcaUaO0aViVHwUvGQJZZP3+jKp
	 WbjDWzc5jJarJz1RRQBxeSarYfELBZTG2GOhINqiHG5Q/7+NklLyESYC1i4YyjJ2quokf
	 Sy6UpQJQkGNkvH3gkMZBsqcNak9GMVenyIEJqPpSPRbfXaH7y5wbcDryg+oX07XT7oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uJFEo3da6mApyecz0gSXP2yjHK1yQMS2ugcFfpj5CrA=;
	b=vAjBuOQ0i/O5QK9N3D17gURAH6BJZiu5uo+l1oLEd2P7VwoQcB/v5Rsb1kVIm2jmnmTy
	 zni5DurK+wYG2b0CzXlUpbdly6WLT/QJzcyFEYDK7hJQQjoUBUlj00rt7OwHPm110YzIS
	 zIk5+RWQ4gXWncSEhLYeXm+zuRCZw9LYfdZxMeFcGpwk4sqd6ZvQme/9L7pN205445hCT
	 65wcXQx1XTcidgTA0MIEixKRYuoY4YSXo+qk5SlQHH07NV8vpi4L8I0uK6qAor/OHAzAE
	 q1uSxQVuAvAbnQK6WufdzkayMByGusexwo/OW0flOaoVBG7sMp2Sy2lqS+5dHHFsDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCKOMTLC;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B95E606B1BD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B95E606B1BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCKOMTLC
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1450635a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577879; x=1795182679; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJFEo3da6mApyecz0gSXP2yjHK1yQMS2ugcFfpj5CrA=;
        b=gCKOMTLCXj4ap5oN4yRlzwMH0lws3z33L/C3natTDYSKrhyBn3fxp0Ul23o49sA99f
         Hmzdh6srBAdDg2LuESNRAsJgEtHnHFiA9ify1hZhBRIj+sJn2pa90OahDfjCpIXPS9TI
         rSF9yAfsMRdpgFjFlixs7kYAG+WP1IThXmSqE4/4j/f9diWCaxzE9LriMDK9FWG0MY0t
         /eDgPmfKmSdZvEdXoy3YXEk/Itc90W8UMBDgsxLs9cmh/nqf05RplOagrt6T47V1DDtA
         sPLY+qtrX2mlYBxGn0KD4EkEqr4k63q6n1AMoV38NI8JPOop6Kqx+QDxMR3WW4FPKrEz
         tYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577879; x=1795182679;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJFEo3da6mApyecz0gSXP2yjHK1yQMS2ugcFfpj5CrA=;
        b=G3n3iz0edd4X3QCDxGwd3E/vVKQmwgAQR9csVMCm022sEM0TCXKMlsVm/pRBaFfqWy
         /7HdWIx9i6gsYReU2TpzSHLCRGBb8kvD2+QAdAUpNhaR/kJ1jy1Ud+n+MKTr/6VeKNWZ
         l0xsY5E/8GnEl6EV4zjuDTaIp7Gqk47e+Ix46hrG62KPpY5GlKzGT5lzCfunuggAdd2/
         Lex16fPbAvHsmGqTWo+nBhNK56FFGdbVv60bg1ooG0RYG4PUUU8/qtBuiiSInRab9Tl8
         XL1/W4CECDkY5ZMBLiqE8/xhn8hIhafHhyilSkhkub5ub81wwxCDEyVOIVGtvxJTUO4J
         N7IA==
X-Forwarded-Encrypted: i=1; AL+hErEq5glOFlQSNxfv6QYNylt41Vh3wMxmF0aGbGYh2VTx8iWTFfAODdAybNYaLF9yMszR+SX9ySus0IGN8Sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L0pmnLZQnxqVq8ir2qBFfBqrhX6+wQna23T/IXGfjjiRjr/in
	ZL+Yo76Gzg6NiMrnP5OG7C0h6lfqNUjm2RwgQkj122FWvsB/mnzfQmHWp19LrU0m+Zwxf943Gxn
	GnYdTYw==
X-Received: from pjbgz3.prod.google.com ([2002:a17:90b:ec3:b0:3a5:f1d:43a6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2548:b0:3ac:a521:959
 with SMTP id 98e67ed59e1d1-3b1b0ba3583mr2074587a91.29.1794577878313; Fri, 13
 Nov 2026 05:51:18 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:10 -0800
In-Reply-To: <20261110182451.44207-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110182451.44207-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441799422.78529.8123717597715087423.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: selftests: Undef musl's PAGE_SIZE on x86 to avoid
 type differences
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aqib Faruqui <aqibaf@amazon.com>, Hisam Mehboob <hisamshar@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 10 Nov 2026 10:24:51 -0800, Sean Christopherson wrote:
> Before defining PAGE_SIZE in x86's processor.h, explicitly include the
> system's limits.h and #undef PAGE_SIZE to workaround a conflict when using
> musl where musl defines PAGE_SIZE as a signed 32-bit value, but KVM expects
> it to be (and effectively requires it to be) an unsigned 64-bit value.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Undef musl's PAGE_SIZE on x86 to avoid type differences
      https://github.com/kvm-x86/linux/commit/3efa3f8b6eb6

--
https://github.com/kvm-x86/linux/tree/next
