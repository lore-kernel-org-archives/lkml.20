Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541435;
	b=USh9DTJW2PFQwcHdkpi0C/dshtOV5QP3HRlWbd2/tyE1zQ31BBv1e/RjZrgu7Pgi5FAP
	 Zb8J1NweK541MgngQ4WqOWO8i1F6S0IWLy7xLi1cNWFGg7im/zANJsg95e/QuDE62Uj7E
	 HzmyN17WSXPT7qHKSSUUPjnI+kA/dWPAz/9pVySkb6P/BaB3L3ufFbdVghc4xS1zHP0Q6
	 z/FLP/ae2iJaBNXRNaRrVRYokVjIqcbLVUGvH/pISt9Bld5I+SFNl7BL8h3lznRA8KDNi
	 XUfLilSTJLpWjtITCcgPRm32ViAPjg3llVfu58FyCw49cStvgW+uxMm3GQ5pSW7sCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Av2lRHeonZp+yqJTEDLWyK1iTAVf1prXux4FrMXUUmk=;
	b=ft0LbNlZT09ucDl6cDvpAewly9Wr4DNn/+lkKrolGq1E4C1qZskmWrc5FCrTHufKRUeW
	 8ywFt/jt6ayNirTsjbt3hINreUtsPZ/BmBZsH2ya6rx1mlCABXE76ZYXPWeZmXoRvLQP3
	 vPQWWnD9E1U4Nd/q+uZR49vdyhgE18JoycEVJ5Tyn6VsKTVuiibj3UrlJ5hxnGsyasobl
	 QihkHs5EfwetGQyrtr4InzZZ3szuBBtkGW8NoKFTTVY5J9jsPebfH3p6KP/Pr/wOCRmdA
	 uswZoacH/JRHEL+L+zayL4OeXtxmeqQKCMQ70iT9J1YymFFovF3rWbceWOwZjGedvCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpvCcELo;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D550606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D550606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpvCcELo
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1803176f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793541433; x=1794146233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Av2lRHeonZp+yqJTEDLWyK1iTAVf1prXux4FrMXUUmk=;
        b=kpvCcELolWKyz7orObe+JQqernuSpoQ5Ny2vq827dOLXA1XJXegvAQWPgJ9zuLnKYT
         8fAsI3KVYJppf7jgdQpsN9P2+yYDUNQJ3CBz8ruYSxCT2iKKExvDahhqOcsW5Txqmxvq
         6MR4GKbVhTHg1VvArvK6h/s1h/6oQTr7zyClITEhnPqnV3BVrGf2fkoJC9nXZp3UwizF
         nSLNoVlBbIDWKSKeaJBJ7Ld+3il+0o5iXFHPXeroNISxednfgC1C0cIwnvxxh3HWLkH6
         iGNrtmpIvQVRETcffOis/RAjmiLCuoXis0SycrFUn/hs8QabI05c1S/QJJrtwzzviK30
         4hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541433; x=1794146233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Av2lRHeonZp+yqJTEDLWyK1iTAVf1prXux4FrMXUUmk=;
        b=VJAfsf2DeimPnVFjFe/ct9u6VhB8qsTULhh4ZlcQy/J6g/thAA6McIU+tSlTQGKCaI
         ClbouPD+2gs6u6QHMn2CPRT78RZi4DkNS/PCXeqiJ6kBNDKyWvwRWQ32VvpTFg1+cNXe
         obXwIObcoMsCQrAJcGssPuwu8iNj3Vjfr4oNPZLIAgTR/v+HqxdZyZ+USk0D4pUWxH4h
         Pn8gglKG1gMUZpXOHakrpG56Tteyr0va/50wyr9NVLj2/z8Sjk26OBhq26PmF/XashAL
         pmpAIAR4gxVaNOLu6fPI3WP5MbvMM2Y6OcxEsBMbSGbsMTSOk4NpmNtutuYHbPpqkSFQ
         /P5w==
X-Forwarded-Encrypted: i=1; AKwUvBzqVkDCcteYI/x6WOCmGxra3yOWtKNH7ObcHS/DeDvzR/aR3phaXxQhhc4aGDpc1ufajGpgWD6BGB3h2Sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lya3HmKJutDG61XP9JytJOOmW19PM6p3Vvq/0MaEJC33T9QZ8
	M+VoeBBsYNeM2ZIQ7nHFNYOV0kDaOKmbG6XDQGhjkSRqEGR+cltMwrZU
X-Gm-Gg: AYBFou10nONa1MIWPogVrtEbA+13LzuzbfgxO1t69ZL+efrrrF+0jNGDTGU3TeHpGmK
	2K5VSZaQoupAhyeJ7dGTYlxEk074VZ1Rf6VBfdV8mTiMg/8DNnTBuf7fJ05n3wICMa9d8W4IN9E
	sNINt165wUy2yAJL9iCeoSCeZDHCzfeC2M3PCFzmJWkKeerCGeTtTpHI5MsupzHChNYvFfcr0OG
	feTdLUJ9HSi453XAua8+zrus31QpzyCma1X17iJOOIwKeGMjwxXlprdcv0jDbeetkgGi7mhXT7A
	PGcAsOt09LvNGDCTYv78yx2t88RXviznvh0WkZgxFbSfG001E8B1LS4A1BBYsCawTjWIWEDVX1C
	qWCXlLwyscCqBr/SDaH+lyXYcbSyid5h4Tov9Hp32mrI0elT2VUVv1WQD6hftFFKqSIR9ky9/+G
	hBqiqIIJxMgwNYOGAXqDptKMDtvvszxIyQhq1gUaucaSlDQU66mJUeJT+X+SLm1GWXrVPhbQWwB
	ZY8Y+lS4MPJeq/MkvoBx08CQuzOQVtdHFzB/XJ/A++0q+LsRRvZ0LC1ic04Ym/a6pvnsaoHYqTj
	wRJh7tvSGnxIKdrvr1Wzv55b2vUK7GPj2Ck1
X-Received: by 2002:a05:6000:2603:b0:48e:6852:aea0 with SMTP id ffacd0b85a97d-48e6e526830mr16658272f8f.48.1793541433562;
        Sun, 01 Nov 2026 05:57:13 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:9c55:89d4:b00d:2bbe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm13856454f8f.29.2026.11.01.05.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:57:13 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2 2/2] NTB: epf: propagate MW command errors while status is reliable
Date: Sun,  1 Nov 2026 15:57:06 +0200
Message-ID: <62334fd3b8d69fdfdeed268d71f473df45f34556.1793540847.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793540847.git.thnkslprpt@gmail.com>
References: <cover.1793540847.git.thnkslprpt@gmail.com>
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

ntb_epf_mw_set_trans() and ntb_epf_mw_clear_trans() discard command
errors even when the endpoint explicitly rejects a request.

A timed-out command may still complete on the endpoint. Propagating
that timeout can cause callers to free DMA buffers before the mapping
completes. A late completion may also be mistaken for the result of a
subsequent command.

Record the first command timeout and propagate MW command errors only
while completion status remains reliable. Preserve the original MW
success-return behavior after a timeout to avoid releasing buffers
based on ambiguous results.

Fixes: 812ce2f8d14e ("NTB: Add support for EPF PCI Non-Transparent Bridge")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/ntb/hw/epf/ntb_hw_epf.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
index da7fbe1800656..455bcefc7c13e 100644
--- a/drivers/ntb/hw/epf/ntb_hw_epf.c
+++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
@@ -102,6 +102,7 @@ struct ntb_epf_dev {
 	struct device *dev;
 	/* Mutex to protect providing commands to NTB EPF */
 	struct mutex cmd_lock;
+	bool cmd_status_unreliable;
 
 	const enum pci_barno *barno_map;
 
@@ -148,6 +149,7 @@ static int ntb_epf_send_command_locked(struct ntb_epf_dev *ndev, u32 command,
 			break;
 
 		if (WARN_ON(timedout)) {
+			ndev->cmd_status_unreliable = true;
 			ret = -ETIMEDOUT;
 			break;
 		}
@@ -156,6 +158,13 @@ static int ntb_epf_send_command_locked(struct ntb_epf_dev *ndev, u32 command,
 	}
 
 	writew(0, ndev->ctrl_reg + NTB_EPF_CMD_STATUS);
+	/*
+	 * After a timeout, a status may refer to an earlier command.
+	 * MW callers may free buffers on error, so retain old semantics.
+	 */
+	if (ndev->cmd_status_unreliable &&
+	    (command == CMD_CONFIGURE_MW || command == CMD_TEARDOWN_MW))
+		ret = 0;
 
 	return ret;
 }
@@ -485,7 +494,7 @@ static int ntb_epf_mw_set_trans(struct ntb_dev *ntb, int pidx, int idx,
 	struct ntb_epf_dev *ndev = ntb_ndev(ntb);
 	struct device *dev = ndev->dev;
 	resource_size_t mw_size;
-	int bar;
+	int bar, ret;
 
 	if (pidx != NTB_DEF_PEER_IDX) {
 		dev_err(dev, "Unsupported Peer ID %d\n", pidx);
@@ -509,19 +518,19 @@ static int ntb_epf_mw_set_trans(struct ntb_dev *ntb, int pidx, int idx,
 	writel(upper_32_bits(addr), ndev->ctrl_reg + NTB_EPF_UPPER_ADDR);
 	writel(lower_32_bits(size), ndev->ctrl_reg + NTB_EPF_LOWER_SIZE);
 	writel(upper_32_bits(size), ndev->ctrl_reg + NTB_EPF_UPPER_SIZE);
-	ntb_epf_send_command_locked(ndev, CMD_CONFIGURE_MW, idx);
+	ret = ntb_epf_send_command_locked(ndev, CMD_CONFIGURE_MW, idx);
 	mutex_unlock(&ndev->cmd_lock);
 
-	return 0;
+	return ret;
 }
 
 static int ntb_epf_mw_clear_trans(struct ntb_dev *ntb, int pidx, int idx)
 {
 	struct ntb_epf_dev *ndev = ntb_ndev(ntb);
 	struct device *dev = ndev->dev;
-	int ret = 0;
+	int ret;
 
-	ntb_epf_send_command(ndev, CMD_TEARDOWN_MW, idx);
+	ret = ntb_epf_send_command(ndev, CMD_TEARDOWN_MW, idx);
 	if (ret)
 		dev_err(dev, "Failed to teardown memory window\n");
 
-- 
2.43.0

