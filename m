Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715841;
	b=FqcIFapMWhmaepG5ostFaFeutyqMgXFz+11TFmGLTyYWp4NiXFo6/pnb3nYWKEjshsSa
	 F7dmUtV0uTbwUqvcF+UjZ9k0k+9IfuK0j1GDFR4GPHFvjyHy9Q3JhIOSN/UHJIbWXTVkS
	 ZP4n8fkp08B/jK5TrdW//DeNayoZQP9zbT5wNZ7g521ZwvsxZqcWxo9qOeSVHMaRzgcM5
	 4Uwr6VYDv4Wb//e0/1iGAksXn2RVM1dj2579MjLRJF1uw0xxZKugeEx7AyNzRWnFOFx00
	 ALBwSTu5a9hnd0oPRzuNp/tKxl+P3ByTrlaaaDsVs2kClTyhm+1FfBO/2tPKKO62RUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YVFoARRyDhWwCcbd94jHo7cx2P86k2KOzjvIxa+ATEE=;
	b=UdgTCKeCjIZE76wcgf3IjItgmwMVBILh5Pi8PccjeX+saVjHBpMooMBu8q/Vjz+wa0C+
	 hTak7SXFssgrYU1ek8TAVVoGmKL5Zdv8M+xqLJ3mOzBsEZzDRClIEpAOAAEKJmSSdsgDj
	 JhZE8jPGM43OhVUD4v3Q1GcfPAFlj6I0840DIWGzkvnYH9DZTI3DbKh3pW9AJr9sqs6XS
	 d2tyNb5XD0Cl2cFnhkeMdqUJeazOjZ1A8D3015iyXw0279Zr4ThGlPbTjjC7xJJo4GP1Q
	 yklqW5i729AmMqIvbgBZiopliXuG+Tl1jVcgVgIIXvGMRkUWDFGmYNaBfSkCymWBWeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LjfOx0RY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009A2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LjfOx0RY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e985106c0cso2396605ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715840; x=1793320640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVFoARRyDhWwCcbd94jHo7cx2P86k2KOzjvIxa+ATEE=;
        b=LjfOx0RY6nzvohY17V4qx6pTgelLdrZfXpySoTk5b6OrVV6t5b5Lj8HBwFvyE1gSxu
         4XN+NGGw4p8uYMZDvFbR2amjRjnG+CmwwNPohSteERFxSOmyRVzwPOOIfsvVKJRhtHed
         aBHqTRthBCpoDWPNtHV04t+g203RqNUOEFDtBmOhVWPfu0cxzMJv1LhZrg5hJ3FB1WCB
         6TVYKY5fYlBknl9kj7rHRw9rrf9piZYyQcVrD5vFDrgJxY/A2R4HqY4n+pB9ZtBTGAhY
         6YE2z/Lcjdl3y5lwlIzWTgrzJ4xWMSPOeChOQZTbIEchKanMlcxZgi8ofpUMoOT1fq2t
         CuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715840; x=1793320640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVFoARRyDhWwCcbd94jHo7cx2P86k2KOzjvIxa+ATEE=;
        b=c4TSU5wcu0GAVrnyd07ZLRrfX+0AuK16cSc+OCOFpOnF+T2p9AXA8tELAz0Wcqpsxn
         SWz6CqAIDrvFFBfZRx72t+gtGlCN6hrXL0/KrwUmjdeaNvLXu3UTu9VG5mHU2uy4EFGG
         PktyXQvS327br5kWdhHEcfEIiHSVPX/ZWJfXu+zxl62uaR2KTCAEn12EL0fSiDE+G3ap
         NCK3EV0c8aaz2FiVbcueR0xAGDURdAJDapZE8qxzyGRPoAT/NO0CYsyhqaGfTBHxJNQA
         pQg3cVE03T5vICOQCnPZRnJekhpyknKWOatYTsYG79vvO96u+oz5BOYVlGE/f6qvmQvp
         coNw==
X-Forwarded-Encrypted: i=1; AKwUvBxgzxQTffny3FIGLC+6ut7og9HTlvjGkipi3Y3MDnTBDh7qx9A+R0n2yj1sRfVcRonTCfzegUKmZoR1PMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK+RyQuC1j2bj+uHVjoSUwvXDFkBvRKTcaUABaW3bxn/tMidwA
	lJSUC7l+jNDjuNH6mO8+/BkM7BYehrP2a4W1swyI0vm8CJlXV4sHi27ryTFVXw==
X-Gm-Gg: AYBFou2hxKbBEs2X3F3Vyifj/o0Z76voH3DevKsLKeQ4bSPblmwHDD32QxSnfIXVhOM
	/WIgcxYlGH7UDVt4j1Hz24Ao7E1kiQ9L6qAH1FydOgxE5Wv5Spkqe5WDbix4JvxEwubdnnneAjN
	UtWje90yYm7aBD3LZfQgJjpJVI5P6o1tY/o/QrIjg6thVLFzUC4aj9ZOWU/lghFrebctfS+KVqY
	epkqq/mQ5VryzyZGcJOLu6eXjJq/oL33SerlNgaPWEFQOnaUNcPJt/cJ4XMy6iNMF87cQqZxZUu
	Fe4ljBnNagaAqH4uKJWdIpu4qMC10ThTfE6AVLPQyDmNMRnWTFV3/63JR1zUgOtMwIKl7ITjIjO
	c8vF69oHoHw3B+Ts0KfOJ5+R3J2+7mWR/I1g7WKdgcLBzXPO5AA3cFYj8OuGvKUpRnSYUTUPunV
	OG1QjPRyTF+ipqlEbs/CfAkDYuK1IeUr8pXhjkss/hky8OnxzfXvwC63V3By3e9l7OMiaraCs1G
	S9WN04fqx4SrtzV4EWCddZ6SifRKm/no2K5ur0AvgH07Tdpex4aw1APUJP3+cf8icUWxw8I0v0y
	aaLgeru3P/9FHp7ynDTpiqmZSb5b4NSxVXMl4JPLVaCmYjr5+0XlXITo2+ZXjv0aoP+m4AqkFOk
	6UjWIkoHSTpZl
X-Received: by 2002:a17:90b:1fcf:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3adce7a7ab4mr421783a91.21.1792715839221;
        Thu, 22 Oct 2026 17:37:19 -0700 (PDT)
Received: from monk.wireless.sfu.ca (border-p1.nat.sfu.ca. [192.75.244.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a28f3sm964360a91.3.2026.10.22.17.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:37:18 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ma.mandourr@gmail.com
Subject: [PATCH v2 1/3] KVM: nVMX: Fill VM-Exit instruction length before saving pending event
Date: Thu, 22 Oct 2026 17:37:01 -0700
Message-ID: <20261023003703.450577-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023003703.450577-1-ma.mandourr@gmail.com>
References: <20261023003703.450577-1-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

Fill vmcs12's VM-Exit instruction length before calling
vmcs12_save_pending_event(), so that the length it saves for a software
exception isn't overwritten.  Commit c3634d25fbee ("KVM: nVMX: Leave most
VM-Exit info fields unmodified on failed VM-Entry") moved the assignment
after the call.

L1 sees no difference since both lengths are read from vmcs02's VM-Exit
instruction length.

Link: https://lore.kernel.org/all/sashiko-outbox-179791@kernel.org
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 arch/x86/kvm/vmx/nested.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f854c..6f7c00083beb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4764,6 +4764,9 @@ static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 		 * instead of reading the real value. */
 		vmcs12->vm_entry_intr_info_field &= ~INTR_INFO_VALID_MASK;
 
+		/* vmcs12_save_pending_event() may override this. */
+		vmcs12->vm_exit_instruction_len = exit_insn_len;
+
 		/*
 		 * Transfer the event that L0 or L1 may wanted to inject into
 		 * L2 to IDT_VECTORING_INFO_FIELD.
@@ -4772,7 +4775,6 @@ static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 					  vm_exit_reason, exit_intr_info);
 
 		vmcs12->vm_exit_intr_info = exit_intr_info;
-		vmcs12->vm_exit_instruction_len = exit_insn_len;
 		vmcs12->vmx_instruction_info = vmcs_read32(VMX_INSTRUCTION_INFO);
 
 		/*
-- 
2.43.0

