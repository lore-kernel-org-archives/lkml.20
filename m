Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922478;
	b=1HKx0kE5UlQ7Sr4L722KiOcFpgCSI5Hq5nz/RCmoHTe3o5h/JS2GjMs7UccEfmiXl0oz
	 fAXbyVpIs3DkIoSrN+en47+QxIcQKzGaSP9w92YxQhsGkXneg+koeKBzt5Zh0dPDMrWTw
	 3QEOAtjm9kABupcY22x0RzeEU5ZxwvrIwPEynHGG387ehx56fYvSEWKaGK2gqmdQLvgK8
	 B8LI9fJ5zSFZsPFR8/3gdUs7R0FfFjxBV+aPPn5krkUxl+hsbuakeZd2UwXZvyZog5Uno
	 OPYNh3OU7t00PbV03VSs/3FKFYnJJq3qIwac60ZS3uTqXDuQvBa3CN+xhbbiVN7B2gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
	b=D9xvsyK5Wi4sMIwdnZAlX/bqKwDYRlClTefr8d1YGRMrpfiIaGc0h2Cbfk4ampg91Rfy
	 WBka0IGNoYHSrfsECb9tV4mtZf3IVTo1cobzFhAVQOZviVkpgtVblx6lGrpEwUBbWxkvo
	 BQT2zy7dwZfpbuZhmDGLvpltrFk9vsaYevM5SICIaeL8AuezQErxjb/0NnLYybIpg2SD7
	 gagzkwcFFnQtt0mEuc9ExfmHTkv2gzdzxTSukKkGkmsP8a13IGmasuiH+BhUqvJVZdW39
	 QwEvv1MVoVAEwZXEQ79lp6ZJHJX/HnOakxLMfiDfLL4kIFI68SnyTRGVlg1qRxHfLCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XFpuk1IN;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E326083614
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16E326083614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XFpuk1IN
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed1fbae872so1090585ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922477; x=1794527277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
        b=XFpuk1INIyNr9DTXOaKWM4+hiJ9BEGdyv4p15RHayywbwn1Gn2aIPoEw8k0Bu1h4Tr
         zPrtSM02ruMyVXNRg8pxPNbpOqKlozVgyS2zGC6eGRFpilwbewiJHo9ElT6giXQ5uQAv
         cGp3dDe40QNajA7P2g6AsCiftAomRAJMoHH7zVqmVLHCTXRv9RiHoG/mVobFbcK8VhKu
         tiXJwcoM0ntEMhoD7zuuh1m9marnwNtce+10cEtNbfkD93hpJ1nQTF+gaOPmqdDQHeY+
         b9MNYMAd2cI0Py66hoXcFVGKVBvRFLtlZ91mCKww/e8egkRmOxSP3uHiZSXCxvPDDOis
         R+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922477; x=1794527277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
        b=dmhLmVAK1X/bRypu18q/mR1Tcfhv0O++xlOUJct0jiNCgOAKPkCRg6QJW6s4ElyGxD
         1dkYIJVKYYM5YjzdBMWM70amXiTLj0dl0CejYEiu752AgCD9Qqc+E1KLNTMKkRcAfdei
         loqql7I24XvYJdOIHNLkza9czDEiGzE9YOX7zJK34ZSoTsZI9aKU5KnniZcCOQELfQP5
         7OlgAVYMmT5UkVNMdAe/e6l8G2+j4lWEZyiXE9rnOz9X8xpCehoet94IHUPomlGyLDx/
         WBJ69+rUZ83KcB8hrgEgMnJD5Mpmos7DEKlvxWFAaTanoLdl1Chs2eXdXPclOea6/rSL
         sY5w==
X-Forwarded-Encrypted: i=1; AKwUvBwGdQeliuQrJp79g1A6POl2/8VT+J8ABIPQaQfPNsAdOWfno5k5hCixqiLGl9YeMT7bdl1Rz4/f4z+skhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X5G0RIIfqVkidsMqXVuIoOQcm3S1ClAF5iPXhWSGXKwsGSu2G
	tY4faz0DGNVcH9TnKYYx9k+FODlBeQT5Tw5Nr0q1e384O02kFecxGuXDoJRd9qd/lQYtOWuktmK
	c7OORQA==
X-Received: from plic13.prod.google.com ([2002:a17:903:370d:b0:2eb:153c:2391])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d05:b0:2ec:ed58:2062
 with SMTP id d9443c01a7336-2ed4197e542mr11947205ad.35.1793922477243; Thu, 05
 Nov 2026 15:47:57 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:00 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1655;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=eAuK6mynjXU4g9scBsf8osxDUNluz16TtjfwP534Mqw=; b=fuDGD8mFk2kezyisI0w6vD9nLF5EHCz8DYL5IKWXrWQlJD+wmgeWQ+Y1ZGY0oFpDoZ71oILr3
 SeqLs8WgWFBAZOWuMvl9z1pOG4vWv/UANcVEKdCrJXru2JQpc/g3Wzv
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
Subject: [PATCH v16 16/20] KVM: selftests: Load private memory and finalize
 TDX VM in kvm_arch_vm_finalize_vcpus()
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Initialize TDX private memory and finalize the TDX VM after VM and VCPU
creation.

Hook tdx_load_private_memory() and tdx_vm_finalize() into
kvm_arch_vm_finalize_vcpus() to avoid the need for every TDX selftest to
manually load initial private memory and finalize the VM. While this
prevents TDX selftests that use vm_create() helpers from customizing
memory before it is locked, no current selftests require this.

In TDX, finalization is a mandatory step to make the TD runnable. It
also finalizes the MRTD of the VM's initial memory and state, locking
them in for future attestation and preventing any further modifications.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 11db6a3b0366..ee8a1715d844 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1503,6 +1503,14 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
+void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
+{
+	if (is_tdx_vm(vm)) {
+		tdx_load_private_memory(vm);
+		tdx_vm_finalize(vm);
+	}
+}
+
 void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {

-- 
2.56.0.455.g6c5a503b38-goog

