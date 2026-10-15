Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF34DD3B7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055287; cv=none; b=LTI408xYcv2MI6Kim3lCtXzpDkoqGEclEgSUdbpW14d/eXqD02vtOkxaxeaXJXeHpqnIc5tzsUFFiUFxhYaDos7YAdk60lhRJqeQ6GL8o61SfHjOiksJjTa8FSRc0xJc55BVfrgJP47mnCgNhf4lVTeyx9hjtMYN2c4P5iQ1TN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055287; c=relaxed/simple;
	bh=UmmPnWITwwuejqvLNFKB87tCxE8Nz/bViqOo4tLzpFc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxQvhiy7ifHryfyClQIeIbw1JQwJkTIv8JDxcmBvQghWRPJRcg0h0xje+H/S9a0JC8+01mYhG2Lvd7tLs2ZezqjQ66uLuK5LRADioigsCbg8FkhP8oHfkIIPx1YBNIlKAvoDnd/DtfGl5oOt9AMMuaybWCFk8zSFVC7sKgfArW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pK4ofho4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pK4ofho4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e73611928so43878655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055282; x=1792660082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWuTpLIpZhuW1BW/fT7Wvm1TL1EsBWcKdEk29mnqjRw=;
        b=pK4ofho46P4msiRi/9IXCc+n/FoTtM8TupKGpNUsJRhOc/Y4ApHZJZqewVyOeN+m70
         z8bTsxCsrygkDMKS3UY9LTdxI1CgTfY0yu6ytUcQ3XXMVVvex0CjGYCEGZ6mjptryW8t
         aJznWkifTpiS/OV68duMk/AeYLOw25+woyyhE+lr6jHr6yP3gRLc+O5QXUmkBTUctwHi
         nhUmG0uGI0mxWjeOgMlW9G1OKpvKBwvNbFG2v1pJ/wFBYd7XMhqMP9K2GvOgb4md/xwJ
         KdsFsXTRD6n2BsDv9X88eJoHUKvMdmLJ9cosKZza+ovfaRuUIAREyMTRnaC68i4oGowR
         hT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055282; x=1792660082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWuTpLIpZhuW1BW/fT7Wvm1TL1EsBWcKdEk29mnqjRw=;
        b=uILAVUEeVqd10Coh2/De2mYLF/xognGiNWYeOBfH7l0Hj2OnJTJY4JNG7bQ/IFgq7F
         vHR/8IqERasjJL+Jh/BYxT4otU/5dvMS8BLAcyklWGF4pqBGbkwA79xTW2vQi0JqQLMb
         W7Tr09MKEZE9kNjj9Wk4u6LWAIYZVbbs1nL/bVvIRGXInzADju+9SfiMp6gRhP3M6/xE
         p93vPe9WiP8uQ3zwoUVlTzLb+XY+jO39xsMUeiP81yrmDgq0xk//oJmgdGJfuB58o6NE
         284pgaQQIYWoz0ORvxgo6sUXkFXKrsyfBGzphDFmhfhKY/ZTncQtSNDA8GY5XrlA4aVm
         CgGg==
X-Forwarded-Encrypted: i=1; AKwUvBz8SW38cLMbQ61HM0ObQRscM+8VsAz050N3SNRJV6R7iedCgZjFq7I9eCQvE+hh9YYx53B+Tg3nCLiOp3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo7g4evrS0RqOSUIlKvyKo+ZQCaDXmZAhjECN5gWL3xRszB7Vx
	wCksrAQib33LxPenzU4nJJtwSZbw+oY5QTa6xJ9fe7RAgq1qN/JTlyJk
X-Gm-Gg: AYBFou31k/Rn/y7yEXEJRxrSZ9v3hVHyCJp2W4UD5nhPWZeNol2sV7gUhvXL9cAzxyh
	GSZ2/XT6EtL6QA5j7m7b4TBkGldkYqD8Bc0rWBIQMSrveSZwxXQR5ZH5EVT0+cYOmw8SEVcgsWI
	Rm1L28HxWOs1n2caKD/PQBT9iGr2qdAuZAQPoiMJSqZ31H+tkA3bV56bjeRh3kK0/V+Ms5Efenz
	8bBNh6jZprvx2jlEM0defaS83UfNjP4k3x30W7Fc3pb6Yoc5y5SKoUh0WtjPeO+YGNSwze8kGNU
	4L8SUf6k+cW4IrfbCuDMpQ86qWIv+xVarV8V9yFYPjtiaJIBeeVvVvT6LKtheD9auYgEjEDGddO
	LMRwdCA64wHjKHnmFcZpqhtv+cFZr5alP+dS0jd6hpDt4c6+d3F05nBCkcIVWdFmUZkkJHHNWfM
	hh1JVzzRWbmgufQSwqYauU620TjXbfZdkcA96lYLQkyCieqoDsgh0mSgItkN7K9zjJEom6rdbY5
	ABI4054dzsDJ9n6yOn9/WMow/q9Lc/VcDfeweadlPGAyyOjtyICDowywW3xUpAVCTJVKIxYN4Kn
	cWvA8SK8WaspGB+SFAC+syoGF/nlA5O/VEv0miYnNXLk2/w5zcZv0QEqWD2NawzeN0W89rReE42
	8bCLn9IDCm+rzrWyjNgatTYKZVXiztNSIbOjBFwo52xgv+YG8G/6wHt+2ZYCK0Syqv34k0+IvVJ
	NVYbaLtw==
X-Received: by 2002:a05:600c:16ca:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a18dcc911fmr255389955e9.12.1792055281754;
        Thu, 15 Oct 2026 02:08:01 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm17292841f8f.43.2026.10.15.02.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:08:01 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:07:58 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Viral Patel <viral8854@gmail.com>
Cc: Dixit Parmar <dixitparmar19@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: magnetometer: tlv493d: fix magnetic field scale
Message-ID: <20261015110758.00002539@gmail.com>
In-Reply-To: <20261014-tlv493d-scale-fix-v1-1-69a722176c06@gmail.com>
References: <20261014-tlv493d-scale-fix-v1-1-69a722176c06@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 23:07:36 +0530
Viral Patel <viral8854@gmail.com> wrote:

> The TLV493D-A1B6 datasheet specifies a magnetic resolution of
> 98 uT/LSB (0.098 mT/LSB). IIO reports magnetic field in Gauss
> (1 mT = 10 G), so the scale should be 0.98 G/LSB.
> 
> The driver currently reports 98/1000 = 0.098 G/LSB, which
> under-reports the magnetic field by a factor of 10. The comment
> also gives the resolution as 0.0098 mT (9.8 uT), mixing up units.
> 
> Correct the scale value and the comment.
> 
> Fixes: 106511d280c7 ("iio: magnetometer: add support for Infineon TLV493D 3D Magentic sensor")
> Signed-off-by: Viral Patel <viral8854@gmail.com>
> ---

Good find.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
