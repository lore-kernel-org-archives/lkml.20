Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041664EF147
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015551; cv=pass; b=ufFLU07Rljqh2k7GFLMlpHPjFyphE7yEYxCvsDO/GKC3ZJJ1qw0NaF/++MkcktvKGaXJ5j/eKSe72rnnA1fpdZiOj58cIixxOSSr592XwQRRu0DtJ4wEFX3VyF491D7HjMUtiv5WMThU4DihdP9swF0FYNhc1xcSfiNro7SVids=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015551; c=relaxed/simple;
	bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNPXebIsdqeoZD6+uZp8HhGL//KDFjcsxGhBFceJOrjt4T/7iWn5sSduM7oOG3wu9ZUGy9xsrxP2egSMwx+y3MtiR2a/1ECyJLtgisx76JExNDHRgEQ7JMiVFCruyjElnuiftBNRiLCGTnN9EoJHA/tqHUf+p6bk2Xwz8oNZqc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe7IN9f/; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe7IN9f/"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c795f805so1792922e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015547; cv=none;
        d=google.com; s=arc-20260327;
        b=qcyd1u4SW1vXuHNtxwjHYJNzfhbP4NDBV81lUmXhOfLjfSpx+SZCLpxqzJPVucmOUl
         BayeeleFYp9iXmemQHseD1UBwYIvi/kMh5zQR0OKyD6O1bI0B7fmc/TtQUz09NyL6eYs
         pxVqlcgHSBiZN6rTttZNOAskT8dHijZtQz6GX0rMcbgbRFfud206UJFFX8ZqDUXMvZqj
         vQtW9y88FXBL0JWlBdmhUmdcZ2fZaxWdlFgPPOTUwVwo1ODky55MH+lISkLTkCxR2sB+
         ww9KsUNBP6EAQj6ho0lAg4bihMcMgFZeHE1LS6HfDXsP2d5JrXWs4NaCsLwYRAVnF+BK
         1yBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        fh=7Yw8aJIeMmctNDj4ESqb9pbZpCbbixZPQomvySRSpFU=;
        b=BLNuGbqOa4EBx1r0IaGn4EbNwUogYelun9M6edLwbhxwgXgTQZeMsUMuwyqOgV1+wy
         UV8H8PLq+xqLIVACpcCtcFlbj0kuJU7SS3jGefxAPm0DM2Zv94gTonk6N1/rrzKSpavV
         MGyybaEs8jV0RXhjzpzvyeIbCodkXZZwS4M8X2z8gEMX5Lylk64a30QpOYIKVbOJWfb7
         +W7igwlY8iYcvs1KprNTbGeXTCwt0z04K+qPh6qs+wBSq1tYhZZ8N6gqYlBjXt3K3JlQ
         mVahOah/97vutdQ8Ml2yfjJ/uRLZOAfl5mxHXE8KMprYoDH8StzkzUmWGOgrE2/KDow1
         N0yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015547; x=1790620347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=pe7IN9f/CQzF4VA0m1JpLqlJX4z/u1P4pQQOICgdkgWZCZtv1rB4SroMZ4XoMHwypn
         F98ue8R4Cr+gy8ZiPDUM9I1ZF8y3cHKp47rDKD6NSQb/ino+xYLNJPvF/fWgsGn+Hjmj
         v42iv54wgUAoSTG+YbvHj/AO0Fi7QrMa6A7V9Djv5ucvEfc93KSCxkx5dj50iu3vdN/8
         l6LU2t/s7PcwAU5Rvr8qCGalMUJXFyVfwrhYw7cw7Nw61ZmQOrP4ppnDUpVjXN/u6KMw
         wbR0/qFcD8KtXjF1JohMhEJXsmBp2EzQNsVBMWZMwZPKABaktVgU7kbLxaBF5MRx/NeV
         5r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015547; x=1790620347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=u1EvqM/H9UynizSPTAx6HRseSZ5VVU27MxDKw2HQS5esfNs0FzCyKiuBou3D+6cNw8
         du7zcBwtO6xMmkoSLYKbvNYCu+mQq613vciXWVjWg2lkSJpYU5QuKhh7xQ7Pat0iVGp0
         t0+RDCM7dVboP75vVgLYc2MnxRkVJv4rNeGc+9wMQvIpIg8KVxS9Tde/iYiBFE68v7CW
         8fqA+W9PWFkBRtu8Da1iAyHdd8tFEqij6xejOiL9aepM+9Hh8B/h0h79zFDD5KsiuX1H
         pkV26xfx1xvCApJBOFEEmwDVBj8z27eC7F/fzAq1aSR/iQLrgp7Q2y8k2gWaGpbEdsPr
         lapA==
X-Forwarded-Encrypted: i=1; AKwUvBwcXEHBljt2Ans3U9BiXFyprmiQ3IlvGxUgpjSzuQ1p9gXyVYhEigTYUGZQXkXmNWEnKG1jA4UD63tUNFU=@vger.kernel.org
X-Gm-Message-State: AFuF++mSp5bdTrIfl95Yvoh4puGw32j2iIQwhHGOm2HTsPQ9YNCFSE4A
	ulCZlTHjJMPY1s3lJiDz6Jc7rJ6Wgw0XunoFLTY3bg9V0xCLX/1m4RFvifxf2LidqEMllffhSgA
	zFnBT4qoUXZNLQcz570JqToEzvFYDal4=
X-Gm-Gg: AYBFou3QN0yLUPkVDFSjqxoAE8gGHf9ygQN60LWnhfBAmeVSTIo6x8mQINBpxwgdbk+
	uQglJt2cUDbc6nqptY+g/Wx+e8nevGLrQkqMd6Vn2mLl2iMLC541jf8A9xEQVzBOScvSiUFdKTF
	AXjQtkDUSfVAow9IY00Em6VEqzudKkaH0JCr86DWp7vin1cg58Eqr8Gfm38PVB7/YMC/bZ7fh+T
	KknW+IvcGGEcwgY2Kxg9TGL8xC0u54TqTEopC+wXclMQuri55+vijtbVAIuz8JUM83JY4XNOna1
	LZui8Ox7fxg2kcXgSRRSxXqvXzASjnzPB2baFNRcJnvK6tpwmnTsbCQ4CCzmF54vI/XUVqkzOBh
	enIJ0Q/mkXw==
X-Received: by 2002:a05:6512:159c:b0:5b2:9f7a:29aa with SMTP id
 2adb3069b0e04-5b8c179de22mr3976341e87.0.1790015546739; Mon, 21 Sep 2026
 11:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920211356.186967-1-rosenp@gmail.com> <20260920211356.186967-2-rosenp@gmail.com>
In-Reply-To: <20260920211356.186967-2-rosenp@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 21 Sep 2026 20:32:14 +0200
X-Gm-Features: AcwNN1VdL-Fqcu_uP6CBPAY_SNwPGWfl7hrsVO4b8Qj22YVrcCYQZRsojkFfRw4
Message-ID: <CACna6ryP-ZySxcK_b+BH-5ckDJxAOXE3tVtLYWP6SYA_Re3HOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 20 wrz 2026 o 23:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> bcma-hcd drives the USB power line by grabbing the undocumented
> "vcc-gpio" from the controller node and poking it through gpiolib.
> Besides relying on a non-standard binding, this cannot work on boards
> such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
> both the USB2 and USB3 cores: the two controllers each request that
> GPIO exclusively, so the second one fails with -EBUSY and its port
> stays dead.
>
> Use the standard regulator interface instead. Each core obtains its
> (shared) VBUS supply through devm_regulator_get_optional() and the
> regulator core reference-counts the enable/disable requests, allowing
> both controllers to drive one GPIO without conflicts.

You should add support for VBUS without dropping "vcc-gpio" for now.
Deprecate it. Give it some time and then submit a patch to drop it.

This patch as it stands also breaks bisectability (because it drops
"vcc-gpio" before switching to VBUS.

--=20
Rafa=C5=82
