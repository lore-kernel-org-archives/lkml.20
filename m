Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155200;
	b=qhCOGDahaIh5C6NcGAa528IwvQ+Pt0AqndGTA2qelxm9BV5riEkc02RvVJB6DVmMz1XN
	 Ol5GDzV+gZLBCkikDH/M8Bim9Mtl+8uc8Sh9aWbPPvDTmc+BLBUPvIUBgaHPDcY19IHAO
	 emk9CAJs3EI3V997hiK0LuIbaecBgoeET78UCvcEkTGyHAjCsrjxAT3qvQB/HQ9x8XJpD
	 uNIPMq5Zp5vagpuBaTN69WSQHMG+8z61+bKjV65lqeKmT9CmY0i2XPnryrYSkhqcQ0lW0
	 +r3IdC4414MgLXmlQx5sqhToi11Du4XNWFCFhba+rAm4/UqEK8rXkp/Y8PZurM3DBPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UUyOzdfDW64FxuR3j/5aF6mngo0zFqICWYuprjdj1Ig=;
	b=ytRMwaYFgLLNhP9FKI+XWhJVjAmsWLlrQLK9wNlfcinGlKJwfXzXjavPRn+7q92zpFVh
	 /luGLoo3P1YWPWj0hqjUu6blAU5JuCW/yByOYEkmUTXbxAKIwqINxzVtQOPeqOyOnCLfD
	 P/JVWFNxqKMevzRjPBfrnK3x44xAFKHu0Gmn3dL9iqECZfHhbdSCrqk5y9ky2SQA2BJ26
	 3wsztFJAEzIYtoiD37eJBwUM+3HgcOO24MzyNA3z5GBSX2E/EIWmV1ByA9Qe1bBN2e5mi
	 4rIxf/Z9xSd020FPH2ABhAsdyUiqECriRDHQHidkbWbF3rFAfPLU0gjmXq7kXVJrlNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWoIigvq;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629AA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWoIigvq
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4258105so311808241.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155199; x=1793759999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUyOzdfDW64FxuR3j/5aF6mngo0zFqICWYuprjdj1Ig=;
        b=RWoIigvqvu2Ej8Oo8yU9qnRczeMA2FfGfYTvYHgIz8Z/TK3KnYp5KT9ktyA1OpKhXb
         rww8NjYMYxiMajA1EqeiPaOV9b1J+eFxwne7kJGTL1Ra2uw+YH2LsZvLhc+3KSng4+CJ
         Wjq73WkdZKv7fY/Z+WtRehwsdpIdGy1FLWOAU1OkdpzwZhA2vmAA7OhZdmZUZBlbyx3f
         jZKCQD+Yk/d0nQ7Rt+q5VjpQt/WX/z5TcGt1z9mtYyFYOKOgjXNOeAw41Xj0vmmSThip
         ZIgBlxGYO24fOePTI8TPrsl9Au6zt0kQPXb9wZPH/nybYHLX0sG9eYXGHZh8I3R9Y9zV
         GBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155199; x=1793759999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUyOzdfDW64FxuR3j/5aF6mngo0zFqICWYuprjdj1Ig=;
        b=rqbXysKFUOS3QakUdzUBEsPKX51eUrn3FmjT0rfdycC+CYErw50P3Iif0RFXPxYWzk
         b1frbES6rrf+oTnQrmypPX6ctC8BHPvkFilPgJTWzudzv5+2t7ZjQFJGoVtFVWrKJNEl
         9Swd1r0klaTRl6aGFWfI+B9kOQRwuUV3PhV3z1H1FSKY3ol1gh8C0wizfmNelI/Rfd5t
         CJ9bZ2+Pxb6FlhdWJCo22WVDOMhdjUWtCndVA8qxZyefN22IbniEuBd145OBQr5FDjuF
         hMNSt+VgcUnNPCQVT1BKUCbPQiMzieRRinLIQqLDcxPTqE0KVc/n3CJte1OuPEqZQ4f+
         dmkg==
X-Forwarded-Encrypted: i=1; AKwUvBwLZpPDpZc6faIcbcda/qQGtru4WB7CD4Xt7WfVa/KeNenCO62Ke5Lmh/JAbaGhQtbxNvw8c9WfyDwf3To=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe0ZpHn1bmEbnrJiSwoqRoQjE2SRXBsnW0ZuaCdd1JmQV829Q5
	IZo6zlZcVg0sviVkHwUVA/oroR84CgNMGsm7dA0Cmh8seDMx7kFQppn5
X-Gm-Gg: AYBFou1c96nTks0qtu1yVqN71MOIGUAwyvBu/J8vZ32iNm19NsdBm4MbfQhIacK1oPT
	W9ctXTnE6weX/Y7D2uJyTAweWYYmIoo32iJgx1qLkOC16WfhUttw4u4qnkOJUIkIqbAXoRaNjjy
	53AcnyL3GHQ5vB05sRkeiWsjAQ/gsHNBORqo2nSGB3zwrtggADX+MxqzzABeYxpaYdlFRxKQoJI
	tRJs63CncmYdyft6Y4pvmIoCwkJgJiS/TybO31DJNfIbRWVK+nOpR9HfDMSlPnm5xrMv5tFBCV/
	c1NjhtoG+0gFCbmgV2hG72PF1xj0q6You+Se749NPgiIAfJ79lhfMhkcM59kxPsYcdUTI4K5Rmd
	l/asQTLS+dmctamBa3CYdN4O8T/hZj5dwH9ps1g5zX7YA1bHu6gU5/Il6Kv3bDlNeodtggRgXHp
	UrflX9MINRcUbNDww4odJbCeIhMfinyWzVEgzkyXyB+QnwFo6o/GZlUMx+UWSUvN29/F320Ws3G
	Wt1Ay2Cv1Dao3ZbBoDS1egNqWDJkDtTmWs3bDSsyxJ7oAq53uh1JKlKaztDN/M6ZCY2M5iTvRLf
	95vSKHiBiZW1CsF5a2oEZhIfwD53cmLSJKTe5a6XW6+coRbbwL6OSCDeCrfGXOQRsbyqswuhyw=
	=
X-Received: by 2002:a05:6102:508d:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d03a4c76camr507860137.21.1793155199338;
        Tue, 27 Oct 2026 19:39:59 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea397a24asm4467382137.1.2026.10.27.19.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:39:58 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] iio: adc: ti-ads1298: fix the data read path
Date: Tue, 27 Oct 2026 23:39:51 -0300
Message-ID: <20261028023951.33149-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at5jL47A-6vQJYOX@ashevche-desk.local>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-2-stephanbrrs8@gmail.com> <at5jL47A-6vQJYOX@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 25, 2026 at 10:14:39PM +0200, Andy Shevchenko wrote:
> > +	/* Only changes while no transfer is in flight */
> > +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> > +		buffered = priv->buffered;
>
> Strictly speaking you need to assign buffered to make any compiler not being
> confused by the scoped_guard(), which cases IIRC we used to have the past.

OK, I'll initialise it.

> > +	ret = ads1298_write_cmd(priv, ADS1298_CMD_START);
> > +	if (ret) {
> > +		scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> > +			priv->buffered = false;
> > +	}
> > +
> > +	return ret;
>
> Before write_cmd is called the buffered might have been triggered. Is it okay?

Yes, and on purpose. By postenable the core has set up the scan mask and
the buffer, so a sample arriving before START is pushed like any other.
The chip does not convert before START anyway, unless its START pin is
tied high. The other order is the problem: a DRDY between START and
setting the flag would be taken as a single-shot read.

> > +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> > +		priv->buffered = false;
> > +
> > +	return ret ?: ret2;
> >  }
>
> The code lacks of comments on why in all error cases (either first one, or
> second, or both are triggered) it's fine to continue. And what will be the
> meaning of the returned value in all three cases?

The core goes on with the teardown whatever predisable returns
(iio_disable_buffers() says so), so the driver must stop using the scan
in every case. The return value only reaches whoever wrote to
buffer/enable, and it is the first error.

If STOP fails, the chip may keep converting, but once the flag is clear
the completions leave the scan alone. In v2 the flag was cleared only
after the wait, which was wrong, v3 clears it right after STOP. If the 
wait times out, a completion that already saw the flag set could still 
be pushing. The SPI core completes every message, so I'm inclined to 
wait without a limit there, as on unbind, and return only the STOP error.

I'll put that in a comment. Jonathan asked to rework this part, so the
code may change, but the explanation stays.

Thanks,
Stephan
