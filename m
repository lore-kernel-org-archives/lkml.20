Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DCE3D411D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216786; cv=none; b=bpOPtw5fqM+DeR68IsC08Sn6UnTy5c8dAWqVabbtQsKB60/SzT+80G+5uWNSNyjSA4u7LXyQ6i1f2Z+ejTosu/EYYpIeOO0KhGpXJH93KEAxep2hmKAh48TUsxRS92ztsWVjB5ydHSdNISLWXI33UEEaT3mW4EC9Jvsbwb25Sp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216786; c=relaxed/simple;
	bh=P3dIQtl58vlK4vCvVGpo8bRmfchguwl0fdNJtOmLjU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hv/AVDO5b9K612qFz985IXggfEGBh3Ngj9pmfNSOudyvrJwmCPTgY3Vw+uNxn0JjyGkzp4L2ZwuAm/bldpyzapCP1FHIt46i8spSjjGuE3lmypB7e3ABp9SZ00zLPpx8T2mkBREe4L+2YgXFTvr3GtQyNhsLPM4Ev5ujwr7BHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck7CtFlJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck7CtFlJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so4011545e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216783; x=1792821583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YTnAJbuDLYQXb15/j1+EJM9ZwYexvHGmO5mPLB8bd4=;
        b=Ck7CtFlJu8xLO15U+xw9yDDipRWoLY42+accE5BtY+x0umc06+S6qWUDdHdN3G6U+b
         9tNmcqXNUiQ+N3vGFxIZ+xwOGsvRQq6zsNUihk7+moLH/v6ZEUIqthalOKPUkcB0Z8c9
         2rVT+1SwBwvFojXHf1AzZLZFZtrkFNlEnedLmq78YBplfMoFgUk77wCD06FPG+ON7KwY
         NpwjNlkHZkkfUasSoBBbTOPqH1irgTBKbDkjwaHomh6SYtHyFOdGU0NaDTgkRhw8qk64
         D5208c34wXrhw8ZlU8Ky5tSRsBxiv/SnMuqLrCcwzVZ2kOO3DbtBhLy1MR1wdbgAdIbl
         BgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216783; x=1792821583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YTnAJbuDLYQXb15/j1+EJM9ZwYexvHGmO5mPLB8bd4=;
        b=j8TFyDhptPaXc77i5MujdAJvBWdYeQooOhWUeggAjP0jgvIf5wSx8fLpLoXlOs5ykC
         WItkq5dsxDsc21Pk2k6r7Sh+R7TwqyYmTk30Yggyv9hne70jGavB9RcI+7vtVHzMq2O/
         g2LrujEUCOmJk837I+YX35MX50w9pjH+8j0Bd8GRHPMNzBbL6r7woQkpVxsdBwcK6h+Y
         hc0/t/+8DjZ1roOrvIL+bV35/W+e2g//Tijic5Xn6fV9DeCHp77U3ai7bOdPg07rIkG1
         GRmkbJWE/q4SPwPn7N9f/wlmhruVwKwoRblZhxqFvBNuns590v0f3sQpV68Qggl/a6d5
         xn1w==
X-Forwarded-Encrypted: i=1; AKwUvBy94OvPZmloV3aXKJhHndBxTTfoC87yPgN3fOkK0ZdmzCXp6CBJRLZ9WTJRlPoe+Arvo6WjZLln1q/7oEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZP1UP68IFsL0P0GwUFQib3nxJ8Xp0lalgWkJL4SRrXO64u1io
	lrMOm3XVO3MVsPZo2LdXFATArLBTvhw4a5AwZppZydAIMaqQI39MurIQ
X-Gm-Gg: AYBFou0ebDO5mTno8rZ3dNNrWBvmsV+KwP6ZunC6A8KPQAz6Wt2Kq4bJRjQLx8tfFef
	KgZZtKAZxp7eQII+gUPx4GpYVssOk8TEwhuc+7SBci87M83cMt6lodXzXgHIWfoJv81Jape4jN9
	evCP+DBgWNaKF7zUc9zDIOXlxKMfcjHABeVn1rR5jjvCTspJUntgoo7WqpdF3pTt/btEgxq1SDD
	GZBT9hT9IiDzmmNOeGwXiw7aTTXou5ZM0ranz14BJETN+P4j7eCaZx2tv+Lnhu/rVjVcgPloM3j
	wslwQBKelxZGAO2ElbIt1UM2NeNhyziXfIPKz4OddtdDyuwQ6PH1kKzU8frUfbgGaHLKt8Quf7g
	9sPtK1AZxlsOdZnjOEABaOQEyRw30thMO0jQLPSSqGM8ajMlDYY5Gh6GRa0IjFlBx4eaz/pu6Nu
	NJq56lp9ZBChVp96+40CYqq1o9HZCUZwyJJOrT8uVkw3Nzn58WiagryBROiXc16Jq72HmAUo95h
	/IVtzo3Fs16K5bFSCq5zPHIoMbmbwP6hfJYLDkUqi4Hqd13v6zGpYANr/wvlkJF86VmhOYDQg6L
	krwcp68JM84aTuRPwiZ4Z0kIN9Ts8TlczFID4FQiHiiiWs7U0vSvUkRgKyKB+0zq7sOba8qSI4P
	DKDVUzVdFZ17lXXFPfqpzxsb3Pg8aF5xq9R4/1gt5k6aj7OKB0khai2sLZBQ0G4MjIVSv8QKewa
	MrVZM=
X-Received: by 2002:a05:600c:4f94:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a1d76086damr33196555e9.30.1792216783026;
        Fri, 16 Oct 2026 22:59:43 -0700 (PDT)
Received: from systembl0wer (109-81-110-61.rct.o2.cz. [109.81.110.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca43012sm45595395e9.3.2026.10.16.22.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:59:42 -0700 (PDT)
Date: Sat, 17 Oct 2026 07:59:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@analog.com>, <jic23@kernel.org>,
 <nuno.sa@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <Michael.Hennerich@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v5 09/15] iio: adc: ad4134: Support buffered data read
Message-ID: <20261017075939.7c9a8bb5@systembl0wer>
In-Reply-To: <dcc159585f0af92c145569331063bc867efeda8a.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
	<dcc159585f0af92c145569331063bc867efeda8a.1792200021.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 22:59:00 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Enable users to run buffered data captures triggered by IIO trigger device.
> Add an IIO timestamp channel so each data scan is provided with measurement
> time information. Require single-read operations to be in IIO device direct
> access mode to prevent buffered and single-shot data captures to disrupt
> each other.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
