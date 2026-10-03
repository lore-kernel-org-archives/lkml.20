Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E807723E33D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987607; cv=none; b=ELVMIZWp17SqXgCJLQVwx+OsqYgClQtQqqeDlz+1gCwj6o4yY7ZAVW0uV81pRSrqgdOYvHSgdyWcb+DNMRcCK44PU/VF0IrL8pe+ULMwtODR2DLENPlK1AksBpRS8+03vU6GrPgjL+6ML5vWISfN7M9ZHXkY8lakxWwmQlzoxwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987607; c=relaxed/simple;
	bh=lJrX9fLYt9M0fTdX5pauUjLPWBj7AcXVtE6UYAm986U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UDGjUEgFMvkf46r0vwIGog3YfelPx3bfQb/0Dcnj4vPqpzeGYBsjH4NGFZubcnxAjOj0+iSYKwJx1pH4kMKlEjT3c2mw1Ta6Phquz8LBCXViGRODAsd1n/3Ja32acIwkmdxxFDkWGZzP5lWm0mz5lo37znfl0bliT3iO/qG1MUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XiDn/vCg; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XiDn/vCg"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-8241a56cd70so62841a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987605; x=1791592405;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lJrX9fLYt9M0fTdX5pauUjLPWBj7AcXVtE6UYAm986U=;
        b=FzU4m1Bjx040J3VSVJsbS2P0QpbVQJA6gyZQWLKAE+Xsu5jIQZ7RO1iTGrYSjiEthb
         c5vHA0A2qtm+wb1DBKB4xtCjib63swEDzMHxkTMccx+dQmaM4pG/8DBnWtRiVL/jTyUv
         SVW6DfcsEcrf2xBkOILTc5gdyc+53JBfqMq23mhGzOtDj1hVgShpUc5+HZpWm1sBCdAK
         ObvFpV26bCfTaejpG3TqQxoJyrd20nf28yu01PLXpWNVhM1EBf/+XUWPHt8Q4ABHVrOg
         105ip12ctB61LntkV/zPpAzKDoo5voDPQ2nPmlWgh/sWNLqBYYJYGAC7znX1KZmGdNnc
         7uJw==
X-Forwarded-Encrypted: i=1; AKwUvByXJifeg5Mx4rje32LKe1Ja0Qvugivo5CAjiVP7sErU4tbgFMPB7iRpVQ2dezHkzGzNiPfDwdg3bks+L9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mP/ffKkKm50G41Lmxvw3anRnMZm6uccI3k01CFVHWPebepltk/
	UwSnguExJOjurRv0sxxXrsUKHASF4oAPxwpx4nwjbGQsDiFZVnSdqvgzFjZ/nySpm1pPlYXDkoh
	zojmVRoQnMrkX4ajXkgrjIXhmA2lK6vCH/RwjRL6Iu5A0rr9zO+dOpmil95Tm7kMaUe2PIE8nbw
	c4zz4hLQKBNWVtpgJ+4fgDU5e5pcqLQDdP++pj20wKI25JFbzhWzgoPFzSjLhFyICxouBHRvzcr
	dHKX0iCkK1lyYK/urj1VHBZ
X-Gm-Gg: AYBFou39/gkCqY4lXCvu/V5qiqkvjG0l3WcnZzCDfqtWx98Mt/1/o6735/PIop+y/Nf
	34fsB+CNtGaECHtpbWzoh71tuhpTJ8U8yZZv8v1tax4mfkl+Ag+rh8BO/I71xpLWY7L3WN/u/jo
	iVgENjGpxdYY96inYW0JpSpm2r4tqh6UUm2Q8WThGZsldbZ1x939ts3fezIoG2JTGyvMPB4T/67
	Ve+h3y0/wXkPAKrLDs9U9CVYY5Y7w6TrPjIb6avyFPQdr7aiiTBe6jhyLqtzMDdDOhhQ7LqXOts
	tUOZcs8DNdMIMdvZcmdDCZSwVmV7433Wy8VaVH30GVa1UUYgOmqvydc1/pBaHr5A0l8qsmV0eZQ
	QL2XlGm8rqmFGSXuLvo92RBLV26wWFmfkIz27f3RDTGPrMmJtzX5qOUrk35M9FhSgkJaqkiFonR
	gNHQIukVeN6Cz9Y70zHq54B82diMpA3lPq/tkwoHYc6mo=
X-Received: by 2002:a05:6808:2207:b0:4b9:a829:f016 with SMTP id 5614622812f47-4f529d2f1cbmr3366327b6e.34.1790987604629;
        Fri, 02 Oct 2026 17:33:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-49e17009ba1sm540353fac.18.2026.10.02.17.33.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2026 17:33:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so214926eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790987603; x=1791592403; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJrX9fLYt9M0fTdX5pauUjLPWBj7AcXVtE6UYAm986U=;
        b=XiDn/vCglcE23we3nPMzmHG9gHAmV2Y6+vmn+vmkMQluACiTJVGt6TRYP8/Y/yjUxY
         4JoHKDbzPORvsjQIYHaaKj31ushNJe8c4x7YBvZQQ/z/sBrNBiCZ5MaYv2N1HUS/HZlq
         rCn18RQP9D1HPT0DFBHzzMAy7l4r0tSnzJH68=
X-Forwarded-Encrypted: i=1; AKwUvBzqWUPyZdX4bFEOAkkFruvMWQVcyIXqN5ySzEiXD4ZDOX8+3vlrU3JeQlG8AbVWHvvFU1wizMCu+50Gtkw=@vger.kernel.org
X-Received: by 2002:a05:693c:8810:20b0:351:165a:baec with SMTP id 5a478bee46e88-351165abed5mr171031eec.37.1790987603199;
        Fri, 02 Oct 2026 17:33:23 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:165a:baec with SMTP id 5a478bee46e88-351165abed5mr171004eec.37.1790987602572;
        Fri, 02 Oct 2026 17:33:22 -0700 (PDT)
Received: from localhost ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f15001196sm8595075eec.27.2026.10.02.17.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 17:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 17:34:23 -0700
Message-Id: <DLUS51Y9OLMS.UQR4UY71TFUP@broadcom.com>
Cc: <bcm-kernel-feedback-list@broadcom.com>,
 <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/vmwgfx: do not hand the embedded sg_table to the
 PRIME core
From: "Maaz Mombasawala <maaz.mombasawala@broadcom.com>"
 <maaz.mombasawala@broadcom.com>
To: "Aldo Ariel" <qwe.aldo@gmail.com>, <zack.rusin@broadcom.com>
X-Mailer: aerc 0.17.0
References: <CABQX2QMUUf1ETuLmvrzQ9_rsX4+KG32YAQJ-9hV3uakAyPiYrg@mail.gmail.com> <CAP48HfviFZXacVY9Lj4Hv7+brObhmxWLYAM8MNiTUkJNchnp1Q@mail.gmail.com>
In-Reply-To: <CAP48HfviFZXacVY9Lj4Hv7+brObhmxWLYAM8MNiTUkJNchnp1Q@mail.gmail.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Aldo,
Using your POC, I am not able to recreate this bug you described in your co=
mmit.
This is on a top of tree drm-misc-fixes kernel with kasan enabled.
Are you sure the bug you describe is not fixed on drm-misc-fixes already?

--=20
Maaz Mombasawala <maaz.mombasawala@broadcom.com>=20

