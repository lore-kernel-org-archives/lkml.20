Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925779;
	b=hUDmyQ676HaQq5Fw+jG52OmA0Ccq7lyJFsq5Dbrxb3dvJ9VqwFBSzxMiaA1y8U+EorBt
	 ZBiATvJFs4EXr2VurrsvZCE4B3BK3WwRLWPZV5F0EEAM214bNdzn64s8bZXpQovUrYKx/
	 0mimtGRx/OE228PVyQIQ8WEsCmF4nXQErJpylL+QhIlIT8ciHkQsmMGa1+rOiO6kzxYN8
	 1GwSJjJM6jGU61NRZCdt8Yf1EF25YtFVISsbCLPPP/Jk0QIhQ3XLCM36j8mHnv7VSE3Xx
	 UiMKvD6gvP+FBZodBH9FUdWNgzeq3/UkMVDG4Ti3GykspG2bMD9pu2L+ofx2Cn8mNGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BPfp4nLyt9FVdmFE1yKT2sRgCODHAPIFVB7rkcjEfkI=;
	b=SgQKcsipg0HdaKZbF8raL0RUkF+UAYTXMVyYONJcOi03+C3X2MO1F06AANvHh6JgeF21
	 P/yPHWQ/VnbL0GwlHtsNtbXuOLI0rWWm8R4NCRilIeuq4uh69xdXxYJeUQSNLuvpb55uE
	 SNbnhu1deGjR+QS6YGz9vAE0GR7m6UioSGwomvpXZBbGzWTQNZ1bdkPbNUIdVMJLL3F5r
	 V8yIEcdk1UvLMH2hlhhUtFRJRzaaKNdL4QbvgKix9HZO7otDKynYUkgiLM83JBlnvFsBT
	 9XnJF+Es1L3vDVGtiNgWmRIHyYgoq16wUuSCzFP89RzDmChMFBu6oAnQ+awFc/ZF+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pZjogpE8;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6223606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6223606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pZjogpE8
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e4dso86643b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925778; x=1794530578; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfp4nLyt9FVdmFE1yKT2sRgCODHAPIFVB7rkcjEfkI=;
        b=pZjogpE8Ak8WHFpInkUSeG3P5zHU/+5iZFj7i51qTUVRnAd1vBlLYjXTRAvj3M1Kc3
         coFXIGXgiqDnbXVvEzruLsSocs2bwIAlnBJRm0GqAbhcG0BLa/qHPcKbYjLywgIigNcF
         mraoBr5QVaxrMNMSLKKIO12AHJb873pDK4NQdRFi3PzHmG2Y7Z+lOCTAyJv6Q6O2TJ8m
         TLEsPs/EXtljGzI0mIxJlfCTyAT7r8ABDEnr2nsnSzD4oLz8Z3tdsYRUUMrvZaySfE2j
         LMr9v4i38jYaMOZVwhrvKwF0uAuDmXaCQd4y+7nsCMbxVvzR4B6XVCA4eFVJ/UA5DxPz
         NwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925778; x=1794530578;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfp4nLyt9FVdmFE1yKT2sRgCODHAPIFVB7rkcjEfkI=;
        b=gPRzzTd3MZX2/kh9OhLlL6/yiIfRzXNSVccMs7pYY0k6RCjyTB2quHK8EfFb3plrbP
         9/uZ2OuxCRg1OR6gb4QDXhc8Qo7kfZ/g7Oozi8t83eAwedKYMFDVpZovsGZLAKw5N/Fc
         PbXdNg+G/AuY5RYZie1k9C0guQGqYp8m0KMpfHEVV2EiyM9IIepdMBqc9gZln5kyJDuT
         gKweBUX9aYvz5fdomafvUs1Ovwy9nBXCg4xT8jvz5XIo5P/DkO9nZoRKVe7KXKj6nh2l
         g1lVIHq/CXVViguW1ffB4nIo2f/Ce+jNx6r8ulkwLhL6KLmYxzuFezJrGLDl3/BeDTyp
         oUlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqeLaYLX3FAQa2eTRElcZSEhJG6mksR2PlVh3VrjqVpUlwEJs1qP3gie2on8+Iy4R3JWnAfj51P2goPXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RKXCYQG7JJUfi0Ki6qhYeoJEEdr9zHsuI77VQio6bGhf5keLD
	7Ro3kBzx3zFOr3fSxJ5a2soYZFe4+rfH+XaACZxKY1AFyqEs3cMqiDQzuVssfyByJXdkmh/l70w
	K53Jro8rVGhkJEQ==
X-Received: from jahl14-n2.prod.google.com ([2002:a05:6638:8c0e:20b0:620:17bd:8c69])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2216:b0:4d6:9355:7547 with SMTP id 5614622812f47-567e1840a0cmr681897b6e.66.1793925777406;
 Thu, 05 Nov 2026 16:42:57 -0800 (PST)
Date: Fri,  6 Nov 2026 00:42:02 +0000
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
Message-ID: <20261106004218.604799-2-dmatlack@google.com>
Subject: [PATCH v2 01/17] PCI/DPC: Allocate the DPC save buffer during device setup
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

Allocate the DPC capability's save buffer in pci_dpc_init() rather than
in dpc_probe(), and report an allocation failure, which dpc_probe()
ignored.

dpc_probe() runs when the portdrv DPC service binds to a port, which is
long after the device has been added, and does not happen at all if the
service is not enabled. Until then pci_save_dpc_state() silently saves
nothing, so a reset in that window loses the DPC Control register.

Allocating during device setup makes buffer existence depend only on the
capability being present, which is what the save and restore paths
already assume. It also puts every capability save buffer in one phase
of a device's life, which a later patch relies on.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pcie/dpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b779bd1d861..b7f79266f66d 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -408,6 +408,9 @@ void pci_dpc_init(struct pci_dev *pdev)
 	if (!pdev->dpc_cap)
 		return;
 
+	if (pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_DPC, sizeof(u16)))
+		pci_err(pdev, "unable to allocate suspend buffer for DPC\n");
+
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
 	if (!(cap & PCI_EXP_DPC_CAP_RP_EXT))
 		return;
@@ -499,7 +502,6 @@ static int dpc_probe(struct pcie_device *dev)
 		 FLAG(cap, PCI_EXP_DPC_CAP_SW_TRIGGER), pdev->dpc_rp_log_size,
 		 FLAG(cap, PCI_EXP_DPC_CAP_DL_ACTIVE));
 
-	pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_DPC, sizeof(u16));
 	return status;
 }
 
-- 
2.56.0.455.g6c5a503b38-goog

