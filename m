Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E251C33A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545352; cv=none; b=EuTUld93rsEkybaL89hjlp0t15m71FQfVJVftQBgC/pICgSYdDdBTQyLZRqLwp8b5gMg+EXZ2Pwy6X0kFW34oI01sO4Om1TWu2/j43uMq9t/mL9EhW6YP2G3JrVvxbhWrsYGvRJ0Z590JG6ZcRihFyLastfZzZUc/gL3PNVqqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545352; c=relaxed/simple;
	bh=T0kIbXcEYlgnBmD1wZPswtGQKUq7BcqMPQAv+OXtoOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b78FGl+odtqNOrgNRKeGN5euXv0+sgxhrz8XRjurl3ohN/l/o9S9OndKJUeQDvYgW7V0OvNi5QWAGwZz6XrOmLikjTHR/XxgMd8snJPvrAi5yGDxy7wpzr6cku3tiahlkBJNyUqK60mkxiQCqKx6P/Gjz4OGaE9aVSOzEkfp5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ALhRUt0S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ALhRUt0S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5914A1A19BF;
	Fri,  4 Sep 2026 18:09:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C2EB6057F;
	Fri,  4 Sep 2026 18:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A40E11C78705;
	Fri,  4 Sep 2026 20:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lxT4BF0pYe3TqiwjHM7pYr0KWW1klergbWZKc6pfWi4=;
	b=ALhRUt0SZ1BRPDm9381Qm6Qk756yaA4O3w4xhQULrhbBy7pG6+k8ZhxzEK6KuozHL3N5Xh
	zipW++KdfIOyKyFrgvZhLEJiE3vvctednBZjyLM+PQEON7O3GHDHX3jGDFjWCoOp8xhLec
	UZXn4C8aMsF6d/xY0PAZNNsCTvYOMOEEp6IT0barMu78KPbDAO+ThTYPqpm2dJNY946qU/
	U3Iv9qFAHZCvJZP5pTLYG13xJeFj041lR0EEhaK3c3SrBWEGROvy0j40Iui6Lnh7COGLRo
	UVpGDfURH4N2N8RoF+OscwTkWdAxpREgXJvuhVQrmtYm/mFB2RvDhtKB1gMV+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Sean MacLennan <smaclennan@pikatech.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260824202120.12280-1-rosenp@gmail.com>
References: <20260824202120.12280-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] mtd: rawnand: ndfc: use
 devm_platform_ioremap_resource()
Message-Id: <178854534716.1533016.1228581910442737455.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:07 +0200
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

On Mon, 24 Aug 2026 13:21:20 -0700, Rosen Penev wrote:
> Replace the open-coded of_iomap()/iounmap() with the managed
> devm_platform_ioremap_resource() helper. This fixes a mapping leak on
> driver remove (the old code never called iounmap()) and simplifies the
> error path by dropping the manual cleanup in ndfc_probe().
> 
> There is no overlapping memory-region concern introduced by this
> change: each supported board DT describes a single ndfc node with a
> unique 0x2000 register region, and the EBC parent uses dcr-reg rather
> than a MEM reg resource, so the newly added request_mem_region() cannot
> conflict with an existing reservation. Distinct chip selects map to
> distinct 64-bit physical addresses, so CS instances do not overlap.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: ndfc: use devm_platform_ioremap_resource()
      commit: 0d66f9895f286d2fab396a71e6efeb95c4a7e5a6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

