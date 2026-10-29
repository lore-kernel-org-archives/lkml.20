Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237933;
	b=gARaU9u2kqR7BYo3X4bsQtAOQI4CF2cT5RSMmNgner3Zy4coVcnjfVS25V7+UOUqHc2w
	 Df/70k2Tbr91eK32aK54yB1C+ufPzml+w4jrRiNn3CCmYXDiKrj77PRE4KHxIL8nCjnpJ
	 mK5XD2N9VXl+M9ECL9KxR/MdlzprY4ebGpRli6fiPEhLv+Rh1iE3WHcf3IXyv+uAcZfUE
	 l8Tyln/Bco25QwKzR3lY9tJYJd47j/ZIoJYREDIPb8GrU6e3ml8bZ9BdXP5oQNpXTR0gs
	 bhGO7IVsr+Tl3QKyHNUSaTgC8WXGN3Hvn2jwJH8UV7PHBEPN9w1DysIv15MrZbrDy2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
	b=JbMx1EsJ3KL9o7Sz5lt3Oi+pwMTVayQ6FsBdyWj5bLku2djH9SGC72or3SEp2Nmoj5kw
	 dXET+jptqVyXRiNKI/00DqITwtIyQqIur6CT3oXcSreXcEMLnV1NnB6Yn8d/y1GVPNdNm
	 +OqjnuM4QBuQWRGqLjHO+XeMvLMbea/1XmBVLFENEfc2BrZdBp1oNHf/l7UPuwvhlQsgL
	 nj0GQ5EaFEDyW/UbpqbwiAwxqXVSU71tGKtIBR5YAsMbVD8wb4Vmsgei9nJ4Z8Xs+gb83
	 xEoSB7cr7gB35+dhWG6uVmcXiFXTPjpXMO/DKtVm5MOYav+R2wHC1Pxk8+8pOMGDVcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6c+IPE+;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2560A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB2560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6c+IPE+
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so122009f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237931; x=1793842731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
        b=L6c+IPE+TusQzbodaS4Y8bDimeOge0wsfqMCW09n1Xz70yNq0U95vP2JdsERw5EuIU
         Aq9f9+D7DXAqUux6+m96MwkWa6k9MknozLsKMTQJHXERZo0mT+larlyUAIvXjTkFVuYm
         Cn0coLa4xlTb1kcTnZPWBvbr+evtFxizLmVV6BbCrrv/oswQl3iBu47c1Fk9XiNW7SEi
         R40Hc4C6LQEKRyArjcAeR7UtoinslXuLkB0cOe16olQBRR+6gmYAqVZ7v1tCeT/TE2s0
         dgVEM1YAG71RjPDbaDQJDAJMUv/nQAdazE4UpVLZLkjjwyzi56d1fX/Iupz7HP7mPYwO
         OlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237931; x=1793842731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
        b=iQCDe7/F7WDXz2TiVgvq+YhIa6mf8zArA6wNHblXmySopvza0xu3+TWqCKVtPausIr
         s1Xpr29W6m44npDfFEDtENnH3VXSz8lg5Dkex0MXJy7p2w6xNY6eppwmGLE4h9fe9aki
         PewhhpWwjj/ahYMIDN+uYzJGZ5qdIheHyKoA+JjkPFtIwGjKofCjVhx7xU41nUHxQj9j
         Y5WGBNBra5uUFlXsUkbRjWROdE2FnR5khjkhXpMSb4D3RC77N0g27pRgt5AQv5nLDSUT
         jFH5JDywpetxLcpkaeDEMGoQCf+kJLLpRqhxBpd1oVcAHHTh99Be3HJzSC/RPlQ8aFT3
         FkyA==
X-Forwarded-Encrypted: i=1; AKwUvBzgNuxNBR73LW0CPrnLmBXMX68iS7+zVesUOMldN8Yox/ar3c9Ty+etTdOR41Iv8PmlB4KAJNPs7eDImbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0DBdHQbvm3FJIFcZKUc36JIreiDXZ6O/z2XGPNnHTkponp7VP
	xLiLe0FW7vfil6mA+bEbOk6tHrLSuRCgJEfgH4Vc6NIEH5hrPPE/8whB
X-Gm-Gg: AYBFou2Tn15e84LhOGyItipRy1haJLNEy24qdOfYiPKEoGxoWu4yyx0N+ahcztM+PZl
	khVgi41vaT5cY6Du1Pj/1xZsppsTBfnnxDK7aWCDlG2nDyfSdt2odus3b6HR/omrcBCke6AJhmL
	F7dNHwZW07XwTtTHOpi8JUSgt01oRcGWlO6IcIijqgpYM4aJPMifY5eeNq5is8sl5jhlFtj/fSv
	yI/oPciyokrrE1l7ezl14bJfaX0ZLoE+ZV3bozSFx5Pq2/mkf29XS+guGfWzGuapOZY6I10ci8v
	RBMlVT1tWiyDizOCcP/fLJ12ueDlTu+tPZfOarjETEZisfzq8f7w5BJi8A1dHb8GpplyNpVndPX
	5pqTgMuFZc3lz+4FKeCYOFgf6/HE+9ZIH+i1GTrzz/k2A7aBPw8fJHsAVNABXT2S/fA/DETf8Xr
	X1T0IqtlegmW90IgDJkfr2Pct9Ho+fuBzsEd09CXiyTwqUQ2/BFWld3BsKgg7WFdYQqj4zYF+He
	LRQvWIoPjlKChxDkkh9qkkFyKCeDjoE2dA5wprGDka9qTXjpEgqniq9y80goBzX0424CvCB1diZ
	ZpJ7uoze9guMo8eAAGK9H4K+1mGvSiwXcwgnkBWbrbdoP2aOBJQHGwOBV9xexVFt5DiBpZEm/Dv
	wvWjo4WrCEH2m4JUk1SG3MwVP7g1vvjwD37584Z3ppD3hpJ64dc5nLrC6XBUcJqy+lq+9KE8F5d
	aUUCpchHiRYlQef4KuAEzNSnI=
X-Received: by 2002:a5d:540c:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e64ba60d3mr2291450f8f.23.1793237931074;
        Wed, 28 Oct 2026 18:38:51 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 2/2] docs/zh_CN: PCI: Update the pci_device_id header reference
Date: Thu, 29 Oct 2026 02:37:17 +0100
Message-Id: <203f4407e5ed5335cda17a74fa6aeac311a572d5.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1793221199.git.kmehltretter@gmail.com>
References: <cover.1793221199.git.kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct pci_device_id moved from <linux/mod_devicetable.h> to
<linux/device-id/pci.h>. Update the header reference in the Chinese PCI
guide to match its new location.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/translations/zh_CN/PCI/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
index 347f5c3f5ce99bade1221f083b208972baf102ec..452e073b8c067ce16c76d9a5a5883532ebce3296 100644
--- a/Documentation/translations/zh_CN/PCI/pci.rst
+++ b/Documentation/translations/zh_CN/PCI/pci.rst
@@ -92,7 +92,7 @@ ID表是一个由 ``struct pci_device_id`` 结构体成员组成的数组，以
 
 该API在以下内核代码中:
 
-include/linux/mod_devicetable.h
+include/linux/device-id/pci.h
 pci_device_id
 
 大多数驱动程序只需要 ``PCI_DEVICE()`` 或 ``PCI_DEVICE_CLASS()`` 来设置一个
