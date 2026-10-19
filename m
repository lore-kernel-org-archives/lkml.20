Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445489;
	b=vid4TY7YZro67jMLP913N5IGbVfla5Fvf0BBy+R4Lt+Nyoc2MV+v4SrUTDUMj84fk9oy
	 hPAa+cTwfg4SVY0bGqgD+iIEjSADGxw4bwhuxLyKLeFBHoGYffFWQfU3M9Ex03xP7DAkH
	 9CvaIsObH5jVl3KI/ZGHPEDVQyKs/deGK77KRDRq7Gr7LLpzrucdRncFOmZlGaHWcUGcW
	 STddhn0YZcss7Xh77OlsCRJedTY0gmEV+gewnrpteaOlew45bOXucHZbBr26+vC/xUofg
	 eCC9CbmYzUuK/8HmOKUawJzHM64u3hJWFR6wVx/ynFhj06bgUHf5UoT+VRkHfjI7bNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aQspCOyRyocPeuGvIH5YlNChv9LGZMbmr1LWcFqx0m4=;
	b=pRZCyUEiAvJTu+C/z16PNmz+o4qBt05uisUUqaMZs02tRxAzhKu3Rnejib5frrTQzD3m
	 m5xybUaBJN5ZJA2p/2LHY/KsFX2ZmNYVtzcK7ScEQoRoL8/NlRlnofvuyJFwVyXLGh1LW
	 jOzzhDHe6yL42lYDccSdj+NfsbA+hhOGYHHzmGdVKsxPD0nI8dc+vwTiQnjFsGTuDiVrY
	 nICmqdQyZpCZAH2NTRJJUObWVcpeSDWjOmvjixHWVLHVOOLOUtS4nypSSfd34lJiChqj6
	 pkC3ZH9g6r9MY2byZTNIXwKpuuj9e9+HSDMviET1Y5F/8WHfS8pj9XDKUkeYdEYydxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qhFjDY5D;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC760A2621
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FC760A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qhFjDY5D
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd67d4bbdffso1078434a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445488; x=1793050288; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQspCOyRyocPeuGvIH5YlNChv9LGZMbmr1LWcFqx0m4=;
        b=qhFjDY5D4p7t7LnkELeXiL4SLoDFvPe/hevdCly4D6YNMjJM/ortuUazpb9FEaTJcu
         h7uUTeCQjkmfNlNt3rq41WhYuifJ5RbPU4FG0sQ1cIPTtPoc9H5a7QEiHEsZJlVnMmBE
         kz6IycTjoFM+BLHWJwD71BjP1R5PMiNfiDwXiQk97EXhoosBw2hAXiM/ntdlSHp1W16B
         tZCBvma0Ps/fce1J80AYIZ1OHKDI7Z/Fze0/wgEoAAIZJRnT+aH3rxvGbx93T1tOnyng
         Y7sKUVEgSV+1BtGWmUHWwhvV64DSc7kAfdcgDX/J83Q6g9JFP85YBFu8r0/t0mh+3Z43
         ojOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445488; x=1793050288;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQspCOyRyocPeuGvIH5YlNChv9LGZMbmr1LWcFqx0m4=;
        b=vYkzVts/qcDKNBtDVnJlPSB5afAXavVuIwAzhNmLSvH5KeRUNAZdiksYRH+8XvBrSG
         aelLJRI9N6aM7WocXcBSEeH1ZYfKoHAP8w5lJ/igIvZBP3seQswZOjM4Dq2l2qhi9vzO
         4xwWwA10weOp8jyc1+YyV+Qgs8L/Y46MxZygGIdI2dEgJQWYCrH6ML5lCu1DcAgy1kbs
         rY/801SRhMU4KBolf6p3vXky0V8KsUeaVzpXSRD9IQFMEGXbjy4XaF9kJr8i0GstPQN1
         /5WrWlZe/iNqSv5+UnjOq6rONBXieH/ODG0NGixltOoySRlnzgWz3FitqQ2eYKe1S3sq
         5TPw==
X-Forwarded-Encrypted: i=1; AKwUvBzZmb+OSWyHLb8ls9B5u40REWhXgp5+H91E7IOiW0GeboDEbeIrLHMn6gXz8pw2WOfDX1Latm8wGwUJYuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA3WRTCBQhsnssH2xhVqau3P2OFg8d5SETPl4ihDaosbi73bPs
	UUYwXA5L4sFKz7sFFf0EX2vZETm07aODOO4kudNlRw7r4uV1bNFB0ogVaKHjQpRvlXlz040E9fQ
	RwA+XqlKZJZUEVQ==
X-Received: from pgld2.prod.google.com ([2002:a63:e02:0:b0:cc9:f746:40bb])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f89:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e225fe8995mr7731521637.25.1792445488192;
 Mon, 19 Oct 2026 14:31:28 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:52 +0000
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
Message-ID: <20261019213054.3157159-9-dmatlack@google.com>
Subject: [PATCH 08/10] PCI: liveupdate: Prevent releasing resource windows of
 incoming bridges
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

Prevent the windows of bridges preserved across Live Update from being
released during the recursive "realloc" failure paths by adding a check
for pci_liveupdate_is_incoming() to pci_bridge_release_resources(), and
log that the window was not released, similar to the message that
pci_release_resource() logs when it releases a window.

This prevents the PCI core from forcibly releasing a preserved bridge
window to satisfy the resource needs of a failing child device.
Instead, the child's resources simply fail to be allocated. This should
never happen in practice though, since the previous kernel should have
established a sane resource allocation before kexec.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/setup-bus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index b82440394ee2..7283c4be803e 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1700,6 +1700,12 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 
 	idx = pci_resource_num(dev, b_win);
 
+	if (pci_liveupdate_is_incoming(dev)) {
+		pci_info(dev, "%s %pR: not releasing window of bridge preserved across Live Update\n",
+			 pci_resource_name(dev, idx), b_win);
+		return;
+	}
+
 	/* If there are children, release them all */
 	release_child_resources(b_win);
 
-- 
2.56.0.212.g129ede20d9-goog

