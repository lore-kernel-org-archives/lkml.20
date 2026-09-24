Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33247A0D1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246606; cv=none; b=G295AKp8v+GQmNEnUzfmezQ4CdOfgFFnq+JkJvIw0dpQKy81Jh4IeCRNdwOlbUXy+dRMOvJfdrkUJ9cY20oAFU9ApsTb6KCozJIZVaqLC0Wdb+H4Wah3k4q2yGah5cuvPDjnVr1BnKtdAYD7L+Ti8kC+6jCkfIs7qOnNWIWji3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246606; c=relaxed/simple;
	bh=93HYcNopXPZIsj1GnwwYnz7lkYepMIh9o/Zklg9TfNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Olw0EwULsE4p9gYW3lrMPg54f2NOq7Ztg3PK6fWry3RHcJRLjdspUzZl53m+U9pt3F9Rds0pHP4VXVMotg0Gu9s41ZZ9p2xW7eavPLEkpFCM0BNfUcbHUkoOKEWkKiwL5iwmppkiNCSGnPzfK/Ed+HURe4H8ChbLTLQoh/xJUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IhT8hKj4; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IhT8hKj4"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so279391666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790246603; x=1790851403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2td3II7DsFvf+IGmEyx6EggbRGtbEmv2IBw1HDFbHLY=;
        b=IhT8hKj4rAMUyE0lNL71U7MoeoWqM39iz7ulHiDkBTfbAciRPhQgKPXDFZ0lK27ukJ
         mOkHl9hZ0jLa788hXSDnFDmDnQdELBFEPm8vZBPjKHLbogevrqX5EYxJ67TpHnoLcwPS
         I7o4yp3UReblhzZgP67VAf1/LhouRq7TmEIHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246603; x=1790851403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2td3II7DsFvf+IGmEyx6EggbRGtbEmv2IBw1HDFbHLY=;
        b=isOwcigRjG2lLFCdBnHkIGNUzvfVX4gcM5P0TC3iM146zgaXzIo1gf/P71LTWO6lGZ
         06oPOsAAmRgzSoKMGOK6wwCDAu95d9VuH4s7MQE9coO9WUasrI75Zqg+B9cIWO8jmQ8F
         +88bJ1b7+MGFzM4JY57fNsLb8cwb1kOm2TPdQc6THomDqnJMStebWY2cbK+FLqk1cvfr
         IRuacb4g7pHB7kTqYH001SMb/r4E4c3c3cHtXy1KAOBLiRmO8gvmZOw+WoInKaZUHpBe
         JXAA3uGlbv9NJv4bNMD0ZC0emp+DHf9EzqKTJeOM/B2uwNPKv2QDgMV5Q/ZhzFQRdBGO
         4ZfQ==
X-Gm-Message-State: AFuF++nebYkcgdCxoYXHQvtwvBFTQhv5zQPMXDAKhwEzRM7ykbKyzkhX
	TTTeH73aymVVwYozszqBRiodN1TQCWziQ2WtytZv6zyunALz+gOSbDmVX2fZ0bnrIw==
X-Gm-Gg: AYBFou3sv3OitNSU/p5AtgRS0ZXKDm7S0EizfEjwfjyKWZKSooQ0EIsii5b25aq2R01
	DLO+am7AIwOHX2XBOnpxSKnVg7tD+iMxVALm3SX4by1+zB4WFxcqHE/wasxE5XPBm/w5FqeWaqt
	husomVhpIDwJhz0QTZOj/asleEvJWeBXudQice/otGkspNux88qLGLbch4os6WvkEBSAF177bUF
	vJiOl4daJ+xy4Q36KgtA9TuUwt02+KkQyuJpkT5cjqOl2zFvtXsMgVAf4dW5vc6CgD9cKFdVT5Q
	ssETn80+xNvr2EUes+L+4REyEuwYfHw0esgh73Osl2Qi/aoQCE8Keh1lmeASjFWp7jFLV0IpSjv
	qyFFCU1lu3wejpKnO7jKUOM6n1d/LX70PJrbBBiHGbaVy4vIjd9oY7EZuaRnfRkte8NGdFto45I
	+LXMt2O8BoOjWyKefV2weejFW+PStFz0nhU3HvVoYy2MXASJODjhEjtc8mv5U/YP2F53UyjW3uE
	6DIcMe55jPdzOIJoMLyiwObZK8zxHgLbezEvLWYs+3AH3Brb/GAKP9rb/FibXFrdb3I
X-Received: by 2002:a17:907:9445:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c2ac232a3cfmr179930566b.38.1790246602888;
        Thu, 24 Sep 2026 03:43:22 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (154.4.34.34.bc.googleusercontent.com. [34.34.4.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37ead71sm3464110a12.3.2026.09.24.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:43:22 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmaluka@chromium.org,
	vineethrp@chromium.org,
	chuanxiao.dong@intel.com,
	jaszczyk@google.com,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Radu Rendec <radu@rendec.net>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Sean Christopherson <seanjc@google.com>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Thierry Reding <treding@nvidia.com>,
	"Naveen N Rao (AMD)" <naveen@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thorsten Blum <blum@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH v2 1/4] x86/apic: Rename init_apic_mappings() to apic_finalize_early_init()
Date: Thu, 24 Sep 2026 10:40:18 +0000
Message-ID: <20260924104102.3534474-2-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260924104102.3534474-1-jaszczyk@chromium.org>
References: <20260924104102.3534474-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename init_apic_mappings() to apic_finalize_early_init() to
accurately reflect its purpose (validating the TSC deadline timer and
finalizing early APIC detection and fallback mapping when no SMP config
was found).

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
---
 arch/x86/include/asm/apic.h | 4 ++--
 arch/x86/kernel/apic/apic.c | 5 +----
 arch/x86/kernel/setup.c     | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9cd493d467d4d..b4c112b6d3ab3 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -133,7 +133,7 @@ extern void sync_Arb_IDs(void);
 extern void init_bsp_APIC(void);
 extern void apic_intr_mode_select(void);
 extern void apic_intr_mode_init(void);
-extern void init_apic_mappings(void);
+void apic_finalize_early_init(void);
 void register_lapic_address(unsigned long address);
 extern void setup_boot_APIC_clock(void);
 extern void setup_secondary_APIC_clock(void);
@@ -183,7 +183,7 @@ extern void topology_reset_possible_cpus_up(void);
 #else /* !CONFIG_X86_LOCAL_APIC */
 static inline void lapic_shutdown(void) { }
 #define local_apic_timer_c2_ok		1
-static inline void init_apic_mappings(void) { }
+static inline void apic_finalize_early_init(void) { }
 static inline void disable_local_APIC(void) { }
 # define setup_boot_APIC_clock x86_init_noop
 # define setup_secondary_APIC_clock x86_init_noop
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2f..cb78e0d6c9317 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2064,10 +2064,7 @@ static bool __init detect_init_APIC(void)
 }
 #endif
 
-/**
- * init_apic_mappings - initialize APIC mappings
- */
-void __init init_apic_mappings(void)
+void __init apic_finalize_early_init(void)
 {
 	if (apic_validate_deadline_timer())
 		pr_info("TSC deadline timer available\n");
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb9f69c4..06522a205dd93 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1242,7 +1242,7 @@ void __init setup_arch(char **cmdline_p)
 	x86_init.mpparse.parse_smp_cfg();
 
 	/* Last opportunity to detect and map the local APIC */
-	init_apic_mappings();
+	apic_finalize_early_init();
 
 	topology_init_possible_cpus();
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

