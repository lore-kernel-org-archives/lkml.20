Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808858;
	b=PRQSG7e1BVtSt8kdTH8FJbzN+LaDc58Ziib+SAgbjdYpt8IQntA3yt1Qcr1n7srENvpo
	 EyIddLu/KS6ByOY29l7XrUlVYoISCIq6wTekW3sVcXC7jc71GNSBvkmVastF4c85AUCQw
	 8mEobCnI8a5tEWU94SMpClngXthg3wg0iYYu8tPaWBsNmDgVtfnERne6oOZuiA26xQNV4
	 0t9Y/f353gt6xa96NLH5/Ny7b+PZFn34qvNCkdBII3/r9UNO9sWAIL1dWdXgKSwK+pLkd
	 7/bw8GBTvOxJasG8KSTaAquvO+X2Yu5T9ueJ9H1YtDRB+8SJmYlEOw011NgkhLoVQKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C0AHV3pkmSBlkgkC6bhKAE+fGlVWZxDBcjbwoZIhJvM=;
	b=GWUxWLbV/sS1lzinmsBSbRAZZTcbIvgEDNMn7egClII5keDhk76SHwHDRf2Q9U/GzbO7
	 HV2LdUciMx0fc1mRv4YqM+8iB5yjKjnxckG84iBZwirsaMkF7JmTcD2xmD+FGUjZSLPiw
	 IhMiUIwxVlo9nP5ZK24LqxaQuNADVXyAiq/VOM++WQSgl3N/K//nQ4QO9rhMO/uROB23s
	 kLnrADYhOGvJUc5ZMGENOlAuDen2PwYvWSN3a6gQyR2cTcrr5DMtj5q9sLHIhZK971EvF
	 SoonIIAmrKmeqHDt8Cr11NO7cLGh02xEWQ5qCF1/oyj7byD0vzPDgScWHTNWZ7bhDKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="GgIg/3T2";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36002606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36002606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=GgIg/3T2
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1357349f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794808856; x=1795413656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0AHV3pkmSBlkgkC6bhKAE+fGlVWZxDBcjbwoZIhJvM=;
        b=GgIg/3T2MR7pmBzEbfP1hYn78cOPXKf2+OqIfgg2hzwlUolwb0qUhOirnfXxf0cXu6
         Dt1TosPYlUiJ/MmfD36lwUE1jRJuxUNQcZWOD9U8et1O1gAouZ0rWMxacKxqVswjoW8K
         GX371oWq7Xp9H0EZ5QjxfyVj69PLYj+KSfkWBLRsqn2C/LutcJqXdKnSmSEO2AF41K5E
         sUyf9PJGuo2iLbMzw+uhfwNHFRCqV0YcfNzXsodtInnudsTmCUitgRMlpZR+Ueq2mg3v
         2ZBWqRxLU2Uy9/Lf54+gzsaqhK3Oey80nRZR0IxEiRm/vkFGsmRyIoV6sq8DqV6yJkhF
         eI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808856; x=1795413656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0AHV3pkmSBlkgkC6bhKAE+fGlVWZxDBcjbwoZIhJvM=;
        b=JBuY4yhkSioFhR9UgU2epqMC91+p12hvYsnMEwwUPm0VxTh5ZNoustNb5GVnCYIR4r
         flXyYnyWODAUusdELJbbHD/psxfxETNXoSw7mF5sqPHfak6mqbKHBb3XoGOKdQUpPLbt
         vMPJ94mS/T8mUL/JrpwLPr0fMgdu5O6UydBRlTHENqZhAaRsJ1TBM2+SBo4vbZk+S0T9
         wGV0UnZIGZUarbWD83HfZ6Ojbo1MSP4Liwsb7LToeYLFLFZqvBc+suoIHYuHSdSYcgne
         A78pgyty8M3qYMQLTDtC1BDgRF/rTKOSsD+4KE3Vg73LaYzb375mtOhXRBMXo1v6VGOY
         jS1w==
X-Forwarded-Encrypted: i=1; AL+hErF2ytSi3oNEYdERZAKlOaw7YtFqAVTr7qG2tl+1QU+xM9laec61AtoFCiUgzHKxYQFpXqaev+yOwYrUXT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WqUbdRUWiKoW12lxjFpYjbdLSbquyZkhbzlIyoowkKluI/x/V
	z8SWbTvMD53gWGQXFUiVZTUVvZP9u/jPBe3M8dfg3BghbdZxpKgKONuBS5EPS3uLKrQ=
X-Gm-Gg: AYBFou3WPFOL9tJ0zJkAnfJN7sSd89G4br3juaDDpuq8xDFhzBHrwkiv5y1OzIK2YKc
	irDdVCUX8n796WkyVacjay/dcDdViUEc2aWjIIm6MamTEhyJWmDSU1GfjlN4ofdVyLC7WvKMIzv
	c1GKht0bR9RzoCv8nsMNkGVINivcYu3XKnxPBudY6S3MavoOxVPK61Jj0VQzmxxAKDpXeDCgyZr
	6cYiFV0I77KwX3MyUIn3Fib+Cs/8a8VtYiAvsVn0iFxXBSDTH/U5sAd468RmUhTN1s9JK4+p3Uu
	KLuzJKRj8S4PSILHdnYkI7rxo/LgNjTqtah8rJb14xQkjm2e38z+dHKEufxbDIuyhTM2EgqDs04
	f7TQQVNXCOZAu7fmMNSFJl7cJNq81kORQ1MTPLObnTkqPCMjA6jrzI2eik3RoHpBgXW2js+PK3d
	sqdhj+qbNrXEERlyEGaru+1y51wOsfHwENB+DASV52/Jw3VJxmlWYkLrdkGTfhp8sURMJJsUbki
	fBjHnvkJVNsKjWKcwobVFZa7JJHWBVYaWwOhou4bvH0QFKWz8V9wy+rYKF45NPerdYoFIW67cdu
	MHoiPKZZNVPBpxN7fq4=
X-Received: by 2002:a5d:5849:0:b0:49e:da28:4d40 with SMTP id ffacd0b85a97d-49eda284d6bmr9895900f8f.19.1794808856445;
        Sun, 15 Nov 2026 22:00:56 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm20840076f8f.6.2026.11.15.22.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:00:56 -0800 (PST)
Date: Mon, 16 Nov 2026 09:00:52 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 1/2] KVM: arm64: nv: Fix AT emulation for TCR2_EL1
Message-ID: <eec50693a12e1ba34d60458ae8fe605ac198a79c.1794808373.git.dan@pereq.eu>
References: <cover.1794808373.git.dan@pereq.eu>
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
In-Reply-To: <cover.1794808373.git.dan@pereq.eu>

Arm provides an AT instruction that translates a virtual address the way
the MMU would and returns the result.  There is a bug in the way this
instruction is emulated for nested virtualization because of how TCR2_EL1
is handled.  The bug is fairly minor.

The TCR2_EL1 register has bits which turn on permission indirection
(PIE) and permission overlays (POE).  When these bits are set, the AT
instruction reads the permissions stored in PIR_EL1 and POR_EL1.  If
you have the right features and permissions then in the return value from
the AT instruction we set one bit to either 1 or 0 depending on whether
the access would be allowed or whether it would fault.

However, the bug is that just because the host has TCR2 enabled, it
doesn't mean the VM has it.  KVM doesn't load these registers for a VM
which doesn't have the features, instead the AT runs with the host's
HCRX_EL2, which has TCR2En set.  So the AT uses the TCR2_EL1, PIR_EL1 and
POR_EL1 values another VM left on the CPU, or possibly the VMM's POR_EL0.
Likewise, for a VM which has TCR2 but not PIE or POE, the L2's TCR2_EL1
is loaded unmasked.

The impact of this bug is that we leak a single bit of data to the L1,
but in real life it's hard to imagine how it is useful to an attacker.

Fix this by writing zero to TCR2_EL1 when the VM doesn't have TCR2, and
by clearing the PIE and POE bits when the VM doesn't have those
features.  Also it should be effective_tcr2(vcpu, TR_EL10) to read the
TCR2 for the L1 instead of vcpu_read_sys_reg(vcpu, TCR2_EL1).

Fixes: 477e89cabb14 ("KVM: arm64: nv: Add basic emulation of AT S1E{0,1}{R,W}")
Fixes: 23e7a34c8397 ("KVM: arm64: Add AT fast-path support for S1PIE")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/at.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 30d8f062b2c2..06765881a4c8 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1438,7 +1438,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
 	if (kvm_has_tcr2(vcpu->kvm)) {
-		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
+		u64 tcr2 = effective_tcr2(vcpu, TR_EL10);
+
+		if (!kvm_has_s1pie(vcpu->kvm))
+			tcr2 &= ~TCR2_EL1_PIE;
+		if (!kvm_has_s1poe(vcpu->kvm))
+			tcr2 &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
+		write_sysreg_el1(tcr2, SYS_TCR2);
 		if (kvm_has_s1pie(vcpu->kvm)) {
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
@@ -1452,6 +1458,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	__load_stage2(mmu);
 
 skip_mmu_switch:
+	if (cpus_have_final_cap(ARM64_HAS_TCR2) && !kvm_has_tcr2(vcpu->kvm))
+		write_sysreg_el1(0, SYS_TCR2);
+
 	/* Temporarily switch back to guest context */
 	write_sysreg_hcr(vcpu->arch.hcr_el2);
 	isb();
@@ -1554,6 +1563,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			val |= HCR_EL2_NV | HCR_EL2_NV1;
 
+		if (cpus_have_final_cap(ARM64_HAS_TCR2) && !kvm_has_tcr2(vcpu->kvm))
+			write_sysreg_el1(0, SYS_TCR2);
+
 		write_sysreg_hcr(val);
 		isb();
 
-- 
2.53.0

