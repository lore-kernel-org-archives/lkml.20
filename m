Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925784;
	b=srXiKdlbTS/XplGDtIacyO5Pyr966wZEwdQApsWGe8jOCur+/t9kSdujWYaG6U7dvIEk
	 hS0pwQfpQR56m2hGoBGkn8YDDxB5FfsWjtpOvRPKI7rZnVwpSj5sLyFgxlikxGtvPu8sL
	 zex+YWYvt9v24pJrqPGFZ6P1WJFyH/D3nJ9bF08+j903ZCDWdQL5/x5dWi9vFv72SfZd5
	 1kxvujbkHeZfLU0P3x1feNrtH4KydN9LZFvlKE9oCLPAqM4QpSP6yA7VrG1ZwrcQ5hk+3
	 f7Py1K9j64UMZ3kimjevnNt5RZSIhbm9ATedO+5QCrh1thdZdoozQW9Os1e7BbWVsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=clDl87D5pggy1VDwhZUzZxM8yGbSHZ+6BQixZZJAVUs=;
	b=bz3sYdqFKUub339ZJJK+x1QiMsGAJN1HwChGJh1/Ah4xz5nB48aKhuyyzSx+zE/L0aHx
	 Iof09LPwnYV3PTNUkMyCzyLZHUDuVULEy7xX1UyhqtSmIU6zcXxzzhrKhFPz9xdMr9Z5V
	 MA2BdzmH/5XmzhEZIkBZQ9cmHNSZ0wfB+bgh/iLIqioxG6xg9Dv3ZVM0x6QcHxcn4rQ/z
	 H/MleE6iKw7iC/tj3XBRCR4s0mOPjeqiKrveXHzkSVEzE2SQCezzKdEaw0b8DAoXXKTSj
	 z2jBYz2nZBedE7HmQyeSEVsMfUIC6hGCT/FGGq8e2kNMC0HKrYSYxO1OEvUtsd4lQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LKd1GHhC;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40679606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40679606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LKd1GHhC
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-48296f34f1dso39114fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925783; x=1794530583; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clDl87D5pggy1VDwhZUzZxM8yGbSHZ+6BQixZZJAVUs=;
        b=LKd1GHhCX7SaMEw3wOg+ZX7DtaCsfH+3CR3zO3v2rIG7sPNWFfG0BYp96sO2+fcX43
         8bdokgHhBKU1I+OCKMrOFgOQ6liW4MvZkGOz3f5YJKjWwhCz9WWdHSnQc5/1G0l7ktTp
         LcZTDrL9r2eabx1HDEn4knmIsyR6b2TZwKJ/0ZvqT3uygBktktAWOd/ffPGoVzFltyK9
         fx4Vmm0qBWYsZ7DW+WnJ9IzyxvKOr3YZLOPdJ8xF2AodUsR/nLd5mShuPVYGRAP19mRJ
         40L9ot0LiHg0l9SLjZpcsAFGo4U2DpAm8UNxTXUtxNlrer8/h27oJxmNMHibbN4Bf8Y8
         RV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925783; x=1794530583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clDl87D5pggy1VDwhZUzZxM8yGbSHZ+6BQixZZJAVUs=;
        b=c4Lrx9RyB+MHTsfUO1WdNsco9GrjxDIku7rpo8svH6A0vXFrG8WG8lQGX4+p3j5jPp
         Q+92ia8xdModJ4crOxIpkpp2ECbCuhhMZNLR3pmMlxcqFJts7TBn8989A0suO6pCbeCB
         mwrspng2kRdysaeDzDZHVsJWgStosN+9KTWQWQV1oML+3Iv3Tjts+WazxY1yWnNqczVf
         S3GkKOZXlvQM7lYET8SmSm6mNn28n8gKngW17edKoUgbB2cECO2NRmeh5oZwsy3teP/5
         F0QkQJw7rDHRHDahKD6hxVfr4mjQZYwN000DM6YYk/DgltLCOMuu9YYaEbhTDmOfLxoj
         Pgag==
X-Forwarded-Encrypted: i=1; AKwUvBxcOcp/xaiEAH2XnowE4aP4atXd6O6gk58M8l7MPQpNxYkkZaLn3W+qcuvDbds6cp1JN60XDUg0K9is9pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o6qu2IyQhVNKtydOAzyZrqwUOxHFzcuufZdXDUZjB39AMwllW
	n2iVsmqKAFUt4X8CF3OC/w8wOWGA9S64okVPYDgeE6Os2CRAUs3D+bvQG1ofjlQPtMlKW/8r471
	PO5brUtfxi9Ok7A==
X-Received: from iofl4-n1.prod.google.com ([2002:a05:6602:8384:10b0:9e3:4909:2e0c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3197:b0:564:4f93:707f with SMTP id 5614622812f47-567e1038170mr654365b6e.24.1793925782556;
 Thu, 05 Nov 2026 16:43:02 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:06 +0000
In-Reply-To: <20261106004218.604799-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106004218.604799-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106004218.604799-6-dmatlack@google.com>
Subject: [PATCH v2 05/17] PCI: Save PCI-X state in the saved capability store
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Save and restore the PCI-X Command register through the per-device saved
capability store instead of a private pci_cap_saved_state buffer.

Reserve the register by its configuration space offset during device
setup, in pci_reserve_pcix_state(), so that the save and restore paths
no longer have to locate a buffer.

Make pci_save_pcix_state() void, so pci_save_state() no longer fails with
-ENOMEM when the PCI-X save buffer is missing. A failure to allocate the
store is reported once during device setup instead.

No other functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c | 47 ++++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index fde1dcd99e94..6cf4a64cb7e6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1900,40 +1900,40 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 	}
 }
 
-static int pci_save_pcix_state(struct pci_dev *dev)
+static void pci_save_pcix_state(struct pci_dev *dev)
 {
 	int pos;
-	struct pci_cap_saved_state *save_state;
 
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
 	if (!pos)
-		return 0;
+		return;
 
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
-	if (!save_state) {
-		pci_err(dev, "buffer not found in %s\n", __func__);
-		return -ENOMEM;
-	}
+	pci_save_cap_word(dev, pos + PCI_X_CMD);
+}
 
-	pci_read_config_word(dev, pos + PCI_X_CMD,
-			     (u16 *)save_state->cap.data);
+static void pci_reserve_pcix_state(struct pci_dev *dev)
+{
+	int pos, rc;
 
-	return 0;
+	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
+	if (!pos)
+		return;
+
+	rc = pci_reserve_saved_cap(dev, pos + PCI_X_CMD, sizeof(u16));
+	if (rc)
+		pci_err(dev, "unable to reserve PCI-X save state (%pe)\n",
+			ERR_PTR(rc));
 }
 
 static void pci_restore_pcix_state(struct pci_dev *dev)
 {
-	int i = 0, pos;
-	struct pci_cap_saved_state *save_state;
-	u16 *cap;
+	int pos;
 
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
-	if (!save_state || !pos)
+	if (!pos)
 		return;
-	cap = (u16 *)&save_state->cap.data[0];
 
-	pci_write_config_word(dev, pos + PCI_X_CMD, cap[i++]);
+	pci_restore_cap_word(dev, pos + PCI_X_CMD);
 }
 
 /**
@@ -1953,11 +1953,7 @@ int pci_save_state(struct pci_dev *dev)
 	dev->state_saved = true;
 
 	pci_save_pcie_state(dev);
-
-	i = pci_save_pcix_state(dev);
-	if (i != 0)
-		return i;
-
+	pci_save_pcix_state(dev);
 	pci_save_dpc_state(dev);
 	pci_save_aer_state(dev);
 	pci_save_ptm_state(dev);
@@ -3749,10 +3745,7 @@ void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 	int error;
 
 	pci_reserve_pcie_state(dev);
-
-	error = pci_add_cap_save_buffer(dev, PCI_CAP_ID_PCIX, sizeof(u16));
-	if (error)
-		pci_err(dev, "unable to preallocate PCI-X save buffer\n");
+	pci_reserve_pcix_state(dev);
 
 	error = pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_LTR,
 					    2 * sizeof(u16));
-- 
2.56.0.455.g6c5a503b38-goog

