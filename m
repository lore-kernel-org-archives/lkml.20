Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269160;
	b=dsWGaYFnqmTHR8JN9Jmp9IVauLI/EMuuzdbN5tcwr6+G1PPhInTTOSezWMUp5pAWG9lb
	 XgBvSeL0D9Jrio1ytwEms9PoAKf06f2ssbBxENlVRDrCLCMS9u/uk/0QBz0PJzMakPFXZ
	 3MeEokXT/wYEBTgEnuQmE3bGrqVxA1T4Rc5xmZhyJ5JF4d5X7Ug7Hs1u3TVtyLz28nXqL
	 rFL2Tv7YABHA76n7ZBwT/bBL1SWwg18+GQ/YEWTbmSs9QDqX8OnrE6ZWkTDB6SHLm0kzA
	 9wlB4GRwh5st+i2yYaaXYsEI21IU2F5HT0zgAol3nWj9onBfcbDTGBQSggreb3Xus3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269160;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6clb7zDaAH9r9M6v0Cs2SweYtJsu88uC1qfGVnb/DF4=;
	b=0iIEOZeHKE/89Fc1Syc4eoNk8yuedNyLIPpZ08GD+OWEzIC86N0zNFI7T+9NQ8gnF1ul
	 37YQgYXPKwyvq5Ri2Sst29U0pIEGbHXrOqcdhXuHKZgOY+PcBRvxDwBJ33kbgi8RIjW2D
	 hBIz98l9xotoRjR/kmTIct9J8xWxNuvouFwuVHoIBxUtIARBYdhUP16BllEJH9FcmdwBW
	 YjXoiq+SEfEN3pVbWq6D7tcSMn9ZeEWYEn2Cy1jL6gxnSuQT2TQzAgzQ5WtOczKQsnLpW
	 SvEa40Qx9yT4L9+Oh9/OWK0oiTdkPjaqPOOfaWrT7yvA6Rx1Ax+O8jES8XTjd8igYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=N9w76DW4;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732060A3809;
	Thu, 29 Oct 2026 10:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4732060A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=N9w76DW4
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 845A6BE;
	Thu, 29 Oct 2026 11:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269024;
	bh=k4C0AwrvL/79LdIbFEMvqhcsEJvl7Y8Jl/ivUjUaUNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9w76DW42RbToB7YW8OAdd+pMcMbpgSA/Sk7hxWN9zf9ymn9em9sVyhV+Fsa0ntr7
	 EJUV/U2O5yiC4A3hM6NTzbtSp0uAuo6mxK7YC/w2b7ocFcsFBluto710AHr9yNoOQO
	 aofubdRJ5KfnN364+d7Kuuk3Q/gIe+5fHQvy00dI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:54 +0200
Subject: [PATCH v4 08/14] drm/tidss: oldi: Fix serial clock reference leak
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
Message-Id: <20261029-beagley-ai-display-v4-8-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=k4C0AwrvL/79LdIbFEMvqhcsEJvl7Y8Jl/ivUjUaUNY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2Y4TaFah9O+f4ICQNwMOb0ENbZMRRnPmSIZ
 wUyG2wRS0uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdmAAKCRD6PaqMvJYe
 9d+eEACdlhVd8vF+KuMFop/dcrXzR9DmSwJhfEwLJWzEqRnpuCzq/XGEaAP1VC7qBbQY42AV2IV
 XR9fi4uqa7fadaDatsmrmCDSUO4ub1l7ieNV4I6xE3lH8CTl4/AF9xQy2mw7cattqfgY4GuxJIO
 7z6bCKXekQUQRTqOFCQBUcXQ3mwBszUAPGLnwxG/V28s0MZzu+DSK5YUWBgu97Qiq3QJ5EEDguR
 jsEg0bEf9Aq0q8Mwz1/FNgxSFsnZIALyFzqNJiczbm5PuuZ8pv+voot2dqZ3doyje1HljBJ30io
 Aj4L4UEvTICMGIxJWg3XTC2MxAUZq2ECgX7c21WnbzvsWWuIvPuXCrfTH3i3CeJfunULOeTeDey
 arQPv3opd+EnLjENTjwaL32h7l7ycv5pWMd/19X7QFm8EtWbw8X6iCEGFFoRLDJ1iZaZA3JIJW2
 tDqfMmmat/h7ebc0VAvFczcDW2hJ/i4YM0sX+15JsHRFtfAr0rv7dxUGuUH9HCVv6zFFPbQwXEj
 vr1984cB8Hocfdqhlf6vxe/fAkZLFWBn8xajqHD+F6KDFzJAhaCO+UqI8k/qiCQYIG0JOD2ptKO
 /i5plTw9sBP+HsHnC57bB0Mpxw6tOQbyu2mk2ch5ILOdsyeY1B1xJQL9O7VH/qu6T8TX6qXzjPP
 gv9vzL3sqGO3cnA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

tidss_oldi_init() gets the OLDI serial clock with of_clk_get_by_name()
and never puts it. A clock reference leaks each time tidss unbinds, and
each time its probe fails or defers after the OLDI setup.

Get the clock with devm_get_clk_from_child() instead.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
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

