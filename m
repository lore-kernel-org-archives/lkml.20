Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613640;
	b=Mpb7QRKZu7KGr5OpS5px3lc5RHSazGJNgc0w/JiXOxbQF77RLl35kqcGFdV6RYvS7PyB
	 5/mKYkLgep5jUYZX7Uy+dmDNYqyos6VwY9b8/SpVWCfeG4yyy9kaRDxhjJyOmZILo2S4a
	 2Bj4iA8kFUJqRLd0GQ3m5jxT/dSTZbIx6LgZVpwgDsx93W9aCxjzHhtTknR+NkhNVUA2r
	 Y4Ix4XsiwleWX2GZCTbzrOpyBR9A4MqhdJUX8QtCd+KKeoK79tYmRhRi/O8LTUytG61w2
	 u0ASeECCsKoJ5GDB0oHVPXsCjFg4v35wVOfmk2gba4QcE5TG0MPBQuGsmJhbc++dEKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM/UltC3mjiYHkIRq2InT6fJ2QKWGWxo5IzwL3zPAbQ=;
	b=Mxk4bEHpalZBGSx+K/l7vAwHZTYLESDoYwDBjgAzWAKH/uLEjF0DLSNGFGwn9FTt6ycL
	 c5hDdphvmUPD5/ELs54pMrJ/yix4StssGsWVECeHp2Wb5T2OJ+pL7i8wg8YIjmQ+hR+qA
	 5V8jJb87KA/f+Hwz5VyTfPiO0FOKKGxV9GHGmT7yCBGIQxULHgePyTg8LM6uSus5+z8It
	 SjMkmFSERXLDmkK+uCOa9Tzh2T0w2771tnt18hfd5xeI3QdZhG0sxAh+M7gGXJk6oBZcC
	 5eq1GlduzWvjWpks3l2rdCkD1uNLzjh53yc6VuIsY3XOQRZH5A4X32fYWp56cGcl6WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEbwZ6Wf;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE76606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE76606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEbwZ6Wf
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1723216a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793613639; x=1794218439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM/UltC3mjiYHkIRq2InT6fJ2QKWGWxo5IzwL3zPAbQ=;
        b=OEbwZ6WfYnx4BRWAPtRANX7r0R/S0dHZ5D+UbeaiWm1Z4OZbLHmYyDb2DBWoT7Y5Zm
         CmHr6hGYlKBkhCYLEumiLboip6cb4p+WUeAzLLxyYT1DB3NHmOytZPrmol+Oxr30QTT3
         wbYRvBMUwn56FK0+SX41PKkQ9VgqCYNa2oGdT72zZXRl8QD5I7uBHhN01t7d3Ci553DH
         fzozQ6LuHIKdfOYBNX6IoKbSfABxmrBctTiMV2dSrZAmBE5qzeYrqyY3S01T7ZA/bIbG
         oRS0wC0SzTGJzNsP+pf/xugzWLLvRIdOJvTo/gZkdaeqLsG+kTltwmsQyEF9CRBtXJcE
         dyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613639; x=1794218439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM/UltC3mjiYHkIRq2InT6fJ2QKWGWxo5IzwL3zPAbQ=;
        b=L+wCbwATQqxMZDgQJpPcmjqw8c++kNrt3Qc6FeQ/Sfuj9cuf9ZRvDejuUk3HLO7hS/
         8ERguaHHiJmAMA+mTojL927wNM5styoiBbwX3pWc72kzyxxUCSIKq2whkcEUyxk7Wgl3
         PhEI9qHyRQEkdyf+RyZZS8DoHN5KJx6TGVNPhYxI8JA7TF86OqUmIZVKgDmHt6kRFmSP
         CXdkq3VKugS6WKdSuICw+oKrMx+wD+U0nzeg5BgdDJ5sRmyfR5OA5F/dYBR4WQJ7RT6/
         PTVEgXHX1y0KI5wd0vrxkQ3uei89Ic2areg0s/Gx3Sq4iPKp1dqVf3cvEchLfvAR1IBS
         UL/w==
X-Forwarded-Encrypted: i=1; AKwUvBze8px0SsIlc4uuo0dUjkjHrtU7+X3ypL0rDIN8/XWiPVwz3nybNmlN6fcPplKlsM5g2E+kXlCGzQePy98=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F2Ad6Z79y3//BZxrvuZltMoNi3ss5Opmk2nuhQMc2jAZH3twa
	7jtr2lL83mYH5ZM00KEu2DUh/7/4DKf5r1O+AD4gyw92/UvwotQmWlcg
X-Gm-Gg: AYBFou3FMLhFQyurVkVLy5L5Tpcr5D8dvzbIcr1OgDFPXTzO0CKbL8If/0QNkMCpkJb
	ow8yjRBJKoGJ0ATt2cZ31k2aj8bk4JPpPPOZZOxXtrJ0S5axyHasu1xNYXf3O15stzvh5cWZPRJ
	ZBMc+gbgAX94DTr+K63zK+kR4JYWt48uX1uH8Wb8BSsYPr5FslHg4s0lDKa0xcyzF6M1pDGk45h
	/TYF1jDzReCZc5EKc2lpSPPJ8LEXz8xCMWW3LlMNANy8E/6No6oEz/Qbtv3974Q5JD35+v6ML2Q
	BScxQXIZxOSMsaK8Z6aWJOugIK7d4Z41wN71kGS7IS+gWNL1UsqbaU1F8+8iQ/UZBsfjV/qrNI4
	AxkZ8Px6zwDulHYKi9Uso70Je+df2w6lVKkgj5ItsoRRLCGyYMvPJQndif5b7rNOFvZppFVQjwN
	XlvzRFAk8xPVHrNx/yr7bWGQ4WmjuSkjxCbgJpUmshz0Wb/h6XTEKofEAb0QNdbc4cz8iIGdrpx
	aWUFtDGJOmQ/A+SmC+UQ1+Qq+MfFuUEgM+Sgg/COh/3z4lx+JifQfAKK1ALiwpDWQtoWBpiXGxm
	WPeDPohKllCXFExeU1e6UrNThIZjduUtkihMm71K0IOgvNJUJVDCOeGGeruiAc3JUK/Zl/jU3zy
	sNWFoKVwxz7y0f73/dYJugYeWHM34MyQLlY9qYC9ut9poXBaHY3y2KTS+X8HKqauFKw==
X-Received: by 2002:a17:90b:4f84:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3ae897ccd23mr7150902a91.20.1793613639055;
        Mon, 02 Nov 2026 02:00:39 -0800 (PST)
Received: from localhost.localdomain ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ecaf5sm13592447a91.16.2026.11.02.02.00.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 02:00:38 -0800 (PST)
From: phucduc.bui@gmail.com
To: wbg@kernel.org
Cc: andriy.shevchenko@intel.com,
	andy@kernel.org,
	dlechner@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m32285159@gmail.com,
	nuno.sa@analog.com,
	sozdayvek@gmail.com
Subject: Re: [PATCH v3] counter: ti-eqep: use devm for runtime PM to 
Date: Mon,  2 Nov 2026 17:00:31 +0700
Message-Id: <20261102100031.5573-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20260802125903.1425262-1-wbg@kernel.org>
References: <20260802125903.1425262-1-wbg@kernel.org>
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

Hi Stepan,

William pointed me to this thread after I sent a similar patch. It
looks like there has been no v4 since May. Are you still planning to
send one? If not, I'm happy to pick it up, keeping you as the author,
and address the comments from Andy and William.

Best regards,
Phuc
