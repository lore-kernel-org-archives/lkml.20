Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793402667;
	b=LHIC8bwCC4HoLcXff9loqPLVOlSCwy597lgYUTvMirhL2Et5JomrtwnC+9HwpV5HEqqd
	 3xjXqNkzEdXkAnFuXa2lTe0Zt9QMlnI2jxoNog1z1B5MTQGFEQHz9aTsIewrFNef53NMB
	 74dSe93zInuifdMR4L7Arso2OQWtvAGRFTQFoLNvDgENsFqHMptiV9sM4chSdIPWV9g0H
	 4kPRM0KZznV7HtGZThdiHYY2FGU6eZSP1IKZ78u6KqjfW7yJDiVqx/lo2dCEPc0PVmd1F
	 SIgC6AQhNmJ3swBnkTYIu+tVL1JZF+PiZC1JobcJyk+jnu7D9bjmlcNQCajrI8W+mpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793402667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p8PKPotJoD0jhi3l1VncVirXzxS18uQyTptF2D+D6D8=;
	b=GWrXFRDuEE71ecB9fehBRzJu4kiArSql8+85gSwalhmA9Rx8ofhWKD7Pv3Piq4pNXonm
	 S3jzhfwZiFZWJlF7G62Y3mi/I5QZ4BE9OSsHth972oEczt9U0sTHjk4MNIh0ms/QGuSec
	 AZeawREr1tIWE9bcfr4VQyDrymXkjW3LwHny93O9bnZc7IyOcW0NeqHbkffy/IYysO0VJ
	 jPOYOyTxCKmdondo/kJyH2LxsCGeCb5+d/m/xLlGTd+JEFtTatvPw+CTT2Hd1A8jrcmhz
	 lcc6mpmi4R9YyZRmT0joTrsMCTipZ/IsExWH87POWQAInkqlaRgDpW6mWZ5Nw59I8hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=XBQKzzza;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 144EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=XBQKzzza
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso2553087eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1793402666; x=1794007466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8PKPotJoD0jhi3l1VncVirXzxS18uQyTptF2D+D6D8=;
        b=XBQKzzzavt6lQhKKmHzX+ticLjHtzVUrF/R1Nw+0sQkc1vdHYAYW05ux0L5DmbU0Rf
         XK/LZaiXPL5E5qDb941COL5axVNH1DHprJOMOcEg6sneNJy584ZgCapiro6ltzEySMgB
         BpYig0Pwv695o+bYXK+4d2Du6wQvdizAEFGt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793402666; x=1794007466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8PKPotJoD0jhi3l1VncVirXzxS18uQyTptF2D+D6D8=;
        b=TwlI3Yo32kLc3cQVhjmQh6MDhT/lwUwyWd7hynTSNpvD+lbv3GS1j/4awAJR4z5YdW
         i2mrop3nzDvKXktUSYNLgQAhc++T/KHbk+D5HrqZFLpbF93XPo+bY2o9kXewNKY2OXuZ
         mJW9Kx2mLm5HORiuRyUf+333dU2cyF+6bnRcyAF90mTih6RKCB0QGzCkO/ctJpgFB7xl
         3VrLsUQ7Mw1+X41XrOPUJjeRULGDPPwfgo6oknTxIQrYim9FYrrVyvklbfN4zumHAKkH
         oCUS/K1Qy4R2YTj+MszSa0l7lzK8f6nNd/weFgKu/FbWzlHEsnM1QVeK8Pn3OQLSYnrl
         RGAA==
X-Forwarded-Encrypted: i=1; AKwUvByRkS4A3WBU8PvT/UjDSIvuPO4xaASQipoxfGhpLgOdAP8Cyr5s/oMLTZskXGPxQa3lwYVqtMtYGpqflUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLISk4vAJwtU6NOkY8LEDW9q41aQTnzz7bFKa0jfLJwabJVfhHG
	FoPpJFG0D1b41YfjAwCvOWOSexmEa1JEI6upzliOHk8g/aARLs9x1Y7Qu2HhkvUXaFE=
X-Gm-Gg: AYBFou1JcQsC9CPPSaWmeK33o5gWkuYYDBdZ6oz4qZPU/HxbQ5/QtbiBa3J7ps/07sO
	Je0cB1yo3rjSS4vh/wFvv/jlvDM9x93xaMxB88Er9q7vDtMkPcGQ0yXOiINcJ7Tn+ky3XnO92h+
	VwdelyrMMNXCjMRp0jZnqBH/Q4XDjU0fZkJ0IE4D2pWrfMD5iEdudQWb03falJoF7nOCrIdyf9M
	6Rr+nJrMBtpGaqZ/Lo3z27T+XWsGrp5qKMV0e9TAiLialHUnTcdm8KzPGX3K8woglyhRWmw+msP
	I0IAGo9SOWoQOOV2aaR0jp+7jJhMg8B4hUh4ZFJElrFXRrYFMDZnTs3xUPlFA8eZfv6mYtG1rKw
	EvTVJX2Ud5z0GddHxNrIXHrt1z4RSVUtpD1YrrIeaQQD/RXmoqtJO020Ca71cYxSjgyFXwLbaCm
	H0YiZnl8n6n4gNf//4golb0doY6LiN+qapxpTJrk9T4g0l7BBvP6dn7NrsAu3R+GQTEW1HJjdsU
	u3fTD7/Cb2FBHmTLQj22e7uSYvcNAAS0uALowFtXM8xl7xxUKqFdQoruGKXGHfUNxm5CV1HaOoP
	QoYOMGCT4ziQ6L8CKh2J9hbF7Lv9Cj7NLRmnh1FClIGrACMqnkhnE/l61v42iuDFmvFwpQ0=
X-Received: by 2002:a05:7022:f908:b0:14c:d84c:7182 with SMTP id a92af1059eb24-1ac5da75597mr4437875c88.22.1793402665906;
        Fri, 30 Oct 2026 16:24:25 -0700 (PDT)
Received: from shiro (p1795186-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.151.186])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm16104041c88.7.2026.10.30.16.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 16:24:25 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	bigeasy@linutronix.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] powerpc/powermac: Always close the timebase-sync i2c bus
Date: Sat, 31 Oct 2026 08:24:18 +0900
Message-ID: <20261030232418.1145779-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

smp_core99_cpu_prepare() opens an i2c bus for "tb sync" and that is
closed again in smp_core99_cpu_online().

If a processor module is dysfunctional, not seated correctly or
otherwise fails to come online smp_core99_cpu_online() is not called
and the bus stays open.

On some G5s (tested PowerMac7,3) this i2c bus also has the CPU
temperature sensor and fan controller connected to it so not closing
the bus stops the kernel from making sure the working CPU doesn't
roast itself to death.

Rename smp_core99_cpu_online() to smp_core99_cpu_online_prepare_down()
and wire it up to get called when onlining fails as well so the
bus is closed and the working CPU stays working.

Fixes: 68e694dcef24 ("powerpc/powermac: Convert to hotplug state machine")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/powerpc/platforms/powermac/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 88e92af8acf9..e310b6fbbede 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -865,7 +865,7 @@ static int smp_core99_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int smp_core99_cpu_online(unsigned int cpu)
+static int smp_core99_cpu_online_prepare_down(unsigned int cpu)
 {
 	/* Close i2c bus if it was used for tb sync */
 	if (pmac_tb_clock_chip_host && smp_core99_host_open) {
@@ -893,9 +893,9 @@ static void __init smp_core99_bringup_done(void)
 #ifdef CONFIG_HOTPLUG_CPU
 	cpuhp_setup_state_nocalls(CPUHP_POWERPC_PMAC_PREPARE,
 				  "powerpc/pmac:prepare", smp_core99_cpu_prepare,
-				  NULL);
+				  smp_core99_cpu_online_prepare_down);
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "powerpc/pmac:online",
-				  smp_core99_cpu_online, NULL);
+				  smp_core99_cpu_online_prepare_down, NULL);
 #endif
 
 	if (ppc_md.progress)
-- 
2.55.0

