Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA84A3F2B;
	Thu,  3 Sep 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437443; cv=none; b=SQUX8OU5v758giX2UyF7/XGB5amD/PjNzJi+gIb3f/guEbWUh76jnr/QbwSk76aZ+sFLhUP7zhpAjgi8428HdQJD1Scj8ERNhwo7KgQwiSN7XgNSocN9bui703ytyiAkgcSozCaXGU4gb1HZiQGtPs5zC4mOyakpneu7rbenZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437443; c=relaxed/simple;
	bh=1owev+xK+tbBrZahEKLUE3lyt3+x00cAS8G6pcnn7Rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXUgsmGxuTs1RMuQd8NYw+vwLJ02+hViJiO8Nyg1J7qKcUfAmyUnFoPcUee+9QX5c0/0ogaQ+/UOJfaKYxZwAcYR/5X0/iyEUTvO/Y/9p2UovttzU/D+DhDUqtATF4IEtmVrvgrEV12+AQ3ZYfVYsr05iIEUm61sF7tCH9W1KNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gIoPtyBv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gIoPtyBv"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B31EC4C35;
	Thu,  3 Sep 2026 14:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788437337;
	bh=1owev+xK+tbBrZahEKLUE3lyt3+x00cAS8G6pcnn7Rk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gIoPtyBv05yEXCNHJvkSg/NCXnaVCHq2hV5xvXdqmlqPa3upxYyhnwE1naMVCZXi0
	 1UdzHimSqguTEJm3aAIOpVZ6SXzyYPhF7HNzM7wCKgwFHOTlWeLNNjhuw0t9I7TQL9
	 CuNntT/JKefdnUFLhrjqqd9OFv+rAIlH68ZVkKkc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 03 Sep 2026 15:10:00 +0300
Subject: [PATCH 10/10] drm/tidss: oldi: Fix missing of_node_put()s in error
 paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-tidss-pre-beagley-v1-10-93928baa8b12@ideasonboard.com>
References: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
In-Reply-To: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1owev+xK+tbBrZahEKLUE3lyt3+x00cAS8G6pcnn7Rk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqmWOpbXfj3o5ITekvXG+ih/c+YGnQm2o9kURAk
 f7ZWBTgnjyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCapljqQAKCRD6PaqMvJYe
 9b9HEACny4WaBJWDBN8FluF+irw2zdbuKjzQc1MDI0FjsIx6XLUevscfrvWYQ4c3IlKqW1YjrPP
 Beadpw2pOsOW/HBuf1MJ5JIKzE5g6i5IAjLy+EbTZQu1xC8Bc7KgdpF6OHLuNOwlqgE/UqeSHPC
 rFkKvrK07BKBUXegeO6H65vzrDTqzYgDc5U37bA4QFABDHm0paSZaKTzPf/mZo5UCid5tV9B4i0
 pYH3OHbwr9wRSJdW82txhEzFNRMIG6pcflECjaRUwT2LFcxIwlV/sKp1jnWOTiB3/7HLtDZI/26
 gefPIFmOzjwBKofigRdHxPy61PzKWdMOToIo8swrO7MVLXKQsGUObzDDlBHWw3vFPqwlHFngYUM
 YIjHgNekGkqOh6kDBzw8tqcm+HMySCTLUlFO4Q36hYnZkG0GVqb+oqb/U2b6b0jfEfILlmD7eqK
 HT6KnOUbXsji0uK2KBv0p+UHGtpRYLp8hVZaRys88rFT7wJUWZOCNA59ln2QnI/GKTCqhFnr+Jl
 1V3BS0Vw8ol7rGEUiybXBXyDXo75BmeeR7T5GxtqrgmCT6HWfsCnsH5eWH8OuuOZRv1YPfOMMF9
 I0yfzDVSwOGv+jAdyc7FPbl76tPoXZHFrRrZGPgoBOxNlHgYbJsv9Qi508nueMDkFXF8W5Gbu/6
 9UX4S0HVOlzBrzg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

If get_oldi_mode() errors early in the function, we don't put the
'companion' device_node. Add the of_node_put() calls.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 624f1646fb07..82b059f85244 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -383,12 +383,16 @@ static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
 		 */
 		return OLDI_MODE_SINGLE_LINK;
 
-	if (of_property_read_u32(companion, "reg", &companion_reg))
+	if (of_property_read_u32(companion, "reg", &companion_reg)) {
+		of_node_put(companion);
 		return OLDI_MODE_UNSUPPORTED;
+	}
 
-	if (companion_reg > (TIDSS_MAX_OLDI_TXES - 1))
+	if (companion_reg > (TIDSS_MAX_OLDI_TXES - 1)) {
 		/* Invalid companion OLDI reg value. */
+		of_node_put(companion);
 		return OLDI_MODE_UNSUPPORTED;
+	}
 
 	*companion_instance = (int)companion_reg;
 

-- 
2.43.0

