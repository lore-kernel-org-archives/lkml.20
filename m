Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287248;
	b=kMM/5mloDI2I05obyVuA7TUNCAr8Xjox99UwX0EwK4S+OUEW58sRLPa0Ra/aTyCMx1Sq
	 lZRoNuP8s/mdYUuN6FoDzX7Ph6gmicXpUZr9aceu6QF38of5AI52MyVn32bPTeKKnTpv8
	 kieIT0xEcpXnOPWA1bZKk8Yz1QEmYSw183Va17LgDOYbQR2AmO5w8OCg155aREngAH8KW
	 dWI1TmUGXYq4yd48pqoV/F4jpsO6EgOXIkjN+yJ5etmgFJ/UTeiuUG2tRFcR44rZ6dgyW
	 sQImOwKwl0luq3pkByAPNo44WGrWGjGhMKiEZNHi/p1WDELKRsE7UG3+WzH9PrFXFlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287248;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=BC5Q69ueJVBYfSsdQ2qZHA2Rh61G6UD4sUcf6Ljc8BU=;
	b=31kcpbcw5oDvnsNy6HgEv8UIAhcSLMhEbiIPHxgNth0HY1QohsjUaHrPbycIJ4ctEU76
	 k7JNXGNwRuxGJiOdatx/S24HQ61m9NbD6yj1AekMXDrwxxDojcXPIshLL+KslDSW0eDJR
	 ijvr44R73qL59oXCS9Xh2bh9oiX76m5w/Lp6l5PXokv1Ta7iaFn8erCCB4qxmS8drnDAd
	 Fk3/qRNa9psnwMQtI22uVD25zK0+xBqjbA29jdDsWo/lk48Nw2bgShr2R8RUENJc0Ryy7
	 cxIUYpbOmQZlu5jx2N/TgJy+QULFKXmZErcLz8DFN/9orOSok8Mk088Ew1ktp28aflg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708E1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 708E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so19504025e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287247; x=1794892047;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BC5Q69ueJVBYfSsdQ2qZHA2Rh61G6UD4sUcf6Ljc8BU=;
        b=I9jxZ8RFHP8dmo3AmGyKW+xewMFhwxNDzCOeNyNr58ITPw3HfTStaYSbMofjdT+eqy
         gjd1wZD4WsTQ2CPq+Rs1H4wqsEpjaKnNtDbJnN/M2ZAXepgXUSb52s4kvwWJBfjyDL+a
         78MAb/9ZcMwowtkAnUKsJK4PO1N8g1TvvuK19UDHrtr/UR7m4r6dLduztM4PtEslsKVl
         QW9vqVXkgljazMOAkWJOpDGCFwXSSJvMjteoZifB7NGZSxfZlC5FXNdBiEvxAFa1RHOG
         PgCCbwRQNXc4z49Ec4qu7hJawzRTUJZ/EloPG3l0ItCssmq3cXIYvHnFF3kxUwGljvBo
         +bCg==
X-Forwarded-Encrypted: i=1; AL+hErFoMsBxI7trGCNfRAArJ7SHmze3hU5CRaEu/yTVk4lFmaISuPr8OFPsKmU/Rk7qSioZEAJ9mvzSj2DOiXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hELXXeWrnyKDFlCiWVINBcNUwIS8jDgdoI/wuP4HwSdM0jhaQ
	YZNnsytnr+xDkNVZ3MDb4VV6AC2sk6HBMyf73+Qxg0h8V4NPEn5SHe+x
X-Gm-Gg: AYBFou2PtXVxDgUklmSy4sR22bx3q4Y6Wjr33CTsKExf7NfhIbdL/V9RjheC8Lq43rc
	Deg3mYX9t7gKzoH29Od45of1IOK+I6A6nvs8yytsTTa8/QfUBx2ZXWpQ/I1eSw5owVd7VP+nRoO
	KhO5clV0N6HNiEsB5GHShksG+pNRpqPmm4BSFdPcLByYSOjODxM2RqNKH4zbe37cNUi/RLJjqTs
	j2iRiqMxaaOLBPEnNYTkwNjuWCT9WP3Va+dFBzSOSpTtsXDMVuSbBH9kA++EmyTcE1la/KTmakO
	PlFE1nqxaAk99mHyloqeeOUAnPy9QhHPcgTxam9HOYpm970K93rYCyvzoCYc01QvWGaPuEq61h2
	OVEunPY9RSAg7yH4GzdOIzKikJGPtWN9/wjxcIjOiZ3GTbQue9zd67ZwDi5VtzVbFYXdXBG6YsS
	VPjtWrnDdQyuW38ntsIg6jTysMiF/sTZlmR+PgCBgL8Qn6YHuE2B21W6xKMt6ze+y/zICEwMBVv
	ulzjVnTQBMNEQ2e3MACrFZWz9dbqtVOrZvrkpYMYzbAfN6vV82Z0UG5mQbV6VX3Z5mV4nu+tmRl
	f7jJIY8NW7NpC2HArLnToGcCQSznWFpbD4uLfG257HGj25KrecZ9nrmhme/p8pS1rIkFxTjfkeV
	xxrEP0MZiWE2gMd3pdbNuY0bQr0IMvIrAKdyVqFhGmjMBaYD9uK6Mx3cpvIWAg+DL
X-Received: by 2002:a05:600c:1914:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba0233797dmr18691015e9.10.1794287246749;
        Mon, 09 Nov 2026 21:07:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022fe1absm26105625e9.0.2026.11.09.21.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:07:26 -0800 (PST)
Date: Tue, 10 Nov 2026 08:07:22 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jackie Liu <liuyun01@kylinos.cn>,
	Christoffer Dall <cdall@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: vgic-its: Reject ITS_REGS offsets above U32_MAX
Message-ID: <f4b5c3247f88b9c469758f8e14a386364332f9f4.1794251681.git.dan@cryspen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The "offset" variable is a u64 that the user controls through the
KVM_SET_DEVICE_ATTR, KVM_GET_DEVICE_ATTR and KVM_HAS_DEVICE_ATTR
ioctls.  The problem is vgic_find_mmio_region() truncates the u64 to a
u32, so it could return a valid region instead of failing.  Then we
use the original incorrect value of "offset" to calculate "addr".

	addr = its->vgic_its_base + offset;

The impact of this bug is relatively minor.  A user in the kvm group
could potentially crash the VMM which they can already do without using
a bug.

Fixes: 8331c23c28e8 ("KVM: arm64: vgic-its: Implement vgic_its_has_attr_regs and attr_regs_access")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 5ce485485a11..532a82bed24c 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2018,6 +2018,9 @@ static int vgic_its_has_attr_regs(struct kvm_device *dev,
 	gpa_t offset = attr->attr;
 	int align;
 
+	if (offset > U32_MAX)
+		return -ENXIO;
+
 	align = (offset < GITS_TYPER) || (offset >= GITS_PIDR4) ? 0x3 : 0x7;
 
 	if (offset & align)
@@ -2045,6 +2048,9 @@ static int vgic_its_attr_regs_access(struct kvm_device *dev,
 	its = dev->private;
 	offset = attr->attr;
 
+	if (offset > U32_MAX)
+		return -ENXIO;
+
 	/*
 	 * Although the spec supports upper/lower 32-bit accesses to
 	 * 64-bit ITS registers, the userspace ABI requires 64-bit
-- 
2.53.0

