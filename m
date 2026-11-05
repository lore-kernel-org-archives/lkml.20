Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850629;
	b=2wYJpPTNHYL90YWOXTB5pI0JiurKRkw6YCoM2IxcjgySZY0v5ivqcruVkIsfiCGTiqtE
	 Z19v8PZ8ttRsWiLVnArq1qtCxgmGEUE3DQ+mhXB3JGJ4K+bEjohfBSkycysN/3vK0QNE0
	 F4kqPRAKXmtGXdsrLVaMJtWGJ0YTBkepkQTBYccpOFkulaIORDTjb51jyI32jJNTa2GB7
	 ZuzMQmlJgOK+fEchzlRdNKMVt/LwAI1aBr4htvci5bcf35aCls6vMiEUT0K6mdSN6tfTb
	 ePS04eBGKVG2EH5sTTH1G4NpjWV5MN2IRDgd796e52i47rqTrrCyDc5CBoD/EGItBtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
	b=4Jg2av32PM7pxyRL/QcAJWbzFS+2oIu8dnN5Zi/XPsj1l5487tnaIZFrzfKwNFDcNqov
	 2i2B2ekNDUPDDV0dLQSraVi3fkrKMIBtNG3JaNbI2STEYpSwos8+89HXBJQQtFQkozVza
	 /a8JTHkRvZsFjMpZozUr0wvyTAZrO07dLcmH3K3HRt+W1yqPiM0jwLVC3vbHFTZ+BPTex
	 Z0XohPttzXjxYHdQPCtOu9edlpClzVulz5MSj5QyyeJ0LrPPnVP/NIwvTMMcFLtSIUEF4
	 nKDCufs6cY/9s3HQcAKALqQ5H++RtGJ3LdsX5yDBYQVopQOUEWEoL/5IBNIhyl5AUyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=XhTSqVuP;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2263606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2263606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=XhTSqVuP
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e60f9af6e6so14165645ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793850628; x=1794455428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=XhTSqVuP6b7wmG3fCST5e6yEpNUMui+C4gZ9yAqbx7VgdY58JLigd2gj0n8nc7+lh1
         obKGkywYM8Csp3aZbaf3JSSaAkvnAVN0hz5BTpMZtpvn9pc6P+8Luft6bldOCd6DLsVl
         OWJo2PYnmY4AfyreJbgw5mjLOAwRWtlKIEQ/63GY13wRDUR4P1emC0L9V+ahc2kngu5F
         9GuPDIzqKzW426v9ZYrN/wiGxpzOvDKFMO6UduJocp/En34Q+d1Oyr9jBgPiEwHCzw4R
         0i99Wc5zlMx9mLPR0YHTKsAxU5rnZmagkUs5y/V9d/5Px7pdwABSYs09fMCVH73uW7rG
         SNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850628; x=1794455428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=xy9kDp4te8qt87+6tKiIwudUCQL+Yu7k+Cazxqoby0TkNdiJpHbZYa8wbh8RqHh8V9
         Wn9wnGuTpMqj5yUEInJ1yEYu4W2dx6LpkORcG8gPaI+PGNcKYikQyaJiObV8QO9ieNLj
         FfpktmDs74i4bRDNt41Ic/lM5KzXwxEIh0CcU3hxKRw6GUBk61LpfZwKCUZaZY1BWw7T
         obAQChDBgGt+A8qfw8G0oHmjAWtJpx7wJ502xV6JDVTfqCvYCsIaNgqLmynRkKs5FYp2
         l949EHQKzTEQuVgP3M2b+s33d7V6vQVfx7eXPgKv1+UE175pzSE14WT+zu00NS9kQhZy
         QY+w==
X-Forwarded-Encrypted: i=1; AKwUvBw6urXWvdR+58pZKhjfR9gbXavAPpKxQ8PpB4A6ZKTzx6s1Md6fIVl3tdEzuyqKe2hVQdDbrCNtXEi5PgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ok4i6Qsja1tz/YzU1N7ChDJYLwS9AIYMqq3W86cPzrQgegTZJ
	bYDsgmiSm3xlwP50INvqQK2SakZ8vjLScXnjGBYLK10e+ExO8Ukbm46880NLiyOafCg=
X-Gm-Gg: AYBFou3+bhvlmsSWdfXAz4HlkE+iRyEJ0juETN656vpuoENQ0BsYBdMn7rkFWtsBMpV
	EMMfAFIt838fbCelnSpWqCqe4nVpqfvRkoRqZ5m9Z9vhcD2pXEkJ6d0n7we3F/phAfhLq0Q3O5f
	JyqIVgmnVIUtc9BMPgtoseCgimmImtrdo2TXoxHk06brLDulqHplae1tM8IZ7mU5njJgVbq17L3
	jwBqkDXGUO4kd+LH6vdAfajvTkvc7P3nsoPrdIbs6ofsz3mBbfTbIPbzsJtqFbY5f9LpYn4hsv0
	bN34yHVDRrXpobS2ysMpX0194VHaCuLOwYe5vTPCgPOtok/HKolfX+RXi2+OJFbA/bA+xaV8Doo
	oPezJq3p+HFww0z4Ksg/5wrwgBtsC0+YlDyIX1I0AACDeIlmzRZzZ/g5lKxnHChMYYRIke6dgSA
	LgCapNvLGr0eTeJzYuLdyJ36fVUdSnbxH5ZDFtywek4tr0OIrDoczhBkGIAaZhkCylBKoC1bIQo
	I2C7NnsoVjBEhFh1kalIuWHAi1cxCSkaSRomXgkpXCm7JPlM7U58Pus0U/T2EMEZw/O02YmpLj+
	GI3HaswgFuj42/iy7aAthQM=
X-Received: by 2002:a17:902:ec85:b0:2e9:a23b:643d with SMTP id d9443c01a7336-2eb364d253fmr159592395ad.35.1793850628135;
        Wed, 04 Nov 2026 19:50:28 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127d9fsm12557955ad.51.2026.11.04.19.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:50:27 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: ilitek, ili9488: add the PocketGo S30 panel
Date: Wed,  4 Nov 2026 19:50:25 -0800
Message-ID: <20261105035025.25540-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-4-romain.tisserand@gmail.com>
References: <20261103110524.2812831-4-romain.tisserand@gmail.com>
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

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
