Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024814;
	b=ha9snXO3DITPgHx1N2dv+k/ch0UEbOdPIx4g9f/8qwZLTbdsxGEzMWoY6NhzAugXwhSt
	 vG3Hf1nF6AIz+FV0LfXvGbE4qdf8JZxOWqt3IFweNXVLqLKOO4/Cs4V2wiBgAS6eId7kL
	 8/jSkMNsCY8zGLna6sMwgXQlvUcgS1jehRoFvEQ5gYLwgek0lVzD6Qki2ERM0LSm+nF7Y
	 bdBI9avtAOqFM8olZ17r4C9kXjyqq8cFtbTyibVs/xQYU20n7GaOyCjmMhladF32bS7qg
	 sEqq/TCPwmLB9xwkIEeI2Pq4kFr5amsILotOdhJ2W1b3uCfsLHb05mBgLZ5P/UZcgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NMA8b2FLsw89EHpRJHOM22y2TeL8WKaQgR/1AzfY5T4=;
	b=eWAg7GAjptuKXEui0oLq2zgiqZsYeXMh4dQ5m4rmPfh6ilRx8Qj6Jygf02gJ0Qt6zpe0
	 FKrGvf9ghce9ES7a7Lc/gqlr0awr6rjANFUsqonH0O8AuxQP4PD7IdEatz1W5N9YnYS/r
	 Su/QO+RyLdes9XHn1g8zbNHGo4/gIiH9TigSRTNNjxZDs3ObT98nDWTU+dfB77yz5JqnP
	 kJY/TjfBN5rQAH7PIS6KhjFN0LeLaqUb5h6A5Gh6lAENCimbBJB222GicrscGp3JuAY5X
	 BQJuF4wUTyQq0xvptHPnKBI3Ys9iw39JuDImo3FCp3Ah3lSGHTUrWVHEK01AYBXH1Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rttoZkvF;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879C606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7879C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rttoZkvF
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so2440091fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793024812; x=1793629612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMA8b2FLsw89EHpRJHOM22y2TeL8WKaQgR/1AzfY5T4=;
        b=rttoZkvFyzfEFvSMKW/6ag3jOjMW0V3y6KTZr1jNtBJhLZzaWWgZWLp6wSLZW2+nK/
         dmYwL2t7hh4HAX3TKw52QFVtE1exjV/0qHknx2qbi4f6+/D/JNCmpsUFgKkqrTcgqWQn
         lQMbMnLD0ycw4HKMA8i1tOeI4c7Djc81XbNWnMo48k0XKvaNfTDmlByJTmf+1VKE52fE
         NwuPkvM1xm+hxfiaVkKtPoiNNbJUHKYkASZ3EICfGrEcd5O+/q7fC2ZDGEjzlE4FHm1V
         u2ev/jxUvqYF4ChHXhJCT73UzQybdT3lYpNwGSCNvTZWrVQsscglxWQq1lAga8PLKLUR
         6dBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024812; x=1793629612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMA8b2FLsw89EHpRJHOM22y2TeL8WKaQgR/1AzfY5T4=;
        b=qvODFWxQpTrqTuN34N+6Dvc8Iadd7nNWaDdvgDxFK1+bLqgzVh1K7+ta++meOCNu9G
         DcbIDftRetkjgzB0VMJ5uJWSoBkcHuADuWV8bBuWyfrzico0q1gACj28zel4JpYuoLar
         AyVGynApbZEqIwuIIfUtXd5UDo3oQezZqV5ZGdSjHd27qloUS9lXqTZKMCa45M/MQlCo
         klfJNNKLs4BphNHJRo0r3fSVAFupQl7Vnr4pCMn+S00V7Inul1IUK+P5d2QcIVnQNbSH
         oAvtvccbVSCeFjK8Tu8Bzn1uzC1wDIWcO3yIgKB4AF+TKQ02OZfkeCDPDg5qmciePn/S
         atKw==
X-Forwarded-Encrypted: i=1; AKwUvBzKylEyQSTMF3044575jKKNEE1ZpnF9LMCZSAsOIlbbQKYEw9svE4AJuwl2WGCWQZGcn8+q38KYw8YFx6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa4LRc4AQhdhmNQxXq3fzt/cAtHZJBOD0m3aa0d66HvBNDDj+7
	aZonXojqttAxjUFOmJw6XRSOz2o3p+IPOz8SOYTcrj5jc6R2RShj6/A+upMBZ+0+6NtBULt1rX1
	bDzr8+dI9bg==
X-Gm-Gg: AYBFou3R6TG6Honk6tT7MGbWDoiOZZJStCzJGRmvYZeP1+r+qWLoTpFcnrsB7k0yjGt
	4ejJ/5LqEuTUAf8D5ZV0QYIglBZv1D+zQTOdvi1JHC9//0hjPUI97HX2KKtBXDDqP6dj9uUPw+o
	XDXTKXYIPuvCJSuLjnWPFYHJ9Gy6QfNjeeADoteemyPOwDr5qeZjJ6gLnG+6isB+dc65dIVy8+l
	tHmzpRsi4vVeTYGc8GPgEfSNmvk29ZSHGWfF9PUiYd77dbrjOHU9PgQs0yvtjBCmWgUjckY3B0P
	Iey8e1OPaMNH3k3GG8HIuNM3F3eSswAzhi96EPyQ3ee/IrR07eIoMKqUIORhRGUypVosNCOLNzO
	YHJbcP+z4VeTfGdm+O1gLpRi4b1bemfYW8YumpoeEQjKuAu3S8Q7lVgyOron0ntdzVoH1vceRCe
	dczg4nucmO/PXrV2yudeCoZ2QiNCooH0zkSXRKM+GMvuUs6r5d/gmcDcmP5SLIlEWwlFkPvg0Xb
	DIwK1FG+BUEkTwoZOStDp+s9+YAl93LPncQPxnRsRXm1Vwh3z7R+iRXxbtlChkOHHfo8CQG+RVL
	f521K/w+wBIQlvpA1JKIc6xhUFq7ZzDjjP2sHfhljHFwebqpPLnowaDvSxtNQpahsBflsxW/jw=
	=
X-Received: by 2002:a05:6512:230a:b0:5bf:b9ef:d033 with SMTP id 2adb3069b0e04-5bfb9efd289mr2016966e87.5.1793024811386;
        Mon, 26 Oct 2026 07:26:51 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm16400703f8f.4.2026.10.26.07.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:26:50 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] Input: synaptics-rmi4 - f12: pass Data1-relative size to process_objects
Date: Mon, 26 Oct 2026 15:26:46 +0100
Message-ID: <20261026142648.2567233-2-dmitry@kernelgen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026142648.2567233-1-dmitry@kernelgen.org>
References: <20261026142648.2567233-1-dmitry@kernelgen.org>
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

rmi_f12_process_objects() gets a pointer to Data1 and limits the number
of objects it parses by the size it is given, but rmi_f12_attention()
passes valid_bytes, which counts from the start of the F12 data packet
rather than from Data1. When Data1 is not the first data register,
the bound is too large by data1_offset bytes.

On the attention data path valid_bytes can be smaller than the full
packet, so objects may be parsed from beyond the bytes that were
actually received. Pass the number of valid bytes starting at Data1,
and skip object processing if Data1 was not received at all.

Fixes: 6d0dbeae71f0 ("Input: synaptics-rmi4 - handle incomplete input data")
Signed-off-by: Dmitry Mikushin <dmitry@kernelgen.org>
---
 drivers/input/rmi4/rmi_f12.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index 841884d967a3..34f24de34465 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -278,9 +278,9 @@ static irqreturn_t rmi_f12_attention(int irq, void *ctx)
 		}
 	}
 
-	if (f12->data1)
+	if (f12->data1 && valid_bytes > f12->data1_offset)
 		rmi_f12_process_objects(f12, &sensor->data_pkt[f12->data1_offset],
-					valid_bytes);
+					valid_bytes - f12->data1_offset);
 
 	input_mt_sync_frame(sensor->input);
 
-- 
2.56.0

