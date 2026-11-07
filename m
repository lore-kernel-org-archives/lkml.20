Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065839;
	b=JqYx+hvoQI7ijdtUEDuZSZe5/wn3n0PCFu/jC0KNvRWWxSNbVTcz0t0jD5fIQNSuOc7S
	 6CBj0fJlUQ2A0bFGJECShzibWYTKh11o981+YdnOi3c0xXOu9+Ab/3nCmobNYV2kPH++k
	 nZuAFmAwlzurvETBXuZvW3VN54wRBE7VPdpG8TTq6egS5ZORKJ5be+Z81HaP1Soxp0nec
	 bEkfZ1Dl2q6UWRoNdjEM4a4gOfVcayAqWixYYbMJGm7raA3DT4aOYFaWHsGv3eh9i4xpN
	 UkqHYPZi/37Rli/HYNjSEaW/t0HTOEOLA1EGDtScvrRc2hMpGDN1rPB/TjcK0f+MwTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=M19XchmpvjLlLoNr8MoVn8Z+VpoH2MJVmxwn0RCJick=;
	b=cgT6dZ/0DEDoZiAyWPWivynI8P6O58tUR4wo0C9o3+SlZWim4esEMEBHp8N5vVousr4w
	 lTLyQFwzkw6Vr6iLlciPfjFbjRhWz3ZGmgRDMjWcjWCvuXkWXyXPVHmrSgGWR9humtM7r
	 jehvcJybuMDh1aJHqOK7i4oeI0KWk5UXHvDMcIaUHpmnL650U8DEq+k/HUvz/mDMEZNkP
	 xNLeil4KzwoI1+0RcTL42lFOSAdAK/ghge8HqQa72PW369fzjvZGegdhLlvQcJ7poikIR
	 OBpMr3jvpwY9Wj9TgTW5ciZTtNsJ+hheVgmB/IRFTOOz+moJQSr96G9uIxqKyl+VWNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="p7TLM7g/";
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D79D606D836
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D79D606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p7TLM7g/
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b570b713cbso2224025a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065837; x=1794670637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M19XchmpvjLlLoNr8MoVn8Z+VpoH2MJVmxwn0RCJick=;
        b=p7TLM7g/nvW0MDJeJdMFOoeRcPjiqA9iWHdxA5QezBBsy1QFglEvv117RjA5VaAFPm
         j07wFcmhc4qdObJjdYC9NjR82AoIbDS80G57JHJJ2o+IJauZi+C+nFmR0xpNEcQZkJ/j
         ++WCAPzPKSE6TydewFhErMDLn06MTWaEASMlzlAypweMzDGOuqFu7pSPK6i48GDM1Qp/
         vhsdr7W6qNV9qPRM18Ul1/7vYDgSk0oKYFrMQ760O92kzAMYqXVaX0IxvJNcd6xGk9YI
         zjUaZUeQeIcb6mytDYd6wZesVs1jlj8yROCjwo31VWU1GqrpOW9AkbrDUy+gmwWuAkT9
         wrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065837; x=1794670637;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M19XchmpvjLlLoNr8MoVn8Z+VpoH2MJVmxwn0RCJick=;
        b=rHJh4Oj+oinK0+35fFR0dgNwug08/qnpoZgl4jG+rhjLhD/pSaBPdODh9UiaaHoxIW
         8AjOOuFc3UTevA7mMSLu36nNa1fPtxnLR/p+6TaWqLP+cDypwMXmUp0OlGORxD8NL1Az
         cTQ0IIv47iTZM9sInQLp/FC9J49UUfsQBiEA81ENtP6DsHNLVBisWloa/vVv52ch+ZLT
         FWaRNtCZw9sjOfnjeKAisIV/+fdTmr5w8Jjfcg4cSNt1APg+3RgCtvzGwfFH1YZei+BG
         y+6ig2AD53qCEG+Rduhv1Svrg0RTBRi/eZ3f90qt61aGCmj0ygOprYXIJpAvW/IiU4Gi
         CKwQ==
X-Forwarded-Encrypted: i=1; AL+hErEea3myfS9pQKD9ByI4b+qo/27wQbCpTZfmCx2Oqer2yreUZQZg+Ost/pKFs6zRsMoQs5yzDHYdjb7wc34=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VnrFKC+yESVWzzLS8HbeGmon1PrbahZdxOFXdauimcVKWPFzK
	mc5nAytFXwyiZRnyUNjVhbUG0sJjjRWms/RgSfNwcWR/cuF7ryBYiMVJhVzVmqHvhHM+hNSLY+9
	12A==
X-Received: from edcnu31-n2.prod.google.com ([2002:a05:6402:c51f:20b0:6af:acb1:c04d])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1947:b0:6b4:9c38:a990
 with SMTP id 4fb4d7f45d1cf-6b5977f393bmr4155606a12.31.1794065837376; Sat, 07
 Nov 2026 07:37:17 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:13 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-7-d84ea5f30f94@google.com>
Subject: [PATCH 07/24] arm64: Skip redundant TCO clear post-kernel entry
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

For performance reasons, kernel entry might skip clearing TCO. Still,
tasks expecting synchronous uaccess tag faults to be reported (and
therefore raised) require it to be clear; this is why thread switching
and MTE enabling functions were calling into mte_disable_tco_entry().
However, when the kernel itself uses MTE (for KASAN), it must have
cleared TCO on kernel entry.

Use that invariant to skip redundantly clearing TCO and/or checking the
task's SCTLR. As kasan_hw_tags_enabled() uses a static branch, TCO
maintenance is completely optimized out the moment HW KASAN is enabled.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/kernel/mte.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index d1dd9b80173a..8025ee1f7fdb 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -5,6 +5,7 @@
=20
 #include <linux/bitops.h>
 #include <linux/cpu.h>
+#include <linux/kasan-enabled.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/prctl.h>
@@ -290,7 +291,8 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
=20
 	/* TCO may not have been disabled on exception entry for the current task=
. */
-	mte_disable_tco_entry(next);
+	if (!kasan_hw_tags_enabled())
+		mte_disable_tco_entry(next);
=20
 	if (!system_uses_mte_async_or_asymm_mode())
 		return;
@@ -409,7 +411,8 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
-		mte_disable_tco_entry(task);
+		if (!kasan_hw_tags_enabled())
+			mte_disable_tco_entry(task);
 		preempt_enable();
 	}
=20

--=20
2.56.0.455.g6c5a503b38-goog

