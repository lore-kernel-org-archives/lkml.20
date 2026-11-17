Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914819;
	b=DOsaebakcpto7UU2RWQWbvHmpNII0eAZL2ikdcVqCMRHNs5TRmCzNBZYtYxr3Oao8o8M
	 IN9vEz7msUIGbqfgW4Zh/ilUEoxZuFVYVkPCT9nnsk3tx2foY6XtrjOd0OYzvD6RL4sTi
	 RiVw6YEEFdK37CJr8MScGnnaGSaxQemZ82qoOMkRAzyHA9OXdNAKMeNih9N4zGhn1rg9i
	 UuuvnOcy0UPTIppQIrxMtnjtAGCd77vLhtYuT4QSUUfKuO5OlByJHZPj64/VIpB6cQHO0
	 TGs/XBcwWmeESHjE9UamcYrvZDhx0lgEWhXTnb2N4LTGOpnYSiEu4ZAmZ1uJBXxaAPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d+NMm0exybAk2E3oIwWTgrT9yeD2QZPUiU7VxRr1qsk=;
	b=EgnVZqYB1jAueptOnfL30AxDxWPLdBjOggC4rW/yijrd6n+X96qR7CJCjhEwpSiXrzq5
	 ZyG92qc5mrseMrnmAFLdqmGDpo0dmbrskzhNECRx61SCCWGqjHQcdWEVbfq8V0jSjxMZe
	 NPF/HAH7q92Kpq42Tlm/pSd8dPxXEjr2pCYZ07JhZOsewsQ/JNHO+P/ruzxLdq/uroNs6
	 mFiwlmAtF/WUFMowPYgMUUoRpZwYgKTFb8JxnkYoizy9KQQWY+Q4TId7pgvJUjSxz4nU6
	 EYdO2WhlsiLX5f1kQ/HK90GlnbEXn4bUeM/d+1mdUH99Magu1gsaq9smUBrO/4crEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihG1yq6F;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihG1yq6F
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1669196b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794914818; x=1795519618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+NMm0exybAk2E3oIwWTgrT9yeD2QZPUiU7VxRr1qsk=;
        b=ihG1yq6FPmSP1gHjYGhOPjex4rgKqP5Zx6pR/bY6IpLLY6R7RY0J5EOBtj6qnZkqqX
         SvBFd1Dxd+wHQROv5sI6mqREBuxtYWEPXWOp7k32JmgVdEGhGCYMOXg/NmmsE93r7jZy
         uHqq3aB8BTuZxAbywivVlwaUKS0x6yiM1STE1ZOrWeXbHU2BtmOad73WURxLXl5c9OOH
         Klfs6iOBw4gIHNgkz+3pPQDR7HDmUATZV1ZWPETSlhQYg0EiixxEXZEDfR8mu/kZCHO+
         i5kSvx2p6uLbuOfBe2yrreyPvtvTIpmjUJMAVh383E8uuObuBqwbs+2Y3sl4d563d82j
         SXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914818; x=1795519618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+NMm0exybAk2E3oIwWTgrT9yeD2QZPUiU7VxRr1qsk=;
        b=0bSVIL65Hg05fimG5m/GzBBZjUUirXZT7mHItbyFkEkAJfaOXa1BjafvqeHTVNjdxD
         R31Hoc0Zo4lla/YKtyyIOY2P0870YbD56IKXLEuPqMLpF2UVwc4ep+W1R2s0MCty1gB7
         Y+/UAS2kDqxEVOUIlShFV3E8Y6Fbktmk8amCOORJf8/8pUQi4jsn4jw2g9CNjzLcnJWa
         4InMI2WhXPTR0lYQyfRcTi5O9ZNuefx18laPDHsp3QI+C+Ju1eZkJVv1iyFFNSi+hDfp
         Gy2bxh8rWx8e5mGP4JgW99FAvp9cmqNhR/fauoMUi6PfUb7yHnxsdqnCvgYaGE1B59Xw
         ucrw==
X-Forwarded-Encrypted: i=1; AL+hErGJAE4FIHkaaCjIVY6b8kQhSXEIf4BbvgGBiGv5X+8LbVTIyRQOy0PPCdpYFXWnJ39rJusXoLEXPnzOk0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+waN4pk4y/O8fHIu1/zWILE9sEDOwB8xRB6Q7tDmKMlNFZuNt
	wIqTY+5/Uiebhil/BMA0SpRfFW13HXoEBdAsg/HLEskKhRS8ZM3CUvI2
X-Gm-Gg: AYBFou0neYTJixDuQuXqntFfijgjAwUVyDYGdgG9Q7dGjqmgf1820TnWDCeS9rYml04
	wEoEpQeTqEhxYABnuEdeqyWozBMmCI8LgpsBQ6dYCde4GfBR5bjeW270McItiSJjN/EH31AzpBi
	5AfBkXli/gS8p7HaYtGXsF6lFBsq7inVEb7Gzb/0YxXWlBWmQYPJtwVp93pyrdxYJ9s3/+83QWZ
	9v2GEV2n7o/Yyk0E8ZXVObNo2TMnoYSl4AtePUYZxRfWtgJKxr6MGJ43pa18ItUg1Ub6PcSCEAl
	XZMc6HVfOQy2jlsQsWyUPan/4821tCPw1QOQGKaJM7I4mSHSmcQEPH6qZhD8P2LSViuQCaMiceB
	ACM/EgJEemgeziO8JGpMdMbEi5pPwpOv3DVF4/gsS5xGehHLecusP+01G4XpM/nThMZBIr6dDyf
	MTc7QCxGgGtQEfnYo6n4d3Kfu+spEyo20Uzf05D8gQoxxVQB40MAncP0jsE4V55nzN7y2mA3fqN
	X7uIX7C51asMXMNK6IleussgQvC2OmhaozeVZ/58iLRWL2Uqy/6FLymuodCLKU0DqTZyTVPeU3d
	gH8aACBYK6P3kMMiD0S0BBbgOdBkmsy83hVbQMh7czyA8MChb1phZlQRVxTAA0t9HrSOve5StVS
	tkkSnUQyfcWI1C+A2XN7ebsoLgE9ZfbdM+JTHv5MTUK/emuShhK7/YhAO7vrBxylUSuaQprvnfc
	rWDRzxnBDI4lWreeiTIxY2i/+uEbnXMojPvZExP00QDTQR3kzmiXjjkm3uWEJJK22SRFjtaG47E
	wihXRjAuPhfMFPmglWmM2kzG48oan0k+mqRyI7hZEkFCTMQQiINdhEL2H/BG64d
X-Received: by 2002:a05:6a00:1989:b0:8a6:1bfd:41fc with SMTP id d2e1a72fcca58-8beb21ce7ccmr11046591b3a.1.1794914818431;
        Tue, 17 Nov 2026 03:26:58 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2f06cd7sm5108048b3a.57.2026.11.17.03.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:26:57 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andrei Vagin <avagin@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/fpu: Put non-enabled dynamic features into init state on sigreturn
Date: Tue, 17 Nov 2026 21:56:40 +1030
Message-Id: <20261117112640.1435-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On sigreturn restore_fpregs_from_user() restores the features the signal
frame carries and inits the rest, but both masks are limited to
fpstate::user_xfeatures. If the task lost the registers earlier in the
syscall, a dynamic feature it has not enabled yet -- XTILE_DATA before
its first AMX use -- still holds the previous task state, and
fpregs_mark_activate() makes the registers current's. The first AMX
instruction then raises #NM and fpstate_realloc() clears XFD without
reloading, so the task reads another task's tile data, including that of
a KVM vCPU thread whose guest used AMX.

Init the user features that are not enabled for current as well, as
restore_fpregs_from_fpstate() documents and fpu__clear_user_states()
already does on every signal delivery.

Fixes: 5509cc78080d ("x86/fpu/signal: Use fpstate for size and features")
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
Cc: stable@vger.kernel.org
---
No AMX hardware was available, so this was not reproduced. Tested in KVM
guests on an AMD Ryzen 7 7700X (AVX-512, XSAVEC and XSAVES, no AMX and no
XFD), mainline b3dfbde62cf1 with KASAN, PROVE_LOCKING and X86_DEBUG_FPU.

Stable: the hunk does not apply to v6.12.117 or v7.2-rc5, where the
function still uses the older variable names. There the same two lines go
after "int ret;" with ~ufeatures in place of ~task_xfeatures.

 arch/x86/kernel/fpu/signal.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 164255d..757a831 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -267,6 +267,11 @@ static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
 		/* Restore enabled features only. */
 		xrestore_mask &= task_xfeatures;
 		init_bv = task_xfeatures & ~xrestore_mask;
+
+		/* The previous task's state can linger in disabled features. */
+		if (test_thread_flag(TIF_NEED_FPU_LOAD))
+			init_bv |= fpu_user_cfg.max_features & ~task_xfeatures;
+
 		if (likely(!fx_only))
 			ret = xrstor_from_user_sigframe(buf, xrestore_mask);
 		else
