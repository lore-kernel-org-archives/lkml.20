Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBC49DB99
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262156; cv=none; b=mvsVSwnUb3OxHr93M0YMkGNapu7n30dBFVUN+zhX+bZpz25g451mhwMQcNWRPufztyKDgHuKD5dDWNUcWO98nKlPBhtblsWYsoLjjmt1rb6RXX0T/rQH4yPxMPYCou5m7CakpWqODOHC//lrHezc1lTWPIYdHBlEbBRTJLhKgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262156; c=relaxed/simple;
	bh=QDjh/o/EJT+5EmtaVLbTs0ss1hLQGrJ710TUSyqfmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO8D7sYMXtNj0IbNe3inx6NecdEF7RQlR74oLcChEeCyRNiVpoYnTRJxTWyUhJLDrRLWN734xFQKuWnXeop3OB18BFpYh9n6np5fQTcyh+DEkxUC8p/Tab4NNGiOVZ+23poaFZ+CCoUem8jN5tIeexq7ah8+2Y1nhfeoQyxlVLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Qgl9uDrH; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Qgl9uDrH"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564313adaso769777137.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262150; x=1790866950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf53B7+IQ/UMJpYYTrZ14GDqT88z18YWAe/D6JaHkeo=;
        b=Qgl9uDrHSIv8lbifsEPuIq/c6HjBnJym/e3UOXa9BXww5Dt2g7LU0XIdIVzHUMwhXd
         G3zRw59zuN2nCQN31f3FeC1lnaMiqKrNnKS1mTQFx5izodAPVk4ueNp/1EfXUNvxM0i7
         7NJjSaq5quddGYTKGUI17Kjort/TyhQhlMOQVUhVqaGyqs/HBOTxw7X8cqJ9HevaZWAY
         V+aQLx9ixHLLScIlAvjcPAhBKz0IQnyiIJmrKmw9x89J5I8wHs783kAdPCv3Ih8s3N0i
         /t81pRzl6zurc2Xo0+GVHLlXaZHOUDkUYrZwEtjLjj1reamYEX0PohgvxCwmvqskrsbO
         C1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262150; x=1790866950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf53B7+IQ/UMJpYYTrZ14GDqT88z18YWAe/D6JaHkeo=;
        b=lQ0++Oo7wTN4bu2LiUUrnpPhptHFfvIuzxocC7Bs6ckezSnRwmD3CiLW+94FLSjir7
         EPfegkVXzCmDVaHZ5PiLJHgYM3g7WPU0oR8itK3b4fv62omjtwI1cLm+vicrsmVftQ1w
         wFypFiIToz3lxQeSIFvqmye+v2SWVmNU7KBqr3kP4SrdfnjlREferI8w8cGS/bLpAJaP
         Kwf0ekCrFs352TWUFI+8Zd7OUAor5mMvkqzCvrQKK915vOw0f+nw7jjtfoYbQoYmRAdF
         nT4rfks6zncw+zH0LPlAmKi2yYRe/DXqjb896zTA45gXr+9MUg6Uh6uM0n+5Z3c2Ac6e
         v9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBybNTPwdn/2OBNbxAVWLCLyHYXMAsQ8LjuPokXFy5sNahy++HlLMpNWDyl/1TxtLIVPeZty6+VoyFTouD0=@vger.kernel.org
X-Gm-Message-State: AFuF++kVjD2SFptMM+eoYfbHL2zpbpYLtN8F1W/INTs3+OCi/UUkks2E
	cq3dW0uydInd1pHtgwPwVqueGp3VFQS92Rxa+IX7KAPnIe3rTKEODDU/ofeQbwHpAE8=
X-Gm-Gg: AYBFou3DvkOlm2pgPcE2W5LRF4op2yk7hnMe7tZZgCbC2iyYch02MRJ/yn7fA1D3SuO
	WX6f1biTDfTmMH6xdIRn2NAqNTekAXIlN2Rxblz1ljQBvQGjRx58OCypx7OJ3IUIE0Xzna3LTQF
	vvKJpvj57MjXnuCVfedKgrRrPamZ3vM+w9rSb9WR1EhzCqcMZp+4IL79cIbzTolC9zTBYBfXXF+
	wUb4VTx/huuwMHcPoS4/bzGdKInldXV5d4+u2ocoHSRcFq3pe52vOgnLtQBDPBZ9bV8QiIbYoQl
	OJ4oRIQyFFVzKRVa3b3401FpcAbKRH019jyviOHQjX9BvIm5KFoFrxjhzkNVm7WaMJpm6vOhhfY
	E6XC2Ja0rzhJqHsDKZkh6KkVbess+lR5tnE9WuEbmPTec0lL3qcpd4evLP8FUHlWJtuTpvjPPy+
	9kP6ggH+YsuA3KqRbGpfzF323K+WDuG4/Pv08gQIGiTlGxH7KTDaYt7MHLE0AYSM1ElTWqXNI=
X-Received: by 2002:a05:6102:4b14:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7af1cba3036mr1226812137.11.1790262150404;
        Thu, 24 Sep 2026 08:02:30 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e24e458sm18438236d6.21.2026.09.24.08.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:02:29 -0700 (PDT)
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
Subject: [PATCH v6 3/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Thu, 24 Sep 2026 10:02:20 -0500
Message-ID: <20260924150222.1179235-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924150222.1179235-1-elder@riscstar.com>
References: <20260924150222.1179235-1-elder@riscstar.com>
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

