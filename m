Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292880;
	b=xCkYgtaeWahSgNkN1pfk3C8zivtiocC4UOsnKQAvdyDAGdm5i9k+QTrtJ/yrRTgsTWte
	 JGTXk4UJxZvP9lAhLJha5SkQl/SJfvbf3yshSi/YnwLQzGF4f6qjc4KtLVZXKOo8cKiwh
	 iwFtQ2qo0OOnOgU4MDGgQ3Yia2YF+kVgxtMl63vCthemm/2ttFfOtrqF1Iy57dAn+z7Oc
	 1nXK72LqYAZc/kxmVpPGA6NiGl7ETZam7iyKc3/2q7JTrJE9NZ1FBHYzZBByWfTDJpZnH
	 qszhLieQi2k6BRew3MyENk9rxrf+JiWSbcjpGjXfmYQBL0PMJqKUz4HuOGcZjwiGoSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292880;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V//e0uGubTqskBtCC2/1eLriistyPjk6C6f25k7k6bw=;
	b=YdeOfWMkO91rzYLvwAhEXfgNwJtZSBIGKgYinzqTJTEiJrBjP30tq4O+Piv4aflRLwPA
	 o0cOTX+UwP2na9PZXrEkW50JRFEjav0l61orHzy8sTbr5cdl4B3Z+iw8T8zR+R5GNcC68
	 d5N3Txu1h9wouIGxuzah4u3bF0Jsv+rSvN1ftuerXIYdg9WngPI1ByjeiPVHYGJJELMbf
	 zB97UsvJl2ZbhIDwBWo77t4Zi9znVQINhKWnDrqq68knalLy1yI90VEqOUL+boAakZypE
	 P8/ad1JLA6FnE46AFDuwoM46okSMPxl/CKHFMk3+oRsSGboUrEoM2GyMoBaTCF4yo/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pX8nPRJz;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2C60A261D;
	Tue, 10 Nov 2026 06:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D2C60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pX8nPRJz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=pX8nPRJzlZnDDUQ6TLYzLEMjCfC4i/jwBmHh5uJv0Oy8/1CfiKiBw6uTzGqPAZavxNtt5OHqPYL68
	 85uHenEHkEJYMhsMFiL3SPn5So62hFulhGgrkmNzZngm659d4ZRCIJDME6MSYXAQVxG4LQCuknWVWq
	 /1tuhOMxbTskRGgE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2bc8cd17-d0ff1;
	Tue, 10 Nov 2026 14:41:17 +0800 (CST)
X-RM-TRANSID:2ee96af2bc8cd17-d0ff1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa121;
	Tue, 10 Nov 2026 14:41:17 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa121
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/22] usb: phy: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:59 +0000
Message-ID: <20261110064105.20335-17-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/phy/phy-fsl-usb.c | 2 +-
 drivers/usb/phy/phy.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 1986f7e9d9be..96f206351c3f 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -166,7 +166,7 @@ static void fsl_otg_drv_vbus(struct otg_fsm *fsm, int on)
 }
 
 /*
- * Pull-up D+, signalling connect by periperal. Also used in
+ * Pull-up D+, signalling connect by peripheral. Also used in
  * data-line pulsing in SRP
  */
 static void fsl_otg_loc_conn(struct otg_fsm *fsm, int on)
diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b9353f343..4cabb2cfbdf9 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -202,7 +202,7 @@ static void __usb_phy_get_charger_type(struct usb_phy *usb_phy)
  * @state: the cable state
  * @data: private data
  *
- * Determin the charger type from extcon subsystem which also means the
+ * Determine the charger type from extcon subsystem which also means the
  * charger state has been chaned, then we should notify this event.
  */
 static int usb_phy_get_charger_type(struct notifier_block *nb,
-- 
2.53.0



