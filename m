Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14612F6562
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789833994; cv=none; b=IQFyG6Db7i5MH+YlNCIr25BjIdPWxXmoKeF1I48AZ5n8gSWHKuqerrSZHBYpUcJVbMA1/Q4AQh2Yj2rqmenHTXMvvQ4oSldgv9Y+IJLc5AjvRlRZcvKhYnyO7aA7QWskiPoK6LNvtJ+kZeL4KP14fP6sdNX5d0k0uVS6SIBJei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789833994; c=relaxed/simple;
	bh=GeXOGFWauscqEhG35CZqgJSgNXE9x2SbkAjpIt02XBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxhNJc630QH+6GyqPNJO5uhQUObg+q5DHoCujmjwbNLbrhnK705LQyuORjuoMUZvMNpSgok+qALeZ7OBiLcJ9e5MPauQU3ItlBEbUzTvJgGV65yINoG+Zab7V/CWD4KXK7KEUTPpdErvvUvQW2U2qOB5D01sMKnaN2smWr0Jo6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cqq/GQbF; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cqq/GQbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1789833984; x=1790438784; i=wahrenst@gmx.net;
	bh=GeXOGFWauscqEhG35CZqgJSgNXE9x2SbkAjpIt02XBQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cqq/GQbFESQbMstG1xj4zzD1kzmZ4LKNg4XHJuFJbO4BHkdBYh8bePa3B6RvMT3f
	 SGR9FO/SP7KSIWxOYGqp5bcTkUoO0EjKBxf2zCRyu2MT/KNnyMxsno/5tWKHKiaqx
	 wJQHDUrHhpo+TloGiMCe/YBEgbEx01fs7LsALgFTbj5Vg12aFbryc3yrgjQ1Ix+oi
	 bTjsYvKvheH/R2MOBEc3Q9dudTx4EFuJ055HOcW2Tv3c5z4mEjr1WHeI9fQhTc9Uz
	 Q7EwcaOgdHCvTH4oLcnKpj4lytMp7VymIcuX3xV4fx48vpptFTSjgYQunJKs2+5zh
	 vgoMgtD42g1h/8feYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1wo6Nk3EAy-00ubSY; Sat, 19
 Sep 2026 18:06:24 +0200
Message-ID: <0ce29017-b6b3-4b64-9bd2-5ddcf800281c@gmx.net>
Date: Sat, 19 Sep 2026 18:06:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: raspberrypi: Clean up local formatting
To: Triet Hoang <triet.hoang.dev@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
 <20260919034840.28593-3-triet.hoang.dev@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JNo57xJrWLcc8JLEBjpST4eKanLKP3B+kN2REsv61BV9J0viQgr
 NuZdifEdfGGsK6Uoua8z0MfYeoD2V89IZMP0PSyybkEFqe6tjVL/VMxwDpiGEyR3vHHJ3x4
 8Y/mkvjYta6HSLVpMkO5C3dBlx5Z2awlAbY/ckrP3/KT+cmBXMKnFbeW3nJNOfsXlOofwbT
 o5Z3Ks51mhPkxbbM0V1Kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9rE4X4HF1fo=;bSwt/jbNzns57JNLLRzlo70EHfP
 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
 E=

Am 19.09.26 um 05:48 schrieb Triet Hoang:
> Add a blank line after the local variable declaration in
> response_callback() and fix the indentation of the UINT_MAX return in
> rpi_firmware_clk_get_max_rate().
>
> No functional change intended.
>
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
