Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614163;
	b=YGxRMDAVa/2/d+neRDnXsYCG+DULA23mRxg45cz8xz8LXZgOuKdH0EQMx3RP4Jd3x2OG
	 T5M0+lvq2p/mGeDdDYM9/csqX05r2Wn9fut3vNWOuvHz+ta2mqj1f9HfdIUNH1XOfOm3h
	 ZQTNJDAFsLf49fxbWPWdw1K5RHNP6Msqs2vw3oG+lbXj8+JSjatFuuEuPzxMAKwPVThCN
	 TYqOBIM1cXQ0YejuW6c9Qc6SV3/QQrERzjrJULuuPKZb6peNbCE/MZoJv8GTItxPWu+TV
	 D/oQbK3o5vSSlxaPL1XjW4eFmbqZ5sHMusyCkVA8TedMcNyFb8xcK9X+/x26cKlZebw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614163;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Transfer-Encoding:
	 Content-Type:X-Original-From:To:Date:X-Mailer:Mime-Version:
	 X-Lms-Return-Path:From:Subject:Message-Id;
	bh=j///8M5sOuCP4zIrDfL0phJ8BzITe20/aCrKuakg3b4=;
	b=jm/qosUrQ/tcCxtCRW0+CXO3WmjU9UGTmgx8uhz0SCf/8FiPyD9S8/6ArQ4WItGoec3F
	 ZUN7tw017USajqqGxYU3EGqWsdnf75GtOL3xAIp+yvuMc/MLmiEU3iv8r5BUApQPOLsjC
	 mcG68GZ5Evi0ZiYcMUkK3x4hweZrirmNuQNPOmkKoLU4YRMCABwTgG1tUtryluMNzGmXP
	 gaIU/ySjO9ZcsibY9/bWsX1il0aBXenxPOQVaIISHD9ACAxLxneNRG8XdMO9zPhrluRWU
	 a46U8sTMEcFvVKfUvQTWZeolo4zT7tlng9e4hx5CBRYaT8ZNF/CLaDwUPQdmfNUFOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aVzyIn7h;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81F606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B81F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aVzyIn7h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793614157; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=j///8M5sOuCP4zIrDfL0phJ8BzITe20/aCrKuakg3b4=;
 b=aVzyIn7hPAlCdIOx+6LkHu37rCXeiqy+qTzS51y+FHUoaxF4raMqIF30/l+ckwu4C6wFLN
 Id2tg8dfKcrqxvLzaAXPeuE6pe46r7QR61COCjIzyMylTz7xxpdLKaabVOG9U3WWWu70rw
 S2fPiZTc4W8u1M+UUOMm2ChLwB6/K32ZUHu1M/gRWnTDL+VWifqwjRDybV8ffMIZTihG20
 CjH39/YYyt0wpautCoYcaJM8gQwCpcWxTc0bar1NXs4poFMBXbJJ7hTdBZLvfXtLjt0TO2
 aQ8i7TeXEI3ECnD+3FknZNiO7FNViifBPM1+bat1ZAdVzeE2NqI2c3krgcj3SQ==
Cc: "Guixiong Wei" <weiguixiong@bytedance.com>, 
	"Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, 
	"Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"Chang S . Bae" <chang.seok.bae@intel.com>, 
	"Shuah Khan" <shuah@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
To: <x86@kernel.org>
Date: Mon,  2 Nov 2026 18:08:52 +0800
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae8614b+9c7a8f+vger.kernel.org+weiguixiong@bytedance.com>
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Subject: [PATCH v4 0/2] x86/fpu: Fix dynamic fpstate leak on exec()
Message-Id: <cover.1793604327.git.weiguixiong@bytedance.com>

An exec() after using an XFD-controlled xfeature leaks the dynamically
allocated fpstate. Fix the cleanup in fpstate_reset() and add an AMX
regression selftest.

The selftest reports FAIL on an unfixed kernel (10/10 FAILs on 7.1.3),
SKIP when vmallocinfo addresses are hidden, and OK with the fix applied.

Changes since v3:
- Close the use-after-free that freeing in fpstate_reset() exposed.
  fpu_flush_thread() called fpstate_reset() before
  fpu_reset_fpstate_regs() set TIF_NEED_FPU_LOAD, so a context switch
  or a kernel FPU user in that window could still see live register
  state and save it into the freed buffer. Set TIF_NEED_FPU_LOAD before
  the reset and document on fpstate_reset() that callers operating on
  the current task must prevent such a save. The race was caught by
  the Sashiko review and the fix was suggested by Chang S. Bae.

v3: https://lore.kernel.org/r/cover.1793072271.git.weiguixiong@bytedance.com
v2: https://lore.kernel.org/r/cover.1791428412.git.weiguixiong@bytedance.com
v1: https://lore.kernel.org/r/20260929151013.81562-2-weiguixiong@bytedance.com

Guixiong Wei (2):
  x86/fpu: Fix memory leak with dynamic fpstate and exec()
  selftests/x86/amx: Test dynamic fpstate cleanup across exec()

 arch/x86/kernel/fpu/core.c        |  12 ++
 tools/testing/selftests/x86/amx.c | 251 +++++++++++++++++++++++++++++-
 2 files changed, 261 insertions(+), 2 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0
