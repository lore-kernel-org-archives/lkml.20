Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8723D9523
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670027; cv=none; b=a09j74hyR87dHrcLtyZVhQCE5VYCHuJ4S0I4n6/Y0JVJWhgHgDlvtflRBNegXq1o0VfEZ38pGAvAjh/gPEkGSiNDMS8IodZxkfdc1pwxFiVL+Le/xJXuL8o0JWjC7lEkqdcBS719lDu6duZ3lS7PH5mwnrgiTQGfPJG/QU7VN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670027; c=relaxed/simple;
	bh=3MiKQQRDEWCPyTH/4jWGYGvYiNpYurGnuiVLNI24DTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SpVmkKlx7rjPE63D5fJV8B3PvdYmhYqH28Kbte00vjO1LD0AeoTF76z2A7Rx9FYZsw9Xak4HUZHNpH6Gt6XUxHbwAF/f12PBTw9YT7ex+zYNDuZDzqg9uZDQFrbe378swZqWNYC++GU907x8dlLBlzlxInyf2w1O7go2WFapQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9QgaJsC; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9QgaJsC"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb4so128170585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789670025; x=1790274825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDvVoV5ROG1mKn3iD6+o1D5ZDgbS9tQ3bJGaaKaossQ=;
        b=o9QgaJsClCi4Dhc2Kudb9avQgNUWHDP4pSS6nZuxFYiuTfIin9/1wlOnvHg9vetYP8
         djd5neqJmX8AkPXopw+OTeOzQ31ARbXn22QT2elR09LvZEzZuHUlSfrcC7px/fHyEBS7
         K5tNOalo7QYynZyo5Zzy8snfK2O+4yq82BopPqjFTij3rPfWqGdDBd5lY1bOTeDj9nk4
         xKW0maAxZbXiUt/Uo7gkhMwE57KYjANB1/cA3QuEHlZwyGbM0xcjV5j/G0WWye5Ha7/y
         wDniZOk/FUZupRJTVFL6hTiVjjAx5PwDI3ibR8KkVylxCmyU7H368rH+TJULVzcZuzx/
         NyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789670025; x=1790274825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDvVoV5ROG1mKn3iD6+o1D5ZDgbS9tQ3bJGaaKaossQ=;
        b=eaH7GKbj4xsaQH18162Z6W7XgsR9xNdeYcHeFk0evfb1NnHYk1xLqSAXFkH9clAMLo
         vwOCYQm48QDakG8bjjf7Tsapad3H4kq4B8nP5o+CG2gKX/fjOvNNZu/2trDOOU0EI4tB
         RK8bQDjaMGkklZFVZMngDtpWPZ1Ps6jG9VDDfGEAJ+DVbW+fzcDlCTK5poINYUU7ADjl
         JifUMsj5yKqVWOtcbTZ6YmFzX9AYE8b/A6YA/kgpSZKD6S04zmsqn1gQHijLBDfXhdoZ
         9yUma1bpYQxk8UalD8xou1SVUeH0QDavoa0tjl9fsD6NzlrVsS9M1KNsFH5BCvrI6E4S
         UYFg==
X-Forwarded-Encrypted: i=1; AKwUvBxaRCnjzqB+zeudwDOf9SBeeSZBCBd+k5PvIATS6xqxwS5zNCn9UTVDxfwRTldwr0wyH8Ixm3QpqS/Debw=@vger.kernel.org
X-Gm-Message-State: AFuF++mnCOO8RSpg06ZEGE4v3A9ZtNAYKU+PPDGBxJ7ZX/Ps5ivJoBNU
	PCa29Hh1gcE8YTGn81C3XGkhPaoANJII+tuTE4flTvPKEOIn6VeQ1Xs=
X-Gm-Gg: AYBFou3V49Hc0HFcBr3kECYu2TLVM4omvs2kv3rJ6seUh1ckcn4ApQXNs8iSRh5ekR9
	Wt5VjIsPY2fbx8S7wAv7OTgc03aDvS5bIXUdeqpArqRjdjwpRH0HkcrV3CEWxGM+vVjxdYyo4Mn
	3vpnAVzynY+4Xop/f6tyoJhYVsFsgan9zm20daC0L6qjsZxOYaoFlKDqDL3IOxW+PlZHVN+HviJ
	BWLK9g53c4WlXbedZnSOpnbXU/XSURhXdkmhWBzYDUK/gvNQK0Sq3XKoypYEP3LTJjZjNTheFXG
	KlH6gjR226zMHMxAX2jaSszVavtHtl56W3VLJkG+tcCc6TxGnKuv5Fpfqkg1KvZsGyPjjIGN136
	lC0kTWmcO8AeZVRPcsIn4bs8RjHL4V2X5y12wFjZAQ9zOC3wZOmyfjDUSjbdcWoJqiPByeaUMxC
	hcu3HgC6OAwgF1TDDOwmOSym6sX1pS+PscOG2DfmV8N+Mm3lyfomtYlKRlL8yGwO/NO3gbJRSQU
	QrSpq02b1IfModYaEIYvV8dCfprjI3Rirb0paExNsqFdQ6sJLiZjxeU57TZmPn08r7oX//wwF1x
	guZz3gnohpJCf/r+ceXnVu8bpnDyw/C1BvaH
X-Received: by 2002:a05:620a:691a:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bb773f0cbmr1416387785a.16.1789670024810;
        Thu, 17 Sep 2026 11:33:44 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7821d231sm529710885a.21.2026.09.17.11.33.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 11:33:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <mchan@broadcom.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] tg3: clean up PHYLIB resources on probe failure
Date: Thu, 17 Sep 2026 14:33:36 -0400
Message-ID: <20260917183336.36239-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tg3_get_invariants() can register an MDIO bus and connect a PHY for
USE_PHYLIB devices. If tg3_init_one() later fails, its common error path
releases the mappings and netdev without undoing those PHYLIB resources.

Disconnect the PHY and unregister the MDIO bus before the remaining
teardown. Guard PHY cleanup with USE_PHYLIB to match tg3_phy_init(), and
call tg3_mdio_fini() unconditionally to match tg3_mdio_init(). The existing
IS_CONNECTED and MDIOBUS_INITED flags make both helpers safe when
initialization only completed partially.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 158d7abdae85 ("tg3: Add mdio bus registration")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Restore the USE_PHYLIB guard around tg3_phy_fini() to match
  tg3_phy_init(), while keeping tg3_mdio_fini() unconditional, as
  clarified by Andrew Lunn.

Changes in v2:
- Removed the USE_PHYLIB guard around both cleanup calls. This
  misinterpreted Andrew Lunn's feedback and is corrected in v3.

 drivers/net/ethernet/broadcom/tg3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 73a4b569b..caa7a6caa 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -18047,6 +18047,10 @@ static int tg3_init_one(struct pci_dev *pdev,
 	return 0;
 
 err_out_apeunmap:
+	if (tg3_flag(tp, USE_PHYLIB))
+		tg3_phy_fini(tp);
+	tg3_mdio_fini(tp);
+
 	if (tp->aperegs) {
 		iounmap(tp->aperegs);
 		tp->aperegs = NULL;
-- 
2.47.1
