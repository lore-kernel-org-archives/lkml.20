Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269158;
	b=HU7oPe6u5UuM8JRoVhW67ocyLMMTxmy5QcvgVVLt56vEn8GUKyp0RMaYAxmqQkQVmLg8
	 ZxpBE73gyqObUOz9RBw2r33EqpUIoQHPYXoSuCcWYsonsMLm56+E4oKraRVB5JR6om4lB
	 40nObNWfDJ1cjUNxtaIC5qZYRp4yplovgD7goE8d8B1lxokZ6hmE47kvn3TFEADesmiu0
	 wsjJcHIWnHZwE+mMDElbu2Du2G1DLGbVTAMub1NG6qpki+4lbIGLRA6/nm1JkrmHXMHjQ
	 dkKixXbf6cbE/dLR47TzrEjPENdRvPs6xxOHxW1Fuv7BNiDWG/wP3EbnVMdBuJWgoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269158;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rgOksGHjJMO6+qC31594zpqasdGptWfiobmyWyh/DRg=;
	b=FBwbDPgeR2pKLk3ElrxU5f4EQLt0+fXBJxES+VYfQX10J8KOzQUPfZz1ZRN7nOg0n7qa
	 /fTT81O+RoI1umw9Nf/K6FGk1+2f49RlwUqi/FR8d0kwgEwTkf98V80gEtPhe+WqfJ7J6
	 H7wYqSMgm2Bz3Xi16Lb0OrDQ0/uMI8pUuXIk2Pby17W8P6PrNG8eC3qtZnXC48rUfLk7+
	 dmY7MWdyHMry6WhVNRf235L+NyIq4aa5h0BCKDBYU4xAOQ544ZWLAiMspHPJR1Kpc0i/B
	 X+WunIncQGFKODbGTq8GIHtJL0QYf01fNnjPJA2tBMtR/cr6MAanqkFIE8KRkj6JvTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=cX9YdwWP;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE060A261B;
	Thu, 29 Oct 2026 10:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FCE060A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=cX9YdwWP
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D1FCC6A;
	Thu, 29 Oct 2026 11:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269022;
	bh=8nkZE0H393gKjaZ62g8sexiPluHSW2GoKEW2yiSgPlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cX9YdwWPIAu+bs6t4/FBNr+Exobbi75qXZowqWB7LACua8rLOpJpqCj7lNvOz6lNF
	 nS4QVDms5QEer/Ad1wblO7c0ErxwfGNs1qHsqGVkki4DVk/E78/U+vr5+Pr7JuHN4T
	 RXFp8uoZ0wEBCi8YgekfnDFRbuchjqY0eImMebZU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:52 +0200
Subject: [PATCH v4 06/14] drm/tidss: oldi: Drop unnecessary forward
 declaration
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
Message-Id: <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=614;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=8nkZE0H393gKjaZ62g8sexiPluHSW2GoKEW2yiSgPlE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2X9u/iLC4dCel6kFOZHfzoFnEVKL91GXNgK
 msJ0r+RCZSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlwAKCRD6PaqMvJYe
 9QWxD/9ZbMrX3+jEAAQ1EC4NAtA2JnP5zX3oIqT2UsE7d90mFTTuMSL9YkG1iAWRjBGkPuT+8Xx
 /zkRWCgftOlrg4Oz1bDiNbHbobD/3sfzFjUb6iAq/sRXWxwf+tYngMpUBNWaBaOa0l9HN0zLxCl
 rD/jAjr9AHe2OyEyq7jcgaJogl/jDqcM3DxylHy8PtoVYO4LPJzIufe0jw6SJ8im12zKXQeBFtT
 VvUj/LfjPkdjNdmm9p9ImcgLHpmAL1Un+72i1O0n885rnVuy7ZqW6llMR6suBbijTdc7KR+FOei
 oOaJ2+6mJ3aoyXnwgWkRl+ZWLehCVlBssMQNgOXuEVsfM7kxzpeQxObSXvWs/ifuU78ft+b+nls
 2wNSpXWG94oEYcVqOmMSTWcmyYlSNYaL79BgNSO6WXHPyfgMzC6r8Lw2L8qBnuEuUyqc512VlMr
 mrza/X/2vqx7tjePS1a8NsJdqtfOrwgsNiZ17Bygl9HQxPRl/gEj+e/LSXeY4+5gcYZEvfW3jL2
 RLgFhVs2YHOpt4IXUtU5IaR0izNTF9ck6kD5n/yqrkbT9QxaVLt9sW3O4oYzysz5amkqu54r8+E
 kzls+Rx9nKqoTbj4mQRPgpzQOTro/oTuMvr0wVRuxPMw2M1UVsD9FkFYyv1w4lOtOoSotO/1L/n
 HHLe1z/Noufhy6Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
declaration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
index a361e6dbfce3..ef9597fe5409 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.h
+++ b/drivers/gpu/drm/tidss/tidss_oldi.h
@@ -10,8 +10,6 @@
 
 #include "tidss_drv.h"
 
-struct tidss_oldi;
-
 /* OLDI PORTS */
 #define OLDI_INPUT_PORT		0
 #define OLDI_OUTPUT_PORT	1

-- 
2.43.0

