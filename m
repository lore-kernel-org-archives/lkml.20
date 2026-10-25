Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792930865;
	b=oZmBt29fowNH5MVDbf4bTUYRYT/onfq4Xm3aH+16GeC+oCr5EpTZescTgSp5taoeVUxG
	 LDG3C6r0NlwG5CzZ3A0UVpkefbHWGB+IAfA3OXu5Pi7R2T6UnSaDcm3K1ioOgOr0n0GEp
	 5UWeLgC/j0jYN6K7uzLtvijJtBfb0Dr/U8ZHoENhRFThFQspzwoVhROgyPVffF3ymZyiF
	 hoDPhHwTTNxrq3afqWmu3eZLObRB9NXnl6KTUx86CTRxZkzuKHVpyanICq6e+LyA4jlR+
	 fRcxCB2MaIKebyCrD62pDr+U9kBJ8kRiHP/tgNjZ5f5xaQjdqCdefjthNTHtKZFBXJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792930865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+ZfunJX7uiFWw1t3Fe2ApCZEYaOvg3p6Z+dFnZzVUE=;
	b=gJDSk2R+S8MBf9pFE2Bxn63vQe3me5ouA6pAQ9D/ZSoTA10r4WPOoFnUaX1gHV/5PSHD
	 hbgfPvSZcrhLTpKQ1y4H6ond3glLJ+o69DDdJYU1bAQgwhyVifj+QtY+bfRhyClneBkga
	 /yDoGPcfXCKFaP19nrK+xMXw8g1BXcciFZF130mSm7EanchQYd5G9lcBhKe5umnASLmsI
	 aQL13A6nZqPsYl1UjkrSRk1+MfAvgh3oIVqh9MBBsbxAEBXl/nNXhIqdsaAgRJfn71vr6
	 x0fe320NL2OOX2TP1736VHlNQOSzHNZuhw3X2CmFE/CK1XKNjt6IAMWJ5Ek4KyDCorA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EiwZ3045;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7444606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7444606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EiwZ3045
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2019999f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792930863; x=1793535663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+ZfunJX7uiFWw1t3Fe2ApCZEYaOvg3p6Z+dFnZzVUE=;
        b=EiwZ3045dE4z2ay+Cb/0NB4WRI48s6ot9VpH1hro2Ee9SQ4bo3olOumGjBnxmbg5jO
         wLJ/wyjbRmnDTH+HbWZ+sxHnBZGS0WW++wQc140B5LQ4xHCCbVzgeemvw8iY0myGFsbc
         jZ518VbNzsBg6x6GUQxea8kaylxRoCHkQzb1+GfTak3C56G2D3mmrSC4bJyISueOTR+1
         CLQNRfYE189aPoU2XtOEu3iKjvntOkUWyIVu+wa7rWzmLOQQMJAcx65K7hGAXHfoNnoC
         9DpKKsEr2elaW3LG59gay7F19UgX3xkYMnmYl+5RKNE6kKdLwvYa9xQUB0IrFAT3DbBk
         DBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792930863; x=1793535663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+ZfunJX7uiFWw1t3Fe2ApCZEYaOvg3p6Z+dFnZzVUE=;
        b=korqkcQdPqkvwCv5Ic/pvIbmhiuNBS/KNxaI2CPpyNIGZ436x9xVCAv071gD5/Ur4c
         fM2u1pk2OJaWcYO0vvQzIQj4LD+tm2mZbGorP8ktMbuSx1VeJaHO7xBtwxBHeRerqviK
         3gmpjtcYvS2BdW5e/ehgkAMV1vKtBYgEMFAqVwIe0tMaeM+Tuq+hJ83pCRLyvSKWQt+8
         2Zuc8TLK/wgEEcKa0eh0KFbJ5SAbTKnhcaHKLTqn3KI4J4XcjZvmYnAzeJL8oysIMmDb
         Pd6mYnMuID5+tHW+814w2/bTk/t6hqLWFVt1xbWvHFRKMTfFLdB64xeY4HmPXJ1Svh8o
         V2pA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2GWVsubPAYZI5C7l0EIxCUK7Ng1puwUZXeKMnP6fstrdj8gQE0AA3tCv8Q0JvfF26T2asVcf/gl7V7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCR0gtftv8GetBIJKTG1kkeQDAWXOabQZs2DdKIqHEyKSgj9Ei
	rrOi2QJiR2NF+1XcBZGSN3T4mJ815DSX7ghW27O3ZDyFqtcURKe9ccUD
X-Gm-Gg: AYBFou3fS9WOpq5X3pEo8FhG1XpnvDTspSgrHazIYg2OJcUaBNPoM0i5MlLplacCbPb
	x9k+6hcG5QpCUvyXphfWxgqRRAtdZAed72sDjkZpYEZvZOCb9yn0AQ/EXcvl6gx14UZ3BO0u69S
	ATj3z5HEApYZ9VVkHF4UITBvd1/Cy8D/XC9ZzduCCwsu4Q4EUdOyDKazIoP6NeboPsVeMFCBa+j
	nMDud2KlyVjU+lhTfLij3zC/P87vRpuFveIG1+GAX3xq1Sd0Ewi9xkY+43RarTfmMp8mGKGuWqs
	3BYYz1F4hiodmGLsht8JXhwXC1++P+LWJlI7Ru3niletW+uUDvKi5PykSAAcVRL51dqneKnQsvS
	2rN2+Lk30zUmRZV2ulF+jSkc38xKc9IPZI0XLKLagXzk6mgtAC+U0tB24IPvDN20MFrPNTYXzsf
	Bjw47vY6oFClnd3IdHwb4SaIsMZWkXuF/1jJZja9s/7hXQByDn7jyHKW8Typlt9BfSHu1tsxgVC
	s+NAuwlNNtKfXYCrwY+ZuZFysHd+ipxdY3xEuDMiumXc4mJcGbQGZtXWxO+SIabtJEx8MarF0kE
	N6ze0LsDhe2mwn+wVA==
X-Received: by 2002:a05:6000:4a0a:b0:48e:37dc:7ff8 with SMTP id ffacd0b85a97d-48e3eb84d10mr7185536f8f.22.1792930863084;
        Sun, 25 Oct 2026 05:21:03 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:4c6b:e3c0:928d:b2cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm10865770f8f.36.2026.10.25.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:21:02 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] irqchip/irq-msi-lib: free wired MSI descriptors
Date: Sun, 25 Oct 2026 14:20:58 +0200
Message-ID: <20261025122058.2180685-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

msi_device_domain_alloc_wired() allocates a descriptor for each
interrupt, but wired MSI domains do not set MSI_FLAG_FREE_MSI_DESCS.
msi_device_domain_free_wired() releases the IRQ without freeing its
descriptor, eventually exhausting the domain. Failed allocations also
leave descriptors behind.

Set MSI_FLAG_FREE_MSI_DESCS for wired MSI domains so both paths
release the descriptors.

Fixes: 64a855324311 ("irqchip/irq-msi-lib: Prepare for DOMAIN_BUS_WIRED_TO_MSI")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/irqchip/irq-msi-lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 45e0ed3134ce1..a1e12aa820e7d 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -75,6 +75,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		info->flags = MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS | MSI_FLAG_FREE_MSI_DESCS;
 		fallthrough;
 	case DOMAIN_BUS_WIRED_TO_MSI:
+		info->flags |= MSI_FLAG_FREE_MSI_DESCS;
 		/* Remove PCI specific flags */
 		required_flags &= ~MSI_FLAG_PCI_MSI_MASK_PARENT;
 		break;
-- 
2.43.0

