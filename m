Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C4344021
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579045; cv=none; b=WDgqvqgL7Iu4aAuoon8OLBjisl9ZC49xiww5q123UBfdhzUE9vSNd/m20ii1RuJHdbAciOFsGuer1ObgYtWPBIPTpiRQp/yjeUGjhadVz3EppTyGBAeCZ7XaGVzVNIfWPD843wi/3PKE4aDfsZyTjmJ4681vFn80EZImHLJhgKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579045; c=relaxed/simple;
	bh=lm9y59s9QUCct3bwQXRUuFWBGJM3yHKkxi7/XtkH1cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpTGZ0DAYzm8mj6TFfV37UGYF3N1nGORRkACZsIEawtDH+ChvmKjcA9eu1KnbCUB0Vc+nBlifyN+NrDqIfTK4RpXbfRoCf/obYX4EtEJVXJ8RaErK0fYXV+zd4IoG6TOdsXjbXP+dRHgjg8FJV12J4s69CIAgBn4xZ1zTvbIzxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DMhszGV9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DMhszGV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791579042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUFhx0GbPPget1SdFI2jKKBx59ydAAm1+QrBW1wqlM0=;
	b=DMhszGV9ms0a3JZpxOv4CEbT74Ec9PAUbbvoTfHkL+6z4N+wkkqB+XPunuF30vEXtknb1n
	f8nDt7Gbc32NQV3m6tSgoyN9uIS3zbkoasug9CBbKPOZYT2VuA8xMIG2ODm+S5z20z1v2j
	mnSozCxC+TwyUCR4Ai7t9IpiEmZRmq8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-kD1_XAVGMkOCZm2wbF9kJw-1; Fri,
 9 Oct 2026 20:50:41 +0000
X-MC-Unique: kD1_XAVGMkOCZm2wbF9kJw-1
X-Mimecast-MFC-AGG-ID: kD1_XAVGMkOCZm2wbF9kJw_1791579040
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08F02182F55B;
	Fri,  9 Oct 2026 20:50:40 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EDF1C1800299;
	Fri,  9 Oct 2026 20:50:38 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-kernel@vger.kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH 1/2] KVM: nVMX: don't check PIR.ON when processing nested posted interrupts
Date: Fri,  9 Oct 2026 16:50:35 -0400
Message-ID: <20261009205036.672523-2-mlevitsk@redhat.com>
In-Reply-To: <20261009205036.672523-1-mlevitsk@redhat.com>
References: <20261009205036.672523-1-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Despite the suggestion to test and set the PIR.ON and avoid sending
a posted interrupt if it is already set, there is no requirement
for this bit to be set for posted interrupt processing to happen
when the target CPU receives the posted notification vector.

See section 30.6 POSTED-INTERRUPT PROCESSING:

   "The processor clears the outstanding-notification bit in
    the posted-interrupt descriptor. This is done atomically so as to leave
    the remainder of the descriptor unmodified
    (e.g., with a locked AND operation)."

Apparently Windows' implementation of APICv does exactly this:
it sets bits in PIR, without bothering to also set the PIR.ON.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/vmx/nested.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 151873407abd..2142e25c9b6c 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4041,8 +4041,11 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
 
 	vmx->nested.pi_pending = false;
 
-	if (!pi_test_and_clear_on(vmx->nested.pi_desc))
-		return 0;
+	/*
+	 * Don't test the value of PID.ON.
+	 * It is valid to trigger a posted interrupt without setting this bit
+	 */
+	pi_clear_on(vmx->nested.pi_desc);
 
 	max_irr = pi_find_highest_vector(vmx->nested.pi_desc);
 	if (max_irr > 0) {
@@ -4209,8 +4212,7 @@ static bool vmx_has_nested_events(struct kvm_vcpu *vcpu, bool for_injection)
 	if ((max_irr & 0xf0) > (vppr & 0xf0))
 		return true;
 
-	if (vmx->nested.pi_pending && vmx->nested.pi_desc &&
-	    pi_test_on(vmx->nested.pi_desc)) {
+	if (vmx->nested.pi_pending && vmx->nested.pi_desc) {
 		max_irr = pi_find_highest_vector(vmx->nested.pi_desc);
 		if (max_irr > 0 && (max_irr & 0xf0) > (vppr & 0xf0))
 			return true;
-- 
2.54.0

