Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D948246BCD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096675; cv=none; b=X7Ri+97otgf/Kq7/zEaDC4gfqmcpMtmL4onBe/vW8KXjDReyMrDBG0mqD9nmnGo3GTb1Ya153xDAei97x7O+dea1xqE0nAAlbVyupgWC6CXsRH/9RaIkFFN4QRzLFG8OlVPd2+njvxtMenZuP2JuQoGuYRTODRUakCZBYmydtKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096675; c=relaxed/simple;
	bh=RGyinIeQbH1SXwu8QSJD/G3OsD3YwwPsVELCds+SjXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XHg2GOJ7f2C9MG2oHepV91ix76WTJ957U8lJ2JRYDsCZyGeuFgkRTfghvJfyqfemfbNfMf9ugEJ8fJW4hyxohMncRcdPwLHQMZR2QPwKFsAoChwSidOFff8P+hkba/hWUk0GFbMrwIDw4Umnd63kQgvX+6vM6fvsBzUYox20OsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKocfXsr; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKocfXsr"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939695b5741so46046985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096672; x=1789701472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guOvZvhnofpuciLtaF8WyaHhY6OyItiA42hCWdF3Kac=;
        b=oKocfXsroPKBbfln27+llpG1E/SzPpLhR9Sy5RkLGgsPXzKYmg9z+D/3OSIuWQtElv
         OKbg1TAP8Zmed2nPkBw0onQ7kVf6I6XVlFpOZU3uwud9iRGpbxWxt+MLm2ASjULgyudM
         SW8kw8U9CLAVUqS5zS/E1RYWLEvQVM1qRm+HsrcGAlfOi5Ft//wCJrEzo1Jhy5JQQt+N
         cQARGQIhkNC6Np2/PLXJNWYHWv2/r9OVwXCG2W23gFTOnZpyDCWHxPaev3NEbX7qehba
         yL+Ca5JmiFCDqPFKRA6XCxNJL5LCMr9CtVObD3IM9XtHMPwbKJpYvouPWvJ2hjuriJov
         hbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096672; x=1789701472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guOvZvhnofpuciLtaF8WyaHhY6OyItiA42hCWdF3Kac=;
        b=O0Si5B1ydwFF3U/VT6cjssTUd1l/OCAk2WSPyl0hPMUmIc6a7leNQtJlTnb6i3n0XF
         Ya9XnSmv04xyEW4/eM3xTdyiMg4l8ow9thtqMtH2yhmkF++wb9Vixfxtf09tq/V4ri3Q
         lG7k6nG/GvSEh507T5lUqqNDStZOyYfrENqQPJTMX5RlTj1b/n0PCtVweuZhGfgSB9BH
         2yicr8yKctn0hiXvsVgZhqHN+Ira3Z0fVgncB23D9REFvjNEwW80/UPnA3tGylGySRiA
         mOGgfcj7M/NjAsZs/sICe/BTJXvxYdZmY8ezxu9n6Omfb+xYWszMFKjycX4IWvB+1Ae4
         rlXA==
X-Forwarded-Encrypted: i=1; AKwUvBzKWRgUtnfROQwaTvMbXA8B/iU408QxYGD+Qknv6PEhRRNKSb7DnrKQxkJw/7MqQWGL00NdkRHRpsbgg6c=@vger.kernel.org
X-Gm-Message-State: AFuF++nPdjWgAXrjG9gy6xRg8ytIdmrHHVGj8XFyAnUhUpkwcTvhPVQp
	+w6Q365FUjO0H3UPqt/NFq99LsmaacaTvT78rcKLIhEKCa+clmIh9rM=
X-Gm-Gg: AYBFou1AiQsBZsX8GGqtaXbNeNP8eklAtPoI7y0fu8L6M6paAb+AnXthBZ79yKIiaWd
	defW1QAuc5rvHOSBcA3i6gjCORqlFmyeb6c5Zc+EzpAr3sBQUosnvP1/6WjecvCb7QlcGcZLk2M
	KAY3hDX+ikIrg4ZanCw6rpyosi3WRpZhAgQIbP+mhdYN+G13tyDBW86RwhWt0IE0/lsYvZc+bx+
	CS0n84QDxcbqasF/PLXN92Ih5MLFgSgu9egMXtNDCIpJsT+yM0oueiOkCvU0gNTCoRcjetLus4K
	fltitPSS3j4lOcSEUfpclT8KjFTzUdBYfWCmeYdTJHMra0+rjhD+iTDrTxwc0zpyjFZby1dhUz9
	U5qwiiwaFM35XWTitylN8KZGUttpbSEfavKg8qi19hKPYGOVXmGC4QN6iK5FAg1rq5pSwNVroLg
	/TwcJiD9CRzWc91reomS5BeKBpsLI15fXYubgfTCTyXenZZ6AAOjx1LnGHkK1hRaSXqYNU68Yqt
	f/0yK079prJOpAsjw2NAjRw7ityMcMiU7r1bTR9hPXYpsDKuoStoiBzoXUVpom+qf1RITO2LTAW
	U7ZMSax30RlV/OZHYps2Grm9A+DEbz8S0ng=
X-Received: by 2002:a05:620a:890d:b0:936:2fa5:387a with SMTP id af79cd13be357-939ea1dcc91mr265058185a.43.1789096672159;
        Thu, 10 Sep 2026 20:17:52 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm11211576d6.27.2026.09.10.20.17.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 20:17:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: s.nawrocki@samsung.com,
	a.swigon@samsung.com,
	djakov@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] interconnect: exynos: Remove the PM QoS request on unbind
Date: Thu, 10 Sep 2026 23:17:50 -0400
Message-ID: <20260911031750.8182-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos interconnect provider adds a minimum-frequency PM QoS request
to its parent devfreq device. The request is embedded in the provider's
device-managed private data.

The probe error path removes the request, but the remove callback does
not. Unbinding the provider while the parent device remains registered
therefore frees the private data with the request still on the parent's
QoS list. The child's device cleanup does not remove requests registered
against its parent.

Remove the request after deregistering the provider, before the private
data is released.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/interconnect/samsung/exynos.c | 1 +
 1 file changed, 1 insertion(+)
diff --git a/drivers/interconnect/samsung/exynos.c b/drivers/interconnect/samsung/exynos.c
index 8e8f56186a3669ee834c21bb73e13eabf2cf68fa..9a4789fadac2ea5ecd017db12e2cc226eeba4f17 100644
--- a/drivers/interconnect/samsung/exynos.c
+++ b/drivers/interconnect/samsung/exynos.c
@@ -98,6 +98,7 @@ static void exynos_generic_icc_remove(struct platform_device *pdev)
 	struct exynos_icc_priv *priv = platform_get_drvdata(pdev);
 
 	icc_provider_deregister(&priv->provider);
+	dev_pm_qos_remove_request(&priv->qos_req);
 	icc_nodes_remove(&priv->provider);
 }
 
-- 
2.53.0

