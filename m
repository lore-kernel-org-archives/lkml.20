Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628300;
	b=Ap648FXqEHtW5Wi8YE1PkELFcwrLLPFvi0Rk7ZbGj5yhVrEPwV908Svd9hVAu9wTAmkw
	 mMIVX3/Ahuk4vgp8zygJTv0bzb1Etuzt6g5eKScuEywidfGtJpTERkx2fSWnhrIfxmYc0
	 wtUXPxHln9EDSnofPGaNdrR7lP0lgR9p0W/Cyn1nu31FNVTuodGkh9ComvouGk3UGmjB2
	 FUZ2cI8oaw6d7xQvC9JfTPxdC34BH2koFKnX2sMMDv0jK9Nv2PfdkxVCMyAy0MTHATtis
	 VsXzw8OQTxgQDYdl1g1ZmIsrolFRsqzMKBuRNCQ74xI2qbawGBMV7OWFQaiqGeIDMvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HlH6HJ9AzhH0cBdXc0NNL2Vao0WiXPXGwYC4r4Hr7pI=;
	b=hp7pPr0GB7ExW8hg+GbRmuiKb5Ha8Go37UH0KCmUvhVMmcsPuOG9Z+AxbfAbIuM8S2Qy
	 EV6uyUe268gl48mYIQ8emPMNLea/PCVTW3xDKzMX8dTBdJUebjTutEjT1/57fFNIZhnor
	 oSd1eOAxbhQuXeJpOQbwBApwUolCFZKwcF3ZsoBydclpjNxVR4YkgypAM7ltfXaATHjgU
	 0LpHcbvw3QX4TWBaR4OQBeHOf6/MJfZxUgrmnRqvlQbmzb/9wwHGj8AYqLrhoy12Y11k4
	 JNQ5beCbmJMuTkNJLeyg4o8JEhMaIDD5RDNRXATobJ6BQ+9+ffZ/WVYWHjhwy2e66Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cO5671f5;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF807606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF807606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cO5671f5
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso13666785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793628298; x=1794233098; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HlH6HJ9AzhH0cBdXc0NNL2Vao0WiXPXGwYC4r4Hr7pI=;
        b=cO5671f5GfzuJZP9nmVOTQhaoaNZljJhHb4Wyqoun8A7/QZ5xEwHE77qAQmfJy1Aya
         CbV2rKEOlk+QZDZehfgiNhgnFo7pXk74Jg+oqGb3GxtHF22pnwe7DYPVzjlqR0zZUttD
         NWMa+Yk1NDfQpo40+XwPP3Xd0+WzoL25UOnE2V1HCjk0s6y//Lz0qe3c2ojpqHKt1lXP
         ihN+S6hHbJvclJIDwhBMMzRJZXRVL51A09aDCzTVb8QwfrAFwEvvollDHN2eucnq/Bj3
         rz5g5Wnv+O3GuB8VVAJMPfaWJHUrgCwLCCOPVGFq2p79AiWmy6eunA0pEt7KVHhtStEl
         v7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628298; x=1794233098;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HlH6HJ9AzhH0cBdXc0NNL2Vao0WiXPXGwYC4r4Hr7pI=;
        b=f9YKv7R9bvpE2f2SV8IapMpYuAQC9ACuDBAQTBkEztrZGdGKt6WKHyRPBJdjyRH9YB
         c9ul/bDx1pBvdNWFBnYelCvjQmwuHT3v+exwToqHwq+rgS4mjneBKrr4BmO0+C59X8zQ
         oOKV4+5m1JqHMT/hY1zVIADZ4ep0JqfD+xN7yy01sFiaRFl5J0DoOVZD1IMUPbHtXPlP
         yBq3DLSN2v/LEsZuHTPqHCQtjbMKdMe29dgpchS0GAsdZCF+wH0aBHh0nT+tVPLTqfkh
         7qbQr3OnQDOZcuDRXVdb0PaNEBTCo+jedh0LUpIHSJr9tAGzMHQitoqYMVsyhoTLGzBq
         /tow==
X-Forwarded-Encrypted: i=1; AKwUvBzT5xFDW2ffcIkSHRxb2wzawb7lqwlRjWF6FBHKs+S6MSokUJs8tWNi7iyAEBRfsrhtyi/eWe1/Xi8tOPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPsrPIup85av6kXo/iOy+w5cV5aFcv9cNSe4h416UeZC2YJx/z
	oiODjPFDtubHNa/yYhWN/ROmLPFtYTlW5aD+A/mvx7aHrzsBSheUivWs59gNgoZJ9I49zf8Liz5
	DVKHlJjKiDw==
X-Gm-Gg: AYBFou38FTyrVt8+cDeJ2tFwJVYN0minj1GfMkiNizJwlxaidW25buLTULNXR4k0D+G
	RnIuDrrPpfcKGxCaVjoMQNr0s9uQQk5C9FtyyGbfx/P/9aN44X3pdLoJL8lrrqDBhXnQxyfOEi8
	DhBbeCCGF6rRXi+9o6tqnxpv88X0Y9VfL11bnuUJznmEuthDWNZmDWkBXmoSGvKsseQjiMc6bGY
	Eg9wGonyse+EPX3Y9WbItkas5FLOPUnkT/TDq4pyDnVjxBiRPdGycb9xpArqPZKEjrj2CldL6nG
	VRMfCx5RkUFsbrMKiBJiRgSFcEPVGh4FZzr5PTVlG3IWfewH9YIX3z+Dvdpksp68wCcq4eCocp6
	+dyDnZbLRVEs6f36g11rt/e/B2FIgMZ2xF0VpqrFaQPvtlyQq5sJcvOydJvXlanVjO87j52mr7D
	M6U6SmzWXjLkkVzqATOlDOkOdvOIJ+LdZxKqhjrxtDa+YUc7OTR/KtozOHZY4NPAM+EWBkaryYZ
	RaWqKYaFOn//I/b80L47NOxXDVOXUwd2BHcLeP7Tq65xhTOM1io08AGfQOjD6DPDAZbriU3nOtF
	FMPd0aR38HQWzSebW4vIBipPBhHJPT2tSRttGwBMgfsBr7ZgFtVRElWzrZjrFZXK2A14xnnIEf7
	fK8qcyT3l
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr101213825e9.35.1793628298304;
        Mon, 02 Nov 2026 06:04:58 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm202182505e9.0.2026.11.02.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:57 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 18:04:46 +0400
Subject: [PATCH] usb: typec: tcpm: Complete discovery when the partner
 lacks SVDM support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgAlXpVUoXMTPqFEwkY0OLe
 HdTXb7F/xsoJ2GFR7VB4iwqMRSYWwV+cmFkFCoGW9vGmNri6pcZSdTHzOmHIaJmmrHvnDPDvW0
 6IijxkniQ7zl+vi7rp3+zX/832PcDHuB2i3oAAAA=
X-Change-ID: 20261102-tcpm-discovery-no-svdm-b8aa1f5768dd
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8+ESZci8+ds89DX2dU2TuMQVtHES8Aj9Kyz+KdWXPd0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9mNF8NCjCePHB6Ny/m+yvx2ySCZtxv4/XZNWcCctXs
 hxhfCGp2TGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUu6kyMjS9WlV3VD7rg5oL3wqBra5XumVm3Hlf4DWl8GeHxoIZEbyMDHsmm6j
 N054v7eAVziF76ELaykd/QjJen/Pcbe3taNSuwQEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A PD 3.0 port that does not support Structured VDMs answers Discover
Identity with Not_Supported, as TCPM itself does when no sink-vdos are
configured. TCPM treats a NAK to Discover Identity or Discover SVIDs as
the end of discovery, but on Not_Supported it only ends the VDM exchange
and leaves discovery pending. Every pass through the ready state then
restarts it, and the state machine passes through it after each reply
it sends.

Two such ports therefore keep each other busy: each answers the other's
Discover Identity with Not_Supported, which restarts its own discovery,
which draws a Not_Supported in turn. Two RK3576 boards connected to each
other exchange about 25 Discover Identity requests per second each way,
indefinitely, crowding out other PD traffic.

Mark discovery complete when the partner answers Discover Identity or
Discover SVIDs with Not_Supported, as on a NAK. Leave a Not_Supported
from the cable plug alone, so that it cannot cut short discovery of the
partner.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..e21fe544b2d4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3908,6 +3908,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		case SNK_READY:
 			if (port->vdm_state > VDM_STATE_READY) {
 				port->vdm_state = VDM_STATE_DONE;
+				/*
+				 * A partner without Structured VDM support answers
+				 * discovery with Not_Supported: there is nothing left
+				 * to discover, just as after a NAK.
+				 */
+				if (type == PD_CTRL_NOT_SUPP &&
+				    rx_sop_type == TCPC_TX_SOP &&
+				    (port->ams == DISCOVER_IDENTITY ||
+				     port->ams == DISCOVER_SVIDS))
+					tcpm_update_vdm_discovery_state(port,
+									VDM_DISCOVERY_COMPLETE);
 				if (tcpm_vdm_ams(port))
 					tcpm_ams_finish(port);
 				mod_vdm_delayed_work(port, 0);

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-tcpm-discovery-no-svdm-b8aa1f5768dd

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

