Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292887;
	b=ny4YIPX1wHCzZQTpPInZshhoG8wBElv44hFso2gM1EyCgTa4D5gqzX68xX7lvAXwspbp
	 8ueSnmfbu8bbHwxSpqz1+2wmaJ3w/pF0IWiKXYwruCSrbBNSU3KwiwHoHfYD0xGi5bkyl
	 Ejo2XZlikJORYs07uSJVjn0sRmwRoXodXzbcGsmCZqkoQMkqS70FWSj44P8DfVawuIF7H
	 kBR4RqqYfp/V4XauLrfuUgrslgRiuyuxWNai7t+JqGvsJxu/zPmHY10ZRLcE633MRnB+p
	 GbAoMu85leAdqN8pD90V2vtfbldyKv5yOMWJY1GyIO1CHFN1weVWtCTiVjm7nKE80Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292887;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NoBZTVv1shVwmkJvvV8aDCWMUpsFZmi4eqE2fdU6/kQ=;
	b=tLX6x4/BCpZNZx1HJq8MJt4xy/q1sd9oSL69n/YzCan8DWjqlo+6l23DGfCloVstk1+k
	 3i0dOuXeyEkRIdUo8iAIH651nXvczp03+K+RCj6AFmlcHQiOybnuK3P1GN5XrFvYKNUZX
	 Cb6gQrOOReUlnzVdHBejyeHZeDPSD3YOvPFA815ulG5rqsy8JL0Q94ut7qcWOtxtDxFxF
	 VGjSaUmb3zjDd7QaSJrhXPIM9TO6DGorSB+fUkKlHqfMcl5wJcXT+X87rXCRczTXlXG20
	 9zIeo4pS8wIiKmdKFzXwk++drWgwcMqJaJWSp15pOBtJ6umMvSeCB1Lpzr49nX8vWdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PwpMzumV;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BB960A380A;
	Tue, 10 Nov 2026 06:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BB960A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PwpMzumV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PwpMzumV15M1q6vJ97fEFZH37xAytKL9YfjvE6kCPxilC1fWf8khqC3Cb3GYcbviOF/8OhatM2IcE
	 h31Hmq6niUFdGwcZl7VC4IEufRhtC6JecCrEtL72tNyFIR6U5fVXx5fjTdvvhfFYHWjU4jXQv7jn9k
	 QG67uLiSekDWMOj8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2bc8d1fb-a75ee;
	Tue, 10 Nov 2026 14:41:18 +0800 (CST)
X-RM-TRANSID:2ee16af2bc8d1fb-a75ee
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa122;
	Tue, 10 Nov 2026 14:41:18 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa122
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/22] usb: renesas_usbhs: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:41:00 +0000
Message-ID: <20261110064105.20335-18-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 drivers/usb/renesas_usbhs/mod_host.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 0c7fe109d5c7..92f4f35f8bb1 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -852,7 +852,7 @@ static int usbhsg_try_start(struct usbhs_priv *priv, u32 status)
 	usbhs_pipe_config_update(dcp->pipe, 0, 0, 64);
 
 	/*
-	 * system config enble
+	 * system config enable
 	 * - HI speed
 	 * - function
 	 * - usb module
diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
index f7ef3a9f82a4..1a35f54203c0 100644
--- a/drivers/usb/renesas_usbhs/mod_host.c
+++ b/drivers/usb/renesas_usbhs/mod_host.c
@@ -1319,7 +1319,7 @@ static int usbhsh_irq_attch(struct usbhs_priv *priv,
 	usbhsh_port_stat_set(hpriv, USB_PORT_STAT_C_CONNECTION << 16);
 
 	/*
-	 * attch interrupt might happen infinitely on some device
+	 * attach interrupt might happen infinitely on some device
 	 * (on self power USB hub ?)
 	 * disable it here.
 	 *
@@ -1347,7 +1347,7 @@ static int usbhsh_irq_dtch(struct usbhs_priv *priv,
 	usbhsh_port_stat_set(hpriv, USB_PORT_STAT_C_CONNECTION << 16);
 
 	/*
-	 * enable attch interrupt again
+	 * enable attach interrupt again
 	 *
 	 * usbhsh_is_running() becomes invalid
 	 * according to this process.
@@ -1468,7 +1468,7 @@ static int usbhsh_start(struct usbhs_priv *priv)
 	usbhsh_pipe_init_for_host(priv);
 
 	/*
-	 * system config enble
+	 * system config enable
 	 * - HI speed
 	 * - host
 	 * - usb module
-- 
2.53.0



