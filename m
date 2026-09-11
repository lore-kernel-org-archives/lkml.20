Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA49175A9C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085870; cv=pass; b=fe+JnIj8/vJtX3vpJ4yCr/EZmaCHS4pt0720l1x0NdsDHMYBTYv+apZddIboHEHnpG6TkJNkzenVtmzXJ9L/BbS/uoRphZoo5CiJZExHe/OMGGLjvpIFmgLuFN4s3npJh7OPdjRoyK7g3g2SXlUxGJ0Br3v6cLxu7krXh+4bsnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085870; c=relaxed/simple;
	bh=n9SrHN+fgpLIqi8Itt/3HtMz4SuMQlkWH/sPrxujiQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOG1wWijkqmmnhZb0zlQdcggKD81ZCN85gEcUNaewhHd/yh3J/qJVU+FbUJeUVAuvj6+ntErrgv/3aIqkr4rZC2ql13zXDTs+luwGMa8fpI71zkGb/n/2tuj/dd+Pta97bdSNASpmyivO7Jxi30ItQiAlPgtQL+HuAw5wqO/2Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw7fOt+h; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw7fOt+h"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19127so292715d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789085867; cv=none;
        d=google.com; s=arc-20260327;
        b=rq1xspaszMO+ctza6w28Q4GemoVRsyVVqHyeTl8ZSG48dxHS8DHu5xCwZ/dcf9fqIM
         j7sxfVas+0HdO9E+m69V6Dw30owPRVmo+q9qRApVjX3L+yd9MdxycEnc01S271TzTp9W
         Cqh6Cc8z4/TiG0sWqdQwB9WjWwk8EMGHz0DEKTyVBn1ZgTrAD1JnZCer8Fj7GmOhU5kC
         y1ZynIT1GYcsZYxnrP9WSc49wmUAt/phf4YbFDsgsGsI49yVAoIIwR/lNUYcx/vD9Kni
         KL6gn41YMKMjzpmjoWxJHam4ijmOKNTpIEpNp8EpELHL7sx/DHBQLQ2O+CzdtSBemH0t
         Cnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n9SrHN+fgpLIqi8Itt/3HtMz4SuMQlkWH/sPrxujiQE=;
        fh=pvE7cZ9kQaUnCYdPEk0S717kXoTPBcF4ghbdc4j4i8o=;
        b=dSSL+T/D7w2WWDIuGkFl6+HwtaqA/uXPDEJGTiffPI2ugC3lY6VxzfvGIAvtI5LOQW
         qRHUVeYoP6aXSvnnlfdJVum4/Fu+MB9eKu+ao3ohBxCXCdf8VuSC5wA2BphilIkaota0
         6Cp3bIOkHn1Whq4DPCrz1nQccWyHE/VyJmhJSb5A0+QSx61B5/tFh6iifjz2aoNnk5kN
         3f5vXXbbei4KPyrwdwbdqxp4vEoUYZYeFZGClSmc0iccEGTRyK800UkTOlFxHAzEVJoe
         6NFPcEngRF4gDamr0cAby3JSkWIh2K1ksEbmKfopiXokyhVWfCfqRwcMimM3qVkRSrQd
         3nTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789085867; x=1789690667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9SrHN+fgpLIqi8Itt/3HtMz4SuMQlkWH/sPrxujiQE=;
        b=dw7fOt+hq7HIFai0TMaJanw+O/NBLPkg4rJxQqxAARm5dFv8/OoJae2EHzw7ga+coz
         aiPssEzcMISTt81V4EhhvfPuqRWzzuDUHkS8IpmXQ0qpA2SpMCz8YUB9kOL/7FopDlqu
         MTdf9ralrZg5mTKSEYLLZ91J/bdNFX9T6UPQViMr6wfjHCKtcbEShzetJz1/lZFNU3Qh
         l7YxyjrotxiTNdmuZeGnU4NcTwNJSrwL5pij3H22RyoCccoEmApsI2KPjC/QhT2ayUaN
         WAlKNSjaF4sWJ6TxfFxROaJbuP81wDajofDlXiZ5rGzSy6He8gnIOBHO1jqpHHzA6Jex
         UQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085867; x=1789690667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9SrHN+fgpLIqi8Itt/3HtMz4SuMQlkWH/sPrxujiQE=;
        b=FxxjCu2MBrIIh4jJcJCOgj9VGc2N23MP/Gj6WwsHCOmcvo/EXufsx5pT1IGYBlro9L
         DKxWl9BZXG2vVcKGJgntW/NrzbMyuNyP0ktF8dpW8tRWn+yiIvLsnBaxORX03+RnJQpU
         +ghFvrf6eL+4x924n+9TmfP/GCsJ1Ja9yLN6r24ShOj3hsU8vNaFqyubNy+5Im/2Ep59
         HtAevBbb/ItOoEdAtl4gPOCBQKLLSDfKMrmXTBbs4VgY4Q3gbyG3jfnM+zyBfIKqaipr
         aDItMo9RoBTZjNUMyON5gnE7th0r0TPd9lWE5/tjh92lEq0yJ3C0T8VuuZaAJDQG7VqJ
         2Gnw==
X-Forwarded-Encrypted: i=1; AKwUvBxYqEUac/zlvFanH9Nf8LlZTemI0nPM8WdUEgaOcjq3MqYSz6Q9XKTWzLQ0OyYtDJ+2ILcx69qXE2O9tDM=@vger.kernel.org
X-Gm-Message-State: AFuF++kMAkuTcVozC66+B+B9mPncFS5S/XavRP0dj9Sd4bcdc1U3a0ZC
	IAJoPy17v9KF+o1dsRs2ICTAli5J1l0bGUYiaXmfM7l2aizP6/wjb8K1sRprabwIfsCB99UAKWY
	qrqnd8cqjYPkUVHJRvnLb0JtcWfipK9Q=
X-Gm-Gg: AYBFou2dNlSGr1bKxucgYlZ5mmJVPOOQRHnWAOE2Dbhi6GiUkQeap3ddg5THsUxd4Ii
	67ZoQrImtSj54KAj7wqCtpcrmzxiviGfQTbeAuvuyV0M0YHRIFJjalC09ErgarKg6J5kdkIuHgS
	bFTXGyeAMG9ezfgLDFDy/Y0gSALtLdV59U8godoA2dMOBTW4+IRR3uARRsGj8h+Fn12Ty1BwWrN
	dciLcV3IxvClpow2B7oQx3laLbu6v3D9ojKB1hPWy0kC7/n0pc4GRnKXSsstMqK6WtLgIybOzgz
	V7A2L/Y0zUT00sL8j7jnOvhIWw7veqKCRCbzGt+L/kB1P9d/fmT0JKKYI4gAw92Lq7TmHXP9rSQ
	Y+D1BakyZpUeH9Nf1Ziy5uijyQtpTJkALIMpMnCgdauHYbDrLduOQSkrFRE/SqLsPNssTZfzMn/
	vJkklgYzs6ZSJEBX7E9I4bzbRgWJUwDqKraMEO96LqhcTaknfL0VaDtw==
X-Received: by 2002:a05:690e:4501:20b0:671:1feb:199f with SMTP id
 956f58d0204a3-6712473278dmr616377d50.45.1789085866400; Thu, 10 Sep 2026
 17:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827093948.2825531-1-lilinmao@kylinos.cn> <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
 <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com>
 <4f3c7184-1b5c-4074-b8a1-49261833df8f@gmail.com> <a8cb0e4f-a2fd-4478-99d6-fdb043a9d15c@gmx.de>
In-Reply-To: <a8cb0e4f-a2fd-4478-99d6-fdb043a9d15c@gmx.de>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Fri, 11 Sep 2026 10:17:29 +1000
X-Gm-Features: AcwNN1Vors9QLM8_x5o0_B2FetldnvezlCJ6C1fncIRSIhuR9h5MtKq7gbNFw8c
Message-ID: <CAN5rfbQaXnYJszenqQvP3i9TSE500UJTgTQZUtQVxmRsqwQN9A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Helge Deller <deller@gmx.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linmao Li <lilinmao@kylinos.cn>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Sept 2026 at 06:39, Helge Deller <deller@gmx.de> wrote:
> But I added a
> Tested-by: Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmail.com>
> tag, if that's Ok for you, Miro?
No problem.

--=20
http://mikro.atari.org
