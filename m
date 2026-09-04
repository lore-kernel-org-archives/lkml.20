Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5AC3783AF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545136; cv=none; b=DSvvKpliv1KDybmKko0fpVET/OjnirieL656J2S/aSl/4mkpZ+cRdn2q2ikHO8p/Gdw/jKv5b6IrfBzDnHm6WmPsjaL4fTbAnEH1KM2ZOE/CEUFsb/o6n8djTk28A5nFD6FDNoWQwySIScGUb9CGBDFH01ytRJoOcEMV3Co5LjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545136; c=relaxed/simple;
	bh=qn3IUA2tYQ8cH+xFwFmjhGWnQn/JaQ+t+4FeB50TxxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=erEib1W5qYfSYi6J4W7DGtG3zEyIBx3KMGefDYDsfYVWBN/qbJ70RuEIxQJkrRi1EiwG3jb6VBRhnZ/IfxQidzECUJubVRP2U9N+OqhDmKoZkhh2IvfR5o4US/MomFqUCB0HjPza5RnamScgZa6CHA/tjM7sOFOOVRyzIWIwbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tH+vmgtv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tH+vmgtv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD56C4E41521;
	Fri,  4 Sep 2026 18:05:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B7A26057F;
	Fri,  4 Sep 2026 18:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CFCC11C79351;
	Fri,  4 Sep 2026 20:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zmnzVywuJ36UYza4cGKzEYOf2ze4aJrDgWLkLYA0zhw=;
	b=tH+vmgtvwgcX7d6mOJyu5ufzIcqG+iDtAXzIxhAzsodtwjNDtQOC4vXx6+f/o0epJN9ynN
	GNiw/GAZ5H9nbki+HkwrYR95hmCHbDDnIo+z+i8ia7j2JNYJcVavyAbecFSUuv1+UPGjHk
	zpQJyzXBuWpT1IkJ3mAG6w+B3jryoT/hDCarrjGJeXTyOccbsHSVclLgWD0lXcFtAvvxff
	6fIf1QQoFfoc+5fV0IULTLCZjJnuRTYn4isOk75D46Qe9XxHgqOtba49hn+2YddZGAhv5b
	ZeB0DclH1pUwgRmetb0jLmzqjQqTgm/8uvyosw9X52Ig2+LLragbdiZ5CRrsvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260904125208.12099-1-hemanth.selam@gmail.com>
References: <20260904125208.12099-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] mtd: fix typos in comments
Message-Id: <178854511430.1515959.5653817613132272975.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:05:14 +0200
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

On Fri, 04 Sep 2026 18:22:03 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> 

Applied to mtd/next, thanks!

[1/1] mtd: fix typos in comments
      commit: 90936c3c790ec22b02c6d8611a9df0aecb8139bb

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

