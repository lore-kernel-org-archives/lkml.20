Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007184E56CB;
	Wed, 16 Sep 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564034; cv=none; b=rpHWbFkT/5VUxZnuB6f/PHcU51HLIYdHSRtOZIV+/cXYLSYpoUdXaWPdmpdxhgxw0thpt9xD6tUzJ4PPZJrPMJmRqYYcK1pD+9bLv83mt59sHDX11gkSQ65hyL/O5Pqteq6207xiURIYVrguxQZXmqYjC0I+3sz+RN5gRHMM0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564034; c=relaxed/simple;
	bh=9YhQCzMXQ1kxLsRhTeD5Ao09tfL+Ps7UF4I8rMimm9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOKiy5TGMg8P9d221MH+6AoMBdInaqusvexru+pAcLCgA5wdBwdsZOex4KXSQFodbgeWrdQ5a4UB+yGiz3+CHL/JL7x73CSGMLM7x2009nvxPfshqADU4l02PUbGM2hW+454s6ro0YBArAeK5PhlBEWD2djknhmaUV5b+cSWGfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=EFRnfk1P; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XRhGQ0sL; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="EFRnfk1P";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XRhGQ0sL"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789563991; bh=9YhQCzMXQ1kxLsRhTeD5Ao0
	9tfL+Ps7UF4I8rMimm9g=; b=EFRnfk1Py9b4T2nKs2349/0ToUfWYOEaFRYwS7W93OQEZpRLgn
	Ze2XZGgoJsUNSzESvRpxj/pBWXU4CEB5GvLHafbLXkPzkMBQ7o8nQuFCVFKg7C4QnSGkJSmX4z4
	skmnCORj/eljqWRRfxq1DCEYaLM+NHC0e677zB+O+kHY4MZOZ8UgPjmgdY7QSWQSQx1THjhAWEd
	omGCdaC3uDFIfmIsA/v7es9eWp+qLoSi+b39S2uBDHoHY8wPJoVkeE+UygTP6pKQThsHC9JyuCR
	/NFkXgDmVAV4g+HmgkcopTZoQhD2N47Y5umBjjhum+qua+iYhn00s8RJlV6AWR5//pQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789563991; bh=9YhQCzMXQ1kxLsRhTeD5Ao0
	9tfL+Ps7UF4I8rMimm9g=; b=XRhGQ0sLjBDzU6FE4HPuEuJS9SK/kdcZWV745wfvWlSYMhJq3o
	XOoNC7pepPhUrYEPKoSNz4l7I6GRjMJYV1Dg==;
Message-ID: <8f2245c5-cb1e-4463-8255-bebbbac08a52@mainlining.org>
Date: Wed, 16 Sep 2026 16:06:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add Reset GPIO to imx258
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
References: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari Ailus,

I addressed the v1 review comments in v2, but haven't seen
further feedback for nearly 3 weeks.

I plan to rebase this onto the latest linux-next and send a v3.
Would that be okay?

Thanks

Best regards,
Muzaffer Kadir

