Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715841;
	b=W2YSp4S/yow/2jNC25ogu5+inebJoPUCs8kzQEnFsjeLCZR/PtsB+VIs4v9FoZKlNwZY
	 WbZLLyu4CSvGbMZhOK/wMSTpDsO2sQ3epFkoeSKQBUsfCMS2tBLSJx5+dJTX5Dd0BCwLQ
	 MPFZu1zYVBLmwG09IZ0eF3go3Axc2U6HId7yvmqEyW5cfjX77ogSlYRZlYS5vvYJr6klt
	 mN+h4imp7XNPSYk9AQTpZjL/KeZjCYs6GL9DV9vcqBEyMIE4kmme/+0KH/SDx0pWEP3Cu
	 zRH9qSexPbGD7ePa7HMxG3wYT+lnC5YXVwxJjz8/ZNoxIwqEXO3Km7q6by98vDa3Uxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qeq68Q+CJWiMtIHtxnnAZC5/gq7FwITJWmPi8p3IhTY=;
	b=Jlsq09ayTg8VWRn2w9EyXaDEzCvK8j3q3Pkzw6q4SOWRlF/Z866L1NztUBQ+sFoSI7p2
	 mJjKelFzWB3w/PUmLcmndYJ9pefECrpkCF418jg0pIHp+G+2dip9HlbWSr0MTuy4Foe5g
	 r4V8Leh23O5tlBO0cTAyz6Xy1eST9RfigMu4gjl1IyU6X7q/c3RrxgkGsYGIubwW6ylLK
	 pEgK4l54bgIID3xvXe0gzws/j2Snc3h2UZZac1SNpI6Tg0wRHpHhJ/vhVQ5gtB0tajOSS
	 7xD/moSLDRYClerOcovketwdHFRrLjK7gBd0z5s8z4EPu1tiZdb/0/s78Kwxv5CmR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SdOAjaja;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E172606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E172606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SdOAjaja
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so287261a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715840; x=1793320640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qeq68Q+CJWiMtIHtxnnAZC5/gq7FwITJWmPi8p3IhTY=;
        b=SdOAjajaplVPPBwB71aA1nIf3KSbB2lRyIewUEZjhub9eYlcYp9QJ2OOhzE8GwOzg6
         smD6BfYamd1Ir/oKrOkPyoB1efap1Iem9Yp5qkqsRLfOl6Aq2Umy3dnNfQgZLn0so6vX
         0BYuq/cmi6Da576GfuiXscF3YIXug2mxrad1Ya/RA1aPIR9aoxU0wiCNn5xI5ul2VNRh
         KvuTKEpXNf1c8gg1ReiA6GWmGM6NaqfMPj/LelmkS08FcXzx9EDKLCMk1pK243Yu9c8g
         znND1eRsmByOk8PMO0egZRqZf1isYbANkuj1Sj/3xF8Xeeh7twClubkW8rcdytvy2vOD
         fK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715840; x=1793320640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qeq68Q+CJWiMtIHtxnnAZC5/gq7FwITJWmPi8p3IhTY=;
        b=sKVvLk0mY0G4c2VeeY36Nm2TyqKrL0OxZ08ePj8lcZdhkxX56NAq3w4nsp+KjMpa7w
         Pp/CyZVEKcoV8GTTM8++F+5o9VZMH0TceZJaifVYuIqlSOBdnZgXaTidGNEkA7d58ZDE
         ZKvnSFHl82cE2Qri92ANy/YL0+VqvVXlsI5RFTo4nk+1kDR5MMN4qj3Tmc8ZiLGd7LTW
         sHLtEkcz4BBV6gPW3wPE1Ylialc6SB1b43+qU0a/orf7vuIVrT25mj6USrZYKQmzdtWJ
         3rqLyFM6fSBxcZGh0krjbPFhOYZfrn83KunRk2yhAU+LGPo6qxDDAiR1lXbN+CB98rJ0
         mK+A==
X-Forwarded-Encrypted: i=1; AKwUvBypyeoUHc6hiakQgl2ld+OILl7t0bdLNiYM7jqUyoDAVzanA3QN/Kl7Q2FSButLCkIlNOhLAVzXgF0zMCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/AGkEdrht+c7z0a+YpCLwSGTS3rNz3tAJnAnkjubygwCjdS7P
	XeHJGe4Hbb7wqPE4IatrIHutqUUowvPkDrKy/cwPavK8D9ZbKXwcfRBS
X-Gm-Gg: AYBFou1Kcr9588f8aif3uwrQYgelw9m9nT8f04QtrrMgk1u540bdutkkHlbykFiq5F0
	v8HfYW+OT/mVSjeqwZt0/hI+UMdNZ8Ipw9yp7xqutsG0mEzLu8mUC1DL2ljFE7lkwZHFwfkbKqb
	JPeUj68jVJOZIROFAB3qhFjTRsUiWwpPpNXZohJpGegl5kwykdxxLZSSVOEcCOfDPnLU8MtDJWk
	g909UTQsCyOEcDWmRVbycNkj2IqCRVUsWQvQW8wugx6Yrbs4DOOasfieIi2BhvRTtvyzr8sITej
	lNz6n4jAIjkHoU2XFmPjC2ERdBfXDRbUXR7kpsThKnaF9tsl2vqMEQ4z4p6V/4ninWDtwXMS2Qf
	5wtKl/lzdZ+7tKD9XW06y7gEufcS9m+Ye2KSawHn2vPmhBIRz8aA8ImIDyIu8coXWYs4zddPFj/
	P27atjkicnZD4PDct4HcS3HGzTfm0hllqFaQ38PGm6otgfhXJNIwP5QwYEBllABJM5Bu7FOy0zT
	Eq5YCE/28owb+Q8Bw8URou8Ttjv9VyZdK33UNJwdxS1XQltUDvdNKNad09D2/ewr1Gem3X+PSJy
	BouRmAeuVFm5FR23ED249VwYPwM+nwJ6fimMNzFay6HmxjBtxB4zfxtcEga5PdsTqQXmuWuf4zq
	C3cV3KXDEqn4c
X-Received: by 2002:a17:90b:2281:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3adce02ec73mr376652a91.21.1792715839853;
        Thu, 22 Oct 2026 17:37:19 -0700 (PDT)
Received: from monk.wireless.sfu.ca (border-p1.nat.sfu.ca. [192.75.244.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a28f3sm964360a91.3.2026.10.22.17.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:37:19 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ma.mandourr@gmail.com
Subject: [PATCH v2 2/3] KVM: nVMX: Don't clobber VM-Entry instruction length when saving soft INTn
Date: Thu, 22 Oct 2026 17:37:02 -0700
Message-ID: <20261023003703.450577-3-ma.mandourr@gmail.com>
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

When a nested VM-Exit occurs while L2 is vectoring a software interrupt,
save the INTn's length in vmcs12's VM-Exit instruction length, as is
done for software exceptions, instead of VM-Entry instruction length.

Fixes: 5f3d5799974b ("KVM: nVMX: Rework event injection and recovery")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 6f7c00083beb..4286b0503046 100644
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

