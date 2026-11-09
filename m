Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223226;
	b=Y6nNi2deXgnV+WqynSc12sVdxRcHSFzrYLW4rLxS3qyxsSdqDdQTTpQhZ+N/PrQG7mqj
	 nP96D3kslEsb8/Ts3y0OcZOyJUrRLVB9umoI31brdL6rH4n5JHYUWBjd6CPjN2hAobZjQ
	 JZKncVRoG8gKX4TXRhzmlMueIQ+qmm2WGfcAneqOdvelJhM5Xq9d9PVMeQRdu6CyCcdT8
	 zKy6mzu4ICdvi/kdV8045QL4ZBu7uMirXl0RedOmxPf7ARkiOaHXAWKK0RmZiE25B3BOE
	 /gFWTOAG7lKNfk3Pow3gUrgK7EVJL9ZtO+rSaDmoEV4vrvrc/jejyFW15uy+KnX00Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223226;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+Lu9vavZpewMGIe7sT0xaOfi/XcEQNMU46Rb1px6xaQ=;
	b=eVdtb9GnaNF4VAo50hmWJozH5VjYkAgyangd62GH3OE5f/dtSccKGLNdBKIC2SCdUqpt
	 E1FO7NM2LXPWX/iob6IiEgU2F6kcKlfzpjRb8OlV8OYQCZQtw4g5E0nxXG9yhf/LPfqES
	 wq5ZMbGHEgMBdMadGIbmQRxgrZkei+6Re5dkC6lR/GIElMJN9MHHTWZjKY08WW+o/4PN5
	 6D2ywBTj61kVguM3c7UA60jNqYbsTBBxcDu4ImOgRFcP6eBbEhVl/n981g9EBqv/gSI+7
	 oBJ6thnHVW+HBByRDeU5h5geCRTQtvJ5yCvDqvKc/kXXit5jdagW2UZg+ybbpEnPv3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ji8tEq2k;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C9606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9C9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ji8tEq2k
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+Lu9vavZpewMGIe7sT0xaOfi/XcEQNMU46Rb1px6xaQ=;
	b=ji8tEq2kl3yMJVCyXuhKV5kQUxqmdEtqB/WIbQEDENZlGB1aLIwIZBLhAPbSEpXEvp1e4QHlJ
	YvvoTfgf8BOy9tyg9DyfdNGYiGTBmljLSMJ9WjKEpdzit6YKOm7Kdn5xDVg6mlKrZjdqrWGOkKQ
	ZiXwFxNoiRHc3vRPapN22mI=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jNS4W0r7wzKm76;
	Mon,  9 Nov 2026 19:20:11 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id E49AD4056C;
	Mon,  9 Nov 2026 19:20:19 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 19:20:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <maz@kernel.org>, <oupton@kernel.org>, <fuad.tabba@linux.dev>,
	<yuzenghui@huawei.com>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <yangjinqian1@huawei.com>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <tangchengchang@huawei.com>,
	<zhengtian10@huawei.com>, <linuxarm@huawei.com>, <liujian222@huawei.com>
Subject: [PATCH] KVM: arm64: Register irq_bypass consumers only with GICv4
Date: Mon, 9 Nov 2026 19:20:18 +0800
Message-ID: <20261109112018.241298-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk300013.china.huawei.com (7.202.194.231)

kvm_arch_has_irq_bypass() on arm64 returns true unconditionally, so
every irqfd assignment registers an irq_bypass consumer even when the
hardware cannot perform GICv4 direct MSI forwarding. In that case
kvm_vgic_v4_set_forwarding() bails out at its very first check, since
vgic_supports_direct_msis() is false without has_gicv4, and the
registration becomes pure overhead: every KVM_IRQFD ioctl takes the
global irq_bypass mutex, which becomes a contention point when many
VMs boot concurrently.

Gate the registration on kvm_vgic_global_state.has_gicv4, the way x86
gates on enable_device_posted_irqs. Functionally this is a no-op:
without GICv4 the consumer registration never did anything beyond
acquiring the lock.  On a GICv3-only host booting 100 microVMs
concurrently this cuts the average boot time by ~5 ms, matching the
gain observed with CONFIG_HAVE_KVM_IRQ_BYPASS=n.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..785d57388032 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1744,7 +1744,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 
 static inline bool kvm_arch_has_irq_bypass(void)
 {
-	return true;
+	return kvm_vgic_global_state.has_gicv4;
 }
 
 void kvm_idregs_enforce_dependencies(struct kvm *kvm);
-- 
2.33.0

