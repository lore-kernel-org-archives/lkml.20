Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617572;
	b=SRq3FXQSOZR68lsahic2k/yF6qpdte+AjwXCXOMHCPnv9Tr5DjFfYWm1rzdGkIyognmd
	 zS1kWzGfXH7eFk34Xyr99ttfJKJ/+wcG8a/i2qRq2cnWetHKFhpD76K3EfHK79PwhP9x2
	 5AojTtXnxfze6BiA1ttdV6b0fY+PfDj6z9zwGH3GT+n9n/k6AiKZyNfe3ZuL1Z8IQjJoD
	 GHfW1nyejzEVMwTPnL4PLV6glvFa1aksNMn7tlWELXqmsrzwCMWKhbVrZ7s0nCdYfK+rI
	 JPiRPZgFT5pB0/KZ02aU/6S4fNOamgoyb5QYNrG9rWXPa+tngn9JzRT+7SMvekRUZjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617572;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=VRgul/3wnTrfhZ6WCGiExBHWwBt8I+pgNAsbFHTgI8M=;
	b=2DHe/jOc5kgrpwpo24Fqob69Fbvy/ZyR46iPGZBcjQPE98Z9DpyfICc6kD0Ru7867uWA
	 FAy4cRHkdS84l3itCxihUC6eLmqzHYFq2NdASGf/ELxZ82E+Vet3Pv5CV4MyllLAedgOH
	 bVna/l4tcrI7FLBpuXbCgPF8mEUXwpnxZddbRhoiFmZdcImXHpjNwUG1gU8EE5w+k4ozU
	 TPz9eheh04fsQhp7GTD3CUu0zqLl+x5Kdplp6TF4VNxquunYBBNKdyyq1zO2Ux0DARxmF
	 vZyFNSjJKGnNdUj2WnPzehE8JB8hptIpuuKVUT6k3WUjJ9s/3DotjZg3PGoqOjo0ACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IjrBJiTZ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C81606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C81606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IjrBJiTZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 816AAC8F44A;
	Mon,  2 Nov 2026 11:07:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2796B60750;
	Mon,  2 Nov 2026 11:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74D771032915E;
	Mon,  2 Nov 2026 12:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793617565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VRgul/3wnTrfhZ6WCGiExBHWwBt8I+pgNAsbFHTgI8M=;
	b=IjrBJiTZgrOL1sPcxBV/JXRyLa1CSRDXNE2AffRAr9sHD2ILgDUWdC8v3Dc6lZGfcrMu72
	UwOyn6QhWF2Ltnd1Kx+fpCz873sNREMY21FfHfkXcRH2CJXfx6q11kz3tclTAqeVOq9mpI
	rUdZdLazEoOcrFSNSDe+LakKcOGwa8C1kCK/4qUhcOoXY126LkpZ/JARBKNrrZdKMIq5wJ
	ARGcWCrk2SeMYjIH4Z+Q9nSM/QblqPlK8hUoWlJF/bsNkUdJrWV153YzBT/mzWC7j306vK
	gi+BhrPcKgPnQEY77PBrKgR7RYcsNfFak1xsO7Sv7c/QoiEeWkoOTKXLQ1wqyw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
References: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix inconsistent indenting
Message-Id: <179361755686.261447.18093822664278994585.b4-ty@b4>
Date: Mon, 02 Nov 2026 12:05:56 +0100
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
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 07 Oct 2026 14:11:53 +0200, Luca Ceresoli wrote:
> Fix incorrect indentation introduced by mistake while fixing patch
> conflict.

Applied, thanks!

[1/1] drm/imx/lcdc: fix inconsistent indenting
      commit: f55606c5c095586de20124943e615d9ffc1be339

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


