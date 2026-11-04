Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783660;
	b=UgqiiavB4s1YdP73AmA70e32GFyMtN5d3YumFBG748ldLRAa2VTVFLP4fMWUMMgjVayB
	 UVaTkD0ifp6GdG2t7Q4HLpJYtZ5RMXsQGJSaSDNT/HJyuPcJg4ysW1jj0oH08fOxO5jwC
	 kWXS5x+pNTZ3/gcYwUo5BIQGYOnHMD8/nnuPDuy9JcVF1MIc8mImtEbaT+CTjeuA2ISPI
	 PG+gaKHWZMD6pgvi7y+F4bVOspLes9t1KJd0G60EdfNuT1uYWFrPenlWmB5D/xY/iw1oL
	 r/mxt+MC4Z1rGmWzvESIoe+fOxWbGmlAOKDuQqq/wivt3wNEysE9Kxb1H0UvNdsGFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fUFqV6LYPfFbvIJN3vCkCa0VcPqluohoUOdtjNFtJFU=;
	b=xjqVHy6nVl4lZNS89rTbgKRvu/c7OVYX85log2Dabckx9Zf8K8YE2ERVNijvw0d2ZycX
	 KOcag7rbW6b9+p170kkpY2NLHTJ7rqb8QCBqjapUIiAQIJjweVTsqqtqs06v7qbB7YOWh
	 sgTAqGECiWN0zP6GjVXOqFWmzsNabs4W9GNrSEoNhzrkY9gNUlzlKXTsC2Ltu9JbtwH7v
	 NuzMDsC164XpsRDGwXSG9VDuprQHx/ZTVJGJLQ/DCYhZPUnGNLZfGeQYhhSSyhuz5LtwT
	 /GmyWpQwTlYB0XFEUuFbIgoLXy7nzKnE4gq/1fWeIV8sHTMYE3VPl8K5vaWZD4vAUtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2Bstzp6;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E647606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E647606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2Bstzp6
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so3635171fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783659; x=1794388459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUFqV6LYPfFbvIJN3vCkCa0VcPqluohoUOdtjNFtJFU=;
        b=C2Bstzp6u6hLZsPCrlYakCTaaHkbhXuN/8cDmKJej09VOuEqBeIm1xUFqH4gNaAgzv
         Jo1RPQc66hhXCbJTA2DyITYIDKmQeXF9/AIS970s4TlAP7EE8ZP2kAM5QwVJOkJKFllm
         D5YhDda5xCiJB9KHI8fh3UAngwBWLMuGNZe9demt7gNsK5UV2l2KMM+9wWFD4IktDTfH
         TSLxlw9J9qpOZT4y9p7uMbn1rTt5Jbdft04CWr0U2Rt0OOODK8gtU8FQqj5mup0uk7qw
         ws98yncChm5Ajj5E3RNuIz3HqoinZpiKSnzkzrcntpkGC0iQiLliTzNPUARcPZTLT0dy
         w1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783659; x=1794388459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUFqV6LYPfFbvIJN3vCkCa0VcPqluohoUOdtjNFtJFU=;
        b=DEcNgsinPLpOsapB/e0JqDNjxCj9Yrsp0cQijP5Lx9SbHFeeqwCL2kASFjEEkbZzwB
         0WkGngwIHBaEnfq+nujHq6FUGbIkb/zPlvkbiAOilSbIWzFJaq5f9YM98VKI49z+scKn
         lTlDedX/siYcsKb9YUWDr/ZCkxmDMhNcAtK5S1YgLybFKeozGjOfaZmVZdH+ezJzWy8N
         omZhKPGc1DqPk1sS79YClOzigUqN64+4ON13PnjbpxxVmq+wDnKlfis5YyQckKjCHBw/
         Ca7Divhh1IOec9rcuk1mgeTICBHOZSU5eQvMYm3Jd6iuBTG3+jBpaVK/QC20ncqdZT4F
         fbdQ==
X-Forwarded-Encrypted: i=1; AKwUvByYuS4q/SSPjCgVhej1AEKnNS0CRZG9bBYbrRCTFi9zeajzzrwfrlgqfyS6SjtO1fuDmwED/HMzNXkjxDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z87bPf97jqRsXWccvEOZrTsW5fjE9HhmPhkkzBnXZ6lRHaRMu1V
	j21pmM38RyN8tk4DPcIaB1awlM4u47aIIcc0Gx1Pu6VcGd3a22PNVm7ONv7ICnTw
X-Gm-Gg: AYBFou39eBjtorTLXsZsaWVbuPYvhMWOLFDggdWG2klnRfmq8GwZ5wHTP9lykTz5FSm
	WLN0ZinvIcmstSOB85bgGVat5xXRn5GhI7WVYYnkbbRSxaKcftvEGZLPBDrpDijs4E/FCRb1FXq
	dB/usoYF+BCgosRDqGeX8E9ZumEJ7PyPXCc+GzGjvbil0DpY+h4Dr18bWlaMc3yWpzG439iVgYw
	fmi1Yb+XaUT1/TMS9Hd0lrXLmCJIBZh5JqqHF5y+SU2DcuanMezk/6VQSCHzvSw9cK2RryEuLA5
	GdYPuxx5BADQQdusx5RzrMM9GiwIMb+Zzvdta+wzuVuC8acf9C8RUtQ0uDh8mAeTdbet1dnyev8
	C0dga6an+LxcN4OzvF6nbTkApjmNMyXwklhEbj0FMcUa9wzfziHWF6I+QcC3Mu7v7rfw2nSdQ9o
	ZLLjAc4Br8Yrp3606CLtYgcIrfGrz5du+wnalVjOkXAX5y71fJrrXpDP7Ut+IlLyyruwtSXhSwt
	sKICkarzHQMLBVMDKb84YIPTGXFgFtivqzxQlKCZQYWBRLPW4rzH0wf3eHk61BZt+EetKyNz6qR
	rOSGfDlYOaqTwcYRza6IDmqVkSPOC2xUBV1iiezCTWmnjloin6Sntq9/pNfvSHWs7ggwMWUucCk
	GOoOWc1oE8lTnrdl6/px3lv4JX2Bjh3kdXsDIlvoektgs2/4oZeziyXNItQ==
X-Received: by 2002:a2e:a991:0:b0:3ac:48a0:e253 with SMTP id 38308e7fff4ca-3acb7b46ed2mr37352601fa.23.1793783658695;
        Wed, 04 Nov 2026 01:14:18 -0800 (PST)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm3253031fa.7.2026.11.04.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:14:18 -0800 (PST)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: pressure: dps310: put the chip in standby on remove
Date: Wed,  4 Nov 2026 11:14:15 +0200
Message-ID: <20261104091415.710751-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102072755.17043-1-zoone.rupert@gmail.com>
References: <20261102072755.17043-1-zoone.rupert@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026, Rupesh Majhi wrote:
> Remove resets the chip, though all it needs is to stop background
> measurement. Write 0 to MEAS_CTRL instead.

On a ZTS8032, unbind leaves MEAS_CTRL at 0 with the configuration
intact, and 20 unbind/bind cycles read fine.

Tested-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Paulius
