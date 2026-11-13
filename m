Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577942;
	b=dyi4cGqjFx5uiQikHeOKHMkz924yf4jTn4AcE+Iux6WexaoyamHjIX0XwxXdwZMs3Moc
	 ez3O/rxROHPAfVnw3/8mdP1ZCDEuXSxlGU0RiaZAbQhFGE1wW3qUOgtujKqvgU5bWoxL/
	 w2AXuoq4Xq6HXyug7EFnOUlKkbpKtysX4XWYtshdaUG9/Y7Muoe450HgqHAYqDsk4PHFZ
	 HGQTytt68SW2E6Sy1MCJT5kUOe8E35EOpU1bKwUvVfr8VXMBTNZi81EttsZNXpzu+jInJ
	 2Jte/MwH/XqqV8QSVZhO1di8MPWXrsgT2miofxI/PnxpQiSdApWm3uB/ZPqcUSTd67A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kHPOfs/L363vqa6CrVL16iEyvKA0LeMf5+EsKjiFVpI=;
	b=JJtcAzHpzFYNIAJYn/RJSqn9Q7v+KEsAbCIw+5arf40tklYJxVwthgexFLFciHCtZYzm
	 v9XgNfh9Ie3xwKgW9f/dwvLyNli/KWKYIJSOLP+rLk58o6ILgB4WHeoM3LDxOdQtIiw1U
	 QHpJsSArUM9O0wCHMJNHqYkogLtQpX82+z4enwhDK8UizZXSVJCbRuBGhPxh42si582po
	 fKG2AsnicQvTmaC6UYoYINclqoFq9HoDrdPvfSiqiPniEx6QIBHj+5Ql0+Cp4q5FczbjR
	 cwwxCZ8y2MTzputCKrLQd6HCP36xMyqvbbx6t8sQ32Nws8zWhHkM9ee1no1dTyZ9gkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jS0O4uel;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19779606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19779606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jS0O4uel
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso1048970a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577941; x=1795182741; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHPOfs/L363vqa6CrVL16iEyvKA0LeMf5+EsKjiFVpI=;
        b=jS0O4uelsvAO6nmqCOnanNqzDBM46UItg1xdlm1CFDIf40vwHX+ueSyt9R0pogbZpu
         SlOcM/iBz5NwVIH1G7XZu9yg8XMKbcc3Sl8JGVud9lbOXsfqJzvgnFvSCFyO/vhFKgzm
         jNcCz1rUAuRgaX7T3N1bJC3CvUOel8M5nbr19uyLbFXCKzEivkfnSP1ei6xW47xCSYW2
         NCTvdYvj6U6rnlSruatJ06bYqVEpjE2riY1q8EfxDYCnq/x740mFGACstE4Odfgvt9o2
         g4lij6euYhj5kVgyREVaThLT3BuAYc5gKD3WBCNLLQmXk0p2rKm587BAqjr7RvMubKk4
         /Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577941; x=1795182741;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHPOfs/L363vqa6CrVL16iEyvKA0LeMf5+EsKjiFVpI=;
        b=EPr3YFARdU6lejNPCcgwmrbKRqG6+fyCTe/CLj0YKzAbIMHNm+QME61kw+/hDMYnXu
         5VhVS7lT1AZ7N3Ax6OJlUswOpKu5+SGjgcHxSln6XOHmouK48uh6V5CcEvn8F0DgN4gM
         Ac4PkwHXqjwmoK0W7TEd8/ZqUg1tBmH397BzWnyCBIU5g48f+S7quoHjvscJ82RKfJ3Z
         AObyJSRUE1v5IrezyMLR4OeXldCxkSLfGsKNhXqjW3v+G9/GzVUA1CQd+ZKhAbHugcLb
         YUt1U8yCE+2dypcWli+H923e6DbBp/PmS+Bj8Pgck5TlyYpcHNGrqxLcoVWgrVTaIamt
         O2sw==
X-Forwarded-Encrypted: i=1; AL+hErEewDnqWZOwmysoSCsgD5EChDocgrw/uDD4EoIEPufaLuQiRPOXiozknjhDk9bhSPldsM0NkRRrGd3xClc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CcEZ42onIK3BjClTaFE57Ufj/74s//2uj6uGhFMBNm9iVx7ve
	MN/Db+JI31ubTACY246z82UcLFb/6Zynm3eJWQGzg47mKGA2ATrLpe1LbKt9LjJb+R9ZIWOwp6j
	cNhAOTw==
X-Received: from pffl16-n1.prod.google.com ([2002:a05:6a00:c350:10b0:89d:1266:bfeb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:66c4:b0:3e2:a9cc:3ece
 with SMTP id adf61e73a8af0-3f7a74c34bfmr2400043637.23.1794577941323; Fri, 13
 Nov 2026 05:52:21 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:29 -0800
In-Reply-To: <20261022021820.298886-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022021820.298886-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441769063.75534.3196433143946646699.b4-ty@b4>
Subject: Re: [PATCH 0/2] KVM: nVMX: Fix a (benign) overwrite to a userspace buffer
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, 21 Oct 2026 19:18:18 -0700, Sean Christopherson wrote:
> Fix a bug where KVM writes more bytes for KVM_GET_NESTED_STATE than it reports
> in the output size if L1 is active and has a valid shadow VMCS pointer.  The
> bug is all but guaranteed to be benign in practice, as all VMMs I could find
> that support nested virtualization just preallocate the max buffer size.
> 
> Sean Christopherson (2):
>   KVM: nVMX: Save shadow VMCS when getting nested state iff L2 is active
>   KVM: selftests: Add regression test for KVM writing but not reporting
>     vmcs12
> 
> [...]

Applied patch 1 to kvm-x86 vmx, I'll follow-up on the selftest.

[1/2] KVM: nVMX: Save shadow VMCS when getting nested state iff L2 is active
      https://github.com/kvm-x86/linux/commit/0333e967fb05

--
https://github.com/kvm-x86/linux/tree/next
