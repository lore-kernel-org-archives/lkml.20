Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BE45DF58
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150509; cv=none; b=RcYi+VJk+LGJo831i1oPOtmAZfQNNlJJLhtexaYKUDbDSgxEZgnYlPIb0xWR2RCaZFPiGI8TTmnbdP3g71/OD3/YptaKoAIqNVUOBfXy3cYm73iNNo7JH0umWrXMYK3VgBufU45ELYO7jmKYcHHTVGsxutLoh9p0RRyhH/A4XPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150509; c=relaxed/simple;
	bh=CA4XKi0Cd6YgI13rxF8FR/gNyyNEOMYqWRuRazHMyaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tj2HA9eV8RwP5ZoetvK1uwkILFpD9Q1dVeb/athLUb82ZwXZkr3a8kMKbMEOs6foM9JoJT/M2PjAMtRiVcXdOp3zCHKn6i2O/s4sxDsEWV7VQCROvnXVlAzw3o6RzbuYpwzoLD04ZZjS6MbEOEU/0STo8NWWJ1RG+RQgeNhcVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1XZTS8L; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1XZTS8L"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so110650566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790150506; x=1790755306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIsED9qvHGygDRbseLLF7eMBztpFKvOOESnk1D0m6Q8=;
        b=B1XZTS8LpBKmfUQjVrBbdAxIqURHBFMqHb8xYLPn7dxmZy8/4d3FZmX6kobFnA56/L
         DgHKcRzP2m7RIvXRMAafvywfaTgjK8giXv63CcbgQvoYipt1gKLHK5HW/W2w72yLWo2R
         91duFeSZYskI3VTFsnYf0bk4tEl0Njwh21sa87HqTeNzgYIQMDijZ1+nIiAMpuuVff2g
         3TIKD57o1hsFBg8j34F9Vfdpim+Xm51oGyEgh9zyfhHFXMBC0m9uFpfBBzfUvhLJwvhs
         dGj1N/mXXxXL4AiRqJStTZKGoGggQlsIm644rB5RCiNK9pUc2+IkSCoMEREzq/IS74Iw
         L9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150506; x=1790755306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIsED9qvHGygDRbseLLF7eMBztpFKvOOESnk1D0m6Q8=;
        b=PzwmpxG5V53ULPnuuFTcCWo39UnrelpZTOcYyRc4NJK/Pr8wcWklDJ+leEU+nwBls3
         WR+ptolVhgbGk3NPfoDc1/vUblwkYVOounM1kib6S56QO/F97EWg+ZHPqjN2wxiguJ/6
         eKCtmZ3zNYv49OiCLMndsLrUAuXZ+HXkm1p1Wk+mxEUIgh6qJOmWwVtINnHAV8QfQnFT
         Bsm2jddhpC3H9hfOt99LCpCFbdWNgX+yVxDf5lTz2dS9zHv1rwLa1oQ6F414lEB1XR/0
         RY4A8+Sdg3pUDwrOliXMgeBoncepYy1vISOSNJnou1a4SPqZmdeHQCy9/hNy4ihD+jMM
         7IpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu8L0k7nz/oQZhBRJdH/6M0+GTEK+RYDHBe4jn0pHLlgQyO4qzIy/0KYHfiFMePsKiHB/eoQrt9sRjQI8=@vger.kernel.org
X-Gm-Message-State: AFuF++l4WbwwA/EqrweSdNvfeJpEzMbNWfUVI5L4JWMPxvmJn2GUuEt7
	/I4NY5OA25z2ejAqmnL1cma5JFgy/q73Mzfu70t+V13/OwrgZgnlprtC
X-Gm-Gg: AYBFou1I4ujgA8H8uT+BDoyUBHh4KZbPFdUqSPzX5mZEqjA1rTn6Tt7nffzGTFQrauW
	VMLSsWitL8lx3t8dL/CcG9Pxi5/RxqUn7/jwfU/n8QycYJPwqGP3H+GgKW65FdsWV4fdOoTfxiQ
	SnlJ2P7tpoIaWB9q1dq7IzN+/nvxo2bkZ8rYmRqhUF+psbHMmKu9MG7colIXvE4ep2CP+4a+mP2
	gn8BHWj0k0pwa7/foJW007so6uhcC/Mitt3r9FFdisC+BeoyOxgrcjM7OHERdf8Iq1kv2nd6+WM
	ip+WdEOeeED3zBsmKMZC5l8burdro/Qr3eBt2BF1Fu0xRsoWe5G1gEDRsnleIl0Ozk1R69MtYmv
	hZGeUiLw4WJ4N10+/UtauXwdTgTqAwwM3ch+WACmW4YO6Oh6KP9KvR/g3exnabtmJFwirZzg/qk
	qQS+RLWv1fDQ3CEtnoYLKrxT2JHgFDQdTUrOovBcMKWOeYZ4XZFlzAcPZ/+LlW0usBw80=
X-Received: by 2002:a17:907:d408:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c2aae140494mr127071166b.49.1790150506122;
        Wed, 23 Sep 2026 01:01:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6d2defsm62414266b.56.2026.09.23.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:01:45 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:01:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: avoid snprintf truncation in audio
 topology
Message-ID: <arOHZcAocfvxCJP3@stanley.mountain>
References: <20260923023405.41700-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923023405.41700-1-hackerowskiy@gmail.com>

On Wed, Sep 23, 2026 at 04:34:05AM +0200, Eduard Zateev wrote:
> Building with W=1 reports format truncation warnings when prefixing
> the Greybus device id to widget and control names.
> 
> The destination buffers are NAME_SIZE bytes, while the copied topology
> names may already take most of that space. Split the operation into
> writing the prefix first and then copying the remaining name into the
> space left in the destination buffer.
> 
> This avoids the -Wformat-truncation warnings while preserving bounded
> string handling.
> 
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---

I hate the -Wformat-truncation warning.  It doesn't really matter for
the kernel.  Dmesg output has always been really grotty and especially
when you actually need it because of a crash then that's when it's
the most jumbled.  Truncating the last couple bytes is not going to
make a crash noticably more difficult to solve.

The fix is to get rid of -Wformat-truncation for kernel builds.

This patch silences the warning but doesn't fix anything and makes
the code less readable.

regards,
dan carpenter

