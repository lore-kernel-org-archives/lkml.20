Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817291;
	b=JKiFNsBtmXkAQAN6mNdWlytr79hY6Gl6u50Go2k421aZpSeweso9vq8dWj/mfmCQO5Ou
	 JKiPhTpVhY5yQglTqrMPQqjxfGm/df3p2wSkRxeVR0fpt93VEiGRqr8KmY6xlERU/Ua2W
	 6607gop6RYX/phkCA62N+UITR0oNU877AsbAfEDWRI/11Yf+Ud+Y6D/EFOgjhTKbpKa1t
	 kkxm/3tLffeNX1n3H4dbIOXGUI9qOVUcc8uSiZ5wUdnxzbPALEOFR+j6zXF0NFPYKXHjL
	 1hq7GFSdud2PEa4umaor6OSWBGPkdaoJn/zT4fRpmSnVUZUb8b7vVF0RrNd+BBU/kAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YPds6qHWCOYStiDKSkZJvhkMlbF1mlXK1Bt3SccenlA=;
	b=y1kTIz8tQnfNELJBpOKRLkD9W8nOPaXeRYtJ7UPSjL0TG3T3v+mNVjXG95ZYoaOdPWMj
	 JvjWx3L98VA8e+F+JeR9t0AqcWnyWYqVPbfbZBeCUFbjtaQ/bP2sQfZ0irVZ2rIIYkAaW
	 KlttMDuAvjieARtANxw2q52UoZmZW7Jaybc9O6sdGtdwyeVwUZ8gm6utZvLhDjNQUEt7y
	 8lJdeQLkWNeNmw7TU4eAEX1KkCHFC/VJLl2TLvsJgpD4mkeK0Qj+6h4syBDpCUUeE/o0C
	 jCBqb8ymGqprveh00Zm00wAs8ryOCA94SDmYS79JoYbQ5OktGjeNeW9U3pDuIM/CZJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWd8kYN6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C028606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C028606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWd8kYN6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so8567715e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817290; x=1794422090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPds6qHWCOYStiDKSkZJvhkMlbF1mlXK1Bt3SccenlA=;
        b=hWd8kYN6z1qn2F5WN38k3o5mVbFuhHYozUzcnvBmcFrqmo3qJKOJ6C06CayWmAD7mP
         Jm09XZwQV2T0Lt8FntYGjgoMCQQgUaW8P+JOxGL/vevv5lBQbC+QlMP/KZzMsPSJO4e0
         WWNIgbCCvbOJvtvTkRplJjwNSRZmsG8/mg1nhqiMuwKUNeRmcn+wkknqiZZ/Xd3OYinI
         Wuz6pzpIIcfaLIlxUJ0t8scSbWftP0EoPOtj+d0CMVLfb1V89VWPjCZHxYROBkbSOvhG
         a4+8x8rrOdJlYcE1oa1uoZzVzslmMmkd2ks3ZEkw27vY2z50HdMeCGvcpyRW35JuQEX4
         S3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817290; x=1794422090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPds6qHWCOYStiDKSkZJvhkMlbF1mlXK1Bt3SccenlA=;
        b=OsWGzjYbFHiDCnpaUF1nARxoHR281ksJZgZzqb+Lsi34dmb+UDd3IlWQPnYYJGKSmT
         C6910n+ZFC8caEkSgYmcIXVP+8RZmhytvhVyBn8PJUjYaTMH8y2djcPfg1DVWZPXsvGg
         pG8579vKAtxUJgA2YBi5lPP3T8im+bppo1f/XTvZTvOWnna2q2OgNBO3BBqZB6l0RUBk
         Ods1rwGUHGQ51LSX2Z1CMLwzQq6Ot3dRElFAT148vElXD5owqkpreZtAboB+CSj455VR
         wXtD2sGx5sso6/TfeIP3R16XPey+tfbDrTwlmNub76Xuom8fUd6Mh3cucGljf9E90I/p
         4xMA==
X-Forwarded-Encrypted: i=1; AKwUvBzptqdJPdqNkDFfSEMfTI15L7VpcJ6215FI6S52OfS4UP8wLx6MB5DAA/unWWTAJ/2VX8/MZJrZMHr1DQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sPHtcxRkEuz/P2ZIsSuNrl0EyldPfE4wOvn4OWjZbzXxYwJ21
	D5WLVTFsVXZ3DgfNJHANW0mA5fY2ABCzNuz0NA55NBwdimJyqZnvjXSj
X-Gm-Gg: AYBFou24G7qZD48FJhRM3sKMyEtjufFS3U/BBq95RNmZ3dNJync0jV2p9FA/BaxYviR
	eOy9x1YpWJVY4iAmVvAlDq1Y9LhlZ0xb9Lf6lG509CM8Ci2VtzlY5FhiEZAgNlVO2ODGRpPMgMw
	M7W1QaKjAE/uMT8dlErgNQpBmytYL1cP8BWUFRqlRkvF3FVmT2rQz36yct9kHbAmS4aR8amtQcr
	J6xK3k1P+3Qj4LOQde3vTdbKTa70XDxdEU6XBxANbSM/de12LBeYC12RYZy3FqurfS1sS9QZMdh
	KFaW63k0KpyIzpxY7WFl4oGHVf94uw4XJaKAkdEXWyPuHrqRufNS7HE38hSHvCR9SyW9YqX5J46
	RP4ntcPNOpzpYiDVIHbSFsH0mSr/65+vV1obiePS6u5Ey1BEPEu71HxtNVI8+ZCHMqZvTvfwSX0
	oS0EiAwFga0qXqkExDZbeOu5+g4ZoqqiqEHpboMMtAN7xf7kvnSC27gRp3HpLxqsIq+7SY5sN3x
	/ng2m0bFlxu4nB21GS+YN3AmhT2+mnuumC/x7p0iykSelZpjLi/bhEJZpUwg1xo93hDp55YHssj
	SkC2CxYn6i8EFgLQbatli9IHSkHTg7nBtLow8g==
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr403871945e9.3.1793817289631;
        Wed, 04 Nov 2026 10:34:49 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm31404915e9.3.2026.11.04.10.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:34:49 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 0/2] staging: iio: addac: adt7316: clean up header inclusions
Date: Wed,  4 Nov 2026 20:34:27 +0200
Message-ID: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series cleans up header inclusions in adt7316.c. Patch 1 sorts
the includes alphabetically. Patch 2 drops <linux/kernel.h> and
includes the headers the driver actually uses (IWYU), removing the
unused ones.

Changes in v4:
 - Moved the list of added/dropped headers out of the patch 2 commit
   message, as requested by Andy Shevchenko.
 - Added Reviewed-by from Joshua Crofts.

Changes in v3:
 - Split the series as suggested by Joshua Crofts: patch 1 only sorts
   the headers, patch 2 replaces kernel.h and adds/drops headers.

Changes in v2:
 - Split the original patch into a 2-patch series.

Abdelnasser Hussein (2):
  staging: iio: addac: adt7316: sort headers alphabetically
  staging: iio: addac: adt7316: replace kernel.h with explicit headers

 drivers/staging/iio/addac/adt7316.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.56.0

