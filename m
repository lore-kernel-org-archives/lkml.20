Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41264409604
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832481; cv=none; b=eFZ7a0h6oSC9AtEj5PkCEJe2ivYyLU5UXCnCrCj05bKZ3BSz9ltmGwR8yOxAFx9mJSW3FTk4r7eg/YMrko2NU11CrNCovVYuMVzAwHmuYCWkPfNAWmL6TiskGC+MrJMigqd0uiZhOuMikDWHH+5YpU1olrziumZWxxk2HSxV4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832481; c=relaxed/simple;
	bh=Spt+UFjBXJhc44j8DHEYV1c+HqSHqqXAG/TyMRpCf5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WyUN3udBSYzUTTYCyjMEJUauHeKPVC1/HBep1tdXO9lt9x6UkdE62eWXaf82w1qIikLSizo8GPdX+fcBDWbF+ZDJP6fWNP7+IKjwIjKNAmJ0zfivxR9V4xCon1bG4KXGFcf+VJbXLC3PwVy+vKj4+oNc0N8MI54FxowBWIprZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoBehnhv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoBehnhv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so32151685e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832478; x=1791437278; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVL0YicU6s4vWnH0QGlqg5VqXOz3HA74QxakKY7UMwI=;
        b=BoBehnhvGnEwe6RqurJZxA57cvqIitsXMR5OWAilkmb9oVO/eR5GfMmbMMBwSv+GjZ
         AOy0N8/96rqwMgfGj9j7VmQLeII+N43MfI01JqOVjpXbABlpfAnEAIdWZiFzQ/+/C5Wj
         R3ak1GI0Ea/uBnAHw0NaVEmyWRSv92OzezGB9tu4R5Hw7ayYgKJwaWO5OXw5++Zcc84m
         3n9wNkKGXZX4yQduFkfim/DqxvC5f0LEeSXunHsijZA/CW4AKd7yVNdDPVSmjj1hqvDT
         aXE+O8HbKD8FLmceXY1y7QXaj24yGiIdXNpEwLmZ/abtDoE2igfwbPS1hgRvRaUrw0tC
         TT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832478; x=1791437278;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVL0YicU6s4vWnH0QGlqg5VqXOz3HA74QxakKY7UMwI=;
        b=rpIRtsjycu6aEZLUzBDcta3Y07WsDxU3ypDGDCn2xlkGPjELO+/m1nCxLUgVcWIb+q
         09vSIb3AWSCQPCyl3dKtkxmhGbhY0XEUv0FI1QjUkzJmaZe9PX6DxaMEtiwu2NfKrQiW
         Ne4aFJojumg5eNQmyPw34Qts0l9mphWICJIjCZgg7ty1VJI/8Irb3ROLN5A2MnC6boO4
         R1oOIuO9TB6V5cCD9tVwYKXKsxMEFLrpxLFjyT7aionMnOWCYNowDFhd/+jMO804gDAe
         gDgp+RQhi+CiGBq0Y8l+4SLmbK+rQ05fdYh3ZJYgrsE2TOx4qImEI1a4NbYnPkyRH0vB
         Tbqw==
X-Forwarded-Encrypted: i=1; AKwUvByscmWP2e+9cxNo8cZmcF1x08zieuX029rHdmIT+huAEN97ZPyalPt/Vfba4NEyMUC2AxWmE4PCT0jZmNU=@vger.kernel.org
X-Gm-Message-State: AFuF++lvESywA4WK/LVAiqBvphdfTH2BmSomT2jRjdbNErR9Bv6ys75/
	0QnO7OasoF8Tsz5ZboFUPpLkpVp2Jaa9im9kJvVmGHWGrOFKNKwxwLDp
X-Gm-Gg: AYBFou30YgztMmLbzrKzM6FiGgUvB/XVRiXg/gYgISvPW1bJIfW7Zn2zDm+fohFk6o5
	t5BDfnZt83yozqyHGACjn5yiUmYtnVK+DxicaV5TXDH32yO/2jDwmw+8Hcud/eKqfbBl/eCH5Gm
	kkfjGXaJ7Hosc7Z71qWLhW2HopdADuCt5JcF7hDImZTr2yVTwUpFsITlmIEjIOcDi2sZoQXfaJ4
	oqJwIuyX9VY0fJO5+0SHs8wuZCXvdy14brtFx3lD0XlOOCmMlhVXxKZgYhBPUMXi2LZF7Igk0uv
	+0UrgNrNwj4dJ5wU2GgqsVVRxrB2omQTz8fmgOrpdNAqY3ZTkp+eLPVAC5b4uF/K+EOa8xCLR2C
	aXqNzsksRNxCZSKrIukteO1qDXkA44s5fPV+zIulLUezH+w3puOT/p6/eAodgh0vJmFW11YdyM8
	WvaA58TVDDVuTYp56PrASVcRDpCB7d89QNei7KA2NI99mTZZxmNwbE+TV7w5bFg5SFR9Pi+RE/d
	WKkLTMumdazrUB2vVucMzpEjU+FLZjGF1l9kvN+kOw=
X-Received: by 2002:a05:600c:4687:b0:4a0:3a3:33e2 with SMTP id 5b1f17b1804b1-4a01adde08dmr57434805e9.5.1790832478268;
        Wed, 30 Sep 2026 22:27:58 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979c05sm64944975e9.3.2026.09.30.22.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:27:57 -0700 (PDT)
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
In-Reply-To: <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com> <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 08:26:39 +0300
Message-ID: <179083239972.193541.4791387611943615705@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 05:14:59AM +0000, Jason Li wrote:
> We agree with the approach of using a single UART driver since the
> CS75xx and CA series share the same UART hardware implementation.
> For the Device Tree compatible strings, we would prefer using the
> "cortina-access" vendor prefix for the CA SoCs (e.g.
> "cortina-access,<soc>-uart").
> We do not have concerns with using a neutral driver name such as
> cortina-uart. However, for DT bindings and related documentation
> describing the CA devices, we would prefer the wording "Cortina
> Access" to distinguish them from the legacy Cortina/Marvell branded
> devices.

Thanks, that works for me. So for v2:

- drivers/tty/serial/cortina-uart.c, SERIAL_CORTINA,
  SERIAL_CORTINA_CONSOLE;
- the CS75xx parts keep the existing "cortina" prefix
  ("cortina,cs7542-uart"), the CA parts get "cortina-access,<soc>-uart"
  when they are added;
- the binding and the Kconfig help name both families, as "Cortina
  Systems CS75xx" and "Cortina Access CAxxxx".

Arnd, this also answers the prefix question from patch 4 for me: I
would leave the CS75xx compatibles and the dts directory on "cortina"
then, and use "cortina-access" only for the parts that Cortina Access
made. Please shout if you or the DT maintainers see it differently.

Thanks,
Fil

