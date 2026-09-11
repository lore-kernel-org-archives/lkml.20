Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36A46AEF4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118386; cv=none; b=NeKt4a/1B3w4FHLFF+5JXCofv9Omz0saTCut2+OzGnSBLQSb2HRhs1xKPjNKLdtcI+DL6cAjWQBfhtUb0IWatYCwUkH3aF9Tu+fh5rpdyxQIPjloE4Bm5iXFtczKG/d+VD+zGCB6SZh6cDsYb2+He5eC+D41XQGjNBkVUN9MLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118386; c=relaxed/simple;
	bh=KO0z+4TuM3I0Fo6lJcQaWvPx3PPlSUSwUz+VozNPxK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o9JpoKJVUpgEhKjZ/nS63mfPuK02aDdh5s6njJMB7u9c/SVZ7tcOZbkFSpQfHL6aFAXFqGwXYoRCDlYUFq2IkLuvBJKoyHTbOqmepQr2YIF7knRLDVox+D5nrnrW4n7kw4YqYvocd313sITqirF0XP7H9Qmr7jfuoMSYTSxYx0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v01uTIx6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v01uTIx6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 196A41A0184;
	Fri, 11 Sep 2026 09:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0355601DE;
	Fri, 11 Sep 2026 09:19:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 436D611C7AF8E;
	Fri, 11 Sep 2026 11:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789118382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KG94ASLKXP/d8lPTdsz9AhQ7xtqhzP7G6DgMzNl/mRo=;
	b=v01uTIx6IBAk4Y47nIMuLbGlCnjlSSLAyCCu9gcq+08UGN0p+JJnvX37LpWOlZzJJPwWUv
	GA1pCSN7Zev7o41/lm94vxA8V9Mk38URAb6XXBmsFWF38nbG4JJScrVROJbjX972fIhiNX
	i22m0wK/+GlKyPzlQjybVG2BcEfQAirjeAwUwC217muyeG4go8uQ7lU3mH/1ijVxkhto2B
	ghHCnuhZE+uPwOomW0OosxXoRMZhIU89VPWVrf+pY9pP1bSJz3jy3EyZxXhdGuIkxTgrMq
	9rnJ2UL4K2ji8e7WkvojJJSmr+6iUjFm7HIudwof2UKSh0A4aEOQx8Bqh5q3lw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Jon Hunter" <jonathanh@nvidia.com>,
  "Steam Lin" <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
In-Reply-To: <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> (Michael Walle's message
	of "Fri, 11 Sep 2026 11:04:31 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
	<DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 11:19:39 +0200
Message-ID: <87o6e4qh5g.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


>> -	ret = spi_nor_read_sr1_and_sr2(nor, sr);
>> +	if (qe_mask[0])
>> +		ret = spi_nor_read_sr1(nor, sr);
>> +	else
>> +		ret = spi_nor_read_sr1_and_sr2(nor, sr);
>
> Shouldn't that be the other way around?
>
> +	if (qe_mask[1])
> +		ret = spi_nor_read_sr1_and_sr2(nor, sr);
> +	else
> +		ret = spi_nor_read_sr1(nor, sr);
>
> I know qe_mask won't be spread across two SRs. Just to be
> correct and make it easier to grok.

Why is the second version easier to parse? First version is maybe more
future proof since we are treating a specific case. Because either it is
a specific chip (Mxic) or we end up in the more common case. There is
only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
that in the future we will mostly see new chips only using a qe_mask[1]
mask. So having this in the else doesn't sound so strange to me? I also
don't think we will ever see masks spanning the two registers.
