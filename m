Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512742;
	b=trHaU5DFf6LwkxlpalpYLq7/NJ2EjOcJD865B744s+fW8Z8vKAbANn8wVYkNyIR2UAnz
	 /xmCObuvnrNGVbItu5iN8FwI5oe+WThxOxgpQ6E5y9DIS4G4Lekizaj/d6K/Wzc4LMWTJ
	 FgvFrcatxpSLpmidnLrX7ltPCZvwDx5E0K7aAvudymdGG7MnfmFXEBJzGxddOtsCKRsbv
	 wEMEAvDXB3Tw1AZbrLP2m6FzKbBrFVTOcQxA88HABFVBQWvFNh2VaYx5yqyBaYXrwbM9M
	 3x1a7HriHbFFQnHg5TlKrylAlee61RO0lmcQcN7YOz+UL+QL+eYxKnMIvNN5csU/zSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Message-ID:Subject:In-Reply-To:References:MIME-Version:
	 Date:Content-Type:Content-Transfer-Encoding;
	bh=Ud9ISIbyr7bf+XRYkVCQzyTUHoKhr948RmgOVkz5o0U=;
	b=d1FxPfQRRE/PwupJHOedzoyzfp8EunzqlqhrZ8Y3efhdhcnGfPmB+d1/1VtzWQJ9uZMr
	 6vUqI8STfU+jL5uyED8YEHSTlT0h/R4YRrBLKd18gum+okYKKhAezT47aQDWXX5o2p23k
	 JtMVvUPMvIYrYrEcSTT07/07oolFU78S4qMOIN40/QISXNVwY2bES/dJ4iGP2uuAzU1EI
	 wAX7Yw0onspgz1Cb0iozfCIDItPmfyW3oVDV+jXSTV2gHuplr7PZA2QSVfRHKZ4HDPLjI
	 TteodhltC7wRQqU6BPQARpS7XbddXdD0YBB4meoZ6R4yni/CoE443wLePKDJ0RK6Bww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2vFNLob;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC3606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AC3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2vFNLob
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so2118694a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512742; x=1793117542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ud9ISIbyr7bf+XRYkVCQzyTUHoKhr948RmgOVkz5o0U=;
        b=E2vFNLobuM1uNFvi1K7QF/KCmFea5TMrpE2B2KZBBxHolXTITqmS3z5yvesZqTuNb9
         AYsjwlMx4eED0vTtfK/6Vi6+8tfoRp27ziIkbRZWVh8tuIMOPkQ+jUYMb1JcyZaW3iAo
         tEKHWPNb/CMYIPi4ohgJ/5jACzo/JWKDoC5cvDRP+fuhT6WXB9ofZnRD905ZDNtZBlGX
         M3yQbDwbPZjvQBvsrfjkaCnRm3u2KgyOTMn4bxWKln9Fbo4KHu/ossuA03D6Jp/W3M04
         9B7V/zCuJsFvySIu/NMWoNMqNBnDKmEBM2EoC6moy5zyAWoctaP43qMCN0KGRIigcagL
         Xriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512742; x=1793117542;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ud9ISIbyr7bf+XRYkVCQzyTUHoKhr948RmgOVkz5o0U=;
        b=G8XvcKOXRbCcq45B2pDWB55TguVIFjC6UsJZAeu8JTr3G4Gz19YtNX0EuoSuJZ/qEz
         f+W9FRiq4FIC4D1p7s6CQ4O5hmuqHH+WSbuRQtWUttzDG5JsxsQeqjDGo9I7vPjj0OjN
         Rbf8S3wH9yHdMjAFyY9i5uLMOmUrfXLSuLcfyF7Hl88OgF+urnhsYUaXApa4tAWzMj57
         EFxnyiNJ0EqT5pdUHmkT47b8qGTcgenPLVGy0edvvx7UAWzktyju7bf9/6VMGlX9Oz6h
         bDwD2Mj4598djPxHGtf523gALiVeBHP91Ly7u0IyTb6Wuth7BAqjUrFtMmA2JmIBXqHz
         Yqtg==
X-Forwarded-Encrypted: i=1; AKwUvBwrXt3kHprUEztOVC04QFczumDDt26HVeHPYZ7YHeAtSwJvPxCobNedmLwjd36fLJR11PHQKyYuQp0AyYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5K5GLK4JWMvL4CfO7BH1ZwNaSR3q7dIeVt2RboKSGwmee5yxf
	9tfBG1zbXgi1MXaLaG7bONIw2DJTofRwLhgsbmS+zVQyTQTM2AXbQ7nE
X-Gm-Gg: AYBFou2fSI12iINvwqI4r36G0LYzk19kzTcHvgNHZkZh5yiQzdRgErfCCmQ9GhCi8sg
	isRSMDGL4Q+lUGuKqdlLEuqZfDM0KW6IV0uobs8rjrTBXpcRFyneLSFuGBEK4elaZ8CKyQNkF9d
	1x2+k7/Iq2xBXdlJVUbqEtgCVdKwqUcZqvOlGMweOKpUdDSbduM7MNhb5M+4XFaJco3hYgOvfj8
	x0IxOsiBjPfaQ9ZK6V5menir3iZzPs1ZaEtQ0Hl7u973sGpSprayGFNMAaXttg6E9d079Tx5PLd
	ECdMk/1mUJi/3Jyld5NlJ58TUl2DgYV1maUKRRfWFhJq9gYzOA3CwNwzDDCdTvCpSdK2XQagP4u
	3q7tqokADVgEf1A593rmmW2FP2TkpOObtsEp+VgQbF/c2AGmaTuMxayfQBIh2RXuVi2UtPXW5xa
	irPFL5TUfQhSuG4l9akkH6ObDPyKhcvrRo39RSWDSmAuyqUv5yInBX1a9nUsDdbWQ60p0zMpWZ8
	p4rZXKwSzA5/460vH6X/bUbMOfIALq2XetIxqbFp1XRJe+6fVRKOoU1urL04MfYCGWO8qWaKoxW
	vdJ6BCY=
X-Received: by 2002:a17:90b:51c2:b0:3a4:f75d:d1a3 with SMTP id 98e67ed59e1d1-3acef0c891cmr10365935a91.32.1792512741637;
        Tue, 20 Oct 2026 09:12:21 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80219f83sm240190a91.6.2026.10.20.09.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:12:21 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: stable@vger.kernel.org, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Message-ID: <179251038772.2.11838017412675823324.damon-filter@gmail.com>
Subject: Re: [PATCH] mm/damon/core: filter out damos address filter-split
 failed region
In-Reply-To: <20261020004119.106690-1-sj@kernel.org>
References: <20261020004119.106690-1-sj@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 00:07:00 +0800
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi SJ,

> Filter out the entire region if the split is failed.

The Patch looks good to me. I injected -ENOMEM at both address-boundary
splits on x86-64 KVM and checked that no action was applied.
Normal-split and filter-order controls also passed.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
