Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792244;
	b=uH7dQOjcKfASYpSaa7O3246RCTEkrF9eQZyguXQtzDKQR8UM4LI7A7+zdgJcIQd5rLEk
	 qw3nNdAhnhZKFUuhvYuOPjilkjHgsA9cELviAEPx8vYb0ELWZOc4EW12dMQ85zyJsrK9p
	 Vy1Q4Ia8vn3Fv9Mpfz/fOsZfr5V/IaUqO1IzyCbhfw2uWq2j8bbxPx7vjG4pOehEerl8D
	 EiE3NbhL6whIilCC89Ox8Qwygt8PVM6vGRe6doWHC4TTlP5t0ESubLyULOPlWMzvwv1Gk
	 1w4hPmvlgfSKMRA8gywBSFIkxOZl6vTUDU1y3g2iYCoZC6/B0aTz0OjDMSzUKbr9jzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792244;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
	b=NyOxHYZuZVNYRQxJMe6k5+hF61xqq28j90QJxHiMOTAdWycLNe5LqlkrnrSBOC7YQPSR
	 VKuzMAwCtatd3LaiQLsQEC0zXEXgs2Fa3inPcZQKQgvrojp/Voq75eaTAdBy/5Wk1MXLH
	 A+YnNOy8awlHlSWpgbAhsQDvBgvftwmHIv8nsjQJUlDU+ovGI6X8fQBvWVm6hVlCzkJ2x
	 bFYgKtPkllFwITIXOyXmS4FliaY0kXeKxf1gP+HYwcEVRh9rSLpT0G3rPFqkjZIzJbKzS
	 0I8vi97plzeawr7AWPRcvSbLYvveW7unAlFXDl8dZYhHq5EF3yVwdUhMK71vFLnBEug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaBmgHR4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e+BJ19sX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97E606D81C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C97E606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaBmgHR4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e+BJ19sX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793792243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
	b=gaBmgHR4BR5KhzzjedYykjxmp5nDN7co/1bCU/XsQdNXpGylT5z6TuJdOJovX9JFETJ2hA
	7srHc3RDZnBORBpQSg8XIzy8aJqZW63WmXXxJifinADfNHVLH94TrCVBLltR5VfRi7U5fW
	2+PvGYQGc2LRBen0zkH+NWF9s30KFQ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402--SqZrAWvNS2ihQAggDbWNA-1; Wed, 04 Nov 2026 06:37:22 -0500
X-MC-Unique: -SqZrAWvNS2ihQAggDbWNA-1
X-Mimecast-MFC-AGG-ID: -SqZrAWvNS2ihQAggDbWNA_1793792241
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b02d63407so566791f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793792241; x=1794397041; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
        b=e+BJ19sXHDIDQjJBttZD1l6dXkUHVjAVK2T0XmUuCboYncRhk6ePDwuI1Le2S0r+h1
         HH39dH9YuLl5WU9+YAx9kglkF4CcWHnLqnLCiprDMCtj6eMDzQSqy84qcszXflg8X8yO
         rol2ivdA+/hk2CTosF3o3SBTyXOBqmSpd2nHSwNM6wOGnG3JBcjss+XD234R1GLsD9uO
         dwMq9QtK4oaFuC+EB2OFdi9WKTZ8fRiJSbOcocfT2qkv50Y+IgKwNOqyT4lQ/IzX+xhJ
         hVd1AwCvfDdWqdd8aRmGRlzZp9WrHvtKZung5IFO7kxhex2j6A4urhYsuLMxo321t/Jz
         42Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792241; x=1794397041;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
        b=WN3M25hj4pgN2LFP1qxig0U9qz6j1CMXbMo6la08MKXVPj5XaReC8zguzMO6IayNAN
         7kdDPwtUn8Maq3rUkk0Bgy6KnOkgFMAF8sx1J61bApIri4YTjwfpKX3HtXAc8AaBuueW
         PAEg6p0OWUYq1T7YNsW8SfYhjTlilkgXZqAkdEnVFXMBoiUbcClEi8RnjmNkaZPn6sx0
         sHAJun1pxs82AXU8OsT+WGXEjLm/YZ1n44rEVjioGS0iiBggKL7jfKXi7t30+IRXqN+u
         KgKi7cmq9juQFsSn496AGVPm+l/kpDM2z6xzZ75uwCDuOI9vPG2JWkAIf2FoRDfO1QFQ
         Z2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNABMGe6lIhiAlNiUWuqnVwFFtRiduJkAsuyx2epkd3GM0rsgDK9dDV919QXurm/1pZD9y/pRAYIy5m3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z90D1kMJPXSkGoqBRE2VeBmwM04T1x8ojH8b+4UUK6yNAhvFdVn
	f/ITNJZZaCj3qrBLUWSIOf2NTJs7l2kn6hM1IB0bvzZjZ+lTia6at4tVR/7ER32N9ie44Tg5eXr
	XsQYr3dULXAhZyHkFIaX12LPn3wJU+Bfosu5UmLYBRNMTOcJR29yBAx9hlll8Fir1fA==
X-Gm-Gg: AYBFou0bTyHCGlp4AEdjUa1LLviJitmcu8CKj+TfF4h+c9g4qNvcZBHRVGqKrFuxjqf
	gshuUA+Uixcm4mLu4zw8XeRKKLEosBYPlxG5RrFStiVHweXxJwW2EuF1gNCfT8qmqDWoazKzlCq
	9/cGffToAlIv8VhxCUkBKxl3U8xXV/EQcmiCwn2U4AUXflEaHznoXqM7yLwMUvuC88HlUYw6nta
	kh7hHOwBA3ZFCY+qruubdzUWEQX7KJKb/Z+RPb+4wYrJbwK1OCr4Np1GQ6TNGE38FJ6GFv/KdRU
	ViKrYQ+JaqiDoSsljrXgL2CP+1WKYAya0Tfk3jqEY6W5Oi3al2l9Dkdk7CAjmse9kfa3Q8nd4lW
	fl5gNrgjQX2y7tBUKE4Hg2gSr30VQjB+KIMuQQ1qavTMKLalN+yti0/JWIMe+/yziuhiRRrE1v1
	6LrJ0hvx1K4J4by1jf2BmpB9D1wR7bdTJrMuZh2A==
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr31750642f8f.48.1793792240842;
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr31750621f8f.48.1793792240514;
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de. [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm3430641f8f.24.2026.11.04.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
Date: Wed, 4 Nov 2026 12:37:19 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Mark Brown <broonie@kernel.org>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
    Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v9 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
In-Reply-To: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
Message-ID: <7db30970-dc9c-702a-2f1a-f52c2e253494@redhat.com>
References: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Tue, 3 Nov 2026, Mark Brown wrote:
> While debugging issues related to aarch64 only systems I ran into
> speedbumps due to the lack of detail in the results reported when the
> guest register read and reset value preservation tests were run, they
> generated an immediately fatal assert without indicating which register
> was being tested. Update these tests to non-fatally report a standard
> kselftest result per register, making it much easier to see what the
> problem being reported is.
>
> A similar issue exists with the validation of the individual bitfields
> in registers due to the use of immediately fatal asserts. Update those
> asserts to be standard kselftest reports.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

For the series:
Reviewed-by: Sebastian Ott <sebott@redhat.com>

