Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429E551FCA7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801582; cv=none; b=sMTWlCN8O3B+9hVzaUQ9UtLgjG3GWo1TxU+hKcvMEQtMMrAKQRv7NdPiwrfl8uiFQrF0xX07XcFFmtccK1jrBTTlR6lORelom7c5h/5/MY5rBW945EuqKA1XYadrbh0PFBQotW+O3kpEpLXaVw2H2bIxnNjBFb6YYyX2EQveBYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801582; c=relaxed/simple;
	bh=2k/WVnGhr9Q5gGIcYxANFK+tJ+UnkdoNdQN+SRoygi4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gSyh/2xyzANbVlixN8eYk7dkTYT/+PM56shX6I4We6u26iC38m2U0p8Q///RTP+rXw+JXJb7zspBRa5ofUoBSj4K016pNgvL6cgp/jOlBsERub5vW8hANLAf4d2pIdo/Qzi6GPvIHsUlxqwg/4C3JAQAItampQwFPh9Yg1nUiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=flZVnQoj; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="flZVnQoj"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482ccso4096375a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801579; x=1789406379; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0Sf8m75gFeh91WC+y7QYQ8hJssugbj/b/PWhI9KP38=;
        b=flZVnQojQIFp6Cw31/KMDzSj7alhjnAL0NNIPYKUa9WqQRNuSSNofXEalVDccYJHkI
         z2Gw8D5ppHO1jwQQiNztMom7LYDtn6MhrK6tGbUawvl025XfCoqB3iNVTVofLtOMhGW1
         O50yQLLdyCLBUssTZExSA5mCCGKAh22rDTGIjHAj2I3WuyKHJ6Mlgf+MFlWWutlmUMgA
         Sr/Y2WCDykqYeCAmgSfP82gMZBwlUasnbHNR9MEuL0/+Rq/QoLoeT9xSyB9iqTfN1tRQ
         NKatcEdTQPsZqR3P40nlw7Esq6xPRHDgJeI+MDR/ymPhb4U4SRtXWDYIwM5SdhQZJgFJ
         5Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801579; x=1789406379;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0Sf8m75gFeh91WC+y7QYQ8hJssugbj/b/PWhI9KP38=;
        b=K6Au2fJeWNzgJPOQvcfELMqnt1r6Rw0pPGjnwHDerv41VatrdNxMiZ7SLUh+3vgi1j
         e6IWu2HoCwPaxsYZWYyHeeqrUorpEkxGD50XBVT11k6wPZbvnbdivY5zKg1o/SdUqfNV
         BHMRNG08tAIZJkOEDvKE6hrzDS9v4s/Gecz2WLSNXg1SLM8P9eL5eICRsl+MvbQ8m1QM
         J1tYR841sPDW1bOfweCFYDtVSFhIYrg6BGzdF0mORZ78fr+uKTy6wMPXEbcrc/MZlP0z
         I/rMxEeyQCWwR3dsBAZ9/hL+Hk1e/wHiqYoKtUnMJjqidInFBGP6Yij20loBhehRcU1e
         4ihw==
X-Forwarded-Encrypted: i=1; AKwUvBzxRvNyECCxCadqp2lmjNDIl6AN5vHrvKxCfPN6fWYVP2W1C8SbNhIxD8p2cUSQ0gJhzNBv+PTXNb0Pvq8=@vger.kernel.org
X-Gm-Message-State: AFuF++l9W25LXldWjstRUCR8GTHzZOK2Lb+EzT/mEFMQiU07+C6rtKeb
	tELqgKi12HGJ1+RrKmctNbVTh0gF54QBQ31v9LwN67KFAyXqpc27jaib5gOQ6PK1bz7ebCDV1VS
	gv+YcjK2LQ11Y4lFXvk1P/1Qto459wg==
X-Received: from edyg17.prod.google.com ([2002:a05:6402:1811:b0:6a6:781e:6d4a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13d1:b0:6a8:30a:7ceb with SMTP id 4fb4d7f45d1cf-6a8030a7d90mr5253391a12.32.1788801579063;
 Mon, 07 Sep 2026 10:19:39 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:24 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-3-sebastianene@google.com>
Subject: [PATCH v9 2/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Verify the arguments of the FF-A notification bind call and forward the
message to Trustzone.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index aa82c58380a8..89872e12f9d4 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -42,6 +42,8 @@
  */
 #define HOST_FFA_ID	0
 
+#define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
  * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
@@ -692,7 +694,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -891,6 +892,27 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags > 1) {
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
@@ -953,6 +975,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog

