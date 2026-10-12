Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E8B4D37B7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829271; cv=none; b=QJh568jbR+0MNX/agu3vE2pfaBFSFf8OU456lJzLJ5Q5Yy8QCSmOUIjjUCgP87zqtum8jgeezzCJmUU5U25SsCZHMx36kzGBVyt2nwIpi5oHowXbilh+CPfPDYNgsjOkdqeTIx1j97/nUAjlS5qOxcYFc4zlO/NBShm7HRf10hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829271; c=relaxed/simple;
	bh=T0eFQu5C4gC28+YUc9RWFbzsr8tV8NYfYEx26TFih6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MmezhNrlrJcNRqhOkKJeI5rUF1twCMJzfWYrLo1uhSGH4EIXUuz9oIw3SptK05/QPwFwsD/NPC1PvOxDwpscISqkHsbvBOacMJ+JJwoeNTN7LnUQr4l1QLrpbGCKNIlpReqgn1YmWHawRxp80oWpe2YoG2BY4jDdk9IePKzQIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2I9hvHzO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2I9hvHzO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CA2D1A11E9;
	Mon, 12 Oct 2026 18:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5157A601A6;
	Mon, 12 Oct 2026 18:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 668D111D70C57;
	Mon, 12 Oct 2026 20:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtoBieVdgz46Yu4sNoTwlnltzC8ycX7TlJ8qkNidGU0=;
	b=2I9hvHzO1QsGxWc9vfKn5l4iBIEX7BtmEGBNLcO3r9sB8KMcSJqxk9p+IEAyYFkWX4R9Zv
	W0rui9Qs69LkLuvzf2ZPQ97QGru4+HHQXjKYgYOiI030OfXEGsxjldZxKcorUCaMRh9u8h
	6k0EELqgbePlNjg8jOvJjBxGrddvSBIKNSHZXf9xF7IBJyfnyQaMWkrchexIvUHv9tZ/ms
	0PsAnZNEKvrbNTW29ugjbDTr1Pa4B2PW3Gm2HfHWg6oZE+cgJRgV2/j11dGDHEwrNcd4S8
	KXzdS5Bob8LJ12W4JlbFYkgtH5syT/Z2Kj8LpJkfkflUUys/D48Pq5XCbntWRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: devicetree@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260926014802.87255-1-rosenp@gmail.com>
References: <20260926014802.87255-1-rosenp@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Message-Id: <179182926132.590599.17670038456038372637.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:01 +0200
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

On Fri, 25 Sep 2026 18:48:02 -0700, Rosen Penev wrote:
> The NDFC NAND flash controller was only described in a legacy text file,
> so dtbs_check reported "failed to match any schema with compatible:
> ['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
> glacier, sequoia and warp device trees.
> 
> Convert the binding to the YAML format so those nodes match the generic
> nand-controller-legacy schema.  Describe the node's reg, ccr and
> bank-settings properties, along with its "nand" chip node which carries
> the legacy partition layout.
> 
> [...]

Applied to nand/next, thanks!

[1/1] dt-bindings: mtd: convert IBM NDFC binding to YAML
      commit: 0d1644566a1caaf71c8bf2a6689176e61749a85f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

