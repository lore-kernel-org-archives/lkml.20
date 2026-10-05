Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D7371D10
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182812; cv=none; b=oqZjx77CXGWI1wea2Ek18+l4G9MbzvqLhiGc00V9X0fz3MH9IQaXBbKXE5EFc5GteUeGWhL7KGY5I72nc70m9egDIVUUXjmwTiUa67GFmCPtfcI4PTxqDBQWrhAoGqp5P7KrYvArqKetw0EuuOpCQ8o/ULgyfnq8a8pnVi3IxT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182812; c=relaxed/simple;
	bh=q9OyI2l21NW11/Gw8QsUWSQEjaNRiUNBykFrHBl3t9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HSqAPt7U/lEwP23Rhenl51e9EzG/k7+YUKwrNoJebC8T4jomw7O83qy3n/EA3HuxAoSY3vGlwgUlKv342N+cHZiqI0znfgiyx4tLUxYIfwaG3yLrsXeN01FLYEVEyabYDpWA++Vrx6oEDUJayfCK6xMQBZvWDd8w/wTWZCpKbAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G59WWrHa; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G59WWrHa"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so1021148f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182809; x=1791787609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8mhPQJ3zOva6jYeHlXj3lH5xzHiYvRbnIJdnEytZoE=;
        b=G59WWrHaVggZqDd69q+dJn7E6fGOwsQk6L7WimTA/qFUhHBcdqmh8+YDApqkuy5DnX
         WfBu7gHIJsBiQQu+hX0SVFMS6okf+UftlvtPo4Kk0ZeUjeRbV9MbiISZxkviWuU4B5DT
         0j5B+5KoxDNJjY3lLPKcgcN/iPPYaJDlGrtE8p/RkjLMHwUqpMcLt3xCqigRNvKB9m3Z
         aerfMILJhOJ3h5AgeXd/35KUQHoOB3s66VakS7tDq5GudzZrb0eVKcM+GqA3uIvhL11F
         lWrmQ63d1VfYgy57XRO//WQs71P4OF7c9xog+LI9CRxw044iZbnfNab38J6SdEkOOlGL
         ov+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182809; x=1791787609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8mhPQJ3zOva6jYeHlXj3lH5xzHiYvRbnIJdnEytZoE=;
        b=rffvwymoxoFY4adlS6TKZTzse6wiRVTcrpW0kvbAG4446gRAGGvwkud1n4X4Id7xpS
         e6LOMv2W/h2fib7p/20XLrmZuQsuWfaI8SCvvrjR68C8c1Ygtudp6WuMeZ+LNjWl9+u7
         /t+69u7DXAEsH53DMIVssNJanwA6TXqYCEsDWCTwIte0OpIND4qA/E0yqGc5mCa+Nuu+
         lPW5uPF4LT/dMNvxdbg8pGILkiCEcQfH9YSJqJlD4GpOHix/Nv8AvYJtzdGHtzPy9H4I
         HJY3zhD5GbNLW7Uo61Qfe4BXpN8LkeHhY1pjbWk2EMDxbKElqKJytbOONh41GDf8qyJp
         8Lyg==
X-Forwarded-Encrypted: i=1; AKwUvBz9+XViFko2lrQHo3w69QNC44F2UNLzNDnpK8i4GXx5R+cGRVHprrZ9z3iSid82ZppU9nzMHdULtrLAkXY=@vger.kernel.org
X-Gm-Message-State: AFuF++nd46Te/Vur8s/FcvZPn7xlFFD57wHCZNipDfXzF2vWORN+avMw
	GizEpQj5YDskCVG0pXEHxNv2SUj6BFoWCwDB3cKe5U5M4lvUz/i1MjWr
X-Gm-Gg: AYBFou3hg0ow0TgnOz/46ULWgEQg3ovSm34xL7HRTe2t7OmvegTeuyFxgaAXJTFEp5s
	vJ/jHYa25mZ67ef12Iw9ElQw+UeWRbrTD43FtpJvtWDB8G6kzmS/Vefe7SkJMAGbiNcfI2x/6bW
	MZf39b/Tmlv069W9rxyyRGFAJhJBQanUrwmxwiHHqRHVTuzhY5AfQRJ7CMRcizpMapV1HgRbyWj
	zZfwoRGGf1tX9Ni2oDVoHbPkLglUtSW0OZv9XZ8TCNF2uqv+f2Ank+dI3JwAZXv+hJ1iY40elJR
	yEDqo/eDWEunXGTfjQdM8zuDXtCqcZNXR+qs5nG5OAR2WGlVQ9YxBRTPhxzO4hvtieLaK/loqpT
	OE4ZDUzFiCBSk/ZoGDPHfC2A0lCclwSj1OszvSckt1MlDG3YLkpyJUMrGVBngtFjmNbnJwJf/qo
	GM8wL8CdBXZ/5Se67XRiDa4dMS1iKTbwTMKyp+8P1mHY9w7k1JoV9bjpFvRDyQrYTDUDjJg7pel
	BVkRBsCZ4BrvPgekqTN5Bhf2V/imxRjG28Ahntx0rI4jcM4eGNRisI6cAXJ91AulukiAk+hso3n
	4dKGMv5TfUkDEi/4lL/7DEkmJ2v6z0D9Lj3i3Hk5zAltzeD9TN3Pi5vEQf218Bva8e4rwP/cRmw
	KIw==
X-Received: by 2002:a05:600c:2187:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a02769a83amr118812745e9.27.1791182808952;
        Sun, 04 Oct 2026 23:46:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm315273615e9.14.2026.10.04.23.46.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:46:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: tegra-vde: set an unlimited DMA segment size
Date: Mon,  5 Oct 2026 08:46:38 +0200
Message-Id: <20261005064640.7776-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064640.7776-1-kmehltretter@gmail.com>
References: <20261005064640.7776-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never sets a maximum DMA segment size, so the device claims
the 64 KiB default. With DMA_API_DEBUG, mapping a larger buffer
reports:

  DMA-API: tegra-vde 6001a000.vde: mapping sg segment longer than
  device claims to support [len=1228800] [max=65536]

Without an IOMMU domain the driver also needs each imported buffer as
one entry. An exporter that respects the 64 KiB claim has to split a
larger buffer, and queueing it fails with "Sparse DMA region is
unsupported, please enable IOMMU".

Set the maximum segment size to UINT_MAX.

Verified with a QEMU stub. Not tested on real hardware.

Fixes: cd6c56feb591 ("media: staging: media: Introduce NVIDIA Tegra video decoder driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 with DMA_API_DEBUG on QEMU's
    xilinx-zynq-a9. The driver probed from a stub device tree node, so all
    registers read 0, and needed a test-only change to probe without a
    Tegra PMC.
    
    Queueing a capture buffer of 1228800-byte CMA heap buffers works
    before and after this patch, with 7 segment-length reports before and
    none after. With patch 3 alone it fails. With patches 1 and 3 it
    works.

 drivers/media/platform/nvidia/tegra-vde/vde.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index c3097085ad9d..6a47e8ba083c 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -238,6 +238,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	vde->soc = of_device_get_match_data(&pdev->dev);
 	vde->dev = dev;
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	vde->sxe = devm_platform_ioremap_resource_byname(pdev, "sxe");
 	if (IS_ERR(vde->sxe))
 		return PTR_ERR(vde->sxe);
-- 
2.53.0

