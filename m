Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB385111BB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801584; cv=none; b=sAXKsNOK5HcvOdELAqMGruidIeiBq/HIt9U+TWNXA4iQMzL5rQAiAPGB0lUlrhWxF3achYIsagHoXhK6h5BIAZKvpqxyarETZqDv1PcvYeVloeeHq8mobkovsB293HE6pe76yqcuoCWrQuoX5GuB3oRJRItPAbyiZTGad1IQ9gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801584; c=relaxed/simple;
	bh=AWCUXF43ysfgI41lpMKTvK41BHIZRzQWcWHwmf2PRAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ubEcsARS0i2cjHaZ6MjCSjBofcmZQ/jR4mD84lRe3pZCgUVQ0yoBWMl2Xc/DxneOdUI0dktGpOS0o3xSEq7Ot4lJxBo9THoQzV74hMEc64BvmXanYVSsM5LuV2u4ucuVGSnpn7cj7PW9aNFo3ozSUA/Bo3+FAAqOldRjh600DHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HkwApPDs; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkwApPDs"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994aebe932so48238165e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801581; x=1789406381; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNLhfgvrYwznedAczU/yoh7OJ0T71JIKxZfqgfryA8Y=;
        b=HkwApPDsb4XrUkxxLIOk29ZGyrFqZ9Y4WBA6BfNw+XWwlbDMcyGOJKWeu+FektoC1v
         +ReZ9SAdzK+7SW2e1dfz+KoXHXJX9v1t/78aFbB6doc2USEQvqsVuvUKD9gVId9XL7Xg
         sot8wg9IDbSGQeqjOxdOLv4HurnY3CZulgbtulgqDbG9S0Py3rxL8CGXT/N+n48kxBfY
         kIZvwndR+nl1eo6VCVQDHD5vwsuqzySf/sneY6QvjoRKQTdl1sSSv7OTJ5tJqMODJfHT
         2mCXAT9yRU4CebZMlV9x3BiYpR2gDC4PrqINXVOJXc1vlrsdO6cpqagO5b/UcKwtFwaV
         us3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801581; x=1789406381;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNLhfgvrYwznedAczU/yoh7OJ0T71JIKxZfqgfryA8Y=;
        b=hDwKCrUEDXx8ZErccFg/V969F004nlGG8B1UmlMRsxzC/j7ahRww2qkq2GsuHPEW98
         JZTfgDwJWWaXCCDUceup+42gFHI8aMR3wfkSLz1L3WHBUn5iRTeBaGXAQ9o3MhVnlR5k
         cglDn4Cw46fIlHv8gnxZky00srjlwEnur/CG2F/yNWec4G4lcUvAa0fq4w+M24OOTOpk
         wPrP104TbQ1n290tVbJgNxOO18vWcDo8RZYFBQW0DYRKupG9SvG8GxwXhO6jxLGyNCiA
         KWlECaiMTQXk/lUVoL+EMCa/imDkxKGTZk28ACAvwA73yAxnONGjLIOyd8JCUsHUjnCj
         Bgaw==
X-Forwarded-Encrypted: i=1; AKwUvBzJuBrHsftYUyw0+yZlNqeeRlMFKyCZgNpA7BeffCMZMl6BgluyH6gK4b9V/cmUnZ5n/76XasGFd/9lLrg=@vger.kernel.org
X-Gm-Message-State: AFuF++leZtJhdcQ0y15Cj4vUQaJJ3Hkntt8taH2xWN1wWBcp6mwVRZRB
	shvc7QtNweykP5J1wOGTfZbs/j7HWQKLG0VXmruO+08pllyy4NRQiZruythT5Kkqcr7s7kjhM2X
	Y4n4r6y020vmDoVmuWg8jFMD/NB0H2Q==
X-Received: from wmco24.prod.google.com ([2002:a05:600c:a318:b0:49c:caed:426c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id 5b1f17b1804b1-49cf81e366amr589515835e9.5.1788801580595;
 Mon, 07 Sep 2026 10:19:40 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:25 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-4-sebastianene@google.com>
Subject: [PATCH v9 3/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Verify the arguments of the FF-A notification unbind call and forward
the message to Trustzone.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 89872e12f9d4..a1ba4463d1ef 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -694,7 +694,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
@@ -913,6 +912,27 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, reserved, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (reserved) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
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
@@ -978,6 +998,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BIND:
 		do_ffa_notif_bind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_UNBIND:
+		do_ffa_notif_unbind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog

