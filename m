Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698139;
	b=NFRMIc2VcnobCpSFWQJZHDH0/+45xj2Zjhejrhw9Ft5BgSRSuuboqgwuTtC7be+QyNGb
	 PUIEagGLdYIxO4gKe/IuiNjs8pI72fqK9hyqCCCVmjDq8kmF9+CGYITTxYJ6kJhEOkTzn
	 q9HM/gDjkYGayf7JL9yWZsGd8+mhPYVEU5iHhtxvJjvd+8UHl8gMfi3bxqB9TxDLrQH4F
	 mxGlr2CNdC9ZNHXaezPt6iossgRZuVQMWqvd6kZf1ohusU2UUuWYQa9QI0Yl34iqGWUsf
	 a4dhg78QJUEZ0o2cPTB6JAeGgze0Ml7Gokr3H6G1Kfngsu2M3U6lVnrZZ029T/nsMXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
	b=L/t/Bg46cstk9keR8rVYcGRd3Zvud8/SpKSIYhyTTIynoOa0xbc6CAT8G+7BszPJ7NiR
	 wDCn/s5CZ4wEwJW7irnn+1FtZ5IKF7HXObjoEc3zssZMw05myA43JxP+vRj1nDTz4uGw/
	 sBEtD6m9sdi70SEo1jPpu7ukXy1C4JpETFHLBBL98zqvHRlKm1azEU0qQrPX/onUgrkj9
	 lZd2o9K7c72D5n30LraEzIaNUTjYOton9/dYUdYXqt/c+mXQIHXYDa3kcjKJNJSHCTQBl
	 r2nKiS1CjzQqPuRJkLSzszGV9Q+F9AW9Lw8D/7uS5fhCDxfd6TFBc1FW0xHkChdbSeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9tY03uo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED196606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED196606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9tY03uo
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so632723066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698137; cv=none;
        d=google.com; s=arc-20260327;
        b=OX14OfRdbXYTlW6Um7Jbg6yCeIsF44h3TqmVgVOGPWYuu6hfn5uRVYuM4ypESa9V3Y
         r5cuebI6lVKkCTwUDcx+DcSBz3Zfs6ZOhSNn5LaJzjg5eOkBUBjdhemnpjRukIlq2fle
         Y8RcCnsWcp/6xiOkJdcfCbLudc88tAnI8K+E9NQ04iL5UgPjLet4bL+J0219DB6ONthO
         53K2ivoDwVmra+T0skjqe/CN1K8aYMJT9dNJn7/Nbh/G78XRd1Qi72ptgLVKL0gkbib3
         e9rvKpZjbcUm1jWZdK62dW9A1uuI6y/ufS3JSH9PflRTauWd/2oFXE0SFYiDuneHXDEt
         ld/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        fh=eMee6Pgmwqzfs2LSlJ6DXJhcIhgJZDMU5tvjFGDATYA=;
        b=IJnhQ2gAA8N3r91+BFPYEYIfxbvHNTHfobvUZfyDdq+dn2PD3quQv7baDXNPKOQt2G
         iOmmA5AHqICY9zsNTJSOA6mZu/m0327Epv6nGH5xDOR5KWsH63gcr4eIl4EWrnEbDwaJ
         shhGFjZ9odlKTlvnQ5Y69t8dxJtH9GHqppJOrbNN/9ICbyjHs1sdf4vR3SWu59/Mb6j+
         KHfotTM7umdGSfAJ1+e07oA0XAIdUzeW/SuClXMQlnNNf3f4Ul8CNqXZmuFVYOhBP53s
         MGAshycWGcH4ekaw7Y5LtmB0ZChNSdaQiuKnIDeCwqORxel1+whJ/hQCdxCNn7cSUyEH
         f8sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698137; x=1794302937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        b=z9tY03uoJ7G4U31VpuC4dpS/J/a3LVR0jRHF9cT7vczDh9QOjP1D2uEy0ZpzzPbvDq
         zkMm2wGThRtPz7Z65UNIobmrQcAQcyh79ffv4N7Zs9laAjrlIIzrbvZAcbA/CHI6rai8
         3iaCvAbsA3eCvp+cXUfFgUsMI2tuPchyg3fxWSHEVrof4N/pspaKiRriQT9uUWDQFWXd
         Emvb8H/MGFxz6un8+BlQf4CHXdku3v0L44r15djnLsZoIHiPkOWCsGBfi0qwrky+Uxmy
         ifATchJH8cO6ZIATqlm+tjszUgxYDDHmLY7hKYNLcaYsxS1W9/ccHvj1/nALUimflgmQ
         ZkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698137; x=1794302937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        b=Rjg/nmRA9FWZqMSrPpDzM53er1z2oXLKhBKfW/Wa8yfWHfKm9Z/7CshVJeHi15F6ZS
         vRiPhosJIOB/nGEYy9fCDRmoKbG4RHY+0EpmjM7Du7RoHY7YIEuzYSjB0m9bUqtS+KAX
         1HTYOYtwkjKxYlNVMlV0s02/7C/7BMh1FP4mPma0wuJq/kBk/wmdJwNM7xl+D8WmJ/bs
         6hPFx67r/lvlN7Jtdz6Y4m9WuR/RwbqMqSJ2mwD5kMIUl1eZUMF+Z+H7DXCvCO1EJ4o7
         VIgeQwNXt0KxxrSFNWIYYrAoO5YYh8veMl0ZrARbitJUIcqhNKbhfde9HkhTd0NX6X64
         g89Q==
X-Forwarded-Encrypted: i=1; AKwUvByDwksjZe0i1+fBOc5mq3Xm7plMGuJZ/Np3609esmwgrFDSpCZsaHnzJvtQx04cbzfPiakWTXTlBI5oX7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z93vERPAKZdpz25m52r9fQIzWBWGbTTGz9oHHos/1mD+MEQSPm+
	Ybi4lLw8voV9uwDVJo5VHWh1brjIf58065OdqU8jRxYfIFngYDt8GPtlIHSj4jZ2JlXaapiXzBr
	dL3K/VkXeS7jjKEeLb/VOZKpl8RGVlgrLZ9t9zYNVBw==
X-Gm-Gg: AYBFou0gCmAQijVWUEjJ0tV+EEY4L2KrnevrBcoVpYSnmWH+1JGg4xoQBMH2hVNHcgJ
	UDLTphOSdZwX0WYuCDguvcDmQU5lEM6fpTLO4U0DnUHL+JAyxzmIoYYixfZOqiyTl/iDex7YjUv
	A7UgG45IGsKTmT7lbojGqK1Pz/W4v/p5LTz42jOcw6SjbfVHbOxwvwFOtZkFOSrR+lJGPLx0Njt
	feL4M+UOk3bVKdHuX+J76TwuinQ4Skew4pA0c3vQJZe0l7khll2Hy9KLhbVrSNz1AlfhlwwyrAz
	hK+vQMgZNmoimHE22y0QdmEhETX9fzWXZibWjczb4tWy+lKfsMfSD44QuPgfQMVPBojVJ9mIXif
	t1ber/9qrcYUj9ClDDktGTbrZsOhF+ghC3xtqy3GiNZUE2Xc0u6rlovFq6/UmzahVYPn78UVUWg
	N0Q7CYVgn53rceXVvOD7y7+eY1f+9wTp7hjdx9kXnwUwLjXpfTYVATNQe6ViCsMDbtVxYWaQnTH
	6FUR3zlsVllB4BQ5ClzlTQXow==
X-Received: by 2002:a17:907:980c:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c4ca7aaffdfmr1012303566b.40.1793698137094; Tue, 03 Nov 2026
 01:28:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154959.381-1-chaulagainavishek14@gmail.com>
In-Reply-To: <20261101154959.381-1-chaulagainavishek14@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2026 11:28:20 +0200
X-Gm-Features: AclHuK-4DCzMkKqQ5F5CE5Xu5EbSE0JkNjosn43vNvWvHQzU_y8WRlv2eqtT9Uk
Message-ID: <CAHp75VcN0N9vO1eHJcD+y1p_rP25geYYr=ucuQKgO9ktrKCtbA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Remove unused atomisp_get_pixel_depth()
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 5:50=E2=80=AFPM Avishek Chaulagain
<chaulagainavishek14@gmail.com> wrote:
>
> atomisp_get_pixel_depth() has no callers anywhere in the tree. Remove
> the unused function and its declaration.

As long as the code compiles (I briefly checked and confirm that this
is a dead code)
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
