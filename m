Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705774;
	b=KYNfE/jAPhmVj8iSUMqdW943bPWRXohs7MTMemGFv7zueCzyCxqV6Zz1QQZKcK3mcOPe
	 4Rl7tFNL5cl3D33XT0ZJ1alkwVVoxW/7AjIuHH/J1KRMtsdfuYDQpO1PJm98aivNL22mD
	 hLcr+STCMqlestEwe+oC3j/MrBXQ6lYzUTCNAIzjQX333NAZ5+Owqv/jTYEC+4XV1ItNb
	 Kln7TlALa1BRiRd74qjsUepI8SILXrs+hS8Z0PURlB7ooYK5cAFde/vb9JaNxVIP875s/
	 Jy2NQBh1nzkuldKuITcR6p9ssV9RTyADIT9sElGptZ7lt5zEvvzP3b4FhRsG/gnnzkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705774;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Z5oRI57DcZSdIcU8X7XX6/hL9yhFgcNqVoy1+vG4t0Q=;
	b=3oZQkBetvjWxT4bbt+ZHPrSdBhRadO81yE7VIqUgpUKn0gWMPuy312GcGPMeGZb4m29/
	 XX1K3Rl6lKNfbO/jrzzdA1FnJoX2APVLta0r41h6VQO1SXSyUpLMOlaqdt6a3SxT3bweH
	 BC34NEXKsHw9YsDcWJaKjRA2vhb13feUcXib+yA+iY1c/rvUwqtm0UCaGdTEWBZNk2eZR
	 bVQOQ84DZL1owwja0CRpENmlBjiJqNu0XKdOYKoYS7zn+sr+rIB+M5GGLjwiUQycmrXhp
	 T+PnGceWmCEkU/Uu7NnB+9k1D9DLyOP9HcHm7moURL7ASLIbVpxlAaVS7gCJc82jZow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lp4S6666;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B27B606D805;
	Tue,  3 Nov 2026 11:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B27B606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lp4S6666
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E706B281F;
	Tue,  3 Nov 2026 12:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705629;
	bh=NHW90e1XZxXPeQPqIgspRtbNPNmWlmAJB7VKt88omRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lp4S6666HYpSQy+d3Vz5T74IfpYAba9LVjJhU6TdRbEKCtiaoeLFbtm3dMyCu1GH1
	 KNkOmRu3gTsZuBZTlLzgW2UtbHWoDFkIScBtIAwa9K/cUpIKsmg9lQQW4GGT7z/Rh9
	 4ivkwLn8v52mr1qEIWigLipQTZXnUHoFuDalmh8A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:29 +0200
Subject: [PATCH v5 09/15] drm/tidss: oldi: Fix serial clock reference leak
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-9-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NHW90e1XZxXPeQPqIgspRtbNPNmWlmAJB7VKt88omRk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccYw/Via5/P3qd2Fiw8clpJYn0rGM//3MChy
 1GjycnDL0KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHGAAKCRD6PaqMvJYe
 9YXVD/9oRYmPR1gDW0S0gkSi1zAI0RydFfC2xDMPDMf/mQ8JdqHVwN6DDNG8s7Is765VnNbXDhf
 AU0SaPWB8YMCvk7yy/7u41FUMLLVYBZnTUPykLi0KHBRP+NKBFTXt7Q19aCWjLypEdxSvBmomYt
 6+xTrBx+9IZkDtcw62poPAq7zgJ9XfGQuLbX4HXnDN8ZnlHG6RLHiWO1vEJ1SLgwK51Sn/pg+d9
 nckOC4SqDXNXplva1xxpS0tVYb+5CJf1mFodhtfR42q+Jklotj+TEsZCa3aQ+GBoNkcIYSM2CJK
 lt6vF617rt63qN8azSW0A+m+W7rBRKFcbE+NkDxLw86zVD3P8OqqdLhDXXk8atOfhtVnCVB17eL
 OH0gU5OkbhYdgh3rnTYVeYeBEoNWtqUztoIobq1cGjI+6TAe8wpp0R2rja9IhTh1wbaTkQ3CMUz
 yepguRQrrUOtLIWIU972SvRmlvA8MKUjVL8KCNeLAsCvGR4kd/8sm9iMXHHasWmCujejLI/UvGI
 FjXhamCumEgrRhnYW0oYOxSzgVmclGxAR213AhanT6SsayBw2ULh0zUTkjrtwNrPflXVTIXnkjo
 ICOVl289B0HNHbP2OZ1KsPPJdOwEEEh9vo+eJzJ5kgM05xoWVljlsst2aCjjth+ud3oAxwh4L0l
 ge0Exhvev0B9Y2w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

tidss_oldi_init() gets the OLDI serial clock with of_clk_get_by_name()
and never puts it. A clock reference leaks each time tidss unbinds, and
each time its probe fails or defers after the OLDI setup.

Get the clock with devm_get_clk_from_child() instead.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index ae27ebc7306e..506507e83112 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -609,7 +609,8 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				goto err_put_node;
 			}
 
-			oldi->serial = of_clk_get_by_name(child, "serial");
+			oldi->serial = devm_get_clk_from_child(tidss->dev, child,
+							       "serial");
 			if (IS_ERR(oldi->serial)) {
 				ret = dev_err_probe(oldi->dev, PTR_ERR(oldi->serial),
 						    "OLDI%u: Failed to get serial clock.\n",

-- 
2.43.0

