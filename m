Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974071;
	b=LNF+wlhNvuuREZMvvfV+eFcft2Z9AiRwnmXaDM5UHIkIKZn2tw1t6fDhIQZ3VZA0o4Fb
	 qk5OU2jBSAaA53nhS5LKqxyVUsFzXaTUzP6cmcqtdACX3HANnPaU0KISitWdHmGApsamg
	 uAZr5Z3+vlijZRC0C6knO9ZhagDGCNHdrDcl3bcOONporr1gmpJqwGuItpy8oJCaUz128
	 doF+oY3jEDSA55e4ZChAB8qzZPMrUn0HmL8Ik9u+lLxrtoVf3jZ35iL4gddK9ctd7WibA
	 eyTV/5pmXN1/39f/l+rUH9GIpMF/IeZ4Guql9JoMT+z1H1izDa2SCn019HTYOWDrHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
	b=aqxx8MofHhsTWAaKYdWkJ49Pvd5mybGn7ElHvVyREQ68vCLHkZu5V3IXGa5F0OYV2nia
	 hfy9d4NaP7Gouj9ZwYmNShhklktMoiRj1EwEX9Bgo5gvveAtVEiKcJtvjmVJnAyLcQwqD
	 9MIb8DwdgXMC06XsLxQg5f/GXte5DeGGIRiuNKJ08gwaKlWwJwgPDbJSacxNvvIPoZJZm
	 a/l8Cx3E81S7A5bIVXk1XDAnaRIE5qPmQvWL3M/lX485nBoDooMHDjfZRQQsubQgQXQ+M
	 NBLsqr+/ulDhooPpzFZLrLhuXDFTc/nJenyZ+YA/dtmK06tcesEDsKegaVehHqc53cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lewLJdSS;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F07606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lewLJdSS
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1465677a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974071; x=1793578871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
        b=lewLJdSSPjEPcv2HMEZBJkaENtQqv6hgCWl9ZeCBJhkMQbdq3AEyopJrdBPgiVhkMI
         iSS9VI99Pp5a9R8/9v+yHAwrDFxVhH1eDv51PboYzZT5D0JliUYuXWXdKqAqBlqE/IxJ
         6LPbDn5UbmPgQdPUzDwfgEl+q+FewgzwjypRp9zmJzzWW+i2+b4TamOKPWIXpqTQDZwH
         pO8bAS8ru47TViuC3fY2qZVTwTqyHtdzJFuiiN7oJUcdY1lUMVDJU9pNG9el+aqrbw1x
         7LBenTPDiHwnDZ1KbDUNAu/hzPPP2v146U7huSrULqS0OPt0aV5BwF0Vr9aVoVRHbT9n
         jpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974071; x=1793578871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
        b=tScCme7aZfiFUvn4X5zeH8lqbPH2OQzw+l9QjQI7zu8/U5hfsoEKKtynys+Ej1CPJ1
         vhzxqPge+UDYKXZbX4rK0yBDRt2zW7PHm98QcwvzJsll+QCsX0TfEuZFgFFyhea7cRLE
         hK7TEqvRQro6yqoIqM1wu6GvDMc2yMNaxCuRTb5ZDF1Y7G9vp90RTYia8vRfm743k01D
         my1w+fiOiedbmBus/OIRfZOzkBO21yrb2raaYgcV89thwYSwooVBglXBkSiyNMrW7zX7
         bq+M336XBf51H3eUigDmSBl0Tem3mhH/a733T1BjRNQgKViwCrfQAGrtvqoRnv5uus2D
         +P9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDLfcU+aPaXr0Bz87LU03bsVrzKwOnwwrMGXYbC2kcjG7MbP0Tqg6m3ALJEHSN83IDT2oSatFt2K6YkfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz0Zndre4Xpbobd+OSErSxBOhZv691j3/GtiizmXnciCacOxoo
	dt+L2bWEpSkHnnvYFOjZjXNisbOATbS8+PuXss5XG58Utyz3E+/aGZNuppDrSQ==
X-Gm-Gg: AYBFou0qEYST7iDcWInm43n7swdTVHaTz4zoAdC+RGw4wP7DLqRtMm1f0C8ErtwMWKJ
	tEVDCSl5gT9jT1+mFqlamjZ+IYhreY07veYOm1rqjKjS6nCAzP5WAXKPOKWesoIDG4oLE+4v1V8
	saykt6v/V5xD/Fph66x2rzX2KMS1Q0yLgf551c4R8e6StyGLGA2iBsz7OOaGMj6sH5uQiRnJ9tk
	QGcoD+lOZNNHIkf2+3aCcFYcX2j6yVM7LfJUeXXOXzzdqyWK0wQK/qK7nfqEATG1uzMmiHXBfTA
	KywiRLMq2jnHkKCEIPRK8UByrW2YSm0bMyk/mssHYGcsWxL0bgaQhDsZwm7pyuk1vLgzJWhw33c
	+t22MyhHOoiNx98YEla4T8aHJOKxbC1iypIbs1d2ooSkf6ymYgxl2M1m/2GqJiHe9WuTmwUrgF9
	IBmRj/WiWjDITN3/OpKLkpO09Vn1vA1InfID6oJJJLO6TNd5N91yE5GRYmrWek1GBKWgGsEIOAq
	ElQ+7BSa70J4vvAXlaiBZ7qZ84iBqspWcuzSj+tnr21xILrtz9aKY0q+0baM2iQ6e83U2w=
X-Received: by 2002:a17:90b:3bc7:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3adead5841amr4344724a91.18.1792974070632;
        Sun, 25 Oct 2026 17:21:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm6073592a91.5.2026.10.25.17.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:21:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Message-ID: <c7532675-6cec-4613-a3a7-4cda31bf16df@roeck-us.net>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-2-syhuang3@nuvoton.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918084042.19541-2-syhuang3@nuvoton.com>

On Fri, Sep 18, 2026 at 04:40:40PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.
> 
> The NCT7715 supports an ALERT output, so permit the optional
> interrupts property for this compatible.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
