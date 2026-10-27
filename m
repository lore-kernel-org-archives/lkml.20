Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113085;
	b=yk+BGfi360nP6fmtRW8bIf0An5KR+Kdug+6Aq2sakhrOVG4ymgr7T7t/bqOmqulvxuc8
	 7tIznHL5Poceled6tKhoEEU4oTJRNKB1DgjztJw8tE8NLgnUmE3YSnMgKN+0VBvetX+so
	 I0LtrqQIGrbyYiCJ5EuH2H6sLkXpquXbL/lCTIflDN3nVtTATpQTelkChz5bRRbs6OsJy
	 vOOEi5xqnfDW/gNcRbt6adN56tyz6RSIP2a2136GdZnq3JvUofhWK9bn2nfYdf2/pj63j
	 1JkIvwcYwZk4vdDfIHXrAtvdWioezQm1rMU9b9CuZx6xIq1ZKmFxJXqKn8nTM9+wXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113085;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PtFUYXEB7QTGZU96gwi3mLor+5wrFPvL6wQQqrlRDZU=;
	b=5MiKk8Ye9tZJc++dRb9zO2bNWng1W0Rma+Fue3WvRJJStI8XkmZydyEMJodIhsxeqcko
	 uQWZnArMvOuYQ2pPzx38yrRB+hsa1NqwVhYY4jHEDekWrGERIUrvZ2Ljo5S9e6Jtrm35E
	 z5YMNfeiQBN/L4hvqUK9zdUuYcWDNICpsYvU3Kg8oo3WOB2FYbTiRZG6Yjp+o43AqWy4a
	 OrtQz3aGcLbmQNV7P0YuOZWueQjvAccnGtD+GOR4aoUfDHO1Ps7M4I7RxMwAO0H52Z8Qy
	 pCd6JQe8QYex8kAM6VXCLwymLqBK7a9b13JnexveSv2dAMiKHERCDU31D42ueaPEzcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ix2mpMtc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5A60A262A;
	Tue, 27 Oct 2026 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ix2mpMtc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3352A1F031E4;
	Tue, 27 Oct 2026 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113084;
	bh=PtFUYXEB7QTGZU96gwi3mLor+5wrFPvL6wQQqrlRDZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ix2mpMtcURfA/mA5Ii9EpH77K4c5N+SAay0oSI3RWffi1uiP55ILGqowCbbdafAxj
	 lNXNwf3nDHS9jI+bHkj2EQNj90BS3bO9JCjydUw3LP+LHHTyHnRwLSO86jRBdxdijc
	 TkLEqpk1yv3OAwG+crqSmRMHsLgEOji9rUNAWoqw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:44 +0100
Subject: [PATCH 04/19] usb: host: oxu210hp-hcd: fix oxu_qh_alloc() deadlock
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
Message-Id: <20261027-llm-usb-v1-4-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=d8ff20UACSP/aLhxMhU7JGcsUGK1tjNtxndcfzmHHA0=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr+7Nmu3xdncLA21S4auOgIPr70+3rQudKnh8mns5
 V3CK8VvdMSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBE/EoYFkz9s2laxMbqyVM0
 e6Uzcu9X370rDhQ9fFV9T13svSVrvu4T+56vrvfuDHcaAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

oxu_qh_alloc() calls ehci_qtd_alloc() with mem_lock held, and that
function takes the same spinlock.

Allocate the dummy qtd before taking the lock, and give it back, without
the lock, if there is no free queue head.

Fixes: b92a78e582b1 ("usb host: Oxford OXU210HP HCD driver.")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/oxu210hp-hcd.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index ca96067e6d6d..3fff2d2a4f3f 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -1034,6 +1034,14 @@ static struct ehci_qh *oxu_qh_alloc(struct oxu_hcd *oxu)
 {
 	int i;
 	struct ehci_qh *qh = NULL;
+	struct ehci_qtd *dummy;
+
+	/* dummy td enables safe urb queuing; this takes mem_lock */
+	dummy = ehci_qtd_alloc(oxu);
+	if (!dummy) {
+		oxu_dbg(oxu, "no dummy td\n");
+		return NULL;
+	}
 
 	spin_lock(&oxu->mem_lock);
 
@@ -1049,21 +1057,16 @@ static struct ehci_qh *oxu_qh_alloc(struct oxu_hcd *oxu)
 		qh->oxu = oxu;
 		qh->qh_dma = virt_to_phys(qh);
 		INIT_LIST_HEAD(&qh->qtd_list);
-
-		/* dummy td enables safe urb queuing */
-		qh->dummy = ehci_qtd_alloc(oxu);
-		if (qh->dummy == NULL) {
-			oxu_dbg(oxu, "no dummy td\n");
-			oxu->qh_used[i] = 0;
-			qh = NULL;
-			goto unlock;
-		}
+		qh->dummy = dummy;
 
 		oxu->qh_used[i] = 1;
 	}
-unlock:
+
 	spin_unlock(&oxu->mem_lock);
 
+	if (!qh)
+		oxu_qtd_free(oxu, dummy);
+
 	return qh;
 }
 

-- 
2.56.0

