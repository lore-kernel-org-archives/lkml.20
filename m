Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782F37187E;
	Thu,  3 Sep 2026 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467520; cv=none; b=hFdYuKxbowialvMKpPKKEmICgclNOrEFU8iwWuFOEkA2MV90Qg0ubukL2yKfKPsLaupHyGVhu8COWHurVekbnzzSZR5DjsHG8p67+jxwyligD0so7cYKb0DszTf1SlSjy8eR769nveF1T5tJTsti1olpxxqw58Pt7h0S4dIZiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467520; c=relaxed/simple;
	bh=x2V5V68A4z540h30K15Q9BAgornczg2Z+qBg3S3fJ4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NyJqgDkaAB851aUFxHUj7U6mapE9DYLDkp3XW4QUJVNUF7fYXBhOxE2i1Um0vMWlZLWoYSGBPP/EwGl7QE/3QL7jLrRGKwwqAJuHZyxv7kYy0D6pZIwLHjbN/Ay3s31y+RZh6uiErvAF/GpVQ+1YMRGibRbP6qigw5nSH50d9YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yn8Lbc9e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yn8Lbc9e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A004EC2BCB8;
	Thu,  3 Sep 2026 20:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788467519;
	bh=x2V5V68A4z540h30K15Q9BAgornczg2Z+qBg3S3fJ4E=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Yn8Lbc9eELXbGR3lMdBtPNSA/bwrHV2H7nX3gXHNt1gF6uYNF2OMK+mXUB3Qa3sTK
	 vMjFXk0JV+w4JyQCFJZRxj9bbzKsUXRQ8KG1SK0WSB/D9Ku/WDvmdsGY+czuXVnpCs
	 +KkDfcc7SF6wZpvctHpuo8cb89Qxn4ih1A8RVTVTQrZUy6T3gBGxVzKqZHxSum1YmB
	 n/zogB+hZZErsm1kNdUnZ2hxogEXroJd1sZwvg2pCbdisL4LVZkXkutDaNl3aM4Hsc
	 lLqGnYJ2flCDkzifY4JxI6wE69j1137J0Bien5XiH8bS5vd/QMPhXDgPf2xWMHzsM4
	 vKweoEx/V9rcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2A7C624DB;
	Thu,  3 Sep 2026 20:31:59 +0000 (UTC)
From: Nicolas Giuliani via B4 Relay <devnull+nicolas.giuliani.hotmail.com@kernel.org>
Date: Thu, 03 Sep 2026 22:31:46 +0200
Subject: [PATCH] staging: rtl8723bs: use unsigned int in
 rtw_get_rateset_len
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-send-final-v1-1-e72dd23d65f2@hotmail.com>
X-B4-Tracking: v=1; b=H4sIADHZmWoC/x3MQQrCQAyF4auUrA1Op1itVxEXaSczDUgqkyKF0
 rsbXT2+xft3MK7CBvdmh8ofMVnU0Z4amGbSwijJDTHEPgyhQ2NNmEXphW3Mly4PN+qvCfzwrpx
 l+8ceT/dIxjhW0mn+JZYqRfRsK/kUVN5WOI4vSrYTOIIAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nicolas Giuliani <nicolas.giuliani@hotmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788467518; l=1893;
 i=nicolas.giuliani@hotmail.com; s=default; h=from:subject:message-id;
 bh=yzibu705xasWBwsTRqp/0Aaw3bazN0NuQTOEDempaJk=;
 b=d2HcfVqHrHqQY9mq6AR0LFZNjY2wk1086j03Gug2e2dlY0bxZhN0tpb8g3l666lQ8KJa45qsd
 PU5/LWRAhjjCADFtO2Q59x4vfnWm1O7RK2mXAdwaUXqMUCqxNE3zD/I
X-Developer-Key: i=nicolas.giuliani@hotmail.com; a=ed25519;
 pk=rNNxmS9TbBXKwfX1dwZ1c+DGVtBOSY1rgDwqf9Ecog4=
X-Endpoint-Received: by B4 Relay for nicolas.giuliani@hotmail.com/default
 with auth_id=1000
X-Original-From: Nicolas Giuliani <nicolas.giuliani@hotmail.com>
Reply-To: nicolas.giuliani@hotmail.com

From: Nicolas Giuliani <nicolas.giuliani@hotmail.com>

Replace the uint typedef with unsigned int in rtw_get_rateset_len()
and its declaration.

This addresses the rtl8723bs TODO item to convert remaining unusual
variable types. No functional change intended.

Assisted-by: LLM
Signed-off-by: Nicolas Giuliani <nicolas.giuliani@hotmail.com>
---
staging: rtl8723bs: use unsigned int in rtw_get_rateset_len
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 drivers/staging/rtl8723bs/include/ieee80211.h  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 66f476a46a..8c20609fc3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -278,9 +278,9 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	}
 }
 
-uint rtw_get_rateset_len(u8 *rateset)
+unsigned int rtw_get_rateset_len(u8 *rateset)
 {
-	uint i;
+	unsigned int i;
 
 	for (i = 0; i < 13; i++)
 		if (rateset[i] == 0)
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9f421e4875..e8f99e700c 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -722,7 +722,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	for (ie = (void *)buf; (((u8 *)ie) - ((u8 *)buf) + 1) < buf_len; \
 		ie = (void *)(((u8 *)ie) + *(((u8 *)ie) + 1) + 2))
 
-uint	rtw_get_rateset_len(u8 *rateset);
+unsigned int	rtw_get_rateset_len(u8 *rateset);
 
 struct registry_priv;
 int rtw_generate_ie(struct registry_priv *pregistrypriv);

---
base-commit: 758be99c46265b74476d5e1173d781abe325533e
change-id: 20260903-send-final-12f53f98a67d

Best regards,
-- 
Nicolas Giuliani <nicolas.giuliani@hotmail.com>


