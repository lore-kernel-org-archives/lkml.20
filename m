Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC951A734
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545349; cv=none; b=hsEKAcYst73OqorsAFvoGqT9c5Ok9xMZNgSfXZpk1KtHIHkAf7zpCB6Ra5S10aKZFNk5L8HuoXbg8rQ6abFAE24q33OBtfro3GehjteqT+gFeg8d4ctffMlyKz8V7Cf3Iktvtep9RHLRb27YQiLfqmAPYXzfmCbCHac6yhCJbuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545349; c=relaxed/simple;
	bh=oxbtQF8fbhO+WmfXKS7noCO6sJ+gIspVrIWpnrwdZFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g2nySoIJmuxDCPPYjD+SjzY39r/6K0ThF9IOHAH4kQnU1mVuGJgzn2xHm6YQiRqlKdwa4KxjU70VlCLsorAJfo1fq7OfjV1c+7exIAEsnagg7CinfO+uwZ0LRPoj1vBdP9iZD8Tj+kBVAtbaZIMRjv13cwQAcNCKAribQs6i1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wHZnLEaC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wHZnLEaC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFA6C4E41522;
	Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBD9E6057F;
	Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6818411C78705;
	Fri,  4 Sep 2026 20:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ca8H73x2xQm8L3T2lZGE+j6oHWmt8WLN0PGrvi1lAPs=;
	b=wHZnLEaCwcbRp47TkgRBv7KBXtgP6yQ1GzwIKpCaeCX0BEZCuFkrKBATzFIpAGAZzKvfNn
	XoOlE7UP7WHizpylU5fDBeRRwFiygiEtLy8Y+TvWSPQt0dyZakm6RGwh6XuGikgLp6oMQb
	+Dk4hzAB5XKlMTrQy/cx7Yt/aWf8KE8BQdDplAPApA6eJsWyfjbjtLnVpytgZFDgSYYXGv
	Lv9KqVBFZhaxVkDKVAILP0rXv5kWpfD+3rWuf0Zacw/koYQST+HYqOuJK9CpUfma/W2JDH
	Vopxt+F1GgoStHF1E+y51lRiIp63RO5YCaQCnSTb5wNS1Awy9FQfhSskUrC/Zg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, christophe.kerello@foss.st.com, 
 johan@kernel.org, linux-mtd@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
References: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178854534427.1533016.709006887043927226.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:04 +0200
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

On Sat, 22 Aug 2026 04:59:56 +0000, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from its suspend
> and resume callbacks, also reduces kernel size in case CONFIG_PM
> or CONFIG_PM_SLEEP is disabled.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: stm32_fmc2: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 09ec4fe9036ed0a0293518dc11f2480423d1139a

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

