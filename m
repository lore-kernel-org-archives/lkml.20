Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641523;
	b=kEVmt1o52bPkQvrvDKn9ibuWGER6bwhtx/k26aPPSD3Cti8qxn8ckd7RM20pmtghTLNm
	 r0MwEaoHsPV3Nzjwd7Z5lvpunK+2tGfyewTbmejU7Tgo9izPcmBE9OCkKvE6gFikZOHmH
	 8PB80TW2JmxFddBmWaRJxqALwuwMtdzgdhZb9DZOqgtFnAq+7FZzG1+BW9GYiSW1wsk0M
	 5Ci7ZoB4lMccT0BTvFNbcFBZIni2En/Ng21KzmjEfUQCuCg8WceN6uMAoL2Eo/dTcVR1e
	 GIyD5+VliDYsPXgAz9NB0gF4xb/x5SKdMa3fvH+yDNaVHKvBHAZVbm4vSjmAASUuIgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641523;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=XC9Is9rXqzcPBG5x4tSNSc/H4OLmgshhY/d9C2DzEVk=;
	b=tuVcK/eV2dRKs/Clp5V6oNV7It7qJKzsfwqqNlFKtZ1tVb9kw8aptyrLRQ5FjEiviBcA
	 xd1Iwt7RAeG5yzMH/X5BaqIC2NVvkUL1x88juzCihG+/nQanvNokfotFgzWPPTbxEkJhV
	 UzMzpGkVgbA6fXVRlSw/hG9/0Lwq2aOY0CHt44izsbrgc0sNOSwnNDVzCskh3mBzCZEK4
	 TyWGp4y/nvOvw/yuEW3Hm8Hk09WllTT1Nx8MR2BMZdUzwukal5FWuUyQVcAjBJg4tEcz8
	 HvZ3Z+NHH9SCbIDU7jQCxxAfsGfr4mIJ3HQPGLh4X3HEa3yxibns60Rh62lSoEiootw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HzPfOU1g;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87336087622
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87336087622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HzPfOU1g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XC9Is9rXqzcPBG5x4tSNSc/H4OLmgshhY/d9C2DzEVk=;
	b=HzPfOU1gqr9k6dS10iLsiP22kTt0Sn3EDClF7oc7aZTp+voOg6jSMAD8lT5zUvMA2Ns0Dr
	c+/0+KgbNb1VM9+zlUFQSWh6PczwKtYjIxKpmKLEVMEHExGl7V1QR+z6nGESqmHmlIkCmM
	zMP6DL6ojLq48bj8AixoDTTs0TCMK7U=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-307-idWzm0NjMemLf-cYkJFKAA-1; Mon,
 02 Nov 2026 12:45:20 -0500
X-MC-Unique: idWzm0NjMemLf-cYkJFKAA-1
X-Mimecast-MFC-AGG-ID: idWzm0NjMemLf-cYkJFKAA_1793641519
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 826D11955F6F;
	Mon,  2 Nov 2026 17:45:19 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B8981956087;
	Mon,  2 Nov 2026 17:45:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 26/45] KVM: pfncache: Fail to refresh if it contains memory protections
Date: Mon,  2 Nov 2026 12:44:53 -0500
Message-ID: <20261102174512.8903-10-pbonzini@redhat.com>
In-Reply-To: <20261102174130.8779-1-pbonzini@redhat.com>
References: <20261102174130.8779-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Nicolas Saenz Julienne <nsaenz@amazon.com>

Similar to how pfncache disallows caching gfns mapped within read-only
memory slots, gfns marked as read-only by memory attributes must
fail to initialize. Unsurprisingly, the same behaviour applies to gfns
mapped as non-accessible (NR/NW), while non-executable mappings are fine.

Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-24-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/pfncache.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index e82247ca4637..ed8884a6d240 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -298,7 +298,18 @@ static int __kvm_gpc_refresh(struct gfn_to_pfn_cache *gpc, gpa_t gpa, unsigned l
 		    gpc->gpa != gpa || kvm_is_error_hva(gpc->uhva)) {
 			gfn_t gfn = gpa_to_gfn(gpa);
 
+			/*
+			 * RW memory attributes are incompatible with GPC. The
+			 * RW protection check has to happen after storing the
+			 * generation number.
+			 */
 			gpc->attrs_generation = kvm_mem_attributes_generation(kvm);
+			if (kvm_range_has_rw_memory_protections(kvm, gfn, gfn + 1)) {
+				gpc->uhva = KVM_HVA_ERR_BAD;
+				ret = -EFAULT;
+				goto out;
+			}
+
 			gpc->gpa = gpa;
 			gpc->slots_generation = slots->generation;
 			gpc->memslot = __gfn_to_memslot(slots, gfn);
-- 
2.52.0


