Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.165
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648495;
	b=HHD7sVWjJ3CY4EBpeeOtqmchBCzwkkr2mpq+v9jThPK9lcPehFt/7buNST1qvSpyPIso
	 gXCD5OqSIVKKEQtB00UWxm6CY1GtTKIa5rZHghLp4nT8c+nBS7MBY12JD2VJ41OvbkJhu
	 uayo9q6aNoB9ipp+C3C3lDv+yGFF7K238fw2hE9Md5AD0yq7q97mC3WLnySniyco+BzGB
	 jEz6mgPY8jNXEQgXjNbX45Hpu1oQ4vhbQ5AUDCrG+wUs8xj9jI0P3UwSw9Znr2++V+ZZl
	 xqQ723EzJdij3z2kGjnnZgcQ2nppJ0rGdDnPdHpunKfq0+7XSVcZ9Dr9irzaEb0gBTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648495;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=IH9t8292dHT+5iRnRuCTQeBS2dibh5hu4FM4clq4gA0=;
	b=OMIzqZ7e5n/mtmgtOGPansvqXXfhttFo2YKgQcC0TZ7udA75a0AAHNIWa/wbiwdfkhb8
	 V6s74OYLXH1PYmnH17pIhan8O5+F3sYLGBCWu9itOJEX6O8wiuXOCdoAavrMCIcEr+hEY
	 JLUXYApmt807ZcoI7ZIyqjjI/LQ+pKFgxOYomCit0GEQbIxu+8Nb7WplEdEzqdS+s8mEV
	 FS94mIgSjeQWhA8W8dT2UTkDi4Li7fQf5UjV1EjlTM1XSLqOAkeALspDrOkqvYO6olFgT
	 3wiCI4AuHivCGfNsX++QtzaG8UZbTVtyiHEOX0Wg+nDiz/MJpNxa0E3k2dgUFO92Nmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=SjtSqfEB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.165
Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63016606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63016606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=SjtSqfEB
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793648492;
	cv=none; b=pRTPfZIY5TQnfVGVfcBlEQGOY1PnAo2rYkZqQgeP5xV30eX/r+3NHjCsxczpn55MYJ2nbxdCLo3TZbqte8ZRcQi5+AvAzeMSbqryHBW/x+tXO3MX2tRMFOcnYJT5M2sfRbYqzH9ktOptf6wsR74kNGChQRe1GWm4SaRzTYRH4/M/xYe6X3SrudDgRV8s51uEqrdAF06Ct03Y5oEmDuCfJTso7jYPk5UHVFCG709+oEydFhJsMK/XtXD7K+BQS2doZIxYg59ZjkNJRaQnaZlINzHN+0hWpPYf20Rh5c/4X/28lVdnFOPQT+Jys2KjrP1k+haAF8cVQ8EH/z1T0OVSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793648492; c=relaxed/simple;
	bh=IH9t8292dHT+5iRnRuCTQeBS2dibh5hu4FM4clq4gA0=;
	h=Date:In-Reply-To:Subject:From:To:Cc:References; b=J+C2EOqBk8drAxJyhmBO6V025//GNOIs2P+Hdy4djmWCOdGgy3xVKNRjjhVPTkGhGv7sL0u+svU90NHShG3/UuNY+eHWStRAe/bqpopSKp5ykktLHHkzldtm3xg5TGe3SfuO6RuKNx7qnDjubcb/dFDqH/UkCRyHhf1XpjVOO6BcC/bglaG4trNlzaAitKY1XC/nM6m2wzSOQMp3TkzC1Zxeujs2kQOpRbAuwqjVcpW22M1WQTFLPr3O0krdDsUHwpwqR1pQmXXMAeALLdAvUs9zzYfm1FhOhwDE+YbSmmyyPby6bMKGuui/gvarUw45DEr/4RdnhXCOl9VZDAIpqg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793648492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IH9t8292dHT+5iRnRuCTQeBS2dibh5hu4FM4clq4gA0=;
	b=SjtSqfEBwTGD8tuu/QT2Z3b4kzKe7RrTzUYzNyD2dMlFMzqJR5LyW35+LEtjfW+t71UCPy
	DdTi5vwN9T6IpaNHve7ylgU2gmBNJWEBSBEoM3NnAw+c0Pf0eHXSAoo5h5++SLHV+3vUlL
	2X+ntKdGDzgZQvCFSDUyF1MnfLsdwFc=
Date: Mon, 2 Nov 2026 20:41:29 +0100 (CET)
In-Reply-To: 
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: linux-kernel.supreme403@8alias.com
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Shenghao Ding
 <shenghao-ding@ti.com>,tiwai@suse.com,perex@perex.cz,baojun.xu@ti.com,kevin-lu@ti.com,sen@ti.com,matthew.schwartz@linux.dev,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Message-ID: <179364849173.6.15547077920953953013.1741098232@8alias.com>
References: <20261102174052.1216670-1-lkml@antheas.dev>
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1741098261
X-SimpleLogin-Want-Signing: yes


Hi Antheas,


Confirmed working on ASUS TP3407SA with Linux 6.18.59. The speakers work fi=
ne with the patch.


I=E2=80=99d prefer to keep using assembledev for privacy. If that isn=E2=80=
=99t acceptable for Reported-by or Tested-by, please leave those tags out.



Thanks,
assembledev




Nov 2, 2026, 19:13 by lkml_at_antheas_dev_itvnlo@simplelogin.co:

> Apologies, I forgot to cc you.
>
> Test and report back.
>
> Antheas
>
>


