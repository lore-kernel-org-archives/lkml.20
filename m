Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630E50E5B0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739455; cv=none; b=RL626I8aTTeQtLZwpGkTc5imGD3PsOrmV5IyMeIcvDL6qufV/1qiXuTdHPBz+8sBuI0+3JCd37pWuSs+gIQvp+bkw8fqexWZzfZO5TudIRegvxtKFWWl5XUsU6q9Ow5dVptvyvJoFAOMw3dbb2yxWKc09ztL1CysF082eljP+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739455; c=relaxed/simple;
	bh=IDdx8seKYGYF20kLoeN7QM383DqvGI0t0HDym+gz6So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhIjM9QfouyG88iBvS91ku+WZVRUtOzUtoJ88OH/ipY0hRovbLrPxddnWeqcR7uIIZzl4OzA+C+3rHRszh0eWq2I55ZvqppeKwuzUb6WDdf/og8DVTm4WO8e+UUXirzbgcyQ+C7WgPAoRUgtva9VnTPgIBORf5gb+3vvdYVOCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbFs44zH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbFs44zH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789739451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeIIifAP8dECG6rF5y8e27VWBzyAC2fAeaT/Yveqge4=;
	b=KbFs44zHTbBTE6dvlt1uMfvi8s1L48pUOB77YQZCzO8+S1UOT2PYhe+jky06krL9KD5INS
	iDgOSvSu865YmJ4sDZd7yYQaQBt52J9zUZhTrwVu/WzNfdG4IQJxD+01F7LuFmOeorPqYj
	5w5H3CP42ofQ+n/vfmth4rjxGeCj1eo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-915QVdSKOIez2_xsm8pjsw-1; Fri,
 18 Sep 2026 09:50:50 -0400
X-MC-Unique: 915QVdSKOIez2_xsm8pjsw-1
X-Mimecast-MFC-AGG-ID: 915QVdSKOIez2_xsm8pjsw_1789739448
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D39141955BF9;
	Fri, 18 Sep 2026 13:50:48 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 36EC7214;
	Fri, 18 Sep 2026 13:50:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH 19/31] KVM: loongarch: do full validity check on the gfn-to-hva cache
Date: Fri, 18 Sep 2026 09:50:18 -0400
Message-ID: <20260918135030.171564-20-pbonzini@redhat.com>
In-Reply-To: <20260918135030.171564-1-pbonzini@redhat.com>
References: <20260918135030.171564-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

If the HVA or the memslots are invalid, reinitialize the cache.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/loongarch/kvm/vcpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index ed9e092c97ba..d540004d74ff 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -165,7 +165,8 @@ static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 
 	gpa &= KVM_STEAL_PHYS_MASK;
 	slots = kvm_memslots(vcpu->kvm);
-	if (slots->generation != ghc->generation || gpa != ghc->gpa) {
+	if (unlikely(slots->generation != ghc->generation || gpa != ghc->gpa ||
+		     kvm_is_error_hva(ghc->hva) || !ghc->memslot)) {
 		if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa, sizeof(*st))) {
 			ghc->gpa = INVALID_GPA;
 			return;
@@ -1811,7 +1812,8 @@ static void kvm_vcpu_set_pv_preempted(struct kvm_vcpu *vcpu)
 	gpa &= KVM_STEAL_PHYS_MASK;
 	ghc = &vcpu->arch.st.cache;
 	slots = kvm_memslots(vcpu->kvm);
-	if (slots->generation != ghc->generation || gpa != ghc->gpa) {
+	if (unlikely(slots->generation != ghc->generation || gpa != ghc->gpa ||
+		     kvm_is_error_hva(ghc->hva) || !ghc->memslot)) {
 		if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa, sizeof(*st))) {
 			ghc->gpa = INVALID_GPA;
 			return;
-- 
2.52.0


