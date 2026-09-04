Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A2C4A1E05
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529578; cv=none; b=S9sccHqLDTJvXB0Mx4RsS6DddpAUMVtCpy7Kl0h0KgfcVYjwr+kMi7PswAtO1G8HGwp/+bex2D7Fkr6u/SIMMlXJb9Okdvej34zjAp2lUCvqPMthnZXtT83gzTCKvPbd4Yq9l41/0HLgypsUGboujEjYRfcyAaBD4nPszZxiCOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529578; c=relaxed/simple;
	bh=qyD4bGNfcFSzPNaLFl2vhb3CFKp/crvP/9Jaao9JAyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBZGJLR1yB3u2xxPKMYLpShjOFIEBaS/H175LR8U3cFtFc/1kie1gxIVBfU8PxT6FlfwmgIwUXekntofen4g85nXxnhaJ2sOSpk8GycKex+wUpxcMqCatXof0Mgrjy7rCup12o7TgUeTgAPPRTowAKbTv0gqabm06F/LzyQrdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=DK0H3ENh; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="DK0H3ENh"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-529a1ee0e62so13511461cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529575; x=1789134375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAwqufnwuKEV24w71YGykBZDHshBllwrVOx0ky+yHTQ=;
        b=DK0H3ENh98CWzmnIXzijn6sJ2jQjxAY+E1n+HO+SSMMbr0kgljjb0FRr5UTKghzdCR
         um6tA0pcevfnV054cMjT9n9B7GsixdFl5gdHHZpUJXEG46XwXj4y40MgwZngrYfSm+6Q
         eVDT4fxr/ot4bRDwd+ucMXK9Na/zujsUkl4hYIlYiSYF/pW1UfILn9MI4O4cXJMDQJmk
         W95aptIIPyk2aLfiSf37peeQzF1cm79FwydlcrELrBYpV+locayjGI+MeJuRj/ASVZBu
         XLt+yY/3Yhxk4e+2DOPvkcos/a2VZXp1G6FYbPglSI5ZZx+P0UF0WmmJ8+VQ5bm9867W
         u+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529575; x=1789134375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAwqufnwuKEV24w71YGykBZDHshBllwrVOx0ky+yHTQ=;
        b=eTWbZ9pyWAJ2dL1w7Yy6wFYLvSLom54gADD43E0NdKF2O9UU2FtUGt+101kuvkUAa1
         HAki20ZJdVbmGolBG7/g800PKzp1P3iBSiCRwvCfd+n5Hui4M22qJ38Fn9D4xuURrLVd
         bKBs7MCSgjBW5qX8O9DvxmKTGdIINca4mK1BHx9Ci26ad+05hs/sAcVzyj70//11QSal
         jze2HK1iSKQAbYnnR2HbVoS9x/Ao3ZYNb3/ajSWRND9rMorkrhO0RuHbVuiHjm6XI1/Y
         8Kld9DW3+YTEGV3dFnXaGml6GckDfX5xecLgzOFFmZdXusJ2tjfvsE9G218CkXMJ5RHS
         3Wxg==
X-Forwarded-Encrypted: i=1; AKwUvBztftGPxv2u0IiHgKz3dkxD9sXPVAoobe6c+C7Yv3PXOjPBYmJX2496yQBU3VpqHkUxCaeUv2o4RxjOgDw=@vger.kernel.org
X-Gm-Message-State: AFuF++nHIpGu9g0EUj0qdn+ieDnlSfnFDkMQUbGuCgIosPJg/0D1edIB
	6VxlIJPjViaBQqdvMPKDcxx3F8ZbeYxDm5uxfkCkbl8OKfiLHXaw4lt2fh7deP4N1Fk=
X-Gm-Gg: AYBFou280BT//XCgzRaB7MdNBfcbmNn2IoiCdxv/4lzPvdvf/MHLbQvNIwch9JcnqRP
	anU5GrtxgBSRJ+qqFCT03UZqA6x5D+pTt79DCYgQWysw+GS3tL+uYSk7BpfnrcVLlTjKGMs5dJ4
	kEB7sbsiiB0P+JHNcksj/yYvtMomF5vbO9t+UkxazGj2BeEPA4QK2TItYwxvI3DPBb0/AL6ccGy
	1chtG7/X2DQHuQfYe/n9tXPr9AU3d1V7HCgk9+SSr3Niv+YrpPEDD/dHCN64yRY1SWeJ9u4FPgN
	xH+lKRCG01zkH2ej70Ck36/LNz8XPfFo1o0bjlQfe072Qo0fHckGv6Kcn11O2AADwpt3gL8P9OI
	ninIlKnfYUl03bkFQcyLYFrZK7FERwieeSz0Y0J07TfYI59ksPbAFWnVDMm6+6sgMbpVdaqRwjS
	DlUDoTkzpW3YNS3bfW1HGvzj8Ssf9wy9910YeKWQzHk5AJT2WEWzW6QvN3GjE93Gt1
X-Received: by 2002:a05:620a:a518:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93980434f3fmr510380985a.27.1788529574458;
        Fri, 04 Sep 2026 06:46:14 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm211613885a.14.2026.09.04.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:14 -0700 (PDT)
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
Subject: [PATCH v4 3/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Fri,  4 Sep 2026 08:46:05 -0500
Message-ID: <20260904134607.1856121-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904134607.1856121-1-elder@riscstar.com>
References: <20260904134607.1856121-1-elder@riscstar.com>
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
index 8131aa1b0b3c4..fca522f70187a 100644
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

