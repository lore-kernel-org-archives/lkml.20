Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7038499F38
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903309; cv=none; b=n580YyE3XK18H9HTXsFvQCmFAlhU0TgkyKboMsKftBqNPqXNjdrzlOfLHus9/pk9Aycy1fG2S00ggTRLU6Vyr34mIwE/MqOHYUR5ATjF5x8JT9DVsEC4xFtBjzEZ71d6HGIITiMU7JVqCxVu3f368gLiEzhnirekvw5d5m0YZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903309; c=relaxed/simple;
	bh=QDjh/o/EJT+5EmtaVLbTs0ss1hLQGrJ710TUSyqfmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ih8xkVRm9zpysa2sQ9bQIrnXhc6iVxiLwSAaFMsXT2D/+umoVnSQ4ZIrv7SBofgI0p4aVZ6+U3MXgUAqAgp+n6hYxJ2uG5fY2odTd+F+msTndzLk6BRU7bJq4ezeAes+LjjeA0ogF+8S2nkcD0qVvYHeAQPj2/bsM2wfVDh5P9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=st4aBEsH; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="st4aBEsH"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-939b5ded99dso154577385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788903306; x=1789508106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf53B7+IQ/UMJpYYTrZ14GDqT88z18YWAe/D6JaHkeo=;
        b=st4aBEsHW7i1NfrLpMpkF3zLFb85kFQ/MnrejqSG3m4k/uJ/LPk0R34waRnZZMw1gv
         X7zTxflbU4AVGMQz7jBItBUR9y22FLl+PH5gE7JOB+WAhRXggCwJqZ4+VuU3cVBq8cCW
         lcMiChGLgRe4wTMWvpA1O5e1PqD189DDWX7QX6IuCen/dEIhN9MMf6MQbqrRys/k0Jn8
         rctfaqkhMvmU8C4fxGZ/kz2OgNk1LBqxw9oiihcd9sRSTPg4VTtbxQmkZ8vooThenANl
         Hsr7us/93ShDkNmicoc9AuI3BI86Z6q06hprFv2kAoD56fdGO8lQdgVfeHSeTKqBUvKm
         qMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903306; x=1789508106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf53B7+IQ/UMJpYYTrZ14GDqT88z18YWAe/D6JaHkeo=;
        b=Gz9le/kzLdvA7C147jlABTMGSuf+IVUqY5ql4x48QveNTVS++2KgXdUim0mBEnbkeZ
         O5QZcrgDMeTNP6VjGvte5IBvjnoTW8aXZ/4aAuk1xO+cHraKL67TRutEBMFjoT0aOX37
         uhcfwAKi8zI5RF+4q6vRxstDhzGPYoKaHMkEEXIzQ751NLlL7aPcOLXjetzOswrUK4C+
         2HTRUeuxBFfIbknCOo0KHcy3ZlHXoragtW6+1N6LpGFbGtrMfXdzkJxbB/BWpp2vMx1s
         M7Hl0rYznSHDwN9WRznYMq/eg3zfPbwyVTPalKaK9dAz+ogonr28q0o4pRVn/Z+B1RYT
         jNYQ==
X-Forwarded-Encrypted: i=1; AKwUvByRCGS4lt9jYnmWYsD9om5Wk6IOV48LaQ4ouFaqM9IXpJMvGXkM+YgsiboChay+AOffmRS8dirKsCoslRo=@vger.kernel.org
X-Gm-Message-State: AFuF++k6z7HR6z+2j1xAgq70aQPAnyOZn/dg68M0xh98xmcY38d55k6T
	jPrKvVPgXCw5Dfz3dB3B9D3PR/nnXKljNhMTHBnLZ1IGWtKdF4PJyhoY9WGHau6jAed7OXNvDVV
	myrnlCXQ=
X-Gm-Gg: AYBFou2oVn+AgheKw/lraF3EuktwXSNQxdarMx2KcWWAIP0icjbEJkQuDBbe3/Ld9NP
	M2AHy0oro4qq54iVWoME8lFNe/a+kgQQGPg7pMdeHnFa3K5gTOIoLsFRGScxRjZR5hKH9CTY6yE
	NnfF+GxcyofbFHaUuSSRgRyS6KY/GZIbh1tlMEz9KavsnD+1LL8n+0cCXPsg/loaehbit3ciXr6
	FEoXYXQsIszoeecZZjCDXv4xiUetGo8FSBEF/NK5Bkict0l/pNrm2g9kyGfASJKTV9/QRcJ/wNQ
	MDPZ9dFJbF95woJ5BOllxUvryw9zoHWSvcjRhpn7ILu564gVVWLF+nfFxxjRuGf5GOs5/z3FY6S
	DtoRXg4eMI0KXYSIVofPU++H3gR7kuZgSj7d211FWQnzi4CGTT00qYvY63Zar0xtfumEM+uP5L/
	rMZjW9kfcK1o1x4Fc8TBRpJnwHN8yRaBYT81UcTIgrzxkBZCdM7mUX+KjMVdjkmKVWNodLosjP1
	GQ=
X-Received: by 2002:a05:620a:710d:b0:939:8ecf:6025 with SMTP id af79cd13be357-9398ecf60bcmr2757377685a.20.1788903306440;
        Tue, 08 Sep 2026 14:35:06 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f0734sm1250497885a.4.2026.09.08.14.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:35:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Tue,  8 Sep 2026 16:34:57 -0500
Message-ID: <20260908213459.2519059-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908213459.2519059-1-elder@riscstar.com>
References: <20260908213459.2519059-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags variable whose address is passed to of_pci_get_addr_flags()
is zeroed before assigning a value to it.  Skip the zeroing and just
assign it instead.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 1caabbd4c18b5..1e5d7dde467b8 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = 0;
+	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
 	if (res->flags & IORESOURCE_PREFETCH)
 		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
 
-	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-
 	return 0;
 }
 
-- 
2.53.0

