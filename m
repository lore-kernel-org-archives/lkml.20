Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26793AEF51
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288692; cv=none; b=ut5TtI0gDq4LuoB3HGtVtJAi1RsAXVmqd+a7/XBcCS2kB4/nlNzHZUeg9MTgsu0dmVIcGtVqbQSN+U5lVUsypFgbiGKsOCM3LRcyeqVxG1tGKvh7TCkvNuZtg8t2CuyhvkH3VkM6NbmJX2d+JQTF35xYDv7ylUPAl3Hel5K7PHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288692; c=relaxed/simple;
	bh=ucLMqZ1UiBxVGeoeiorG+3ar2kSDUn+x16bRZmYSIRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjrjWjdo8QQoY1TIlfdqMYJxjHtriC8TSgG+9wHm2Qvp5X4dnIOOFZN8WwiWlttLFAd4r+K6s0raX7LjOwu1a7ldtIjJ6SeIlx/vypqxyt1vkHGWbpOvKRi4UPLgdE2qamsyagDRXiq31/XyeawJ6VStK3tmn0+rPBPwnPQ7ddk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=bSVxXmnN; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="bSVxXmnN"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so41998085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790288689; x=1790893489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4YnIQUduM9WqwnHXJR5IBSgzIzuiNO0FPLqtzOsUaQ=;
        b=bSVxXmnNxYxEUypEfFbSDgxaAsb3mpfXI9FsJmpdofVWTJPjrYaChdGFynmk8t1t1I
         N8+Msknm37AQWsi8TnGnSGOqLK8CFTds8fVPCx3SRdngr2MoPX4asEcjF7xtF5wNu5hl
         UPMhpoTKKG7sY2lnADUwtSImOq/sW4KdphwzNUqXqINlG7CXxdGdhQW1NBtKEMqTtbCZ
         RcSUqL7MgfbRnHYov/OvMimrUrtzSSENr7I2UZWLsd+N1hmQNfNgwIo6vAvafiTIW9vU
         j2TQ1S+Fa7/X+z6wbJQJDo1EZ2UOHiFAJtpHRhCvpULO8dQABotyMH45Bvyq8hy6Hd4t
         q9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288689; x=1790893489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4YnIQUduM9WqwnHXJR5IBSgzIzuiNO0FPLqtzOsUaQ=;
        b=LquBjOeH6h2j6eWwuPfPxpc1M7T2QzWTUh0oVyhQElYiFIOL3rEjskEQEkHBdzB/YP
         Vff2anibKP7eSmh9ImHqYAZUqSNJ0erJe/VUaL/6thOeKGSv7ZCaqil5Oq9ONnsGn2gG
         Vzh/HtBr7MIa2wwMw/s2Vxh40SdLuzGsY9fWr0sGGGCPyG2Egvxutzvx50kCAHTDmBvs
         ojfP8Mgkt/nJ1O3vyE32YfR8bsmYZMVPKGn0GRb2Ee6n13f5X2cSltPvmxObJytCLTge
         q8A4KAeHxHOti8ooCkDh2bjthpWImPoC1TBaq9n884CtVcLsYuwxjKW5LPMXSxgErdti
         RXdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK8wyQa6hZRMEqzVm9vtf/QiZG0hXRvtqYx34ZJHH62JCcJKKPSXd+lSjz0XXpzw+jtKH7nW4fIGNdCnU=@vger.kernel.org
X-Gm-Message-State: AFuF++krzrM8Ah1BP2kJPOWbBguHuswd8qTarCMkh9xnM7uSFQ/wB/3z
	JrDqgWNEehrBB8s8UUVSRBgfw7bBsjPHfrGLO4yTO6gLwtsQ9QSYwSXHKVePIRxWtaA=
X-Gm-Gg: AYBFou1f1AyIuagFgvEI2aWPHWOl2plLnwdxb9RF2Q7h8nXVjc9TQ0ekE1zkHTyd7bn
	5r1M8mBCE3dnTfivKLIirH7/tUJhA4PfMdlVv6uXNPyjmG8ziMN+hHA8XMk5uDDBAxTi3qQ6bBq
	lkrK5Gkk5mYXollXq5YvP82RGGVa3tQeGY0bqh+J8hs+UYeoFVfoX2Y4O7XOtxEtckci7cJREcq
	3KDTLXfBWKZAOrdfnCW28+Rj0TP0TIfT0EEtsG0hm/Ol2j/gCkyVd99CTSBzEBJJLYEeIcQIXQN
	xbThp3qKgHqxzIN09anDvBdlxYgbFpsRQRaxCGMo6qFxRSR3pKQAnpxX/gPtZ4l7S2mznZkkYta
	Q/dkY3CxcVmctjsVLNH3fETGWmxwwXAeQ+Ag8vv1t4QMvO+6VMZGWLDP3Ajss9s5ytlhxmFlJFO
	XV46JslaYO2LekoAfCTxXXpSrakgEfJS/uJBhc3fTwGYKSNYMHsBJaatD/wLPUtFgv1NcAmOYeC
	SU=
X-Received: by 2002:a05:620a:3711:b0:93b:e578:5838 with SMTP id af79cd13be357-93c43b86652mr142688685a.12.1790288688837;
        Thu, 24 Sep 2026 15:24:48 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430eaf5basm3516496d6.44.2026.09.24.15.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:24:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com
Cc: lizhi.hou@amd.com,
	herve.codina@bootlin.com,
	andrea.porta@suse.com,
	daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	mani@kernel.org,
	robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] PCI: of: make a flags argument optional
Date: Thu, 24 Sep 2026 17:24:41 -0500
Message-ID: <20260924222444.1351466-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924222444.1351466-1-elder@riscstar.com>
References: <20260924222444.1351466-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The address of a u32 object is passed to of_pci_get_addr_flags() so
it can be filled with the computed flags value.

Allow a null pointer to be passed, so that the validity of the
resource's flags can be checked without filling in the flags value.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 1e5d7dde467b8..a6c0cca986bdc 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,9 +82,11 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-	if (res->flags & IORESOURCE_PREFETCH)
-		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
+	if (flags) {
+		*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
+		if (res->flags & IORESOURCE_PREFETCH)
+			*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
+	}
 
 	return 0;
 }
-- 
2.53.0

