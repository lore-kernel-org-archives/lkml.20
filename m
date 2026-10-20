Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540314;
	b=ZBfHvdhukU62XKUMy5cVD3zibiFOrbYCxUnUoL1toTDYdDmfvpm6TPKMmmf1AYTQKL0B
	 9H+/dLh/PLI2R7pLtrYvZjYJWx4AxcHGScLGT73+PTXH3CD40uPQ4SY9v11qpFMHE4GfG
	 3N0RYh5JGk0O5+SHPbf0MdLeN5dGEusOQiEJVHVGl2xjFjcaGJ2n/HQBgpinmT3zSdacq
	 sEoywz0drRwxBBfK/CUW64qa4i+5SvIcYRomTQepuwar6yPkZ8rQ/rVwLY+/z2kOEh0Ik
	 D2E6xJkft7hRsA7rz4fCFH8eGb8NpxF65TgipyZKFLbWZigQyeCTxB/2MVVSnLpYeFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sQ6YtacrcEZTPzjvVqKOtkJRuXcO/fhIADs6l2y4Fac=;
	b=DyvGYbCt4fzyDDX2R+yj53mvxLEpLWG0+dQvosMinDYHC+lijFE1s2dBy3hglP4VWYa+
	 sZAROh5sS5VG6hA/Q1HssrwOMmLk6TzOQdw7A/l1BAypjXHpJAnMYSP6JmmuWpoDIJX+Z
	 +PNIbuH+rK6N2xl2HBwLcRBzyGxHv474b5nHaCi6d+UmeG1KR+2QGGjQFb39h19DqEEKW
	 wCgvBm8d3W1NcETBbXanR+fOjiSgOsmg2YtOeJDCuCd10SfNH9cFd3u3SMYSWNLc56Bo+
	 awAPRDetTi2hbRwCNbAiqV+2sglmXHd4cSmft9cQlo5jn6m9+w6kqpG+ZBspHDOHwhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CTdOmQui;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B846606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B846606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CTdOmQui
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eab93a9862so33419e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540313; x=1793145113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQ6YtacrcEZTPzjvVqKOtkJRuXcO/fhIADs6l2y4Fac=;
        b=CTdOmQuiGopiCVVZU2MXAfnJLOAkcaeanDVdc5DVwX+6/fPmDXpwG3gn6X42u5XmQS
         LG+wy6vJrje5P3QXZ6elP1JnFcPbLHjQE94pZ374Aoc1Sm/14LNxX1ogGMncvkZEUrS2
         OPUtppOP+gu1o1vd3xZ7tpPyWMJ9T37Cmh4T52i2X2YR4HXhcfZ3gXxk/excWpw3/O2E
         mLVMInPKNtEIedCSWEKGwzxO/w6n3iO0iQhmlENYr+Y5t/kmppM5UadXx6DQAlQmdT4h
         /xXBZmNMXju8fV3kxnNtrSYPyubSmxHguCbEalE1Cxq958Vnq7fZ+sm1Xyoz8/4mE2e6
         iYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540313; x=1793145113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQ6YtacrcEZTPzjvVqKOtkJRuXcO/fhIADs6l2y4Fac=;
        b=ZlAstoFiQl1uM0H0Y+hb6fAa31BGxeMbBxSUcI+l1mK6b1cyS442q1ZkgFUNm0jedI
         jmIUCLKJCJO2IB6MMYy9zxx/DD8+K3cBlWguNc6A1QFZnKNgGeyfQ2XlRJm/eHNntAQ4
         /k7S+I9Zt7/2Z3o66XYnpWqyPDGQjjQFGNjaL7dTBHj0K5moy2S4yToWmq61ppNdDDaq
         ckuExsizHnWOoMJjcXKYpdlqoEzoOQ4bc5Bw58I4aal4l6nCIUTQQ43ZbO4vEEaQJcZq
         k3vch254Dnd2P8af2Ja39WEHM1Qi/3Abc506j3BOKg9soPBZFX7cuRAECvLiaFab85YE
         r2gQ==
X-Gm-Message-State: AFq9FYLWD9GDep+Kvvvro9reWqYvlg7RQ9+wnsO7lvoJvkt2qbvqe7tN
	1sSqhBn4WUqChSHVE4nUM3FgNEhJrb6WhWjFlRpC+DSOIpftRM0y3eVg
X-Gm-Gg: AYBFou2X0DTEQ2/7srnKyPe4FyBD+JJGQFyQS32UIoK7LbiRrXr0kGxPbf00+PvYyd9
	Hk0BK36+O+KrHMX75eynpPglK8OKtLBweYqk/ZmGmEySp8dYPXJw7GEKFDh//zlVg3h7xCOd0TM
	LYrBTfbaIC6yzF2syD9JRqIFWbyFoD4BE030EwRgRVjjzyLW6LzfYnuG6DM/jh+trzyCzI9y4/V
	+xuUuvzdH4808RKwoM8npjrUVPHi3JMP9rarR0FHabObKvtMTaUb8wfj5gbW4W86snS5Zh71JNt
	KlQ0pyVItiO92L5q4y/3RZz6bwASUgzPPXymFFkcRNQVE4KGTPKThXKR4fK8tC4gQOXcyLTuWEb
	gftNzcL2DBL+umbpeBpzHbFvLlvYLLJ21nXC3bn0Ozh0j/BP+Mh4xsaohq7gm8zUZpl5p/xXmw4
	4VBnXOIbYKHfZXCFLGpyrD9bre7NvrjzW2w4xAM6hV5E7XPDf1BubNBUjhv2bDLb6E7mhPAsMMc
	qoCucdWcrc+o/pRw2KPIUBGpkJtjPGJfqDZ5rWphvvPnEoP
X-Received: by 2002:a05:6122:861c:b0:5e9:76c4:cf19 with SMTP id 71dfb90a1353d-5eaebdb1a48mr128021e0c.8.1792540312939;
        Tue, 20 Oct 2026 16:51:52 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm1172772e0c.16.2026.10.20.16.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:51:52 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	TuteMthCD <matias.civadda2342001@gmail.com>
Subject: [PATCH v3 1/2] platform/x86: bitland-mifs-wmi: Fix response payload copy size
Date: Tue, 20 Oct 2026 20:49:26 -0300
Message-ID: <20261020234927.121570-2-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
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

sizeof(*output->data) copies only one byte, leaving the rest
uninitialized. Use sizeof(output->data) to copy the full 28-byte
response payload.

Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 44b16b7b4034..522b38e9755e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -265,7 +265,7 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	if (output) {
 		output->return_code = return_code;
 		output->function = function;
-		memcpy(output->data, payload_data, sizeof(*output->data));
+		memcpy(output->data, payload_data, sizeof(output->data));
 	}
 
 	return 0;
-- 
2.56.0

