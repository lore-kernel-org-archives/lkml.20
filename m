Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274997;
	b=AVLdiUwd08fMqM3+ycBDDPBctKVNc7QjlN+RurTui1CgWP3WuoUoylULntSJgdrN5/sZ
	 D6yAdQ2Ss4tiWQu+MK+edLghUuJmfmFM4sAPBwtxeBWcdGlyoES+Be0jLbFr/Vo/frXqq
	 ZdpqrvAbXuBP6IffIp8aGwz5YmMsP1yM/lhlR4cQVb0gS5CB3M0UxhZbApGdspZFHbAOH
	 MtOku2gdKfQguBaGw7SRMl52O2PUHa09QlcCcH069LOXpF4C+uxxZdFjLURqe7q/T99AT
	 vIgLirJ3bBjyZm76Fade525wGCOHuGtYSZN0pNMbDajUf+WLkI0Hsd08a+sn5EAYPxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qq24hhIrOv4Oa9z26yz4avSoOrJiFVC3JLDF/iUHN18=;
	b=CC/RaA3zV3gHpWIUZ+4NpKAtfGK2E0IGWQAg4r9pSXhHyko5VmUV2kXdX1cinDN/2E8R
	 7CFayWImnXSsLfJzgR6LYpgFsJ2HBZo/V05xslK32phDuuCQoEu0tyoGx4E9Yk3RO28Pf
	 PcLyqu4MEk/vctkZBgKNQztP1FCtPlSyNeCe+bfItrssMVMnWWE0AxqP7O8XbAhH3X2TE
	 eSCFd78E/JhsztRQVkz8ibTZ54xlNuUfT7Pav18B421nJH18sfumIiuvQh1xra5QUOv9w
	 gbaYayTaTviMfUmT6CHIYkiMr9pJ84tMyzEUs0JsX8mYWBT/z3oUAtT0KxYRuBN7fcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8W4nPDm;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397BC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8W4nPDm
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so40596eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274996; x=1794879796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qq24hhIrOv4Oa9z26yz4avSoOrJiFVC3JLDF/iUHN18=;
        b=K8W4nPDmmPq7/OZvmGfEHSR7I7Ei7VHcJOH5lrl92NMSFyr9ciqK7VJ/B6yIdNWhoM
         o45TuqUQal6ZLcjNrrdPkzXvKbBFgramOmD8eHR3AQjiDUm5761nYWOrGzDbRgIDbtUn
         0GxTGyd6UGifqPHUjbiQbnTHanUXUMQuZoTe4O0k+E34pWreygEhjkqAl2/WnMFalngp
         tRYzxdO60BT74aGEZ0SFIDdHZfBvQ1ksp7l37MNC0S2K2KgVL/w7ipkRH8yZmvrk7417
         soh9B80UjtxJltLKbfKHLBuMmPALmVUetLGo+/a0W7WttOaz/ZXYLcAEm1CMqRr5IEUM
         Earw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274996; x=1794879796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qq24hhIrOv4Oa9z26yz4avSoOrJiFVC3JLDF/iUHN18=;
        b=osWr9wX6EZnUdmHQIw6t+umr1K0/tWaoX/jhKYBNNLmFiS8Ht/ti2l3WfPBZPv04pt
         sMTZmN7jhwllTRx1cZLdHI3tOheiR7gAb0DH2HYOrm3hNQqAGZ7YT02q6lPExKG8BA0H
         6irNzLQWCMNxK7pjbuN4EiwWmUq4xaImcjRqfwM3w7xUshaIILC+rts4ZETloxptdKss
         hYcDcOS9GQH6b80moPqbl9Kbw3lb1kPkuyzz1ZD5AqW1t7MNnsPKnicn0aqitZHA5jfx
         z9Xhuf5VYwHSDqfqrCfUsnm6qtNTQ69d3eQsEGGd+EpKrMzXxVdib0xixlv/ujrZPG4D
         jPnQ==
X-Forwarded-Encrypted: i=1; AL+hErGw4WlJ2mwb8oEP+BSsjOyUU7gFVuKvhdbERn9RWb3tid7OMWIxcpqPIh/mSo6b4BLgR0C+N1Nf89fUBLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WB/PyqtwsUErifBC/ToReh3YrmUIvZ6nsDx5Tb1ZblNAsXLKX
	U2SS/Wj5BoQe5oZHbnuE+71u+qoTwYr7vi/vqooo3dnIL4eXtZCZfHol
X-Gm-Gg: AYBFou26m2UFH5SBZu8lHEGKW55FsOwU1h8o7Pv4kw6UR5KMbDBuk3fWZmrsDEpXoFR
	7/SJhRattPLIPAK2LzGyTF0ZcY+nh8wGXIVxHKixfYswKaX4q66V36fep3cbiflwLAfLkBhIOCl
	C9neNQViC38IBL74oOSydLSKwG11KgdQQwCno04M6+I9o2joyODcSF7O7+hya+8zMQ8aQYD7eJk
	mnfZ28Uay+Ibxef2DiN61qEycXlEk5eukwA5d3QPMx1MF06EW1YyyvZb8cS/SmsnB5w3KXeQ5+/
	02BGs5Q2HZ39fyZ3mjHcfVpdw/bWY9cWGuu0qCUbY4bKCxjsloiiZZ+a6jPpCspN2rYtVyX+zlc
	EdeKZ5kEfsMWpMvzYmtki764f7WmckzcH2LJZ6Eg58F+SBS54ff1mQGDCURl4loP6o43I1Z9ULM
	ILskO7vb82/fSl8FcqF+AG5tjkcB1NtdpBvOKyZTAvAnK3psBsvfP41K3F+9EY0XM7RNUJb7/eb
	W0t8iY/MArds2Wn/0Qo9+3SltUBvHPy8C9E3Rf08nC94GdcGLoAG5HD+QbxGX8d6EtSlwriMLjo
	CvBFlRLlRWFi8QGkrvepJRw6QPqYSmzRwetKWzxSPQtV6M1SRKOr6kIorwcLoB7w2gh34QjtoH2
	N6LepnncMHBqnKR3IY+gyEIlfaSfqj65slpcLMZat86m5zhZIn61nbwCN2LgIZjB1xuDjmxPUdS
	60/VNo5NZw+OLeMfnnce1kIMM=
X-Received: by 2002:a05:693c:20c7:10b0:35c:707b:acba with SMTP id 5a478bee46e88-3751c3461ecmr1500001eec.3.1794274996258;
        Mon, 09 Nov 2026 17:43:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm2021599eec.9.2026.11.09.17.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:43:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeff Garzik <jeff@garzik.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: ibm: emac: fix MR0 write in emac_rx_enable()
Date: Mon,  9 Nov 2026 17:43:13 -0800
Message-ID: <20261110014313.1586633-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When an asynchronous RX disable is still in progress, emac_rx_enable()
waits for MR0[RXI] with

	while (!(r = in_be32(&p->mr0) & EMAC_MR0_RXI) && n)

which assigns only the RXI bit to r, as & binds tighter than =. The
following write of r | EMAC_MR0_RXE then clears every other MR0 bit,
including TXE, and TX stays stopped until the watchdog resets the EMAC.

This path is taken when RX is restarted after an RX descriptor error.

Replace the open-coded loop with read_poll_timeout_atomic(), which
stores the full register value in r.

Fixes: 1d3bb996481e ("Device tree aware EMAC driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use read_poll_timeout_atomic
 drivers/net/ethernet/ibm/emac/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 1b95b4d5deff..0311131055f7 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -24,6 +24,7 @@
 #include <linux/string.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <linux/etherdevice.h>
@@ -248,12 +249,10 @@ static void emac_rx_enable(struct emac_instance *dev)
 	if (!(r & EMAC_MR0_RXE)) {
 		if (unlikely(!(r & EMAC_MR0_RXI))) {
 			/* Wait if previous async disable is still in progress */
-			int n = dev->stop_timeout;
-			while (!(r = in_be32(&p->mr0) & EMAC_MR0_RXI) && n) {
-				udelay(1);
-				--n;
-			}
-			if (unlikely(!n))
+			if (read_poll_timeout_atomic(in_be32, r,
+						     r & EMAC_MR0_RXI, 1,
+						     dev->stop_timeout, false,
+						     &p->mr0))
 				emac_report_timeout_error(dev,
 							  "RX disable timeout");
 		}
-- 
2.56.0

