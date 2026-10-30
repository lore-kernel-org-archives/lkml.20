Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343385;
	b=Il/RWv1puaeE83cYCRbBSdYBYa2NYbW/HlQ47/uFn6HxZtu8R64YIf+mGCSIWaqYxOb4
	 H8WQoPmT7JnQhAzvhDbsBdTNhQNB+odkjJXq/tI9aGRr5guztc06S5L6X5/Nwuh9HbZKS
	 FbhN/h33cb6NoX+3Oh8qubp3+5+iGiIN8KVRifIDI/i4RfEAIvYHKv19Ngg5zsrtJrlll
	 MU4zzSoNnn4oZvBCe1jw35egV2J0hQBZlDrXExV7251eU2z0hKBp6GH3sQYKKZeTjGqj/
	 sJBrrz89vTzC4Oss32VcDZH70KHbIMr95UI3NvZBT00XUf2Q9wy6QSgBWJxbLEc0Ofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343385;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=aX9oxzryrpP/N+LbstdWGgRShaz+ZIQX/4rMf7PZOrM=;
	b=flnRUSGHpnx0/MmqR9rWV3wP8HWXq1j6EXBgcZEzxL/kEKRpNA1xTBlvYlNrQY5vjn+P
	 grTksQbMkN+NwWw/H+ye9u8GGgZYLN8jFESLsri62RhV22RQVbY7crgG3YHDxKdFsQ8OQ
	 OCDS3MjZBkO1BMLDr9Z34X9vDXbjHaZ1N/2wRK/x+Wsdlf6gAFiEghb90008XLgNUfq20
	 pmU/0wrqnxjxIBRuqjzNbq4sWcuNhtvD5xCj0zPaU0GHz8QZ5WmHgNixtQ2zA6UIQujT1
	 uvyq4oKYbz5DccPaaWjwVk+M71qk0TfCItOdVHqMX6r5a7dDuY/5gatcI67bWJVj7cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Noh/vIGl";
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8781606A32F;
	Fri, 30 Oct 2026 06:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8781606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Noh/vIGl
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aX9oxzryrpP/N+LbstdWGgRShaz+ZIQX/4rMf7PZOrM=;
	b=Noh/vIGlrIcfT7ytLHg4hzZRsj3j26ToV2uJy0btNnOrClRsUy/Bs1AbxtM2jwe5Maje6WNJG
	imSedcH2dmfQqrHq55yPX7JcPVJmAnz0Z7zJmf0EpH0BZ7yPXgxgykVwKwuj4/F908TyUO+7Bwe
	c/RLnrxuSTbKo/sXjSy5bns=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhS6zjlz1T4GZ;
	Fri, 30 Oct 2026 14:56:08 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 60ACC4057F;
	Fri, 30 Oct 2026 14:56:21 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:20 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 6/6] KVM: arm64: Add tracepoints for TLBID vDomain load events
Date: Fri, 30 Oct 2026 14:56:17 +0800
Message-ID: <20261030065617.4090073-7-yangjinqian1@huawei.com>
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

kvm_tlbid_vcpu_info logs each vCPU's vDomain bitmap on migration,
and kvm_tlbid_domain_mapping logs the pCPU mask and physical domain
mapped for each vDomain, covering both the default vDomain0 mapping
and the per-vDomain updates.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/arm.c       | 10 ++++++++
 arch/arm64/kvm/trace_arm.h | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b5ab89db1c07..0352d62cea18 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -954,6 +954,9 @@ static void kvm_tlbidomain_vcpu_load(struct kvm_vcpu *vcpu)
 				      max_vdomains);
 		}
 	}
+	trace_kvm_tlbid_vcpu_info(vcpu->vcpu_idx, vcpu->cpu,
+				  current_data->last_pcpu,
+				  current_data->vdomain_bitmap);
 
 	if (!vdomain->guest_tlbid_enabled) {
 		old_map = vdomain->domain_map[0];
@@ -966,6 +969,10 @@ static void kvm_tlbidomain_vcpu_load(struct kvm_vcpu *vcpu)
 							   0,
 							   current_data->last_pcpu,
 							   test_bit(0, clear_bits));
+		trace_kvm_tlbid_domain_mapping(0,
+					       vdomain->vdomain_cpumasks[0],
+					       vdomain->domain_map[0]);
+
 		if (vdomain->domain_map[0] == old_map)
 			goto unlock;
 	} else {
@@ -983,6 +990,9 @@ static void kvm_tlbidomain_vcpu_load(struct kvm_vcpu *vcpu)
 								   i,
 								   current_data->last_pcpu,
 								   test_bit(i, clear_bits));
+			trace_kvm_tlbid_domain_mapping(i,
+						       vdomain->vdomain_cpumasks[i],
+						       vdomain->domain_map[i]);
 
 			if (vdomain->domain_map[i] != old_map)
 				domain_map_changed = true;
diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
index 9c60f6465c78..0e8faeb8964e 100644
--- a/arch/arm64/kvm/trace_arm.h
+++ b/arch/arm64/kvm/trace_arm.h
@@ -415,6 +415,53 @@ TRACE_EVENT(kvm_forward_sysreg_trap,
 		      sys_reg_Op2(__entry->sysreg))
 );
 
+TRACE_EVENT(kvm_tlbid_vcpu_info,
+	TP_PROTO(int vcpu_idx, int current_pcpu, int last_pcpu,
+		 u32 vdomain_bitmap),
+	TP_ARGS(vcpu_idx, current_pcpu, last_pcpu, vdomain_bitmap),
+
+	TP_STRUCT__entry(
+		__field(int,	vcpu_idx)
+		__field(int,	current_pcpu)
+		__field(int,	last_pcpu)
+		__field(u32,	vdomain_bitmap)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_idx	= vcpu_idx;
+		__entry->current_pcpu	= current_pcpu;
+		__entry->last_pcpu	= last_pcpu;
+		__entry->vdomain_bitmap	= vdomain_bitmap;
+	),
+
+	TP_printk("vcpu=%d current_pcpu=%d last_pcpu=%d vdomain_bitmap=0x%x",
+		  __entry->vcpu_idx, __entry->current_pcpu,
+		  __entry->last_pcpu, __entry->vdomain_bitmap)
+);
+
+TRACE_EVENT(kvm_tlbid_domain_mapping,
+	TP_PROTO(int vdomain_id, const struct cpumask *cpumask,
+		 int pdomain_id),
+	TP_ARGS(vdomain_id, cpumask, pdomain_id),
+
+	TP_STRUCT__entry(
+		__field(int,	vdomain_id)
+		__cpumask(cpumask)
+		__field(int,	pdomain_id)
+	),
+
+	TP_fast_assign(
+		__entry->vdomain_id	= vdomain_id;
+		__assign_cpumask(cpumask, cpumask_bits(cpumask));
+		__entry->pdomain_id	= pdomain_id;
+	),
+
+	TP_printk("Domain mapping: vDomain=%d, cpumask=%s, pDomain=%d",
+		  __entry->vdomain_id,
+		  __get_cpumask(cpumask),
+		  __entry->pdomain_id)
+);
+
 #endif /* _TRACE_ARM_ARM64_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.33.0

