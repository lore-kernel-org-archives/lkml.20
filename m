Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929637;
	b=VYzKtsiQRdz+WAlZn3yTZl/uQgosiLsQSDfn687z968HdKgdsCr1D1vxdQVBncojz4D7
	 il8GiZ31QI0cGCMPzK0TQPXjiX54+1Swil/C5jlKdDn/Gt3PvK2r6KYCzpRx2DNFqMIgR
	 IkuOoikL6I/iJGsPVp6fTGsNc1mIn2xOKH0UmlGz9upKu6J2qU31xOl78vsKcQtKhM1+4
	 BbGAEDziZcZvvqWm5LEET8x5WoEmghZYsI5X9MYH3AEw2hb6bkMSY2BDlpbNfaHrJC+CY
	 7gcDUsoF5vG5R6hleHo71Z+vgg7Vk/tjHRNIw4j+LedT1fkrdjbMMASz+mqOfIin6fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929637;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ONkwR8RJvjAow7onxJtGa9LsxCz5oDZ9vzWweJzmNHs=;
	b=NjXhUD95TjSpLN7dlf/L1km71h9vuude/ri1ekIgBGGLvaQdy+Nl2r52CgFcJOfG0ist
	 S3LMvSIOQIBE+eBEdoiAT1imh/oidPLqHh2/PZ2c3UhS9gJktDr8N67kllFZrYxZM7yUW
	 ig6dpSq3ClM10a7TrXqKU2FUft6AltICEgklMEYwk7VUk7NchfKPeEsWWu7r6wqdJM5rW
	 Ja7G32InVntJhbd/+8VMAVbSJFS90gKZ0ihEDGFFu6RGq5VsP8Lrs0U/E17axwQ922WNy
	 /7/3CqY+1f01Oh9hLJYeoZnCOuGLcwGGw8CIKPpxPVo5FJ28ugOEdtH3B3AHWlylYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oy8qLtKP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF79B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF79B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oy8qLtKP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3680D4E4157D;
	Tue, 17 Nov 2026 15:33:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BB775FDAD;
	Tue, 17 Nov 2026 15:33:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1352611BC0039;
	Tue, 17 Nov 2026 16:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794929630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ONkwR8RJvjAow7onxJtGa9LsxCz5oDZ9vzWweJzmNHs=;
	b=Oy8qLtKPCvC71ub5Yj5zcGazS729StMFWBDRczYUonxTQmWBuoo++3Xzbe3GKl4aVM4rKi
	I5HDHsy8dMxVsXYdZjqe3K64FLJlQ/SYPzTe4nGyZMjf23Wlsq5WbTxu+9M5x73rWPoJ/L
	Dei9EbPwuTniT2oQ/EpFmy5IdvClo3deZqs1xpbeSnYKlBbFMveHOWRvpzV8w0o+Er5lXn
	n+8x2OmvPo14NAUAWt5ysSFymABJ8DCP1m7lRRqkXnbUJkxQCvEWN/xZFMZ4lJPL6iPC4U
	uqTLoorcBPwKktrzmEDrWrGm8IAnh3eq4XSYYNKuL2i2Iy6Vzzob5rpR5zMmjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Daisuke Mizobuchi <mizo@atmark-techno.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB layout
In-Reply-To: <auT9takcaT1TWj0W@atmark-techno.com> (Dominique Martinet's
	message of "Sat, 31 Oct 2026 05:27:33 +0900")
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
	<20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
	<auT9takcaT1TWj0W@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 16:33:46 +0100
Message-ID: <875wxvlbfp.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> +	unsigned int offset =3D mtd->oobsize / 2;
>> +	unsigned int num_sections =3D mtd->writesize / 512;
>
> Ah, I couldn't use oobsize for num_sections because of W25N01KV but
> using writesize makes sense as well as there's one section per 512 bytes
> chunk, and this works for all devices.
>
> Good cleanup!
>
> Reviewed-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

Thanks a lot for the feedback!

Miqu=C3=A8l
