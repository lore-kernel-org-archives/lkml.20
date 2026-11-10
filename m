Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297519;
	b=yYrG8Sh68vr00/g1QhKpv/U1rBsu/cwUrKKniFr79nKtJF9WOtDPn3mzSTBHtwQnXzjU
	 d5LBgj6Brv+EeOKUYQCYmbSTye0gIBja6uSMMRtaXL1W4Tt/iD7tOoWdn/gl90pI5W8uO
	 Ii6MNBGN2No0u6wWjkC+uVeBmDBwW/GPhgS0ypys3EVvZz59sy8uTnH/63j1+Z8omMxkX
	 +5T32vVYGsV+PZxAOREzTf+u1NMvxbNL+ZVvIQoZVWjNj4lmrV0gEDmwii9wSuDRlpYYS
	 rgb2Qd4SoJSn55zVnEjxVrEapfGt3hWXELebQvTmqyS8zhBdJGucFZy0pw5QJLEcqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297519;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V//e0uGubTqskBtCC2/1eLriistyPjk6C6f25k7k6bw=;
	b=mv687VSV4LlZJq7B31lX+VGnnCe4SioOivYrC4BQCxHE8uR4lSHztCh2aClarvtwznqF
	 B3rRVROtIKXPZW0olcsHLJ9o/bpfEzSlxIufgyPHMtpphRTziS3z1yI75Ng4a3mFrn3zO
	 8igBMj0EukBA1Qihf9AkJFOAi2C/Al7cdxRvTi/pSTfeS//ZDq4aPZ3T8yWX7Je5arSNl
	 2Q2EZfIvSPw22u016GH2XnP+OFzaYbjUyEE9sCh1kTirt3qGs/d5si3SoExCiKWa/skg5
	 J0om/SKF8t1IvWvMaqQfxX18D/33i8lWUIdaRVKjgLlp0JvBhHVWE6WLpybUP4E/ieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=uyOwwGMB;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E21060A5BDD;
	Tue, 10 Nov 2026 07:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E21060A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=uyOwwGMB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=uyOwwGMB7g1g1ljX9bIg8mD//Znf2DPUXJZKTtbFjHsW7ThwwHPIS/cbpu0qqqyonaeRoPY1a2SbV
	 UKKSWzuGOyZcl16Qa1fkbY/zL7u0oj1yG5VjyWmNqfUoEaBAvnknNsr/uJM/+ahLXZBD2RYNtvQhVC
	 WeXNAP0nk0nbgZdc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2cead661-99201;
	Tue, 10 Nov 2026 15:58:37 +0800 (CST)
X-RM-TRANSID:2ee66af2cead661-99201
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acde8;
	Tue, 10 Nov 2026 15:58:37 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acde8
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/22] usb: phy: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:19 +0000
Message-ID: <20261110075825.24946-17-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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



