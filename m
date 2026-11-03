Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746769;
	b=OKoBZn1pYBNRy5Lw7g3DynfSkYIoLKWSZyFBdfPcEbaIiseeBlOgENZJmAhK9+FZxBI6
	 2Me3hmUv52e8fW3JXgFEl3CUYjaOacuQROw4YRSl0R3hOBDcjIfgHzHXqxhRO9gamkg9f
	 bIHf5J9WroigDNRuJIPCHFUfB5WvK83CqoLTNdlCH2UIfxiKRmoAhJ8+H+bFZaXGbIBGn
	 4kLB/HH8HFC69fYMX38FoET2u7+XdeDSMEuW+myNNHq96t58nJRwumWX8ul0omQpmhuEf
	 TEenq7ZL/43PbFm7iIUE86RBOJJ4lEOdYi0AkDUkqGpITiXp0hRC6ae9SJvFDqRLuMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M4HWTp4evsaap0AfFKcKdMCCnVBz30GdJ6zIUdfmiDs=;
	b=VtMWJWSePnxSk0ptHWkEAcJgRDHlWHpxh0m8/hwGOVs7DKzSdIAkfiGAxqCMt+7teHmj
	 1zs7HGWiFwBhpV1gI2DUoaOVXnUK1rhC25Ib7wIsYk9N/3yIQcNhS7BDHiy9bLhx8njWh
	 jiO7j1j5yMTc1JTRSEmcVqA4cat8Rs+fIU1QLZf8NB6IyF6XYDaNJAOmvIpGRXF9eaCzA
	 OVgCi46W4v/n5QKf45aPPKWhdofNzzjMXGvVQyyoE+olmd2MTYLNhZ94IQMwCNHG9n474
	 9bosP0LYrqqPbZNggB9LIrrmjzykvhHWhrLEE+BQtiklW9CyzHQuvEnWZBR1BAZQkng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weS3T+lu;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105D2606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105D2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weS3T+lu
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so63935eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746768; x=1794351568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4HWTp4evsaap0AfFKcKdMCCnVBz30GdJ6zIUdfmiDs=;
        b=weS3T+lumGwZNXpPkdkHSE8Jo2JuhqQAzHhBPJmhkwd11KbkiRtZ5PdJSwY62ljLJR
         rtvR/GZ/aXISKffBOo+sYoXKMI0zQgHjDAcNKUhz8ys9lsqLaW5SBB0+atFrMcUqnAcp
         L9qEw6oNrHxrD5PyYRFmqHtQ43U5teRZ5R+WtH0W17l+njAFMJkK/O6YD3pKwdCaSnEM
         HI9jSQ/NbUtq5NMzldHrYtNPpv2O2Nwj/WO+mHtGI+e1Dn6rHF/MIYxj+TzKJ1M1ZzRm
         nSFJIQ3pV9w0X6PKyQzORfOrrvR4fn2t3qQrHYlKinGG3/pQf/FN6LTd7u7TLkkO/9Hn
         mzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746768; x=1794351568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4HWTp4evsaap0AfFKcKdMCCnVBz30GdJ6zIUdfmiDs=;
        b=y3fLk8/F+CxurbH3yHViizVS/98wpnf28QcCl1z/G5pltqqPt7/d5HfhOh62EFowaw
         cPOceVl508PCQI/NwpLtHZLeHk9SPhM8Ri2fTZBdxqld2pVtqrMlehUMemfh1nyb5AhW
         dq9fQ2cNVFim4PZBmBhaxlxD4sJBZDnn9oI7Dte6VpiMYZ1gOnqmOLAr4g9UcM5032df
         rVqZjjyeNv7epmO1h9jAVUZOHn/F7bTCmaN3d42tP9w9SPz+NwNlCKXCB2XR5tv4nAfU
         CkFsU4Oxhg2AOIJiwZB+wThn4JokHeEauc/E2QbKBYEDtlFU4yNrMXY+fUqObO2hJe6R
         GsNw==
X-Forwarded-Encrypted: i=1; AKwUvBzLfaadOiJy82puSspZJazxZOVamUSP3qbgjl8YJNAikqBolPYMPu6zKhwgyA3WMtBfvZrYvTl3A15ahYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ML/PoY6Yr2GD1Dh6NR7Xv2BN3+VcDLxA7ZODFXT3Df6eWiXH7
	VKvLX9RNAI954zbsN1G/vKwpswaBi7muIieIht+ZuLuUdIOktbLomQ4Q
X-Gm-Gg: AYBFou2acxbOdJ7nC5aqVw8haIFj0dfcv2POXnup33vmDo55PkRTcJSpNwZmgWAtj1O
	mFNUapElDMESmt+67qZSqRfCUkRwKsDooKWNCc2piZpvH5XA4CNoxad6J+S56ifJ6bIvrXVIX26
	GZ/IednV7Pqf4/M2H/UDlheqc6+sSLGLXeDfYNu8Hrf2lACnT8mZr2FZj4IhXeLSmh3eVxY1tNq
	Jpq6wfCJ7WhexggpKXMDvPrIODs96aBaFyGkNzqyN/qhP3lWJR940n5+nILKuoT08HPJmPPqMHG
	Q00Ofk6H1g0ugrOUihHExyGWK6BI72bByrqdOEaR7NHbqP6Sto/99Fx10E6+dqXp3bPQjBBGXrV
	J8iHXLUZNALfP9/vXHrsZCUtwZ4s6k1Ws//dP3mFkZpjCfyrVftLCi72KM09kTVvif9OJPJJqMM
	77BMO8xur7ZgJsOnjKCmlLCAQVM3bKrsQAmghYNlBiFrcemMiJMA0dnVryehv2XU7t11mS9KZOz
	F/oxoAXqVWjatNQEKsOfxbyc502M3zMxjwxmudg/3YnNcGLmgn026Kcxvs1u2EysrYr+TtGqwpR
	E29g58ps8/W3/v/nkv+jvqj02t1F0mm6hbfxLBobyFXWLI4jrCoev3cH8+YvtuS2WMJ+AtC5y+Q
	QoijdZyBYCQNqsQQu
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-36a42602aa1mr20317199eec.38.1793746767814;
        Tue, 03 Nov 2026 14:59:27 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm1187111eec.8.2026.11.03.14.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:59:27 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Input: stmfts - event parsing and coordinate reporting fixes
Date: Tue,  3 Nov 2026 14:58:40 -0800
Message-ID: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

This series addresses a few issues in the stmfts touchscreen driver's
event handling and coordinate reporting for both FTS4 and FTS5
controllers.

First, it updates the FIFO event parsing loops so that non-touch events
(such as controller-ready, status, user-report, or debug events) do not
abort processing of subsequent touch events already read in the same
FIFO batch. Next, it validates the 4-bit slot ID extracted from event
payloads against STMFTS_MAX_FINGERS before calling input_mt_slot().
Finally, it switches contact and hover coordinate reporting to use
touchscreen_report_pos() so that axis inversion and swapping properties
parsed by touchscreen_parse_properties() are respected.

Dmitry Torokhov (3):
  Input: stmfts - do not abort event parsing on non-touch events
  Input: stmfts - validate slot ID in touch events
  Input: stmfts - use touchscreen_report_pos() for coordinates

 drivers/input/touchscreen/stmfts.c | 49 ++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

