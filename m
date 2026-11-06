Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794002894;
	b=1LFRyCQF7BzsoQFr28Qx4tu/AA7HuTwuVdNUn3392NaM2llpovTqCaZ8yckGDgnkTboW
	 z+wzO88e/4Iz1fhuL1mgzYKM7t69kk96fMpWi7v21OOIRbgASk8TQ7wDnTyt3Y9zGBv9N
	 eR38vZMwKD/AYp1Fth357Z2KM5ssh+A4zHbUiAgKqGVG4u8ZKzIME/lokBTp7B9YiaFIE
	 A7b0fbxMblJAx6quLAy0z2IDdOJ6In9j56R90yrjL9nyTts3GvLuIiK9rToGKmK7n4ksI
	 W95CauR3e1F4QXre+jkae3SiYn3H/R9sfL+HUMrhdt1qKFYbpjf3eqmfH3FQZvZglBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002894;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QRcecgva87OYekt0X5ZseaMM9lC3ElY4Yfs5ztCitZs=;
	b=DSqSgn5iD8Iokt1jF6iT6AUnL7PbickczauLWZyKi3lF10sbvmEl0mspjvTxs9234oc6
	 uGK00a84T1+af3CUo5TRgBES0MRWiMEJ+aIxX+pV6PK8Xiw4YH8RVuNA7CsPDdJrNzhT6
	 jcvbzZ+FiaJIHvfRl9aLsG61HFSkA9HEGbxmLZfugPDOMIa5KywsIRmL7uWKadgEzVmiE
	 +G++0JBfW9PcsaUq6SPGVkkBi8K1te6C/QmrGGPkMa4GE7VY/tzXq2Zp0j4kynRZPXTZm
	 J99gzA/Dr/yC3Ysf2pN3j/4PDSiPNhYdsMd7VQHJqGiSEAuDTWF8adnr1tpwCx4YnUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JqhoMeXT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C509606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JqhoMeXT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794002894;
	b=kTyuSPhmti6BQ1g04XjNzEgMauaX0mNOLZ97Iw/yfjZFmFAJklBFIQwZudDYqpgL+/2w
	 DoL2KpzBBk9ooMl7RCVneJsfi5gQzYNHPmSbi0h1wp1orNhyUUzDR0kA0NnqRivryfWrX
	 6QYQOOG6X6jcT7VgB+AZC3CXsgpGNDy+MNjwjo5xozD7V4mIZjrh4GYTItH75ufx16j3I
	 7JQBfONdhWjgvYSyITWogy6+QgRsLNnEf3RX/QQOudl6j9an6ogYKxgvPDfFwHdOhfesy
	 wlmL0hnSl40G8OUwMWj540CpApJcGPSZXzAWeJvwfECKM4btZMhXJOpgR6tjm2QEKAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794002894;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QRcecgva87OYekt0X5ZseaMM9lC3ElY4Yfs5ztCitZs=;
	b=IHIJik/zf2ISQAIMB0r5+c1+FtKureCJvJyC1X32OuqKfYpdg3U9K2SKNXHR8TU2KSqx
	 jiiAoaYeSM6jrozxZH5Suh/Lm+8zuCsrS/SRpNz7+4ktLlS5NbesSVeZHNEbae5TOujkt
	 OrweS3+URX48ToFwgf0vpK434nzg/LQVFwxKt2BUb93yb4asvRxUL7gqYUKJ+Y9B3BQ+Y
	 BscQFKCvVlXQ6q6Oi8ZsEaf6F9xy+aUsadUeoCEcq4Bms/krn1irGaJ4e1GVfNOia9/qi
	 0l/3Kuec8oJIq0pjrazeNXuP0YLC5OaS6GUw5q/sg8jgm3uoaoKjSQ9Hyp/ylo1IlXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85D2A1F0089F;
	Fri,  6 Nov 2026 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794002894;
	bh=QRcecgva87OYekt0X5ZseaMM9lC3ElY4Yfs5ztCitZs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JqhoMeXT+5W+dnO22C88OIIjEAHjvjg76bQdi0WCIRXnFEZyF9zsvVems5qHfdRos
	 uUrlXRRkn66NFukIdmi2NFVRc+zz15/5Ukx+imBraO9gv1usvcr4pR/xa3aqkS0ISD
	 QadD/30SVZYqKXlL4GqcIs5wePlKAYE/7RdKg9usylhzc2es/nL5AiDjUfez6hhTYN
	 EV2rp9nJIujjOHJxzHMEXpI73Pq8CHkDtYFaj/xacwG7BUafu6FKW4pa2/DCgLdJSA
	 tdpZuJLB6922bRwlVI17P/jkc9vjrQq4tDWzr8WeqfZ0PdRM0D47L5ffSSJqnit/7y
	 8BlR14mahYxhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1AC0E478B1;
	Fri,  6 Nov 2026 22:08:13 +0000 (UTC)
From: Ahmed Abdelfattah via B4 Relay <devnull+me.ahmedabdelfattah.dev@kernel.org>
Date: Sat, 07 Nov 2026 00:08:07 +0200
Subject: [PATCH] x86/apic: Use the physical address for the local APIC
 resource
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-x86-apic-lapic-resource-v1-1-28de4cb3fb1e@ahmedabdelfattah.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMBCE4VeRPXfB5JCEvkrpIY1jXSkqu7UI4
 rs3tZeB7zD/TgYVGF2bnRQfMZmnCndpqAx5eoKlqybf+uBcG3lLgfMihV/nKmxetYDh+5Ryl1O
 Ikep7UfSyneXb/W9bHyPK+5ej4/gC/Gn7NXsAAAA=
X-Change-ID: 20261107-x86-apic-lapic-resource-e2f88ada8677
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, 
 Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794002892; l=1942;
 i=me@ahmedabdelfattah.dev; s=20261106; h=from:subject:message-id;
 bh=SomVT+8jY+UWMuch1Im0ts42WOl22oH4Ih7Wd2VbXQ0=;
 b=u1CCahQz+RJLuoJ9j4aVIhSv13Vg6bc6UrD7LZzgeQj4YcS9hwmx83Dr2MrUk8KMDEDunoPbL
 5V+9+wE+MYMA2a60CQhiAlDQX/MHJ1aRTIbnKrKw13m91RitqqqKKhq
X-Developer-Key: i=me@ahmedabdelfattah.dev; a=ed25519;
 pk=DHEHKU4PddrkJ/iYMZpwyyXsFyIQ6ySjTttKLrt9YqI=
X-Endpoint-Received: by B4 Relay for me@ahmedabdelfattah.dev/20261106 with
 auth_id=1438
X-Original-From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
Reply-To: me@ahmedabdelfattah.dev
Content-Transfer-Encoding: 7bit

From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>

Since v6.6 the "Local APIC" entry is missing from /proc/iomem whenever
the kernel maps the xAPIC itself.

lapic_insert_resource() used to take the address from apic_phys. When
apic_phys went away it was switched to apic_mmio_base, but that holds
the fixmap virtual address, not the physical one:

  APIC: Mapped APIC to ffffffffff5fc000 (        fee00000)

insert_resource() rejects that range because it lies outside
iomem_resource, and as the return value is not checked, the failure
goes unnoticed.

Use mp_lapic_addr, which is the address apic_set_fixmap() maps. Keep
the apic_mmio_base check, so the resource is still only added when the
APIC was actually mapped.

Fixes: 78c32000848c ("x86/apic: Get rid of apic_phys")
Signed-off-by: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
---
This showed up while comparing /proc/iomem with the memory map of a
QEMU guest.

Tested on QEMU q35 with KVM (x86_64_defconfig + kvm_guest.config),
booting with and without nox2apic. Without the patch there is no
"Local APIC" entry in either case; with it both show

  fee00000-fee00fff : Local APIC

as before 78c32000848c.
---
 arch/x86/kernel/apic/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2..17525b5daa0d 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2667,7 +2667,7 @@ static int __init lapic_insert_resource(void)
 		return -1;
 
 	/* Put local APIC into the resource map. */
-	lapic_resource.start = apic_mmio_base;
+	lapic_resource.start = mp_lapic_addr;
 	lapic_resource.end = lapic_resource.start + PAGE_SIZE - 1;
 	insert_resource(&iomem_resource, &lapic_resource);
 

---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
change-id: 20261107-x86-apic-lapic-resource-e2f88ada8677

Best regards,
--  
Ahmed Abdelfattah <me@ahmedabdelfattah.dev>


