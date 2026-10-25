Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956370;
	b=OEi9oZ78ZeqFtWJ0Ge0NmUPDn+mIMNfg4efdqOFxyFlqjDmXqbOT4pPceG1M5M8vwSug
	 44+fw4No8mHeaHkATrWsVFpIJfvNoBZUD0cf43oWufaXBp4VnKP4OUUddMKTCBgTOLh6o
	 Azw4fbMYnv6Di9JoWL3AyyRf7wPGSVzKf3H3Ad2bvhuY983/J5cw0a5Xn3i9Fz5nNu+yC
	 M8z865a+hj47uvcsMqHGTpGCywCtcA3HcNK8LRFMWNcENIrsrd54frd2EC1unq/0UQvso
	 NnDf/IqCcW57xpPzOUrF1hMYT/MJPxM9YFw8hJPj8SetDfOu41PRYoHfDmBXhDSuRWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956370;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=h9gazqxE5FWyhT9+DyTbOS+snk0x4WNikPAuLwcSx/A=;
	b=EEd7xP9Z7fti0H6NkfoZ2ylTxix+YkZYCl83+SFmtmWoG+MOVXO9gFVEo9+ikLEtlN/X
	 wEEAaBvAAtvuUr8VzpuJWuWN5snirgeFRpojK67VfneYb+6knos6YodIbOFp1ZqSmmjAp
	 qCR62WHQwBc++PA+mla2DyAVPAbH2IK8wPJS3E45Da23s+5g9DD9axbeoQNr3lUQTgdPd
	 84Hb/jrrACufmfXYpUanxsez6TSaFSg9UMeh6fRZ5lVmDIAkcJmqYXcJpNgJwJ5DcG/o3
	 uxqF2HGU7Nm/iVWBsJeG8xrrdEi2yOx7cJYYS8sVz+lq0Ci0EYS2fO6emkbpcC4Ixjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GR8qO+AU;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1BF606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GR8qO+AU
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJPwic520208
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:26:01 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJPwic520208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956361;
	bh=h9gazqxE5FWyhT9+DyTbOS+snk0x4WNikPAuLwcSx/A=;
	h=From:To:Cc:Subject:Date;
	b=GR8qO+AUY5DqKh9DsMSLGddcQloXn8I+VEUjRqCN8uAhPXjvKrHAd+7Fn2xo4sExX
	 Q1RvutLNfDY12OlkQKtN3qMeFgSoORv1+ByyC3/OdUopWsj35tyDODVMOPuJyw0LFN
	 sWvayxKiep+XAz3NN6yFQY/6mzUmN2xBxcAnnR6Y=
From: christian.koever-draxl@student.uibk.ac.at
To: jenswi@kernel.org, sumit.garg@kernel.org
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [RFC PATCH] tee: optee: allow forcing the reserved shared memory pool
Date: Sun, 25 Oct 2026 20:25:55 +0100
Message-ID: <20261025192555.210257-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -15.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The X98Q's vendor BL32 runs OP-TEE 3.8 and reports sec_caps 0x5, that is
HAVE_RESERVED_SHM | DYNAMIC_SHM, with neither UNREGISTERED_SHM nor
RPC_ARG.

For that combination optee_probe() picks the dynamic pool and sets
OPTEE_SHM_ARG_ALLOC_PRIV, so every message argument is an unregistered
private page passed to secure world by physical address via
OPTEE_SMC_CALL_WITH_ARG. This OP-TEE will not accept that: every call
comes back OPTEE_SMC_RETURN_EBADADDR (4), which optee_open_session()
converts into TEEC_ERROR_COMMUNICATION / TEEC_ORIGIN_COMMS. The result
is that no session can be opened at all - not to the Amlogic firmware
loading PTA the video decoder needs, and not to any built-in PTA either.

Registering memory works fine, and HAVE_RESERVED_SHM is set, so the
existing static pool path is usable. Add optee.no_dyn_shm to select it.
With the reserved pool the device enumeration PTA opens cleanly and the
system PTA answers with its own ACCESS_DENIED, so the ABI is healthy.

The driver arguably should not use unregistered arguments unless secure
world advertised UNREGISTERED_SHM; a parameter keeps the change local
until that is confirmed upstream.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 drivers/tee/optee/smc_abi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 51624443359b..1824aead78a6 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -34,6 +34,11 @@
 #define CREATE_TRACE_POINTS
 #include "optee_trace.h"
 
+static bool optee_no_dyn_shm;
+module_param_named(no_dyn_shm, optee_no_dyn_shm, bool, 0444);
+MODULE_PARM_DESC(no_dyn_shm,
+		 "Ignore the secure world's dynamic shared memory capability and use the reserved pool instead");
+
 /*
  * This file implement the SMC ABI used when communicating with secure world
  * OP-TEE OS via raw SMCs.
@@ -1770,7 +1775,7 @@ static int optee_probe(struct platform_device *pdev)
 	/*
 	 * Try to use dynamic shared memory if possible
 	 */
-	if (sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM) {
+	if ((sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM) && !optee_no_dyn_shm) {
 		/*
 		 * If we have OPTEE_SMC_SEC_CAP_RPC_ARG we can ask
 		 * optee_get_msg_arg() to pre-register (by having

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

