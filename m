Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577F5357D0B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805287; cv=none; b=allzQOFiL+7VqX1y1KyeC6RlblSDI8Nmsje1QQRfGK4anq6RzRotPJNOf6K7wRB9RIBuYQVeZHAM7phLAlWx1sDrPn3HYjGC7RJVsCNYkwHxOVc/ILC6HJJDN5Axx2W3gcPpLuN6dQTBnmducvXq777B463pQj30J83sO6FSSFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805287; c=relaxed/simple;
	bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=ByYP1PHMnebPZ0uLAtPubaChcwV8TReFjcdB2xPEdrdSETsC70jnuYSyHyDCfiNxaroVAQVsMj1s+TiAKZnqVAFlGeB0I+7bsHja7jPu8UWKZ7g8LMlvcHZuHf9EFSglKPLqT9ptkT755rpYz4PGkCZ/vWPF64ppiQItsJnzAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeISQ3hY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeISQ3hY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so14444015e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805284; x=1790410084; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
        b=UeISQ3hYRl2Z2zCPvz8ahkuCchctyJDR5bqJZQbmfX/tpMP077Q1TYnz7UIEqCJbnG
         u6Xf9ibNBB8KE4pVbXM5Gpr6hFXYQVVeFhkLKFXTiR7l6zJX2DFBsln5UW+BtlYDyRhy
         xfT0kfJfyQHL+VfTMz7fYFQMiZbEFhRAf2mkCI/Yi9kLhOAeNr4D6AC8+zjB//RX1Vmk
         EiDcP/8hJhswas5KDTEyujl+GwrO6vd3PYarlwjzT47GCxLyFnXKZ7B89niqzl4D9yH5
         LzIxpdrXnvmqp/l3F/PkIwc5GG7Zi8wzbvwtoVFzmfVW1j0xKKqdWQgbHRffnsiPKzxD
         7+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805284; x=1790410084;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
        b=uuBW6xJdlh6nu+i0GfaaJlFXY/Pecq8RrVMwj2MQwqcXao3NLhErseUWIm5FiYRzWF
         4rapqe+Zc0NO4u1TQwX/C4DLoFlo8/4G4gi7ht4Bf+6RXa+KFuauMFHMAX00u8kPFIt4
         BLFPkMT5ZigGBASR2vDKnA17HqTKVS1kT9pPMsp1zgJdZVIez6eH029aZMtuPoLG2sTA
         cK+qVhsC3JDnwh6VEm8A9iF22qtk4UYiU1mg387eafVazti/1obGSteRm2ToZ69ey/NH
         0iMvPYtc6fVti7o8uCxo/pqANc5yJpwWUrWq1EbGr2EtFCDnHcCtc7VfZCbSkNndzMwL
         x8/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJwtF8SX+LPIqV6OjuJWhtVvkk62C5NOBpRWeAadYtdITXyM4+pF9r+Rvo8dD5y7fiAc9QXWaWObis2QQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kqrNm1U+zbvRIlpFvSzcJu/LXnDmejq+wfnrGNGTGo12MrF2eA
	TwNd4CIA//QoE4Y8XJZ93LOr3sNGT86zupQ1NwJ/q07HvOmRnJGDV4pm
X-Gm-Gg: AYBFou1IwzWPJysBk0n+zGoUeL/SUV9OGlD92OvuQNr+5vp49DWYWEHk8kDOF8Q0DCh
	4fKri9pVk5d87U3XGoIR3jvinT7rF8PRpQx5UJ6N8LlDUVQmzczBeqfSokFuZi4aIcsGhJgb+ee
	JRksTeJupBZfIh/wlGeRwKZgJDYvVSv9W5Z1mq9JRgwvrW/1nEqNU7IKikYRqQhHm1bmPg1+UJN
	BW1N/2wVlVTjOloF3ZTT2mNA27xt0zEsxdFs42jKNvhlioUn2W7SJieLlmlY7RK+BmEiMDRiyl8
	ZKufPJbqo6fKaRrYIMZNQ35tFUojiec8TSXrMSsN4W8I9RDSRAsOmJUH5Krv4aSMWatu4Gmd4dd
	1Q8aixhHkNIWFVBo//KkD5fedxsnVxPx0NsxKtwT2UF6CeTDPK0fsfNpNizRXdR8oes7nAs50vF
	o8fHmRSJcI9rFNewT2H+KVmJO8wO4tFvYs2uXs2jfbVYF5BmJam6H3C/UvZzpAdIbll9s14b0kY
	2lix9mE5hCCAYBmQ8HIBFzfev8wqw==
X-Received: by 2002:a05:600c:3e06:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49fc56daf07mr69617635e9.14.1789805284421;
        Sat, 19 Sep 2026 01:08:04 -0700 (PDT)
Received: from localhost ([176.220.97.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229e0sm4504980f8f.4.2026.09.19.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 01:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 11:07:37 +0300
Message-Id: <DLJ50GBWD392.55LXSSAFNR9X@gmail.com>
From: "Omer PALA" <palaomer100@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Omer PALA"
 <palaomer100@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "open
 list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
X-Mailer: aerc 0.21.0
References: <20260918194434.9240-1-palaomer100@gmail.com>
 <20260918203257.6034-1-palaomer100@gmail.com>
 <b787a787-5011-4f14-9332-4cca098b374d@kernel.org>
In-Reply-To: <b787a787-5011-4f14-9332-4cca098b374d@kernel.org>

Hi Krzysztof,

I assure you this binding patch was written manually by me.

That was my third DT Schema i have ever written.

I used ai to understand the structure of dt schemas and i wrote this
myself.

My intention was to add the Devicetree binding for xlnx,xadc devices.
I apologize if the YAML schema structure or formatting violates current
dtschema conventions.

Please go ahead and drop this patch for now.

Best regards,
Omer PALA
