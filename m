Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA943F8A7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940489; cv=none; b=eK2VFwyCqP5/SO0zAav80NRyAPP4riO6gRiAeEwg+mLwgATwWUZKaFs1NTHfQLyzyxJXGG2jHSpl6coYY6vkgWF/sMlp/z57UY4pGHBkYe5BEwhplW3keG7Y3Uj97fBn1YnywHKAuphOyweSpNVXK46bGFzi+YjXcL6CExqhFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940489; c=relaxed/simple;
	bh=mlHX7+VG7GBg2l44HUYR+CBKUEA/pycn93NQbT+1OMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fFWKNhtlcwzrrLhl/Y09dFlDWsoeG48ggMGYiT4i1vMaJJV+YqJOT+wxxvK3scmTe8hV73JNsOmkypmf9SPm7VUbQ0TcliYRBE+Vn5zejQa5lTCD7Pw+bxeqYxLuhUXWx8jHnZ/onEotQF4g4IdbD6iiHTr1SShEUr0JGuyig98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bRT6Xe2F; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bRT6Xe2F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 118CB1A1A73;
	Wed,  9 Sep 2026 07:54:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5C8960448;
	Wed,  9 Sep 2026 07:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 250C011C7AF5E;
	Wed,  9 Sep 2026 09:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9vqYc9e5MyeZ9OmPpOdtvS3YemB4Mu1FMfPMp1z04o=;
	b=bRT6Xe2FdQ+XRFsktJaNrW8Pqt37ur7Cf9Wv5TXK2XlSeDwSbk5WlW2x0krsCsFWTYev2B
	kFToIhXNDLL9SC0DbdXze+GCddx1ynO2du5g+llK1WTJ1BQGphRYTgCC0r5+VGeOJe1dXn
	XrkspEnPA9cmQ39cdARQTF2sGFjbiV0yKF7xge23J4lbaVEEWYUCM9qioJGJ1l1RBh6qA9
	dFCVHk4UqejGj3X6CDm+z7622r3KUMDDmcrA1A0txuJDHURwcrzDnaWXHzAknD8CSTKnzf
	lUUffrFze6bC6nYuplxGJPetgbhJy85KSGYT/E9OJ9ggVaCKm4gNSUhIEjbV1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
References: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: sunxi: reject ECC maximization on
 small pages
Message-Id: <178894048196.2040467.15162790705275563335.b4-ty@bootlin.com>
Date: Wed, 09 Sep 2026 09:54:41 +0200
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

On Fri, 04 Sep 2026 19:05:37 -0600, James Hilliard wrote:
> When nand-ecc-maximize is set, the driver selects a 1024-byte ECC step
> and divides the available OOB bytes by the resulting number of steps. A
> NAND with a smaller page therefore produces zero steps and a division by
> zero.
> 
> The older controllers also provide a 512-byte ECC block mode, but the
> hardware documentation describes that as an ECC block size within NAND
> pages whose supported sizes start at 1024 bytes. It does not document a
> 512-byte NAND page mode.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: sunxi: reject ECC maximization on small pages
      commit: a3c84084a73e170374b7dd493947efdef4ee57bc

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

