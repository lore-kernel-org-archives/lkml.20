Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836DA3D891F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279262; cv=none; b=sMIJ9a0Q3Z+qDRvQ79o0wh5YQWyNq1j8Rg1JzXwNxWugGrqIE+tU2XXw6tv5EtpXgCX0Y93RlLD/u8eWTE/qdeBmNjhT3FTAet9G0rWHo1n5nrlGmV7u3fc3G7WSsE2iB0nboTPQxWMtNNIC1xQi4II95pwOnJX3odm/PjKy4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279262; c=relaxed/simple;
	bh=+V8uFO8KjUBEZ10FiDGjD6LAJ9EH5zGBb8kX+VfCtOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mg09Hyuw8Pm3izvVV8fplQ4s0uUWMSc+PqaFY4Q5hhC01s86ASMfvNyqxoQXck3rr4g2+WEkKkfeJDDFDgl82se3jcVgOg8aDEJzZkP3rBUT/Ei1InDukfTj34HdpeBqmyM94o4O2pZm++++WrFHgA0Vc7ZADCRGaKOx/ngT4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=LDNmFn+v; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="LDNmFn+v"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so347875f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791279257; x=1791884057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jq4MvvelPJmLJTP64CCeQVSZLu/IREWVL/wvvlYXR5M=;
        b=LDNmFn+vPCgLAHGVEJ5RFSZOerw0K5YsVdDhGYeEEMnDdVbUHEoWvjiDevsA9m+kXY
         2Smgk0XLv2lLOEgn//z8ypMN5f4k+uEPK+6+oABKIuQ7LaWN0k6zKb9id5PsupUxeBBF
         EVc5jri1vpOfSJFAXf0Zear4Y/8gKQFeFa6ZmCJoH6pS5waZGuFzE1jH13QLRHBxN/Gb
         UF9hMpSijvL/dxWTXTb/Zf98ztlelOVbOEozgZU7PxykEwHNxDduRrrxxNHxJd8sJqty
         THmnl5q1FzkLG71LxZJXFH+BodhXeDXynEo3sDJ1xyaqlnLBPPUyvxYHx3/9hH3+ofaD
         l53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279257; x=1791884057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jq4MvvelPJmLJTP64CCeQVSZLu/IREWVL/wvvlYXR5M=;
        b=odoGaC6/zIQa/E2vcxJo8epza/Q1QxnKZoUUg6JHysn6lGPTAEOX+QicJ3Q8gHn4Rc
         IDT4uYLwgbxla4jpUtxY12SW3a6s1K7vtLLG5luDsRAbBnesNF3Deb8E5xnokbzow9vI
         pwU74LZpoeTdkLUMlknFSaWhGxPNAXodagZNs1xSaeck3MBkgyDyn+/PKDXGi+w3q9WX
         4sW6f34OfRVsfnfN95WAkdFZM+4ImSlUnOn1LwF5x8zTi9Bzn+FLXO+3OC20PjQQHZo+
         7Dq803V2h7yLj9Yifs2m8v2hk1AQrl/7vhrP2kAQqcsrZZZTPR6dIkl8ymUsQEg+dTAt
         mlDA==
X-Forwarded-Encrypted: i=1; AKwUvBwAW0jZBaw9muDHQUEeEbV99q+krFlk+Lt+Khiak2ckpTbpmOqKPfFzDrPI4DiJ22gfOqvk00StOdPVj8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLx28ZfXQQ48eDKBa8YacNJBLxvjZXBceEXV6wTHdtGVaRCIOO
	NAERkqSXanYhE7o3KQ6IH2T51PmSZ00fjWcEQSrFe3Wm8G6EZuork/QEYl3k3n5tfkg=
X-Gm-Gg: AYBFou2YDe3rRh+h+OqIc/Y1fIJVX8Pcq05MuatXDRgi+cmySBqgA+XBQPxO9pJTggH
	ChConFViakTIE1WBcvbiFriiBtvKedt/rjHrfx8nTd+yWVTG/MGA9B+uSGCKMIW+dCzk6ZvmxNX
	6b7XZ8PlgRIUZu9n8R/SWLaqR0dZWGftvUrCvUpJEweGddqazG6HC2io2aK845yw2UOQVWVasQR
	/+5MYxnMgHEZFO8LsQIQvaGeCElKAU99cVHGX7spIoDyo05SeW2uA/UwhpWUv3+zU5FhALCS4Mq
	wAatPZGSKRdkfgdlznlJN7EKBmRJ4mIztqoAL5pXt9jhbLER2vUiObTaqKAF0VsZ6gtjkqeoJvx
	iF16tzBcVFdVNm7jyC6svYsCv03rBezEPJ48RZdBEF8ji6gievuHVSXNaoxzC0anSrQWFNW/ryn
	qIvO1NTHY1tldWFaq9DI8IiWLw7jwp7N+Y0dmDW+pdTCcMPnIeD19p+4mOC6cgofLhcdyYHm3cU
	RAsX9x2Pw==
X-Received: by 2002:a05:6000:2210:b0:487:27f9:82c with SMTP id ffacd0b85a97d-48c6d19ba25mr1256715f8f.33.1791279256305;
        Tue, 06 Oct 2026 02:34:16 -0700 (PDT)
Received: from localhost ([2a02:168:9d56:1:9c5b:8aff:fed1:19b4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48c622b4685sm8853347f8f.41.2026.10.06.02.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:34:15 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org
Cc: kvm@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	Bruno Produit <bruno.produit@trailofbits.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: x86: Cancel PIT timer on failed creation
Date: Tue,  6 Oct 2026 11:33:54 +0200
Message-ID: <20261006093354.590415-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cancel the PIT hrtimer if PIT creation fails after registering the PIO
device.  This matches normal teardown and ensures the timer no longer
uses the PIT before its memory is freed.

KVM registers the PIT's PIO device before registering the optional dummy
speaker device.  If speaker registration fails, a vCPU can have already
programmed channel 0 and armed pit_state.timer through the published PIT
device.  When I/O bus registration became fallible, its cleanup did not
cancel the timer before freeing the PIT.

Fixes: 090b7aff2712 ("KVM: make io_bus interface more robust")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Reported-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---
Sean's proposal, feel free to change the FROM upstream
see https://lore.kernel.org/all/ar_PNEIvsQMQPMLg@google.com/
 
 arch/x86/kvm/i8254.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 1982b0077ddd..33d772c7160b 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -790,6 +790,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
 
 fail_register_speaker:
 	kvm_io_bus_unregister_dev(kvm, KVM_PIO_BUS, &pit->dev);
+	hrtimer_cancel(&pit->pit_state.timer);
 fail_register_pit:
 	mutex_unlock(&kvm->slots_lock);
 	kvm_pit_set_reinject(pit, false);
-- 
2.53.0
