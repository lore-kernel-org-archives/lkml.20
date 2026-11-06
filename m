Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925785;
	b=BDbcoPewCMjJLeE0BA351kFRhpVfgIvW2ZoLK/emTWZK4pWVVynPTRVfvTReIq6RJlZW
	 DxgYxUrZug0ShmexBC5OCw17syoipQDDTYGXRuD0KLbhPVDHAKPn1iWYS7qvFa+2cImrs
	 mHxYUt+j//AAe0Jv3cus/jCYOjN79O1rjbpOgRxZuLxU3kYNCbRjnGdL19C1mSCofkbSa
	 qxozAB0sbGrO7oIAo5p3SzF3La/aujyAybyl0N/tcUtufiRpBwdn2eq1udwbOIlv7sP5A
	 j+ccg+w3EGCEyBNvT0YFw8kagtPWeIsX0avhweH+gyg3+HlZykIV0yMeo1lJLp7WwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SqwfwAiEqbASiUZ5fLcpwdF4bH2r5Wh+f0RbnIc3OoY=;
	b=X1FJ2HLioGO6jPoMhHSshgQTCm9Gx6hFPGhSAACLgXhXbnpmBYH5MCTIygj/IqrcSX7p
	 r0vtk1gbuoeUAtl4BCsgvVWUJ20QnixQvRYuoxQxtI5/tnHlby6xYWn9qn/SJos3OtpkH
	 CwcU5YIMZoxQ+KpQQi8CeEJNEYgo2MH40pCKssRMYA3TWTxh8KO0CjG14r+4bkHz1/6Ve
	 Gne9Hp0FCdJoynUZTbIzChCyk2tHe9eUyeoBNXif/Oqirzrsvxfx30Pb5r49dW9lbkRJs
	 xatE1k3jumAIujP7Yd4ENMDzp71KKULQMicusWSoHQ5VrfvJcY7FbARTAKX7aAdbE0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jGDWKhHV;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53488606D819
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53488606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jGDWKhHV
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-567e742f481so34970b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925784; x=1794530584; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqwfwAiEqbASiUZ5fLcpwdF4bH2r5Wh+f0RbnIc3OoY=;
        b=jGDWKhHVG4/AClDmwQXrpibu+KxDT2CPI1gbNVdSt7DHrQCGOngHcXxgvfPl6CZKcd
         k/EP33TgczVojx0ysMNp15fo/CamsS0+lA0pLeJFJVTlg8iDSXV99r/tXj1y9Ghz3wee
         15meTMJcDEaua6D4A+bUk8h0O+OaspNrA9fs1Ti4LudM/Ja54kJp1m6TL7fydr5y2ugH
         2mKuZyH29ppp66IA1Z+8oaeIA0DSBwuauTuxXTN7HEwk3+TL7K4QRLWWN6jmqX4KT3SR
         9GgCZXDTjOhBaNASW5zCXBorlzLC0Dddity+FUZ5nWbJTucKYm36562CNnY6HX+6i3r8
         uWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925784; x=1794530584;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqwfwAiEqbASiUZ5fLcpwdF4bH2r5Wh+f0RbnIc3OoY=;
        b=hptmyG19MyTTUEFxGpU6khxXXBW69vjiJ5fCnYOjDf9r/h7VMXJiYzLas6u66Ll78X
         tyim78RN27yoAUkzwLpmyzxSkS4eEkDGF0HNVNikrv4VqPr2HWRvfBpSGeAhnjA8GmAR
         rT0r8aA16ItnJYCLPYugdoAUVP8ElfzMmas1pJJ8wuCENQQ6wPf1tXM3OXU4mV2zAehs
         4Qd/cbF+wU3iq/Tn6DGhOkQT8wSvAgllXbAlSNGAS2CP8XU8A8p/4IxI/sc4COA6wJRd
         ekozLS0xyww9eLlLlSTpPap6l0J3VbgXQdg5y55wYpJ5eeM3HVFcbHM3NuLd4fSnOKGK
         3Ovg==
X-Forwarded-Encrypted: i=1; AKwUvBy1B4xlRgFuBUZpkzBSmdnAPECnMDFk+n37s+h70cWp1VVwT0r1PN2KwojflctUAk3O7+QiI6frECfwcaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/10P/idjaPMeEcT6IYg9jb/kAgog9wZZPrHKQf7EwVuDfq7L3b
	StwPJQakz3ko09Wk1BP5k2xuXkj3DlDUNlwmDHrvqmHMdoXM75NcLbwLz/9DoKZUHp4nuVMHvpx
	LuBDmHLrP/uVtsQ==
X-Received: from ilbec12.prod.google.com ([2002:a05:6e02:470c:b0:53b:d168:b69])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2218:b0:50a:7162:87df with SMTP id 5614622812f47-567e098e3f0mr811203b6e.2.1793925783998;
 Thu, 05 Nov 2026 16:43:03 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:07 +0000
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
Message-ID: <20261106004218.604799-7-dmatlack@google.com>
Subject: [PATCH v2 06/17] PCI/ASPM: Save LTR state in the saved capability store
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

Save and restore the LTR maximum latency registers through the per-device
saved capability store instead of a private pci_cap_saved_state buffer.

Reserve the DWORD by its configuration space offset during device setup,
in pci_reserve_ltr_state(), and keep accessing the registers a DWORD at
a time because some devices only support DWORD access to them.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c       |  8 +-------
 drivers/pci/pci.h       |  1 +
 drivers/pci/pcie/aspm.c | 31 ++++++++++++++++---------------
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 6cf4a64cb7e6..29d9474db1ae 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3742,15 +3742,9 @@ int pci_add_ext_cap_save_buffer(struct pci_dev *dev, u16 cap, unsigned int size)
  */
 void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 {
-	int error;
-
 	pci_reserve_pcie_state(dev);
 	pci_reserve_pcix_state(dev);
-
-	error = pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_LTR,
-					    2 * sizeof(u16));
-	if (error)
-		pci_err(dev, "unable to allocate suspend buffer for LTR\n");
+	pci_reserve_ltr_state(dev);
 
 	pci_allocate_acs_save_buffer(dev);
 	pci_allocate_vc_save_buffers(dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 206e0d04e06e..0daa2439db5e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1151,6 +1151,7 @@ int pcie_retrain_link(struct pci_dev *pdev, bool use_lt);
 
 /* ASPM-related functionality we need even without CONFIG_PCIEASPM */
 void pci_save_ltr_state(struct pci_dev *dev);
+void pci_reserve_ltr_state(struct pci_dev *dev);
 void pci_restore_ltr_state(struct pci_dev *dev);
 void pci_configure_aspm_l1ss(struct pci_dev *dev);
 void pci_save_aspm_l1ss_state(struct pci_dev *dev);
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 02922b887ec6..39adf2cad331 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -30,8 +30,6 @@
 void pci_save_ltr_state(struct pci_dev *dev)
 {
 	int ltr;
-	struct pci_cap_saved_state *save_state;
-	u32 *cap;
 
 	if (!pci_is_pcie(dev))
 		return;
@@ -40,31 +38,34 @@ void pci_save_ltr_state(struct pci_dev *dev)
 	if (!ltr)
 		return;
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_LTR);
-	if (!save_state) {
-		pci_err(dev, "no suspend buffer for LTR; ASPM issues possible after resume\n");
+	/* Some broken devices only support dword access to LTR */
+	pci_save_cap_dword(dev, ltr + PCI_LTR_MAX_SNOOP_LAT);
+}
+
+void pci_reserve_ltr_state(struct pci_dev *dev)
+{
+	int ltr, rc;
+
+	ltr = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_LTR);
+	if (!ltr)
 		return;
-	}
 
-	/* Some broken devices only support dword access to LTR */
-	cap = &save_state->cap.data[0];
-	pci_read_config_dword(dev, ltr + PCI_LTR_MAX_SNOOP_LAT, cap);
+	rc = pci_reserve_saved_cap(dev, ltr + PCI_LTR_MAX_SNOOP_LAT, sizeof(u32));
+	if (rc)
+		pci_err(dev, "unable to reserve LTR save state (%pe)\n",
+			ERR_PTR(rc));
 }
 
 void pci_restore_ltr_state(struct pci_dev *dev)
 {
-	struct pci_cap_saved_state *save_state;
 	int ltr;
-	u32 *cap;
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_LTR);
 	ltr = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_LTR);
-	if (!save_state || !ltr)
+	if (!ltr)
 		return;
 
 	/* Some broken devices only support dword access to LTR */
-	cap = &save_state->cap.data[0];
-	pci_write_config_dword(dev, ltr + PCI_LTR_MAX_SNOOP_LAT, *cap);
+	pci_restore_cap_dword(dev, ltr + PCI_LTR_MAX_SNOOP_LAT);
 }
 
 void pci_configure_aspm_l1ss(struct pci_dev *pdev)
-- 
2.56.0.455.g6c5a503b38-goog

