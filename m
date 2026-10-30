Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343392;
	b=PULuXl6dCGPivmJ0B06ui5+toiIXNU5AOScBnHzXr3B8K1GNpvUh3NJgAp7OJgAZEinL
	 hqmHDyh5X6Vp0QVMgnfYcjhAA73xalfpKwTuAsr0WXg0GXU/LQ/g3G45q75NeV4TDMD8S
	 HrcnLTAP8Uh84v6EJU9GTspCUBUZwyzxw5KkFOsHsnjiJVHjak/pUzWHlXFf76MO4lFV6
	 UhHKDl2uDTOVrcdHr4MCJLJ5JmnD6KhZoIegobqnXs64i1uvMZNe4DDvp42RijCYJH7NJ
	 I8kMGO+9ratHK8KGwcy705F48a9fETdS+MqT9LrNS/FsdZfC1u4KZmszHnu96PjX7Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343392;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=DDTZCgeXRZrOdO0H7W205aFqDmAAtb4mFnHHlLSHJyg=;
	b=uPW2nBu7KUuCku80dsIe+O2iYABjV9atSGYwzEqb5cBlni+rIIK0N47LGH/heq58ZJhE
	 dWN3/ntWEbXxW6I3MROaWiwrnvqRRPHfxQcRACLIi1baMYTlRqCfIg+B8mdofuf0cuE5x
	 ClF55HR2Y6ihdX/oE5KBpneUDAzvld5XQM7ywl6VgcSP/YKnkWD5FK7pDwfq0L4tUPsdQ
	 hcO1QMVXR4I/arHPnt7bYqKK+3V0jNIDTPdma9wRYcoQMzo6g2ZfAKVJwajdfhsLM4wQ0
	 fLFKk3iHFh0GHpRKZpmtq+pyATZQisM+um8Expm5FKF7dFC59oq8jWyfZiMGFHGY+8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB40606A31A;
	Fri, 30 Oct 2026 06:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DDTZCgeXRZrOdO0H7W205aFqDmAAtb4mFnHHlLSHJyg=;
	b=rd3Uzf/lVd3dYMhpJWMGIofKdjoCrwY0qYGiyfdrjCFCu0d68gxIe6bHFtsBIdj3n7QOIwXya
	yMfpNKsjgLK0hdIgIr0ykKAimNSJXtsYKZ1a126BmhvxAuXvmEY+aDLxfrm0vVGxfWU6J+de9ku
	mB1+lEy6T8RyLkbphvL+MdM=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhV3sZhzLlt6;
	Fri, 30 Oct 2026 14:56:10 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 31A144055B;
	Fri, 30 Oct 2026 14:56:18 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:17 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 0/6] KVM: arm64: Add support for virt TLBID
Date: Fri, 30 Oct 2026 14:56:11 +0800
Message-ID: <20261030065617.4090073-1-yangjinqian1@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)

Hi,

This series adds virtual TLBID (vTLBID) support for KVM guests, built
on top of Kristina's TLBID domains RFC [1]. It lets a guest use TLBI
domains of its own, translated by KVM into physical domains via the
VTLBIDn_EL2 registers, so guest TLBIs only reach the physical CPUs
where the guest's vCPUs actually run.

The series adds:

 - KVM_CAP_ARM_TLBIDOMAIN plus two ioctls to configure each vCPU's
   vDomain membership;
 - programming of VTLBIDn_EL2 at vCPU load/put, mapping vDomains to
   the smallest physical domain covering the vCPUs in them;
 - a guest-visible TLBIDIDR_EL1 with virtual domain counts, and
   conditional exposure of ID_AA64MMFR4_EL1.TLBID once userspace
   configures vDomains;
 - tracepoints for the vDomain load path.

Known limitations:

 - VHE only: VTLBIDn_EL2 cannot be written from EL1, so vTLBID is
   disabled on nVHE hosts.
 - No interaction with nested virtualization is modelled yet.
 - The guest is told about OS domains (NOS), but VTLBIDOSn_EL2 is
   never programmed, so outer-shareable domain TLBIs are broadcast.

[1] https://lore.kernel.org/all/20261001110655.461473-1-kristina.martsenko@arm.com/

Jinqian Yang (6):
  KVM: arm64: Introduce TLBID virtualization infrastructure
  KVM: arm64: Add VTLBID sysregs and update VTLBID(n) on vCPU load
  KVM: arm64: Wire up TLBID vDomain configuration ioctls
  KVM: arm64: Emulate TLBIDIDR_EL1 with virtual domain counts
  KVM: arm64: Conditionally expose ID_AA64MMFR4_EL1.TLBID to guest
  KVM: arm64: Add tracepoints for TLBID vDomain load events
