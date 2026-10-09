Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93993C9EF4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573673; cv=none; b=rRZsEKIfgzRQVWx2kSx6yX1sun2lMjzvUZmFy2jD9S0BC8M43eTBlZQXfsT1pnNLg8yhnsiB5OQubnvLD01dLqpcMhwTs1AEY3L7+uBvko1iNOSjVVmzQYmu0LxEJ+QuGX2CK+kp5jcgOTe0RaCeCyWlaiY71oOP7Q7zzyd+hXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573673; c=relaxed/simple;
	bh=pt001C7GwXdEVKuhJBNUa5ELL1zDMQk7LmupQShhx8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=To3aBh5G9z3tLHmwRge1BNTbVfr3I68oE5i4QoRwI5z1ZQu0XNQUYYVLEcW0BEGMhsThBufYeusEDTuxfjUFRl6OQuWiHaQwY116RTzj2mkQnFA7ZV+ESVSWMoVLRDKD5RXvaVWT9mHzu1vEMTOdWHn+wTWtHo5KvjVxaDSZ1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKYkZDbD; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKYkZDbD"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so81847c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791573672; x=1792178472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0w3GNrItGe7XgQOkJNNvKXXvOgQQ+N6uqmysN9MckE=;
        b=SKYkZDbD3WkxEbHuhcZeB/UKtQlwzsz48ql5/HdSORpSCmsb8VOYQOrB3TObTqcR9U
         LvfyV8tfEgWKC7heF15ET20CCvgRmgdWgvqtjouYr4o0fmf/rR52aVFWuqUNBxTd2LGj
         qzJGq8FwtWsOTiCaGGad9hDI9h6NwcLVCkG3DPLB52QTOIVw/KqE+nD0In9pp01MHerz
         HwEhP0ayApy/eV5rD2vPlJOi9Uf4jqBEWCiXsyKQ0KrEtL4I2lLbLxtfeKxxybPEvev5
         /UaM76HHn5IURgshMFwzH8mXliAxeZaKjChO1lzRiuQI3LaZXd+CT3qpGWyyFWRuh7RX
         gFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573672; x=1792178472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0w3GNrItGe7XgQOkJNNvKXXvOgQQ+N6uqmysN9MckE=;
        b=I9dtFZhTgapCuEQb2wCULCnTZcPL/nULiXDGelj1wTTITO35XxpDOyyVCE6M1QBhpG
         55vtLyBgoQaKpRkRSJrjdiht1iBw9km+96zNLqLU540hjwxXpGK7+hQfif+7g7YfaZiy
         IfNNhpuh+myIhdNndQVFeXwtSx6sAwl7K0+iVFK4OCHPRLXpCLAz5aq1cOQr18IrgJSW
         +MlCfk1UK2YlzkwfbJF7rZ8KiAuqzp19jafRq79/kxRQS97uPHUOJp8igQjqxEVN0gEB
         BVMcPuzjFDIdEj5oxBGtnffv8IESLJQHatthaI98+6TZQR9p+MmNmWiVfWHvPV6sNFgp
         gVlA==
X-Forwarded-Encrypted: i=1; AKwUvBwxQsX3U8JWxOOuzQIVScOTXRNIF6rWFSm/xFp90+AC8zmdU6ilpOe9wu7sGbebc/ffmaQm7bHzW+M7r64=@vger.kernel.org
X-Gm-Message-State: AFuF++njfIoJmlGBbnPD+7j9Wr1NHAI794fNPjJywk94GrOO1L+U1Luh
	x4UbUaofAigB9Y0jWi/qS8UHoQcUnoFZGoD+fazUOk5DZuwFk64oe1X9
X-Gm-Gg: AYBFou25dVGSKhsgewLbE9i52zk0yf2ZwAJyc6p9n1AHd1MkgApEAKo+NDonOqSs/hp
	3RvYvGLyCytdMC5YxN8xbb0+PGRTqULR5E56mpBbLJkgQQPEaGOE2t0VJv4UPZsrElTzbPVeirV
	JjyCDLJ/kctQbAE5scxZaDcw4hBj5y/CNpnct2L9+nTdtC+KlGIvaAulDerXfGYalWaTLcP6/dN
	QjYWuIE0udfyfXOlYqDS/MFZXZ6ceKSKzIe+1WECBtWeRb81D6+jUPj4SA0duWB4jH/NZ4y5kvZ
	Td1zxthPr6h9uD/z82U6fPHBAYbM2owCBkF0/+ixKNqdlu+Pjw+XiDi/XjTbybHuUjzYnG8Bgik
	CEjV9dPpFbjHjB/94/P/8yQmOgJYZX0NdiaeeNRuSb+bSK9PUH0qEssaDHkM8amQC2mN4aynCU/
	losJpFQi4P27d3A3SHvFBQ8SfmIWRKQAv8N+WILeH+VudoV/Z13ZPwnIjqXB78RuA75czKd+gFR
	FB55w1qv1uWjCKPl2fIjNf6mMVZ1Sd8T1cWeR0=
X-Received: by 2002:a05:7022:2211:b0:14a:51c8:e9f2 with SMTP id a92af1059eb24-16a62228e97mr5220116c88.31.1791573671494;
        Fri, 09 Oct 2026 12:21:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8725:99de:769c:1fe])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1699718c547sm7729826c88.3.2026.10.09.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:21:09 -0700 (PDT)
Date: Fri, 9 Oct 2026 12:21:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bihaan Sen <stevewholikesthings@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: xpad - add support for 8BitDo Pro 2 Wired
 Controller for Xbox
Message-ID: <ask-nwoay3_3AiSq@google.com>
References: <20260925092439.79904-1-stevewholikesthings@gmail.com>
 <20260925114459.110253-1-stevewholikesthings@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925114459.110253-1-stevewholikesthings@gmail.com>

On Fri, Sep 25, 2026 at 05:14:38PM +0530, Bihaan Sen wrote:
> The 8BitDo Pro 2 Wired Controller for Xbox is already matched by the
> vendor-wide XPAD_XBOXONE_VENDOR(0x2dc8) entry, but a later hardware
> revision reports product ID 0x201e, which has no entry in the
> xpad_device table. The device therefore binds and functions but is
> exposed to userspace as "Generic X-Box pad".
> 
> Add the VID/PID pair so the controller is named correctly, and set
> MAP_SHARE_BUTTON to expose the share button as KEY_RECORD.
> 
> Signed-off-by: Bihaan Sen <stevewholikesthings@gmail.com>

Applied, thank you.

-- 
Dmitry
