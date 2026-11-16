Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868246;
	b=D+pFAtUj7uxEVgc7/5kMRhPsKC3KlljztB22bRX7BF5BDO7gWIdLYSryouv8I7upSoOe
	 5++S/1EJjA3LhdTkZXKmeubwGhC2lRfujUKi0yX5Lh+qMXpP0XZNw1iuw/SJFGaj4aWmE
	 LKKUL5QMg+p9fIPcnnYBPg3kS1pr2DqZ4b3Z4OilXtArBJurZ5dpJgGxYX79SlSn6+7tq
	 a67Wu7oHqjtd6ACHGHXc2og+LOwQ568ENChFOIZvixsiMEtbzqqJjdyy9Kt33+B09S7Pe
	 VCRhvpzYj3v9oCst5uyVrWE0rAQAXXz/b1t1zBl2SOFR/f8adD/MqnMmPT0dpGP8Wfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0NeepTMHSBHD8uMS1QlFPBjDgl/bEPnqXOkPsb5thzw=;
	b=jmFAohLjF0/HOsDNodTyvFocUJRnyzAM0IW22kUJs+LFGAuLdUttMXD2NiTW0DdpBSl8
	 iLUEF7XV5QcvCHcD2mHSNBW+97wyh+XsRm7l5kFTBqUEiU1ieVK7P+0X0PT48wb15Xwm7
	 +P7fF8ouFBR2R/4qrUCKWcKHJ9Fb9gXiit4zkDjQsUcCc/7qgn3zzmKANohNHmM99Jw5f
	 tvoVS41ERsNCbi1Q6X9/09JO8MWG8FgTsvx2q99iOxGIZkOahta/8+mKLjjjXO/duB+r8
	 pn+Ll4i/qcc1sn/TpWQ10JBkJTaMBQI8+ocjuHNfbGFocQVTSuF9yGbj4KtmP5UyCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gr1IGMUr;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E72606A89A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E72606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gr1IGMUr
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1668938a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868239; x=1795473039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NeepTMHSBHD8uMS1QlFPBjDgl/bEPnqXOkPsb5thzw=;
        b=Gr1IGMUroQDX0bAcGHB4MVIIwx4BwI73Uc2wG9+vEd9W3f0S4eb8fAhakXZKbGu4x4
         KyKnfyVT5U5K2lozfCe0gxLeAjujKskrf178l+R+HEY6Us3ZOuDNJd/NB6Nqo32IAmN9
         II9Cpj7gKKA8emHVYWWw2gT2FYLgjZ96Qv6zM/Ijo8ME0vjYd5pFUZ6yJ33qnZ2Xum2V
         y1SfMDNAtitep7PSZ5V/bda1c9BFel978sZKWvPeijcc410+CStgIzVcWZrXUnLk63x3
         uhOUe0OX6mxYD+83n3ylih3AIGVU7vsT+t6RwefpylYqcBQmAi7hFQcs8ccnsflVYMcK
         1cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868239; x=1795473039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0NeepTMHSBHD8uMS1QlFPBjDgl/bEPnqXOkPsb5thzw=;
        b=NltKOSszl2+lltlgBGTnj21NfoYCNLLwbTefCeDUt4LLoFCNjs6eDfz0olXBKB9Ot6
         fIDtVLeDCdJzliwb52kCaMNUdyaM+WkPC1w0GFHL6DbRI8tv1iIx4pn/8ocfe3cGFEe/
         kUzP2RRutoV/NXMX3Px7M01hIxqy8OUgIjkwtsYr7RdZDP9zrd+GwbciffMYVAoHltzf
         SgYY2QUpOxPn627B+tSqGkOh3yMAJ9bhs8KiMdRA3/KkyDf2uUWh2qcgQ+LZoS3fotB3
         0gOz+rRi36GLXWMQEtitZgjEUy87EZIvkTcUoBF/L8KvDgLIj3/h/hVIuuV0wI3Lz0uZ
         Zi0A==
X-Forwarded-Encrypted: i=1; AL+hErHYHwQzz+/Qa2A26MvKeXTUZzKyUAYOup+rWHu6rFY56+tpkEQwqxmUNfpRP2B8mq8H229hdb0CLlm0ipU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MLKvyvbzfGf5DUjZQeZgzYPIiuZ4gGASSNoUhvnbJrq4aVxYs
	ifcdfV23fRTR8cNVG1CKCCvt1R0kyjfQlr5ucp4zEtyZf96SjQUIJSMQK3LSCQ==
X-Gm-Gg: AZFdTZdUlmYaZSdqhj60K7UQ2sncY02uSuQg287bDV06F82L0l9LoK7CtoAc2RSky4O
	tjcs+ZbyS2R2sUCrpQEnkelAo5IL5Kbn/7Fx5bBxlnrQlYcwpgwCtVQG9+HNHzZfZAKg39p1PpX
	/UCLD86/pKNnwf9CHa7RD8g9FQtTtTvLetm1u/Pti5g7PeW2Rs8Q1lDwaBR0IU0q/LIG37jwyQG
	AJpSU+i/GlUziw+CDsY9jmS5Md6Q3N3clMJR4mxXMzi/AahhUFWVEMc1D3Z1VgZy9UjBJdG5Z9Z
	2ryVOxUlGlONN1iJ3aLHLvtAL9Wp8cQVO6vk6J/90/CkZzWhwmOc8GGLTzzmH1Czu1VMBkREjte
	fCNHcd802N6iBIE3N1OhERgmjWskDxLPWj4KXR8ut+xB4XUnij6625rRKZRl4dclxpWadeuH1D9
	CS00VjiXo4CHD7X0G2CNZImLPgUycrB5Eqe7eeXIRRgJS7ZSNEws/eys/rmAEOzn3d90G52pkpD
	WfDUG3baGm9opPLCLVt8ptawhA1B2MYk79LBrHqGfS1FxjVZMEEfx9M/ZaznZvFbNlnFhzEHzQa
	p4TvKpFmZPOvl/77UsZplwQ6TMIrTl6hfXnvTAQAVehIvWQDayzd7PJAaHvw7QfTQ0qSM8C88hT
	dINjw1qP9at//xlIJUusavb1RAldWV8l8mFqlH+SJHQ1xaj4q75YD62THMcEY86pZQZ3adZlDaS
	oWXcfl3+ZA1WY=
X-Received: by 2002:a17:90b:440b:b0:3ac:adce:60a8 with SMTP id 98e67ed59e1d1-3b1b07ef8bbmr10811519a91.5.1794868238728;
        Mon, 16 Nov 2026 14:30:38 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca. [142.58.10.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm944375a91.5.2026.11.16.14.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:30:38 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v3 1/3] KVM: nVMX: Fill VM-Exit instruction length before saving pending event
Date: Mon, 16 Nov 2026 14:30:31 -0800
Message-Id: <20261116223033.3866283-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116223033.3866283-1-ma.mandourr@gmail.com>
References: <20261116223033.3866283-1-ma.mandourr@gmail.com>
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
index 1a98f28651..e8cc0fb308 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4741,6 +4741,9 @@ static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 		 * instead of reading the real value. */
 		vmcs12->vm_entry_intr_info_field &= ~INTR_INFO_VALID_MASK;
 
+		/* vmcs12_save_pending_event() may override this. */
+		vmcs12->vm_exit_instruction_len = exit_insn_len;
+
 		/*
 		 * Transfer the event that L0 or L1 may wanted to inject into
 		 * L2 to IDT_VECTORING_INFO_FIELD.
@@ -4749,7 +4752,6 @@ static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 					  vm_exit_reason, exit_intr_info);
 
 		vmcs12->vm_exit_intr_info = exit_intr_info;
-		vmcs12->vm_exit_instruction_len = exit_insn_len;
 		vmcs12->vmx_instruction_info = vmcs_read32(VMX_INSTRUCTION_INFO);
 
 		/*
-- 
2.25.1

