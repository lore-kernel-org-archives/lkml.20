Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BB370ACC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234323; cv=none; b=j0TX6MBCjvNJzRmKGSTSmBG2WK2l1rFfz4HcDISrORcfDSBVI58n9WaAI8ldy2BZkmGwTrAWUu3av0nar/d+pWikfbw3T0x44bTWz7D3kDBb7U6JLeEWUp8oagi1RdPvQLBFKopapVidgZtcFOogOqgoW6whWA7UN/dFJSIl3og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234323; c=relaxed/simple;
	bh=k0EgHSBZ67xrXqBHCWWygsrB9CHbdTlyhPuetNdyA6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hEkeJIn5yAO9s/pZfuSrH3dvxgkeC+7wFe61pc3vYEgXN0DCf2b0fC0v1yu6a5SeSJVNuZUS++z1/ISjlk4rxdViLRczxRETmcZxmQ8z4K42Flt+1ko6ExqQh7fGuV/oEWd2epyvX6V2u5nEmlx2HY0taHHqvRWjTpVlVl7zdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDMmDPZz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDMmDPZz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso4255775ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788234322; x=1788839122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZaQTPZCBX65twnVoRmMEPBMoXrLHKwaCW1qQEkDk8k=;
        b=NDMmDPZzhy7hPeLf7lycTu/rP0yqY6OJsJNFQdlQDkPFQ0KNvalzQXwZmg5mzPb1SR
         O22Q5GGCMW8OTI8edrSWC+vBfrLMw5zMJzIeZRkD96ntnfYFRE6CdKa2W/3vG9yuetEW
         YZYaVJbTDa8nQh78vIlJwN/fFruLNj0Tv5NBO0z1B4rEhlrGgVXkgBDkJmPKZ4LEaen4
         EtnEZitIvVWsYJe0FN5tiNFyEnz2bHxjxBunhQ6wq0OZsjAsZpMYNIwdqqcw1jLFDOtS
         DOdBkwjGHWCiDtpx7nP7MSVFZ8UCPwrKajeVtxhjbpnOHo+7aE6tqJRwFltDeu+s+19b
         C8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234322; x=1788839122;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZaQTPZCBX65twnVoRmMEPBMoXrLHKwaCW1qQEkDk8k=;
        b=ReSD4N4h8z6+gf+uv67U+10tG479UrzXy+3RrNGFisctqc5yc9QzPy0502q30IH10e
         5P9314I/RBmKuI/Zy1EonWfa/U7V/ZRXBSjbUl2ftucB3H+GEVyj6RvGhdK2DMNyykjD
         qMVqqD4Xg2oGNmcYYak5BaDf2hFMSQL5p5V4U6RYTmcYcVTYCA2N1s3jxMb0K2Zs1Sw0
         OFgqdF8pymn9fFogQgV8bz5BimB9FYefzck8G1NCgr5rJPnZxs6BIkwLt5rNjYE7RwIG
         YR3/1iS8+77QP+90+NkkOD1IAeAJs7JQqlndcJPsgrFFMVv7hHu26GwK2wgSTAvsraop
         z9mQ==
X-Gm-Message-State: AFuF++nYLmuCX+2R75M0bBaePwkoJPVP2wtkuhlsgyLJpXZwhXbs8afL
	P8wXSgGwSDTsu/knQo95hvLDlGbciyLXiBRfJfa6Ideo8N85fGHumXel
X-Gm-Gg: AYBFou3wN3Iv57Il93bAydChGQh//AARZ+iejXbjUtfdf6i3G+evswJM/aRasd9K1UD
	md3owIDdfbOo1DXay8x07SwEp+dtHyecSTGQiy9kasYRZTj0DjPLiyj51fjZZJ82yft3bW6xRWt
	2hz7fH7IPRVRf0/NIbx1HW9jt/IaIkuq1PSR5XZoNeJ1R3IAwqRQFPFDp5HYUe7YZCHiaU1fFdf
	SOJJ9x4buyaEaKjRwA7G1My7a+hJ6SsqeuOz4sZp3lI3mLMpI3qXpeATRDQsF+kd3SaJgarO0/T
	K4oRB/f+wXNs4yJjYGcx1jsJ6ljp2xEWHEvzFjNhjis8j1WI1v9b0isA2qu9Kw6a+xBHA1wbBn5
	PA8bksWCMTkH9OpXBLQ/ThIR7MvlKj7ujCmc3dF/VfNJXDmDxyh2H0xAn9XEWd8xykMZOAILXzH
	EV6NzrcRUXJXeXIlY8XEOqsim4pAkFCw5ZCTT3f0FWv15qGKJx3FYHg55+IpjRsnoxWKFWW2F2X
	Lc3rQa+GPAYYCuC+c/KjqmO19QKOEFt88KpTF5zMFY=
X-Received: by 2002:a17:902:da8d:b0:2d6:8d4a:3ff7 with SMTP id d9443c01a7336-2d74e11c367mr435643785ad.12.1788234321861;
        Mon, 31 Aug 2026 20:45:21 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75963fc5csm43427605ad.33.2026.08.31.20.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:45:21 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	linux-hyperv@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Drivers: hv: Don't reset VMBus connection state on error/exit paths
Date: Mon, 31 Aug 2026 20:45:14 -0700
Message-Id: <20260901034514.457089-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In two places, current code forces vmbus_connection.conn_state to
DISCONNECTED prior to calling vmbus_disconnect(). But vmbus_disconnect()
calls vmbus_initiate_unload(), which unloads the VMBus connection
only if the conn_state is CONNECTED. Consequently, the connection
remains and the Hyper-V host might continue to send messages or post
VMBus interrupts.

The problem was introduced in commit 74347a99e73ae ("x86/Hyper-V:
Unload vmbus channel in hv panic callback"), in that
vmbus_initiate_unload() started checking the current connection
state before doing the unload. This commit removed some occurrences
where conn_state was forced to DISCONNECTED, but these two remained,
apparently due to an oversight at the time.

Fix this by not forcing conn_state to DISCONNECTED during VMBus exit,
or if a failure occurs when establishing the connection in the first
place. Whatever value conn_state has at the time is then read by
vmbus_initiate_unload() to determine if there is a connection to
be unloaded.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hyperv/20260805205806.B5AC31F000E9@smtp.kernel.org/
Fixes: 74347a99e73ae ("x86/Hyper-V: Unload vmbus channel in hv panic callback")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/connection.c | 1 -
 drivers/hv/vmbus_drv.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 1ab3581b096a..818667ef9c74 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -346,7 +346,6 @@ int vmbus_connect(void)
 cleanup:
 	pr_err("Unable to connect to host\n");
 
-	vmbus_connection.conn_state = DISCONNECTED;
 	vmbus_disconnect();
 
 	kfree(msginfo);
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 5ebdbe24b5a1..547bc731114f 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -3043,7 +3043,6 @@ static void __exit vmbus_exit(void)
 
 	hv_remove_kexec_handler();
 	hv_remove_crash_handler();
-	vmbus_connection.conn_state = DISCONNECTED;
 	hv_stimer_global_cleanup();
 	vmbus_disconnect();
 	if (vmbus_irq == -1)
-- 
2.25.1

