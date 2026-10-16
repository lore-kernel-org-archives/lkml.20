Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31F1E7660
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119785; cv=none; b=f2nC76TcrIgOeVNqbzMigC12Ns54Bi9KmiFqFj6P+vHbIDgZbk8ihYaojSXFPMp7xSYt5IFspf3FDZHnSI8NqoPAY/IMJh4OP5Lnocv/RyjHa5ElbMN/gQU8YZ1jK2WZp621EI63EJabP0NDHdKekdpHfX9bRl9KvP7XElOCT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119785; c=relaxed/simple;
	bh=P8KK0+CbgquxjY69QaU3QkJm+cx7/ETHIw17Ilx+Jz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8pBoGTv4d6J+FwILHB8tFq8KC3BzU+J8Wa0uC7QxMHsOXsYof91LNxwTcya4BVm4pwvJbxiXS4hqaVOIEatSQI+bd8iLCcn4zH/bH0hJIzx8nBQCybVaMuFr/x4y5xsvYcImsA3HF9uWV+CTqlKg8+3HWelJPQWmAfzhuQWDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=wX4G9nSU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="wX4G9nSU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88834d30002so3082619b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792119782; x=1792724582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxBCVm4Z5PhosKtgTJ2T5/Coyb1UstSb78XMv83Uqfg=;
        b=wX4G9nSUgl58xXMeofoUvgCcmE+XnV2qFeJdciEF1QcqNIHtD9Y6Nq21xXY7JAyE6w
         lleVBDLfc+AyDyGWXS+imPkNnNvSzs9iQdMddrVsL2rdDBFGLCW9cx2r8LY1DeFCvJnS
         i+TnkDWkZL2q1axX+cikQIKRUKOHqESxRc1v0imz6JIsRCgO288LM2Zwqg8WNorRdNqv
         NsobbC+AjQbVG/ii6zWcW2dhzWf+Fr+BT87xL5ECkLrbiHQ6B2rw5sNC0hnIDzYD5ABQ
         YU/Ds+/cGCYerRzF9x0BYZdtJYqotSclx0cBRWr+Qb5uImoKYiYmWVXfvi82F0tpIKPw
         1FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119782; x=1792724582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxBCVm4Z5PhosKtgTJ2T5/Coyb1UstSb78XMv83Uqfg=;
        b=dMNHoIWz6x63mYPzcw2E9vxEJJZ6Nsoo9UlIXTuEu5JrUee9djrl6up7pJHvhcHXyR
         ygYq1R0RkwLqphrR0l34sC7lpnB8R3BXtmOSl86dx7vB4Oj+q/OMA1KiQNskn98/Qpku
         xVo9dHsBPjnr/4uooNuVKyoTgznl0bVkkCB+h3ulIGD/e3kyG4UsJYUMlqN+6PveRFnR
         5Zkmbjlcj7ne4ox9UUJJBFqMLjUrHuyx+qPjYXpZzVsD5rA7iHGHpC3LwImQ6ftB73MR
         EJmw3wod2Ioh3GMpdZrB6Ywf5DYEs9wMghiGrGyRfAR4B7D9tzcUtH7BTK6ovDEMJ5F1
         jM9A==
X-Forwarded-Encrypted: i=1; AKwUvBz2LpkKzUCUfAwK0YaeC9bCiTxlWZRK4gqHpu4rbF2VPQc51mm9ZxtazpcAqQOhE5kUvStaAnJ1t3/flzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU7gMdPcRsH13KiLhFeD3iI2hLigD34ZywOy1DdhflXZX21b3M
	6L4BdIK/a6I9iLMPpojQ1WjnOLuXJv1RqVs1g6YNFayDRcWAV+Xj699VeLLq7cBAhAM=
X-Gm-Gg: AYBFou2e3aZ/QAwFF6gFM9zLUe74veoDBU2RwN9KiQnM1YeYRNVMPyc4O1Rn+h1U78B
	fvGnxbd9gZ68kUYomJqftV8OIrrgVb0paNlONo9KGg4lPEeIh0fdNrwPhhCEDmxNBTJyqOs6ddh
	6eET/fuOqq6qmhHHmjl5xZPu4KyKAewlrlcHAzprnlmAMPpaaE3va98UmthyFD5URSuYXHquBbl
	uGLlv2ym43IlA3M7RVyqqYKpZha/2XpToGlSjWktFzm9CCr7tD+fMAZZxzgzTS2pvCXbmdGdy7i
	yDs7XRobPPJNJPC4Kt0mN0DRQ5Do7FZj8OW2ktOXFwhSaUOTLb3Kne0iwlfrFIQi8bv5owltS+J
	+lycRIkYrSiaggl2C3HyccKkl6GSzjRndB/DWBLXl3w9DPhCpcj63XZuJWvfchA9DOvFO08HlLT
	Dm89067TsKbK/2tR7t0FQSnkva9GPVxoD+mjDepB6x+8KZDkA7EZffC8Q2bi8zFS2+emUK25tzr
	ycoWg==
X-Received: by 2002:a05:6a00:c1c1:20b0:89e:71df:d6d5 with SMTP id d2e1a72fcca58-89e71dfd837mr2359208b3a.10.1792119781991;
        Thu, 15 Oct 2026 20:03:01 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8c490sm422493b3a.10.2026.10.15.20.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:03:01 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 1/2] wifi: nxpwifi: reject a NULL command buffer in the 11AX_CFG response handler
Date: Fri, 16 Oct 2026 12:02:49 +0900
Message-ID: <20261016030251.690780-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030251.690780-1-yhlee@isslab.korea.ac.kr>
References: <20261016030251.690780-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxpwifi_ret_11ax_cfg() writes the parsed HE capability through the
data_buf the command was issued with, and never checks that it is still
there.

It may not be. When a synchronous command is interrupted,
nxpwifi_wait_queue_complete() detaches the buffer because the caller is
about to go out of scope:

	/*
	 * The response path writes through cmd_node->data_buf. The
	 * caller can release a stack-allocated data_buf after an
	 * interrupted wait while a late response is still pending.
	 * Detach it from the current command before returning.
	 */
	spin_lock_bh(&adapter->nxpwifi_cmd_lock);
	if (adapter->curr_cmd == cmd_queued)
		adapter->curr_cmd->data_buf = NULL;

A response that arrives after that still reaches
nxpwifi_process_cmdresp(), which reads the field and hands it to the
handler as it finds it:

	void *data_buf = adapter->curr_cmd->data_buf;

	ret = adapter->curr_cmd->cmd_resp(priv, resp, cmdresp_no, data_buf);

The handler then takes the address of a member of that pointer and stores
through it, so a response carrying an HE capability TLV writes a few
bytes at a low fixed address and the kernel oopses.
nxpwifi_set_11ax_status() issues this command synchronously from the AP
start path, which is where an interrupted wait comes from.

Check the buffer first, the way the other response handlers in this
driver already do -- nxpwifi_ret_sta_802_11_snmp_mib() stores only "if
(data_buf)" and nxpwifi_ret_sta_reg_access() returns early on
"!data_buf".

This is a local denial of service: it needs a command whose wait is
interrupted and a response that arrives late, both on the local host.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index 96540914f3cf6..1665bd514596e 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11ax.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11ax.c
@@ -205,9 +205,13 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 	struct host_cmd_11ax_cfg *he_cfg = &resp->params.ax_cfg;
 	struct nxpwifi_ie_types_header *header;
 	u16 left_len, tlv_type, tlv_len;
+	struct nxpwifi_11ax_he_cap_cfg *he_cap;
 	u8 ext_id;
-	struct nxpwifi_11ax_he_cap_cfg *he_cap = &ax_cfg->he_cap_cfg;
 
+	if (!ax_cfg)
+		return -EINVAL;
+
+	he_cap = &ax_cfg->he_cap_cfg;
 	left_len = le16_to_cpu(resp->size) - sizeof(*he_cfg) - S_DS_GEN;
 	header = (struct nxpwifi_ie_types_header *)he_cfg->tlv;
 
-- 
2.43.0

