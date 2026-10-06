Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF60537AA97
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262472; cv=none; b=NsKJoSqdfIEr5/C1OKhNwFR3Q6Sbg5vbK5QcDAO3qSxSx9N4+Al9GP5Lryia1Juq+/3zSOLAj4wrASbIRMF+6JpK/kXHUsUDT4tmE3YUOIU8DMq/eustAYEDHMLLIr5/UYSXKDbJl+7rx0rAVpHBWunKcre6h7ZlyU9mZuZgCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262472; c=relaxed/simple;
	bh=st4dtKolWBUXgeyf3H36mB4fMu+aQ/9skKTQlwMh940=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ri51UCnDEHhSE3+xdrTWmANGloUL2CDQCYn/cw5DXKqnJGJdt7MEN4A5Kom9uxPlRO/1xhE5dhFMR9ySZZJRPnEKzTaiwDcBOO7EHhHlT5LaNBkXU3nv9WIoVvM62z0FC6w91MpyRmPo8S3V5ffaKf24E3EDC1nZOppraGAq4XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwTcKKRv; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwTcKKRv"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso52968eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262470; x=1791867270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1STebYYWN/Tm/3PMY6fG9dk0bK7CpzsFE061Yg4uRk=;
        b=VwTcKKRvaJZuRLk4FqYL6fDrLokTkJcGKs/t7bzLx8zDLoenETKpPogrh5z8VoFC0m
         jLKtV7kkTpUewZmEmMjRFcJFbuaeTKwZflvoP8PgLtiN0FdcZyFWceIVkwbd3i6gXBNU
         37KfbI/cE+yBcLIzera1bi2jJfJcmrmM5NalvGkI3sW3x1cS34crHshqPZnvsn/enAVA
         DdWSUCbTu5ZWBXcO27z1fSAY/9W3F8t/l1pMKWCeLaPX2ltHlhW9j14HLqJ8+N14RnyH
         67jVIABfzaO6k9GNfewcvdZAjTG1wdZdzgL157tayDtJeDfchcAFqdUymbV97KF/8fQw
         AVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262470; x=1791867270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1STebYYWN/Tm/3PMY6fG9dk0bK7CpzsFE061Yg4uRk=;
        b=w8lq8XbWwddlS0ExSMiwj+sWvG2c7N3ZDDjH+aUtCOnl7wfGCGulv3jyi9eHQnJ9q6
         aPCQCOyXWFQ1uOIu9LNKkiE7k4cmRcfXgZSwTsrYxuMY2QmqgyLWXZdrqYFXrVnh2Izq
         crSWLZAbWz1eeUWHVrX+/sz3iffdJgXoKyD3WE33/gIcSFKAnhJyr5G7zcEejQRuezWx
         6tH7X0Sh+vWOzdXQz/hJpj8Y2HJCn6et0DoRiZx3OI50cbtWJf/Rt1LWLfvMHoFxZ81t
         GL1xaeMGPXxlHiyGzryPovq9hrR4vxrRRbcnnUfCjcjUp2ZwWbvFAzi7OEv99po5Cyv5
         gRug==
X-Forwarded-Encrypted: i=1; AKwUvBxrJ9nR2pCVLfPRrPA+p5WuimnO7wqvAGN1WYU/MpydZhKeCcXxkTDqcpvmalx6NvYqHiMPnqVfthO7V7k=@vger.kernel.org
X-Gm-Message-State: AFuF++n+QvZwm44I+/faJNEk2rELn+5sKLHQh83l/sxFydgMzc3cCgEj
	frELqv5lcbBfsEzAK/fHgHpqsud1oQ4kKRlQ+gVUpHfKBfvpimyNHhXw9Tf214hh
X-Gm-Gg: AYBFou1oJoBxnsZQZSYc8oVu0aBsZ3pQoki/fSVMa5oWLwrN3u5tQKzOeRmcPe43FBD
	B/lk+k4mGVoK7RYporTppuwWjuRRJoTjAK0AzCRxezPumuW6fGIAMsVMb5s7IQJMJKbE77fOQXj
	Bqq3ZZPByHQrMBW5F9zsGu8D6Y398yAWnCkAz3MboToz4wC3R65Z7wajsW//PqqntsRLbujRL5q
	jhffXKns7ycizp9/vw9yq6NETXkMgEft1xpayJ0uAis/edDFoIlbz77wqFMJ+8C3kEkF1EOfBs7
	cfLsorDBLxc5AYB7sz94K4E5yve4e2bS/IjVaQcTSP5RlWdYdUMi6m00DKSyi2U7OtXfHEN31K4
	wfPnMGAJsTeRDX9atMwDMdTvCNXnVCeV6N+nOSlQpooQ5mscDKWsl6ccZZfBuatE4XDhnZd6VXF
	v3QNG9wjHkh0pQE+F5JEYNldIJzflRRG6xCTej6THkEdQfN4TJYe8wafFPJUUMSAua0ZL4c7cJL
	jQY3BRy8BMPmG9326RP9tTb1dsqi0v8MoxVU8+9R0BEVjLQTB0jxYTL8Opu3RtuGAZp5EKR8Ivt
	LtuOf0ouNghghrezTQx04AmpEc4kCg==
X-Received: by 2002:a05:7301:b08:b0:346:d790:9e10 with SMTP id 5a478bee46e88-3514e30cb1dmr236401eec.39.1791262469540;
        Mon, 05 Oct 2026 21:54:29 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b3b5aesm5539737eec.29.2026.10.05.21.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:54:28 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sean Nyekjaer <sean@geanix.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 1/2] iio: imu: inv_icm42600: drop stale vdd_supply kernel-doc
Date: Tue,  6 Oct 2026 10:24:03 +0530
Message-ID: <20261006045413.14320-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006045413.14320-1-kapoorarnav43@gmail.com>
References: <20261006045413.14320-1-kapoorarnav43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdd_supply member was removed from struct inv_icm42600_state when
the driver switched to devm_regulator_get_enable() for the VDD
regulator, but its kernel-doc entry was left behind. This triggers a
W=1 warning:

  Warning: drivers/iio/imu/inv_icm42600/inv_icm42600.h:186 Excess struct
  member 'vdd_supply' description in 'inv_icm42600_state'

Drop the stale line.

Fixes: 9fd569aa3d70 ("iio: imu: inv_icm42600: Use devm_regulator_get_enable() for vdd regulator")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/imu/inv_icm42600/inv_icm42600.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600.h b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
index e56943931b6a..3737e79dbcc1 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600.h
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
@@ -151,7 +151,6 @@ struct inv_icm42600_apex {
  *  @chip:		chip identifier.
  *  @name:		chip name.
  *  @map:		regmap pointer.
- *  @vdd_supply:	VDD voltage regulator for the chip.
  *  @vddio_supply:	I/O voltage regulator for the chip.
  *  @irq:		chip irq, required to enable/disable and set wakeup
  *  @orientation:	sensor chip orientation relative to main hardware.
-- 
2.53.0

