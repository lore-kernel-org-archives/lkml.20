Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A673BD635
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346565; cv=none; b=jmw82pE+WFZCiHzCRzAgcSFFsX63czR4zrzNIf4ATNBWgbMGcdzp84rWoKdsaHem9vOSeq9MnlReULtb4YQVF4nxRpfUfGkQaKmbWmXbyiFiWqx0JN6rkVSSMMuxJr/6TredqeXpWciFxy3UBbH3EiHZ8aQzzBdpgFDP9EcpIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346565; c=relaxed/simple;
	bh=5bJav0SI/17E/O2IcGC9DQK2tHPn6mWTQegcegEdGZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mX8pY4HUid5FamvTPKy8OtNFlytbJliCRqmLFHjaYLWuODu8Oc+lOKkmLtjnfXpvWpVX55FNxVUIFKG/r+qWj7bYvyrZBdyzFWwpHQ3wM7uAZF/5ZQpLVJOaunAVzqJ7lO0dmIWcU9HUKuNfHzmjqRgIjRBgaxgCvIiTLLiMTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XkAnVrpm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XkAnVrpm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4EC7FC653F9;
	Fri, 25 Sep 2026 14:30:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 641E96073B;
	Fri, 25 Sep 2026 14:29:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A477102F08C8;
	Fri, 25 Sep 2026 16:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JJuC5P2/SLW6SGurBPLj/a4CObZQWKJbGuaLnG1+AqM=;
	b=XkAnVrpmJuQTQyKh2aWpgdbg2QrDT7f3JYEgTekTWrKBfGMVmHEOrQ5aWKO8KPzlI5SUDZ
	wwLCxQrDna1+k+PuSHazJC0vXNHTqlznS3Omx8d7sVSEP0CyFUFj3fIhukF0YuXtsxPrru
	iNL0aiFwLfVzozsGkyHrYmsvcK3lcHW1D35n/PALpSL9eRa33SZ2s6jQx3tt60eQg3/srn
	U0KgdyTSEiMMSOaaj2Ly4StfGsFx4tmgka+uhZADStjaYqv2ml1pDKv5yeg8k+oZ1UJjF6
	9sQrOK2psfTin/yJ31BT40iG/sV6HaPu9Yq7laKIE+wUsUbE6xxUomLimeFbAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qingfang Deng <qingfang.deng@linux.dev>
Cc: syzbot+e08e0a15269eefa87790@syzkaller.appspotmail.com
In-Reply-To: <20260921014921.78150-1-qingfang.deng@linux.dev>
References: <20260921014921.78150-1-qingfang.deng@linux.dev>
Subject: Re: [PATCH] mtd: block: prevent reclaim I/O during request
 processing
Message-Id: <179034655494.1166139.8055654489913256442.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:14 +0200
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

On Mon, 21 Sep 2026 09:49:20 +0800, Qingfang Deng wrote:
> The blktrans request callbacks run under dev->lock and may allocate
> memory with GFP_KERNEL. For example, mtdblock_writesect() uses vmalloc()
> to allocate its eraseblock cache. Direct reclaim can then recurse into
> block I/O and deadlock on resources held by the request being processed.
> syzbot reports a circular locking dependency involving the device mutex
> and fs_reclaim.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: block: prevent reclaim I/O during request processing
      commit: d498b2ddda99eed28cde177b1620dbcea246a1c4

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

