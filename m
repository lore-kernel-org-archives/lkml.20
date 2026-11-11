Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409110;
	b=I71GbYYK1fjd7Im2GlXSlvr6wQdS3hFjZcYf6d2Nc4E8cYvnfRBMW+weaxA/AHtqDTN9
	 cA8m0LDeTiToqxqeHt7TYded0IbbDRCXBf4oI6ePe7WEhs+WoaXgoxORiaNAp2UmCWsKP
	 82Z2HlsE/gOCjUTOsb2tWFE5B862IP5ZsnfiSHRdoB89GGx4qhp4U1I76z4RgPp4JA5wM
	 IWe3Crb/U/kLxbJoKr5IPwJ++3cCLZrGzRfJkBhf8+aOavqMqLJKPLYrrAMpLQfhPIEcx
	 I4cf+8al4LX7cCexTwEjj4ljpkToVggPWHiLeMjj5zEcozrO3vWE1i9q4wO37SBRhHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409110;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=byL/9IM6xgjdPi5Ss/cz8AdXkgWexIzqBw9kg9a3atE=;
	b=dw5NI/OnAlaP+Uw5g90dBiXsTeO+W1aOhxIaBeVos4HqfcqUhcqTB6Nny+IJjVQD3t4W
	 Ci6VSXpfAytubnkzvcXxa9Lrv7t2VsAEpF3iTRGK2XuPLAHPI9mWO9lznGCJVw6RGVVS9
	 YZQwFWG9CKnq3d395Xe7NuGgvz5b2rA7U4sQ05fEtXIOBxT+wtKZUBigaffa91Fsogiyl
	 mLFnDJbog6ED7Eb1jO+H4o8yjhuiWHMpS3J5d3RUT0TK6i/uU1PxBT5A2CNuxoNg9LFNa
	 4eaRMzcusJL4ZEfkwxjBqD03A7baSzEsGdZWl9I7FRRwK9lSbPpocHvNAT9TRJfwBiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HPqomAFP;
	arc=none smtp.remote-ip=91.218.175.218
Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE560A5BD1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DE560A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HPqomAFP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=byL/9IM6xgjdPi5Ss/cz8AdXkgWexIzqBw9kg9a3atE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794409107; v=1; x=1795013907;
 b=HPqomAFPcctzYduukKvJ3j1+9TA20KOjNwlx3h18TbOLMqJGIcCiwbP+Ncm/SYIBkt3ndAYp
 Mfk3BXdEn+X/A99DwK3x4iIje7gfNUK4MMjmF1vSZkeLrqj1G2C2Fh5vjzoqxy/R8Co9fjRNFdN
 D/qCQpB5taDaoof6WLfdf8jQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36196609946a065f;
	Wed, 11 Nov 2026 14:58:08 +0000
X-Mizu-Trace-ID: 36196609946a065f
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>,
 Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
Date: Wed, 11 Nov 2026 14:58:08 +0000
Message-ID: <179440908805.1963.3189482737225975976@linux.dev>
In-Reply-To:
 <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
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

Hi Coirul,

Sorry for the slow reply. Co-developed-by/Signed-off-by is fine with me
-- your call either way, I don't mind.

Cheers
Igor
