Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348997;
	b=hrarDdahZTLsftIl2ApxDUJknJsa8/PTTehe3M1r0ViOpaE9tghx+RRsdnc21NqJbuBm
	 7SMomUUk5g91gBY4vSuWSM3t8rzrgN7Cq9FbnSUXRmVzWDMoyhPt2fuA1oI7ivZg186xm
	 QtCNp9AJdsr3RBZ9LAKnxZy1wFMge0Yr9sHgpdjMId294vUS65TdjC2N0q7+Z2HjNGsTo
	 WPzfojsa8c0Pk4OHTvZdcjKw81kCTmT05Lt/hGCOwSxe1L4lm8I8MxemXcZwVHso7IIed
	 PCdsM2qDPniaLskR8l59tAU2ERYtBIwuVBMPGwD/3KjOixc5cn1CRR8+m8NHhTwuAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348997;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=E8LUU8/dAjJYoBx2cnVq2geueGnckzaBaZnZ1Jie+PA=;
	b=LcuxBz1d05mTG8FnQTwolsgQzO+gDNr8kstE6Sb5W2fN7vFHa+zXFSAc9jogQurOz/fA
	 3iiSBy/D5Rt76kM8wYR9ppwuiW2CeDIOiIjs2dWC/HZaMNMUU97wfxosv6koZ0A1I9jqp
	 i6Cvyi0/9yW9WzHxZEJDUFXV7mp0RF/2qvzeePQSv4RLWw4qLPjsXefgBP5DtQOyRc7yQ
	 BByEhZma0+UQKZWmQ8ZEFkw6ztB+a3cmow1W50uh4zSiWBqYf9f69zhzvo6LkhSlexYGl
	 LZ/PvKZtumaMg1NGdDUothHopEem23EEAyULMAOLtLpKwvVT/b4vUheBZuWS2a/2nIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rENntMUo;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F51606A337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F51606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rENntMUo
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61DB11A13BD;
	Fri, 30 Oct 2026 08:29:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 322AB603C2;
	Fri, 30 Oct 2026 08:29:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51D1F103286AD;
	Fri, 30 Oct 2026 09:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793348993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E8LUU8/dAjJYoBx2cnVq2geueGnckzaBaZnZ1Jie+PA=;
	b=rENntMUoZ3qOsQAg3It22RPHGFnouqYJz7QFfqZnoS2WiqPWuISOOfjeIG9Evj5WdcWOp3
	LxRmulCD1HUTCMNEMbPfE861LUmoF3od9bwlM5mrs46+x6RpWTAzk2lvoRp2yC8GnQi6PN
	CQLF0GS6hFar7uSXooTpAd2hBHjzeOCSSmkC2XSqip+XcSClJku2mh4eghjMTkPRy0ESRt
	4igCVvnurQMFLx5SWNKkiuvNfngHfSSvHT0Nc0VWdpH8cDK3WBEelbcAZWjpIUvw1IN3ZZ
	sUMrIsIeB/9M86Jetcp/dPwuaAaW72HdWljonF+Z0dPJ80cJmNO6v8FDHCXY7g==
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
Subject: Re: [PATCH v10 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261006-dcif-upstreaming-v10-3-bcfb28de0aae@oss.nxp.com>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-3-bcfb28de0aae@oss.nxp.com>
Date: Fri, 30 Oct 2026 09:29:39 +0100
Message-Id: <179334897995.680709.16225857559743446360.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 06 Oct 2026 12:21:58 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> i.MX94 series LDB controller shares the same LDB and LVDS control
> registers as i.MX8MP and i.MX93 but supports a higher maximum clock
> frequency.
> 
> Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
> be able to set different max frequencies for other platforms.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

