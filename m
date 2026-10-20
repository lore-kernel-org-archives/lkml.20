Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459959;
	b=NVy7cL0UEBiqfluxOGt73YhxFtPl8X8cEstogONRxTQk8HVBa+G/2G7VpPcVa673W6tD
	 uFJuvyP+yj82lTivFO5xAWs4trRgIkx8hYBgKZa0VHwdch31lCfxS0/PQYplBoJCRmqQ1
	 mLupBcvS3hlI7CDudJ3eGpjE+OmZCT0gi7xNN0UXthlzTWV6RIfM2Pu8v2MrTMRXYoruL
	 lDDHFaLVmKvCaUGXx/ysYqNwfzXu7wjlkFajOVDP8jzjMhY5nxHnrd/it4ZW51eQsm5r2
	 tlKYApM2uvjSp0avZzvUrmPa3hkuVHl8tYnsGsQUl73qyzf2X9Tw8naTuKMjCZjXkTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hbd8F40uztWUFdFpYoq/NguOmu7kZM7kx6LRdC65rBE=;
	b=XtEzkHjNWd+WmSV+857xvM1yedn9MiDP4b+8NUJz6arkKo7zZBljf8byoN/VmRee7M/R
	 pISKBK3xD7HofpRybQALimYhBeObGCGcUtnsWVJisykfRcwfFjwpHWea9f1vxYKHbM683
	 HCd4PGOsmcMB2bndv0ERS7Qutc+M9uAb5DOuPrNNUI/gokSyGnyCvkU1W2xDgt1f4KP7Y
	 qd/rCi76pwfCAMKVbKBDbI+ud2BYO0RCw1tBxjfQ34wssDG6PeS4JKzbLr1ihr+CrTvqm
	 9Zyc7LSaGoid2ot9oWotO9DVBFj+uMsgzutumuDgg2zArZiagqQ5nY2GYOO7rBxJeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtq+eZFd;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF3D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtq+eZFd
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6593653eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459958; x=1793064758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hbd8F40uztWUFdFpYoq/NguOmu7kZM7kx6LRdC65rBE=;
        b=mtq+eZFdhhS01ky0+kx1VNw4MweptzQevrl1PWVnZAr64+3HZluobbKHYk/ulv5dlr
         P0lTY1ep/oueixqy9Wm8m0UHp9e9JRZPS6UN7Jf44hZaIklHxJxNIotKNEKfCsO8Ewux
         bx1Z6XXR4sHSy13Enr+1CMwXyqdDA4douiJSxf4AUX8LRA/1ZlgMT9gyatufVNuPdJdm
         Y0azE4OtpnLolOTb+1ISPXZNZfod3NyvK72LbIa1eiMpTjH2UAmq7ZeitHoBxNcAqWC/
         UA24BirhpP0FmVJaQE8LjlOm+n5MYIVQpcVxa98QXfw6xv96FWLToYNOLOgIKTo0gJLP
         siKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459958; x=1793064758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbd8F40uztWUFdFpYoq/NguOmu7kZM7kx6LRdC65rBE=;
        b=sYQtgBn8G9ed6oJWMWeuv1qeKgHreDxyURXTwpl8O3Q9mP4e2Y0gG0IXaq4gR55lhQ
         U6jJtOJV1GVQj0VHMuJDPIbD1JCEQyo7CbFlF8pw/j11TuB9OpELXuxG89GpIT2O0r5S
         x/amyDZ+ms8GXJ8lquyipMsyGkHPra2XJjg1uMPuLN0Zq5VKaRtHxO+2Ft1UxAqYPnFg
         HsKdTuuJwigtvUrbhvuB6JDSnaykLCAESPYPbwU1ynHeMHWK8WsqhBZOPpTOcgyQ02uu
         vT/5BRMjXp0JShlIFw5IuxxtnyeZJG/eRgncTkFUXoUDIzd3BKaTjWMz0FeNoUWU0rjO
         emHA==
X-Forwarded-Encrypted: i=1; AKwUvBwVMZZX3qjEPnEIUn5jltUTTGRXawVxsTFG3XrI8UQdLYNBkj6dVx0nqOjJiH+awoDLGYBU6jKrjyACjp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYImWRfsRCbuBYsIPmIlWU9VTezVoYiS8dkjo7SYDn7WG/Kna/mV
	GB8YcK9IUICgBmEXNImKUmPgemTcq0i7oOkxUp2DDsIAsgdbYkvfCpsB
X-Gm-Gg: AYBFou2Vq5hGuWRC//9kA5pWQws2dtyiictSyzBZlCGAhtbGbksKG3uVXxiTgmD2hnv
	H2bMpjkvqncY/kRO2mMQOa+PL2crMqf5dB1uZZy48TZal2IgFFbnzjJnVW0VwJNRSQcT4vcpS0k
	D4izncRKzueXvpgCGeRtZ8t1DP+q1Eho42/rtYbRPD0Yo2GwRDNvxIAG5U5ZoEIli66QLpIq8yV
	z/XVFY1GiirluwffN06s3/kRiA878Ayn5j7/Fm6BzdAHX0PvLZvHP5338+DjXfTvZp/ON7U3W5M
	ycHbMIR12uN1oP+xQO28aoh7rh7XrfLnmO32U7RefUjhSKRzqK36CLw/Yg2cBPk7YeW5OaCT8/1
	0wHvu7Zku7WR/dd+L5NGkKtocVQ9LUTmKFwhygPytd6g0yujSGZYSzVrEZJlEnjMMOC8KF8x9YM
	idjVUFBtQMtPAnvq1GVyxCpQgmqS1YNpA7mcts9bwG9dkGvba0kysEaJ63AKHdABnS/6FqO1Tdf
	80OQRbfDah3
X-Received: by 2002:a05:693c:87d9:20b0:365:b147:b458 with SMTP id 5a478bee46e88-365b147b492mr1958916eec.3.1792459958338;
        Mon, 19 Oct 2026 18:32:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm33999595eec.9.2026.10.19.18.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:32:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:32:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arunmani Alagarsamy <aalagars@qti.qualcomm.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: davinci_wdt: Fix typo 'occured' ->
 'occurred' in comment
Message-ID: <31336794-97d3-41ad-9396-865cdb4e7f6a@roeck-us.net>
References: <20261017164403.2987788-1-aalagars@qti.qualcomm.com>
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
In-Reply-To: <20261017164403.2987788-1-aalagars@qti.qualcomm.com>

On Sat, Oct 17, 2026 at 10:14:03PM +0530, Arunmani Alagarsamy wrote:
> Fix a spelling mistake in a comment inside davinci_wdt_get_timeleft().
> 'occured' should be 'occurred'.
> 
> Signed-off-by: Arunmani Alagarsamy <aalagars@qti.qualcomm.com>

Applied.

Thanks,
Guenter
