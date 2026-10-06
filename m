Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AD42AD3C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791254133; cv=none; b=gxsYqTpL1E2hZP9vfsSxcSAN2uVY5+GfMOOrM3M9I5BzAY7zKdj+sBS5+bfy11S90Pgn52hOOUtCR7LKPZE5Yiezf9Y+E+2JhDzu3wUD8Ivc8CMmE4MNIFKYBWT3yUouVyf5kSRqt0TTxrS6iTn9oJoApsx7KlBf7XTex3UIyMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791254133; c=relaxed/simple;
	bh=2HZxPYqTZrR6ALsI0xXWeZdWAffgyHiFjQQOcfsqJNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OFF5+quefs0G1vNx0kGeBF4IgJdermR3YIUZxGvyG3eECgT0X/JUGAK/x1zOeJKrVdBBPVybWo9H1s1NUCucyRcZLZYBMwR7g2EJUnknyaGJYUoLzMXbbvbr5eJZGiCXx4hHG5GRirs8t7QzLmnw8eup69sAZ+EguwFOHNiJfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=rydYGm70; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="rydYGm70"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so11419885ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791254130; x=1791858930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FP6Cnv3Px2FrRBwEywG/gOFyPcxASJp/FvTXDyrwt5A=;
        b=rydYGm70fljN9we8/UX3hC3C6GaxdhcpfRCbmIfH3RU2NSzo/8tDmH1DkSQSxdWyF4
         zVxr1QNhfnzMvGqYyuNlcXeg2fgrJg1JDC8KcGLtJFShjhOd0t1VWXRqtRCd5eTP2PS4
         +836h+KvACVZ/o4CahRmaH9O2RBjBjJNKXO/6qB9Dze3VIu87eWr+3Rv4ibo6BTFJFm3
         ujCkmTQtKrjz/VVW1EZcv64b6comEKWNbBOAphHInbjrBauJRvlhOCKfgf8dun2ZmjRy
         3WeDB1xiJ3Z7soZ5uG4W6PuAMExpwpsFrwbueju8MAuFM79I6bVjL2iwdTxfER90VukH
         QFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791254130; x=1791858930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FP6Cnv3Px2FrRBwEywG/gOFyPcxASJp/FvTXDyrwt5A=;
        b=THR0f8GTGg1j0DAJ29sNn5IQa+KbWxEcOcnozWCJZK0rTdLJPDX+jyvkyayw5cmlkx
         +gx0b+X07Xhufz3dlJvxvhT8Px3umAozDv5fObkfO9pccUMqp0wOttZ4YK5bYGoJK9y3
         KXZZM3V/beeG9MYctJK6z8Jxqyg+HMji4ZyiSV7KYaaomeQB2bA1/YetsFeIFLVsLYXw
         3GjxDz7no5ZwPGBaW45ncpDhI28jQs9ZvBW2QdnBjpcFE2qP3OnOcChIZaF8/wsj2bwU
         ZSUkaTLUD958Fl0Be+qjJrKWeF6rasCMJekt3FcO5Fhb/HkUuA9OT9jl79VD9AL/AUv+
         U9Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxTUAv6qWXGKXkvLA76k9dVaqGslrPBAX6PjK81yatDyWpRKR9N+4au38XugdfY+xqVji6KTfhmnmrtcFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGpHczgrRqAJsdro7eX5C0aQxRJl+sFnBN6o5pMJ2ZEIp+SQbb
	l2LqRllqC1hpg5/+luWOgTadVdKVLoY3egInRwqs5y+uG6XTjcWikpmmdLDbm06+tPsUhGsXdLD
	QTL02vO4=
X-Gm-Gg: AYBFou3yeQZ/d8negycs20UvfzdSQ7v2TgJelE9VcimwAuyxyI8H9r2LykOqVCJOXXE
	ilQtDI678/37hMeWikBElFbZhfkIo/0pnUFj7nIwg/+wC19MsIm1n2Cr6lDMS3vYVt17gZZ3P1Y
	tUaAYmOXb13Zxl67Vw8HSfeEC0ra5I5Txrq8l2pOILuQ8ezMO1xhV/ZIgvQZBaA2z8V4sIitDPf
	K+GCY20MPR0093YI6lRozcdbLPOZ5BrIvhpe2ix8cg2gj+sZ93Xq5pjyWOHn5sVkLEiHxzohCbs
	futPK4/a+0YEDJeyjYBmKGK6zW9/iw02qzdzVTH2WbWObj8d/2yUvzF8kLC6mZYeH0jdfCwSP4c
	F+aTTFNPkZxHbBGUFfkBxgqhJtbhIT4wIFenKRU8laXJ2pnWwe2zxVAsLF4W5LGWpF80X7G76lF
	Hw54VvHVng6p+ZVAmtf8FpTjhOYLKdkmWUfkMWn/veR5vmZfSM+QXql9J1piHGtcZ6gqMlpCu2K
	DfxraLgRMXd7446CS+zq4tqwqEwbu7z
X-Received: by 2002:a17:90b:4fc8:b0:3a7:f7e7:df09 with SMTP id 98e67ed59e1d1-3a7f7e7e431mr4874845a91.55.1791254129975;
        Mon, 05 Oct 2026 19:35:29 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5364:bba9:2adf:d611])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ef5b60sm15092255ad.73.2026.10.05.19.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 19:35:29 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	bhelgaas@google.com,
	jbeulich@suse.com,
	konrad.wilk@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v2] xen/pcifront: check that an AER callback exists before calling it
Date: Tue,  6 Oct 2026 11:34:43 +0900
Message-ID: <20261006023443.338194-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcifront_common_process() handles an AER request from the backend by
dispatching on aer_op.cmd to the bound driver's PCI error handler.  It
only checks that err_handler and err_handler->error_detected are present,
then for the mmio_enabled, slot_reset and resume commands it calls the
corresponding callback unconditionally.  Those three callbacks are
optional -- the PCI core NULL-checks each of them individually before
use -- and many drivers (for example igb, igc, ice and ixgbevf) install
error_detected without all of them.

aer_op.cmd comes from the shared ring, so a malicious or buggy backend
can send XEN_PCI_OP_aer_mmio (or _slotreset/_resume) for a device whose
driver leaves that callback NULL and make the frontend call through a
NULL pointer, crashing the guest.

Check each callback before calling it.  When mmio_enabled or slot_reset is
absent, return PCI_ERS_RESULT_RECOVERED so recovery proceeds, as the PCI
core does for a missing callback; returning PCI_ERS_RESULT_NONE would
instead make xen-pciback tear the guest domain down.

Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: return PCI_ERS_RESULT_RECOVERED for an absent mmio_enabled/slot_reset
    instead of PCI_ERS_RESULT_NONE, which xen-pciback treats as fatal and
    uses to tear the domain down.  (Bjorn acked v1; the ack is dropped here
    because v2 changes the value returned for an absent callback.)
v1: https://lore.kernel.org/all/20261005133019.284053-1-yhlee@isslab.korea.ac.kr/

There is an in-flight fix for a refcount leak in this same function
("xen/pcifront: Fix PCI device reference leak in AER handling"); this
change is orthogonal and applies in either order.

 drivers/pci/xen-pcifront.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index cffc32d660327..5c6f7796d204a 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -599,11 +599,16 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 		case XEN_PCI_OP_aer_detected:
 			return pdrv->err_handler->error_detected(pcidev, state);
 		case XEN_PCI_OP_aer_mmio:
-			return pdrv->err_handler->mmio_enabled(pcidev);
+			if (pdrv->err_handler->mmio_enabled)
+				return pdrv->err_handler->mmio_enabled(pcidev);
+			return PCI_ERS_RESULT_RECOVERED;
 		case XEN_PCI_OP_aer_slotreset:
-			return pdrv->err_handler->slot_reset(pcidev);
+			if (pdrv->err_handler->slot_reset)
+				return pdrv->err_handler->slot_reset(pcidev);
+			return PCI_ERS_RESULT_RECOVERED;
 		case XEN_PCI_OP_aer_resume:
-			pdrv->err_handler->resume(pcidev);
+			if (pdrv->err_handler->resume)
+				pdrv->err_handler->resume(pcidev);
 			return PCI_ERS_RESULT_NONE;
 		default:
 			dev_err(&pdev->xdev->dev,
-- 
2.43.0

