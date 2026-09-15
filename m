Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F338F253
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436398; cv=none; b=snjSgHyW6LmjOvkCOCnIec6ANxrokuQCE2f4+JzbfsnixU+8foH0tDzhNm5C4U9bmY27AndulZ/d7EzLtNV20vnUZ2W3ipDRu5eQsajtV0kleUmMglAE7UA2lDhJjLDSkmSAD91ML6zlZBAUZJvxLmZGscXnW6GxaxnGPr/bkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436398; c=relaxed/simple;
	bh=eegAhnVrUCevIMwR4a8J4nvt5iV1r65jSQgaC+VQDZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBEuhD/NsyUfCHS1LTqPtfki5nhG2T0IHflmTTkVuPr/2x1QMoIVllb0hNqrBfy2OUDSUe0h/OqqUQwzX+ezGVxCS9CSAj6rcPyZDABrn2ln0+QkEhM3qKupzkB5igzNNpiGZaj0hN9sFBVFffKHKM/fTMYkyAX4Wdkfg8qjcFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiAbgYl4; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiAbgYl4"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so41742636d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789436396; x=1790041196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzOO1UKhv3FRQXtJhYy1irle0OACEUNuvCoqDtGq3w4=;
        b=JiAbgYl48BPaiZSK9Ktt/CEBX8mnt0R7OflZchHm3l+bxRvdyP/hBYC0IjqmTEhYK5
         D3k+H68vzGwngUekHSHGHKAxtG7KKp6hNGYpoqjNfJuEfvhUWQfghIY6xbvEiTXtY8ez
         YGKutpnFav31gin0uRbRCiZQE1qJOkAQKMywC4I5V6xYGrvcEsu53d0YAtM1MKG+T9Hw
         xbSZwxO4rARs49xDXTPnpDSEZ1+Fvz85kAmVdIqpmeTGI5ozNrXwPNwgjJzsMIWJTqSn
         xN5PLMTApyf6YUxtDOI3RvUylcYQHWwiV6JLtDsGzUZTx0DeZt4sp0el4N6g+BCZE6OU
         4Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436396; x=1790041196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzOO1UKhv3FRQXtJhYy1irle0OACEUNuvCoqDtGq3w4=;
        b=bs9NHI0Qa9ZUYab3FD36y9KSRo68q5B7IEMqErnVZ5NBFnWJ1X+1OwExIWRoQmNudt
         l9OA2R6seVE20iAPsQVzFXsGmKzwj+zuDz7zffBQrG2Uz+JER1bKLcUcptJVVkVjKNaa
         +0YtbOvqdooFC4fK4fHsQ5+2kMvvmURyS3BDPCNA70arMcdYoZGK4n6kB6jWyY/DlfCV
         2OQPHjQe0zoUbTrIDh/Ji3dzSQ0Bcc+M2Q4Fpv3MeijyrdZ/ieX3UX7okWtWHzlKnpzj
         IzhDuugvBST0ziLvE/yCDCeRqWrvj21iwTMRUBM+VvupgAxtAqTBxxu0CkcRtIJ4XMrA
         ee2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXz3ZaWmiujkqbc3uWMOlb0zOn2eSw9QA/UWZRAozdEfp43hMKDadam8u6MGTGCC5qEKeVDA6gResXpyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mj2OJDB++3q0D2igSxlxTie/nPctPIa8xcI2G8UlQQ+kktL9R3
	UBido7C+Jv1XiziEM8g05FvMqIygQ8eLM6HqmSSfpw0HkYHIjD2xQZI=
X-Gm-Gg: AYBFou2SQX2KIzBUVgY5vDQnsNodaSWk35o4IOApYHhxSPKqndsh/6HPZnPIEDlKCJk
	CsCfOUQp4+fvpWjzknJjRI0jN3OMsQPT0ubNFCcbwJ+XUITPuO6hLo5xif+jW1K8H40iuSyyBaA
	DSf/ou6yabz9lglII7CQ65Iezhxxndmgc+zsvpK4hXJWn7K73msKNkJnTwUswhFz8YBm6n4ucZx
	QFtpoht/SPY0JjIPAnwrE3fOq2QDQhSKbx/ORbSe4MAiiWWC0MAL/9nPVBJ/ESGvoWIWIfBWi8Q
	q00uFmu5SERvGha2MamhWHwf7U3r7iI1jsvpKfSjhsJr9equzJkMFoYq6mhbL2XB1pANYohhJF7
	pZFO4LyfzgqYLnIeJPMBtkecOoJyY6bwVeyx+seocRKHtFwL0/zQNhapv76FLSEwCSHgDGA50bw
	CvBlI2cRyQwvbWsCejJ+YUc6oVbx6skVai+WopPnvcCh7iS3X3f/yonJ03tq6k4cBLROEbPQMx7
	aCEoI9ux7ICYgMP23t5CJcvUaCCiFACpgy/MGT0Q9a5u76nFP4XS/ZHf0bdljDiWg2mCxeqhra1
	OWnYltxtxMndVVcDdjoRxNE4LVAT6WPCEcYRxtb6rXPehf4o6oA79uj81s2Wh/iZrYQPWA==
X-Received: by 2002:a05:6214:e88:b0:912:1fca:531d with SMTP id 6a1803df08f44-9122e4cf515mr93110326d6.2.1789436396274;
        Mon, 14 Sep 2026 18:39:56 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4787eesm108637906d6.21.2026.09.14.18.39.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:39:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Grzeschik <mgr@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] net: arcnet: com20020-pci: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:39:46 -0400
Message-ID: <20260915013946.73963-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915013946.73963-1-mhun512@gmail.com>
References: <20260915013946.73963-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

com20020pci_probe() enables the PCI device, but neither its later failure
paths nor com20020pci_remove() release the enable reference. This
imbalance already exists in the initial Git import.

Use pcim_enable_device() so PCI is disabled after channel cleanup and
after managed LEDs and I/O regions have been released.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Depends on patch 1/2 to tear down registered channels before managed
PCI cleanup disables the device on probe failure.

 drivers/net/arcnet/com20020-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/arcnet/com20020-pci.c b/drivers/net/arcnet/com20020-pci.c
--- a/drivers/net/arcnet/com20020-pci.c
+++ b/drivers/net/arcnet/com20020-pci.c
@@ -133,7 +133,7 @@ static int com20020pci_probe(struct pci_dev *pdev,
 
 	ret = 0;
 
-	if (pci_enable_device(pdev))
+	if (pcim_enable_device(pdev))
 		return -EIO;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct com20020_priv),
