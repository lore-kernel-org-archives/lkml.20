Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB4525A9F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762024; cv=none; b=TH1DinRz3JU+2/rVshtxsEtNTUT5UoybHQ46XiyWqqC/jlGa8LBiiRFx6OBQnd2JJRYN+spSSHAX3EWhWJRefRGG1xyJbK6Ef0IFqHlziHZ8RGIP+tN3VaXZ88yf0FM9s2OgGUuaH3GgPUzGPOYFj5nmfrkcfYhMfrtiuEA2O/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762024; c=relaxed/simple;
	bh=ZD3KS7DBDYWBFB8hwoUBxQdCUMdHz+nSMWic4WvQWYM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YNl6GjFJ9Da3D8NrtciC06Sq5o3qu0hlJPj6H5nses+CcROBDKwZfzSQGX2f6WBXN37Y7s9QiEuFce+wrxp0OJaxZ7X4IPeOfvpvaVFwHI1VqYY4qPt3AW/58Ep+n/IA+Sg9lvMm7z8O/490KgSDpr5UQn98+blTEipNWyyQ7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QfXpPuns; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QfXpPuns"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso14183885ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789762020; x=1790366820; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNhCAqWpdqP/8unoyYkwhtURYEVhgOr7+m0jRabjXBA=;
        b=QfXpPuns7rVxUs9VwLxWw7dyYHSvyA4jEmRwe2O0qTylnn8K5rP/k8KuGUXfFp0U88
         Q+Rfym1UjXfnRN1BsQA+t9MbYLj/K2Y9GSw8g/EPz1Kq4NkMb97aBK5NHaRPIcB5pbQo
         lTCkTsVCBVcBYNX9wRxpZpKc2avO+YWN0ZrEDL8HLXoXUR/DGp0OLD2QdU8QEO6EE+Gt
         1ApyeNV1AS1nUWvUfPNdGJVsfEwqcfnpJ/dvFX/lpPl9Cwu0nqmyTf4+wd3U9yhJkSVu
         GKqYcLdN4Js/X42r3dR/sYBhmVqN7JPVvbb8FYmsrKaCF+m/aBQYB6bGijt9+RscYzj2
         tkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762020; x=1790366820;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNhCAqWpdqP/8unoyYkwhtURYEVhgOr7+m0jRabjXBA=;
        b=bywpBXl7GFDn5IMG/LNfkfgdeO+2tnweRV7RiwjdfkWoXKuQtdKmPjm7aYc/9JFR0X
         WSn3EZzSaJQlQK6WYPa5HsaBaS4QsYYOI1LQq0M2TcTB0zH8yEaatCerTFZEs50kd7je
         YJOqrh2K89EDmVwgzeFtIVvxr3wmMRPmqnZfaaX1OB1nLK3y981m7JDICWjaP+6ZubJt
         PUOXvpEBHcijZ444nh1dQSbM3F06Vc8y8E+XStRjPPsOkmzr34jIFRz5mBHn5ox3mI4K
         Fm5COhgJDY0JUoZBRm8wTVZZIqyvJPcBFC5K/usniD8SyIj5T3pZDTdrKKdPO+tmQ+KU
         zsOg==
X-Forwarded-Encrypted: i=1; AKwUvBxnkPGCreVIOYYBRIXIhnN5oZEh1+3RdwipAYCRA76Ly/0xpJ1Oc9c6qSjhh3MxvKVU+G/UbNrUxxI8zyY=@vger.kernel.org
X-Gm-Message-State: AFuF++le2qBH31kDRSgqrOxmf2CY9mZMTMwcySJnWDhE4E1nYZRkgStD
	Fg02bxwVA8Z7ssNOCArNuX86bDXdQ7Sk4rI3h3UjeF/62Mvt2sfmGyfm2cLDL6QrBgHu7hX8PRa
	BcyCT/GnVnrWikg==
X-Received: from plec5.prod.google.com ([2002:a17:902:f305:b0:2dd:2f59:daa8])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:9cf:b0:2dd:c053:e662 with SMTP id d9443c01a7336-2ddc053e6aemr12608265ad.40.1789762019617;
 Fri, 18 Sep 2026 13:06:59 -0700 (PDT)
Date: Fri, 18 Sep 2026 20:06:33 +0000
In-Reply-To: <20260918200640.887030-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918200640.887030-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918200640.887030-8-dmatlack@google.com>
Subject: [PATCH v9 07/13] PCI: Refactor matching logic for pci_dev_acs_ops
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Refactor the logic to match devices to pci_dev_acs_ops by factoring out
the device matching loop into its own routine, pci_dev_acs_ops_get().
This eliminates duplicate code between pci_dev_specific_enable_acs() and
pci_dev_specific_disable_acs_redir(), and will also be used in a
subsequent commit to check if a device requires device-specific
enable_acs() during a Live Update.

No functional change intended.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/quirks.c | 51 ++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21f..7aee30734303 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5377,9 +5377,6 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
  */
 static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
 {
-	if (!pci_quirk_intel_pch_acs_match(dev))
-		return -ENOTTY;
-
 	if (pci_quirk_enable_intel_lpc_acs(dev)) {
 		pci_warn(dev, "Failed to enable Intel PCH ACS quirk\n");
 		return 0;
@@ -5399,9 +5396,6 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5429,9 +5423,6 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5451,56 +5442,56 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 static const struct pci_dev_acs_ops {
 	u16 vendor;
 	u16 device;
+	bool (*match)(struct pci_dev *dev);
 	int (*enable_acs)(struct pci_dev *dev);
 	int (*disable_acs_redir)(struct pci_dev *dev);
 } pci_dev_acs_ops[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_pch_acs,
 	},
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_spt_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_spt_pch_acs,
 	    .disable_acs_redir = pci_quirk_disable_intel_spt_pch_acs_redir,
 	},
 };
 
-int pci_dev_specific_enable_acs(struct pci_dev *dev)
+static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
 {
 	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
 		p = &pci_dev_acs_ops[i];
 		if ((p->vendor == dev->vendor ||
 		     p->vendor == (u16)PCI_ANY_ID) &&
 		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->enable_acs) {
-			ret = p->enable_acs(dev);
-			if (ret >= 0)
-				return ret;
+		     p->device == (u16)PCI_ANY_ID)) {
+			if (!p->match || p->match(dev))
+				return p;
 		}
 	}
 
+	return NULL;
+}
+
+int pci_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
+
+	if (p && p->enable_acs)
+		return p->enable_acs(dev);
+
 	return -ENOTTY;
 }
 
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev)
 {
-	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
 
-	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
-		p = &pci_dev_acs_ops[i];
-		if ((p->vendor == dev->vendor ||
-		     p->vendor == (u16)PCI_ANY_ID) &&
-		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->disable_acs_redir) {
-			ret = p->disable_acs_redir(dev);
-			if (ret >= 0)
-				return ret;
-		}
-	}
+	if (p && p->disable_acs_redir)
+		return p->disable_acs_redir(dev);
 
 	return -ENOTTY;
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

