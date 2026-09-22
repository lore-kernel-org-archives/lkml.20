Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF60551995
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087322; cv=none; b=kt6iQDhG/S99VIEkdKfYiVzYECyE8hGW9YP3yDRi2Uv5/ePuk17x7KUDYAJGguzCWNPn1tmnmvh9RSaykqYl+PwTe5R/W3eNSqYHYYaS6TDbRZ45iT7mQEVzZw9cYK4lLUcSk1bq9UU31NU0tJeApMPSvnSbrcIhd4InBtxqq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087322; c=relaxed/simple;
	bh=3F8nzkClo9hFmLBqeL2ZwX2gzhcKOqj11Tya8k4rmUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mr0j9zaGX8/bLHhNGkCSuBoudxptY20GgNaUYsImLAScheStHzRA9VCOn0FDv77rd5ey7lk7y8nBoK1109k3G0DG1UqGBla52U8glT1+ANSjYZcwZOFD7tIaeiFRhRjONQ94tgjknEGxDY25LPMJTp/uvLQI0Nk/tH13UB9qHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOQtrtKW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOQtrtKW"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1076684e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087319; x=1790692119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u3pLUA5u42iB7wAAx0Pnvzg/CHC2JIBmGTUfYO84VU=;
        b=LOQtrtKWExY/0366Fz0+GMQF0E61usIS5K2vvYbqS1Hv9I2zJF5ed84jTSnL3I7CVk
         EtBi/Vs3OVAr4MI9jTCnwedPBboFdGur08gdqsMx4rVslIAp2bUz5meyv1rhVdBJ55W8
         Swt1fLqvAuwh3kw/Cil0ZIh/+WSydtiywbdlKtB2qjm1sdx3kEYAp4DEwrRKXjEBzajA
         sVkQixYACIuEN2+4F2Ptr4LCh/XbTVHo5jC3B7n1b3qTkc8l6T7hm5BkFeonw1ve1rlD
         EAuLoZfsfDMxAmPYenNwQFoBBQBXBnSqXcvfnun+UiTypJcJEcWwfsL/2Pa9co17xIEl
         UDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087319; x=1790692119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1u3pLUA5u42iB7wAAx0Pnvzg/CHC2JIBmGTUfYO84VU=;
        b=aKMtJqbVUMXyMbMCxF9Hhg3utd2UTPb0VgBZTkAedYcrnIHbjdv+Ct7IprqEjAdy6e
         c8J5lAbrKb/Br+JPZxtPiCngfa5ROpHuB2Fc2WNrdnuux7kRz2d4qyaiyA3pf0maDFAz
         +btdR7Y4hsJg87l017BXYNrlycGmRsu6SfHvR59Tl/z2iwzoY0nBZJYBbPCB56ko69cC
         YA16JVE1hatv3W5XxPTlPCngrOqDbdLN9R2KohEkKsgetGO989FToGM1mq3SXY0SjSR0
         bVsXun40u849qnwl6dC3H5w2r37co9zQu2zDwYl8W/bBVoTlXh6DCwxE6okBmQ6hshj7
         tmzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLFy9ZD8E4cBynA169MkgIQpETfmlWEOYnL6H2O/YfEPRG3ZGmyTLwiXP4b3I2ZmRDXp8fiK2eiJpOqTg=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Tso1wr0Q85vIoM/W/ROAaAFrGGUVCGMX0L3lyhfpf34KDTVX
	5+Z8xTEUjiTcf+CBsK9QUVbsznb45hr9OQAR+UJjN+68VJwTcey5f5CY
X-Gm-Gg: AYBFou0aiAiRnizOtxyDcSXRs+QksW9Bkze+FFO73Ticv70WFdv85JBC2rA0NZfxtCH
	y62Y0/M/sN0IpPBG68FFDAdeBEWP9vrf6uR8DdZ5z82FRnHOA+u5pY4hi9OvD97kS+L8yA2Hm9b
	UyvJu0khR8NvjU/+uS3+nQW1l96vEFzUq1HYqiQXWqwFcPqanvwSami5PQdeNHnv/NlBos01I1h
	DiygjeTdJyx6ijjC4GugccBAL+TXhHPo24CFT4OboIgX43QuZGYhk4ug0TNvou60HQMDYHK+XVx
	5CcaKFQAGVT/dZLsqmjFB7p8XCqvt05F6Skdlb6WXC4HeioCINXASl61Lm3cz/2zMePSLiNURIU
	8owQ8BIPnbzIErqFmYAyi0l5NtFnngOANPHzq+vAvaaN+BrvTwsTU+MJN2QRI9Lolz5fh54MfkX
	xEn/lmlIUfiM7cO+md7USYpVp7nQ7pSy6/ZE2KSHJ9uFOV9K6JH20AJgXEkyc5QOwZVtkTCRRYT
	jrr3QGSk5PFKbmzttGy85/r3owRr28toLaLCA92AUDdUCu/s0U=
X-Received: by 2002:ac2:514b:0:b0:5b6:1aee:95f7 with SMTP id 2adb3069b0e04-5b8d2961643mr658169e87.43.1790087318520;
        Tue, 22 Sep 2026 07:28:38 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:38 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 2/9] ptp: ocp: do not cache EEPROM content after a failed TMC bus hand-back
Date: Tue, 22 Sep 2026 17:28:22 +0300
Message-ID: <20260922142829.57740-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adva_x1_bus_release() drops the i2c root adapter lock whatever
adva_x1_mblaze_release() returned.  That is deliberate - holding the lock
after the firmware failed to take the segment back would stall every other
user of the controller with no way to recover it - but it means the errno
reaches only the CPLD operation that held the claim, while the next
transfer on that adapter may still be routed to the TMC bus.

ptp_ocp_read_eeprom() is reachable from the unprivileged
DEVLINK_CMD_INFO_GET path and stores what it reads without validating it,
so in that window it can latch whatever answers 0x50/0x58 on the TMC
segment as bp->serial and bp->board_id and then publish them.

Record that the routing is unknown when the hand-back times out and skip
the EEPROM read while it is, rather than caching a value that was never
read from the EEPROMs.  A later claim that the firmware grants proves the
handshake is working again and clears it.

This does not fence the at24 and nvmem sysfs paths, which do not go
through the driver; it only stops the driver publishing the result.

Fixes: 3b815e29966f ("ptp: ocp: add TAP CPLD access for ADVA TimeCard X1")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 4a58bcc14648..510083dc750a 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -448,6 +448,8 @@ struct ptp_ocp {
 	unsigned int		cpld_id_attempts;
 	/* x1 TAP CPLD present */
 	bool			has_cpld;
+	/* the TMC segment was never handed back; routing is unknown */
+	bool			cpld_bus_stuck;
 	/* EN_CFG_TP issued but not yet REFRESH'd */
 	bool			cpld_in_config_mode;
 };
@@ -2022,6 +2024,18 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 	if (!bp->i2c_ctrl)
 		return;
 
+	/* A hand-back that timed out leaves the controller possibly still
+	 * routed to the TMC segment.  Reading now would latch whatever
+	 * answers 0x50/0x58 there as the serial and board id, and those are
+	 * published over the unprivileged devlink info path, so refuse
+	 * rather than cache something that was never read from the EEPROMs.
+	 */
+	if (READ_ONCE(bp->cpld_bus_stuck)) {
+		dev_dbg(&bp->pdev->dev,
+			"skipping EEPROM read, TMC bus routing unknown\n");
+		return;
+	}
+
 	tag = NULL;
 	nvmem = NULL;
 
@@ -4537,6 +4551,8 @@ static int adva_x1_bus_release(struct ptp_ocp *bp)
 		return 0;
 
 	err = adva_x1_mblaze_release(bp);
+	if (err)
+		WRITE_ONCE(bp->cpld_bus_stuck, true);
 	bp->cpld_adap = NULL;
 	kfree(bp->cpld_buf);
 	bp->cpld_buf = NULL;
@@ -4632,10 +4648,17 @@ static int adva_x1_bus_claim(struct ptp_ocp *bp)
 	bp->cpld_adap = adap;
 
 	ret = adva_x1_mblaze_acquire(bp);
-	if (ret)
+	if (ret) {
 		adva_x1_bus_release(bp);	/* keeps the acquire error */
+		return ret;
+	}
 
-	return ret;
+	/* The firmware granted the segment, so it is answering the handshake
+	 * again and the routing is known once more.
+	 */
+	WRITE_ONCE(bp->cpld_bus_stuck, false);
+
+	return 0;
 }
 
 /* Select a mux channel, or deselect all with ch < 0 - the power-on state.
-- 
2.47.0

