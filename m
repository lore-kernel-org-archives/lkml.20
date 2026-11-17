Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925863;
	b=r8Kzd+4oCKZHwvILXZwrwojsNYM/OuMtiXs7aUgup92c6GQ3yKXc6mada0d8HfKfbnr7
	 NhLDY4hcuKxgqB5flnQg8rdBBTz2VLeIUG0FyC/+/5zP1BtRl5yQap7Y85TvolU072ZCX
	 03GZunU1fn5VbyUJbMLJ1ZB5+sKXbxgQ5lpXR9H17Ec03gJmSQwzL4+bKaF5TQSZJAZ83
	 ASi805vBRsLhwK/7PlivevciAPTcaD84MilBaTN1Iv3axQu+tGczEGWXom+5hh0yYaT6f
	 I73Yro4ZHXrAjcsIPgnAmzfRuGCTRov7jgKgj7aL32X65kzAIwdDFv4u5rAEV0wDlNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=0ph2zl6rwyEKg3O5TgI+UXa3FjOJ6TNy4j3lJzs1fJg=;
	b=xdCPHaNNuc9xPIqwdYVtdsHPrSq74KLRmn/PmmlzGxAhVXMyfrM4LzOBgnU2uXprmGxj
	 YC5QIV80tt6Y/9KIL43CmkJyll6fxkbNKEx0E/bSyE/cB1tAUO5HEw0xt94mlLTqFxw7Q
	 c3QcouIPLIrvoig0ezLKROFq3IO0CusyPsxKNTYkko7nrLO06pogG2kBXJzvVVV2yl9E7
	 /fPlaqmziGJnrHGeg5H+UGZF45uSW/FGU7OtOFIm8DoCxeRzBUaEfzGISiVsAUwxdjDu+
	 j2SzMSQ2IVTfDykDKZWj4qPIhaLS58aaTWEzIkNErfqFCvVdvAxhKeAKg66ijPPEHVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=dkZwvxCn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1A606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC1A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=dkZwvxCn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso40584315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794925861; x=1795530661; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ph2zl6rwyEKg3O5TgI+UXa3FjOJ6TNy4j3lJzs1fJg=;
        b=dkZwvxCn+HSmhAh2arRbuUnjflLbwYkcqJ6vsT3a843aQrKbK4v6U2ckv0sjj87sRm
         Q12htFrZ0zRZZ1k9gPt3MntpwX0oqMEkcsD5Mb7B5JG/OZV5nAWkdRdU4JMMIIkVqKCx
         VqIJNo5Ne+mBvDlR4eqkSdxg8SBhQYFnRoKr3nJs7JOeLvKrNtRY+2GVY1AaqtKRYM3/
         ko7RqPZbWHYSEjgXYf82Y9jUo6Mgx57XNzvuiuXBRMUOuXsMR2xgAfftV8GK99zRXJ/g
         22FXnWLxdWdJovuDvIofejBHuiJzramtuaXgKgNABE8ntCXwrHZ0yEJsJCwR59GKB4UI
         xqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925861; x=1795530661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ph2zl6rwyEKg3O5TgI+UXa3FjOJ6TNy4j3lJzs1fJg=;
        b=Ur9XMyMcGNXLfU5g1skExWEjz33UdD1BbXzJmVu5Zzu9dnYfHzZBPFTq14J5Xs+j3X
         R0ypGiw5CqHdytLhnxp1qdUPEMmyzh3asyZWPLzdbW7PcY8GBYL/UfcW5y/DurvcCX4A
         omD/6gIORYYWCjiELY/E9wc/ABo3rdQ93tYSgh37IboVg4ji8sfH0I3kOQ/JH1KK1IK9
         BzOCgrYX+tLfquNbOTP2j7Pzy8mfrENfdQOh+rT7y5tYvw1sTNjsZAqXhgnl+802n9mc
         YF/f0IKwZVL0TsmdV4t0QPEYSRJizWT14/DeOW167HUbeaitFvu4FQz1iN1oQUuHi2c9
         tYSA==
X-Forwarded-Encrypted: i=1; AL+hErEhpXeqe6BXYiZCYCYaIPgL27uMQ6O+Jl3Zf/ggZS7b0Cmc/e3t2YFWPtmtH1n1UV4ODDutz4OjjiHNxw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z89wiMHyvgXZzy1/GVO11lA5tzmZuyYgrv2vFwMVg86LBh9Rc3h
	ska6eSptIArg6CJoO3iEc4FL4bwybhk1ZuboF+trZ/XzkulrgQd5ar6wyY9lLcd8W/0=
X-Gm-Gg: AYBFou1otpBzOtQ+OWVtk5eyfu2mm3kh21BIW+jpr3XDWHfqlLApSjECZA2QrWSDICR
	Xz/crlV2B+M0kBYxxgQA5CZKpQnfReSgNmVgig9A+HrLeg+xQbdRqtM6g24rWBLwii4rvVTjwC7
	npSN3rtMrosLM7/o4ycgJ+rQrDclCqozDeh0jB7HsqYt/JctSHvX9JLyIICbDCOdfFuvpcllsSd
	tjte2rn4WNL6gsw5bD9pDWyNAoBPgm31DSbgxQovQh8RQL8ynFkbCpc0tErXwnSFtoklxjbRJcG
	0BRD8d8Tk09JrPjLD/IoKQVNCEIWRvZKMpMAmeiJ6bijW4LpH0UyNt8QMViAaP1csXkc5mbgHUH
	XVVuR3mOezElnKmxF7OjNFMkOvDtFVu7BrxxdJDYNig7DQa5XjlGjWRBU7rrICbXF9VxdQOIbdp
	ts89mo8KtLR/aq6oly4QnRDMa0WwY+9uL0COzdzrvmjp7bT5bqm1O/0ntXSGqFWrwnPsWM+jlq/
	zp2LIvS+4cLxlccz5z3QiB6F/++ee+aYyahgwF98HCpcYsgvEqrunmWBDa34Cs6LcCY86uSoAtD
	JZkaII6Os6CwWO2bYn7ahLvTuoeMJMXnzOG04eShalMUkRN//RIVOLgZ+rflMFccI0c0Um/I
X-Received: by 2002:a05:600c:512:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb55a5d7bamr222461205e9.6.1794925860901;
        Tue, 17 Nov 2026 06:31:00 -0800 (PST)
Received: from localhost (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm73541775e9.15.2026.11.17.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:30:59 -0800 (PST)
Date: Tue, 17 Nov 2026 15:30:58 +0100
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org
Subject: Re: [PATCH] drbd: select CRYPTO and CRYPTO_HASH
Message-ID: <avxkfIwp5tqxpwoX@linbit.com>
Mail-Followup-To: Eric Biggers <ebiggers@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>, 
	linux-block@vger.kernel.org
References: <20261111083505.3998706-1-christoph.boehmwalder@linbit.com>
 <20261111212245.GB41158@quark>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111212245.GB41158@quark>

On Wed, Nov 11, 2026 at 01:22:45PM -0800, Eric Biggers wrote:
>On Wed, Nov 11, 2026 at 09:35:05AM +0100, Christoph Böhmwalder wrote:
>> DRBD uses the shash API for the data integrity, online verify and
>> checksum-based resync algorithms and for peer authentication, but
>> BLK_DEV_DRBD does not select the crypto core. With CRYPTO=n, a kernel
>> with DRBD built in does not link:
>>
>>   ld: drbd_sender.c:(.text+0x137f): undefined reference to `crypto_shash_finup'
>>   ld: drbd_receiver.c:(.text+0x58f): undefined reference to `crypto_alloc_shash'
>>
>> Select CRYPTO and CRYPTO_HASH.
>>
>> Fixes: b411b3637fa7 ("The DRBD driver")
>> Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
>
>Looks fine for now, but you should consider what algorithms DRBD
>actually needs and consider switching to the library APIs for those
>instead of crypto_shash.  Presumably not more than a handful are
>actually used in practice with DRBD, and you don't really need to keep
>"supporting" MD4, Whirlpool, RIPEMD, CMAC-SM4, etc.?
>
>The "pass arbitrary string from userspace to crypto_alloc_*()" strategy
>has been problematic for other kernel features using it.  For one, it
>gives access to algorithms that are obsolete, insecure, redundant or
>make no sense for the use case.  And it makes it more difficult to
>remove unused algorithms from the crypto API, since it makes it harder
>to prove that they are in fact unused.
>
>Note that the crypto_shash API is also somewhat inefficient and
>difficult to use correctly, even though it's better than crypto_ahash.
>(And the DRBD driver got it wrong, so just FYI, you should expect fixes
>if you keep using it...).
>
>- Eric

Noted, we'll work on that separately. But I think in the meantime this 
is better and more correct than nothing.

Best Regards,
Christoph
