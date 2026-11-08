Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794134488;
	b=kZcX/4mXSls2EMCHpYXqFmvEFd+LuE8cDa+coDH9kcBqXGjPyDSTRY4xwoI+pnwUNU8N
	 HKySYrvWtuOXLENVjfPKvnhWv5Qf7FIjG3DtqnOj/14L3SsgWK26pshvNXrgfegehGkS0
	 8T4Sf/UO8RLx514oXRVBoyIYC81d/T6ckUxfdx156xobjctS7Xpm1QqEvhD+vn9rQm/9a
	 w3Vn3ys1StJh4bDjjS+qKBIMrHqqclc7HGAOxuKZ20vuWuYR7gQnJO/5OxsDPDRpaRhY4
	 cGjF85Li5A6cJW2Jgb+rNBW6vwU6nQsbafhukDe/Kgo93et63itmJsgx/9hkaU0MGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134488;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=buOLHq3aXEaLOdh+jel+eyDIOFFbNtd2Ddp+pAzex4s=;
	b=YWid345OKWDl7457Eor3IaATFssnIvRvsCWf6ruvG3VFAhOLACjPs1Cz4OMvPCkuxJPh
	 1F55jsAipgjmkm4bpBPKboisyzNAHoqpE29zP8wV5JpsAituU6koAnm0OHrPL8OCXTU28
	 5dpQu+9WD91yQZ7RMH02/fi7agjuc7sO5IansuZKkMhoLVPlOE54y+4rdE36aYKczWZH0
	 JyTFJOaou0dcPqLI+xdrzo0/RU0esgejjyQyvRJ2r3vY/DIZqdKZkBAaWwSUuvqqiK5um
	 kZ2607yD2t3L/r2Lulo2IkrZIpDo3Bv4Ja2JUT6HKKTH7PwJ8ZVaLAdm/NxhDDIj4YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AjmhaE8m;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0932A606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0932A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AjmhaE8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=buOL
	Hq3aXEaLOdh+jel+eyDIOFFbNtd2Ddp+pAzex4s=; b=AjmhaE8mMo1wy2A4v7bW
	o/5uLxur08eTQ/lz9R4g4HKOOOrU1/rqf7skAcOURcDDFRQFwvW231UUyiGjaR/E
	yto6eCJLBQaVH23kFdvAQbpfNF5aynjJaHV9kONy2EUg7BAeZJhJJqdHkmzmW9zk
	iPBD/5TxNaDTObWJOOufKzPq7KVne+MYZEf+TSn+EHQgZSlyfvhOHacOXA0sffx6
	wFmPMPHw4yT7Ej8girrWKnPIqtcjlg7Brkn12YZJdeXv92vouEMNjID9afM5C+74
	DWPw6GkvsegzI9IEBwvl9dadgad/U9gKXnqw+MaCqoMwyHFkyWLmK/oAHsGhB+Jz
	FQ==
Received: (qmail 2814864 invoked from network); 8 Nov 2026 11:41:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Nov 2026 11:41:24 +0100
X-UD-Smtp-Session: l3s3148p1@hd2afMFfjpte20rG
Date: Sun, 8 Nov 2026 11:41:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Jarred White <jarredwhite@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Allen Pais <apais@microsoft.com>,
	"rlmenge@gmail.com" <rlmenge@gmail.com>,
	"hargar@linux.microsoft.com" <hargar@linux.microsoft.com>,
	Jeff Kirsher <jeff.kirsher@microsoft.com>
Subject: Re: [EXTERNAL] [PATCH v1 1/1] i2c: designware: Add ACPI ID MSFT0006
 for Microsoft Cobalt SoCs
Message-ID: <avBR0xxt0dvGb9_a@shikoro>
References: <20261104234928.86458-1-sidchintamaneni@gmail.com>
 <DS1PR21MB4279C556CFB876C5562C7F1182772@DS1PR21MB4279.namprd21.prod.outlook.com>
 <b660d79f-887e-4594-ba76-c45dc5f75435@linux.microsoft.com>
 <CAE5sdEhozq5SVj-SJLndiaANx1N_sTiAMBD0zeA_aafUYAGOKw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE5sdEhozq5SVj-SJLndiaANx1N_sTiAMBD0zeA_aafUYAGOKw@mail.gmail.com>


> Do I have to respin the patch?

Yes, please.

