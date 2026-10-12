Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B33F0AA0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813106; cv=none; b=M+ik0ybHPXXQTeUKXMqwGlTjBjraTX7K8aim9rxlB7Q/K/FhfQC0L2yH2mjggn728rE8rlx6vxRZGqMOjsQUgWPLBaQTNaM8Fcw0B2BynoBB1n2gFxPGVcm8GiX0qa7JfXiPsRycs0RrCKrvBv8eGEeGpQr8u1V/rQAADlneAVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813106; c=relaxed/simple;
	bh=JNLvSKsWbpNpU+kVfR1ZUgo0qtFkPeJnN9n/3eiEcSg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbIYg3oinnO6XMqTelbZ2nwv20TXZosh7Bjub+/EY3JI/jKsyNkIUWjWmS02iHECewKH35ki8nkrFW/5Ee7ekeGkYmDODvPydeazWmGoyComtdUifKTbugKVww8ycMXI1yLtTkbXlrKmZXpAbRSfxtk0oda+qV6X0vJlPjG6Ww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWW/dfsY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWW/dfsY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso15046245e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813103; x=1792417903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLOrbPkiMwYxELk182ZPfeiCmk/lFJpYO2IK6N8cvrs=;
        b=kWW/dfsYmSuWUUAmOtu9ANV87tPPKXFs3Wu2Zf4c9BjI1gxqJUEUYZR6eDFV2eSFzZ
         9IkrgEcM0UNHqTeDzb/fi3vsTrHLpX8HoUz5MUT/ec4oVQM/Hn7YR1hQKx2S4bXHnt8x
         HZxqhhXXxfOQHbq0nRBwIiB/iVLkCNWky+C4Nztk3wkwVLqubb1dIZgHm8VrsCgo0+l1
         +QBbPfQpacUPyQXJpH8kkT9EOWM6v+WRMqagJdpxEPH4lyd2x0hXl+3tEGACJyTaAZYQ
         ejnhHfdKYevn5S4de9Sl/q+i/lSmbVR2Iqwqep7Rwp95GrwKUTAE8N9A8EAhFoiIpmOl
         LFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813103; x=1792417903;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLOrbPkiMwYxELk182ZPfeiCmk/lFJpYO2IK6N8cvrs=;
        b=pbsuOzMGeFnbTpNBBlCSl9eb+C0ZdA7p2QfqD+UKS5dA7ZIeJ0snWkvJa8N2Ncb0hU
         InzKnujXfd+LjkbWoi7FN+wUPXXCavZECz+qv1hfM4M6jEiqdRfJjyqCjAQxjfOzUUJq
         i8TkfkvpQwmh6pRb4pdy3aE1K5Os2RwGwRgOQ29+2z0lF0PIhtPg7BK2pIr+vOtWsfBq
         ZjptqAQtOPoYehGoYktivDJtHJ/lPKf47VzaIh1unuwPFrCXUeGNp+t/VHwtvVNOW+8w
         hSu8FrQevdJ1wwOx+ZVJd/FC+y6inT/mfzgbDt4LsXTSelYrj2RDhZSX0KQb7HbipVw4
         FNHg==
X-Forwarded-Encrypted: i=1; AKwUvByKaR9w5sSBX75BbxSujBdCHPiKWMaHeogJ/3/A4tTUObB6VM36a0A3m5I/kecJYO79zETpwcr2K2tCSOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRfKmv6X5JF1sTS+H3d7j6DmEXxVVYhk0mRWrub3Db8ktDAm2O
	39QRgWKCddpMShI0DOVxd4sLNhA9GSGYlPqTWfSn2fEXNqwegLuSPTaf
X-Gm-Gg: AYBFou2NX1lkUEgKBGN3o6xRTtCuDeJG7/QoX/wKUp6p8CvojfJF+XPoVFM122jL8g5
	sQOB93J6f5OptIeTRDT+OBxqr9Co7ebxjdcVmH+zfp/4FroT59hOhNOvkRlIlqbhoU2bpVkZf7x
	QWy6utsYV9mqM0ugUaXU8Cu7cyw+5b1KUeMvLOL+9R3h0Curgia1IcfhB9lfFVtNPXPkblsxE93
	APpKj2ypos/fn+X9LaX4BybT5ikqlxD2MU8RMHF7H/CiBmrcDlscAHE0RFmmhDpt5Kaq75K6Fw+
	L3g43SSV/3bohHcxIBV3veiZGIaSwGZ/y4tHoUUjAQAAi4Jhi7Uwfw9opCE1GwZ4HtRO/wrDw9F
	ivwWb8ULvNN32PuwNbAnnm8YLMCzLJfCZnu9ADI0HhtfMU6e8H2R8gh3TnwsZiszO5ORp4HGdFd
	jtho9u7dgx6E2dIDK1XNusDlbtjgb0jNtaFU38jvX8kk1j7g4Mh2NVL6JGFKdcrqkglk0KQiOsP
	N3xwLQ3Y0p87/TttsT1ZUGh/iTsL3Nzb3vOeRBk65XUdvV0K1z4oZVs/N6AsKuaeuRC+a9UgGsm
	WyUwHaVyXI807ogAklzs5MW5eE7sI35LVGIHiwBAtYc80FZLIyrkbuh6hmBUYXWe0WeK3s2Rs+8
	B6PMA/4rx5pi8c7+QKvuf7E1AWwY8KmQUX5T2OU4TahTXlaBtZ/I4c+btqxRMTDNC4A5XSzjTPz
	w5edcNXroRdT6KsLU=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr179122395e9.26.1791813102687;
        Mon, 12 Oct 2026 06:51:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm19399336f8f.25.2026.10.12.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:51:42 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:51:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/4] iio: adc: ade9000: parameterise the reactive power
 channel
Message-ID: <20261012155138.0000726c@gmail.com>
In-Reply-To: <20261012111342.48040-2-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-2-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:37 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> The channel array is declared once by ADE9000_DECLARE_CHANNELS() and
> specialised per part through the altvoltage_rms argument, which lets parts
> without dip/swell hardware drop those events. Some parts in the family do
> not compute total reactive power at all and have no AVAR register, so they
> need to drop the reactive power channel as well.
> 
> Add a second argument that selects the reactive power entry and introduce
> the ADE9000_POWER_REACTIVE_ENTRY()/ADE9000_NO_POWER_REACTIVE_ENTRY() pair
> for it. The entry macros include their own trailing comma so that the
> variant for parts lacking the register can expand to nothing.
> 
> No functional change: the preprocessed ade9000_channels and
> ade9078_channels tables are unchanged.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
