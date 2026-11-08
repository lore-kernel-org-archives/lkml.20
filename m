Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794163565;
	b=jIFrjkohrZP3FFVgjebnTX1atcxIkcyiERYHbM2VYP5V5+PkFW7mgep1LA9qM8yuEbDU
	 jH8c49pZ0I84+ALArxfqoFfMi+TD2/NtXfj6jj9KJ48JWHiHN48kY1rDHicpDwZYAoCl4
	 r+QvayOO9/1rV1qwrEfeMz4agRFxzY2gmbANGpvo4Y73cJvvjafU8PF1LvdjY9VBSYCvg
	 eBCuzDrhPzUt/gQf/tBsUXUyy4PZcK9wF+cPXhI8pQZB9xMStyaIIeAzjzTDnfEthgQ75
	 iVWYIVF5oeWXZt3+oUIDIzSmBrKmLwQghMj7ThrwgVh1J9ZWY8w9RKjj2zzpDgXOjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794163565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j1sJ/9YGm5C/rib3cghBM+5FlV732aX+12bHjvjsrbE=;
	b=L4uUwLZ+7Nf4y32Kwyn7Fn+8mv1/QgCT2qOdmSzqocB8Df8AS+Dbul7PXVDJTsLlD5dC
	 rxMCT1WqOnA+j05KUU7IGzmsbllFrGCuFhnuX4sXvRedtbx5J3sJpUQLWryTQPHDKMeNg
	 ZRJzinPGQC+4WziFo1biIB7cksHLXzQLgYvYpdoaQ1P0jZCzmrqPk4J/MBC0vvdebdMu8
	 BSB5gbETs3FpB9djKujVVV0PvUOlfg3UcTJEfW8k6TcYLNf6JKTGIQbLpbwLeO783nPC3
	 tvlO4zlYntZX0TNcl/0XDKvbjs1whfINLKU65nOMuwmHooxAoUZgMVjvqLEW4zAh7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZSzrZ4v;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52096606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52096606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZSzrZ4v
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso524762eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794163563; x=1794768363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1sJ/9YGm5C/rib3cghBM+5FlV732aX+12bHjvjsrbE=;
        b=yZSzrZ4vK20wQlrZIB3Sbp19mP7sEOxJpc5rOtSrrsunDn44bnEQP0Cd0vLNkg7Lh/
         4zJ4uDuz+6Lv2hQ9mGY6hgZDnBdB1AqH1rJS7+i2lH+wDbOA+HW4zpjA6QUID+S4qiE6
         uP34e901SHxw203NolOPZTHcSRohWcJH6qe2kooxErHdyz7elfxMVc/qVgycodnbfk8O
         jMYYhgHll8M22Ydc5YBBOnIq3gvSn7t7gsu+ND8mMGGwu2CcK7OcUVzwrMuRnJAsX7ZZ
         1ak60R14/nh8s3P9jbOatf/XcyUoSRYw1zVdyUY3IwT3RuydYrkk2/84Dr0k2hhBW13w
         Bpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794163563; x=1794768363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1sJ/9YGm5C/rib3cghBM+5FlV732aX+12bHjvjsrbE=;
        b=medcntlcgBV085T4uc3Dv6msyA5x08z8Ja8ijUfOJp0Qqz3NpYzKXuXaNF5W18I1Dx
         86+48a+YNoU9ir9mIq3Qx51qZIaOdfTBEbfEKL5WjgmuApMtzpW/qMtbtjndnf909+dk
         J+O8z3EaLFae4VBeT6h80AkKrvN3KKZWMbXMvLSDt4r44BfIRwYfIxa2GHpMI7UUZ/Xg
         Xj/fkVfzmNgVmehRhKh7OVUcwOyD3LxAw9T7TUsU3fwTbLYE14cgIkds1ju36H0fPN72
         Gx9NwH7vl+M985fxHGYbxdC247epshrfw7DqNH3I7ds7GxAJOFzWholGJNg46vcuNqW6
         taSA==
X-Forwarded-Encrypted: i=1; AL+hErFIIwgEMtn67Redm4G2FRJvZkI2s2UWn/dNAxWUQ6dprWmcRypxZLtNEXt1g/AbsYikAOIQRmh68l5zAy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C4pWk/uq0g7oogoyORGfRzsdCfE668m1U/gunjK85FjVT+Z0k
	jxZdQYJCK2ZNfKpeS+7Q0WgjCCl5D7AdREPq93VO0M9Ldx7ymdPuD9DbmxAGlA==
X-Gm-Gg: AYBFou2ri0I3vVQGpSmPaz+San+AilU6p+BASas1To4+n0oP5aLbAhsayuH/lfdT5cY
	1Ow5LquaxZd2oKYj8b1KvZkbexes/RAf3KNIlzVA/KFsJxSKtPVzNUC4XSA84uOkp3Ta6jxLvqS
	tSzexowqAVbe7wqvlBzh7aPgUKmGbXK0ZmNAlj91bB+8lP5r08taV0rmElfE0nAWuGqO0fqIuxZ
	CZwY0iL7mqHykeZYNPrvC/+Kz3km39WAfnaQ5fRsGNCTcE22OGRxaLYVbf4exJW24GA7WzUflEU
	0mni7fygkGBnepDUhfudvSJWzl2PhVf/yZ0/RXZWzEaWGgIn0KId38BEdzoi77b6sPFjdbwHH91
	7VLVKZAxmNpC4/nE3gFrzLcKrSeBf0tp6cp8SSe1ITOgxsHnPBsC368LtDrVaQIH4A8YCOtFPVm
	Z+1vnNdTdWBzRgoU6r3nZUbxf5jn6LrMH6ryZDWfiG5oX+n3BSTvPAcXYzYZEapqnoMjCYeItn7
	uZkEKrFIe39PgRMqFMrUA9/CFuXylsNO7i+gXbJiMFR8DnRWDlmPXq7wJ0RVgG6G3mZs+CaMJ6w
	xh9/aKviVMXNr3+MeeAUPtXKa9vklMcDfPLb1ybkhA==
X-Received: by 2002:a05:693c:8059:b0:35d:f7f4:bc1c with SMTP id 5a478bee46e88-3725d781ba8mr4321414eec.6.1794163563300;
        Sun, 08 Nov 2026 10:46:03 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm6429023eec.18.2026.11.08.10.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:46:02 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>
Subject: [PATCH] perf vendor events amd: Fix a misspelled JSON key
Date: Sun,  8 Nov 2026 18:46:00 +0000
Message-ID: <20261108184600.3810059-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ls_inef_sw_pref.all is listed without a description on Zen 4, Zen 5 and
Zen 6.  Its three JSON entries spell BriefDescription as
"BriefDescript6ion", and jevents.py reads the keys it knows by name, so
the text is dropped and the generated table ends up with an empty
description field.

Spell the key correctly.  Only the key changes; the text, event names,
codes, umasks and expressions are untouched.

Fixes: 658448281d19 ("perf vendor events amd: Add Zen 4 core events")
Fixes: 45c072f2537a ("perf vendor events amd: Add Zen 5 core events")
Fixes: 2f42fb0661d9 ("perf vendor events amd: Add Zen 6 core events")

Written with Hermes Agent, an LLM assistant.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/arch/x86/amdzen4/cache.json      | 2 +-
 tools/perf/pmu-events/arch/x86/amdzen5/load-store.json | 2 +-
 tools/perf/pmu-events/arch/x86/amdzen6/load-store.json | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
index e6d710cf3ce2..01c848a9dbb3 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
@@ -182,7 +182,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
diff --git a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
index b1994539ece8..774da0bfa0dd 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
@@ -351,7 +351,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
diff --git a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
index 4291eb59426f..4adba70bffb1 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
@@ -351,7 +351,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

