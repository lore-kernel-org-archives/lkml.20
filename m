Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D651FCC2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801587; cv=none; b=rVoVLOxrVbsEtGX5/GEyOc8HSyRLED1eU72gUO3vOlJsxxTxDQtXdruVDbOoH1KGb2cf8cRC8q4KBWMCc7w7eZIDxk+P7xyilHyOs59OgJgHZvLYKDeWAslU+zeYno8cAfKb1UUw4AwQwsm/VVo8Bknwgh+eqvY4T9FJ4/Nyf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801587; c=relaxed/simple;
	bh=ynbSWc5hwfhoV4Dk2YButIF26Cwed7fkSyPCp3V2/0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QYYP0FHjulPJuis38UVEJH3Bh9JJTDlQ8CRYkMZKE0VOcgvW0BphiovIL3I+9RNuSETUG+j58WMLgdq+AAl4vdGWDyt7K39HCepVJULXCGnV0V192oPeZELHSVxEF5hCQT9SCMzJAgvhfjKlcwX9PnYNOBiL++ATPz8QQX5HIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C3UyqmN8; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C3UyqmN8"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4858f06e142so1773841f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801584; x=1789406384; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azXNvPaknVBy0Syf3YnOWO2EVMjwE6S1Z11nRdavFo0=;
        b=C3UyqmN8Qv2swfWQ7sFwov+TRkVJxm1uLmGbIzPxPXebVQXmyhBodvyacqydgOrzij
         dedAkX64W0MKIyB9InHis2zWL00TcvS1mVLC90fZav0YKKB4H8ut6Yq3Zb3ZQeBBarqK
         m3T1IWSpxH/30cyxDCanFvQekdcpPDEfUxC9XVA4MfpzzG28tGxEGOhGMflwjq42S/Sx
         3eOaf3NG6K4tdRPjnASfqhSdlOo46ltcy5qYS2Jh2SOifM9PEfTb5N6ZQYuIedGrIBrG
         oFq+n3T3eEPpov9XlTB4wnh6e3CrNOQRoMlAtEKJjgssE1d/WKshq6LCsheqGLMDUHo2
         Cc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801584; x=1789406384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azXNvPaknVBy0Syf3YnOWO2EVMjwE6S1Z11nRdavFo0=;
        b=FW18ENj9id2yjHBeyV+pDuPJx1tXOTs8v0xBoi87RT9OkGJRt5IOqtGBlgOzWaMWCy
         51wK6I4DPG3m1WnB2yU5lMfWwexcrtCcgxpMUU99Y/QWAL5OWbD+qpwiBnYczjX/NOU/
         /cZeoTl0Jh+p+oUYizu3Noy9udkuHzv/3Hh5W2k0YZzQp2gT6cYLXzx/+dT8oJpmEM8n
         wOWZYrm2QkVhRejkg0viMV/tD+c3sDcqHhemPESH24yI6jm1LrHQ3EBtRTeOkHzYb8Ng
         Wg637u4EURnfxEQoEFqUegNLTSLF2UfTURoZ3nGolDuRq0LoSXFWUq7Wadbvp3aouBcx
         QfXQ==
X-Forwarded-Encrypted: i=1; AKwUvByxz1Y6Ianf3djIu2v5OSxVMOKyVjzKwI2qk4olrpyX5e9D231GQJ8S3sxY/7SQB6IHEaHDFuWzLI6JoCI=@vger.kernel.org
X-Gm-Message-State: AFuF++lhjgrFP7XDTvzyxW/aj1qWl4EsrSupwbXEuve5NR9/1UpDyZQj
	zYyb9RVIyiya/l3NwqUBxsfhy/iyjRN8Cw34EN1MdkEbXMpWCnWN8sHXQnLTa5qk1uDb+/WujNx
	GyqCdrjVOAj0yRWlCrJt6P0YorH+r2w==
X-Received: from wrwc18.prod.google.com ([2002:a5d:63d2:0:b0:484:3922:d684])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:993:b0:485:847f:fd7d with SMTP id ffacd0b85a97d-485872d5061mr24058104f8f.24.1788801583354;
 Mon, 07 Sep 2026 10:19:43 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:27 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-6-sebastianene@google.com>
Subject: [PATCH v9 5/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Allow FF-A notification GET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments sent from the host
driver.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 923f32caa04b..e11fb06df63d 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -695,7 +695,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -954,6 +953,27 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
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
+	if (flags & GENMASK(31, 4)) {
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
@@ -1025,6 +1045,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog

