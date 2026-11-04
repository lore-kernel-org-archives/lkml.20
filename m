Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810019;
	b=MeqTySpZllos3ZNjitomV13b+oQkeVXN8MNfc5Zq4Io7VY1AI3W+q2rHObaXHId8FdqV
	 mtALrppA1CHXUBrPjcboTfVefo8ci7ioeE+1rEj5xc04qDu8o1fsK4slyXjsOD7tkdwKs
	 kOCHtsT2kLnwo+a/8fJ646lPCxFEBKfYZ0MUmR/Q1pJOLfLUZjMd7tMV2POjTOgHLjC4F
	 4bdgEMKkcal4VmkENlYUxz4/VMsjnHa514cxRaafYMs6pCOXFyQzUJFyFDdm3+bjoV1Sk
	 kVx8rulsjXndz8RY8SQTX+KSX1KAMHrH6LntZKJuf5F1qM/dKIyAYzCJ/LqfM0kQ7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZueyWNpbGIvjsd7Apf22rsrjFkb0XJaz8ncfgP1uRU0=;
	b=pRZORfpN5etnB8sppmQoetHJ3Gn1zTi2EHZzr/55Jkfch7pyxdvIrj4Auaz/xAXRqOqy
	 KCaKYhcC0cyOZBaQRTzRXOYBySNU0sfcn+BIrCXD63q8vUk6qr23a8KXKCYtvyDdVNqvZ
	 OOVJZILIfW0Ov5C3JRexUmFB0wF7RZbyV62lvUpjESun0rSk1G8Q7X5CZHZKpDi7wV8Fx
	 6CJMLY8mOOxAXzBxXKAKNyEFUilcwJ1I3D0v5gwU0LOfbrS0l9q3XTsXseNiWX2TUGblC
	 dk9zMZ3UV4CFvkYKv7xNGIHwB3reyCfg/f3SsMOwZ59u5Y8Dufs44RxLh1iBkfJKu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyc5+OS1;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B2606D804
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720B2606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyc5+OS1
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so3443415ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810019; x=1794414819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZueyWNpbGIvjsd7Apf22rsrjFkb0XJaz8ncfgP1uRU0=;
        b=oyc5+OS1YhxQamlQ+lMzRkTUgMsruE6SCyj731QUPB6nYUbiCQDd7OVb6Va5fCTE9q
         4TZ5+JMcKfp8TQ+TJB+OJMb0cbxVqVq4K21Hjz7pDV3PqlJtaNIEzxTOveAZyikMFV3i
         BldWwTeClw1Zrpy/7gJYKNwBXh9oy4xQ17OB22xMz3L+D1DRcFqrI+MQ9kAbt++EfMXw
         6DYRR5BNlypqrvA6env13DORLqZJhLL5FoO3a4tM70AUC503ukdAs4456c2xuZyujgsP
         RgSgBRWDpSmqpu0djmLQJbKj/KSnsjyPxv9yIhgZkG9YEh9A7Z62TRi9H2Ij61n17q6a
         utTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810019; x=1794414819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZueyWNpbGIvjsd7Apf22rsrjFkb0XJaz8ncfgP1uRU0=;
        b=o7D0wy5TwpiARShY+L7y1hO2jWbyud4OUGPZzHde0o67DSWa9/XYkdW8QBqfBMlrC2
         ePCidD5Vci8xoqJWWrLnjm2rI5y+ulCtwc4+3p6j5wLphnEM/lKG8WUjlEqOd1qr7KhR
         vUDwUYawmAM7W716MnujiMLODwDZsXKeaXwJq/4oDI3SC6NJ7A1WyMNnkiDfz1R1taYm
         v3V1BruyBllnNwAAzow1W1uHK+XqROJSMSv1lj9Syr0JlJlbvY7Yxyt/SKgM/ejt0xsm
         LR4xax+jLqQU86kWWbyLiZXQFo0n7ULj0JUhCnK2olYfo4PeuB2kECvbcFRwZ8dRPwXS
         Eb+A==
X-Forwarded-Encrypted: i=1; AKwUvBy5xYvOEtDJ/2lOhh/nImZprmUshUs953tQCSwn3/nZjll0Kb1j8Y41nwZS2dv/6fqni5sFdkwg68YeQgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fkpssHE1DbeZ5eaFhjPdFfVpdLyxWkIo0Fc1PoEH9QtS4eBIZ
	gzCP/gFo1h6k7VgYa1wv+/pR3WqgVIVfXHSe16VdQp6P+pgtXfrycJS3
X-Gm-Gg: AYBFou3K2yu3n/dgPMO6i5GYAo+414pkyW7N2B7DToRMVCnhSd12sFGvE2JEoYHZ1YU
	KQL3Bhou5SoVh+xZg9Nv9phrhHrYHL1b+FxgtAZgNaxQPXhadvRMAhgCB+lmQFfbDV5pGjcXw64
	G6LtEwGozi5jLZhNYOmYnjPCIh1NjRRgOzlTZcm27mCENtn9VlMeOeI1Py+/sjEmlIRDYBsUhgw
	O45M9kZ/jOxnXEVTFsLdSxDoFEyUHz69kv0CweSlWAHhCtnW2gmOgovoskU2Bo7AwWCSpMKp2B6
	s9mjym/EPJ4jKPJKqyCfEeTl+SQiHhaM74POo7bNn6/Cxu/aaWaoa8YZHZN0X0DsWwDgqD4/J6X
	AbxCf28D645geZH7UgYrhUrWguJ5kaZH2So+ENuxjoCr092yrNr9WA2Z2EsyFgmWbN3rKEoNFL+
	TL9oIMySu7/4TxT9fPrM6EVrmzmnIHO4Kds+HveK9srsfEaitctmyugl71iXr1oHYalP0QQBvTf
	7tRtXtcMU3jyNQn893dQs+D2Y99y7xxQXedzoDU4+YvMuJEQCajE4WZ52iCpYeEF4VLAXtmpZxM
	aW0ut4WWp5FJwjQrIw2hC1FxG7GDHTL8mZaD7c8067N3doohYkeC7mI=
X-Received: by 2002:a17:903:2ec3:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2eb364025a8mr153213775ad.5.1793810018654;
        Wed, 04 Nov 2026 08:33:38 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0922b86asm9967835ad.76.2026.11.04.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:33:38 -0800 (PST)
Date: Thu, 5 Nov 2026 00:33:33 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in
 sms_ir_init()
Message-ID: <hjwpt5mf7bows633pol5hwmz3uxwhl3fhjupsertv3g7j5m7ya@2rmgrywzhjyh>
Mail-Followup-To: Mariia Nikitash <nikitash.mariiaw@gmail.com>, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, morbo@google.com
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>

On Wed, Nov 04, 2026 at 01:02:39AM -0800, Mariia Nikitash wrote:
> In preparation for removing the deprecated strlcat() API[1],
> replace the strscpy() and strlcat() calls with a single snprintf()
> call to construct the IR device path.
> 
> Both the source and destination buffers have the same capacity,
> and the return values are unused. This preserves the resulting
> string, including truncation behavior.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Reviewed-by: Shihuang Liu <shlomojune6@gmail.com>
