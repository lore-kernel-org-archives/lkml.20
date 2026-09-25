Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8FA483819
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343355; cv=none; b=XjI5o/uKXywUola4/vesqm+ZmVp2dGK3aTQA8ONj9EBfxdx6eNn2K5pDqisOcNDcm9nllZ6WUYSJOLS71jJ6Zrjel6D9UDBmX7So/Q1dmR5kMXWfmXidZ4G7aq/uec1s/9o6iwpL+xcRO0JRk1O8devcaRIwFdefnU83IB5rDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343355; c=relaxed/simple;
	bh=T16usDBBvBCh5clejlTA5X8LPS8Cht3dp/vicv6iOk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pas6TuC1JfpvBNANyNYQlMA6TuuOGDXXV8bca9wqIf6VWPt3SxUU52FFmEuIIO/l08RaSZ6L46EQ+tUhS8sgaf4FbFB1ipUGSyIP/fFJchehOJ7lwl5hCziOCPDFNmQFFa4aYUSwOQhEWL1EbWGXF69Iqf8WB0Ww0Qn9vVub/zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CnVUNRAH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CnVUNRAH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 018D8C653F2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:36:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 268CA6073B;
	Fri, 25 Sep 2026 13:35:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 556B5103293B8;
	Fri, 25 Sep 2026 15:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dUQeykvRToiIwN0421XD/d8rA//rqTeV9r8Rf1AoZ/0=;
	b=CnVUNRAHyoYY9spRo9JzDyyVQtD8h0g3m3YtR7ANnYz3Zy2DPvKtnS4ImOhAOzAwl4qH0x
	rP4LTRM/DyXyX528SyYxM14BavLE24WMuvLYq4XXPOVDKaE/B9oST9vJozawMpDuvTVi8A
	cCwqBzj5Lgnp7X3bc8EqN49JbUA3W7A7CImo7F22Hc2Wics9Y3mHXpFYWRi5uAfoHyTksV
	tdwPk6AAf9KjnpRO2NYmOcDvo3QXouwanbBqxc9IWFRmX5gpBV5hUXzOST5rGlxNmLPkc2
	Z67Wv+v1Um7ybvwPTOeCe2LMlvHHmTDD32e88YNM3NTUnklfkPonlIgGcbA4HQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
References: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: Handle GigaDevice chips behind the
 ESMT manufacturer ID
Message-Id: <179034335020.1124555.10591572083530016506.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 17 Sep 2026 15:00:41 +0200, Peter-Simon Dieterich wrote:
> JEDEC manufacturer ID 0xc8 is shared between ESMT and GigaDevice, so
> GigaDevice raw NAND chips are detected as ESMT and handled by
> nand_esmt.c. This series deals with a GigaDevice part that ends up there.
> 
> Patch 1 works around a broken timing mode feature on the GD9FU2G8F3A:
> the parameter page advertises SET/GET_FEATURES support, but
> GET_FEATURES(TIMING_MODE) does not report the mode that was written, so
> the core does not see its selection acknowledged and falls back to timing
> mode 0. GigaDevice confirmed the chip is compatible with every timing
> mode it advertises and that SET_FEATURES is not required to enter them,
> so the feature is unflagged for this model and only the host side is
> configured. This mirrors the existing handling of the Macronix MX30LF AC
> series in nand_macronix.c.
> 
> [...]

Applied to nand/next, thanks!

[1/2] mtd: rawnand: esmt: Disable broken timings feature on GD9FU2G8F3A
      commit: e97c701c09d3d8f23397f68478c7e2c7eaf87528
[2/2] mtd: rawnand: Reflect that ESMT and GigaDevice share ID 0xc8
      commit: c62b598ac7f650c963ca00a19f161e99e899498e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

