Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1C3C8737
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825226; cv=none; b=qCFWNKzkpLtI36rDLFx/aWrUznfMTKG972xg3ZsLd7lSh81SD7xf0y3gIWBgxiqcLT4yS/6fCRB4tB8qA/E0SiOFeX0YAHxnwIYvWDazmJHmZrIMAqWMnIQHKuc/u3t2T4SDZCSD2bxaOiaBif8D6Avd01a6lXBcylw7SSnyVs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825226; c=relaxed/simple;
	bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lf3vzkLDrKrK/NbgdRAZ5bXqPZ7L8hdppxrrq7xC5hnMHkQQUZ4ocGlvurzUq/2WqgG9VOj54/oW9BAbw1LHPw70f3qqsVdewruRzyTwvHzzAqxgLJ4XBkgGAdBD5ecFXFr5hjKUKZN0Hac7Nz2rrjbSdNlTbqF6aoTzEHxYi3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt7/9bIp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt7/9bIp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so22038895e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790825193; x=1791429993; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
        b=Vt7/9bIp+E0SZTfy4mgg0XSjYauA2f1f5EO8QS6+UqZK3MNAJbqZZgJOqE18V1gfPH
         ec0iKwUVFHkO9zRp7O3IO29/cfNgD6cP7n7uwC/WhnF/V323RWWTTHmfL/yli3K5zp2t
         AgeF9jrsTXgyaExadk+EXmV8sAkqPczfKH0/YXulc5vczfVnO/PENxMpxwG6ZmiLFwqP
         kTEYZaJNIlEgjK8YXxB0HGSR/1lxwTyvVPchVesZysILd/AoWOh+KoBwq0bMdfhxleAs
         dcukfn2gtosf9FTFSMuWlixeegnkXlcoTuPTfrgvIqDLkkLOVEeYGCLebOGfijI9cvRY
         Khhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790825193; x=1791429993;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
        b=Z2YfAK2STysBIFVu+bmOIKRvgmYCtr6mBfXfGRchO5Jc8lo+pWBqEf0/eC56KquD2R
         EhSRqhO4GA9RDOWTmiUU2tWUMRiT4tJvUnWzjfDEGgDjtFowOSkCbCYzjXFiisA45Uds
         Yt/QvOPyQ9knT3mrDInkR6WEMP7AuUSFaRird8f5qVIYQoRbIXr6PDAbVmGgHEtbF1+I
         wa5cBBg44JYGsZp0vYWS1U4NggoDmiGqusrk74gUHhEcyi9emwI3tH7Ct7FiOpLdIbag
         mxjULLIuEFQ/ASSNjgrss9U/sSzdUNvZXu/LDj66px9Ff/viShJ0WHF9VVtiEgpC6pfC
         p8HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfmCUMPEx912DqgmmFCnJvBSSK8OHCoO5e6KKifUpvOZe6GFldJxlhIFrh5XQcgWKI2mTRQzf1tn7IZkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nA7RXRmHdAZlxgmHy8wGZmCExKQATfZ4mwlxMo6B8smfR184hM
	qAuUYgLTifnliaJ2vp5s7m0zd+dSE4w+yrukqqPD4mL6KaoIAsqefq4D
X-Gm-Gg: AYBFou1cDXSXmgTtzWDUUzIVvOr1CsqomYOJWdqnqfazhqGPCxplsocWhq97Wyndnpl
	+85TTIO+QhmxfEjv0AISI61omJLhGTvxkZuF7+32VkjL4H9voYLB4kJ70Gv1bZwzTSdQjy7EByL
	85IkvPmodcdqdevijODhNh374QzD6O0pMbx2/q/sA+ZHtvfSxGvp+z54zGiR+Pu3vcPgsq4md/p
	ZQVW5VE8VzSPqI69a2u2yobTOMNzAVXYmpajG0yFdfGDhM8aL5rJHrUSenLf4Jg8+1aFk8oYGr8
	mFyfyAyv8bsJXDmaWUyeg21foKHZJNYrmGzrZ8wiGeWNfolEhK3tXVj8tZJ9gauexz0CNy6WyFD
	E5h6WroqVth+13vLwmKKQS58bS9H+piGdKwQ+q54UhKzbLLtRpQn3MTCrB977kjvtDApP0ES4Im
	J+/enN2WfSo0qF5bIv/+0bNzr4CqNzRiW3mY+hIFdC3CeiWfvgtXE60kMJdWoZ5GOxOrbn0+XYd
	Imh8iCYm9+e9FHjkmUG7ALK2ktLlmZ3kA==
X-Received: by 2002:a05:600c:6815:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a01b00d679mr55372455e9.23.1790825193330;
        Wed, 30 Sep 2026 20:26:33 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9851efsm36483535e9.8.2026.09.30.20.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:26:32 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jason Li <jason.li@cortina-access.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject:
 RE: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 06:26:15 +0300
Message-ID: <179082517588.138645.14615134489246049313@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 03:17:28AM +0000, Jason Li wrote:
> Yes, they are actually same HW logic. But the brand name of CSxxxx is
> owned by Marvell instead of Cortina-Access now.
> Will there any legal issue if unify them as one driver?

Thanks for confirming that it is the same logic.

I am not a lawyer, but I do not see a problem here. The part numbers
only show up as compatible strings, Kconfig help text and comments
that say which hardware the code runs on, and the kernel does that
for chips of companies that were bought or split up all the time. The
driver itself is GPL code; your additions would be under the GPL as
well, with your own copyright line. Nothing in it uses a trademark to
name the product.

The plan for v2 is a neutral name: drivers/tty/serial/cortina-uart.c,
SERIAL_CORTINA, port type "CORTINA", and a binding with one
compatible per SoC ("cortina,cs7542-uart" for mine, a
"cortina-access,..." one for yours). If Cortina Access would rather
have the CA parts described differently in the help text or the
binding title, tell me what wording you prefer and I will use it.

Thanks,
Fil

