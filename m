Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094280;
	b=cQcpHrw8zEu29xq0YM4Na5A7e27A0r4jtcBEq+aEQ1MSoPc/rcST9x3ahJtWh5cjHBmf
	 Sx8fArsuW9Ailud9LQqRsYzXMxpyMucc7WRsPSOcoPvrNtMBnjbqJLGATLLH1m7LHOiEM
	 wzmtCtU1ub1J/PAX6O8V8RwbwBK/le4iS1JuoMgs438MR41r078ChYijQAleLxY4+2DKV
	 /ijMKOQS5RbBnvtdX9SBYu3Chxt1pGA6muygbkJF3MIfKAokQx3YUYpxzdrQtr+yG77rI
	 4vsPGA4bamkQSryURcZwJxYhQHXq9vSJMqd6j3JuzdI9ncgZYri0DUhauO0hNG6qZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hl/Nai93S8NAs/Tww+fCBXzZpo040uYm7bnamGWTrs=;
	b=arMApgDkatyrCYvVVeO6lL405B+2CsnAO+NZjGayO2w4ryNRqjNKLjWq24FGaiDZ50C2
	 k+3V0YuF7ir9h5RDLfiANBgeVp2CoGhXrpz8+ZII9Lu4wEUFaUg7ylX85ClIKU0P/G/rb
	 31d4O9q4taWm0mE9V8ElHVFPjo2Q4BObylrsShThRXtXt2D4HMir/bSH+NUZHNPSvetc+
	 ddGRvw0Xry18yZb/5I+Dk6kpqba3zqaissqK9J6rjGjCeSWiVD7rydmi/26EAs66eO5As
	 PyPHJFEQvDhuJEmf3mf82WkeTSmNEQj3ck9XS6Rk481yke3Qe3jT969EKzoijIEkMzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T566VoMV;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B1C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B1C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T566VoMV
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a1947498bso310827eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793094279; x=1793699079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hl/Nai93S8NAs/Tww+fCBXzZpo040uYm7bnamGWTrs=;
        b=T566VoMVoI8gPHc3pBnX86446rdqho7Ga58ELgz7gtGP86o8Gqxt9sSR8VUqcybwST
         +7Y2CMSLBZ1YaQzOuVYNJ2ODg0iTOhhk2/U/j9lVblNgM6du7jmTpKemVDs6qrXzRP0q
         eMbHC+bX7ZmhqOZGhdPFx9qJiMWZaQcigFsttzAmlRlvRP74wIDlk5yeEdNAd6ILDbgV
         8x+hmTHkWIbuMBgFEsFHBUyZgQ7OjjxcUrt27px/+rReaxgQQnKjD6nv9h6W8g92ziYF
         Qrq4Tzre1y2Wh4IObTkQJnRbZx2rmUOR+NiIt6FscI55phaHbi9SblZIfB+GPxydaFeU
         k0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094279; x=1793699079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hl/Nai93S8NAs/Tww+fCBXzZpo040uYm7bnamGWTrs=;
        b=y8L1DCcY0wWOhqZGVnAFwilyJBfDvInKZ+feK8IrsCTBJBQkMrCWF6X1qrpwf5yVYu
         fmaxoFRZ5MIYVV3rElv0155+RPPQkPOOYR0nqb8CRS5lnOTJU9myBkAHtZvgEErRKQ5x
         Y1+6vFWPSTFYHyAideHrUCIANB7SbdAd0SIKfp07Vk+fAiRParaMbz2gAE+ugdufaxD+
         zyvUxkIN8NFtROn0JsP6F4tirfXxoWD6NDRpJxvxxAF1ptdZTOwg8aNgkfQTEhp4pOhY
         /mNQnzFnXrC5JsEARo4+eMAeluoZYJRlXHhQt1k6oLpSLFET3I/bSZ66jZZGDYKVamdQ
         9nTA==
X-Forwarded-Encrypted: i=1; AKwUvBxYvDKikC7L9yHyENSFmmLf7MmiO7q1YJMNPxcw8zlxq4XwcjoV9F10GPhZqM+vhi58rx/WEkOX7IrJiiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI13vs3puW4G25DloySgRKhX8tNYKlbPhefmofg900HX6HixvpN
	uiEgkhv1U8lFFLwfFtQAIiIOcaAqoOG6iXixPveGcvPIeXI8bp6n3Bfk
X-Gm-Gg: AYBFou2654hApdGdV8ZapXc+gYH/2iD2i40jwLahbIE3j+hQEgmS97XeLPEUHXePy1l
	1VUH4TfAhUH9XGsXsoHDYpDr281TrsNiX4nDvYqduGjAMpMuVDfRXBf8qvHm5V2SdolstCXAcyp
	2Pl1tBg/qOr0b5jlsypdbgLmHi69B1CYjWMY/CN5oJWu8N9RwbSAqOypEDAfFSFci/U2jcQqLYX
	e7E6rhwN10Wm19YROyM0gI/4I77xHkW74rwlo6ZR64rwaVKuPy+x30U+3oNrail46ubm4AGK2Ni
	9if0PfxqCqsoDilG3ug9FnxPBZmxSzAGTpjCi7kBHvz5qEWomG80w9M/7vJgypGPCDzPiMRVklZ
	yV9B9HgZIdO2nDRGHX/nZmOt6ElepTaVmhOZUU9sMtxlT/s5kjmlyL9/K6aUeKSRqiR9aXcJIU5
	2iYhw9AY2vHvikGByFfCtrB5QdTEu+h3oIMjai+0y9FCfz8rAF9yVicj2y36jLqbSt4/l4H+/lr
	z/jEIugm2xZZFmD8kv32WCaLDX+kZJR/EDstPieb8w/9vHhfmz07Fe9WVFVd1yyyzmMPUN/Topq
	I1Cre1UHOw==
X-Received: by 2002:a05:7301:7d01:b0:366:c497:610c with SMTP id 5a478bee46e88-369e8610133mr12065401eec.33.1793094278730;
        Tue, 27 Oct 2026 02:44:38 -0700 (PDT)
Received: from Zoro.lan ([2409:4090:2022:b00e:72eb:d31b:8aa6:1b54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm60252926eec.23.2026.10.27.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:44:38 -0700 (PDT)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>
Subject: [PATCH] PCI: mobiveil: Fix device_node leak in ls_g4_pcie_probe()
Date: Tue, 27 Oct 2026 15:14:27 +0530
Message-ID: <20261027094427.143733-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ls_g4_pcie_probe() calls of_parse_phandle() to verify the presence of
the "msi-parent" device node. of_parse_phandle() increments the reference
count of the returned device_node.

Because the return value was evaluated directly as a boolean condition,
the acquired reference was never released, leaking the MSI controller node
reference count on probe.

Assign the resolved node to a local variable and call of_node_put() once
the existence check is complete.

Cc: stable@vger.kernel.org

Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
 drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
index 4919b27ea..5b1862fe0 100644
--- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
@@ -199,12 +199,15 @@ static int __init ls_g4_pcie_probe(struct platform_device *pdev)
 	struct mobiveil_pcie *mv_pci;
 	struct ls_g4_pcie *pcie;
 	struct device_node *np = dev->of_node;
+	struct device_node *msi_node;
 	int ret;
 
-	if (!of_parse_phandle(np, "msi-parent", 0)) {
+	msi_node = of_parse_phandle(np, "msi-parent", 0);
+	if (!msi_node) {
 		dev_err(dev, "Failed to find msi-parent\n");
 		return -EINVAL;
 	}
+	of_node_put(msi_node);
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
-- 
2.53.0

