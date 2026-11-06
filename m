Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925790;
	b=lv5Z8Obn7VEWavw6LOCRKpHtk2r748c5Dwyt5lksaiqPanKRO3dwJf9ArWIFHRDECThZ
	 mdGtB5doLxroStKAtAZfUYfxeMiy1j542TzaZiIjHR01I8pII6Z5hjUDejpkPVtpSJXlD
	 rP7jCI7tPx7G4ljaG379mk5/BX2/NpHgj6Q7ll5E7lUEkFqZqEsV9yE0izLtd49b16toH
	 DhDx06a4utlyha6IortPelnSqpPHJJmSMPtURFjD69GZ6ISY3lPpbRJPZzFFU6u9sZHCP
	 TGjTA4zOGu56YidUmp3YX/6qIkbvX+YxauMjlkYZqZ2/GFn0DaVUgDEchLDZGxYqP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jmLjI9XOjWedNu4ucOWy6yZB8cv6/+TL9ec51bNxWwI=;
	b=bsT5Yvk6ztad1KvMMvqOxbWQJAULEmPrYnIwKEK/fa8gRVLcFlILf8X+yRjINT9RJYjz
	 UbZzsl+bIqQ0MRwg9dDu9crBAHvoPgGLePvtLMVCthi+4IlBq6TaaFWjF5NHvUxhVLSA9
	 NFaD+Eb6WUtjy+0O0xbMvGA4Ml/rsLnVo8L/87mr5mUDNWVGRHw+8ojulndJFJ+wiH6XR
	 V2rsFiy6QeTI20WaEszcc0wcuAgoaIkJ72dniyUYMBiBlfPt9rXdj+cMQCYi1oaIqTMdr
	 SSOgp2SUIzgGl7wYpthQttuTBrDLi20yBRd63Z/JH6lKVlODj9Pbg5hlsV8r2AsaoZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XKeLxWbR;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ECF606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ECF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XKeLxWbR
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so47889b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925789; x=1794530589; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmLjI9XOjWedNu4ucOWy6yZB8cv6/+TL9ec51bNxWwI=;
        b=XKeLxWbRXvKChgmya/SzeXVrUn6XowYUL8V3o6YjasXc4GNetD++iL6MKEjquJNqop
         ForJSzV5oDuep/iJb00LW+kNaXB9ZOFvDBo1pjL8P9Au06T4psqxS0oOClcp0P9gE11b
         6SZxmGyMpBs/6kB1uCpLLCUT5FyTcFytjng96wUWsrvoPurizORoadFaDTOCfRhoBjLx
         Dz9i5khTG451mWZdZ4hQCy8kB8V6Rx+yLeg3CoazV9/D96gNf4EMAmaK/s5Dtik3N5Zz
         qeA3NkZsH/G0MIh2aK7Rm/QAYsnXHoNDvFpdt+QBrKr2FgUGwPUieMTvJRWi0Ems7P9R
         Pohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925789; x=1794530589;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmLjI9XOjWedNu4ucOWy6yZB8cv6/+TL9ec51bNxWwI=;
        b=m5mispYMWEyv4sOccp2jcEuQXTlvCWqv8ZO/DrmWhVaqfR4PbmermyeD7CNE0h3pdI
         J3W0WD25DzwkpvSy5QJ8EIN5D/MJq16RWpfIt6eP7mxk31vTXEJFFBxZp2agUbAPa9sj
         3BN3RpOs9cCw0WbrvYow7jeW8bpCxgysuZeKB4t/XERIsN5j6FU/T6vtdhkayClIaXmF
         DxHoZEFYtalqJJEwD9vcMEzYIP5x3wk7/qSZmDNvc2ZP5LsWVi4jDOU7SW4Ivjofb2+P
         kgjsAY0d/xKxUF6RZoaNO+8zqyTFGsb8Mvg6YWqZ2dpyGQhly8uEl4B8w3jiiNG0s7U2
         XimQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfpN8J0exFBElZ6rY06OC0Nv6WjwChUawk4X912r3siKpIprnRuoR4aCwt4yGZylIDRh9B7aCHpqtmXmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z98rWcql4HhL+B5haIP1seJWrDIthuBn2brWlENGom524Bm5yKN
	9wrcGfal15QNz2husbMe0N6NL3ffyZdYUDZ+2KiUhyQToJhEHzXKfHWBGo0tOKHEIIZGQ71dnAX
	51ilDnQCeE/MBzw==
X-Received: from iofl4-n1.prod.google.com ([2002:a05:6602:8384:10b0:9e3:4909:2e0c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5394:b0:4d6:92b3:5c85 with SMTP id 5614622812f47-567e18964a2mr623375b6e.66.1793925788751;
 Thu, 05 Nov 2026 16:43:08 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:11 +0000
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
Message-ID: <20261106004218.604799-11-dmatlack@google.com>
Subject: [PATCH v2 10/17] PCI/TPH: Save TPH state in the saved capability store
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

Save and restore the TPH Control register and Steering Tag table through
the per-device saved capability store instead of a private
pci_cap_saved_state buffer.

The Steering Tag table is variable length, so pci_tph_init() had to compute
a buffer size and both the save and restore loops had to walk that buffer
in step with configuration space. Reserve the table by offset instead so
that the loops can address the entries directly.

Reserve the registers in pci_reserve_tph_state(), called from
pci_tph_init(), and report a refused reservation. pci_tph_init() ignored
the return value of pci_add_ext_cap_save_buffer(), so a failed
allocation left TPH state unsaved without any message. An allocation
failure is now reported once by pci_saved_caps_finalize().

No other functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/tph.c | 54 +++++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
index 655ffd60e62f..3ab8d5b2ab10 100644
--- a/drivers/pci/tph.c
+++ b/drivers/pci/tph.c
@@ -439,10 +439,7 @@ EXPORT_SYMBOL(pcie_enable_tph);
 
 void pci_restore_tph_state(struct pci_dev *pdev)
 {
-	struct pci_cap_saved_state *save_state;
 	int num_entries, i, offset;
-	u16 *st_entry;
-	u32 *cap;
 
 	if (!pdev->tph_cap)
 		return;
@@ -450,29 +447,19 @@ void pci_restore_tph_state(struct pci_dev *pdev)
 	if (!pdev->tph_enabled)
 		return;
 
-	save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_TPH);
-	if (!save_state)
-		return;
-
 	/* Restore control register and all ST entries */
-	cap = &save_state->cap.data[0];
-	pci_write_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, *cap++);
-	st_entry = (u16 *)cap;
+	pci_restore_cap_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL);
 	offset = PCI_TPH_BASE_SIZEOF;
 	num_entries = pcie_tph_get_st_table_size(pdev);
 	for (i = 0; i < num_entries; i++) {
-		pci_write_config_word(pdev, pdev->tph_cap + offset,
-				      *st_entry++);
+		pci_restore_cap_word(pdev, pdev->tph_cap + offset);
 		offset += sizeof(u16);
 	}
 }
 
 void pci_save_tph_state(struct pci_dev *pdev)
 {
-	struct pci_cap_saved_state *save_state;
 	int num_entries, i, offset;
-	u16 *st_entry;
-	u32 *cap;
 
 	if (!pdev->tph_cap)
 		return;
@@ -480,21 +467,14 @@ void pci_save_tph_state(struct pci_dev *pdev)
 	if (!pdev->tph_enabled)
 		return;
 
-	save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_TPH);
-	if (!save_state)
-		return;
-
 	/* Save control register */
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, cap++);
+	pci_save_cap_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL);
 
 	/* Save all ST entries in extended capability structure */
-	st_entry = (u16 *)cap;
 	offset = PCI_TPH_BASE_SIZEOF;
 	num_entries = pcie_tph_get_st_table_size(pdev);
 	for (i = 0; i < num_entries; i++) {
-		pci_read_config_word(pdev, pdev->tph_cap + offset,
-				     st_entry++);
+		pci_save_cap_word(pdev, pdev->tph_cap + offset);
 		offset += sizeof(u16);
 	}
 }
@@ -506,16 +486,30 @@ void pci_no_tph(void)
 	pr_info("PCIe TPH is disabled\n");
 }
 
-void pci_tph_init(struct pci_dev *pdev)
+static void pci_reserve_tph_state(struct pci_dev *pdev)
 {
-	int num_entries;
-	u32 save_size;
+	unsigned int off, len;
+	int num_entries, rc;
+
+	off = pdev->tph_cap + PCI_TPH_CTRL;
+	rc = pci_reserve_saved_cap(pdev, off, sizeof(u32));
 
+	num_entries = pcie_tph_get_st_table_size(pdev);
+	if (!rc && num_entries) {
+		off = pdev->tph_cap + PCI_TPH_BASE_SIZEOF;
+		len = num_entries * sizeof(u16);
+		rc = pci_reserve_saved_cap(pdev, off, len);
+	}
+	if (rc)
+		pci_err(pdev, "unable to reserve TPH save state (%pe)\n",
+			ERR_PTR(rc));
+}
+
+void pci_tph_init(struct pci_dev *pdev)
+{
 	pdev->tph_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_TPH);
 	if (!pdev->tph_cap)
 		return;
 
-	num_entries = pcie_tph_get_st_table_size(pdev);
-	save_size = sizeof(u32) + num_entries * sizeof(u16);
-	pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_TPH, save_size);
+	pci_reserve_tph_state(pdev);
 }
-- 
2.56.0.455.g6c5a503b38-goog

