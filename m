Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B24D598A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953995; cv=none; b=Pi9eIlSIW3GwhotOGJ9cxjY3/JdLz3UP+b62PxH2zEwXE5PQDvVgboDqmSSfkHJkZMJq1AFcKzm51iQ3BM/dtuS/670m5xCRj3ncgn/7k1iukxzcC4/jYpheK5SQrh57fsFTW881yjLW6Zz91cMwRvoumrjBpYO+9NX7XtSQyu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953995; c=relaxed/simple;
	bh=4o1FomOxheLPF6sJaeyVk0IyaHp/K9CWTLPWqEiRt38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXVSsO7Mg6m+yKEh0ykE7/zXJEtsUe6d1pF408Cm4y6ImlNTsPIgFChEvhxHYgouhPiv01aVLppHy+UvHEKHC5orMZb6BGxvkY4hWvqLS2xHQ/bzbFKngdta72ita9ImmXYY0iz6ehzKzBVjECxdS9BNRR7eL5lB1PBoeNVlQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LICCTdDO; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LICCTdDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1790953985; x=1791558785; i=wahrenst@gmx.net;
	bh=4o1FomOxheLPF6sJaeyVk0IyaHp/K9CWTLPWqEiRt38=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LICCTdDONUQHLDVVkGQS6hXzrXLEHKtns7bkD/9WbAFa6R4ei/MzoA+qcOXOFgOZ
	 D/zmgSFwF0nshSCMXJrGkn50alNSJT2RYotpI2uuSlY4ZELq1Mx3xiA/S2syjILA/
	 AidDkxMtfXMTUGi459kdXoqaAitSZSruD4zaDy89oYGSgr/8Jjnlu2O6Hs0XdR5gf
	 gDG+h/fbfQLHmQdVwlSLZaWGp/wo3srFad4VhgO8d7kkRh6KU09NTzF6XZM4q24pM
	 2fG/wb6ZSduhkQ3nHssZdDbBdfDtGTaZp7+cTojEf/90RW2Z7yM22xxNs9t5NWuMm
	 sSQw+lGkC4+1cmdtlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1xLx2F1oly-00P6aq; Fri, 02
 Oct 2026 17:13:05 +0200
Message-ID: <ef540a61-22d2-475c-a5bb-a7df8b44ee19@gmx.net>
Date: Fri, 2 Oct 2026 17:13:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: raspberrypi: Clean up local formatting
To: Markus Elfring <Markus.Elfring@web.de>,
 Triet Hoang <triet.hoang.dev@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
 <ce9aae9e-bb67-430e-9e2e-83b27265f489@web.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <ce9aae9e-bb67-430e-9e2e-83b27265f489@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6LdBae4KhWUzryRh/ZnZfg+34/fV//pJ3DME4voyXlQCxKFhPxm
 V69S87Dm/Osaupyhs+YIAjtKs6+f9FyXtBqLDjW3WqkIy+JmZvR3ZFMpMNTLU3xETEB8oWc
 lGyru42kBoMLsP/Dhcpht1/RHy+JoauQm4Im1TpS2bKn56QMB/wA14k8or8ozx9q9Zva32X
 iG+1aW/ic7Xpcfw2bV5ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LVIhBlhGp4Q=;VEt+QOQACXbptzmnjAwMcLYMZnj
 IH2OYL/ywsmOlzn0pAgTBMmeVr615XNVG3OpYxVgSBS3omrCQooWzgqX23HCzQgGcLW6fIZTZ
 nUSCXA6dkmD2JYP900An2EohhvBOC0XSZ1HJHdm4sCI/qcGnLtngo1fFX4SKyv8vdcyMuliw5
 r2BSQgI20XUuaPMczp1quPfVED6T+6BHHrDuur3Y9r+Fofo1Fo0H5U3wzXAOJjsn15/ONSVrt
 YwdZoizejV+pJPnQMpL4AD/CK2AygylTVcXkQIIPVoy2YgRIfo+BHGqSAYtGk43jHI5leYuXy
 R08K49wLQqxyatyYQdTsBoDpqijCl0wKbpwTViBJ2Bah0Ce3baqg1xfBJWLAzEyMRQCKD5J+w
 dfYmPmG0stqQffajCBnXOk/CqjBNwSYgasxDtLgcdQkcx3Os5tG+W2V6tb2rkPbxUQc11IZ6f
 /ha+mGo9Ik2FWN0ZO6gxmXZUXyZmJPOPVcD3hxpzApHiaL5QzJ+uJW2IZZ4K/6K8SXNpjFWtP
 +zU/7pHYDWrPP9SfdwfJpVRk2wJbhvF0rdU3/DH28PdZ0H5WKlqTEb9pJQWAwsUkkcOW2PXwC
 QuOcQ4KGllrgglOLGdE4GvQJDswRyZJZ9lTlXfpp3bFZLLGValM8jSOpik0iW+JKdFKyfYH0n
 K0r3p5HzPsGcZMso5p0u945P41RLRI7Vin1ujmsJT6xELo0QDFwDBv1E60MJnEXAGNoNzs9Bh
 FTlt45fvTDZJW69lxvc4KS23W5xiLWig5lX2NJTJTMp5qpZkJhxdPvo+DUcmPI9n+9JVj+i1a
 86Wfw4mwTfruKJC+G9SiyWufd6J9gSI7xnK0CalVfMv97BFtSO/NBJjRlrGYt7zay8CsPLIzK
 86Su12oNsXOxpUPlNNF3tAY/IrowowjU+L1JZa6CjP1L4yam4JBEmfY/yxYGyFnT49uuyN12v
 5ynB6IOlfKuT6jfYnSffUFdRH0ViB9beTBWYPP5Vs25GVzy+kxNCkRDpztm/QqUO28j7I+Srw
 hzxMFvEE8cuf8savylf52O1xKL0L0SV2ynVEW8p4Ra/1OcgdSuUSKeER9s+A8Mm+gtt6CjBrC
 aTGZa+9R9rv/nbvlliYNOVSHUV7TtxR4lUNvxzz4+5msiROChbF+kNW5SI+Zr6q+mzN2vIYJg
 cprEr5DqPromy2ARz70jxdqViheiMFGlqp5laEMu6yfnAixx+N6bULT+felrvVTzlQJ03+JB2
 DUR4ywuf/hTaKjDRZ81KVYDKY0PA60mVG5MqvdQFfkDOdlWDdH8eSXczgJaV+4mOzP8rBXkOw
 6y2qCdel+K61AaIPamrraDA+iBvuWJy08ApWg3HYvQ549NMXtiIvzj/yGpqr+ryvY2PVbeM3R
 99eLt4CRKdY4DfBfjbodVs1JTXl+Xp+e/cW4DGBwD7mYO9bIYZaZiT5H5q/dTOsGdhhC1SSsu
 WV1JsXWr0Be0coor00SNPXmGxrHssxZU2HIMGD3m8EzaNRmc7X61QlQ/t06kJstTKg6uuBJs1
 /lU1BDSlYZceXHixB8Av5ROWTMReCpXwd7FAfEyTblKwLm0q75VwbesP0wMjsWGcKwilx+pxK
 9kw8/iDqbLSoP3qcCJiOgJyqceGj4ATBhbzZ2mkwz9Tyv1oECU1VRClpm3louaQQugW7Hk2qr
 wXC8oizdEOYaSt7BFJz5NrS/k1nAfKzWqlNZElJdpZeTzK9KNlMj1TEO4csczxQdXP+K4+GZD
 tD6kjCFXE1Yqlw/+959dWDH8zfmj5mN6FGAIhS0Qb4qlcUdCPca5Xlh106yUN/HDI2WPPGftO
 e1s2kFs0xcpbaF9NzHETRjs8mmvzIitYs1rYfeIIco93pRImVLIq1EDXKvFQaYqGA2SbY3Ho6
 u2ZoD1QyVZbTKfxS/Q3mA37xdO51GIUrV0eQRsYsY2xG5ZV+kswYfy6wnbwnt6blJ5KqF5p5N
 SnYi4BsBdRN2LIpd8R//SVL6w86HHIzOem7lLHs3qeM9EWoJ3MYWX6F4yUqVZCtBeG/ClCN5v
 CbsGuiz8UWJ0f/KulMRy0BbxTmzGfAvDb0y6fwVuPeDd4on380dLJGQainTjVqlIrQnzfwhVu
 /9j5iZzDfF8Qk9XRyQ8cWpnIcJF3ZTLYKiFFNPtWhra7Ke+ESQHFug9U81UNUCFn7pPvmh+gp
 lgYkZ8Y/H40RZwip+N3wi98GieS1phEy8lLpLpYDpwHhR2qSx9xSvv12R8DSLtDcddLCuiefA
 1jeMetWj6hfe5se8eMH0iBzVVhXVkShhw8lXDwGHsmbrHX65RI9iNY7qKjNYw22164w23rP5U
 +FSrUboXwrUpR0hZSnehpjhUOl4+o3k9foO1ObmfI2XP3Sm5Ul+XII760b1H/yQ/3s6Ae7TyS
 MkMsdfK6b1ya/WoyVlXZ7OJ9HxcLNa2mFdhVQ+/X8nNvvmjuz/FXtH/h9OHqni1hXz1bKDWFI
 gAAlQ1GXKHY5ImRK8vYjj150PpMKpOxDRpiZp5QoQ601GlGSbkFOF0C0MdZE0/sq3H3hNgTfz
 Hsvauw7NVw6vaHzRUUQ+mmk7hWnPOH57YK0n+cAul8UMyQ42Vd8iKQI5Cs8uwkBw7TfGJwg0/
 HvFiGzk3J7aYi2FqYx0t82DFrbLO8+vUOhsCshQ2OgNOhHxXQg40KoI8v4TlL1zwnFFahZDCi
 uuHoRkTRCb5oxGMghPNdvbdOyyXni4HcbJ5IYyYXTAA3VUHKWh/bupRTadZyllnnKeev/8Q/r
 O1dg0nrsJKG32QEUuLia4Kppq9LB9wCPjswso0oLbJhyOoFuoLQ4tc7bOG50hIq+MNozUZyls
 xtgR1QF4MDTEXR23o9IIVxPloBDKXzbtv1VnucI1IaRMxMe4R5Bq+ig73QnDv8DaMsopWQoh1
 vx8JQUlWywzxgUlPFbTQsVKaextHLAKvyNi6u/wbs4NjxCMA+k67EbAktF/S6CzX6BsieiPSM
 Ym9yyXWTxoKhWvY41ih8HzBX19o/zzYwUK677+m2zKMA9OBWZSR0VPMfj6ZKs6avLNTWSymya
 By+XC98LvPTmdVJX7oXG79bxCK2SBEJLdDPpw5iV8XGm9PLWoAi31YfMYzME4VvXezctvlyqH
 peMjEq7E+5I/pFrsIgeEQwJPbfHvAUAPtMFHf4+26++Xcx6bJoNUpJM5cFMRjP17Raz8UmzGy
 R/bUC+dw7tyjkBWC9H85SOEfU2ZSbOAgd2zIUx3AFxxbk/iF1qv8YH7BI+n4eqTJW79Z1RZow
 Dg+HsTHkCnXKTKINCj9nQsOKLeb9U8XuKWKEC1JZ8INhdkPzei9Z7NFoF4Sd4dGVImrsvy5nb
 XRKDFz7kOVR8hIJViyfefhUsngGVlt8yD0iTaVoJA9kTuIDcqHMAXLq6f/G+9jCREonFMmRze
 bVFO4dJHyb7di2u7ab79X3S9CBnoKMo+vWNMd2UFpCd+cAzoECNTX6Waoi4dP8Csnsr8wA4jz
 QAVfufQoeJJi3CnQSWQI9IQtLV3LAnNsFq+6gskJ9gSqzZ/zge/RvFUyOWhflGawehEYXNhql
 cOyPlr6eC0uikTeRIA4kPErAWmMnhPWVlaoePYEJDtotn1Sts5OVaim2/kI2qC4cbxptXPejW
 LgOAz4bx6EsId2evf9jxOX2Fr38ijxgLke3/KlqPHUaA0Q4fXfQd/RS5DT2ZlmKkftGSwp+/G
 5byqR7YWgxQ9Od4BzPN9P6zvOL+f4p3HnQkGUTnn5CNYhD97GUsgJdSqep20PyKPONdZ00tA6
 OeztNArlU8JO7ozU/opVfsVRISCQwAYgVlF7njz7IEvDOZ8OTTtnMQtrUCA5jK37gOgitIVIF
 CwxFgOu++b3EgTJCidp7AlJDMeWb01ZF6r6mgN1Zj/nY5u0rVlda05/aPuGZ9p78g7KRs7gzS
 B10K/GIuQHbzzLju+FDf3naftNlef7f29/QgLw0wR7gReWyjX9yJtuiBgMB30wlh5IAgq1pSu
 g5z9j9y/i32xRQTiGS6pVEkWG4zEBEEDR/9E/CyaTIxvc/SxSO5WLtnmJkHbAOu/noT54Dg6x
 mFRqenii/aECNIXMzdNpdzqg4+H9vUajwIrzlIbLxJutr7rCkzYryl1CRo56TVBUx0Biqdt8H
 1Y35rcWLjWc62V0+Xx4GOJmHNJn3B9v91RpPg7/QV0Dy484FAf0cKw48w2wbdahuxlS6X69yn
 yzSrXWu0FNAJi2tWxKoAMTuMlt6w2CoIm8VTuOhDcxTOlX+18swu17fasJ2pOq49vlfe1Po8U
 PKJjLbeciSUzi2MWNleOSSjU0IqE/fXyC7xcOeFauwIwJQXFvvTSR9H+Rv0z2PUMmnKw8MFsz
 pXJj+uDVuoI93kdY7MAxCom6ARWBDcNXZCspFtuItc480MTuT9hvnthTwGnVsFAFk/B8Soq3o
 qIp6LyDPfs0m1wjL0gz39RbDT/MtZAndJowN8zrZEiqVt3DjckaOXOIVjSyg7QiNCNzPof3Er
 8q6nN1jEYgOMB0w6QszkbH6MBp4HOPFxbA0tRgJwIeJ7T1c4XC4pYxJHQe7ujcN8UWSLzz6vr
 RDeLyGKIem1wVcOBFqGv2CEJlm1wAVKa6vYbWBk9Iuv7wTVp0+PCjX4HOfn72mu9aIUpNrkY8
 2I/njZ15jeA/XaICX7bCTkNesH8wNVAMWeRc9eDsnNgMrvXbZ1AWSECrxUWpHmGy0GyBCEsMZ
 W1kt+jVic+m68RHweD0yvBN1ui5+1JAKmPl7kT35pMX+9XXZSupBQBzZKEVm1yrpIhZlPESlQ
 McRMO0gnvPk01bpfl4+08Eu9f1Yhvp0l3d4BsImt44QlpIP7CPMcIuw8C9lAcnbGdJ5pypfwu
 tlX/rG7npDjMISgfPer6kHWN3+u97iISP7j+u2bqBxcfmQyXT4BXrb+Hca6G4H7s1Xg43LEkB
 yFfmqi8b0yG7cCPyAQ4siDka/yz9vn24nMS9ha2wQaymtoYnF1zMXnKaJmKEqo2spvNWu15p+
 qWXGXQEL4jpw/d2uOvT1Z8+d0gJ5BtUNttS3cxdy8/3j/hVcFxK0/63s4L3O8ernlFrRldfyp
 PQwCT6krrbidZc6lIf2+63IXXzwEfwQbTeTYz5hMnhqePSCJnrKKWrVJbzpwf+kv9IARSAK88
 mf8TAC3ndeLXdI2O2N6NzdtfXQRRDF7sb/LfZQHI8E+sJthlIUTTnPdxMc2ULXUdCnOMWnlp3
 yrs8pytL95xfh/thrtuSGe/EISVd0AlIHTYDDUoQl0DQBXTe2T7dzEb+AG8J3DcbUc/tH1oEO
 uoN8tq3kX8qhHfvOWQg9ax8k/gX0j9V6ds/aDaD27knmEfZhrmVS1gLd+HlO6QMV38nmgHkS5
 QFfycaX3tpa41O54R9ud5bfig4ugZhHMRDbVBL1L5MTKSHU8USNsjhVM2LiOjEmSlV1cxU05g
 JnWmbcKhJVo0GHrSKn6wG7ePv/22kSrhHUtTYNYpw5BckJox7n91T1i/0stCxAJ7FVV8UDxzP
 vRB6Q3+19x0Swb6x67ZZLlo2lLfs13hAqI66qtXO+wzq15I+24P1qmvqTCH845tmLKuJBWDRL
 WU82gmrD1EqJsSok6myhx2Y9rm9GHpY6CEr74sCzpwbjHlGEX802b2rsYuq1eOtg/xXrU7tPl
 Uni3GLVXEI0Ei2cGAtJq2laShF0BvFuIrI7uV2uia1H36BCTjb+4NXtupTFvDLGRj8eKFQ6vm
 L6g9fOMuY46hmhYByPuConZzRYLrXSqP6uyg35eSahXqflyMiM7va2ky8vzuUm1COqaYAuIFM
 mGDSHTW4HE6dq8aKKm+bN6SvKF6+MNU/XPdFsLy8s3iHJpMjrWqTTgSyNkOUqx0AGfLcK5U0Q
 svu3hVEvu1U3Ci8oXoYLw+yfNHGgABK/LMTxvJKR26YpLD0JKAaPGRQWLd5HpaeZMsAK0N7ba
 TvCrkfQHhNxUR2QznRSeYGVTC10Cc7LbIgWKxMm1kymzPLwrPH/WU1JnEEWDS8xUwJrBd7z/b
 1gGyM3dMGkc045Upc2fGoZtbLA6Q7OwbHOujFzIHVOUEwnRzx2+F+QvV9njjniX3X+lecdEoQ
 ur826iEPCm0LPKFCXQYH2MUbkYdvINLzLnWOFAjwg0qgGxfY6CTj5oPzrvvUekj9YVjx5FZzL
 in6JCuly4+totXAJ16kxbGLAP8yw41XgBgKVOs8GmcBXEVzXi3KXHIISDuXynSi4RcwY8KkFD
 FgVMcZTXkF0L21a8K9l0cLGls933WrfD7KzAJE+fH/xv5HdytmkfSOaZh/nmfpbMMo6HqboEY
 EQl6X7K2SLLgtLDWYXa1ZSuNFA8SHhvnMofNiMR8O6Acs9Wle7DAm2jyafQ9AgPLtrQUTiyaK
 z5y06NegeqDs6

Hi Markus,

Am 22.09.26 um 16:22 schrieb Markus Elfring:
>> Add a blank line after the local variable declaration in
>> response_callback() and fix the indentation of the UINT_MAX return in
>> rpi_firmware_clk_get_max_rate().
> =E2=80=A6
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.3-rc4#n88
sorry but I didn't get. What's the problem about the commit message?
>
> Regards,
> Markus

