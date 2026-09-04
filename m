Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B2051A758
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545350; cv=none; b=DXa/DdcV0CE3K8/FBMhdybkXbCULP3HN87D3gjhgiDdYqSFzUduGMCo2Knn578vL4/M6yFP/Dl7QgOoI/m+lZruXbr1lMeJc0AXaZX7bAegGcjsQMA/IT/zzurqqKnf6MuPlkWAtXxqWfEi8OmBfQDfpOSw8pLsRNAF6372CyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545350; c=relaxed/simple;
	bh=lmC+RpB0grohB/d1oUQ7pqNqshH92fa0o+KD4xn0llw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kp3SZiU53v4nEV7vF5DL6Y1rnI79TxDz/K7hMewioWn0Hb55qoYaBe9TEuraP8vesN1XDHuthYYtf9TCovMsqn7zFNrRgIvEFYCRVNJiUJcs75EMId5yFkJK416CsDAweofmnQ2x1t0u2pbjrxNjedHs1F6+WpXwTNW1Nr7QxCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VyyJ9r0S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VyyJ9r0S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9BCF51A19BE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 621ED6057F;
	Fri,  4 Sep 2026 18:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EB4611C78158;
	Fri,  4 Sep 2026 20:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D9RqcYnyChf468lUF/a5gePeEeWBEWrbptLhqFANr1Q=;
	b=VyyJ9r0SeH/ug3ze6iHzLG9MXvzzoblTMV+SFgm8y7a0XCkQf7BSbfi2Bg1pOOCnaf9gkH
	PykFvgbUPnsuKwIkZbPF93ci6smkB7hm7nMZfSu2w+pgNftIA4A1IaV/4nhVYYqDGz6pdy
	LuOuIwgbKk+tmmr/F3DkN5w5YVJ7ft1UEL/2OvHWQnlWtS4TCbnM9YRD1o54+fBemKCLBV
	mXP00nh1IDmDJQJriVjZgUa92w+Lbonj7he9rZXybYfIjM5tEI94r03CIhKYOSNEUN8SnZ
	mghIRCGAtCaaC0RaK0rf1OXnblzh44ty6W0qL0jboi3UYSBKRWIDyhCgGaG68A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260822230334.214070-1-rosenp@gmail.com>
References: <20260822230334.214070-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap2: Fix kernel-doc parameter warning
Message-Id: <178854534625.1533016.14834218188777626868.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:06 +0200
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

On Sat, 22 Aug 2026 16:03:34 -0700, Rosen Penev wrote:
> kernel-doc interprets inline comments in the omap_compare_ecc()
> parameter list as part of the prototype, causing it to miss
> ecc_data2 and report its documentation as excess.
> 
> Remove the inline comments; the parameter descriptions are already
> provided by the kernel-doc tags.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: omap2: Fix kernel-doc parameter warning
      commit: c469391db15839b2d1b1294eb4a5e5c36ab5ac7a

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

