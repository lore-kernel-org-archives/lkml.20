Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878956;
	b=wytM5YXUMrkWqJgvjipq9aPTHdu8QVXSJo83NVEE4fsWq/z3gc5Ga/NaNNtVrVL2iaXI
	 0ujrwqGGoCCbQcPPZtC/W102l6NNjeYEijSPQPAKx7+g+UuwHyLFPjvg4W65ikd7RmvsF
	 WZCVDwSb4X2Zr7sa9XMNLsV+tk0NS0MX1QHFII/EV5qeqk9s1f/BlFJzox7IEsfunGJVP
	 bZnR5R8ShmYv2GGaznaYoV2l0JWcXNfqKNcCRHC6ydB2OED0zvtsasYKXfS/WDMwOylvv
	 przs6Jdy4k3kOCDn1/MuzK82gCVc3ih8WgdRIMyrugaMsYoUXJYpGkMVyZ2W0wG9XDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kp61jxlZatnRJkTd/YA+OCxJsPI04f0YpnzoYpRMZK0=;
	b=bjerIXO8Ke6O5YEmN4PLKp6QQFw817ZvvZAy0o3oalalFnFRz9nNKx/7YVNkEeviV+3x
	 +YZ7xSW9gPiD9g3BQAUByd3/XynBHsa/FAYTZLGX/CR9vVdl0k8Je9F1LEKOUNrNvo1Ee
	 t7c/n7ShBiahsh+4/J/UtJipkxmP7+yqmoWm8CT1AtF5Z/qEsXk5QPMc3BG6VuXDOfQf4
	 8pZOirmIG4ifu9+wvKzpDwCdPdpWn3MQbhvrP3kGJ0aYb+r3uch4VBFxv7eV8Iwq++LMw
	 GFlHvcniiXBg/tx7HCymRLypJSzjp1gexcrBDQkycbrHNpsAhpn7WZhPujp46xByYrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R11VVz/+";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R11VVz/+
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso3316203a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878955; x=1795483755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp61jxlZatnRJkTd/YA+OCxJsPI04f0YpnzoYpRMZK0=;
        b=R11VVz/+BfO5SsSP7YmDXU6wn/ClnqwDfEpRu+28xtrVbDH+zwV2ArpTKssKJzaHjE
         mq5aI6KdD6qR5ud0KqpeYmpXUY+vmbVxNv0B/kMCLtReJlkYYBhG0UFQ/gq58dHhgMFw
         tRpSYU9vU+QlozUcwjvkHTitG2fBNQOmGLgyVro+o84BME0P1zwNpsptYY5ccGUHvgoV
         mOC1fo8WlB3l3fRzX5skS52VwO5eGdS8YHewFSWEbSfYbtWt+QqzBgydMLPUlEomuXkH
         A3n1sWK6xdSUhGHl6pkU0Qqk1+76vJmPw0F51PGeszOsCnrZu1p2744Lh/kpQsVQVJwi
         34fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878955; x=1795483755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp61jxlZatnRJkTd/YA+OCxJsPI04f0YpnzoYpRMZK0=;
        b=gp3RVGYXIBh8fnTMwLF5EJ7LWAZbP2V3sAuwcSR3pruzbojrCdaJn/GDcS6N2EXqdN
         e2c8yR+/I3VL/8NaoUFVcwDzmnoeDIiQFCbzpODMKdfHCgHfA5Dq9usuS3q+o+F50Rx9
         ZEfRsCTRFINBe8z0boi8FfyQc06VnMuddil7xIKtqt9TeGsX+urKsQmA/iRmACfZqDjQ
         rfzCzcvUSqsXkF5MMIOLuoclfqsyRA/OCdv2a8omMblAYVVOB91p/AfWXYhyzf4fQDn6
         Q7W70OK2E54LyeLJl30HOfe6A/kbEu9bo3dfnXo65Flo1cHWk5aQs4KNWQKEximvbwLG
         WciQ==
X-Forwarded-Encrypted: i=1; AL+hErEg93KrqMdz4G2KEzvXWiu4suf8kAYh6N0a75RrKzyWBYenKTZqfOMqxngqVV5Nbxuf1UTwfJW93/VpWFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W7L9mefC0VVcO0dX0oUu6TJX2QyJAlRDoRC6A2NDY7SyuG+Zi
	VlwZuPew1Q0VoiJ42DzvgOaOLyHhAx1v9n/F2N3DO7GcmeDL7wgz5acH
X-Gm-Gg: AZFdTZeIXgp6qe//JBkBaxDwVpkgrfBifJ6xvw6KWrJXuQjkUugTmXuAKOOOhitd2BA
	5svqVjHOH6FMkWjh9ZqFIh273E5/tnCIE1JFgWehcdmyPnkVPe3qpc1jhmk6LKPIlCLA6iNpluy
	LqabMylHmahrVQYVNgxFpAt665NooEaFpyAlBKJfitE+I16wcjtfkx0BXsvCEOth5MHM/uUyGoy
	kzkmk+jk8XzYk45r3KLcN/Sudy/GppJpga5KOzDf40BAHVGsu2uagFv9LasbZsaA56J38+RGHZc
	y2umPvoUR9aXYAJhYIYYq2KE8DX/Vl+7FDczKxQxmGdosAUsYjtyZmDSN1ZjyVZex77qDL/oomZ
	9tgzBtrlxkoq3wcLPnn7igBfOZssQ/2GlSO6R7dcKZ3ygReJ3HrcKVpBFjQ2OkzVyI+AeGwJD+X
	Wn4RgJtyKNGP+znqQjDTHsiOg00ixN/rRC8MASCPv3b9JOreFUiARJDuqYGXfu9sGXb8fjdALMw
	uwNFZs6fkqT3yakA21pyzYbsqWw2HB1m5slGIW6d2NXIw9N9o3tWcgkJH1g87+YuBxX3ZxduSEH
	RlUi8rhUAYNSpC46eNopaKe7otizNyNdqyPvqzuJbAd/uZidrnk5aZBiAC30RU0AXNeMuEUkc68
	vftoejJk/28fJ5B59pZ5KFtW4wIvR5Jle5eOLUXci
X-Received: by 2002:a17:90b:380f:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3b1b0816e0dmr12462179a91.5.1794878955294;
        Mon, 16 Nov 2026 17:29:15 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm10295178a91.4.2026.11.16.17.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:29:14 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E . Box" <david.e.box@linux.intel.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] platform/x86/intel/pmc: Don't truncate HW sleep time to 32 bits
Date: Tue, 17 Nov 2026 10:29:06 +0900
Message-ID: <20261117012906.1637402-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The pmc_core_is_s0ix_failed() casts the S0ix residency delta to u32
before it calls pm_report_hw_sleep_time(). The delta is already in
microseconds, so any suspend longer than 71.6 minutes is reported
modulo 2^32 us. But the limit set by pm_report_max_hw_sleep() is 2^32
counter ticks, which is 145.6 hours with the 122 us step.

On a Tiger Lake laptop, one suspend raised the LPIT S0ix residency by
22559 s, but last_hw_sleep reads 1085 s. The LPIT value modulo 2^32 us
is 1084 s.

The cast also hid a wrap of the 32-bit counter during a suspend.
Without it, the u64 difference of the scaled values becomes huge.

To fix this, drop the cast and add one counter period when the
counter wrapped.

Fixes: ddd66d634735 ("platform/x86/intel/pmc: core: Report duration of time in HW sleep state")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 (Dell
Latitude 9420, Tiger Lake). After a 13.1 h suspend, last_hw_sleep reads
47063.5 s and the LPIT S0ix residency 47061.9 s. The counter wrap path
was only checked in a simulation.

 drivers/platform/x86/intel/pmc/core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 71be313bdf0e..0190160a4c0b 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -2052,12 +2052,17 @@ static inline bool pmc_core_is_deepest_pkgc_failed(struct pmc_dev *pmcdev)
 
 static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
 {
-	u64 s0ix_counter;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	u64 s0ix_counter, hw_sleep;
 
-	if (pmc_core_dev_state_get(pmcdev->pmcs[PMC_IDX_MAIN], &s0ix_counter))
+	if (pmc_core_dev_state_get(pmc, &s0ix_counter))
 		return false;
 
-	pm_report_hw_sleep_time((u32)(s0ix_counter - pmcdev->s0ix_counter));
+	/* The 32-bit residency counter can wrap during a long suspend */
+	hw_sleep = s0ix_counter - pmcdev->s0ix_counter;
+	if (s0ix_counter < pmcdev->s0ix_counter)
+		hw_sleep += pmc_core_adjust_slp_s0_step(pmc, 1) << 32;
+	pm_report_hw_sleep_time(hw_sleep);
 
 	if (s0ix_counter == pmcdev->s0ix_counter)
 		return true;
-- 
2.43.0

