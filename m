Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343383;
	b=AyRPiNnR3b6aOWSje7A2PkK9AGYwFt/T2WyqWQrdbtpnKnPCzzHaf1hGyo8yZXoLr7sv
	 wl5JGxZFnqTUyJNW39MYB70v8kDDiynrHGbhl0czrFGhACph6zaMMdWBr+5JXwzg5oKC1
	 eUCGcm6j/V66xU6RkweD3KxmYVpVi3khLRFhVikWgNDhZTudyHRf4GN8ptbLCQSQoxv2L
	 dNSjQmWfvE9A1CmeHVOqoywDZxFrGf1HDnBBKnD7juIxW4VBCOjLWVw6EWgg9fEiQZNvN
	 zEbdjwnj4GzkjFk2K8eVIlruCmq9RckcLPSEhJ3NUE2/sRXI1CjDu3I9GsUqI+UT/fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343383;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=69kA2IJeObGIRoAWKGB76zZH1kEcPO2wWCoJYenFup4=;
	b=Phpit8iQWm2b6CLsId3ChAubuTPTtLiTMV10Nw9AQGuM7AhVcWjaLKpJ7u3uxVp2CaOT
	 Qx0OfFIXpiSKATjR27St1NGdHI7ZlgzOlusYraPGtSrEXTL0F7PE9lfxzqp2BswBrvOhp
	 G5FtACN95bshQN6WEd5Wm/cCCWwU4s3xmWKykqjMfABGd2SUzzsUd2ybw8fSs5V9X0Vn7
	 lL7yMUXrUPewkkq3YZ6JaxyN0UuBzG+biPj8kzEL2d8fxxI1adMBhd4FV3FjFN6+xgp0G
	 wywoku0wjxQHI4h35GHWaPN1PpJLlAUdif8TtrRQZbKoEDOOTBUgMorBiMFNsvmk8BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FQlDX1vY;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB3B606A323;
	Fri, 30 Oct 2026 06:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB3B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FQlDX1vY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=69kA2IJeObGIRoAWKGB76zZH1kEcPO2wWCoJYenFup4=;
	b=FQlDX1vY45Y8rFJ055G0X5CO2TNl8+lGTkd2oPy6DOARyYG0O8WkES0Sd4rrNMxHH+tB5bDvU
	/3hLoPGm0DP+zmbUTHn4CDC/poxmkij1YRiBE9w3v63V+vaaU3yCFzUkZURDA4dIpgVKo+sk4dC
	JCvE6tuansYJGM6nJAB2XPw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhX2x83z1cypC;
	Fri, 30 Oct 2026 14:56:12 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 5776D4055B;
	Fri, 30 Oct 2026 14:56:20 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 4/6] KVM: arm64: Emulate TLBIDIDR_EL1 with virtual domain counts
Date: Fri, 30 Oct 2026 14:56:15 +0800
Message-ID: <20261030065617.4090073-5-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261030065617.4090073-1-yangjinqian1@huawei.com>
References: <20261030065617.4090073-1-yangjinqian1@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)

Guest-visible TLBIDIDR_EL1 must carry the virtual domain counts
rather than the physical ones. Compute a synthesized tlbididr_val at
init time that remaps the NVIS and NVOS field values into the NIS
and NOS bit positions. Add an access handler that returns this
synthesized value on read and silently drops writes. If vTLBID is
not enabled for the VM, the handler injects an UNDEFINED exception
into the guest.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/arm.c      |  7 +++++++
 arch/arm64/kvm/sys_regs.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4dfea015eaaa..ddf7c25f9ed9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -230,6 +230,13 @@ static int kvm_arm_init_tlbidomain(struct kvm *kvm)
 	vdomain->nvis = min_t(u8, FIELD_GET(TLBIDIDR_EL1_NVIS_MASK, tlbididr),
 			      KVM_VTLBID_MAX_NVIS);
 	vdomain->num_domains = -1;
+	/*
+	 * Guest-visible TLBIDIDR: the NIS/NOS fields carry the virtual
+	 * domain counts (NVIS/NVOS), since the guest uses vDomains.
+	 */
+	vdomain->tlbididr_val = FIELD_PREP(TLBIDIDR_EL1_NIS_MASK, vdomain->nvis) |
+				FIELD_PREP(TLBIDIDR_EL1_NOS_MASK,
+					   FIELD_GET(TLBIDIDR_EL1_NVOS_MASK, tlbididr));
 	/*
 	 * The four VTLBIDn registers hold at most 4 * 64 / pdomain_bits
 	 * vDomain fields. Disable vTLBID altogether when NIS is outside
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6a025e1f3161..cf9804e54ff1 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -615,6 +615,34 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+#ifdef CONFIG_KVM_ARM_VTLBID
+static bool access_tlbididr(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	struct tlbidomain *vdomain = &vcpu->kvm->arch.tlbidomain;
+
+	if (p->is_write)
+		return ignore_write(vcpu, p);
+
+	if (!vdomain->guest_tlbid_enabled) {
+		kvm_inject_undefined(vcpu);
+		return false;
+	}
+
+	p->regval = vdomain->tlbididr_val;
+	return true;
+}
+#else
+static bool access_tlbididr(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	kvm_inject_undefined(vcpu);
+	return false;
+}
+#endif
+
 static bool access_actlr(struct kvm_vcpu *vcpu,
 			 struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
@@ -3562,6 +3590,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
 	{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
 	{ SYS_DESC(SYS_MPAMIDR_EL1), undef_access },
+	{ SYS_DESC(SYS_TLBIDIDR_EL1), access_tlbididr },
 	{ SYS_DESC(SYS_LORID_EL1), trap_loregion },
 
 	{ SYS_DESC(SYS_MPAM1_EL1), undef_access },
-- 
2.33.0

