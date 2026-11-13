Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577836;
	b=QkgVcC0+/qp7s1m1uVwVl1iiPeUBpJyG2F5lWmQXtPFseqDTEp8KRdRcwz6fubq1V1Rr
	 7Sr65tFP20PrBs4ucaXXFOa6Y9Q1HxF1RhjzfS4n9lfZvSAv2T0glSKNLeKIr+zd2GHR+
	 jLZytzOluOd4sQwzERVe0blCP0Bj5UHw0L5AoFJPL++TL+xu6O4p0ly4FpDWZh7O3ZuZm
	 +UIwXGjHFzShQQc988Orbos4Ev3ssltgbc/D4SP38N6M4QhXPyPLVXbpVKVnBfVA9lId1
	 93ChF1r8FWZT9d2AMObNQVTZKBtlowwjMzYM3fxKb3o3UvIE/XMXs5zP+aE+/4TrkFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lxsRKtRhiH1ZTa67KbxNQlQN1NFxbGP66GjG0MBIUXw=;
	b=uAMSl2GumN+CNHygv3xityqHaFjcEX01Ziu5kwVIy4Va9pdk7QG3tT+tX/WK+lUOZrW/
	 Xvggdf21+LfSN8/yUAvw6Xil9Dd4CdKloZpxSPNBROqfhpvCfVtItU5XFLlXaBH3yOulj
	 Kee1qKX3seCCZPuMP1e2+laFTOL/Ds0p6N6kL9u/Jw+FiLcjxiewou44tBa+s/YP1P85W
	 uXu+iRHq5JzAREJbF4k4rmxVF7at3rpqRWuVdGL1b0uwzLgg4TERbc03OZwk1QM3dsO7I
	 5g+SfwFXzM+i9eJ7ZIn992BPAFNnGs4U5JF8a01g7R56PB6JCd8zPT5vZgd9/HM6Flw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rwc6PPep;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFC3606A8B3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BFC3606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rwc6PPep
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso836553a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577835; x=1795182635; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxsRKtRhiH1ZTa67KbxNQlQN1NFxbGP66GjG0MBIUXw=;
        b=Rwc6PPep+hI4XTzQBshalaAcYm7Xcoe+pXgDrGFMYECHoaNI2ZfsiRiBm3KsTcaa16
         TJuHntbnuGFtql6t69FyUPKTQK7B+iZQ9CN9SOEwt6DsDaUAguHg6Op1Wt52g0kzYy6E
         LVcxlquPdShFS0Eq5k2b7QYcJ0X/soiJUCZyNqFbosQs5k+vPXIaqVg8N9sqn67nUIuJ
         LR00yM2vmNLtPvj7QdQrE3Ck3YzHnQh/uAqtpTu5Hyo/W0YMYHDYAYxetPX9QXEc06Rk
         QnqmE5qxke/tCJ/qb1K8yOOMgnFsK6dBFmCaEXkq9p0BgC49twye8iyMMQ/a+A2v/A1F
         R61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577835; x=1795182635;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxsRKtRhiH1ZTa67KbxNQlQN1NFxbGP66GjG0MBIUXw=;
        b=EJ7dIwKhLIYB8+PMsZiZoKDldWNyk5JZf336iA0VpyWNHPuIBDXA9OFRLiPPZhhZyS
         J5wxToM0oiTcnQQ3g5huFcNzOxzYQWyuyX7OPWDhAXfqpockQq8y4MhtyO0H8A6ngq0E
         7Mbxo8TkXCR4H8e/hFisXFg589F6FTzNAWRH62sRqF/7C22dSnl+UF6tSZFe+rzbLsP1
         5TBAbBdOJZIZCxsZVXpXAt5Qw9qrlW77tyeX8WmwBMSzCxIBs0nSly+cn672NRY36OpW
         qfmiY9iijNg+woFWUxQaNkOKpgHdN5FyMGu4Lq5kfUUAX+AocEZcpNsWjPXigWMKFqxV
         1R/Q==
X-Forwarded-Encrypted: i=1; AL+hErGSqi2+6lPhmYzXWiu98Cw+9Oq7AieSPXtN8TrB6YebAM2CLGWIG3M6nGGPHYAgpOE1+STnQyEUuLSSW/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IC2JBjVD/2g/X95Gn/2caB0UWaAl/g27m3hhU4avLt9oMrHdz
	hIKIfTkjwaHqE0SOnQ9qxRGom5uEVQEJZCKf8VeLuVv8DFyZ9KrTuOoS/eqpjsSTlW5Lvd6ZuBE
	feoVIEQ==
X-Received: from pjgo16.prod.google.com ([2002:a17:90a:4210:b0:3b0:a2c4:246b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37d0:b0:3ac:aa8d:19eb
 with SMTP id 98e67ed59e1d1-3b1b07e9b1amr2418366a91.3.1794577835192; Fri, 13
 Nov 2026 05:50:35 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:58 -0800
In-Reply-To: <20261027223038.1566931-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027223038.1566931-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441791333.77463.12077075015092050063.b4-ty@b4>
Subject: Re: [PATCH v3 0/3] KVM: x86: Drop deferred updates of EOI bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="utf-8"

On Tue, 27 Oct 2026 15:30:35 -0700, Sean Christopherson wrote:
> Stop deferring EOI bitmap updates.  As pointed out by Amirmohammad, I missed
> this one when removing all the other cases where KVM defers an update until
> vmcs01 is active.
> 
> Patch 1 fixes a pre-existing bug Sashiko pointed out where KVM doesn't update
> the EOI bitmaps if APICv is temporarily inhibited.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/3] KVM: VMX: Update EOI bitmaps even if APICv is (temporarily) inhibited
      https://github.com/kvm-x86/linux/commit/224c5cbd9194
[2/3] KVM: x86: Switch to vmcs01 to update EOI exiting bitmap on-demand if L2 is active
      https://github.com/kvm-x86/linux/commit/70ab7673336b
[3/3] KVM: x86: Consolidate invocations of kvm_x86_ops.load_eoi_exitmap()
      https://github.com/kvm-x86/linux/commit/77eb3b1f9bf8

--
https://github.com/kvm-x86/linux/tree/next
