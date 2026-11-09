Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213132;
	b=wObWVHXd7lSkBju7vSt+SMUZzpRCtxEa/Ac7r5/u84w76BOfHHQJT4MgtdjBnCczTBWE
	 U414xe6KBha3mw48JIV9dRcqcZXTqUt1aa7B9W58gCztY8pz2EwfQz22kqZvmq+8Jc2/T
	 5FDlVXXb8wTTU1+7STMtR58rcKKV99CNWV8YvVipCa4mJu14K2fkQToN0AELb72mwJByS
	 Iw8jwIBRfuvH6YPo4iq4H9nQTdaC1azw89Fp5AxUluKvoIGS47S31UsxJRNJHKgeZjaLs
	 tPEIL2Lc/QIgiXTZxHAp/uk+5Oww6QNlpthilvhoAszC1Rx0mtZ80+niJzWxD29LvLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213132;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yYnRMu74QSYMFyFnZroW2XAIK+45426ADoRmFNwN2fU=;
	b=zpM7yOeEi9Cclg2jUvT3qCacBPHZgZTxSzc71Fl9qkjKzH2S/rnBHlQ3if9wJQHE3+WC
	 nPWaOpQxXnOf9w38yEqLB629DLIwBPywaS4JUrJ4VASfpRO8lvqniUKAuwLs8L1oGH+j8
	 bvkJX//40qJYiqWC7iX5I4VRkYq8oZrwLsEUI6jiWdK+N4Jv9d/1MyHGyxVXbxomyvCH6
	 KIf9PsmHmOMDtLRoJ8k+kWjCBDfHPRyFlaV9Awt85houUu7leR7UhuAQfvuAWOJy6CkFW
	 d7F2nm2iqK9+nLGKaElnS+2a9TLnstCFI0aywjwO+psDEA/gRDdiQCjhjLE4fJZBuqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="H/lVnO8m";
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542EE606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542EE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H/lVnO8m
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=scB/wdNHn77rOn8XuOwegyz93L7MG0cBY5PFUM4ImWI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213129; v=1; x=1794817929;
 b=H/lVnO8m1Sac2706uznVDfJOOjMcv/TmwFyofUliBSPJ5Tn6PI4gU4Lw1OieEKT7RcipLwgC
 STjm5Ps4uZTYyr21dBIUCj+xeC7gwuqB6w09bq/kZfOzVK0EXe4WCagGd4YVFtVWoDp0fF/H6YJ
 sm1s9PxO5nTj/GI69vomk4Ys=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8251e993a8e30812;
	Mon, 09 Nov 2026 08:32:08 +0000
X-Mizu-Trace-ID: 8251e993a8e30812
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
Date: Mon,  9 Nov 2026 08:31:51 +0000
Message-ID: <20261109083205.806619-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
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

With pKVM, EL2 saves a guest's FP and SVE state on exit into the hyp
vCPU, whose kvm is the hyp VM's and whose sve_state is already a hyp
address. kern_hyp_va() returns both unchanged.

Remove the two calls, in fpsimd_sve_sync() and __hyp_sve_save_guest().
The one in __hyp_sve_restore_guest() stays, as nVHE without pKVM reaches
it with the host's pointer.

No functional change intended.

Tested-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9958ca6d7b0a2..57c3f7a2d4b14 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -482,7 +482,7 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 	 * on the VL, so use a consistent (i.e., the maximum) guest VL.
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
-	sve_save_state(kern_hyp_va(vcpu->arch.sve_state), true);
+	sve_save_state(vcpu->arch.sve_state, true);
 	fpsimd_save_common(&vcpu->arch.ctxt.fp_regs);
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 }
@@ -531,7 +531,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	else
 		fpsimd_save_state(&vcpu->arch.ctxt.fp_regs);
 
-	has_fpmr = kvm_has_fpmr(kern_hyp_va(vcpu->kvm));
+	has_fpmr = kvm_has_fpmr(vcpu->kvm);
 	if (has_fpmr)
 		__vcpu_assign_sys_reg(vcpu, FPMR, read_sysreg_s(SYS_FPMR));
 
-- 
2.47.3

