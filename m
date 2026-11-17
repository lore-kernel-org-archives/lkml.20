Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925410;
	b=wruSRgHRlG0vEv5RsxKs4x9mv5EyV14Jw+qX960eCYf72qqp3yn/ylwOxcdDbE8UQLhN
	 5SCZYfl9EeelgkO65nzrAKLKVOtxgx/4KdDy4GEyrRREIdpb2UVrfFldS8KF1raHyDuJY
	 JxVjllU8n4PDGQC8YVb3sYwBUJK89fJQpkfaALpechKK98YZfdP5JVMmNUEDiMODdC/Vl
	 +LxiriGv0E1T6C4TDhXo4OECkHUzSJ7aA70wOR6SPDGmuZvppe15UJYcYcvg4pO7gSnF7
	 xThh4kcj6tO3r4EfhjxgyztSTIKcQ3Tn6udiEsx/087YWTc177OUDKIbtgY67jOSEgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925410;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=LFhzcWwrTklSI8rmoJqaj5WMDMpXtGy+ZT60s1LjZyY=;
	b=AjPhuaSqRZDd3+eJR/Yfb7xl0P2Tyn6PFcUvkk7mDAovkkdxQ17xmgVfgeOQ16X8d7Nc
	 hunbpd8Iag/uo4b7zoeTDmSiF8L+Y0lh0XYkIf1LuyCOVET1JBzUwXeH2KfSBTLGjHA1L
	 YUnumxlnLYqYpNJy3mIRD4bbyNve5+od9qsEdlfmcGKGbbfIe4qEb5TE5eIdTZbrr9LKX
	 lECmunwxcOVQ0dwD/qyb4hq/eJDG1A3AsvVrNcXRwFlFlFZc23C85YL4gvjumxa0ohq0T
	 9DC4l2K5Kg23wQnn9Aj2kjeVO32N7FcczhjBBMQ+grNpvVkp96zDHmY4i9mqFfSiTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HXx5EytN;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27D606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B27D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HXx5EytN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A0B24E4158E;
	Tue, 17 Nov 2026 14:23:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D35375FD6A;
	Tue, 17 Nov 2026 14:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E00F11BC0041;
	Tue, 17 Nov 2026 15:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LFhzcWwrTklSI8rmoJqaj5WMDMpXtGy+ZT60s1LjZyY=;
	b=HXx5EytN6e3Yr2QCfvkblUYi+D8RzT2TGOvGMCoUvE7pxq2eDfNCdEPF3puWzxAzUjwBct
	Fkz/TETgSNJbXU7ooX5ajRShwX+cpzr/vHTKJ9aDygbugpno0237Zjf0YuvzZtQalhYvQo
	I5fDmHePQ+NWkqlTMWSNVcq5WAa/VyMqzl/EntFIifVmTP3FK/xqHb/ioEWmVKHN+Jjwad
	VOsQRrDIMFnq8ACb4wbjPBpjoEGPkRZayfsWH5N4twBbQWjBL+8brb3yGJb8Fym/iV7cqv
	jRZ8N42BbK9A2PECIncnc+C0jNvgvfvF4J1P76S304Aai8RrTySOoKL4SXYQ8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261115-nandc_unalloc-v1-1-65d849fa9998@gmail.com>
References: <20261115-nandc_unalloc-v1-1-65d849fa9998@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic_common: fix BAM transaction memory
 leak
Message-Id: <179492540601.2259780.2816763714967014660.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:26 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 15 Nov 2026 15:20:01 +0800, Felix Gu wrote:
> qcom_nandc_alloc() allocates the BAM transaction, but
> qcom_nandc_unalloc() does not free it. This leaks the transaction on
> controller removal and probe failures after successful allocation.
> 
> Release it in qcom_nandc_unalloc().
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: qpic_common: fix BAM transaction memory leak
      commit: a53bc9468f7c4461d51c66cbe949d0fbca37f7f6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

