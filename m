Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F64F4753
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841719; cv=none; b=oFwfGvomyvYBNUmCEaA7WUIZiCvISVDIxhJE/5qIcfyTzsjrXsNQnf/0DVqSE3TadLWIj0RoScoT/c+QqffsMApYajIZEWOnAICzRJotmsn1ho/cSDvbJIRxpQxXnNuj1kNGPU8CZUcfIpXyRu60SN0qcDHmHjQOUs2txNVfpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841719; c=relaxed/simple;
	bh=M8DED88FTt9vGdXSJgORPtM+dFk8rNOOwoXkojqQ0ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BO4JP4fPKEG/hO1fI7XPmdrFjcGUApPU3o8A7GB8iUB/GAPj1ENVbZVj1U4DmvtZe83lz6T0dakENI9bCK1kVSNlGDbJsWqHHVCqtgGEaqPuiIbaoYIl9TNRUgkSthD+JelTiybeR0Aa2xbuvRbZEBKCgWkJ5TI2CM344KdeI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6SQyZx3; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6SQyZx3"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9851592ada1so521552241.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841716; x=1792446516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HnRhY04PNKIblmopaFcCx+f2FeA60ZgfsKkxJFBzxg=;
        b=j6SQyZx3sPaIksG4x4b65KZxBMhJsxzFsDlySPoMpKh0OTkHOe57irh70AHvVAUylv
         cXQrxPWYCXAcy6kHi4OuTPw+ZZUkBuIM35UXK1SmU9QhysHk02fHiHp6LsutgBgo0RXw
         Vv9xIwdOujPaWzfmUs1/2M79ruXGbBbLzuJ5eG5xaD3fjSxOtomhK373LR6B4blptBCk
         t9JXOvyibHJzaSjVaI46ip0rRYRpUyc0Rzm4R8A9Xmvska/QS29m0OcH2r47MdPNVNdf
         cfPJZQnJjfb0gcqK98XSXe7+XV6tS889qTByRWazk6dOLyafksSPA2mzhNevTpO7Io0I
         qz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841716; x=1792446516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HnRhY04PNKIblmopaFcCx+f2FeA60ZgfsKkxJFBzxg=;
        b=G5+OiiguMOc35ki81qEtypKoaDO76xKd2+VLwQiwqjQoqHU3PA1pBQZDgfbwycZJ0v
         V4rIXwjdWBjgQsUM/NTcn0K2m0xgzbS0RCbhW+tvucLZRpGCMUQ2V12ww/YYdbYJli3/
         QtSrQjgrXNLDPOzSVJSQYmmZWF+ffObocv+UW2dla9TXqTLouGIwq6vfijju2aqRGiWM
         1k8XTSIU8B400ecTdJ3HgN4D0bp/G4eVZJqVq0o31+ltPcclFhq+kGvsbgEtlrLYTDpd
         0oqU7cljgGyGdp9q285QpSQLcSNl1GvEGNju03diWE8XJlnxw9nQC1Y/vk/QwM7ILYUl
         AMeA==
X-Forwarded-Encrypted: i=1; AKwUvBzcLhoEax5XBom5wmXuTjkn9Q3W1x3G/XS/g1QkVsuABEBOyRWtib5FiybUltnlVsd1RsKGfeoafw3Lh0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUN1uNjKE60AZcChAA08nVoDrsf6zMjIf+VLuw736uEEVHl9mX
	jIjtnutO2ORXcA9tn4UaYkwl+7YBy/UcRePuKmUbshzXQFIe8K6wtPOM
X-Gm-Gg: AYBFou2EKDBWO6e/GZuNVDACm/UyLG/S8gtEfrblBRdn8YgLW39BhSFDr3ep7uzbNZQ
	yylTxtNdDqVJQt2/y2+drOjauYHyHx+jBmhL5R6N5/ARHlDYcfYrS+8S2rRBvc8iY+aKTB3eV7c
	gK6xh1xVVVPqst1hHNak2HFID0yNDYzHZ00cRPfspUG3c1YiilJNFUKogUhKlp/4C772MbBm+jX
	y8ibIwe1SROD7L1+Q1tL4F+6ijbsST4ecH/k3aYdGYayzMxU0rLR8+7F+CxoKsqb6J62Zj64hRF
	xddpwfYR2Ck/xhip1VViUdAOanCZ8nILozW+DSJQuleRp2kH23fXFYxmu9N6p0VFWC6xySvDQFj
	qNted8a2kBAAAeVBf3RuozVunMi9ZBvDyjyp4SNYEFGahK2F28U9Oln7nBDtFJEiCsyjJdJ7S+s
	JVxr+3IiCEbltqRJz8s5B89TZFZxK1uKVmMBuw7f1qtItDNp6wRy1EkickZ4hLJjvkh8p1GnvYc
	Gep
X-Received: by 2002:a05:6102:f8b:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7cb3737be51mr2116910137.24.1791841716002;
        Mon, 12 Oct 2026 14:48:36 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cbbd178e4csm1426250137.2.2026.10.12.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:48:35 -0700 (PDT)
Date: Mon, 12 Oct 2026 18:48:55 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] iio: imu: inv_icm42607: Initialize gyro based on
 chip_info
Message-ID: <as1Vxx7sz3gTfc-q@debian-BULLSEYE-live-builder-AMD64>
References: <20261009-b4-inv_icm42370p-v6-0-e53884f185ff@axis.com>
 <20261009-b4-inv_icm42370p-v6-3-e53884f185ff@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-b4-inv_icm42370p-v6-3-e53884f185ff@axis.com>

On 10/09, Kanak Shilledar wrote:
> Update the chip_info struct with a new `has_gyro` property to support,
> devices which do not have gyro functionality. This is a precursor for
> adding support for the Invensense, ICM-42370-P. It is similar to the
> existing device except it only has accelerometer. Check all operations
> related to gyro with the boolean.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
