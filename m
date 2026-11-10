Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317136;
	b=R8aZjZb1wLOb7Jv68tbEI8rJym4b3ANFntRC5qhEHvCNg9Q9uIIZEyX7SBcuwMllbIW2
	 Jx2iSNzDbBvl5TtF4rBzlr1nb9HXgPonrQKxzg0tZ0o2prbyFK3EET2ZFwwZFb1Y1gygW
	 Y9A6L3Hqma0QAYGMfd0wLIr+61Lu7NUdzauBTdFqsuw4rkEyRJVohO0VV1smfPXzf+4GF
	 cMTNRqGHYbEtR0NEVAXtqexJH/7X0NfqpwpPToWYqUxeRM3yeeOkxYLVdLHex+e7VCmyW
	 DKo2Vd0OdM7LSVbYmLW2aLWvs6RDyxpb38v/h42c/m2KzqGIkar73eNQITWEx9sLPGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YKd/kHsAOXGiQQzEOqTVusTgtAD/RculmOME4VJ/9Ks=;
	b=XK57lOGVdCh8FrF30P789LQnS2FLHaGuTianpgauHjZL1fBG7377WhJee/o7elebhZ4s
	 gZ15jUOMB0Od5r14X6xv7xX8Yeas7URzIIHW2l1hm1A1fYnCIpB2MuRoMWBFfweQcRt9h
	 uguJ7Ic4yl3M+m/+4JuDcFrUf0Sxp+Sms5XPsdQmjTyeH1hioW/dytnM8rKzYJuOWQf1P
	 HI+2lcbc1Y3S3HGNGJX2pdZSsuV1Wl9hL8U6KwvLE3toJt+fIl9jerTfWErjz2Uk5R/Tj
	 GuDcTJ7bpXMlil+I30KkFxnCG/pbGtCnGVp0AAVGPD9MdEJFo9yX+++l+NsSXlLZ9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N2UfvVcH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44A260727A3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44A260727A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N2UfvVcH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so20045975e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794317134; x=1794921934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKd/kHsAOXGiQQzEOqTVusTgtAD/RculmOME4VJ/9Ks=;
        b=N2UfvVcHrDHJqPWtz/QMS71N4YCSe0N3FxfMUhjmXmE+gKHx7xQJ0fZSNA6Ki27DLI
         4NUez5humOsWmpUfLlwGSxiFajGxk0XR+uCM1tyInuAVXbsD/vp1SAOeyPGDU0mJFrWW
         VmfYZ+OVpTIMMTKebquNXGwuJclH5f6Ek6pEyoaAsxWSAAMox3fYDL7+PE3aXI/3RERz
         bWD9BXEM/xNvzwZKfWJkrp56i3YWcwxZ/kvmhSWI1o/3nmMaYwcy4bjxyGs5EL+exW4c
         XRm8O0w3lxMXGwL9L1l37bzSKpnrrimyF6rI+/RRN2kF8S/l4mEKt52yizG7cJnuPHsE
         CEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317134; x=1794921934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKd/kHsAOXGiQQzEOqTVusTgtAD/RculmOME4VJ/9Ks=;
        b=HRWZv8LwNDVsll3JLz8aflBWbmYdeRZJJy7zUB/Q7nK94B+4u7Y7DZ0kGXATm1+uf5
         c2Ed97FCQoewnV3ESn+59HQIqfbxpZbZCwBcaDqKwpmoMGOfNKnbkFjoTbNmwPhg3H5f
         m19E5P5xHQGc5YhFIWfIFBfZPQ6KPBWVUqayMorvR2joF7POdr0FvGgSD3IcndEEJmPM
         TRY0yBW48dFAVJ1TNMF0CMMNmHP4qBMNgaGSqxErOKUfhPUSXb1bWJ7QIL7M6a/Jb87T
         uD+TxtIiEhkFLQ2k39oSwhwOj8EVeYHmP64driQcUEgEwNS4v2uS0Eeg22Uf+aq6kL9D
         +CcA==
X-Forwarded-Encrypted: i=1; AL+hErFIkcMH4jC+VNpDtDzAhv7x0g5rO15Eo/uBKbFw+c2y5xkSakHgrTdI0Px+PMr6//fyCtJInzU2URFQrbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/622bbPSlUspZREZABrf5/6hxBPBHOfxARV1pgIyO2nHm19agw
	AvVULyjJZtJZwxJPFmDplO7XiSHE+9eTXw1Ql6oDmykH5WZYDQevY1QOibuPii4bmSg=
X-Gm-Gg: AYBFou0yhEl7g8p6BUAFqE2z20IJks6VT1v6CNcjiX05I0OIBMSnH1a0e4nNT22MxKz
	zPj/g7erH/Gkks4/BMM6Ki3qL/89JRFUkX4tTxtmoCFf4oUTMRi6H4J/TCQ2ZqFf1O96EJUb9Rc
	ACJI+YPvjKJKQPXfaT1HPiIIVUEAUoO5ruQWZGo5ec0uzZSe3NvxwpHUmna1V4vci+zbb0zWaFh
	ig4RhnpOn42p6/jVPErTpdq1CdSjdGPvqbQRXqqAvPHhgQUcjku/qCVu+xi03NwNuvFF85G85GB
	V+ICzyVM+1yrY+qnV3NgiuyfUrC5LdQcZZdDKH5LEy9uxb0zYPYaRy6FjE4rxgcFNYZtNOxCzj4
	ugGooJ7J+CzGKVCQPwGkHanGU3jP3w/jmFLC0AMBvFkb+vJFFAcqBZM584w56/seMKHCZC9pJZ0
	8yBn4gol7HinlaHFoDAF3KfEm1Cn87tj9L9hsw0mgSSpIE8ED/MAUNGpwmBNI4nQskSdAhfKgzG
	WHJ5IY7349jgiqwhrvg9z+am8/gCLMA3pFl3H8ihoNj4ZuXslyQjNnmS/wOw73t5BNiuK7CdY0v
	wLMr9katfu13gTnrNpKaFdVFio8DhYtodiRTP+HW+Jde32cbosiH17VNZV6auWaNMRU=
X-Received: by 2002:a05:600c:46cb:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ba0234dda8mr46784525e9.22.1794317134025;
        Tue, 10 Nov 2026 05:25:34 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm61728495e9.7.2026.11.10.05.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:25:33 -0800 (PST)
Date: Tue, 10 Nov 2026 14:25:31 +0100
From: Petr Mladek <pmladek@suse.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: rostedt@goodmis.org, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, senozhatsky@chromium.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	keithrteeple@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] lib/vsprintf: Preserve the sign of seconds in %ptSp
Message-ID: <avMbS0HxxVBo76tq@pathway.suse.cz>
References: <20261109215445.43419-1-dennylin0707@gmail.com>
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
In-Reply-To: <20261109215445.43419-1-dennylin0707@gmail.com>

On Mon 2026-11-09 21:54:45, Hungyu Lin wrote:
> The documentation defines %ptSp as equivalent to %lld.%09ld, but
> timespec64_str() formats tv_sec with default_dec_spec, which does not
> have SIGN set. Negative seconds are therefore printed as unsigned
> values: {-1, 0} produces "18446744073709551615.000000000" instead of
> "-1.000000000".
> 
> Negative values can arise from time differences, for example in
> fnic_get_stats_data() after the realtime clock steps backwards.
> 
> Use a signed decimal printf_spec for the seconds and add printf KUnit
> coverage for zero, negative seconds and the signed limits.
> 
> Fixes: bccd5937447f ("lib/vsprintf: Add specifier for printing struct timespec64")
> Cc: stable@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Keith Teeple <keithrteeple@gmail.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.5-trivial.

Best Regards,
Petr
