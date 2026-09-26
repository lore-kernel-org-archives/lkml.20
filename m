Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36C38E5E9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404655; cv=none; b=DqJrwAiw5UKAI8/bn4HcGxgbDb3pKP6GJAAqOHW87kRuULT8W8Q8HD8teqFh7Cv8uIHNssqQajz3yEdU3fSKaSWDmP+Xd9HK4jZeDHVlYwR/nCMFWMYz9/jxfvf6ynU/t4Wqx06ST1qwN4kTmm5YYj9oy9Q848XdCM9wQsJ56Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404655; c=relaxed/simple;
	bh=4uMF+Zyheka+eW7kDUK3k8FRqJGU0Etmiqlk+J0Llxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMVKWnXgwxWn62YSirU9D76trrJMHEb8d8RDf1otBMfjjeiBmHNkF/HAcYaCtKgj8Wd6KjpW3li0eHFLDlrSpWHFPoFLI3BNyyh1fdSgZSzWXWtiEu+tzJ//x4uu8PN7SXt2csqJjo54XxLGy9MgwDcuEOEkE7YbzTK58OrPI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThY8gsz6; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThY8gsz6"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438e88300cso1348680c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790404653; x=1791009453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtzEc8ALe2Ni0U200YE53lUimcTmcbv5pev4EjEWMTg=;
        b=ThY8gsz6vsuo9tV08Gq/VdQm2h6L00V22bSKLP37LYHAMtsY55eSV31DsV1s92+iZQ
         fM8ZOGMjjcjw1crB5n4QGlVANdPzls8UNwx4Po6D2QZEMYqVJhJ756T42WYL2ucZo5Wp
         QbgAgAHWmHaCnjctr5jN/AmvXS25RquQk/GSnGclhPZUOuArJpEXXZOSlpv6NlHIYXnZ
         blLx7LttXt5SHf1eOT7RjjCnZDeSgJ2Qb+IZsTjFWBklq5W3bLmOOouz03OjNbQJHkmZ
         VsaGzfwvRHNGgUUADCkPHoF6MsTMvpbO3f23MV0F03QGMkhIOV2Jal8hiz+zNyxdUn8y
         m6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404653; x=1791009453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtzEc8ALe2Ni0U200YE53lUimcTmcbv5pev4EjEWMTg=;
        b=MDsH6rL670w7c/MshWcabuStVPScObX1a2SE3q/5DUu7Nnb7a19LtEF/hlHLbkk45f
         p1X5sRLiIUxJv+kPTxN5qStCYg03w+/7FBS8LfYKLb1VedjfDzRLrHGhNPAtqQUGL7or
         TA65upicpj1lje8tz/79e+JPaQtJnmG7E3y9Ze+oeC1l3Vp14HHUT/TQKTtNONI9qB2H
         FnTsx+q2TVJKU3gMJjdPEVUwA+GL8cJTv3OY+43Y4twfxzrO33Hf++4dldVpSXyGy6dq
         10iKh2bSttW2P2AsJMd92FLxRpP71pYjKUEbZjP9nWJAdM+VzytYcnjSJOdPX5oYxKAY
         l+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTLO/rJN4xLoRpnEcCztvaMEFro9jAbv7/hT009lgsyLWPmYCdQhLHJUNFurB/CB3OcbKyl5uoQpWhThc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhyEa9M6XrS6yHDYU74Ypso2Z1/AZsYjV4J/9F8ZXCDX70heL7
	/HSJQzvifWT98lgZ62y7s01f8jRqmTST380o+xUTShz0Azz4pbd3GcUy
X-Gm-Gg: AYBFou1f0G5bIpfenr/KCHAokhz2uhO1kY6uxCng+cq5MZ22CrC6UN6nG3MYj1kEmCo
	ZYktgeYOFpHdfe+zNbswMj3yjcRQKTaXuOm0/MGiTFmSeKmalLtfTY0g4Ir1Ry2WP++USwc0Fak
	/I/J+31zlygOrtVWM1AsO2ajTxuof6EyCegif7Otx+9P4INjeMnrF2VJr2mw+xcwwcusiBylG5l
	5NDkDLpZV3xEYxpujUNVCZkvhbattZ4FXe1BFnZAjaXlXz14cZg0ABV9mG3T1EKDlmRSuFxzb7j
	JmRxqEckz63YTD7ItY6ysT+Cz/rzvsijfwKF//NC1/DcqjbbCKuzRPgg3DDOQej4Ht65E5EAmRY
	ecoKmmF3e2bEKxDRmexdrC9kjNoqzxQTbust4EJmvjkWbE2mWuTKgO80k72Q9NOYkwpxyBZTETO
	kPTmHo5UCxUwINRyXkqzdAHPs/v0wrSbX8juQO4qBXBcP4l0dCVz8AWpNyXyMGtVnR0IzCoQqkp
	iIiH/w5HmoNBV6OlSMQaWpgn5Bf+vYs
X-Received: by 2002:a05:701b:2618:b0:141:5281:8a41 with SMTP id a92af1059eb24-146cdfbbbf1mr1748789c88.9.1790404652850;
        Fri, 25 Sep 2026 23:37:32 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm11239841c88.13.2026.09.25.23.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:37:32 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: nVMX: Rebuild MSR bitmap after eVMCS control changes
Date: Sat, 26 Sep 2026 14:37:21 +0800
Message-ID: <20260926063721.1471741-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Enlightened MSR Bitmap shortcut reuses vmcs02's bitmap when L1 marks
MSR_BITMAP clean, but the bitmap also depends on execution controls in
CONTROL_GRP1 and CONTROL_PROC.  L1 can change either group while leaving
MSR_BITMAP clean, preserving stale APIC_TASKPRI passthrough for L2.

Reusing the bitmap after a failed rebuild is unsafe too.  The failed entry
disables hardware MSR bitmaps, but KVM subsequently marks the eVMCS clean,
allowing the next entry to reactivate the old vmcs02 bitmap.

Require both control groups to be clean before reusing the bitmap, and keep
force_msr_bitmap_recalc set until a rebuild succeeds.

Fixes: 502d2bf5f2fd ("KVM: nVMX: Implement Enlightened MSR Bitmap feature")
Cc: stable@vger.kernel.org
Reported-by: Zhong Wang <wangzhong.c0ss4ck@bytedance.com>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 arch/x86/kvm/vmx/nested.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 151873407abd3..0f0e677d99482 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -755,13 +755,17 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 		struct hv_enlightened_vmcs *evmcs = nested_vmx_evmcs(vmx);
 
 		if (evmcs && evmcs->hv_enlightenments_control.msr_bitmap &&
-		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP)
+		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP &&
+		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1 &&
+		    evmcs->hv_clean_fields & HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_PROC)
 			return true;
 	}
 
 	CLASS(kvm_vcpu_map_local_readonly, m)(vcpu, gpa_to_gfn(vmcs12->msr_bitmap));
-	if (m.ret)
+	if (m.ret) {
+		vmx->nested.force_msr_bitmap_recalc = true;
 		return false;
+	}
 
 	msr_bitmap_l1 = (unsigned long *)m.map.hva;
 
-- 
2.55.0

