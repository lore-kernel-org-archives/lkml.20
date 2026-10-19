Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445488;
	b=lOCj2He/Hiw7BaYZ1Aon7lrKQI3QH1+6sQQ4zMQculap6DB6Rjqzdak+oLSmtsy9dMAe
	 6e6KsoY4FFBCGPyQCnVh09N6fc3aPHIGiLvZJ/M5q3nc0qhwNBzSOSCeimnWNQ8WYKzr5
	 JcTiois7LSEN/NeSYTnZQLRef2M9OkXgdIhTspjabtRzS1KIQJpDvMh8gsImi9r1M/elg
	 5ElWAeeuQfWIfIZiZfO+1KER3Y7/hQo2HYTiUda60AJbKyUUFUu4PxZm4v0ZaSIvfVGAi
	 GzdtW2oUUTmExIMbmQg9ph3fVeg0wX9VMVsjQi/ZCyg/mQItYsPgxziYOAmkvyWrbnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zjIHcsp6K5l9uxu4NW3RN2Ki168yByks7xW11UF++V8=;
	b=QaR6Ib0XynwvlJbxTvL5AtOviU+XNBnYGQDI4lcKj55hRgjqlj99acjjFXAnPzOs3P+P
	 vp1+VwPHBskpqqxPXSVpKFYy6F1j2nagAcHGQ2ZNVxwiSib/r9ptB+kJRWK09fofI843S
	 QEZRYVZb9qVIYQRh/OCdDNXL2iDyPQ8UDZ/fcwC3jdp5vmYMKaA+kq9eLC/ZItP12HqqL
	 DEZ2vIZWLw3L7qsMm85ZDl7i+sno9I2Ee5cne9FLNdx2HAF/QwNnJ4APhzzImq+1+bmSj
	 vif2Yfhp6bcX5FxPRnJW6nNOWJw7rP6Q1ET93CTrFi+M9ZezRm3nDIj/eDM3p1P0gVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=goOJaQw6;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57760A2600
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E57760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=goOJaQw6
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so5582945ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445487; x=1793050287; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjIHcsp6K5l9uxu4NW3RN2Ki168yByks7xW11UF++V8=;
        b=goOJaQw6SkCjXEUB7sOfy2gnFYGrWDm1NJBssKP1r5Auu51286tZI/Kg5T9L858TOE
         YyKBB5SmGBVoiOzqS/tS6cRcZ05h4Xrb78AbopiQvDcy0wEootY1dRfZS8EqNzcOOE0e
         DXX8hXJBCvk6I2LowTEnVtjAKTWQA28LRMgl4ilU5EstyFjf52x9G1neQiUcKPE8lwT8
         KdnyzqeP+xJy/fzO/FCj1j2TEPdes9bTiVmX16S+Gb9M2/Mc4udYNfIF+iD1htq0Ywjr
         jX7vrNAeBDxHiwWfd8WKykGBTfcRUpOem60ZhjvC2LasnRbUMSS/2RQNsNIctRnfVp19
         fASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445487; x=1793050287;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjIHcsp6K5l9uxu4NW3RN2Ki168yByks7xW11UF++V8=;
        b=i18t3SyT86uQc5pTQ0URrlsED6XhLdfMlKzzyrhZCRxZmXnDbHiZCG+BMtenGOYmWA
         B4liKsE+YWelefwUUpTR9YuWXB7f1WyL7uBiYUpvA0bI1q+k+r6fPaxpIKmQYVF3UOfN
         7kkip3nKaSrnVYM5l+R3BNYH32bTW3goojKprt7NLKETpcpqOsszACgg7c6ol83iXTqm
         MZ/6JBqAC2zk34uTs42bfwh9uRF8X0k5o0WnKfU0Z3NifH2j5yVys0eGnXyUlpnkoyCe
         L7OasKo4xaBEDst8R8DUfL62AycnERQEm5P1oWmKbreqGMiz2nnb7Z6FSXvVVJJsoCz7
         ueDg==
X-Forwarded-Encrypted: i=1; AKwUvBx3Dv9GrJU5UQm2ayYpSWSnscEHziGSw5tHkuv3G55xVsDuHAcgfSAolehNboqSfdoyXfkBJBf6K6rCFQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQTF++s7iMe44235JrM/+eqZQP3q1PCZgkAboIFu5lhaKTyjKa
	mMqqdV6YLehGRVzp+ycV9EMm82aK8JuRuFT3bwIuF50AZvUP+nsr85ruJI5WwVL1NXyufphYdkY
	WyCqIobTnRLbqjw==
X-Received: from plbkf3.prod.google.com ([2002:a17:903:5c3:b0:2e5:b8db:503])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f711:b0:2e5:dbbb:6c7f with SMTP id d9443c01a7336-2e9a68356a1mr74031665ad.1.1792445487379;
 Mon, 19 Oct 2026 14:31:27 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:51 +0000
In-Reply-To: <20261019213054.3157159-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019213054.3157159-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019213054.3157159-8-dmatlack@google.com>
Subject: [PATCH 07/10] PCI: liveupdate: Never assign resources of incoming devices
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	David Matlack <dmatlack@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Logan Gunthorpe <logang@deltatee.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Prevent the PCI core from sizing or assigning the resources of incoming
preserved devices by adding a check for pci_liveupdate_is_incoming() to
pdev_resource_assignable(). It is consulted for every resource when
sizing bridge windows, in pbus_size_io() and pbus_size_mem(), and when
building the list of resources to assign, in pdev_sort_resources().

The resources of incoming devices are claimed as programmed by the
previous kernel while scanning, and claimed resources are never sized
or reassigned. However, an incoming device may also have resources that
the previous kernel never assigned an address, e.g. a disabled ROM BAR,
which therefore cannot be claimed. Assigning one of those would write
to the device's BARs, and updating a 64-bit BAR temporarily disables
memory decoding (see pci_std_update_resource()), which would disrupt
memory transactions targeting the device's other BARs, such as P2PDMA,
or MMIO from VMs whose vCPUs keep running during kexec. Leave them
unassigned while the device is incoming instead.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/setup-bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 4bec76950f46..b82440394ee2 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -311,6 +311,10 @@ static bool pdev_resource_assignable(struct pci_dev *dev, struct resource *res)
 	if (pci_resource_is_bridge_win(idx) && res->flags & IORESOURCE_DISABLED)
 		return false;
 
+	/* Devices preserved across Live Update keep their resources */
+	if (pci_liveupdate_is_incoming(dev))
+		return false;
+
 	return true;
 }
 
-- 
2.56.0.212.g129ede20d9-goog

