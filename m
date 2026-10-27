Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113761;
	b=3oeGMewGpVhTddkw/JxVkwOFw4wYlsxRnI+8wZByW9Uti+cMqNtCzIlnAVelCsgWo7kY
	 qe83WCSySXhC1wgIQH7yORABfS4ho0jQFMyY5JHPB8MXUjITJAU24IIALHis0GaqN/Dfx
	 rCyKDqEkydy80DjZMMG0Oyp/bXEC6nAcb7ndTm/jQ7D2KjWmAdjf0KFLr6tdxcsj4hNPV
	 98sncloqXLpIpL7FxdGyWbNbYDhXSgmbRZ1JUHZKjPs8NIxaroWUd3G3TjJX5VhWiv64X
	 LQxcOHxghLeHYHfK+GhTMcmzFFDgXyWT7C+d8obGZCXpHFzEJPqB0QLgU/PeNFufJTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
	b=X2UGgueCxPty4LNU1+t3WqyWOrn0RAlJim3cKu90nXPSfeez/Dq/7orOU2EQr1Amg6Jh
	 5bNzO6yrddkzx3rdmuNZhViRhSAzuAIyzhDOXgzaXTESZYiy8ef2nF8dMa6bBglLKa+m+
	 25NU1BUGvSjaOU4eBvLWbQOiG6fd4/6EIfP//GUySQsNbT6DFNVKvw4RjpcUZFNH44Lc2
	 rGlAQ278z5+Xvk3jXuDtIPkLdltRpuatn2x3j51SOOEDN/q59PG/tu+nFN8PScaDSR5sK
	 LruV4M5IMMQIsUMCHyQKB2Tydlpo4WjB4u3mSuCRnxnTofLz3uggwixBt55JlEV0fcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=co466oFF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCEE606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DCEE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=co466oFF
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so6296283eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113760; cv=none;
        d=google.com; s=arc-20260327;
        b=F3KkWTkMqCDFSx9VINcqRF4UhqF74df9JdE+Lcb/WXVYRKDrSBE7FARVHR2+yLicMG
         FfPDB4y1Gz/xockdUfCtmN7ii6OpOmvSCD26g+D+ccthOkFtA2LIEM4vw8G2fmoXdpi+
         3eB7QGLbp2wN7bRE3TtxV7NaNSSd1AB9kgQyHJk+p06325VGKjZRmbw6GzXF4zsvOVBS
         dN45kQsPgzSJOw4DMTjwTITGWUEZMPgRWO78Cmm2mNXldKi5rjTMbIY15cPFwIt84/Fh
         uvK28bWpBu+qtGyn+3eRH7UGfBk/o7eoaSVayP0UDN/W7RaCsGmEUI6BDwC4vsI2uiIY
         +dMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        fh=ZJhtAQLVjQaCYnX0g2YmZKs4LIY7WZoPZJ3GaYynrFg=;
        b=o0aY6ywBxchM2kGFfL3SCP8C/kBWwQsdVeKLN3Fi5lnDP7ham3husmyY4wobv4lLR3
         iICGTJM9vOwCusZUTQ9OT86Df53Q/lhAVc5sD7LjWzxLmxpSZMNN164GZI68zqvGcwei
         C/YfHyqZwsb4c3XJLnDRNw5TfngT4CsjcrxN1PJm3hhy2nF7v+MIVc6MndhmRcqLZpDm
         JQ98Zvl+bPOIEBVrG4MWKJYUZde/XUjOJRkESp36WMVaVNvz7t4r3Y1AYgLDN9Ed6zJj
         W4W+5NGRtWmUhTipnn7ocBwy6sWCBmknlgwieFCayZCY1/+TDqfOEeTQgaxanjJ5LSNJ
         U2GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113760; x=1793718560; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=co466oFF1dhQmr2N8vEvSlNncCSXO6JbBOpXu3AWET4ZRArQ0r5TFsh3JtzIiCijJs
         xuVELQBeufrhTzCRwaLyL8IJ94XYqwLjwQ3N+cMEQtFXinnkOenaRTKVr8WkgE73/iUL
         gbZbuqionHz7tYdmAQP1py0nt116nJIadBvAhG6AzwmPkwVa6rXM7EM86B4eB8T/7V7g
         EQarfMCisspF/8XzNwrt4NZ8cAgg0yWxLsM82t7x18XK4CkIdCNTCRscDbHeWKY/iGJT
         gDPIv5zAgn3MCyG8o/2beygcMBwF9PfRJb1KNZIMoKB6X7pHl5zKVUfmZWYKrj7NMVAL
         aBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113760; x=1793718560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=dRIEuONpAHgGeI8FQTVIruDJRSqUx0D9G23g540wAhE89sTm3ldCDEYs/HxMEjpEys
         xhk9x1Zol0E0YWorILpVvGIkTaSmKS1l8Up3+FBKHuaiNeESaFzaLpERzJDzgCMOiVmE
         UADltECNei2GcKeuyZvO0RwC0ztRMUHREOL/bEElmnawkQ9tlTuWNDPnWwLl92W3ymUu
         jwcx7sz9lAoZwFVKBoBQEOhu/O2pCAWb7pQsEezu0KnEa4Ahn3rz84hKF6qQbMwPty/h
         BcLUZGjS9ezo3e8d7vz1C6pZWYOWm0TC925LGO1e4R82NyMXas2IcQtmuxChxsU9warp
         ffNw==
X-Forwarded-Encrypted: i=1; AKwUvBx+K+Z5bmT90W6EeilaWqx+VBwt8A7JkYE6x0DBmo4M4gJSqYSa3eIxt3Wf0FBi1/pq7D9eLS1F4dGGPYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjz2dLgh0N8Iv0KVftfkMe4vkfKnKFP2wJiInYEwCJar6sbXj4
	q3sALTpesLRtxZu8ZJo4z83iSnNWO5A/pF8H1kSbSXgXfKBtbSE1L28huJhKLjGTNBW2UG65Y3J
	/8qiaIR6mahBoKwdIw5WUzPdjlm7TzHo=
X-Gm-Gg: AYBFou24VG/S+MtF003EX6vVUofqvZkVjlGhyTZWXCwxprzUbi4cQYyRXBbVroD3P2K
	P3Efj/R8sZR2/gMrbWs/vFI5LhV3ZRWvyd4QPZHiuUCyCdv32rBa5JFW5ELxzmZoABzDRSJrEuZ
	0pZn2M4eJuNAsAi03t1FQ9zBbm3lDbgpSYSXe6x9QHk85WJOJ0erYSTxXSQ56RZqU/toA3yRwjT
	TRJc5dgMEMYH+jrJ/BPEKmCwDzc7ea/0/T66FUAVGEI1jI6TVArzjOOtMJE8rN1yBbM0ama05Mh
	4lKERqMbg9Y6ietmZ8xPeZQ469/Qa5KoyHkWXwpu5NN3jH0dtQh3GNbjgLi96zbkEVo5D7fJJah
	qQpYbuHM9hY/RpSX8j/YXEBTw3Y4pKUx7o9xUx6t5YmbYfJBcIN4T2ssJv7j4cl/6fuEe/txV6T
	EGdqSf92GHAnCHOHTrbhLXXyRald/sOS3VgFoee8JgarPkGKCIeD3slw==
X-Received: by 2002:a05:7300:e024:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a158f021emr2604437eec.6.1793113760079; Tue, 27 Oct 2026
 08:09:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261027124954.110697-10-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-10-zoone.rupert@gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 28 Oct 2026 00:09:08 +0900
X-Gm-Features: AclHuK8H6vSFxFswuEXecNS4oxgF2wzBLnY17J5ZgNNydJKg-55kp3rBfAwA1Kg
Message-ID: <CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>, 
	Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

I independently build-tested the full v4 series (1/9 through 9/9) on
top of jic23/iio.git testing at 7d80b4b383bc, using Clang 24.0.0git
with context analysis enabled and W=1.

Results:

  - x86_64 OSF: 5/5 translation units built, 0 warnings/errors.

  - ARM64 OSF: 5/5 translation units built, 0 warnings/errors.

  - x86_64 allmodconfig-based IIO: 723/723 selected translation units
built, 0 warnings/errors.

As a control, enabling context analysis with 9/9 alone reproduced 256
warnings and 2 errors. Applying the complete series eliminated these
diagnostics, including an OSF warning resolved by the conditional mode
claim annotation in 2/9.

Testing covered compilation and static context analysis only. Final
module linking, module loading and runtime/hardware testing were not
performed.

Tested-by: Jinseob Kim kimjinseob88@gmail.com
