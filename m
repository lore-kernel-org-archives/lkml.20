Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50447F2F8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498402; cv=none; b=qWqqkAvxrqxAHLtlo2W/Njo4UGumqTwZ1XpVrE1Js9lxluX6aP2QswGIXvnwN53QYD+/jKmXO1Q14ugtYTbMpwmrpqLr3w+M7ztfKwl0YNru3bLM1f1wNyMVivbQ/woNdziEWFlmnQeYyctC5wvt7AGLdzROfYCd0EFfr6oWVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498402; c=relaxed/simple;
	bh=Grq1cf76duT5Sv8IY1PufaVJuK39bLhql94COC5gLlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dl9qK+41Ih72ypAzU6bilOR4iEvKOqdVWmjwbncVr4MvbfphpltLpEZbXL/80QWEY7QAOtggJyeyqzhzzmeI0Dbnhs0HgPLHl/U+07jCvnf5Rg5iHHrb2TV3crEa5LjHOJ6hEzstktqlaqGTlQMItymW93W/1g0Bf97srNnS/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orQ8NncH; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orQ8NncH"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33e623bd651so216158eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791498400; x=1792103200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB+YPN8HTh2NianqtkumiyEzPDaNytolJ+7cLsxqxCY=;
        b=orQ8NncHzXbqJyxT2VOY5SSmAF+iVa17WHuQ1OZuusG73uZ8EfVDgfWJ/XECMNROaZ
         4MWOrgXf+RHBnvUAUQU57fsUbHZ5RCmOhW830ypOJMQBU+1uWavu1JixmNXmoscF6Qii
         3/KEc/TgdKwG9syLR5pEQlVlNp0vJSXlFz8hYC+1WR6Y11fvvKr7ZYfA5bqX0xIX5XWi
         ZENX5dkE7q2fz2kOuo4dA7PcdH1J9VXesuwk47Jh2ueyF7g0vmcaYuAp99wyT1bp+lYh
         RB0HZmIslYboD0LTM9tBzTgNYQcTwau1quJ6CSfyJyjUSnaXYrsJV2knspj8lYYopdL6
         zXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498400; x=1792103200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uB+YPN8HTh2NianqtkumiyEzPDaNytolJ+7cLsxqxCY=;
        b=j3zIuQaMqjDcoq8PKWaynllsmDGRk2ETnv0aXcuHbIHLeK+Bb34jeluVwbthC9lM6h
         ikq4YaIenXB8ax3UZ3Z+CBGX0WV1LszHmmgzdrlxyX0SdL/kCZtmTTOyS7oDLq6+NGNl
         fy1sRmAD8/NbMICyb3tMAMyYSQctw1djRnh6KRJk+7X1eOphxCRPGO9j1UXBOQmVjmIA
         2BIy4qpJpTh7jfJJ77YFiKClRToyXC5+oLYSg3EVHDnHfqA8JdAvIKgdfubC24L0PC9r
         tehhtBlnpNKsGgSXYIBNCkYiLpTorwCI68vI/mmi3spiKCUDjzuCxAvuXV6Yt7NnNMtl
         kv5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpGjKcVp7ihk+JjkKWKiN4xM1xoldYa1jo1437pGr2TfZHzFpAXFH/5SvSkD+Lu98Png6QROhlgPX0zk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Y0vy4Bgrx0imZ2SH8YxImEayAGqzGrbAVAQ86E00LEHcccaR
	IMD1fYbIMkS+8SA320xfm8SipXRMLIgWNsYxlzAgC/t7lrTGgN6mzkyL
X-Gm-Gg: AYBFou0UjoMlRiuZUGI728cMEkwd+AjGvdnPdoqzet+7btfWo83dPiFZZxWVydpJbpc
	QApZQYQH/h8/nvKb3c8rXnI5mfWDkJyhVMgmB6qS6x0WL234BS2y1s5tpSlMsbQnj4TaXNFQbaT
	pCfgZTSGO8FA90x/DutbZY1dydHwtIAHFXnm28StOKHt/IA2difrN4/I1QGEjkWyims7mCOEF2V
	tM8E0VS3dTxwo8R5a29GNvg9E/lSszXGZeIJHTqae7W4++LR5afGOqBXFTs0fuQhSpA4GlG+HFE
	3qaptECkO6my9Nv4ElQr82zhUzgmlrwPODYC74x9S17ijfdbu8/S/+7yJffwlfFNfGJbNjEhdkh
	BLOGU1RuISyqF2FoUD08F4SWRx2pJHjxAkJ4g5qyfnn0QOXr4iQbBplIJNW9oDCC2538sHW0dcH
	ZsMsJ5RG8guAUZT+lduAu9J1Gz/wZizIAkb6FkbFj3cSyTDjEII+esN8AggeifettZBaJ2RXdUH
	yc+GbzSdXWyhxGmow9I01l4/VBcZdGkP/xAY89j
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id 5a478bee46e88-3537e04ce24mr478585eec.2.1791498399999;
        Thu, 08 Oct 2026 15:26:39 -0700 (PDT)
Received: from hitalo (208-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm985148eec.24.2026.10.08.15.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:26:39 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v3 5/6] Bluetooth: hci_event: Disconnect an ACL link that completes after its abort
Date: Thu,  8 Oct 2026 18:26:15 -0400
Message-ID: <20261008222616.2780570-6-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008222616.2780570-1-enghitalo@gmail.com>
References: <20261008222616.2780570-1-enghitalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for
aborting connections"), aborting an ACL connection in BT_CONNECT sends
Create Connection Cancel and deletes the connection. For an incoming
connection that was accepted, e.g. one that MGMT_OP_DISCONNECT aborts
before it completes, the cancel fails at once as the device was never
paged, and the Connection Complete that follows finds no connection and
is ignored. The link then stays up in the controller with nothing to
disconnect it. The same happens with controllers older than 1.2, where
no cancel is sent at all.

Disconnect an ACL link that completes with no connection to take it,
unless an accept list entry makes it an auto-connection, which is
handled as before.

Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting connections")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index c825a99db..14270711c 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3301,8 +3301,15 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 				goto unlock;
 			}
 		} else {
-			if (ev->link_type != SCO_LINK)
+			if (ev->link_type != SCO_LINK) {
+				/* No connection takes this link, e.g. an
+				 * incoming one aborted after it was accepted
+				 */
+				hci_disconnect_unused(hdev,
+						      __le16_to_cpu(ev->handle),
+						      HCI_ERROR_REMOTE_USER_TERM);
 				goto unlock;
+			}
 
 			conn = hci_conn_hash_lookup_ba(hdev, ESCO_LINK,
 						       &ev->bdaddr);
-- 
2.55.0

