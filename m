Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794220507;
	b=dxSosYe3yhyQyC3z4BumJPoh7LVFINpN4WgbD0k/h2PIwGSFj/S8KLV8xaibMQOq1jPV
	 8Uw9GIGGkQw3LHdNtNSWoHq/jfUd/TT6sUFW6/kM02d3Tc5+BIWQTX3Pr9rn97/A7WWVS
	 027k7GMF6DWNNzjYRb5Ct40k5V5mh3p2/NWn25eIIrW4OGnQ8YQNNJTpkIa1Byz5CUMIG
	 XMO1+aLUNYToRunYZBYmWlEqKtRzSv0fJGXnlPhfgXiCopg4imaH97njHzYfcHnRz1G2/
	 1bk+WsCmZHttQN8VrDWcaRpCj/H/KeAcWfCCPR6fooDkG+EBmZI31ZWk/B4Jh5j3+sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=F+yqhQDeAedT4lTew8UAL3NbzmMFTV2CQnmnjNU4sI8=;
	b=YB/d/V0AMO49Vlju7V4UEVSXYRzuGIYanQH7A5lGWQyv8R2/XF8U96TJXfYjs6vbaMb0
	 u+o4HNKkj9DNwmgP0O27abTUDVejVXX35BdeuFOQDdietbJ/ZJy/ZDFwh7hLZKJCf8A0M
	 IS18oIGnv2bD0gZ/0jFpxIKf021oGVkxXz3inmdXFsnhPl/EFujL1th/dbDxoiLzwpHVo
	 7NuFxGENep57hqT36Ptu6J2OxDKF/ZBOKp/qdejgVzQrnUZiuYgBMUxT0KffyBYSIxsH0
	 Moeqx42m0WxcASCKCqhwMqHPHWE0DFCV3QQ1GuJ5GZlpjSVyw9k551FC3OqIxSyhKOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9zRWch1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DB5606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9zRWch1
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ea7190aea1so2209715ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:35:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794220506; cv=none;
        d=google.com; s=arc-20260327;
        b=gjGe1EMdmbBFLP1Xqdqn8T2NNSx2g+Ft6S/eo2lo8SSTYq8aiShHlH0+MER0SBOx4X
         MyyZnKgxDr0qSpbDF6JEyWxzWXlCdpeYBqOxJ54tZQVlsY3mmTozRQEL6cPiFVZRu03B
         FjO+tFvvD87d06BcHru3Kqok0gbratPpOCFOU1ARQLzXcZIhasY04nAiuFu2WdIggWnJ
         ecqD2xJr88alnDNizFB3/DUucDzHY0S9L4bltKFqYXpCsLwhb8w+glZebUlr9xem+QQd
         QbPWbeK1zv53nKwo2TtGfo6vUtp4BO2wi+S0p4yVADJwTwwFEJwexXRM827R1UuSnPg0
         2wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=F+yqhQDeAedT4lTew8UAL3NbzmMFTV2CQnmnjNU4sI8=;
        fh=1R0oHFJv+6lb+SVpsoUeRw80KlKg4Ug+9rUDt2mHNDk=;
        b=oXm0zv7+VNeqiG/D0GWO0WMuZHZcHXDxkkbShrrQqKMHc35hvGziBI3N4XGEquC24F
         mbML0blSg4OeojklzkYmEuXXV94FynkHdaTOSwcABhMMveO6SLdT55CL27/FjHteJIln
         wMeaS9dMBRNWUiRvHnajwuE2cQs4oB6jY6F9IZ/RIdPJN74xU7GHj1uo7WeNSCkPu3m4
         lC3HPJpaON8LFBF9VedJONkW49Fj45vTlAdTKb7b++jf749GQznQ5m1pwV403Mll7Unx
         OXMePGwhWMOm+UQ/OIVGnzXs8lB9UXUOKX7YgkWZrY96S6N723jhCmnYxA9G9CQWBm/c
         QqxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794220506; x=1794825306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+yqhQDeAedT4lTew8UAL3NbzmMFTV2CQnmnjNU4sI8=;
        b=R9zRWch15dw+8sZKywFK4bg1B6RhfhbFMBFNW7k2r9CshMTTFRft+dSTUv+WcpzEag
         rVnhQsSvwzso4OytrxRTQWpPs6LD9O2omSsqaJEyq+lAqq1/wMdj2S2NFIvagRVyRhYN
         r+KoCTe3J3ldWhcdZVmos6s+Bu/pt0oZNM3vGtskVtR+KywaPVcSZzR8GONyV9DbvTDM
         XjJFRHV8+nHt1wAJR/yWpZVxm3pYMlK1r6NM+P/YvmGvPgniSKauXfZwVK7lOj+cRwnQ
         MXpG5CoPa9p5EYw89Wyxnslmu1AV0CZ2cArIDXFuYdcBNR3FOFk1a9rTTLvcTVFO9JUb
         Y14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220506; x=1794825306;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+yqhQDeAedT4lTew8UAL3NbzmMFTV2CQnmnjNU4sI8=;
        b=0jeBeZPtnupfgBRJlD23xyiHSBML9aKKVWGJ/X3nxuOdvm6yzJIwViQXGnqdDfvZ98
         vDH7AY0hr+6H8/wfoRXu8Nk7dvP5VoVniWwFTghEOlq9fNT53tWgFG3JsCUCy6OW5hkT
         /VwOMo5FhmOs5ThUw8rI5zWhp0Biaben7lDMRsr10y06QUx0dEPwxUPW3syVvpV6HetV
         Dq3jCNttqnu3/Xs/CEJ7mRaInLeS6tzaFBDUhZl4ELY0YViIQxAvzEDgKblSz30UBIrN
         xj6AkSuNQQaI2GyhsjQhN+wZmqtk3mPejV/rpwWGWTWRLUbA3YniKzqVwG3QhAJPYqD4
         HIug==
X-Forwarded-Encrypted: i=1; AL+hErHeYR/2K0rs0FzQNixfU3XOV/DQf+UOGf8NunaY+sl0YlZcoDKuEJEZm8TgD2v2s2mlaJb863fJP3SbR2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DR5q6btEGKX2Wq/yNm6wcDVrIOChzSkGKYDOFMXvkP+avTyY+
	2mja4GlkU+O6GLmiP+Mp7Xsznt8RYyw5tGD5pSVKOjBrQA3UHH2uJuq6N6Tv8Eb9No1H/s3FDNP
	foPZLIbG7hh3uNdM+9ntP7uIQmUl1uQE=
X-Gm-Gg: AYBFou2A5rWvnM7JuKhpJDUBZU5r9hjsPV1P6y/MVukLavI71ISWTkpHqSSobrNQc+o
	bdiqhoelnbbEh42EYKT/83+dl6o8aWjZdyqxwOosoLSni1NYhicy7tCdzqokEEJtnedBNAYvBj7
	vNpVTGtxcyJydXUqgp9vOF68xjoTmEVODKBt4JwrhK0Ph3U1QRcFriXTjdQKEiol6rjhz30ArZQ
	csot6QkNAwNJ6ndVf/sS82MbKiiBHftBc1THk7jjDoFJUgu3PHWXaDJXvOc6A0ghbZ0u6pKUlF0
	1Ia1V7gAYDRXUe5NGp2yXCAiKRrMlryxLU5Assz3mcr4cdB8muoPeOEegJK4b6KH0ROdBwAOKJg
	juuX49jaSn7SL6QmDDK/UjKuRTAQhbQwwbjA4U8bSuIJZSk8ziHfK5eAsA56BwfKoEEUz
X-Received: by 2002:a17:902:ec86:b0:2ed:42d5:e682 with SMTP id
 d9443c01a7336-2ed837c255bmr34675915ad.41.1794220506202; Mon, 09 Nov 2026
 02:35:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?THXDrXMgTWVuZGVz?= <luis.p.mendes@gmail.com>
Date: Mon, 9 Nov 2026 10:34:54 +0000
X-Gm-Features: AclHuK-U3DKb3ufYToRYwdsnyxbkh0WoJb17z-XizpY9m9_hsc3E6wlTiHHbwTc
Message-ID: <CAEzXK1pdhEyOgQ4owkeRmyEP6Pyfhk=OsMHdzU4xwNMCmCsd6g@mail.gmail.com>
Subject: Some observations regarding the ongoing x86-32 CPU configuration cleanups
To: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

First of all i would like to say that i both admire and appreciate all
your hard work with this lovely OS. I do understand that maintaining
some systems can cause additional burden on maintenance, but there are
some aspects that i would like you to reconsider.

I am writing because I  believe that some aspects have not been taking
into consideration regarding the removal of the 80486 32-bit support
from the kernel, namely:
- There is this active Linux distribution:https://tinycorelinnux.net/
and the Damn Smal Linux DSL (https://damnsmalllinux.org).
- There are also these CPUs: https://www.vortex86.com/products/Vortex86EX
- There may be only a few vintage 486 systems still working, but there
are also other new x86 CPUs systems, especially in FPGAs like the
https://github.com/MiSTer-devel/ao486_MiSTer which is a 486SX core
that operates at 90MHz and can use up to 256MB RAM memory. There are
plans to update this CPU IP core to become a full 486DX core, by
adding a FPU unit to it and would turn this into a usable Desktop
system with tineycorelinux. There is a considerable retro-computing
community that utilizes the AO486 core on the MiSTer FPGA platform.
There is even a Voodoo 3dfx accelerator card:
https://github.com/victor-fisyuk/voodoo-fpga-public.

Overall i just want to inform you that some new x86 32-bit systems are
still being sold brand new and can be utilized with Linux. I would
like that you consider this with regard to how much 80486 support
should be removed from Linux.

Personally i do have plans to extend the AO486 core to have the FPU
and would like to be able to run a modern Linux on it. It would have
entertainment and educational applications. With tinycoreinux it can
have a usable desktop.


Thanks & Best regards,
Lu=C3=ADs Mendes
