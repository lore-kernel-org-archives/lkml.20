Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695933;
	b=i3pNt0rolrdz95zIDvljt0U+8Hmkka38oxNDUiE12b/YdecTmk5Oi0rQN+D62JL+6Q8t
	 NN7FWMx1JDu3b6gLS7rcYIP8e0Gpf6tS7j5Mc8VJ5QXsyXNtkQqu1B8hsxwd6XDXyo/Be
	 HpDMONYfH9nY7+PWStE449g5ptdEbQS4sg9xKPaiv7iA0iweUzzwzjwYUJWWMFEIfrhPx
	 AkpOCtX7LmPgWVjINcjNUfKXJnOh5c8WTYgxxz4SRY09WWIio32YtX4JpkLY5HSTyfSuD
	 VFGpoutfvDMtyKsIxwLS4pDMgY7XIdeeI8o7y68+7mjRF47mCEryUQQUl1N0aMP2EZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bSKzXB4NLO5kv40pAwCTXZ306urEqJ2r+C8Y4J7qwDE=;
	b=J4VT2M3urGrOOlQCqkkFA0Dsp4lKz3UmbFnu1kIR9Av6GX9IJip4MOHE1rDvsSEIH7fS
	 9vDQmOaGUNGXefplH6aBoimMenERuS2dapptP4kaYosUvmqlREgS3Zt3ZCDgfJ69V2Epp
	 L7Bw9PqQXbUku5jx8dd2CRWSNiCsDEhm/tR52D76aNqLDHaORD3rX2ZBv78o8fQhVYgUt
	 TLmz2BkDJsYiUAPkwsKg2MM4m/F1KPxZV2Ka6q9Tf6fcGO+f8P76o4YwecC7xz3dbWbka
	 mpgiRNEM9KHKPuW73FqjlOxgApIKEniFZXDb9u5KJpv/iy5O/chU5lmEMz0YfksQjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TTZHvwxC;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB16606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB16606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TTZHvwxC
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so116480a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792695932; x=1793300732; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSKzXB4NLO5kv40pAwCTXZ306urEqJ2r+C8Y4J7qwDE=;
        b=TTZHvwxCeV0S6xd1yoFOXssyFDfpjKTkmry19u6LNCVRbFBmCS6vCAGpTQ34sDuy72
         XaFKgV1e5xA/wEvSKRd8F30qwtcZMoCf6OlKC3KJOtQLn5shcx190SZGjzMks0eamIvC
         LAo1cKHzacz1mV/RZ58HbtVrnJA3LWqzXJtLa5FLJLOVQPfXAzSkdhwtsrl+hlmjK1VR
         BH+/qunKOL141QQRXhKaGEAQXges/qetn4PrwyRR9PlCsIE7H0CSWjXDLkxwsoBgOgwh
         r9fq7PfpavLZSnMqG89j93hNOFYge3nhrJWYB8rqB1/iNLRCzVZ8n6MDIIxFibfO4XSd
         mfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695932; x=1793300732;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bSKzXB4NLO5kv40pAwCTXZ306urEqJ2r+C8Y4J7qwDE=;
        b=Uc6BI2hn1mF7Ww1/KbkpCT0DKPz5es05yPtqiYOgyYHtKlURl1H4+PBaD8QPXmJ1af
         KcXXqx/5eerJn9ytElwY5FzynmIAN+Mv0gjQ4VsfqgdaseiO/t+TGdvoCR5tvgtXtd+x
         9RYCHYW7vwAyJnKN50AhZyggkoveTU9IXdPMU7hzcudcms/ZqT1WIS48fqLpyp32k2r0
         DGPIKhBgOX55pF0bXIzzZGN8USvtEJlQjHt4AI3RSrlprb8XMDsZwtmsIfcEp01sQEjF
         EDsj9d3ex2kQsKMyF8xFbUzJj4QNUmzDUXeBBwxxMOV0u++y8Cpi8E5mgS9OXCzmgsh5
         k85g==
X-Forwarded-Encrypted: i=1; AKwUvBzTfelkXo0TBTLPQY64N/HAfnWbS6WuVYSLIuDwnD81TVLrMYIaxZ7yrhN0qN+BXuL0pD0UNWsQmvS5HSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtRPsBVgFdzieBFOmWdXcMXFVALlXsNgb6hOUUNiRB8IkOScLn
	RkR0nXransBxJ+V7bZe5OQaVcrXMAdTiBysi7blV4y0PTSAgYJu0OMDwtYPEEdOi67lV3DpwaHa
	3UXINhg==
X-Received: from pjpr9.prod.google.com ([2002:a17:90a:a089:b0:3ac:a379:dc7c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b47:b0:3ac:77c8:ac29
 with SMTP id 98e67ed59e1d1-3ad86cd5f20mr4685879a91.15.1792695931855; Thu, 22
 Oct 2026 12:05:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 12:05:28 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022190530.541789-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: VMX: Clear vmx->fail on exit to userspace
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot@google.com
Content-Type: text/plain; charset="UTF-8"

Clear vmx->fail before exiting to userspace to report a failed VM-Entry to
fix a splat triggered by syzkaller where the stale vmx->fail confuses the
force nested VM-Exit flow.  Found on a Google-internal kernel, but the
reproducer (will attach) works on upstream (but only on CPUs without CET,
because it generates a VM-Fail by injecting #UD with an error code).

Sean Christopherson (2):
  KVM: VMX: Clear vmx->fail before exiting to userspace on failed
    VM-Enter
  KVM: VMX: Dedup VM-Enter error handling for VM-Fail and VM-Exit

 arch/x86/kvm/vmx/vmx.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)


base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.257.gf7497c7d27-goog

