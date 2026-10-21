Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556771;
	b=Zd8wZjq15czPZgvyOg4N06l4EBAmPKd9AhFkMJLrVcMSYuiTm7W4viGe0+5bh/eoeVGK
	 e2P6sJ2X847Rfd7XcaW/0tNDkMGPqHLinlB4njOLDOdN9CWst/Q0z2y7k/yXtljNCMyRg
	 HxDauOM7Iu46jRDucxxPPzt195djfFpLOsLMKKUIN4wLpJAbvehsJjtF9DTal67yWTj7f
	 sdKkErtQOgMtZnFhpDHADbjbF3sReAPbV8FxxshC5JGDzoWoO2JOaX03J7ykF8AZXSjw4
	 GXC1nmHesHJH8qhkHq1RRJAGlVUSKNfNicrlz8ZZwKvIlLgQpE7P31Xs/GRDccFJoSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=trCcIHaGJhYY0kngjCd9MduQGGuEpJETEp7g5qevHEU=;
	b=GrTsRmWKFcPzv4L2EvC2g/a8ydatiDa5yt7E3mrd7TnrEsSuWjrn89UWkmTivrBvie9c
	 fVh05G5yWgrz9W3+c2qyry4+Nd1+EAoRry2ozcrZ91DlQ4bXrM0cYM4Y0eDTpXdnNAD9x
	 nd8WxO0CRCP7hmwDi5aXtv6RGYAD0B7djrTjn+S7/1m5bMJmV14vqqtws4N7ruERl0fz+
	 AI3M+khm1yxw4XGxSsNu3AUu75ZnT87reKv93Za/ve7CmqnHaCXq8ICqO+QOTDfZHjg2p
	 bmQS3vQ/26ZxgpgUIWvrKAh6QnT1Eji+Y11kFlFwObTf2tOkxjkKQWtYEz7lpNLf9Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="iOfgR/iS";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDCA606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDCA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iOfgR/iS
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e95bd1c14cso2434025ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792556770; x=1793161570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trCcIHaGJhYY0kngjCd9MduQGGuEpJETEp7g5qevHEU=;
        b=iOfgR/iSZDAAhqlXu0CirpwJTS9iEmx6hFp3LO/OXEaL9g1MMR7irBvyrk8nDrNA7W
         88+AkfQoKhDa+Kb50PacB9CpR11ACD/dxJ7NIFpqVY7PzGvkSOR0CH9DzhVrXAO7KQgp
         GG4g48zbMtRm7Qx5E/SuliRcQB8WKkPSn5q2REEb5tF8FUwNaU9qM+6roCzT7qqGX0+F
         J4KWNd7EFYQaTUDhv22805eis4FoXymMGWX2pfx8HjT2D9MDJGFkvoncluvHYEO/xQMW
         e0mIKMaBf1tXIzLkmpRVDy6TIMfvmQQqOu0ksYBdWzTijlR+akdvgjMliC7x/D19BIsM
         Ty0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792556770; x=1793161570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trCcIHaGJhYY0kngjCd9MduQGGuEpJETEp7g5qevHEU=;
        b=V+r22PdNrohgQNwwm5uswvaCszb9+RLGJ86NRMsa5frUT3MBuryiRIgMq/Lya1803L
         XT3hQgGYJWH4TdjtiLqXoYvroZANcGKL3amwg75UNpEToeC7SNhIupVXvEYa8aGzZDYx
         poiEh2NJJ5/LswW0Ip3hjwBUx1GIxRhh4jgWCI9yNQtdoSQgWt4gKNdGjmc/KpsyThG3
         aVBZD54OXM0v5GVXEaDUG5kMMddcgaLKBjghT94dPifaRU75zKap+ZU9JUW2CYnrLw5T
         pWGh9xwFnJAPnD8BOSgaqcRU893dMPmjNU21Nei+I+V6Li+l9+832SSkaRgxTdwpU1i1
         Vayg==
X-Forwarded-Encrypted: i=1; AKwUvBznbMsu+lAEjsOijitVLaej4znbknZ6TjsE3Bh1ppBoNYgleu5BQwFEkG/Q/BqM3Z9CXOZZut3ZyeUg+Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3x1KrHOtQjuch8nV6rUMIQMHQcFRDoaEpSEV2w1674TvrTx3Z
	vlBZMLnbfA4FM6ZqxGUTwSy9TIUUDDUvKB6JuxghqK3MdUZcfukgRqfk
X-Gm-Gg: AYBFou0y0EI8pGPXhwUAHAqlzI+STsu/YDKlzn1y3g7gesV2cxlfBvNi4vtExRejSDg
	brWh+YlVLxXFJPOHrjJ3I62mxT0PZaAOqJML+aWyNvtINGl431Do3P/Ld6elpuXvr1v5dPGIumD
	Ea8p2cQPRqe7zll7PugOe4e0UF2d0GgpsUFvcJEQxI0xhP/GOHE3PsWQnXR4eOjAcSU6JS+Yj7e
	ULtVFlceDHqLWuwA9IKGuqBPP1UEfi1GGiUZkLqpdilxP6zhVXhVJVOPmYoXA1vacI4nxed3D06
	VXY5xUB8gkqoBzqJJbY5fF0h8q0y4t4hDZTrpU1XK01VRPvPQvxNqoT1poMcmHWvpmRQVWAhmdu
	iCCrMiK/yA7i9lmxMGVTtSR6J1wwiqMC21MOHkIHu5wm6Ny4ew9vyjDqLtXN+L74CxpKTKmyqs/
	Pqk94xgV2hoCRhqbcLQU3KN59Tny669Wcay/29vdTg6qQDaCvGptpPvFngNUEkgsOaVBCaAeKKV
	opvnjmcnMtvAss7lpB6fB2vttL9/4LqFFO2ipjcnnlAGwFXn8VDVtxwk+Jj4buea88uXJYc8Bs0
	fqvXxv71/liIHaUAlhcLo+boELJPXS4Y0vk62Kfk9duSi2VWJlw=
X-Received: by 2002:a17:90b:3b44:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3ad8709a59cmr981618a91.53.1792556770623;
        Tue, 20 Oct 2026 21:26:10 -0700 (PDT)
Received: from monk.. (border-p14.nat.sfu.ca. [192.75.244.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80219f83sm2355155a91.6.2026.10.20.21.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:26:10 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH 1/2] KVM: nVMX: Don't clobber VM-Entry instruction length when saving soft INTn
Date: Tue, 20 Oct 2026 21:26:02 -0700
Message-ID: <20261021042603.608292-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021042603.608292-1-ma.mandourr@gmail.com>
References: <20261021042603.608292-1-ma.mandourr@gmail.com>
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

When a VM-Exit from L2 occurs while vectoring a software interrupt, write
the instruction length to vmcs12's VM-Exit instruction length field, as is
done for software exceptions, not to the VM-Entry instruction length field,
which belongs to L1.

Found with a differential testing harness for VMX isolation.

Fixes: 5f3d5799974b ("KVM: nVMX: Rework event injection and recovery")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f854c..302f5b5aa582 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4016,7 +4016,7 @@ static void vmcs12_save_pending_event(struct kvm_vcpu *vcpu,
 
 		if (vcpu->arch.interrupt.soft) {
 			idt_vectoring |= INTR_TYPE_SOFT_INTR;
-			vmcs12->vm_entry_instruction_len =
+			vmcs12->vm_exit_instruction_len =
 				vcpu->arch.event_exit_inst_len;
 		} else
 			idt_vectoring |= INTR_TYPE_EXT_INTR;
-- 
2.43.0

