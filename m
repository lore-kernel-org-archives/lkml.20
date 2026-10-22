Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702901;
	b=M0HL/eK1nCbqv8lG7Y/jNL+XhUSclVHUOmRiRh3FOZ9fvbl2asXjF7+XW+gB4htkj9Og
	 RKRpjDOlLjcgElt74CBRgrAsZz7PuxQBxqdzeOrf/TUDkL9fbM0jjR0v79plevKC7nz2I
	 KBLFzq49qbKV2VU9KOEgInfLjK/IrGbyteJFdF/v+fm6z5a7iRxGoLNmElUtvee4whgYA
	 U3u7sUKFhngR0d+LF8M5+UbEE8oHOUFZN+1fIub/8hV+4syg+4v7MpdR//FzBG5q2s045
	 I2Ofl3WdVRdHy0eBCZtIIjSmU9MyXbQxtFghTi6pjn/rg+DoUgaic/28m/O+NU/UGRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=7uJDCwCkysKuVFqnR+oL0K2mJJYjE4p2eqvTotGVZOQ=;
	b=KrGPPeJ19ms9fjVyPBZgZfWuRjp46IPKJz+R67gkKyA1kbEeE9gAtq8Gg6lHEICrCxqo
	 8Y+9rvQR7nRcCzkmjqmC3UE1Tb5kgRfUC1570PhV/TUajreHMgLG3vMusHVQwlmLCsjV+
	 8Bzc9EjaMN28KsE5oPiuR4QU3jqFk1eVCTOsZPzJpPj+dTY9dcvlfeINBenueJQdHdpE0
	 FGJTxlEtR0XaJYyO4EStjsoyGNblOnA1Q/kYLAe993nQwrj9EV6pj8Ea4+BlMST5hwzg6
	 CS80bYjUMt1Fpa99miVnowou5Br2K3aWoj/UMlv+NmUlfS+J3r9utubmWLvNPF754lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="XV/ysb8p";
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63804606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63804606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XV/ysb8p
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so193898b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702901; x=1793307701; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7uJDCwCkysKuVFqnR+oL0K2mJJYjE4p2eqvTotGVZOQ=;
        b=XV/ysb8pfPHharbiARoQQlq8ZqXMfi8kP/4QuAbepg/9ffXoj8Nv74DkHuu28x0HQR
         AlyvMWihII72yockngArcqqY75VOv0e6PubevFPp16wjdiIjBH2Q1focyeq74Bn8XHBj
         O8JpN7jzjxq78WqkGQNYcG8Lbq0Zmm3+7www3jNdEBE4axAsvYuAKw6SP1H35DyWkj4F
         941PwVZsPCcRBtrsS0t/BJuEkXXC6lXB5NMtqv3dewx66pYrtriopkn8r3UzEnXVjOdW
         bSii2VK5dJEqFVaZmI4rFPLGePLkj913eMzvIZ9PF0NS6Bqru/xzbyg3kZUG6PhIUrNU
         ft1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702901; x=1793307701;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7uJDCwCkysKuVFqnR+oL0K2mJJYjE4p2eqvTotGVZOQ=;
        b=UvkhtKn/3muqBGYhSQ8m1u/d3ENdItugfxp3AbcfOUXOmXSOoeRhqS/ZXZzatPkdzO
         ZJ5+uQXznuwp0f0Scy0LNWhJc31N4SlNsfmdVSruDOX+S8BvvYBmWxvaFJrF/deGGgIP
         s8au7uJvybLJowBLkkMCpdfTqgHCjO7ZTW5CooyX7hDCdNx74hda2OSha8moxHPPrusX
         4k7+O5SdbmWW/o72GXFELfyseajt+fxw/pr5elcwRH3VFaBq61B9FDwPFKz8ApPQz+AW
         BDYXYiY+/5hmmhpFIL7sYTH56BrLswoxI1TABXnFyDOyWjmd8N1b/NJxTTSlMKCw6gGz
         45YA==
X-Forwarded-Encrypted: i=1; AKwUvBzcEiHeWsf65WFlIW9xpAgRLHUwNzv1bJU3cgmpYg98D3qVduM+DdBJMEwaW86P4O1cg3taFUIWCYqHF+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQp1mIYFvLvWbgHkVU+0SacCp/LLpz4kw+/VBfzY3NByk17cPd
	tcI2xOeH3CoF/AkFW5QD6GVYtWvGKCb+oaBtJg6ybcG1ssj5SvSSxzRGZNNfcFxPdbmz/TQ3tWN
	7ZEAJVA==
X-Received: from pfbii5.prod.google.com ([2002:a05:6a00:8c85:b0:8a0:4085:d831])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:174c:b0:878:34d7:699a
 with SMTP id d2e1a72fcca58-8a2c76598d3mr228889b3a.42.1792702900543; Thu, 22
 Oct 2026 14:01:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:32 -0700
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-2-seanjc@google.com>
Subject: [PATCH v2 1/3] x86/cpuid: Mark CPUID function 0x23 as being indexed
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add function 0x23 to the set of CPUID functions that are indexed, as per
the SDM and the many sub-leafs defined in leaf_types.h.

Reported-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Closes: https://lore.kernel.org/all/213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/cpuid/api.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82eddfa2347b..25b22b173f2a 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -181,6 +181,7 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 	case 0x1d:
 	case 0x1e:
 	case 0x1f:
+	case 0x23:
 	case 0x24:
 	case 0x8000001d:
 		return true;
-- 
2.56.0.257.gf7497c7d27-goog

