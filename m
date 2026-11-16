Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812293;
	b=RErzg5LHcbq7s9E/kSsWdZ3XS0XjiC3h2oYVgZG2m6v3/6o7G9GMRORJyDO6Hea+TKnY
	 I6Er0CfGWx23T16uSe1+66+ymNKCJZPeUVmGTza7IFo4eYtnUr+QuOx1Y+YpUrFAgYaeD
	 +4gkXTRazDXCwjkA/pGb+2165HuooiV4ebvO3Jzx7UHTWC0+5qhkZmoiBfG7btCZ/xW0q
	 nJcGPduQc3eft4jWwtv2a/7klcKxKwcb2g+BF1SRnqUV0TU1l7Ow3Jio5Z9Dov+ArbfYO
	 Q5Wa1VVOe5IsUktStt9MUN+qVPzG6VSKJwRuT7TPOFnrfyB/GYhzrj1m4z323IgTyEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812293;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=t+mbs+keLTTSyK0Feil2CBRManvZhxjbmljm+9Ohq70=;
	b=KJp5gALOnEHFBzcIYYvHpndDJF2k3Mql1sddcjA31KuWywJG+Fw8/q7mW/jpvROfwbe0
	 wdIk7HH5I3vZGWPhbNJ30kcrmE+vsFikZXFkjEPiSkjHg3xIvHuPFmj6PikZR7UeJiWE0
	 vmNImq7P5SqAJZlT801VcJz4/EsBeihKUzR8ejLlXgQSnu/Wh7uvArwSkENSbIhExjaRQ
	 1s4lAmyGqpxY+og36RQxvqq98R5v7ONLk4Bas+40a2QE3JG6bG8FFUjh8GjGwO5iGFfbK
	 7VuU3QJZsxA0OsWVWZI9CY/NLsJ9N+rnbBWdt9XvwX0NrlDneWk7nUPEgs9kjo3huWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ZHGQNbJz;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E849E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ZHGQNbJz
DKIM2-Signature:  i=1; m=1; t=1794812285;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:ny++7mUcEFS+Pzj45e8qtghj9d7W
   QwypNCxw07ZK9G8KgBZY3NkaROwVVjdHYCaLMYwrADI6WcvEZvwJpqV9/NJOIeAUhSRq59KRYOk
   DWoo/HTQnzq1k9Ul7x7UWfmUIhdcx45NYco06wJ2+j0Yz6SRZ+jHbhWpnmDkksuRsoFyW8Q875f
   e9+SKikEXIcaEKxPfh5YoiYvTLc8BEgXl5HsQjKDLHcQi7WUiVUSNsSjia11R3ioPwLKGo1Juxk
   vKEL2+dmfekjY6FZkmPfWE/0HvsW0GnPm23Fqd5/H6PtvvZynv/oZHuiJOZUlMv0fmIyAuSpebX
   mzHcpV10CtRpnA==;
Message-Instance:  m=1;
 h=sha256:
   cQRNWUQVJVkEcEvndDpIN6ReKRPE61Q4t+SzAU6Ub70=:
   t+mbs+keLTTSyK0Feil2CBRManvZhxjbmljm+9Ohq70=,
  sha512:
   2Ng7OKJ0lEU6wMxt188e6l8dR7HZP5xDyQYd7nwt7q7RGOfIEKztX2TNiCvPKDm0NYgx9SKLu19EBDy3c7ggdg==:
   cYh5JZugFqlsGMvsWDj7aKykdZH3rcA0wMM3KTda8SEGzmtFQf7SHwgC8a9L7Sw3AxBRQwFQqKLDnR4EVL5gTw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794812261; x=1795417061; i=markus.elfring@web.de;
	bh=t+mbs+keLTTSyK0Feil2CBRManvZhxjbmljm+9Ohq70=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZHGQNbJz3ZGAA8KTkGhbqoJc+cmFeCSbbGU5/SZq+mjbURdXSbB6yP+nBLLCABA7
	 xjhG0fdaA07wbAivFg9BMHZro1JYqrnePdDSIHbGPfLX2JY5vUc3c5RNaaV7JOQ0V
	 Mj0X7dt73A6/SS9Wr/HdFPu8EoAl+0Vo+cGwQCVWTjEZSMDa2fRHdbpWprU1mC266
	 hc2wbuviJDGl86s60icVBGkmBQbPmufpUn5tYFhJRnRw9gt1OeDaapgIJCLa+K5lf
	 7eR6L/LK89cr8B+wkX+c/0PE8ayYhfk96KHgcTYXTVVIAHZ3MWCneBN/6GnzmE+Kg
	 BYMFbo8wSunPqGPGbA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mo6Nt-1wdoaM2AF1-00aJZz; Mon, 16
 Nov 2026 07:57:41 +0100
Message-ID: <ae04eef3-ec99-4728-be84-8a71e16c0b4e@web.de>
Date: Mon, 16 Nov 2026 07:57:22 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jackie Liu <liuyun01@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>
Cc: Jackie Liu <liu.yun@linux.dev>, LKML <linux-kernel@vger.kernel.org>
References: <20261026111047.97178-1-liu.yun@linux.dev>
Subject: Re: [PATCH] drm/amd/display: Fix logger leak on perf trace allocation
 failure
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261026111047.97178-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vBVVPVd4B50xeqlYqh6dAXCHmu1AmDfbSQlwYkbPZ/mBNNRZCa+
 oMIFvNKJFRbDQsKd0OA3+n6VoEgCLNNvZY5hzPWQL1LmyvIOi0EorFcrBQy/B38YTIpf0iH
 FAU9q1nljb7Eh+ySdJVGp/DwpZKZJGzNKzaCebIeJvRve8N/jE76J1DRG7PedbkCItJqxUx
 wNqqrArldI8Hbx0zh3VQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r3nFQYlLYJo=;Ef3zqGl8iaLNKk5gFrtQoT2ilw+
 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

=E2=80=A6
> Free the logger before discarding dc_ctx and clear dc->dml.logger to avo=
id
> leaving a dangling alias after the failed construction.

Would there be a need to complete the exception handling also after a fail=
ed
link_create_link_service() call in the implementation of the function =E2=
=80=9Cdc_construct_ctx=E2=80=9D?
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/gpu/drm/amd/displ=
ay/dc/core/dc.c#L990-L1037

How do you think about to avoid duplicate source code another bit?

Regards,
Markus
