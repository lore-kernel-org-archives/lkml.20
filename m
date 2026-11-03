Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704914;
	b=rbxCHkeGeRQ6iqRk35fQ/YE9K7LMIEkqSnk3+lJ85YmLMBtrWRsB1EtPpM4GEox1F2Nu
	 dtuISeEK5jG7OFjQSEQP7xAUcQCfmGDQUMmVOrkx0hylavgqXOIaZ0TAR/CluVRmG9D4u
	 pykW08nx6sE7USCDwB7KiUk+Q9Q4ct26IXoHAc9qm/IyLl2gl3iamRYKLNABQM4ctidD5
	 tVzQ63PNE3392+ngRxqVM9SMCifU0s7EEtWFufQ0zxRqtImlvof+LIYvuA0doERUo/qjK
	 y+8wDkPxPjUsrMkEKKw2MIZjzVStNyo5f5Qzv5gTo84oD4rvAl+Qr6tH/l6gHYfgLfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sCcU7tw4sqC8FGz/5EeKsU7NeWYyAMpMaMD60H7GVXY=;
	b=H83T3VieMTAXP9hbd96EBiscI6juoLbv4uOjtlnCLS7ty3LVIne97tixufTzevbi0NZv
	 esqqSlmMp1zv6K11mSQ+QxDwIcGG3INyd0/DBXqIwDCA1ItXQhtd0BedM5/RhTKd4mrVH
	 eiORuGPsKo/Jwog/KQOSdRsggH1jAhqYDDulp7xvuIDXXYlwANAlYXD1NhI4D2FQzM1HR
	 7SzkHkEryS/a3lBpk8110lm+9ctR1SFIHR2jbweb/4LBU+mU554yrxPzQT0OnCKymb4U2
	 KFA+PDB3gblUi021vnUzxRr6U8DuqNWzi0IYtB9XqOLeBjK2d6b6IbBFZRhbCfbnxQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JfFpSO0w;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241C606C566
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B241C606C566
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JfFpSO0w
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso25667355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704912; x=1794309712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCcU7tw4sqC8FGz/5EeKsU7NeWYyAMpMaMD60H7GVXY=;
        b=JfFpSO0wp6t3A87HA0Rifqg/jTqpsx1lcLSzR1cQGO124+8hrzhv+YXJ1uuATdbaqV
         wxvKxH9VFJr9P8tOi3/aLcGX90ykNEnw79qFrpENi+/yNsIgTbUXkGJqLp/WvcIc2R1g
         1zAeOIcdOzx4Grx5XaFhumQlkNn8CnZ7Ae1jMH9iGLCQaNCVTeJQ2mW2ecTWL7OatjMo
         vYkkzI1Vcn/yIoC0KmFMWraBU/Mp09ix0yqqUsKFoiK3lCLoDW95jo+/QalL2yI3/PYH
         m4Cl0Ox0FZZPtdhImDVYw1uJmD1mqlizNH4QdekZY/XSae6kMbwtc+hY7e6TmgBcUW0b
         oTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704912; x=1794309712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCcU7tw4sqC8FGz/5EeKsU7NeWYyAMpMaMD60H7GVXY=;
        b=QA0EE6/0PR7bVOdKG1DMuPXnqa7JQWa3q8Qkr3I1ih+snmAp44vBkBL1ZVD2qGHqzi
         T8OHM3frnYSxwez88ZydHlg6Qq0nLPRxobrtApi+tjXJTJbS9zuDhlc9fX2kWYQ4vfp7
         t5KNa6kOcy1z01C3Vy+Rx0RIGvWJMfRgM0c3jSP8+Pw7IlGa4OKM/KA3FqEPyjayczhd
         yCtpVckfqM7O1tkDJ6prSpfuznzbKa1Acqtlw0TJWVfQcejEb+YlKYGGVhADwmnjsptX
         EH1BzWv1CpcNMRIhueZe7skCnT5i3YvaRCq4QmNRX/tnCeSp4bsqFh+w16lEKj/TwpKD
         vC/A==
X-Forwarded-Encrypted: i=1; AKwUvBysBmE8MvobeN9Zy0de20Hw/IDIXUhdXRIujlFxjCKgg2J2iM7Vrm34vSmtPgMEB8sFknaCaaeGqVnoSq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u7Mz1nh0bVkNRm6WgTXXLrG0G46hn/Ligp6x8KU9c1DWOwo9v
	uIavu/2N72VDhvb8G9koBi5yKmaTL7frSSVIj7WnNq8QER0RP69tlss+WG3PQJ+0lX0=
X-Gm-Gg: AYBFou1hOs73OSPQTaGuKh9ctWHEPqXnULN2nS8qsWopRQc5Bih6ftOrwz3LJDCJIe7
	hctIXt1a5QVSLEdAtCXI9LcN5TtTdB1J7G+80CTwcnRxP//kW9s6Y/9U5577j86YQZYH/4u0s0m
	yzox/Cyos4VGZgcXv/hn6ome60W4MgNqc7qrTqjy6IttykQydMz86tAopMeIma+qIoiRLrcV/iZ
	jFx999smw5rtjhAsB99WzvGRLNgfrEpMCXN5Tav790QxtwwsyeTn08/gfEBTbcHbPLP+p94InZV
	A0aZwZy1AZwaVk8q01qwBHaV4Td35BzFJL035ALqfBWTSlz6/bYNlcmkFofYzCKqg2daz767ACW
	NP3PLggo343VbPH9gSridB2UQwSyjUvFXnaM0TN/uvu8wlLAIVyc6BFt0E7ozRQYPvo7WPPie0i
	qhwn8ORMY/a1z8gCwfdw+k1ptgAjDG0lIWYCUNfaPulvT8tWWYvF15zJ6sVgcfJ3GV8w3m+7jhI
	ZZ+J/Ert4BZEzWacSm3UcJblNnRA5EBP/mz8hLSTyyxLLcS1ab+TGvz2SiqNSrdVbwkD4iq0T/Y
	Tl2/GVHMHc+5yfq9+Xez4dlMCdyNUfgDofBDwVvrxnt1b8l9hbyE0yRgfGj6fhmxZJ5LdA6JU2x
	XX0OsKtnZ8A==
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr288346075e9.18.1793704912111;
        Tue, 03 Nov 2026 03:21:52 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:51 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:25 +0400
Subject: [PATCH 4/5] usb: typec: fusb302: Tell SOP' messages apart from SOP
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
Message-Id: <20261103-husb311-cable-comm-v1-4-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
In-Reply-To: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957; i=alchark@flipper.net;
 h=from:subject:message-id; bh=SPaMVKHCSHADgoe045gwJLD6PTFurGogyswiSAjqPA4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHzEVX1B4tQnF16EXPkmFXNVV5+nKH6bLNvtNVO+7
 TrbaFDe3zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUJ8Yy/C/JkApRW3Y//tm/b47Xj33cxhAdsIPB8ppNhtL5nc+u6HxmZGhUu3r
 1R6napg2FtWd2vU5Kz7neHs51v3im6tl7pb//NbMAAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver sends every message with the SOP ordered set and reports
every received one as SOP, which leaves TCPM no way to reach the cable
plug. Start a message with the SOP' ordered set when TCPM asks for it,
and report a received message as SOP' when its RX FIFO token says so.

SOP' is Sync-1, Sync-1, Sync-3, Sync-3 in USB PD. The Sync-3 TX token
and the RX FIFO token codes are from the token tables of the FUSB302B
datasheet.

Nothing changes yet: TCPM asks for SOP' only from a port that claims
cable communication, and the chip drops SOP' packets until ENSOP1 is
set.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c     | 26 ++++++++++++++++++++------
 drivers/usb/typec/tcpm/fusb302_reg.h | 10 ++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..8b3a2e095ef8 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -961,7 +961,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 	return ret;
 }
 
+/* K-codes of the ordered set that starts each kind of packet */
+static const u8 fusb302_sop_tokens[][4] = {
+	[TCPC_TX_SOP] = {
+		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC1,
+		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC2,
+	},
+	[TCPC_TX_SOP_PRIME] = {
+		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC1,
+		FUSB302_TKN_SYNC3, FUSB302_TKN_SYNC3,
+	},
+};
+
 static int fusb302_pd_send_message(struct fusb302_chip *chip,
+				   enum tcpm_transmit_type type,
 				   const struct pd_message *msg)
 {
 	int ret = 0;
@@ -969,11 +982,9 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
 	u8 pos = 0;
 	int len;
 
-	/* SOP tokens */
-	buf[pos++] = FUSB302_TKN_SYNC1;
-	buf[pos++] = FUSB302_TKN_SYNC1;
-	buf[pos++] = FUSB302_TKN_SYNC1;
-	buf[pos++] = FUSB302_TKN_SYNC2;
+	memcpy(&buf[pos], fusb302_sop_tokens[type],
+	       sizeof(fusb302_sop_tokens[type]));
+	pos += sizeof(fusb302_sop_tokens[type]);
 
 	len = pd_header_cnt_le(msg->header) * 4;
 	/* plug 2 for header */
@@ -1037,6 +1048,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 	mutex_lock(&chip->lock);
 	switch (type) {
 	case TCPC_TX_SOP:
+	case TCPC_TX_SOP_PRIME:
 		/* nRetryCount 3 in P2.0 spec, whereas 2 in PD3.0 spec */
 		ret = fusb302_enable_tx_auto_retries(chip, negotiated_rev > PD_REV20 ?
 						     FUSB_REG_CONTROL3_N_RETRIES_2 :
@@ -1044,7 +1056,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 		if (ret < 0)
 			fusb302_log(chip, "Cannot update retry count ret=%d", ret);
 
-		ret = fusb302_pd_send_message(chip, msg);
+		ret = fusb302_pd_send_message(chip, type, msg);
 		if (ret < 0)
 			fusb302_log(chip,
 				    "cannot send PD message, ret=%d", ret);
@@ -1475,6 +1487,8 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
 	 */
 	if ((!len) && (pd_header_type_le(msg->header) == PD_CTRL_GOOD_CRC))
 		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
+	else if ((token & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1)
+		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP_PRIME);
 	else
 		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
 
diff --git a/drivers/usb/typec/tcpm/fusb302_reg.h b/drivers/usb/typec/tcpm/fusb302_reg.h
index edc0e4b0f1e6..c98a502bfbfc 100644
--- a/drivers/usb/typec/tcpm/fusb302_reg.h
+++ b/drivers/usb/typec/tcpm/fusb302_reg.h
@@ -174,4 +174,14 @@ enum fusb302_txfifo_tokens {
 	FUSB302_TKN_TXOFF = 0xFE,
 };
 
+/* Tokens starting each packet in the FUSB302 RX FIFO, valid under the mask */
+#define FUSB302_RX_TKN_MASK			GENMASK(7, 5)
+enum fusb302_rxfifo_tokens {
+	FUSB302_RX_TKN_SOP2DB = 0x60,
+	FUSB302_RX_TKN_SOP1DB = 0x80,
+	FUSB302_RX_TKN_SOP2 = 0xA0,
+	FUSB302_RX_TKN_SOP1 = 0xC0,
+	FUSB302_RX_TKN_SOP = 0xE0,
+};
+
 #endif

-- 
2.56.0

