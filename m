Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439537;
	b=r+aeovu4VDLsHFgTAwkdFZbzTUA5lV+KaXGJEWTzPahz+mwqit8PruAP0czsQqq9h9c5
	 2sxLYW7rMS4nXXEygvPJDD7MmpCuex++XhxaeDqruJpiQnt/tAu6O1CvYfGweYFMf8KCG
	 CFLnzIYmeMUNRPekJUxnSL5iS9WHNZ7c75cs1/TYrAtPHDQT7oASuJjZZAu4GA6MRJXha
	 tWY48asZXU+FVFYIJMYb+VMX34QPSVlrHGmQGK2dOHEDUaUMUFtMYzm+Pikz1SiGoQB5F
	 M8PL6vI3cx5uEIk+T1y0/sFLtfBjCqMn9VAYsnaYAQKPUmiQPI09fYvBM5fIcNvgpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=48wpzd2rRuW6jSp7Tlrac3vDJDtgbTZqBF+kHuRo3/A=;
	b=HRsSQI765uKd/N5ySFi0kDGucs211iSiGhEZy3F3xMne5VqsXMgnrktIwaK7hcFTriyI
	 BI1ChnM0g30gzIup6crnp/iWi2oHHtY7i85jJS7t50xDHZ0dUFTrnFILKAGSboqPVymiq
	 rycnpNX/BOawtA67hcinbvecKxm+dOjo0UwNp+1V34Hu/BpKinIvUH0x0nMR1lKEsCa8E
	 CVyLZf57BD0loodFjcOlbTY+KPn+nmpGoeNQKwoXRa4HUnIHEV92nQjjG/ZaqP9HFgwTp
	 SEtY0HTMyBVMxuuqYJj7v1CePOr+At0BhblFv9jwEBE+rTy/Cwcy9m1R/+ybPtLmZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F626SGWm;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F206606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F206606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F626SGWm
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso2821057eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439535; x=1795044335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48wpzd2rRuW6jSp7Tlrac3vDJDtgbTZqBF+kHuRo3/A=;
        b=F626SGWmtxKJ8cQRouGxWZfd2oKHQGb5C0wqkYnagzeeDuzZuq35L1IDSNMek29Gbm
         jjV6g15QjNix+Wxzi+SEeMPH6mflxEzLRXVC2wptnYQEncIBjML3C1xEtIPnlcDDk288
         Y667CEWU6m4Faoxc68tCVVqOb3EZSTjdnP8HveGT4mOxveRnpHH+vxvYJHvrmLwNKpVB
         VNQOhkmks2dhO+Y0g6JWYNZs0TMEQm+lJIav5ta/pxoR7AvkX8wszblbWVy00Je0DbhM
         kxXLMT0R15OsxjD2mn+W/nHO4JV17woJ6EDHU0oBTTk81WyFf2cQWeXFEgnZx2aBzo8r
         Aw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439535; x=1795044335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48wpzd2rRuW6jSp7Tlrac3vDJDtgbTZqBF+kHuRo3/A=;
        b=viGokdRdwEoDLubDZ+4vpRzQnD3FQ8SojWPCBJY3zABnC9gyYCHChx27ka+oLhvsJu
         0ziQ8P2S+LFxoFm+YrdkUOPWz3MWht76zCuxX97tR914W2HO/HFn2GDH2fjiFx1CoBb9
         GA5v917cTo3uQrezZN0tAjd9EIQ8R69rQErUEEGz9XmUQzYviP16qi8IJ2z4SDtNks9B
         bppfL/BIvxk5QrPnGiNdLjzpLaS7woOqmiLZL6/UqoifsJRufUTuwpua/PrTf0kI7/Rh
         tHn16+Do2pBDby02tGoWw1FtPvzzr6cKFLYdZK/8oO+y2dIpVU5myRL2RPNz3laUnZFJ
         NDcg==
X-Forwarded-Encrypted: i=1; AL+hErFyyycfWMbn+53yqFfLn+ok+CgRIH0KRy/ie8pOY6H2XsbRepWw7iiFNcTeCPIcGfDuTpEmROQ9eXIV9oM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JJk4KRrXbACkl8rPyQIlkzohkV1mbQa/MiKQ4WQ4TQQji6Axd
	d5iVAXCI78EoNC12trgnWPNxqRgqjs87oK0YqJB6y2N1LI/evUlFJeFD
X-Gm-Gg: AYBFou1Kdoy1dVIcnBX2QTlJiGXpsCg+T8tuy3vtgyLN7is+naNgfddbbPdq3L4DI3k
	pXprN+039atYVPqyM2TjTsQiNuhcv8q42HNdwVR8bVdxcnkoWXUsp7oR3/sSqVKlM2wRmfzHbAS
	kUn6Quh7ORkGQG4NLQKgWkb4Tu0+WoJCYOlqf9waX7dBgdTfYRplzRhSS9rjxgfWBql0EVsKhEz
	Z9BZkFB933vhZrYLOMiXj4bE9ugKylOVYoGQF9jYf7c0PtA8XsQ6yT2knN7YQ6SWsBI+ZotHWIC
	06h76YM5C1EeSescmXlo/sFEzUGITPHTAyc+b9IWaEeckTHv6dke9yWAZ7FqQsajkeDRteCc9yZ
	Jq9CyTX76vCP8y+fH1FeWek9dpnMyH1wMjFTNrfKeq9WuXMP6+irkYWRkIiSGl6NmMTFuSQzZ1P
	bmqOtSD1zGxJtiQbHeX1sp+1MyXX+zkuTcSH8MAVrNyw07oSOsnQ82D7evL+Q1rt9qXdogPJm4o
	xXGFrw+PyrCdJlHGv0vLho9C5nsv8+12ME6dLmvaOkjVetF5HDyq7pdJ//1n0kmQKP9Pl5XinX9
	5e+4R1Y+NE5NRiz/NjQpvTaxszDXyxmWM9bbaexSXw==
X-Received: by 2002:a05:7301:2901:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-37686278c31mr5725653eec.19.1794439535470;
        Wed, 11 Nov 2026 15:25:35 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm22626946eec.26.2026.11.11.15.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:25:34 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH 2/2] Revert "EDAC/i5000: Mark as BROKEN"
Date: Wed, 11 Nov 2026 15:25:29 -0800
Message-ID: <20261111232529.407154-3-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111232529.407154-1-andrew.luebke@gmail.com>
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
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

This reverts commit 7556419180a3 ("EDAC/i5000: Mark as BROKEN").

The driver was marked BROKEN, instead of taking the slot loop fix,
because nobody had the hardware to check it with single- and dual-ranked
DIMMs [1]. With the previous patch it loads on an HP xw8400 (5000X) with
all eight slots populated, reports single- and dual-ranked FB-DIMMs with
the right size at the right branch, channel and slot, and stays clean
under KASAN and UBSAN bounds checking.

Two-channel boards (5000V/5000Z) and error reporting are not tested.

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Assisted-by: LLM
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
 drivers/edac/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729b0d3a..63f263c4263d 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -218,7 +218,6 @@ config EDAC_I82860
 config EDAC_I5000
 	tristate "Intel Greencreek/Blackford chipset"
 	depends on X86 && PCI
-	depends on BROKEN
 	help
 	  Support for error detection and correction the Intel
 	  Greekcreek/Blackford chipsets.
-- 
2.47.3

