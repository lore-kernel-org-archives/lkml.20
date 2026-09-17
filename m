Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141B36B067
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658080; cv=none; b=qGYU7+/GaPtm2sXNqXFID8NcBMIdH8Vd9X4jd64OWBrWCqQH7+9QRnCTb29xOLkJkgWn7H2OvO9e3h06/ho4H59vIz9wdT9Gb34QT8YqA1spCVzwcsylaaLR6NHdJqIMBwSpsCz2CISg/yYQvKU1V0yxqJzDbA32wNipimtZ098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658080; c=relaxed/simple;
	bh=e3P/+/yIGtxO1T/saGf7krdxhKHT0Mu+avVGd5AVK4w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bCbNaXNOij4vMSxP792LQBPlelCrRmbMy2+mLhPRx0n+5rVEMx85H5zvtH/Q8qjcmZc2BWya1PvO67oRozHS9PzywW1TbuCx2rCeLEbla8CPUPs9ODxibhE75qSeKBGZr8FYaA7YOID6+3FOOUMwQYxwF9xrQbNbmXa+EQyPFkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JANqcnIZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JANqcnIZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 341FE4E407A9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E60A45FAA3;
	Thu, 17 Sep 2026 15:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C48AA11C7B08A;
	Thu, 17 Sep 2026 17:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789658063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e3P/+/yIGtxO1T/saGf7krdxhKHT0Mu+avVGd5AVK4w=;
	b=JANqcnIZEsvNsQBMEBljCrCt4CemJfCC189GdFFH+1xZiHIlcSqavthYbAo/NkdcgzpEse
	nKoQ17RB2nOnMFeQKAW21Z9wPE7yY1JnCY7/YmJR75K8r+lGg8LArHWpbH6KG4WJ9SCEHw
	z7lmWod1pU5UYmjJ+xEMH5yEA/yd6ueFh3tpqRk/fm0b3QVgsf9tCilolRfkZKZHYex5aW
	nwWBnCupOHmYF0qZM68ynG4hFksMAKv/G0L//SEHcS+JxIZxq+joMXm6FnO5e3jKsRzZN2
	Jj/PWvXR+62y8P3cshdGcIP/G47SI/WqYZVq+2kYf7O2wKNV+/fdqcIRNzf0AQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  vigneshr@ti.com,  Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: Call get_wunit() on the master partition
In-Reply-To: <20260917145329.380628-1-rw@kernel.org> (Richard Weinberger's
	message of "Thu, 17 Sep 2026 16:53:29 +0200")
References: <20260917145329.380628-1-rw@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 17:14:21 +0200
Message-ID: <87ik43j4fm.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 17/09/2026 at 16:53:29 +02, "Richard Weinberger (sigma star gmbh)" <rw@k=
ernel.org> wrote:

> From: Richard Weinberger <richard@nod.at>
>
> The code checks whether master has get_wunit() but still calls
> it on the child. Fix this.

Ha :-)

Shouldn't we add Cc: stable?

> Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Otherwise lgtm!

Miqu=C3=A8l
