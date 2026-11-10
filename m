Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336144;
	b=Tq8HC9SpquMOafz8B/pqk7BeUWT0V2O8693wsJ7Vt6xrO1fncIr0VvjIVHudMpVUswUX
	 s5uP0ECtokJ71HqcwkBch0iO87l051ocC5p0AhCT+u/c2B1t4lX9V2bNtevzAfje6admB
	 U0AaSvcoFo4y3Zp3vrsFp1stQEamSS+3jD1e8SW0Z7g2PTKdJ9DzAjrkm/2SBQi0rVq4X
	 DNl4zO7HTZ1Bbek+3qUiX0JCnI9PjoD/qgwIDCVK2yQPkNeX2U82zph92ElUx9os54fBd
	 Bw0OR/Uty18WbZ/FWMcpOuRnpMUHL7BacYI7Kr0QcKnipJHSQmUh0c7nqem5lZFIvdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
	b=hjWo6w+kAsnvrfYaRToQY9rWvwXKv3ba5PFRTAOYKoXwFQJt78A9ikyR3Mp+TYXrVhfL
	 0V5zNv6+a32EZolNeuOmus9uqHZzxy7MUqg/3X+GXJbW78HkZ8oStEBz9bwC5wtKUt/GZ
	 2TKcebPW7turP4S1fBBvdXT/pJsuGuUSWIIntYA3wDJgung9lBBPghjM4CQ7obNedP1of
	 NOC1HYaAmm+7JzgFETIEb/0v3nUOC01zFU6UF8kdjfor+YBUnUe/ziZZzYoIGxlYM5OTR
	 FO6YzdYMiHJR5INpuatJFzlZHQGOu6h25P6/fll6ghpUz1FggoIx63MuPT/NnDBZaOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOzPl1L8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90504606A92B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90504606A92B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOzPl1L8
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8256106635eso1051977a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336143; cv=none;
        d=google.com; s=arc-20260327;
        b=Ybz8h6uO7Rde75hn8pFnr67prMgQkoLe5EFH460iM9JYIjxZzM3x5d+5mXCGSnT2Ty
         2KYUVp5zjZwCWLM7EvQigkvqV62loZhDm6yNx76OnmxS+lrkeOHY9igLHmoQc1grAJCT
         QSvnRNWDfIrLHydOSTY6R+8mRYRjAkeWVjbFoTYg8gKO6LCEUy1zgMrQR7GjtIzPq3iF
         WWB3BQHuL3Mk+t0UH97ON8ox2y+Yy661hpAiC0xRLXaLoUPxCKoPp9yBbeerS51fUUmL
         r3TioS5/0h81MDLHLh+HTCe8QzK5s0X6sl9BNmDdrQ+keVQZWj7fqmIZh2pLLB+DNNNA
         vxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
        fh=n+Rbl1aHqwc8EpruIACwdxILOE+/91UlCM2Ywz6/9CE=;
        b=ewqkCcB/D31flhavzde1t0Xw32kdmn1uds+EH7rxM9qjA+VZYwbPvpzTGjKWgk/Pfu
         bCZ0uR3VSIII+8DKlssvX62hXopo67nkaHEw4GHF/0aO5rsKV62qlSdHcR69NQRhfSv9
         S420ceAJyz8JM2CIcULsaPKTmhS1AOLdI7fPXtOXnfQpSMJ+yIEAOKOs/znq3FuqTmyF
         PGHTZ/wXP5lwAJZ/TIJAWGkqfMJEzgDmZMvCzKOEUT7/nOmCpA8X4PDP+4AqWeeYpWGb
         JJLbuy7YtuvlUvWvWsPmVzflv42Ccs1YqIkzT7h5pj7jgt9yfbv/im6UHrhSAXn0O3TD
         27Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336143; x=1794940943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
        b=GOzPl1L8hRVjkffAQOxToM40LGbUN6J+NDsUfwKw2whmCy12nlhxMqTZrIffhYz6c5
         82raO4rO5Z/Nnur8vQxYLPRuFWegRL9LQna+/16U/qixg+cCYrO84k3opaOnz/z9f//g
         OvMmuW1l82/aqZBPhPkF/MRWD7wEOpc///gPqgv0Z63wprZeqEw9aafEjqB/YLKAkFAu
         uEyg1Gh3mrFddj2nVel68LgHczYj88PuhW38WnVMmW3rfQkBPIuaO2p/1W3LAYjQmuEX
         edsXx3DSwbwWpPfNXsmEt6yUl2iQfN9PXb6PoQkNB767Ud9sIdMaXNoOmZXinAaskBPI
         dGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336143; x=1794940943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
        b=ZxiJZUQxkLVkDTJkc2I2FNZCZHkmS5409hQCIvF1n/bHxNZMpQ3OWrBja7Q4ZDDgF/
         tyrLsWr7gZkIl7FFCFSL8pb9wozyE7kVZvQD8yNAbB0jpFpF0WlueOAXzXcmYL/3FY79
         xK7lm+YbzDRBUd2qYCz0aJ8WwBp/4l74Vqns6rjCs+QB2WWvKxGRFAVZ8fxphb3DrAjW
         AZN/PCmXD7FADYIXYPy4OIdg4txeHVNwnJ+rfJoBMekOVLRvtFW7dRRsqMfdeB9+9mqU
         hh6xeOQiGuFcXQ8ewnR8J9UIpXQp8L0BYwjydyxMqqiwNzBSJQOgg+W/zm7PoWkDIKh6
         cw0w==
X-Forwarded-Encrypted: i=1; AL+hErEvmgbrTEx8TM7k9uLqfgc0RjKsgfBvWjrmSfNZqfQ/CqMTCjxPrYraslyiZlzo4Qxs4qHAJBuxn3yReJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IXbObJJwF4CJodXb6pAteQPb9l7SCWpCqpV2Ph7GIs1AFpDSP
	hqJuFHldw39r0NrJBSHhuHC4ipelgDncYLe48o86yaFwbvlOWLOS7AdkuN5iuYu1Cxz33TNpJNn
	a/lg+8fpHkItBR1k29nPVVeMqh/HOmMY=
X-Gm-Gg: AYBFou3r6ZSY0PZhgZoE9CXw7Y1F8hZuOD/cR7+sBUSozriLWEnksTbP9X7lfs3xMzD
	E6uyJkuX5ez5t+HNWprPAJ6vVCvF3WtJCWNrIXW0n+FbzwchxmcjDyFNvdELpmauSrt6kCwnqLa
	5Fpo/2EJGP58uy3i04s4+F22RtgMEy23yWPW39evo49BC84nHIzmWJOWkSkasPJUFHYjIOqgIlv
	NqtSPlo0EUkSR/tmm2iHA1kyiMxAzWyZOph2s2FpsSh8a4jzZCgM0rFo0cRJYLqg9D0KR55RrU2
	dPBVFU10PC3CttN10afEilhLt89OUyBEjt16aePa7maVbRURyJ/yLhG0Fg9uZBkDV5sYQI99VDk
	o3VCMa5aUyQW9gs2ADfO0TWKmvb0PZMns4zQeoOvkLqdsOGORr7dFcRrLg8/P5Pmg
X-Received: by 2002:a05:6808:2212:b0:4f3:e133:c574 with SMTP id
 5614622812f47-5683cc0efcemr2798420b6e.19.1794336143447; Tue, 10 Nov 2026
 10:42:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110164222.698745-1-andriy.shevchenko@linux.intel.com>
 <avNb_7QmpPkxa8xq@yury> <df77dcec-08ea-b307-53bc-d52078fce7a2@linux.intel.com>
In-Reply-To: <df77dcec-08ea-b307-53bc-d52078fce7a2@linux.intel.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Tue, 10 Nov 2026 13:42:12 -0500
X-Gm-Features: AclHuK9zAzIBs3yl4x2cgqpMXprPRNOqAyrkGsucmnU2n3m4faNlmxAM7HKEc8g
Message-ID: <CAAH8bW9ZT-D6boyM6qWLj9DpYwi1CgFXcfJk3Q9mtnNGqSYQDA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] string: Export strnchrnul()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Yury Norov <ynorov@nvidia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, jorge.lopez2@hp.com, 
	Hans de Goede <hansg@kernel.org>, Muhammad Bilal <meatuni001@gmail.com>, 
	platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:39=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 10 Nov 2026, Yury Norov wrote:
>
> > On Tue, Nov 10, 2026 at 05:41:50PM +0100, Andy Shevchenko wrote:
> > > Export strnchrnul() for users that may be compiled as modules.
> > >
> > > Reported-by: Armin Wolf <W_Armin@gmx.de>
> > > Closes: https://lore.kernel.org/r/1969fb5a-38ef-4b4b-9d2f-cb9a4348b96=
8@gmx.de
> > > Fixes: 0bee0cece2a6 ("lib/string: add strnchrnul()")
> >
> > Not sure that exporting a symbol is actually a fix. It rather looks
> > like a normal development. Also, I'd like to have this patch attached
> > to the PDx86 or whatever series that uses it.
>
> I did put it now before the change that broke because of the missing
> export.
>
> I dropped Closes and Fixes tags as the issue should be non-problem after
> the history rewrite.

OK, then

Reviewed-by: Yury Norov <ynorov@nvidia.com>
