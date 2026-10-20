Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459565;
	b=fBH2jb37iv4jq43SzHWWAo4OFxLz19K5frS2hTqoF2xszNuZ0k7Lh0KizMWzAWh1GEAP
	 Ii+vUNqf9t0YYjdFERzLgc0bFqM6WHZQ8GOab+H2opTwBFUnwYWw+T5BSBrfjWK9P0mMa
	 gktZNxJK/DDE4nAHdQtr5NKBNeADi4KF6+VBkXp9jX1z29P37aJRchS7fP0CPMfgreIca
	 FuT1gnU9b9xsZanKmccQYGDMsmfJRWm6es4kSCku0PDB+fE1m0ZXbUb/u3BMmQtVbV9Gy
	 Yf9deHIXwHX0n6hmR1C17h7X16CUFSOxP6Aac+1CQHUb3Cm0PajfV2oTENZONykdqDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
	b=TmExS4uJsZ2qYgcQQm9bFDwRsIx83xPdKMiPvHyxtBI4R6/820+tKL4Cmy7zlcEkut1n
	 vOXrln3SJEYI5dasUru4TxYpYgJRP3rI6N2SpAqxEzrR0azETmXbQfHzfQKMO4Tgx+5Sq
	 dlYEDClXl4gQzmy6pa+M6yq1ZQzvlSkVFiaKr2mMWtSouc1ySB8AZo04EjyoS3Jqu05Ae
	 nEjEYlGBEpv8+K1bpwYowkljW2c1dAhMEEBjxP8EdTiZTjvcLALtGZFYzd5z6IYQqyBZP
	 1p6P463rGhZH9O9edTdMO7IiBZUFxy8MauZQztbbrkMLa/mw1NirQtTibvykBVcwmhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtUKGBhT;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBD8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtUKGBhT
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso1579117a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459564; x=1793064364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
        b=dtUKGBhTi4pj2sO++DHt5X+7Sx+F3pK5XAmnYA/olV3k80cy4IDnn+ykEnmQkRvSIG
         DhRDPrRav/PXW8OqhjimAI4udO+ElQn5Vhh8Q0NIgYrjvTr4cBcTieqRhlgGp5ACYGzZ
         rfsT/Mns7cRkdieikIXgem5Hr+dWNuv88t/hqtujOTRULVBaxmqBVW7aR1OVlbGo0CnA
         54dKgRbAm4CYiUYR45AjsbmZsYE9GQ+/HDlQruDkegX7lzvdJC/sRauGrm5I4LpZyFug
         xKTqtc5sJNY+z2UJAZrfRCOWLWx+bn/CVvWjNjfILZ54VNStNOzjj925t2tmMh6pZqg1
         JOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459564; x=1793064364;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
        b=Z+P4BGiVkZWbLnd02tfaFl8SZd5Qp1ZSvyRVkQZWjK+mpY3d2M1E81S86JDZ/4e6z+
         fmUlTOz7dbEoCu4hTLKYlR4hathJdx7gpuT9uEyFwnKrU/Q7093nMd6g8OZjvLanfet7
         3yZ9StmLluzVa0c4U/oJ6nxPZq8lgTMsDy229Qzw1UsVDzpuxgaGs62rQ/3rIl5i8Qcd
         PTu8/r0SLgKbsyileLWf6OQFmBRJ20Yi9Kd9Ies60UBAZphgW9HVKlf7La8GjxO9o+vG
         F/xYe53vpoiv7kLlRvYMinKVfW20J4BJSUjkn+VA+sFWMMPcRYFfFvzgIN4D05v7l19S
         zlYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEDYNpg755erpHJbiRJbWJhstP1OKRNlGp3zu7+g7qnX8Spe2ySJnQ3UYelXqmbAZIYo2u5zzxrXwfG4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa8wKEwCa2+qTQdFeb+fJoIWDHSuqQxCGcxRI6oeeqFhPXkVuw
	NRc5UP0bPfB12LDrLnVA7vEUb4VUyJ6ZJxrZFk98byANqihMKc+gBA10
X-Gm-Gg: AYBFou3iWOEvb/eVxnOYk9QTGx9gsHISyA8+XN8CFdVX5N8fYyLVL3Ajru6kRNh5D6I
	bN3GMKaDJgF7gEPxO4Por0rj3z5Rsav8m/MeF+vKlWonmXLdG63eW4TEWUz2hiduBkVkgivUEMC
	oB5aLtfq5b5lveFs0XSec03Gwy5BsB6xaJdnMXqZU0DGa8Ur3KMxoMPciQrPj4NCcDm5Q/LVMHi
	k4FnVzxLFQBxnNe7Hrm5YjKjkqLIgcTJfWcnES4tqZNQDJa6Az0tQSfqYGdYIcbP+suvggmwhPy
	kX0lumQ8CIChZoZxXjwGTWvZ/nvWHLFYGl0KWJ7FjOecD1qNMOE+5xawYjsijbvT1J9FoJK8OIt
	GOBdGm4INYo6fprXUueVSVl/sdcghAn34P2lK3oIxFlaUmbw3jNUvrI69/6qFIoXZ9wrEqxLJ+N
	s1yMu7lFaC8+POoCj/mMsTMSx3dWOm4o6TgWZK94FUTlpegKyK6O869OFxbrrMX00zVAOY7SuPk
	01bntSCGepPtJDd1aolXbMc2IFXoJLT4gMwkj6xnuOYECJPEe+meVMQLgBBmXmzwglJHg==
X-Received: by 2002:a17:90b:57c7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3aceed9ff39mr7771161a91.29.1792459564582;
        Mon, 19 Oct 2026 18:26:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5df655b1sm1647321a91.17.2026.10.19.18.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:26:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:26:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	hajun.sung@samsung.com, wim@linux-watchdog.org
Subject: Re: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add support for Exynos8855
 SoC
Message-ID: <38b3759c-b564-4826-bae3-5f0eda7ed20c@roeck-us.net>
References: <20261006161700.2185432-1-alim.akhtar@samsung.com>
 <CGME20261006155900epcas5p1b842116272ea9d75c815ebb11303cfa5@epcas5p1.samsung.com>
 <20261006161700.2185432-2-alim.akhtar@samsung.com>
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
In-Reply-To: <20261006161700.2185432-2-alim.akhtar@samsung.com>

On Tue, Oct 06, 2026 at 09:47:00PM +0530, Alim Akhtar wrote:
> Watchdog IP on this SoC is similar to Exynos850/ExynosAutov{9/920}.
> This does not have CNT_EN_WDT bit in PMU and offset of RST_STAT is
> different then the previously support SoC.
> Reuse the offset as much as possible from already supported SoCs
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Applied.

This missed the start of the commit window, so queued for v7.5.
Sorry for the delay.

Guenter
