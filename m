Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258522;
	b=mEHdUvPOdlwSUGOnk+B9LDWOPIQFosTCJUpDCelUlS8uJhdY7hT7tFeqPSwVkex1jvxm
	 F072qLchcDWEHF/vyiUGGZXcBSYNgbw6DjDQTS/+NSBqTtyjx3re2T69engGV+CmazlGf
	 b56kS+ivmA6rIh8QYG28KwVycMcUUQ0qaGs/B4RIA0D446tXF7ACq5qDEoxkmqbr9TUif
	 SmihGQq7c9JARx2/npFvU0lKk5UjZQyLupfCbD79C3idCg0G+zWO1k6GyQXFoBFW0KSp8
	 66a5lZ90yEB4QY6A6hurZWprvgisfqQcRT4qlFtLfLgjQvCeaDWp4H1VhXLBJKCKNIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UIqXWdO+I2nnx9qx72uMZxanfiXwOH1WEBujyHHbfZs=;
	b=MqFNB48sT83oFlaMofcCVWiojagMSyZ8sGDYJMxJUmA68tClXZRaWtAx+mdtAB+0SZNN
	 biUDGt/qllbMwxJIpaBGAhii8harX82yc97X+hBG2PQz0FujT6flZBE1cyIGdl/1PKfnO
	 c7J3y5yycZpRPnaHatPXr5zHgitgXgCoTzPbPWCUEpV8xZtPsd+aCEuXF1Nc2bnhSaTtQ
	 fKc9MEsDgZK7neaIkbnWGb+whVOUGEYRM1VzbddwRDVQIJ9gTiFUnI4Gt8WXEBA7vsVBF
	 vIFcmjuPUa04i47ms5wCI3q26nB8L04omRsIm/DSjK756PMB5ilLqchEpQ8Mj1J+YDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lWjqfcvB;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64760A3811
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E64760A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lWjqfcvB
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85f37d25fa3so1541236a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258521; x=1794863321; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIqXWdO+I2nnx9qx72uMZxanfiXwOH1WEBujyHHbfZs=;
        b=lWjqfcvB+NwV7IEX5ogn0d9ckzY/SOtCvh2zET96ApadV9rHMnOZtzXywlSlBRH2j5
         EI+EW86Ttpq6lMGXzr/YjCZteF0HBXNFZAJ4u61wn+iGm12uBicKhSszPh7dwnFIj1SZ
         Fdu0HIuiMogzn8OLqkGlJtNqtsXt/aoCIQ13CoK5lM5FdKYapSvsRtiKQK6pMUPbtFyP
         RPRyZckONjFxlBH5QlI+uexKugsxbWU+v2910JH+R3Zu0VZpjMTdbYZeaeimkG3nsmFu
         r/INJaWLo00z2XraCPfVs57xB9N551xSVA+Quh4c6nn85z/DhXPa1tvsodkeXA7dy/9k
         ZS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258521; x=1794863321;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIqXWdO+I2nnx9qx72uMZxanfiXwOH1WEBujyHHbfZs=;
        b=gLinGm0VgjrhmUYXy+u2o+QGsyV9Sgq0ISEqwyUMVWV5gqR1nyH3tag3nnWwqMtSgC
         GgZ9IuLb6uOcOqaOQ3OU+cLXnRJPk+7rhyGVf5A0XPnhCh09c9QrHXijkHeTfHTTqB0A
         9tcrVDqfTT42Ll/WAkoIcN+71+iHblk0aXlOyf8FX1QGAxmGUMiYBrEGWdpvgiB7EfRU
         GoUvqxoRwyIcSeh6rPBCUlKrV3n08bbhO5EvKKMInBZB6qSzSh+VcVub2rM9NixImZ9U
         jk59bs1+oYU05+dXmQuXoP0fCWQ8R4xnIWQ+8CSv8CMCrMaq64Sr/ufGN7zwdhPsylwf
         cK7Q==
X-Forwarded-Encrypted: i=1; AL+hErGo/KEGXzupMjuVVkqjKFN6d1itVLRjEY+MqfnnwdO2H1RjJ/ZYjltBnQJPoMdkNso3pBR1tPFvJkPzsQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oUWQ9pLqVXTwYvZJUc5gDjGERlM+9BZEgfBQUTH7KE84DoGrW
	vUvVD8uiM0LOXb6uE8Gm6FQFS5XnJKPSywQm2JmcWa2kDZ3kN6v/J3d0qk7rilHwVe5r5StmFNq
	2dxwUAqa566mpIQ==
X-Received: from iozz3.prod.google.com ([2002:a05:6602:43:b0:9c7:b2a6:b165])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:320d:b0:567:e971:200c with SMTP id 5614622812f47-5683cd15a02mr645575b6e.41.1794258521365;
 Mon, 09 Nov 2026 13:08:41 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:33 +0000
In-Reply-To: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109210833.1250548-6-dmatlack@google.com>
Subject: [PATCH v3 5/5] KVM: selftests: List the IOMMU modes in irq_test's
 help output
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

List the names of all known IOMMU modes, and of the IOMMU modes that are
available on the current system, in the help output for irq_test's -t
option.

The help output currently lists only vfio_type1_iommu and iommufd, even
though the VFIO selftests library supports five IOMMU modes, and the
list would go stale whenever a mode is added. List the available modes
separately so that users can see which modes work on the current system.

Opportunistically refer to the -t option's argument as iommu_mode rather
than iommu_type in the usage line, to match the help text.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 0d6ca1a052c4..9076271cc0dd 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -150,7 +150,7 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_mode] [-v nr_vcpus] [-x]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
@@ -159,7 +159,9 @@ static void help(const char *name)
 	printf("-i	The number of IRQs to generate during the test\n");
 	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
-	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
+	printf("-t	Override the IOMMU mode to use\n");
+	printf("	Options: %s\n", iommu_mode_names_all());
+	printf("	Available: %s\n", iommu_mode_names_available());
 	printf("-v	Number of vCPUS to run\n");
 	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
 	printf("\n");
-- 
2.56.0.506.g506a7eabc5-goog

