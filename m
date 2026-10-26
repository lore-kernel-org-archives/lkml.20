Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030022;
	b=mG7P1Cs3yUJaI9AczYZkyaFn3ib1RzXnu9IzxKrSitmB3J8EsdsX1aQRuKaSGs8GXDW5
	 /IdvsFHICO7T92/VcrLCzzYPbULSJzJl5fBSA1xOj2boat7tHFpadW9tmoT4s3uP1DGlW
	 HnBEbS1N+V81U9Ml/I3zCytQZb7x2PWxr6ndl7p3nLd7ZEK54wCgB02n4IEhKWd5ORa/I
	 mwuHOi8VsxesoXohU+9FeRgEK0og5UJfcOL8QoafCTLqXNU7ZXwDu8quVIKnIH3AfQS4N
	 1RShO8UBBrmUtuwiRMM6eOOVTKyKyvl9rPMb6uYSM0n/cArrxosBtti9TMjn94+X4NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=R9AlT6hvjH3cYXCRXYi2r0iIos0zgRK9lv/Md13+/KU=;
	b=fEAMKRM134fyU/BMYOtBvo2li7MSCjkpgI1+3kXiZp5HS9Kd0Il/nxLqHarNo5gsFl6m
	 SogZtB2aEBX+kpM1OoTSBSVF55Xiaq4Ort4tBy4WV4f0LfMLe/64tFTbeDX2FKyD9Zo0d
	 MKF5hg1arYtiSAJZbsVWMmYKriDFH9UWFyIHLYA4c+cFKihrh8MyzXXye0rflJO24OAzc
	 stpzKG3N6F0qqJET1EDhCcJhDW0HXOF9L82nNqboQbdasQ8oKZj99eM3eLHscXFdEWDY4
	 dnAgpiY94nT8O3zF4jpBGJl3B9wf+Y4l+XQwMly5+iZBVr/7AshGEr3u5HZmUBoMbNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=holW+jG6;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE92606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE92606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=holW+jG6
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e96be2196bso10569285ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030022; x=1793634822; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9AlT6hvjH3cYXCRXYi2r0iIos0zgRK9lv/Md13+/KU=;
        b=holW+jG6+ZboRMGiQhcKbE08H3dPck1XmGAgKBpe6s1G8r8sMIjy42HOE3uMMff23A
         jK8YJDCosYXY5+ubOy+3LfM0VqteOH6pT9GbaPbyMQy7XKrest65oim060RXgS6At6pJ
         BTFZKpItcMAGCOOJQKjar15mwI6VFQoXInWIsSKYhnXWI37cA/n3B1WbWP5DMzBZUSOa
         Mpt5sTvH3KcHtraQrdtHd7oJEkgOfsaMzDefg+rkuo5Qhq4BmdVHPgEzOHxtxYldRUTG
         TXAdV+4P9wFXUVBnrygdLRHe7VztNeZBjShizkLlCGZ3A3cwrU9xOa7IId7CkrNhltME
         eizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030022; x=1793634822;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9AlT6hvjH3cYXCRXYi2r0iIos0zgRK9lv/Md13+/KU=;
        b=V5uvSZUKo39flGCAPuq1rkdjFGCTW1GfI5okmdzTkhSx8Lg7ZyfKkrKYP9IjNJzU0W
         MzWNHB+75/ZjHB6DFWKzcZgywALP9YeOZRNzuA7pzOunF/tMPh98eQn70aQYBAWKE2jC
         D26zI2TFwcwBRGTfScgRotT/WkahtEpjPCZ5iASJoVqcvAecrIj8XsaJO+rkAqOL6FVb
         gSYzGmTshC3RDoHN++QQ/s8EJP76lwGTQFcA1SXAOA3qHtb+ggrT0gjBeTIHawnylYsf
         01s2eH3F5kzedsFXsO61dXdVhuXkA2H8FXRGBXx0cKDPVwSIHJ/vQdbefxwVh762hDZd
         lp4w==
X-Forwarded-Encrypted: i=1; AKwUvBxSBHcMWEXdoZ1cvhS/ySGief7JDCTA/EK3ltTf2m20pi3DJzpihFnfVc1Sggaj7SWZZ+OHq/WMX6Ew0IU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVRB4ifR2OwSoNfOndQuOR7avLbwljB85/8573uCOdA4VhvbA8
	htO9mUK+cdlzz2zyxo0NExC/bxbY7S806CmLPOfx2vrAuxsG5flrh9Kx
X-Gm-Gg: AYBFou3NvL5S33YHCjAUz+zPmhui87jPiX0TqazQjgXC8xyaJvS3nh6FFnUXR5msqVM
	cmCn2/OC2W41P5c0+AoOEw8vJ7un5i8cS8c4T7M8czqLkriLIfudkduc6jRxpmmkHqvtKMNNbtu
	kdQA/lEkv0qJzCN5700w9NmJIeE8jlsOl0Sa4p/k/O7PtybHnIBZx3wCWNFpxzJ2v8f5ejjBiNa
	LPriRFw8TcGi7oqrUgSawOBTfKB4vpHJAlt+jnhsbNE/9yDKQgZlisYBW60NEH6xsl2aSNzWAII
	K3C0kI6Yds+EOastB6P0h7dxdXyScYfd7ho1ua9t5JiNnp4LHvwry3e3rI/2YC/6Rl+xU6aT8vq
	CHCwPBfCtSGcIOlD2Lp89OI0UohAS2gf4fksd1JliJmhZCVT2PMwm3vbiw5Soq/7GcvxLqeTZJN
	9YAYA9tshi/Rpzj5a8SEeExLMBPCjkiNFORy0j/r6hJRB0xEIzepiVa9loCP+vsEUqos1BSUrcA
	XEaWAM8XF3fVXd8ab5TD4TtGpe3JiW29kiHqXjoplAquAVWXKDUPIzSUFPMk74qxyZIW1cswUpY
	UaoDJpY49WMAUaJUw0odv6RGWXbtDYb3KAnZGIh0rwcoUBvoHanhslxLUX32wD78C1szzjnkRA=
	=
X-Received: by 2002:a17:902:ecc9:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2ea9c6c835cmr57333975ad.14.1793030021722;
        Mon, 26 Oct 2026 08:53:41 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b120095sm19328195ad.16.2026.10.26.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:53:41 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] Docs/admin-guide/mm/damon/stat: fix pronoun agreement
In-Reply-To: <20261026143109.150059-1-sj@kernel.org>
References: <203ef50d11ae600ab06546d73a2290f291381551.camel@mailbox.org>
 <20261026143109.150059-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:50:54 +1100
Message-ID: <179302985414.2.4645643321689632441.damon-docs-reply-02-stat@gmail.com>

Hi SJ and Manuel,

On Mon, 26 Oct 2026 07:31:07 -0700, SJ Park wrote:

> Thanks.  Unless Aveline objects or add this part to the next revision of
> this patch, I will add this  when I apply this patch to damon/next.

Using "to" reads better to me too. Please fold Manuel's change in when
applying :)

Thanks for the reviews,
Aveline Noir
