Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231288;
	b=tqc7jPySj5rnhl90Fd+sgX1Uwo5D1PGy6VxXLmREv9jX47s7op5BGXauFHzyspwhk+Il
	 yukyetPyYhJh4dLvjpwAIaw5iD0CNeY07xKyW+yDGD8iIernZcf+AL84+bFsNEpu/S9Pz
	 Xkw2SFaePW+IEklTBSrLSLLF4xZ2hl70sxzAVBwso3EFmqevWFsv74ml+2MKJhDFR3J6N
	 219XMz5kA+cdsJQajk+uJyf8xtQCmPX5b4ytsFDVA6TPupbYRek9o85x8KnQ1bjwPAzaj
	 /74Lo2hmTZxA1YgQwRYqhIITcwdzAZ4nw1OctUidXlhRSagGZnWhUdIT7bNMJoWa7IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n80U4YDXqK/o+oYAQLvAWwG1xx85IlIvZcYTxm52F4c=;
	b=CJw97zDwowMUlF2thPdK/PfatyLiSv49d4PJmotD/9W/wF57m0gcuLexrYFsqwTNBxAg
	 kAYkOA3/ooHW18rI72VcPwGNWk3Wkequ20KXSB+VnYg6WVw0Rnaq2SY5jeDOTURqHi18D
	 eXeZNFS5R8pymSm9+Ri/+9T6iEXhRhRiiEMuREtjDLKAQSoseTGqrBWLmUMLkS/oEyEAM
	 L0IDuNKzzzBH61ThYJJCXJEKMKKf+NrzVvQnTHjxF/dtPifMZ0xwMweZTB/rdBm+vxrcM
	 OCRWjx+fkeY9sTgelVPvhjjK094nXe3lzc4Oc8vaPc0Iw7cN717oSOB2GWwyLaxJ2nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSOTrXbf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0A606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD0A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSOTrXbf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490a0e72588so461866f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231285; x=1794836085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n80U4YDXqK/o+oYAQLvAWwG1xx85IlIvZcYTxm52F4c=;
        b=mSOTrXbfAt2+ixWMWzmaOCUT43T+z71mcskpB9wTtSBLOR9vc1S2G8GVNlHb371SvE
         Ml32Xw8whlGwIgPhsKSmDEglApbXoi5ic1wRsoTOK67yzSQTIb7UfxdKAx3sLRhnczku
         twzHHr2dYQg7MdA+EJMNdPG7XHGOBK3wsatb+HAk377hmJmv3nL62lAcn0x6SECk0AYv
         7Qyz/pHLbRtifjnpN/SqBM1iiIz0coj3VJJMS/891KZ6aD6gzQQW65e539mmw8aco8mE
         XNW29UR+z5FUxjMlJwrj4SoRP538vspmytVKbHixH3jBTs3idtkGjV/ZyoXSYIu2+mSe
         jRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231285; x=1794836085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n80U4YDXqK/o+oYAQLvAWwG1xx85IlIvZcYTxm52F4c=;
        b=QnHbjqW86xWJ3RHyR8w0GaBuQUZYNtl7iy9k9+GRv40nOVl4cw9I9R7EBhUSMpDRKj
         D05hAz/V7e1sfoE9OMTMPLRFIqlrGgwPirk7HDE+7zhP6uTPVjpu6sai+yJI+96NmrQO
         XuD+krQois1D1wScwME4+/uxR0IPNPa3hiEWD3PVemqDKxGhmlcWCuR9z21t7pfO6/QG
         6t6OTBdUoIfbQ8eqb+3sCEzLZ3iFYw+3Ofse6xhsrTDITT+sQkgeame/x5nkgW4dauqE
         xZJ5lpwEZHl51ZjEiHtUszoRj0tI1TKQEgMFsdTFWI1h2yOF0IKIooWZSo7Lrp9AVifD
         brfQ==
X-Forwarded-Encrypted: i=1; AL+hErH10ynV8m8YiM+e2ghztbPp5PqQcYuGVcRZ0DQElCbYmVaJbHZTllqoZ5K/uMuhIESTyHC+ntuCdOAWiuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6MfkrS5pg0UU70vUNtTWZYk1mPD2aL3V1D9EekpVMT8U+EhBX
	qBD7+sdvvXbanisorovcKOWg6beLkXfD1pPJmWfMi3S5BrDBvWBWOyoD
X-Gm-Gg: AYBFou3Jh/05xd+gX05NFFwuJu4O8IgI7yWdIx7X81dgcpn6WuvXbbKQifaWiga03Fj
	rPNt4X85Qa5KH6SJ0we3FE6ELO2kDY1+QcI6POMl2SsSmz3X4D3wggknO0RXb0ZB6YyZ8ZpHwKa
	WfxZOTOCnvlwBBoinYMaZNiNXYfuHdsmw5txueRPnH0rc+N6EurC0N6k9oPWBEbuZaX/5yHV788
	vMfGhXxZ9iCUV+1XzJhBoAvmAhNW/paUETfZn2yTsc9vwMSpEWn7a60ODyHAgT2vlaI4/xMksM2
	snXpGf205tJrYg307DFqILn5KqgzXlCR6OPS0YumCtexutZIvvdSPE8Eljv71CgFGdXFEZd1zfr
	gmCcVXXplqctbDQYAoAoPDewGAWeksdeYNOk7kFgQGlFPNKCtTotmu4nsFULlAYK02mkvrSTaz4
	6O/e7JWXhAH8E3SepdGjReJKg7P4P7sRXdbm9Lwn68tSRTaj3Son1uIjAjg9Bzrsh+/WBEPl6SN
	A6V+P6pZ65zLDt/pTiTbeDlI8X7G8cTwq9n6r8ascgAHJX8MjM5sRI2veB/1eAc3uz+GWIzB7ej
	PlraE5Ge3dlf1N1sNvw1is+ihDQxYoXsH3lnQxzjt9Cw/PHqmFTjp16h+CbrIzNvW3NreRkr4cv
	qGuLR5zBBi2BEGvSF63YsbugDyQ==
X-Received: by 2002:a5d:5d87:0:b0:48e:5444:a1d3 with SMTP id ffacd0b85a97d-49583ee2114mr8567019f8f.11.1794231285303;
        Mon, 09 Nov 2026 05:34:45 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.57.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39899sm9140435f8f.3.2026.11.09.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:34:44 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] KVM: arm64: nv: Use kvm_stage2_unmap_all() for shadow S2 teardown
Date: Mon,  9 Nov 2026 18:34:31 +0500
Message-ID: <c7e75684a027b1bdf232e7fe7435bd92742b21e6.1794229714.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com>
References: <cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com>
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

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

kvm_nested_s2_unmap() and the pending unmap that is completed at vcpu
entry both drop a complete shadow stage-2 by unmapping its whole IPA
range chunk by chunk, with the same cost for an empty table as the
TLBI VMALLS12E1IS handler: 262144 unmap calls per MMU with 4kB pages
and a 48-bit PARange.

kvm_nested_s2_unmap() is used when emulating TLBI ALLE1IS and when the
whole VM is unmapped. The pending unmap runs on the first entry after
a shadow MMU has been recycled for a different context, which a guest
hypervisor running more contexts than there are shadow MMUs can
trigger repeatedly.

Switch both to kvm_stage2_unmap_all(). The may_block rules are
unchanged: kvm_nested_s2_unmap() forwards its argument, and the
pending unmap, which only holds mmu_lock, still allows blocking. The
VNCR invalidation and the synchronous completion of the pending unmap
are left as they are.

Unmaps of a canonical IPA range, such as MMU notifier invalidations
and memslot removal, no longer go through kvm_nested_s2_unmap() since
the guest stage-2 tracking was introduced, and are not affected.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 arch/arm64/kvm/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..875eb9c312f9 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1441,7 +1441,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
-			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
+			kvm_stage2_unmap_all(mmu, may_block);
 	}
 
 	kvm_invalidate_vncr_ipa_all(kvm);
@@ -2160,7 +2160,7 @@ void check_nested_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		write_lock(&vcpu->kvm->mmu_lock);
 		if (mmu->pending_unmap) {
-			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), true);
+			kvm_stage2_unmap_all(mmu, true);
 			mmu->pending_unmap = false;
 		}
 		write_unlock(&vcpu->kvm->mmu_lock);
-- 
2.43.0

