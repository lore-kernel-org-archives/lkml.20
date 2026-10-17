Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68129358387
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198560; cv=none; b=RJtGKuZc0XqvgK3c9zk23pKVXYIoUJO5uYYP+Ltmdd7zubXtkWZTNi/bhIRpeqYkYm47NcdLRGGxa+ruR94OTMQIchshH94BWoLXRMtIGUwQyvV6Q8EYjlJHR0ggImzneB0MlFRNaQCCSSUu/jq1Jn/vO1ovAFqBnwyz586IU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198560; c=relaxed/simple;
	bh=PbjlJHekCB32Q3mkt1M5NEoLD2mQfZVW4FTHYL8AmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrF+VPTvHzvuYOouqIaiBjstsh9z6tOcuZbhulu5oNzsoC/pZu6vLrAKb8ndNcidmcVj2gqORC+SiS84pH7ON97AJ1H6meBFN6/A2oqPT7b49OwAjkCiPDlB3YoVd2RKroB75WgprnzzNrbZIrpfwCQHaRVbLDWcNqVx0NAYyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ja3nuv4Y; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ja3nuv4Y"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so1129736eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198558; x=1792803358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KG+QW60TgA6JIhij7lcxYutadNlvdPWNNLolkVy1zbI=;
        b=Ja3nuv4Yo4HjxADM6N2507xkzhBOawlkshBxbzMfn/oo2ZJ7B/1jIh+cogm2FOJl+y
         +URaNAeei3rj5SYzBPlRo7AzGcv0ywc382zUz39ruPnpRfEZAIdyVibpyicbbS/IQeyV
         5K+hK9dB5q5qd7AMIzSqIShYVyQos45sSgP1NRHW0uGM1mSbRDXQ81U6Xh8JZ791SXk7
         7cMsZS180iSoq6zHbj+r8Gr9+pmAIfgzoQI/kqaLe6uYi++IGbhmCKxL1M57m6syonTS
         A2Q7rX10ou0u5eZCIsbqOAYEID1bh9nJWF4hsVCgzUG7kH9pO3wk6xbJn62N5XYyp2jN
         8lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198558; x=1792803358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KG+QW60TgA6JIhij7lcxYutadNlvdPWNNLolkVy1zbI=;
        b=WcX7ZTq/mwfPmFWcZBV4Qx5mjpsCZU1DCUnyx91U85O01fiopCDojSR3X1X8L5EjcA
         Ld0B5tNkEdmuL9Est+Q9+kOzxrcRGbjOqmrlM2n7jLIWJopps0De8NmUj2sIq2HK/qXs
         Yo8ghwHkAnxZanCG+DHKHJWSgxJR1RKxnehJEUBJfQhkKyWl0SnH+oMstcGgM54hVznX
         hWmrvDBGTOpSXTpB0tmkGycLi4P31kUL9lnEtwQc4eFLps0PnBDePAF3Gy0ncKaiA6K7
         RJBqGDWZ1vYa1rhoTl1KAgzAkJ6oXZVN0waCIFBSpQp+FmLmlHcgmWjRP/QtxtX+ZFA8
         k9Xg==
X-Forwarded-Encrypted: i=1; AKwUvBy58PdU2ZdnW9uj8ZiSxwfGmnU3JNt+IELWqzYE2VU7pGUIU4OhF74g2xM4iBCXXHuV387SdoMt+hUspX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOymeFMNMovVo81NcfnECfYzXvNUj3yshs2X8WH2eLnUN01eau
	5uVyH46wI6ayllj8qJOApo/61ACYoSiHp3/2l9R035CFbBxhtrxzlx43
X-Gm-Gg: AYBFou3aVWwgQEp1LGWXsMGcX5n2enkNUUgziNRO5EBeEn30zewe9CKmQ4a05JPT5Gs
	TUnvAaRZ2lCrmK6LCltmdkuSWJ/8VHLwPSa3OsAJE30sWvRqvVPBjY993sXUfDaOnmhQMdaBX+2
	LUXZjOahdwqtgMDtobx6CUmbm6SQUezoEtepxQD5uq5/FJ0Eon8bcexBGNDtCbWX/1GoKx53Ws7
	yxzk3BxvaKh+jJWngzKCoHLQ5BzTWxeSugFVqWhZd70MwX1acnmW/rkBxwzGT7NJGOtJrrZRpul
	fSZ4w4k6xK+FI0ZJp9zwl4F/b3h8IxfvnIdo1GJ2wHU+4PeFifL+i/xZqMTuwKMBXnElImBqzla
	qOxhwmrjqsw53Bnw0t7tk4IUCO9qVx9H/v9tQptN+LVVbbG6nincZ7LZhcfc+NAjfNccBRljU7U
	znQ3urwMDx9cC3lg3pZypCECy/6U+Q9REj2a3npW8ggGF6MP/ZFsyvspqOtE2zjLZP6e0qrHPOY
	lF6+Q==
X-Received: by 2002:a05:7301:3a8f:b0:360:8a6e:640f with SMTP id 5a478bee46e88-361a3719b9emr1823808eec.39.1792198558239;
        Fri, 16 Oct 2026 17:55:58 -0700 (PDT)
Received: from localhost ([2804:30c:4067:b00:a68b:4892:7af1:b51d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm11354769eec.6.2026.10.16.17.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:55:57 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:57:02 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, jic23@kernel.org, dlechner@baylibre.com,
	andy@kernel.org, Michael.Hennerich@analog.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 10/13] iio: adc: ad4134: Support SPI 4-wire mode
Message-ID: <atLH3iWLXQqyctu7@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <ec26e0e1cbb6572c8eee391951c084a7c264887c.1791309733.git.marcelo.schmitt@analog.com>
 <179199692830.658576.14049229425648931434.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179199692830.658576.14049229425648931434.b4-review@b4>

On 10/14, Nuno Sá wrote:
> On Tue, 06 Oct 2026 15:19:00 -0300, Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > index b5207f16054e..debc2ff02705 100644
> > --- a/drivers/iio/adc/ad4134.c
> > +++ b/drivers/iio/adc/ad4134.c
> > @@ -308,14 +423,18 @@ static int ad4134_register_read(struct ad4134_state *st, unsigned int reg,
> >  		.len = st->crc_en ? AD4134_SPI_MAX_XFER_LEN : 2,
> >  	};
> >  	unsigned int inst;
> > -	int ret;
> > +	int access_ret, ret;
> > +
> > +	ret = ad4134_claim_reg_access(st);
> > +	if (ret)
> > +		return ret;
> 
> Do we really need to claim/release for every register read? Can't we
> just select register mode at probe and leave it in that position by
> default?

Yeah, we could have it that way but then the error paths get trickier to handle.
For example, we might deselect reg mode and then fail to select sample mode.
Because of that, we would need to keep track of what mux_states we hold lock to
avoid deselecting a state that is not selected. 

After sample read, we are susceptible to succeed sample mode deselect and fail
reg mode select, so we actually also need to check we have reg mode selected
before register access anyway.

Not to mention we would need a driver .remove callback to check which (if any)
mode we have selected to correctly deselect any multiplexer state on driver detach.

> Then when starting to buffer, we deselect + select sample mode
> and when exiting do the reverse. Seems even more appropriate when the dt
> mode property does not want to use DOUT at all which means that all this
> select + deselect is really unneeded.
> 
The select/deselect dance is not needed for minimum I/O mode (no CS wiring) so
I made it skip the multiplexer switching entirely for that mode.

Thanks,
Marcelo
