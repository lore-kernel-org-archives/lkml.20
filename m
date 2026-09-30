Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71D374A05
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780483; cv=none; b=cvzHx1PP+5xQZYlQAXS+5VV2enELhzB1kKK60prsxs2AwGw2IZMuzYfoJJEhIdUS2i+TFq5wYCJbyw0n+cM7IRdWqjNQzO9g1o9RI2MV5jXkweAt+jkjM1RiEACmPRrqKhEnhmql/RarYBzP7YnXNZQ6NOvRd5HjEcCVRLf75cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780483; c=relaxed/simple;
	bh=JD1fgY+7J4x4sU5fNLsBwey7gYe20nmvoZ5i5mL0c5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFOPrDZ0pQqkOnZyGhjkDVoalKl0Wj/t77Tx/OTSwTo8LJ1n8Qeq+YbNFqK1B2hTGqybVa+CzBIZY3JGjl29kAUoUdFWWFYSj4lZt+wNiwp5qHiJ1RXie6nuC3c89M0jtVwSls5Mi8xOOWuDSdPlng4+VTh2HIHk3uoSAgottkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I56aTj2f; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I56aTj2f"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so51216765e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780472; x=1791385272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=;
        b=I56aTj2fFytE/XlxHxTk/cMvj1IGvSqcWGDE0mbwMBxtJG5rZCdSorZZ3mXhbOTDnl
         JUgA/AmAhCiLtovV95XlnLgkFsQQNw4zAAlOZT2wylGahRcLqLTWQwu9qFqnMKrU83ee
         60qfnpfiZsaPpqLmxItW+aRB4SLSTT92pL+wxmPYU21MF3ZrHLE9pXpfgT1xbevaxbph
         Z8MxW9NtuPi3jpzQauMHs4a5mNe6NarDg5c9fC133aV9XLvDDda6XnWWLgaW++lHlC+2
         PMjjeEuHKyFZqnDxZ+pr/vOIyX+wvNr6aNccrGWOfWuYvi30+K+GO9FIBsju42UAOsF/
         z7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780472; x=1791385272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=;
        b=fIUPp5IXFZIPZa/5o+7V1oclCdJwrgT2HxDS677TNzzVjM5Gfd0SLXXQdqpe1MOrEh
         RdRA6Xx8PXq55QD5yRadQzEO26BzZC6XmUJmuVcquN2FroPOv2vba3OPwq1D+ajRJXFW
         Y49iBZk7wPNHP5rf8nrfGICX84NbDuIlu/Mnav0ZQd4PgnFzmjaAYczel/0In0GHSE2J
         p8sSoKz0+/HnsF0Tz95l8h05Q0Hq/aqn6THK1ZNwnzUXvln8w+ZfGV3T17oEfkwP8oSI
         ObY7q9GlcsLXwBbSsg05L9Zwe3V9HOSeUg5EHXY+Db5O5wbdFx0/GoTyVdpcjAO0r0xK
         hAhw==
X-Forwarded-Encrypted: i=1; AKwUvBx/VUL4N8YRGpq5gkYrA+lxOW0LoV5bTq7NhrhseIEZ5PDBZuh/E08DoZM/bua0kAapOA3m5q68/f8RXpo=@vger.kernel.org
X-Gm-Message-State: AFuF++ltigiQLGanS3JHGsCXGwAF20rXenllncOg9Rfa7IYBjVWNGwdw
	Ni0cWzLkV24GmLHLLhkLTAiYZgIEBfg4RCD77qtM6kaXmtX/z1HAgVsL
X-Gm-Gg: AYBFou3djkM/9QzABDl/+BPy0QiSeFW+6cCXPE0NIN7Se5db1VJs7aMghP5tFCe6Y5C
	CCrO/j+Wjg+ojW/KPRkNJzujiS/jN3olEH0sB7NaYOOZJ3y89If2U06PEvY2CTdmDvvHDuyUP2N
	1i/RpHuGsCUfj2hhtv8kaK9hlbbTEEyO/I12Y684in9aSVDqkE3e1I1i0yyW7scT2yJ2ZZ88FuH
	iZkR7ELGrZvdKxRGZokRczRySPL20ZPt3HrIh4b+/kSppOT759Lqp++S3sifSwJdv3Ky2Q6xJ9o
	A8h2hZR560wS7ZRHpFV98b0GcTuzYVYyFKSNU4VzVswUxnKxXdhcAdsBFTvAdlzwhjMfiQPBPbT
	duaZj9gT0Ap/WVhYh6O1P6MJzj0nIVcdJge2pXKaPjq8Ti5JMpXuGL3PhZmFSi20fn6PKigJPqw
	smPBZWt62p6pc9LButfQ8w2GuKbbMkHovA1qm7B6/MguecpRfFiy6W/WmW93GUGWB9dep7tDej5
	O/XOx8yyvq4akRyUlSKxzyNF556wzNOtZwvzpzpTr+PU3PhufgP2osQcpiq6IcqiRAFwEkqZAbD
	DS+SgGJwJ3Oc3IcswdqKP6r4z7aIkUos8Kcv8xzTPje7G0xAPIX6tfWg3iOjJF7DyAXgHtPHhVJ
	IY9C3FOnbuNhw8qeLcC/Nl5z978YVb4F9DrgqkH8t20Dz8IaESlus9DR5Uh+XZr1aou1U48n7G8
	X4HwbP
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a01c0ec65fmr23274685e9.29.1790780471473;
        Wed, 30 Sep 2026 08:01:11 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01ccd1566sm17376225e9.2.2026.09.30.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:01:11 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:01:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>
Subject: Re: [PATCH v3 06/15] iio: adc: stm32-adc: add vreg enable option to
 manage diversity
Message-ID: <20260930170110.00005b71@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-6-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-6-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 16:18:27 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add a boolean (has_vregen) in adc configuration structure to prevent
> setting the reserved bit (CR_ADVREGEN bit 28) on STM32MP2 SoCs.
> This bit is present on earlier stm32h7, stm32mp13 and stm32mp15.
> No functional change intended.
> 
> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
