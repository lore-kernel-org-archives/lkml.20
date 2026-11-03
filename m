Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692353;
	b=C37grSQHF8FOhBPvycrYZd9Qq8cIhHZPtvKAgJIhIV2TSnnN9bc7mj+7+1aGOSkQkwBV
	 jzQJFzlUblQtWOfF3gh+w3tBdqlRLwb5MftOTumSvJQVU1rJvBGZ1xRcYVotYcpdbtP2O
	 gLZp6iF8l20NKgsLTSy9EoI+4/letyqQLrs80gvPg58m5+T6+kFX71UBJ40yNlIDKePvv
	 20ZAM1zCRZ6EKrRF8HYab+kvgFVWKShoyvghdnAlmbthY8gHRqVPfBrtZfh4dvMMg628Q
	 qkNGqSDwYJ0DtceWRDhVb2b7+XMH1Nm6MsDNzYRgMkF3SGvzjf/MGtKGXVCMTW0SiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6R7CNAZpahPnRPALzexY2OH6fEkMajMjI2gkDqsBlDU=;
	b=UxKXOTCixX/niaZFBaeH7hsNADHpy0jEk+5nWCso+zq2LkJPV+ReJvc+7Tb9kWe/2S4b
	 opS/1J2btcWFuDmXHFdli4wjkTsUyBXXg7vL4FgkLOdOafFSr0jZ7gWA46FhpfOD2kwjT
	 dK2lOSgCzKqKOTjsUuccJGmDSKbiURx62LMf5o3GtBoVhzGF2EyEwoQ+mWdkWhvKWKlzs
	 29rjwf8hgCEg+QCZe47MaqApSr/bbJylJ/YZEPOn4ZrP2kh74AMQnluIFgAnSSvB/cmuj
	 gFz5np6H0ThupXI17/L4d0vP276xts3H8mvvfaZyy7MdA4n/LNF7C8pWKuX2XurDvPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwFFhm2t;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36117606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36117606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwFFhm2t
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so25472175e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793692346; x=1794297146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6R7CNAZpahPnRPALzexY2OH6fEkMajMjI2gkDqsBlDU=;
        b=jwFFhm2tuc1+z5jLnk8sYRGl0PF0y6/Ww1TdQrFosY/eeNTOr0xylurNbVeVQLNlZv
         2CZu1AuVJjMeshKnvR6pMhS9fGTwvqZdnEbDID7huggt7Txf27tIREa0kZIJ6KbvPXyD
         I/+GUlkENCStsCbpiDiekWaOA00Dfz4TgKC7KHzjsdPAycZ9fMIJNkao+YHjzSTAH+PU
         +3gPOww4J5ryq6pbu4zJwbp22ZnGrrE4NursYmlPurU6VQIF12FJModxPj9Q4Y+ohyOe
         puhN+lDJptO1YJBC9+qc3iDZ/1/5lK40wJz1wHBHQgTDaOpE5SOJZtoUR9po9K1bOva9
         83PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692346; x=1794297146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6R7CNAZpahPnRPALzexY2OH6fEkMajMjI2gkDqsBlDU=;
        b=KwAZNNFqFMEljGcquUtc/AwvK/12OQDa66NuQPmeeH3kEH6i0fnA9cZHdvVR1rMl7R
         twyh7spJkY3cle2VGlzWqXMGkY5QJP9p2jhknMik2zotSx8aC9rtienGlo5WbLi7cI4M
         x+KXEBxpXnd3APW7eu+iQt4LRyTmwo9jqn10u6GtFogSznr83I5cnSsansqH3+YNJLNA
         UM6k8/7/5B7HaG32V6F2E/hsXLqn5G5/w7KNg4/+cNf6Pl5tpljAzwLbtRMliRa2YXBW
         vme/AIbii7LYkR3b8HlF+riSs9K9xm9SmDRzV8s0ZqYe82wEolfanRTLDC3MAIGlrwNe
         Ojtw==
X-Forwarded-Encrypted: i=1; AKwUvBzgZ7zVxw72ec1KLx86JpOL/G7R0KVBPUl+DUBZBRg7OzT6t/qOG8utE885G97fRqrzZGkUoJqMVHs7N+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3zHHrUh4Of5VsxIa4w9CA3a5nl5I0GfT10Zerx+jwmNfgM/gk
	KTJv5nodc5lYeIXykroQBSJti9XhAlb5SqiDi1qz1b084cg8Z7QGT/AG
X-Gm-Gg: AYBFou1flDGt7In8yEsXibTIlfB0ex5jdosQ8wm1naTnRt7WI65yEBJeEGLzuS4SUbu
	VmrGgr21BH1GvubWx8hDVBIoYL+KYDUJjQmSoWhFAhepzepeTw3r1ZC9vB4f5giqG32CJvfjz9O
	K9C5ZzHRAyv9xjYX7kLKBdPbWEUdyH65QIIt7sJ2YhvpDpCZJK1hKQqYm2YytkcuIo2ZLryU6MV
	xZtA1rP4M5jNGFtxCasHkygK83eNQBWcwJ6eKsyPAv9bEGpTt1IEPdke5HZX7ebgFtEf/c+TuWS
	ywTclL4OKA9Yhvkw9o3e8e3j5bfO4tM7IUSjzD/sm1Fct7U/qV01zHTxjuzv4XedJu+AP5GyDRd
	LU3r3Ov6wTiXUGu+faPuFL4xdtGYVr6fQ6vQJ0kX2+7BtEHdwFoLpMtYyVwhHLwSD10nWOUNKOp
	sWHkA1DlnkIy2fJMVDksfWGkkr9U5OUdNZsolobAQK443QZBwnBpNWaU8/uaA3cT5EGzEHzIq2C
	QolSieqw6lgqlhKlOm4mg8PSpBV87FLxcXTxYsZ4tDFDag5fdeCK7LNguOOHk35/X4sxvVDuj2l
	ho+61isuz4cELLqCMwExzZ9q/hNMmID+V8pZjPfSUh5KwL3zh4p8GcoqDh/Hh7AcKl4jZKCxog0
	SkG70iodMZxasrapp6Bjez94KfG3ZjRepiBG0ZbVztFxrCe0yEW6v2l/HxS8al1Q7ZQ8nArHIl5
	izwg9OUazTd/M=
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4ac17b2c38bmr299232835e9.11.1793692346478;
        Mon, 02 Nov 2026 23:52:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa953d35sm37915295e9.9.2026.11.02.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:52:25 -0800 (PST)
Date: Tue, 3 Nov 2026 10:52:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eric LI <eric.lee0305@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix space prohibited before that close
 parenthesis
Message-ID: <aumStg3EuhPbWkZu@stanley.mountain>
References: <20261031042315.1122699-1-eric.lee0305@gmail.com>
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
In-Reply-To: <20261031042315.1122699-1-eric.lee0305@gmail.com>

I'm going to Ack this patch.  The other patches to silence this warning
introduced weird no-op macros but I feel like this patch does the right
thing.

Reviewed-by: Dan Carpenter <error27@gmail.com>

I don't really care if the patch gets merged or not, but in your heart
you will know that I approved it and hopefully that counts for
something.  :P

regards,
dan carpenter

