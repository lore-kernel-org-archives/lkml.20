Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559352120C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801586; cv=none; b=tgW2K2IsvrB8CeDCk9hIw2kRTVkvz48L8iWf9zCjrOCqlbyqHV19n/W7ZwGZS+2XKZiSikCnl6a9vvb7teV/PhuOkL0Cnl5X+af2m4M+9H5UCXXux9twxvFIFX22xzpKb+pQ2E4LVS3U/QvkdBsATu2jVqwXVmEKGoZfWf9rcvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801586; c=relaxed/simple;
	bh=63z8K3Bsh7HYRRQh3b9CFMk8m74jI/5sw5q37ngLLic=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MXxnHQsTSmU2HMlV06i/NYN9HEGL/8RsvDCk9O2nbp2DJz1v7W38vog7yV4ozA001w072XYiIzC6YYcQbo1V5E607RahJZpvAMjqyK8eSEsJwAL/qLhAyVFcI3MM7TED6YF5cRr/DJBenEAytsNXNafolq09ynXNNjWTx/hBShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vLiHIqZz; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vLiHIqZz"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso25630595e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801582; x=1789406382; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piiRWCJ1kku+wXo8orOGF6kurBcejDUkIGQIzstV9bA=;
        b=vLiHIqZzmVxbzzNb8SyBTd+FrmjNJHokXS1yWnNxo88C4+Gug0cEWVQ/u9DMg8/2fq
         a52XprUnXJoulXeL4fhgUEYkIO3Tcxx8fuXIrvEvkLJwLQ+eJJW4NsQaJPLbT+a2Ifdj
         k67a2bDIorKhqupPmwtq/2o7q044JYNU2kMR2VWK8ExwaevtJyq0Ybr6eeEJ+ZH2pbW1
         AVKdjqG4LPR8XtLVFN0FWPg479jMhm11hn979fsVEWSBSQi1k1cFl+WZyUkPB2q5O7rv
         /BKhFHBFKWFrNXEXd9RnOC1tLeEGuR6eN62FNnulx9vOHMU01um6htWdgf77BJNCyV8S
         QVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801582; x=1789406382;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piiRWCJ1kku+wXo8orOGF6kurBcejDUkIGQIzstV9bA=;
        b=ZZR0VMo39s198Oem8ij4ducel6Al+AN/lAdRhQkyhvdb7j3UoZB4uctEipOY9vx8sE
         lrBpYbQfQbv8MQF9H8VktcdQf9++a8nvhIt37d0xbFKW94t2VhIbLrqkcunmw4+662/T
         JkoZo84Fo8Lj5Xmmh49K3VMElBHEg9l0bB8pENgFcvet45tAu1pqCOwo1X3WDq4dckUW
         JGxAymERfadavqpd4sCEIxbW6g3R4mFYqkBDIZ/cD+BWjbtyjMzyboyc3WTXp+3YuCk9
         wtVmy7I0XfNwtMnezijS537Qe3tG4bOKQFfAQqrS8UZ9rLQAQO8ujUPoQNH5y5zjkHUj
         PiRA==
X-Forwarded-Encrypted: i=1; AKwUvBwK2Sznzxu4xQYhYeHtabtBKSuXUtjqsGcOl/yBrK/OvVSuTe10PfpGezJ5GBWDPveREgwEEomTSHI/QjU=@vger.kernel.org
X-Gm-Message-State: AFuF++k3GNrMaci5WyVW5Qa9fAsVCHBKNL7qxxedheKVOhOk5Us6zRwj
	M0OyG93NJJWacKOirA/fJhSg4X+CiVctKqWJ+hfxavyMhvOAbhQoD173BTn5DDWjhNC7RezJqaf
	iRY2Y/YspAPsr6BXagNI1bwbVFWqlRA==
X-Received: from wmjx23.prod.google.com ([2002:a05:600c:21d7:b0:49b:96be:bdd])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c48f:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cf825d507mr246019025e9.9.1788801581830;
 Mon, 07 Sep 2026 10:19:41 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:26 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-5-sebastianene@google.com>
Subject: [PATCH v9 4/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Allow FF-A notification SET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a1ba4463d1ef..923f32caa04b 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -694,7 +695,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -933,6 +933,27 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(15, 2)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res = {0};
@@ -1001,6 +1022,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog

