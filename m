Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD8741687A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268501; cv=none; b=A3vRkPsCcAD2BRumix5djGQTyAelTBwTdHuyYc6xjrUdP5Us4jvSVjSfoRDnQKKjyTg8ft+rWJc0LsZV/AASvwVr4Gcg+SFl6AwSZkz7+jBPb5g6XmMqIK+1EorXiCz9RZnEi/Z/I8XDi7VIikXBtwhLPbTVfZmW1k3TvQuNuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268501; c=relaxed/simple;
	bh=09gWLrxV9B2YL08j33NGm5uI7VMhjtGXOM0U4bCV5Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp3yOBtiAG0QvPY6n6GyKhjNZeoIxdeMrfOA9BRo4HCtPf19+52zGBn3JmCol6imO/15AMjTwENI2Inp4/qIRySe9UWhud2/JEfPeEQ8FFKRbUejSixcVPDGSYQ0Lm2Bc1o49TOSUaC+d9fJkZxoet0+OkQsvzBXr/jJGl++lAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zit9VWog; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zit9VWog"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1508040a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268500; x=1790873300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vcbua5mIvOolDP5npCwiYAbITQjIUK3wgIKLBNoELyk=;
        b=Zit9VWogUurDYmJnES1DV2o51mAVb4WfWQRO805+UtMdRTDq1OUmqDW9fl4LTHpLLJ
         5qP9o1NqZnWEIoo6n8BJe66bVhyHkQPvVmbEjk30uKBtGhxFPK4c/I8cKHeYJCrg1BmW
         ksLitFj1o59y0Y4t4ZAhA+0H12YTcotc+3lNyZFUtpNZUPdJ1vy9YBRhfMpKDo6QTJCu
         72NKJ+ZaB5sx+/FtZocryqrF+1UqEWq+syn7Cci0Yy5+nD0ZcBnkShISzzug3Hhsi9wP
         b/OXovt+uzsXFuV5c7pBc7Gd3KOyyUxpNJdXCfiXSweo6nHiY3s/LeUQvMb9wSMxmig8
         6cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268500; x=1790873300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcbua5mIvOolDP5npCwiYAbITQjIUK3wgIKLBNoELyk=;
        b=GOoVUUhFEGKKQ57qUB/n2pIhzooBna0b5a0BhmM0MsFOEhN4SMo+x4svAEv8L/RQL+
         mbN1OS/iHUCQCgN920R33720ib9zRWzvuqUXkcnclDTaAxO2+v7vKWzmmG1rMwzOhxxI
         9LxgJo+CZ4/zh7Lt4vpZWKtkw8V8W8JCxVrmAXGmoXP3CpSa5QjlnyTgjg1N7YJ4zDMv
         rwVnHRWqR3SNzXLj59mqlgziIqe52xcG7hjBuPyZbbgsVRBLxQmNkJ94WSbJmvw+AZFt
         UMsaeHUM8k1DJvFJSGlDkFWOmp85ZdzlrvJ6FfCG0C+hEa+B0/g/dcx88pWoux95E9Na
         PYvA==
X-Forwarded-Encrypted: i=1; AKwUvBzwaNojhhYLt/mUi0r3Pr+sZbpCvmL4Hkl9Z09/jkzxbLtbHSmDSgsi6bITbjKs+vXLrRER1OEhT4+4VEk=@vger.kernel.org
X-Gm-Message-State: AFuF++mTibK+ykHToTTuYSVBumUwudhMJ+PI6Drxy9wYaE8E8beI8q1h
	bxDAEWsPGrvxhKJJ60+546QQ8cBZ8551ys/y/aVwUwmBE49KU8ujyO6c
X-Gm-Gg: AYBFou2c4SqRn+80gSQnoTVJh6u0SKgX5bAN9hBtNNitu6Uvx3AlBQFjxnERzrj9izo
	eK7fWlN9UVU65pj1JI2cCpWSx/GwSJHzj0sgY3tEMLk+F9Izim7lr63un+NHucDIzM35TmN6nzI
	hhE2dmVUB6a8KJtRcUdi9YIwEZlUZ+Sa6UtCQYepLNIZsyL59py5oeZJCClfjsaOz7rY/bjPHsB
	EzVOiJS8kmaFJKXdcNDygSZoAsacPov6/2OBB9PPCekdpsv34dZmidqgGSEifvBgx7Ma01cWoQZ
	h+8mOWETgRarAauYS/8wv0Emui0sEc4Sla4+6w0XbfzOsE8H21xlCqG05bClgNAfRCl9YakKDDG
	kqqo96xSMamN0Tr8hwngaT66gVN7bIbM7mr0NnsrDKK773ZIuvrKDXe7MXyyChPwMjv9+w2Lwj3
	XyxOcXFYwNhIXSkmVO0FHXYW3sacPFBS6MT2LObLUuGTYjO5fpb9nP8l33yiF+1tGQ/2hVci/34
	1UfZzoruHJt
X-Received: by 2002:a17:90a:1108:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a09ed559a0mr1484080a91.44.1790268499752;
        Thu, 24 Sep 2026 09:48:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm5863409a91.11.2026.09.24.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:48:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:48:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ridham Khurana <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm95245) Fix negative temperature conversion
Message-ID: <0d7f2c30-a775-43ce-a74b-a2019558e5a6@roeck-us.net>
References: <20260923172551.1593798-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923172551.1593798-1-khurana.ridham222@gmail.com>

On Wed, Sep 23, 2026 at 05:25:48PM +0000, Ridham Khurana wrote:
> temp_from_reg_signed() uses only the high byte when the sign bit is set
> and drops the fractional bits in the low byte. Writing -500 to
> temp2_offset stores 0xff80 (-0.5 degrees C) in the offset registers,
> but reading temp2_offset back returns -1000.
> 
> Negative temp1_input and temp2_input values are rounded down to the
> next whole degree the same way. The chip reports -0.125 degrees C as
> 0xffe0, which the driver returns as -1000.
> 
> Treat the register pair as a single 16-bit two's complement value.
> lm95241 had the same conversion fixed in commit 0c2a40e2fe4f
> ("hwmon: (lm95241) Fix negative temperature results").
> 
> Fixes: fffd80ccc1e6 ("hwmon: LM95245 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Applied.

Thanks,
Guenter
