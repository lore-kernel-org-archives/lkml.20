Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701032;
	b=R/XPGMJXUWk8LuMF/OZ2XrFPtbI11EDzzTbusrL+T5fCy6RkTV6Lg0sEXeu83EsY5+lY
	 2xQUDXt5uvQJFEldXJr/m9j/ra7bNbf+T5wnOZwIB3FBlDZNQb9dWbyLixmDTD3Al7DyC
	 0qNIdlUTmHt7wXeskRJTg63brQSFI/4IhlPh36jCTNt9h8UxYTM7ekVECXVyXw6G5+I7S
	 luvnqY3pOYFqJAUNd9evXt6gBRZcwf4IYYb8H0Sc1zSJc3vUSZ9cqHeYmd9zhKgE6f7rF
	 uHWw0M87fsX5afVx8j2Lhve4Mm0Gao1A/mWNji9Nd166t7cftkMIHEbHlPShxQ5bIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DxsW3DwwnRnbM7oQ22r7CqLQd3DQoYNNo9Jr9+0Xbzs=;
	b=dUrcQVbnVOGbwf+ZkHZGV2BpVhZkFPAZtOPbKtox2yY5zTHLuvcl/TZ1v7l0Oj/2ucGJ
	 2qipWnzgtbnkgl+7V8AzabeSOuizPBuKgMM58Yg7keQS0tGiO3zzuflA1ldkJbu9HnYd7
	 YZBFqv9OLsp1eZr+iKM6t1L4SK24N6xwwIULNOl35HKO8WjNZyu9l/ORrY4N2BhJotmqd
	 vpWp0cfkjvEDeMDKtbXJGQfgPKwgBrMn9xhaa+fzq5p8KdsOxfWSXIfDSuzWMRQDF8tei
	 rIJkerGZiTEv+ZcYQT6T0mb+Iu/yNAHoODsR4moxRk9afr0pFnNEodOOs1F3bCAGkrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jnYlBEpi;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CE360A2606
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CE360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jnYlBEpi
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ba4757baso1007965ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792701031; x=1793305831; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxsW3DwwnRnbM7oQ22r7CqLQd3DQoYNNo9Jr9+0Xbzs=;
        b=jnYlBEpiJhdqQbiezRQuuqsOeNeo1bt8ERSaARa7ZU7YcPswi+uTpGAUTQh25vxYcg
         7cwFuY06pIULoOQCl/J0tOtKZRcOrzI00QPltfmW7a1r6BIl0pOc+tAgjSvUd/7bIGwc
         4tmZVsS5InVbAdNZxiEtbiHCFnlbT5RpLjgxUuWLkiLWircr+ee2nkSu+X5Q6qv7ogjT
         9dQOBTYE0faysrtyRJ1WiQZKQFOiXApRNA2t9U+euXMsFvua236VB3mmm5IBkzKag9Aq
         JI7wwgsn6f4qyaCD97ZboANyn/g/h01gmt1L1fZpmSxDJxZwnXiyiZVqi5QYQymsiDM1
         tkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701031; x=1793305831;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DxsW3DwwnRnbM7oQ22r7CqLQd3DQoYNNo9Jr9+0Xbzs=;
        b=Qb9gTi1aAg5oJMS4TAIorIhMURtyOt937G60tqbmRYOtwjOlTNGVmoButSVjZ/g4Ph
         J4p6uTUV18iErX/fRBuzQhZgo3L9UR2DDYBCKWS4QKmVH48kOmu/3p/g5BucFtjLCZqD
         Y9jRe6wwRi8w05m450KliOqZdsWGb17SRT/ZRYe9esqpCrqr5+XRqYrxFGrzp6Httzfb
         HEH5yMCB9Jf6eZ7q2PNKYJxQyCoRaZwL9RD8TnBcE/60J/Wvu/kH9k/km7xuKK9wBeX5
         osuDMJ0Wdfba8ueaaJnNPFDU32MNYiVahC7G6M6PrVgKBb9uMlR1jXhOfh9kXVUzKQOD
         +kgw==
X-Forwarded-Encrypted: i=1; AKwUvByv72I4+3oZ5wLYC49u8tl2MQyZ6o6xxFhiOMTMxYxB9RcxovmB+SW4bwqy+n11k2CoeN4FYOF/mw9XsJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBTgJhcqjnCTiK9ukIVl0GDsIqmz+SroQHrbc30fOZ7LnkUVYm
	PT/djA5/q5BhgpYFneZg6Eji2roFC5CSmNbD9Mn/RqlhpPaW+57Y+mTVQm8LdHEbaqDZhHLbKEG
	tZdTYig==
X-Received: from plw21.prod.google.com ([2002:a17:903:45d5:b0:2e9:3db4:99ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2305:b0:2e6:136e:f264
 with SMTP id d9443c01a7336-2ea7d147a7bmr2918405ad.50.1792701030855; Thu, 22
 Oct 2026 13:30:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 13:30:28 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022203028.595318-1-seanjc@google.com>
Subject: [PATCH] KVM: SEV: Ratelimit all #VMGEXIT-induced info and error messages
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Ratelimit all of the kernel log messages related to #VMGEXIT and/or GHCB
handling, as they can all be triggered at will by the guest.

Fixes: 8f423a80d299 ("KVM: SVM: Support MMIO for an SEV-ES guest")
Fixes: 8640ca588b03 ("KVM: SVM: Add AP_JUMP_TABLE support in prep for AP booting")
Fixes: e1d71116b64a ("KVM: SVM: Add support for SEV-ES GHCB MSR protocol function 0x100")
Fixes: 8d1a36e42be6 ("KVM: SEV: Add GHCB handling for termination requests")
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 6427db390b1c..469a313fe7ab 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3654,14 +3654,14 @@ static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 min_len)
 
 	scratch_gpa_beg = svm->sev_es.sw_scratch;
 	if (!scratch_gpa_beg) {
-		pr_err("vmgexit: scratch gpa not provided\n");
+		pr_err_ratelimited("vmgexit: scratch gpa not provided\n");
 		goto e_scratch;
 	}
 
 	scratch_gpa_end = scratch_gpa_beg + min_len;
 	if (scratch_gpa_end < scratch_gpa_beg) {
-		pr_err("vmgexit: scratch length (%#llx) not valid for scratch address (%#llx)\n",
-		       min_len, scratch_gpa_beg);
+		pr_err_ratelimited("vmgexit: scratch length (%#llx) not valid for scratch address (%#llx)\n",
+				   min_len, scratch_gpa_beg);
 		goto e_scratch;
 	}
 
@@ -3680,8 +3680,8 @@ static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 min_len)
 		 */
 		if (scratch_gpa_beg < ghcb_scratch_beg ||
 		    scratch_gpa_end > ghcb_scratch_end) {
-			pr_err("vmgexit: scratch area is outside of GHCB shared buffer area (%#llx - %#llx)\n",
-			       scratch_gpa_beg, scratch_gpa_end);
+			pr_err_ratelimited("vmgexit: scratch area is outside of GHCB shared buffer area (%#llx - %#llx)\n",
+					   scratch_gpa_beg, scratch_gpa_end);
 			goto e_scratch;
 		}
 
@@ -3701,8 +3701,8 @@ static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 min_len)
 		 * limit the size
 		 */
 		if (min_len > GHCB_SCRATCH_AREA_LIMIT) {
-			pr_err("vmgexit: scratch area exceeds KVM limits (%#llx requested, %#llx limit)\n",
-			       min_len, GHCB_SCRATCH_AREA_LIMIT);
+			pr_err_ratelimited("vmgexit: scratch area exceeds KVM limits (%#llx requested, %#llx limit)\n",
+					   min_len, GHCB_SCRATCH_AREA_LIMIT);
 			goto e_scratch;
 		}
 		scratch_va = kvzalloc(min_len, GFP_KERNEL_ACCOUNT);
@@ -3711,7 +3711,7 @@ static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 min_len)
 
 		if (kvm_read_guest(svm->vcpu.kvm, scratch_gpa_beg, scratch_va, min_len)) {
 			/* Unable to copy scratch area from guest */
-			pr_err("vmgexit: kvm_read_guest for scratch area failed\n");
+			pr_err_ratelimited("vmgexit: kvm_read_guest for scratch area failed\n");
 
 			kvfree(scratch_va);
 			return -EFAULT;
@@ -4509,8 +4509,8 @@ static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
 		reason_code = get_ghcb_msr_bits(svm,
 						GHCB_MSR_TERM_REASON_MASK,
 						GHCB_MSR_TERM_REASON_POS);
-		pr_info("SEV-ES guest requested termination: %#llx:%#llx\n",
-			reason_set, reason_code);
+		pr_info_ratelimited("SEV-ES guest requested termination: %#llx:%#llx\n",
+				    reason_set, reason_code);
 
 		goto out_terminate;
 	}
@@ -4678,8 +4678,8 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 			svm_vmgexit_success(svm, sev->ap_jump_table);
 			break;
 		default:
-			pr_err("svm: vmgexit: unsupported AP jump table request - exit_info_1=%#llx\n",
-			       control->exit_info_1);
+			pr_err_ratelimited("svm: vmgexit: unsupported AP jump table request - exit_info_1=%#llx\n",
+					   control->exit_info_1);
 			svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
 		}
 		return 1;
@@ -4688,8 +4688,8 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 		svm_vmgexit_success(svm, GHCB_HV_FT_SUPPORTED);
 		return 1;
 	case SVM_VMGEXIT_TERM_REQUEST:
-		pr_info("SEV-ES guest requested termination: reason %#llx info %#llx\n",
-			control->exit_info_1, control->exit_info_2);
+		pr_info_ratelimited("SEV-ES guest requested termination: reason %#llx info %#llx\n",
+				    control->exit_info_1, control->exit_info_2);
 		vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
 		vcpu->run->system_event.type = KVM_SYSTEM_EVENT_SEV_TERM;
 		vcpu->run->system_event.ndata = 1;

base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.257.gf7497c7d27-goog

